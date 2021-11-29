Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2964746118F
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 11:00:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234453.406850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrdSV-0002kt-O6; Mon, 29 Nov 2021 10:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234453.406850; Mon, 29 Nov 2021 10:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrdSV-0002j9-KI; Mon, 29 Nov 2021 10:00:27 +0000
Received: by outflank-mailman (input) for mailman id 234453;
 Mon, 29 Nov 2021 10:00:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LLD+=QQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mrdST-0002ii-IO
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 10:00:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bce02b6-50fb-11ec-976b-d102b41d0961;
 Mon, 29 Nov 2021 11:00:24 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-hX6FIXuFNAS989J4AB45ow-1; Mon, 29 Nov 2021 11:00:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7040.eurprd04.prod.outlook.com (2603:10a6:800:121::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Mon, 29 Nov
 2021 10:00:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 10:00:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR2P281CA0031.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.8 via Frontend Transport; Mon, 29 Nov 2021 10:00:19 +0000
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
X-Inumbo-ID: 2bce02b6-50fb-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638180024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jG8AhtBDRRcMyRtVGV59ZIU8UpWhKBINwJ4IUh9UZcU=;
	b=RHtOuOGPMCj70517Ag04KFwcrxyZrP6u38YOM3/Wutc2Plg65/UK5hQcKaW/uH0cNArkVe
	HDbd0r6zKha8Dn3Oeji8ojRnbLCCRq1TOVoSeWFYDOGOvW9+tHJAbaoqmz/C+bJ67VQEdt
	lloEVTCTtXmlJNWjX/mpP4L9xc8i7po=
X-MC-Unique: hX6FIXuFNAS989J4AB45ow-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWwY7z0ziOIx2vEk7x7edFdjhChzGQpFsAawWZq58a6jZlvmUxGETlaR7X3DpvPSW6EYsHP+lf27aTYjUBAbjtFh1PRpj0LkkPy71fOJicjl/aj6jLAMlmXsnZDtQWHcyD0EaNVGhG26g4ke1AmP18qXkxkhyvyQFgfzgesAq8yStmQRF167xUhJjncsrQfDGj6AiEDzYbdyplKO4bWmTDgRy1K1Wtzr/Q4Tinb+j9X6YfOaVKO67191sHnVgugT5LsSZZIovwB52eSePUl5vrIe9VD0b4Uq70cC1Bq7BPW6aqIcq2hm1p5dUX1iZ5YJ10q3VWBpOdnK2xzD1bx+5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZKBDxTqKsls/uh0vURMMbSNeSqGv9vY49BuzjTpkOM=;
 b=AVgejFsl6qc3KFKZbi5WT7fEUgYwzN2u8Rn2eyS/N64JwjKrOUmdGEH5+00y7hl1pTh1nLIGDVCwnHNn5dGxlsznjR7FkgmJQBbcBHicHlyADTp38jkAdnpOAPwWnQLMYIVwQRV7Lo2Nm0q25ILx1pecgVgESf47+mT6Ca8zx+QJf9N37BanlXLvOhL93UIAweJn82zV4Ya0OYnMXPgspkcaQuYcl1oNi2DmcHu17NR9FBNdS5Oc/oD/Q0PUQCu1Y43CB9L4f5SYp4TQCAsgYsous4oF5KOjUcOAYYt1ZwX1GnHucGLhYi30eNH5lSTYa5lqNoFreqPMbY8ZQYb1bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3afa7371-9511-6e41-76a0-dbd93e91d0d5@suse.com>
Date: Mon, 29 Nov 2021 11:00:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 04/65] x86/hypercall: Annotate fnptr targets
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-5-andrew.cooper3@citrix.com>
 <374c6213-4319-91ba-6b69-c695d4b2cd87@suse.com>
 <02af4393-8b31-960e-c509-012b3ce09703@srcf.net>
 <1b9a0370-a55f-f773-2dd8-f3398685c9a5@suse.com>
