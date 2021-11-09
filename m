Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 400D644BAEF
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 06:07:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224089.387321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkfoF-0008Ko-71; Wed, 10 Nov 2021 05:06:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224089.387321; Wed, 10 Nov 2021 05:06:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkfoF-0008Iz-3X; Wed, 10 Nov 2021 05:06:07 +0000
Received: by outflank-mailman (input) for mailman id 224089;
 Tue, 09 Nov 2021 17:56:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+rF7=P4=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1mkVLw-000770-Ty
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 17:56:13 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e88::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c75f492-4186-11ec-a9d2-d9f7a1cc8784;
 Tue, 09 Nov 2021 18:56:00 +0100 (CET)
Received: from BYAPR02MB4823.namprd02.prod.outlook.com (2603:10b6:a03:4e::18)
 by BYAPR02MB5654.namprd02.prod.outlook.com (2603:10b6:a03:9f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Tue, 9 Nov
 2021 17:55:54 +0000
Received: from BYAPR02MB4823.namprd02.prod.outlook.com
 ([fe80::bc6c:3e71:c574:8852]) by BYAPR02MB4823.namprd02.prod.outlook.com
 ([fe80::bc6c:3e71:c574:8852%7]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 17:55:54 +0000
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
X-Inumbo-ID: 4c75f492-4186-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OobK2T7Jo+VD5DdsMnIavqLKdaoZFIFkFrF2Uvi4vmsNLAbUvgdWqY8cy53mxZKcUVJuA2XAQHiX3hElpMUwcMQEG9IcbJ+5/RAazifAEuBPZ57KQ0UVWxtASvTWQGovFYdGMCN6lARa2jNoQK0D9A1bXkd3wC8aLmU7aKZJ3ssHtE7KyiKV+rGuT3VNunWXJREcluYVkaZleZfShe5tdxivsZTP59UFMb0Ydc/6HcEDMWe/xrSPLU+d7cVIQ0KawZuErKAvshoT3W+jtumE2una5WDkTH0Ifc55Mt/pa9iwNLwDnyAgAvl1yqoHCjuPYyB+OTncchpdHf0ysW8d3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/PV7oXT7nesgfZXjBforPRVFb84xbxPDNzHzQp72ME=;
 b=RSCOA5GKryvUiA/7jesq2c8ox0qAwVnwWuZWka/RfA81roLzuX1Wb2fLnDHiG1eII7lf4g2EE/40NF1EiiOlrPxpQ8ZyYxwGLBpjvlogIwwp2qLcMp8cnJQupKZ5Bj+Ltoq8iZvCdiEeU1aEy9jdQ/idIQwicANw+lhnvYrj+OyvRpY27BBIsqvz/eM6q/NJ6ar1er8GkdOsQKBAv64DXB6/k3MEEduJoHy1CH194NVlI/I0zCZBGRPYLGdOiAW/6kXpwjN+Kud+AKIVVoTshdDkktwjxQjr6yBdqH9V2G1Y5/a/m5tMUuI6jtAaOg4CEDtRBPZh8KQWEmPXh9sbdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/PV7oXT7nesgfZXjBforPRVFb84xbxPDNzHzQp72ME=;
 b=sVXlKari/ImEUeA+7eoMIL9boKgnUo0mkZkQ4EPiyvd3XDmKtUEyutS8vg34QHrj8YRBTUCx36der0U/ThpCmyJaFQeR0seRzsxhWPMvpma1MhTYHpQ5npUxYooIU6oKySbY7F9agxpL/QQfAmFXh4+hdbowe+RZJD3bmgq57jM=
From: Vikram Garhwal <fnuv@xilinx.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>, "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
	"volodymyr_babchuk@epam.com" <volodymyr_babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN][RFC PATCH v2 09/12] xen/arm: Implement device tree node
 addition functionalities
Thread-Topic: [XEN][RFC PATCH v2 09/12] xen/arm: Implement device tree node
 addition functionalities
Thread-Index: AQHX1TfQHzriIwSLBUOZInYGWc/AK6v7DOyAgABtxzg=
Date: Tue, 9 Nov 2021 17:55:53 +0000
Message-ID:
 <BYAPR02MB4823326A067EA3FDAAE32A58BC929@BYAPR02MB4823.namprd02.prod.outlook.com>
References: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
 <1636441347-133850-10-git-send-email-fnu.vikram@xilinx.com>
 <a984eede-878f-d9b5-da63-990e2e2e57b5@suse.com>
In-Reply-To: <a984eede-878f-d9b5-da63-990e2e2e57b5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator:
suggested_attachment_session_id: ef0d14d4-0b7e-7a0f-abd1-53d2e8890cef
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2ed2831-f8ad-4ca5-636a-08d9a3aa2cc7
x-ms-traffictypediagnostic: BYAPR02MB5654:
x-microsoft-antispam-prvs:
 <BYAPR02MB5654C920DE5B4CB7764880D1BC929@BYAPR02MB5654.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 tZZ5X07HCeH3+aiMiqGuWrx6bJ4e8CpFyT8kKnnyPMDW0b0i6C34xe179GqZ5ev1nWJapHFAhXdub87UVMQLXuXskBgceo18WVI72qV+HGxZ6LLT/DfwHoAx4b/q/whlYTR5Efv0ZCVyjIVBdVGvpOMnAE1x84Taxl9y3KGUQmXHEMpr8klbICuWqRq/E+wHpDlYuVz/OMgIo2rrnIZiCvWd9TV9vnDF5+Xk8jArTQvIB0kQq+XcEArqE5fB90Jj4OwRwPv3uI6FjqHZFsBMZO0ioXR/LCnozcnG7Cnu/LOfz1lIFJVVniCLkk02dVgbq71zzcOo0ldevM2J2WjS1KlylJ9YC/abKo7uoWuV0g2NVTRoGbr+dgmfLCtxYZnzAVPYdDXF6B4tqBglDMk1NfLSKkXdlT35NImB8P1mgu6ipnCglMoXm29vJ7aFhnx6K+3dHvkspkTXgfs9N3UNWKs+N0TIQrNaGjR0k/ZsZbqATJ8A1olZjcl1qInWgU0QDzaBB/RglqN3ItFm0NXekUU5neDxA70N4YEmSC4APWAlbVF4XndaJHPz2Ei+JdmRdbhRWSU4ojLzmkaF43qL4KPZsG0HE4+Qtf8Sjx4UXghlgVSMsysoArgyQ8QBDpvnVNHpg95zYXqUGa1sOYMewtfuwh7cuPKmsZRPLgHCx95s/Jr5JY6eXI90NiAaET5tr4pMO6FsAONNz6Jx2vWMCw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR02MB4823.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(7416002)(54906003)(53546011)(33656002)(6506007)(7696005)(83380400001)(6916009)(8936002)(508600001)(8676002)(2906002)(4326008)(5660300002)(19627405001)(52536014)(71200400001)(9686003)(86362001)(55016002)(66446008)(186003)(38100700002)(122000001)(66946007)(66556008)(66476007)(26005)(64756008)(38070700005)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?wSOO28+bpXLyDrZhM0ONMQuSq5LyEjrDcJNYBvaKUOb63tWYsdlgm761hbaZ?=
 =?us-ascii?Q?asBMN2ECOPbXSqqV6mRSjIS1y7NYpEZLT8dHIf8XlfKWzoSSMHj5jqMlDQaw?=
 =?us-ascii?Q?+pJdW0TcI8Pfk8gswigVRlXK7lflQJdkdWpbNts74NDcNGhY5Ve2e0f+OR1m?=
 =?us-ascii?Q?PzOG+W7XU4RK2Tl5kmgR9aJUy2smsIwhH05t8jykWd5f2I23XAA8Edb2TZ/Y?=
 =?us-ascii?Q?qGIEhIA9ojNgR8rZId3N1Uuk5dYta5Vlf6eLFckrbHLF16zHwyVseM3J87Qk?=
 =?us-ascii?Q?GI3m9sIrqnaLNRZAZXWzrw0OlHN5n/VdUniHX392vYZD63a/ziYD78H924Co?=
 =?us-ascii?Q?uvSJ5YewGstzoEPTs3pweSKW68TPzJ6CXsnT15l6gBgbysW2k5wHm6g/BRZr?=
 =?us-ascii?Q?wIPH8i1HdSFFXnUcmNlU0TUpDma94iQuAbsp4D5YnnjfsCNE42h1686t3GIF?=
 =?us-ascii?Q?x7hg0CP+absxVvrpdqOGrqZo7UnglSQd05Q/grtAiWCFvJgXgW62PCo906Dz?=
 =?us-ascii?Q?l1OQ47QpJiiB+sX8BDied6TPkyve/W/IwDlrXPKd/yw61YsN0FGfbR0fs0y6?=
 =?us-ascii?Q?UUS9uKDxffycvbLcBwIV7wEeRYita9VTUu7DqYE55JAqCiWnfIpwKc1KzSii?=
 =?us-ascii?Q?uIcWipfvnoViVIjbjknTqBN9aM3xhVDjufSCbRJl8Wz9gOWOwT1MohUM/LmK?=
 =?us-ascii?Q?ZEL6p05BdTUALQYFz7LnIYnzjgxIKnf1D9eeKzkzyTjO4xgvEw7ACT6Wv7tx?=
 =?us-ascii?Q?MwPAbWmQEJNl5wkSBBo5tBxaDv4pjpxMAN1rbVvzQfnX4ECCSTRPAgY4sWy8?=
 =?us-ascii?Q?C6bdKq+9fXlwVwstMI0kuPUXt23bzDDe1qg58UqFwBwu6nsCPfJib6S/IlHZ?=
 =?us-ascii?Q?filfkuPldMP9x0BCeLygBdxI/UXPJTxotK2usGhH01zDv94iYeOux/dNmRuo?=
 =?us-ascii?Q?EAZGacDJG5k+EQjDYIbyxeQQzRh09wTXoDLZxpoB8VCm1gi+8A5/Fg8/DyZJ?=
 =?us-ascii?Q?RWOj9sDo9THVMLUdVY+D5yuXTCTUjYIqoxVTBEgqzKYYo14CFm+8qV1iNB3x?=
 =?us-ascii?Q?pGO64Y0r6cMPZLpZfePRYseavekmMTXRDBxxUN3aPC2b5abvRfbT1EQiwjDk?=
 =?us-ascii?Q?pSbh+HFa3Ysw7cBBQ3gfpqAwa3UeCPy1zh0aDFr/H6ObHN6TBJubaEluDuS2?=
 =?us-ascii?Q?9QydGPv7rsa2psh/+ACGjvmT+ByIFrRM+v4cgnfqryWoygT5sXlXlDFeMGGn?=
 =?us-ascii?Q?8maeWQHVNLfk0INn/sn3RmfokDV4myo+jzYHwI5Ksf4R4HEHjZUo6IUHihqD?=
 =?us-ascii?Q?3TvwzP56FOXaBIgmxwinaL0/2IQH9rxthLeXSLo4HbaSXnrbdYXnX1R9U6Zy?=
 =?us-ascii?Q?2mD5VgxRSFOks0E3Fyo4lbH3aRYo47DS5ha/9/4YTRnSxaWwL9x1np0u8rEL?=
 =?us-ascii?Q?Sm2criHxBUmMCX9KdbGHIx2wqQna2T+LZ3SUjPkw78SGsppObeEQsDSkvaJb?=
 =?us-ascii?Q?FVTiDA5ODx2KiYDqk3Kg3hFyCfxOpxDafPiGdwFOHoYIaw6/YniEV+EHrQ?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_BYAPR02MB4823326A067EA3FDAAE32A58BC929BYAPR02MB4823namp_"
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4823.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ed2831-f8ad-4ca5-636a-08d9a3aa2cc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 17:55:53.9019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qriyUy9MzVOcXULCnOBIkTbZ/ePVVFQjN23RuQJ5+y8Svq78oAKZCedQM9QOIDC1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5654

--_000_BYAPR02MB4823326A067EA3FDAAE32A58BC929BYAPR02MB4823namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Jan,
Thanks for reviewing the patches.
Yeah, I messed it up while breaking the code into multiple patches. For nex=
t v3 patch series, I will move the function call "handle_add_overlay_nodes(=
)"(in patch 8/12) to 9/12 patch.

