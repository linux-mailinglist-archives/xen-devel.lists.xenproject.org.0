Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9304612088
	for <lists+xen-devel@lfdr.de>; Sat, 29 Oct 2022 07:24:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.432268.685047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooeJF-00043p-KK; Sat, 29 Oct 2022 05:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432268.685047; Sat, 29 Oct 2022 05:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooeJF-00041l-HO; Sat, 29 Oct 2022 05:23:05 +0000
Received: by outflank-mailman (input) for mailman id 432268;
 Sat, 29 Oct 2022 05:23:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wSGY=26=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ooeJE-00041f-1b
 for xen-devel@lists.xenproject.org; Sat, 29 Oct 2022 05:23:04 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0c0abe2-5749-11ed-8fd0-01056ac49cbb;
 Sat, 29 Oct 2022 07:23:00 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by SA1PR12MB7150.namprd12.prod.outlook.com (2603:10b6:806:2b4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Sat, 29 Oct
 2022 05:22:54 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::6d54:a77f:86e0:6814]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::6d54:a77f:86e0:6814%7]) with mapi id 15.20.5769.016; Sat, 29 Oct 2022
 05:22:54 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: c0c0abe2-5749-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAMV7lG9djXXt6P58EKuBL3cZm/5wOcfLmWfx3cDgfQIEbOsxbnbMkZLUOJu/eIKYIDhVCBdHHcI9gU6sNDBwGFqL1j62qTS6Xrjc1VTkZa0IYEjqo7FZF6lDKvvEXb2kBPLfSDRXigB5RhhKitcBv1jQbjhPt+bdPgSCYbOaWqOTlNfqrabEO4NLcRXbT6DpNn/AUVKreleYcI1ChGs4eDSOo+lEmEawvau0/N8jao0h2PHjHjhYigunWTylO3oN99XwmrxLytA1YYVKB+SQvZaKsNCYKcbdx07VJimLkxkXQ5EVoSXKLVKYJuPgPyCnDlBKp1vtxDoqsQGC/UZ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTMvdiXwLxmjhJzVVraDj1PpAmt+aoThnAtb5PeZJO8=;
 b=gnNXgL6+2ThrYGGBgJ1Uipjr1Fj65Q52L3EY/hudOW+UXjb7yaptohzj7lCHCLy1YwKdlbd0fRmN0nbyaVXg7tuyginE5/mmOdZ+O83mhOO7vyyJOBmgBYNMgTSsZf7dRwpDtydHJOz+Mm4ITojw9ik6sTgU9lJ3RfzwjGqtHEc+MyqiCrjUtHmfRUNapUGAPLiZi/mAqdyVxanVPrdkRBfdMyuthR+hA+fWVGbn6QNZP1qyCVQENdu01Z5EbSwH9+2468kLHXOUGtq6mzIiwnMSxifAnKcOk9bN6OLlD8Xdn3TLB35XVtvz/HK6Pc71G8ApVrdXKR7VCc95dx7a8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTMvdiXwLxmjhJzVVraDj1PpAmt+aoThnAtb5PeZJO8=;
 b=DpmnbsAm/o3fTNZxuZvKsqXnDxZt9JEEO8aNY9z/PDdr/yic+3FcIttMYhCYiS/nvK18zlCmqXVZpqVvzuDWldKv6fOfVTqhwTfUbjoTeY06L3vd2Ck4YL9NjTXdJ73W7MofNAcV6+RmuV/EHUlElln57UhDeB1YbFWbhQ39hoI=
From: "Garhwal, Vikram" <vikram.garhwal@amd.com>
To: =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Stabellini, Stefano"
	<stefano.stabellini@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 09/12] accel/xen/xen-all: export
 xenstore_record_dm_state
Thread-Topic: [PATCH v1 09/12] accel/xen/xen-all: export
 xenstore_record_dm_state