In-Reply-To: <1b9a0370-a55f-f773-2dd8-f3398685c9a5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93231251-9611-4346-7825-08d9b31f0d3b
X-MS-TrafficTypeDiagnostic: VI1PR04MB7040:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7040489AFD1A3AE1409D8B70B3669@VI1PR04MB7040.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C5iCnUsFJm9hEHEtuZM1cu2KoAljM228F45ui1J7oF1IT2jjgkdhE6jb/iikyzWVA1mV84lN8Z5dW6BN4roD7cSFo313UTUAtg7pUowET6Uy8YDFJKR9Z+s94WbLmX+u8vrbcwQQCuuOxns/oEV94+EgX6c2GKvQjvuiftX4oNk2oR6fzS+kfy+oL2u4n6CLeqm76RLrE1lQnCg9CXCcX7iJCRkmIqx9hTO9eABlZ9ElDeFGKpprW/A0HgUN7eRjI6B2LpLdHLERsNQdvReiU7vDRCXCXdLPOZWOA5fMxdyDMv5f5edUT6tY9ietFb5Qlrlj+CU1B3fw4PdPGOLlyqPWjNByCkefE3AENaY59UuwhZKtWGKGVJQTUkpmuXgBhoj9+VjZwyhyk4oPWYiTSajiDd5Gr02aQ72AInMfWv//UhVQo9bNugmn55sthc34jKyOKPoFNt2nIdwWI2v0YD01qytqzvwxXHxNG2Ccto8Y+jD6PFmT9h+IQp11PYWeRbl7FheM6BAw7ikmJWszlw96rQvvy71WBF2xVEsL7b2VpDT+uCAn731Vql+avjJqULuxksTZvFifJrke7bRanPGsu+lvjLGieIKSOOn4m6uaSbOtW1pnvxLjYmiD1smzkpW3vWNM0OY9D0RuAj3ibtaSgMBw8qEFwqYP+j8E3Js1eJFwg6Lff0Ap6lBxW9N0zaAdl4cP52lHzfgU2fDBOSaNBWGEFypbiYG7Jc7SgNI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(5660300002)(2906002)(956004)(26005)(8936002)(31686004)(2616005)(53546011)(31696002)(8676002)(6486002)(16576012)(86362001)(186003)(36756003)(38100700002)(54906003)(66476007)(110136005)(66556008)(6666004)(316002)(4326008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SPy2ac4unVNdNJFai1zWIx7NaNPpXBua0Xy/jw0rrJnhTlQCg93Vpm9kWv/9?=
 =?us-ascii?Q?VRAHzlC96cy7wwyamJQe16gwe+9Ei7xe58dWqDcFnAkGF4Cy6DDbgGV8t2Mu?=
 =?us-ascii?Q?XcJ6+69HC7mA/QJsIregV6DqmAvoFAqDpbxIBvi9C0peUvb3sqGnmmTwLFNR?=
 =?us-ascii?Q?xQNyn0oI8HZtuXJhmP1COx/nqOYCEof9wr0EPzaDW0wYLcEuOmtwpL3bSMJh?=
 =?us-ascii?Q?7q4Wl1xEXLxnjNQBrtOWIO4nEDKEWpBghpBBSNmTV6smskw/IRhE8a51Uifb?=
 =?us-ascii?Q?5K4sdq1fZxgLvvXh/7/Ei/CIiYc6npMr2P7OMQ3lNiX1sydbSVlExgbztCYN?=
 =?us-ascii?Q?2shuJaa6TesPnHhDWIcVLsLRp6iRoPOdV4PJJ727dEJq4szUCjCVk3qmCsz2?=
 =?us-ascii?Q?lV3/DB8gAraQ601OKc16hZy+87mOCIg64TszB9asaMwP0m6Gj5++yEACigdL?=
 =?us-ascii?Q?UelAVNWZFzcxyVLz0t6REh3IdD/AND2Igz5PR7P9qLUUvhSoKbmN2bp4nHxY?=
 =?us-ascii?Q?PFX4rI6mE1/mS8XTY/ZxFFS3N5M/DxiSJ26z80EtGtKwnkcOEDp9bhJq0td2?=
 =?us-ascii?Q?f0Rw2Wz0VHygjbp2Xj1kWGEl4XaXcXHwdxQNmrkL2e8T7FokpA+clj/0EvVr?=
 =?us-ascii?Q?5b0P8Psvr0LM9Uah7RBhALWSGeVXmaej3F4QHjKfX++hQzjb2lpcWbtWELXL?=
 =?us-ascii?Q?sCB5a2dmuURRSrZac7bfBs8aaNTdn+uuRJlpzMIwi7XBiHWrB+4uIVehx76g?=
 =?us-ascii?Q?fQdcXKJDfloWkZdmxPRFfLeLjEErse9Iqy/Jd0ulSCo4+dWR3PvEqkGsLNK/?=
 =?us-ascii?Q?jDAilCyFWL49oii/ptg0sRxpBonV9dR3F1QUAmMZGR2WeI7BM764ykSMFeJH?=
 =?us-ascii?Q?cvl/uf39taT7egfYDRTvDvCqQrSX82grgP6xqOc5ikTq1iEq4Ii8PFkatx0x?=
 =?us-ascii?Q?Aourgy79AyVHlS2fkQKaLzNVOMOS3kQEtBv6Cl/8vGfhN4IcVfUKAfjzzlOk?=
 =?us-ascii?Q?2E2gKi+7YSTQObIcEraFqPUwCiwQ5x7sM+DsvGtPoewJtW9YdTnyKQTsjUto?=
 =?us-ascii?Q?cbiZ74c+ynUzyszvnMogoGQL576EJIqcOOTgXIM6lmmCzjeZJ5JTBtyOIDjb?=
 =?us-ascii?Q?wwt9V/FciYwfJjmGG8ZjELZpkmEZ5BWjwXAwCzAd5Zxyc16GThKzVihYmajJ?=
 =?us-ascii?Q?KPMY6esrHvgJnUkQWfGx/r7DODW4Py1h9MoiXWNE+PwrgxDIEUy2840IOe83?=
 =?us-ascii?Q?ftlsVRbgttMLjTpLWb158G1mRU5TlOgBE6aBI8mtrIgOC/3kTLy1dqhrM8yi?=
 =?us-ascii?Q?lyohuxj3xtKMfJOZGWkf/ke1V7oOs/lckVnTY6tCTWldnlHQsSGkrNJhc0YE?=
 =?us-ascii?Q?vY8df2TCiQMWFEf7RUg65Y0oixE5lge0VTDYvrTXsxhD+05UqW4l0ZL30EZD?=
 =?us-ascii?Q?hhjRvNoKL9m+mPFWFxZmOGw+xWcEJscVg+Shwyg2tKoEm9whEUXzpL6BbC/+?=
 =?us-ascii?Q?KLsmF73VBOtXeEJYLQpwUZZKpXoVd1TCIGEsz2DimnkchNmLlsqcXPdcOKox?=
 =?us-ascii?Q?ENcCcEi6BCFnVSKzKV3VtBWCxJvEnIHo+hWQfxxQmuQ1pjRgCsCcKZOkbAK1?=
 =?us-ascii?Q?+/5egpnbYZZEne1QEFczAs4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93231251-9611-4346-7825-08d9b31f0d3b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 10:00:19.9673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DcaGtsdK890K7QpxqfeqDcOXierzHPtJEpuv+JN09EkQ8U3rE63AQFsOom9geHMdriqHcvI3wOgXc3uuMu+GqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7040