Thanks,
Vikram
________________________________
From: Jan Beulich <jbeulich@suse.com>
Sent: Tuesday, November 9, 2021 3:19 AM
To: Vikram Garhwal <fnuv@xilinx.com>
Cc: sstabellini@kernel.org <sstabellini@kernel.org>; julien@xen.org <julien=
@xen.org>; bertrand.marquis@arm.com <bertrand.marquis@arm.com>; volodymyr_b=
abchuk@epam.com <volodymyr_babchuk@epam.com>; Andrew Cooper <andrew.cooper3=
@citrix.com>; George Dunlap <george.dunlap@citrix.com>; Ian Jackson <iwj@xe=
nproject.org>; Wei Liu <wl@xen.org>; xen-devel@lists.xenproject.org <xen-de=
vel@lists.xenproject.org>
Subject: Re: [XEN][RFC PATCH v2 09/12] xen/arm: Implement device tree node =
addition functionalities

On 09.11.2021 08:02, Vikram Garhwal wrote:
> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -331,6 +331,205 @@ out:
>      spin_unlock(&overlay_lock);
>      return rc;
>  }
> +
> +/*
> + * Adds device tree nodes under target node.
> + * We use dt_host_new to unflatten the updated device_tree_flattened. Th=
is is
> + * done to avoid the removal of device_tree generation, iomem regions ma=
pping to
> + * hardware domain done by handle_node().
> + */
> +static long handle_add_overlay_nodes(void *overlay_fdt,
> +                                     uint32_t overlay_fdt_size)