Thread-Index: AQHY4FQy+XJKg8lN/EicOL7R8b0Vta4iCG0AgALhTuE=
Date: Sat, 29 Oct 2022 05:22:54 +0000
Message-ID:
 <MW3PR12MB44094F971904ED24E1AC67939F359@MW3PR12MB4409.namprd12.prod.outlook.com>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-10-vikram.garhwal@amd.com> <87pmed1uww.fsf@linaro.org>
In-Reply-To: <87pmed1uww.fsf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR12MB4409:EE_|SA1PR12MB7150:EE_
x-ms-office365-filtering-correlation-id: 1ca9f194-1c7a-4b82-4eaf-08dab96da201
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 VZHnjk5F+F1PLWRzJWmaDLmcNbCALkUmZKwK4Zt4MO+c9CgelOQ7y6fmtdLCW4frerXryXnb95ntiLMFmxXIaYs+H8Wkk343lbJ2PNghI3q6bjOhOPSHUZH5jW63jae0uNBAaR7qhUyErt89UiMDqWwgJntjYez2az6UKyQAccwdOXielq8u+jWYnQqtJEcWkltFzH490y17vJvGGTlWUkPQ/uzVVhtHU66Yy1mLNyiTL8VJKTQc1tsrtPWgqvHrunsWtrx7rDOEE9ihyZarNXDl8hrm6yyrwNik8U0UKV0oGW6h22DIzpuaBe+685lAjtmL5zbaCi++ji0mlEEJz5GnPsedKetUluwZ+4nUTrrY+nnLx3oaGlavs7A1VPhHoK7IZpfYN6qjhFkCDXzH1jnsQmYWIfc7oW9a/PCzQVOfexdAO7wvOAVwZDtwPeQYYJbVeeG/eeBqQZsgFxalb6iZ3hWLNL8NvRoG0yiU0wyNMyierLUFNmhlDtqwGA2ZdwLU+y9JBuuUzhBo85H4qKqWgDP9+XGOh/v4Jr1pa2SPkSbn27jQNXJh+LMosDsumUae7IWEVABh2/RKQyIeKVmL+L5hMYJIZKShYfGwMYFA2NPA0RPZTREGcrFkoVCwOGq46Fmy0bUTnnUPsEUiUIWbS1oZ5sJp6hs101HX5DVXyAr18VS/PDOqhrqtZcXXIBdmwrSybqDFCV9D9Ej2jA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199015)(33656002)(86362001)(122000001)(38100700002)(38070700005)(166002)(2906002)(83380400001)(55016003)(478600001)(7696005)(26005)(53546011)(6506007)(9686003)(186003)(66574015)(71200400001)(966005)(54906003)(6916009)(316002)(66446008)(64756008)(4326008)(8936002)(66476007)(76116006)(66556008)(66946007)(8676002)(5660300002)(41300700001)(91956017)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?X8OAVxtThGquSL5jx1rBcbUg83SHHr3CaQ3c833OoX6P1AiPL6upf0Erza?=
 =?iso-8859-1?Q?LLLpsC//NZpV23ijTF8mfAMWbXGZ1sZ47fumHyHCMpCY8nD5M0qrdY3P8x?=
 =?iso-8859-1?Q?J1Wqf2mDDI5vM6y6ZHyogz3EJwWYrsjUo2cYRteMSU0DWLe92UaN07tHNf?=
 =?iso-8859-1?Q?YVOise+DOTpuR4cPSDT0T1gLHMChVJZjZzhwgDfnNPrQoLFr6lHbIb7flz?=
 =?iso-8859-1?Q?A9oSNzEobryv/1IHM9R3qyiG7gVqLF1jUc6Fz4qHGnnZuRhr3cIEI20OLx?=
 =?iso-8859-1?Q?BxV53qNGKYa1poal6U9p/qjXjEmOWWK2Ejvk1BYKzOuGjMeeL2w84O5G1o?=
 =?iso-8859-1?Q?M/OybM0NRB2EENL3eR8U2UzN1b1aA6B04I+vR67D2NW8PzGY+Ccz2ZssoX?=
 =?iso-8859-1?Q?0zKQ84Jn62531XalEKKC7DIT2DruXd8MbQHEhz//6UF0iZyfOGPFyEGDxc?=
 =?iso-8859-1?Q?pJIbuLJgAqE0p3yoRFYTJNdSmNlyZ9B3GAxnhw2oTx/aomG/b6kD/4pvtP?=
 =?iso-8859-1?Q?33EDjdC2jfTp1WD381+X7dBrAb6+wNFbY5we61eIJhDkEc/DSKuXMT4UMs?=
 =?iso-8859-1?Q?OAQLiqM2+wiaYmhIx3qrYXXUt4kHfip7XccCAcVzfVssIaYkVzq8wm5Lho?=
 =?iso-8859-1?Q?a9ldYG0uh6H/1GZxrp62rCQng/N3X3OckqO1ej9aG7TRu/XFHoc1uYIpH1?=
 =?iso-8859-1?Q?C85uBtmoThIZxQOcT9OTJwQ/fBxxvkXwN5zCuDMrANpDHbQF5T63gIoTQn?=
 =?iso-8859-1?Q?F91ZmYE6Awwc2e/OKJun+3O58xE6qTLZg61spuaxwvnBGUnam/B9QUTxaQ?=
 =?iso-8859-1?Q?MV92YBMLEW/BBVAu0BzPBs2Jgjo+1ZXNlBkQrgLgKudvwaoZQJMu675hvC?=
 =?iso-8859-1?Q?wnWDsK2/jywTwQ8imIzGMU9rz66+j9SsAJhpWZyN9fMsTUttzwvwDTa2ls?=
 =?iso-8859-1?Q?oT9ZfVYA1eWPj5b5V2D0zhvin/ovpbIx2XO7on8Hlr8P8c+B0RJrWmbnv8?=
 =?iso-8859-1?Q?HmdlTFZ68KLKl+hS683h55ZmPC2gnuNC2W1SOF14rQLarbxPRuxKmiAuWe?=
 =?iso-8859-1?Q?VZBu7jlgAswq7xKaaFTUTt9WQ9BGfGWeGzfEcGI1N3MfJG+TBgLvrY4MYk?=
 =?iso-8859-1?Q?0WSUemzUaS3z2Nd/FGXvMxzo+US7iy7MEjtjMFeCwXl2mdHIyHsjLYzi3/?=
 =?iso-8859-1?Q?KVWfyOg4ieJPmz5AtQ4uOfU2AwzOhw7fl/gQLdDBeUwDiGy45lGxWjQXFs?=
 =?iso-8859-1?Q?phFWAXOr0Gw2RsWmaGyiPUYuuTnZNJ9YttHd5d4TbYsh1MsUP+qGUeCqMi?=
 =?iso-8859-1?Q?oT3Sh7Te7Ey/zhEjMFoOoVWTaUnXU4OQmu80JHJVB4Q2m5ltOM3tF1YJQJ?=
 =?iso-8859-1?Q?9hqB0pAdW51Xfg1w9JmYUX8kosDydlP6GSk7Dtg7KWU8P5a1n4V3/cj+YS?=
 =?iso-8859-1?Q?B5Cugk9i89YeGr8xkRQmRsCN1/d6q0hoSpwjZLFV1SLvlHDjkhA/LYz6w+?=
 =?iso-8859-1?Q?MN2DuxaaF//6aVBQprogVKZ48LlgF3SCK2lFG5dSNgOzm+mX093ARenFmq?=
 =?iso-8859-1?Q?chwht3k2ki7tyFTIe6WBBy+1WN/dXpmTnXG8H4EPsxUoFIf1CAylaV+DxP?=
 =?iso-8859-1?Q?RnOPTCDfT9IaDcyRBqYTJDJQMwUyGRAJlC?=