On 29.11.2021 10:38, Jan Beulich wrote:
> On 26.11.2021 15:28, Andrew Cooper wrote:
>> On 26/11/2021 14:21, Jan Beulich wrote:
>>> On 26.11.2021 13:33, Andrew Cooper wrote:
>>>> --- a/xen/include/xen/hypercall.h
>>>> +++ b/xen/include/xen/hypercall.h
>>>> @@ -18,12 +18,12 @@
>>>>  #include <asm/hypercall.h>
>>>>  #include <xsm/xsm.h>
>>>> =20
>>>> -extern long
>>>> +extern long cf_check
>>>>  do_sched_op(
>>>>      int cmd,
>>>>      XEN_GUEST_HANDLE_PARAM(void) arg);
>>> What purpose does the attribute serve on a declaration? On the surface
>>> I would consider it meaningful only on definitions, like e.g. __init.
>>
>> Because GCC treats cf_check (and nocf_check) as part of the function
>> type.=C2=A0 Simply getting it wrong will yield a "definition doesn't mat=
ch
>> prototype" error.
>>
>> Furthermore, it needs to be visible across translation units so one TU
>> can spot (and complain at) creating a function pointer to a non-local
>> non-endbr'd function.
>=20
> Hmm, it might well be that way, but that's not what the doc (for 11.2)
> says. While suggesting things are along the lines of what you say for
> "nocf_check", for "cf_check" it really only talks about code generation:
> "The cf_check attribute on a function is used to inform the compiler
> that ENDBR instruction should be placed at the function entry when
> =E2=80=98-fcf-protection=3Dbranch=E2=80=99 is enabled." And even for "noc=
f_check" it talks
> about extra compile time checks only when the attribute is applied to a
> function pointer variable/field, not when applied to a function.

The two attributes looks to indeed be as different as the doc suggests,
after some experimenting. But I now understand that's what patch 56 is
about.

Jan