You adding a static function here without any caller got me puzzled.
First I thought you'd be introducing a build failure this was, but
it's really patch 8 which does by introducing a call to this function
without the function actually being there.

Jan


--_000_BYAPR02MB4823326A067EA3FDAAE32A58BC929BYAPR02MB4823namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Hi Jan,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Thanks for reviewing the patches.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<span style=3D"font-size: 12pt;">Yeah, I messed it up while breaking the co=
de into multiple patches. For next v3 patch series, I will move the functio=
n call &quot;</span><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe=
 UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&=
quot;, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: =
rgb(255, 255, 255); display: inline !important;">handle_add_overlay_nodes()=
&quot;(in
 patch 8/12) to 9/12 patch.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: &quot;Segoe UI&quot;=
, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-sy=
stem, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; f=
ont-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); =
display: inline !important;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: &quot;Segoe UI&quot;=
, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-sy=
stem, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; f=
ont-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); =
display: inline !important;">Thanks,</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: &quot;Segoe UI&quot;=
, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-sy=
stem, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; f=
ont-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); =
display: inline !important;">Vikram</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Jan Beulich &lt;jbeul=
ich@suse.com&gt;<br>
<b>Sent:</b> Tuesday, November 9, 2021 3:19 AM<br>
<b>To:</b> Vikram Garhwal &lt;fnuv@xilinx.com&gt;<br>
<b>Cc:</b> sstabellini@kernel.org &lt;sstabellini@kernel.org&gt;; julien@xe=
n.org &lt;julien@xen.org&gt;; bertrand.marquis@arm.com &lt;bertrand.marquis=
@arm.com&gt;; volodymyr_babchuk@epam.com &lt;volodymyr_babchuk@epam.com&gt;=
; Andrew Cooper &lt;andrew.cooper3@citrix.com&gt;; George Dunlap
 &lt;george.dunlap@citrix.com&gt;; Ian Jackson &lt;iwj@xenproject.org&gt;; =