Content-Type: multipart/alternative;
	boundary="_000_MW3PR12MB44094F971904ED24E1AC67939F359MW3PR12MB4409namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca9f194-1c7a-4b82-4eaf-08dab96da201
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2022 05:22:54.6758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YZO0OU+ZRb6zvdRV2eavBzFXBj6pTOYZlS9J0SDzCoa1tTKus1KLaOffzGdAu51ehXPIT0NOh3gCiy5DTIaMvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7150

--_000_MW3PR12MB44094F971904ED24E1AC67939F359MW3PR12MB4409namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks, Alex, for reviewing this one. I built for all the archs and it was =
fine. Can you please share more about what environment builds are breaking?=
 So, I can test the changes for v2.

Regards,
Vikram

From: Alex Benn=E9e <alex.bennee@linaro.org>
Date: Thursday, October 27, 2022 at 2:24 AM
To: Garhwal, Vikram <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>, Stabellini, Stefano <ste=
fano.stabellini@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, Anth=
ony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, xen-de=
vel@lists.xenproject.org <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 09/12] accel/xen/xen-all: export xenstore_record_dm_=
state

Vikram Garhwal <vikram.garhwal@amd.com> writes:

> xenstore_record_dm_state() will also be used in aarch64 xenpv machine.
>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  accel/xen/xen-all.c  | 2 +-
>  include/hw/xen/xen.h | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
> index 69aa7d018b..276625b78b 100644
> --- a/accel/xen/xen-all.c
> +++ b/accel/xen/xen-all.c
> @@ -100,7 +100,7 @@ void xenstore_store_pv_console_info(int i, Chardev *c=
hr)
>  }
>
>
> -static void xenstore_record_dm_state(struct xs_handle *xs, const char *s=
tate)
> +void xenstore_record_dm_state(struct xs_handle *xs, const char *state)
>  {
>      char path[50];
>
> diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
> index afdf9c436a..31e9538a5c 100644
> --- a/include/hw/xen/xen.h
> +++ b/include/hw/xen/xen.h
> @@ -9,6 +9,7 @@
>   */
>
>  #include "exec/cpu-common.h"
> +#include <xenstore.h>

This is breaking a bunch of the builds and generally we try and avoid
adding system includes in headers (apart from osdep.h) for this reason.
In fact there is a comment just above to that fact.

I think you can just add struct xs_handle to typedefs.h (or maybe just
xen.h) and directly include xenstore.h in xen-all.c following the usual
rules:

  https://qemu.readthedocs.io/en/latest/devel/style.html#include-directives

It might be worth doing an audit to see what else is including xen.h
needlessly or should be using sysemu/xen.h.

>
>  /* xen-machine.c */
>  enum xen_mode {
> @@ -31,5 +32,6 @@ qemu_irq *xen_interrupt_controller_init(void);
>  void xenstore_store_pv_console_info(int i, Chardev *chr);
>
>  void xen_register_framebuffer(struct MemoryRegion *mr);
> +void xenstore_record_dm_state(struct xs_handle *xs, const char *state);
>
>  #endif /* QEMU_HW_XEN_H */


--
Alex Benn=E9e

--_000_MW3PR12MB44094F971904ED24E1AC67939F359MW3PR12MB4409namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Thanks, Alex, for r=
eviewing this one. I built for all the archs and it was fine. Can you pleas=
e share more about what environment builds are breaking? So, I can test the=
 changes for v2.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Regards,<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Vikram<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0in;margin-right:0in;mar=
gin-bottom:12.0pt;margin-left:.5in">
<b><span style=3D"font-size:12.0pt;color:black">From: </span></b><span styl=
e=3D"font-size:12.0pt;color:black">Alex Benn=E9e &lt;alex.bennee@linaro.org=
&gt;<br>
<b>Date: </b>Thursday, October 27, 2022 at 2:24 AM<br>
<b>To: </b>Garhwal, Vikram &lt;vikram.garhwal@amd.com&gt;<br>
<b>Cc: </b>qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;, Stabellini,=
 Stefano &lt;stefano.stabellini@amd.com&gt;, Stefano Stabellini &lt;sstabel=
lini@kernel.org&gt;, Anthony Perard &lt;anthony.perard@citrix.com&gt;, Paul=
 Durrant &lt;paul@xen.org&gt;, xen-devel@lists.xenproject.org
 &lt;xen-devel@lists.xenproject.org&gt;<br>
<b>Subject: </b>Re: [PATCH v1 09/12] accel/xen/xen-all: export xenstore_rec=
ord_dm_state<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
11.0pt"><br>
Vikram Garhwal &lt;vikram.garhwal@amd.com&gt; writes:<br>
<br>
&gt; xenstore_record_dm_state() will also be used in aarch64 xenpv machine.=
<br>
&gt;<br>
&gt; Signed-off-by: Vikram Garhwal &lt;vikram.garhwal@amd.com&gt;<br>
&gt; Signed-off-by: Stefano Stabellini &lt;stefano.stabellini@amd.com&gt;<b=
r>
&gt; ---<br>
&gt;&nbsp; accel/xen/xen-all.c&nbsp; | 2 +-<br>
&gt;&nbsp; include/hw/xen/xen.h | 2 ++<br>
&gt;&nbsp; 2 files changed, 3 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c<br>
&gt; index 69aa7d018b..276625b78b 100644<br>
&gt; --- a/accel/xen/xen-all.c<br>
&gt; +++ b/accel/xen/xen-all.c<br>
&gt; @@ -100,7 +100,7 @@ void xenstore_store_pv_console_info(int i, Chardev=
 *chr)<br>
&gt;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp; <br>
&gt; -static void xenstore_record_dm_state(struct xs_handle *xs, const char=
 *state)<br>
&gt; +void xenstore_record_dm_state(struct xs_handle *xs, const char *state=
)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char path[50];<br>
&gt;&nbsp; <br>
&gt; diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h<br>
&gt; index afdf9c436a..31e9538a5c 100644<br>
&gt; --- a/include/hw/xen/xen.h<br>
&gt; +++ b/include/hw/xen/xen.h<br>
&gt; @@ -9,6 +9,7 @@<br>
&gt;&nbsp;&nbsp; */<br>
&gt;&nbsp; <br>
&gt;&nbsp; #include &quot;exec/cpu-common.h&quot;<br>
&gt; +#include &lt;xenstore.h&gt;<br>
<br>
This is breaking a bunch of the builds and generally we try and avoid<br>
adding system includes in headers (apart from osdep.h) for this reason.<br>
In fact there is a comment just above to that fact.<br>
<br>
I think you can just add struct xs_handle to typedefs.h (or maybe just<br>
xen.h) and directly include xenstore.h in xen-all.c following the usual<br>
rules:<br>
<br>
&nbsp; <a href=3D"https://qemu.readthedocs.io/en/latest/devel/style.html#in=
clude-directives">
https://qemu.readthedocs.io/en/latest/devel/style.html#include-directives</=
a><br>
<br>
It might be worth doing an audit to see what else is including xen.h<br>
needlessly or should be using sysemu/xen.h. <br>
<br>
&gt;&nbsp; <br>
&gt;&nbsp; /* xen-machine.c */<br>
&gt;&nbsp; enum xen_mode {<br>
&gt; @@ -31,5 +32,6 @@ qemu_irq *xen_interrupt_controller_init(void);<br>
&gt;&nbsp; void xenstore_store_pv_console_info(int i, Chardev *chr);<br>
&gt;&nbsp; <br>
&gt;&nbsp; void xen_register_framebuffer(struct MemoryRegion *mr);<br>
&gt; +void xenstore_record_dm_state(struct xs_handle *xs, const char *state=
);<br>
&gt;&nbsp; <br>
&gt;&nbsp; #endif /* QEMU_HW_XEN_H */<br>
<br>
<br>
-- <br>
Alex Benn=E9e<o:p></o:p></span></p>
</div>
</div>
</body>
</html>

--_000_MW3PR12MB44094F971904ED24E1AC67939F359MW3PR12MB4409namp_--