Wei Liu &lt;wl@xen.org&gt;; xen-devel@lists.xenproject.org &lt;xen-devel@li=
sts.xenproject.org&gt;<br>
<b>Subject:</b> Re: [XEN][RFC PATCH v2 09/12] xen/arm: Implement device tre=
e node addition functionalities</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 09.11.2021 08:02, Vikram Garhwal wrote:<br>
&gt; --- a/xen/common/sysctl.c<br>
&gt; +++ b/xen/common/sysctl.c<br>
&gt; @@ -331,6 +331,205 @@ out:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_unlock(&amp;overlay_lock);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return rc;<br>
&gt;&nbsp; }<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Adds device tree nodes under target node.<br>
&gt; + * We use dt_host_new to unflatten the updated device_tree_flattened.=
 This is<br>
&gt; + * done to avoid the removal of device_tree generation, iomem regions=
 mapping to<br>
&gt; + * hardware domain done by handle_node().<br>
&gt; + */<br>
&gt; +static long handle_add_overlay_nodes(void *overlay_fdt,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ui=
nt32_t overlay_fdt_size)<br>
<br>
You adding a static function here without any caller got me puzzled.<br>
First I thought you'd be introducing a build failure this was, but<br>
it's really patch 8 which does by introducing a call to this function<br>
without the function actually being there.<br>
<br>
Jan<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BYAPR02MB4823326A067EA3FDAAE32A58BC929BYAPR02MB4823namp_--

