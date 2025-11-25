Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1F7C86E9A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 21:06:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172179.1497277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNzHh-0005wH-M6; Tue, 25 Nov 2025 20:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172179.1497277; Tue, 25 Nov 2025 20:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNzHh-0005ta-Id; Tue, 25 Nov 2025 20:05:09 +0000
Received: by outflank-mailman (input) for mailman id 1172179;
 Tue, 25 Nov 2025 20:05:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cr80=6B=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1vNzHg-0005tU-9K
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 20:05:08 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08278e59-ca3a-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 21:05:05 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by IA3PR03MB8454.namprd03.prod.outlook.com (2603:10b6:208:53c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 20:05:01 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::c0cd:bcd1:5235:66f0]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::c0cd:bcd1:5235:66f0%7]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 20:05:01 +0000
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
X-Inumbo-ID: 08278e59-ca3a-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M+2XoFkvwlcFJKO8WSNGM9e4l9oMwsszIjcjKFy2Ql0KtcuPb772dtS/eLuybBHXIbFj0rivdriXWNt0ykkuJdwQaGPyUCG1LImwvoyzbq5anQ9wJ5FcgZi8VxNpotxfb+RToK7EyOMY+Jd86NdhuLi/thXPqDxA6riyJ5VDn6Yf2aiR3gLRuzKl6hLDc2WUOd/czx2tmwZm7Ku6P40nTcTVFH57SVSu79i7Lm2gYRwxX92D7SfS+KH/KDe1WrvpIJR3TRiDHZvf/QFMU1ezKZYCRZ8j4EQcNg4TPAw/cwSuiwZcslY/hym1Cny1LSafaC3MRhURACONUc3oYu/Y1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ceOcAwmy4+3wlEaLWq+sxz5OCpsNV7rRkkM2/YOiHbo=;
 b=w9NcEItirWe8tqLBSIms38ee6k0HUP4+/fMX0epYscBZgAowwgSD+61bxTWzMYzkOzWFdCv61V1nye9Er0oSHyethG57Td1GHBEEe2oo+57dhOUOfJOp3bf27CvMuoRfuXEXcb9isMbpDVpLv17G91JBqbiiyGFyUebVMcQ60OefR80K8yEFiVFhhzNEGlE4ARRNLSqbHRWzCcb7rs4xDTeGLzaewp+uJ6JUGQtnRcj/RmxXD2Jc8/DViSJ6Oa9Odn7GI+o5K8F49drrh13UkbBXJYPXBC8/oIow8zMWnwfe+rzkaz77XiqolGTIWO8NoSG9BV4iW3W+cO3DfUv5tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ceOcAwmy4+3wlEaLWq+sxz5OCpsNV7rRkkM2/YOiHbo=;
 b=rPG0lxG0fjTYBJ6BwwZpW6dO9WUyeFlMAoLCTOYwri6Z1Lw/sNXDwpgaZPVtPyEs/5sLwK5pvUrMZtvSmaxkhRY/RJ6/A4BllmW4W8imDpKRBfz3uZj4qZGeYjUw3vyuCn7EplOb/UIwiRjSeedf/tteDV0+Xskz3LOpwqTXink=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: Andrew Cooper <andrew.cooper@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: Re: [PATCH] x86: Remove x86 prefixed names from cpuinfo for intel.c
Thread-Topic: [PATCH] x86: Remove x86 prefixed names from cpuinfo for intel.c
Thread-Index: AQHcXTQ73Jy0r9eIAkCAIFbbEnPqPbUCS7kAgAGHQ78=
Date: Tue, 25 Nov 2025 20:05:01 +0000
Message-ID:
 <BY1PR03MB79969A02DCCBAB2F9EBD0D24F3D1A@BY1PR03MB7996.namprd03.prod.outlook.com>
References: <20251124111942.1325635-1-kevin.lampis@citrix.com>
 <2a881cec-879b-478f-b067-06e1868b2770@citrix.com>
In-Reply-To: <2a881cec-879b-478f-b067-06e1868b2770@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR03MB7996:EE_|IA3PR03MB8454:EE_
x-ms-office365-filtering-correlation-id: aa74a9ab-03d6-423d-8110-08de2c5dea80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|8096899003|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?rPBtEVlcv/Q1Zlsu9Jrgck7CLZ7yEnPwxPrybpMCFkssmkApmmAiWZhoHRNn?=
 =?us-ascii?Q?Bf+ltp37uFObMm6UPv/UEyVZE378JagW7dvvg7R5nXf3ASK+NVDXUdGRB7Gq?=
 =?us-ascii?Q?rBtEjP+ONGpkke2khSG3RDMZIrNSSKAxYxg31VN3PD/bR7TVPLKqPnz7eSAG?=
 =?us-ascii?Q?WQ64j49tJCvzxR+nTP0SQpFxuBHbbK2O1+0U5Bapa1EMwh6PFK2jQOVDkNDM?=
 =?us-ascii?Q?8I3y/hHKDOq9kfvwV0swb/Vj92+BuDhs3L46ZsSqid7557xedV2e8UfLIPJE?=
 =?us-ascii?Q?za/XkIjx2chI9aj4iwENItlGbjighIA3quOeMhT+ZRxve02BkaabK5dGM+a9?=
 =?us-ascii?Q?xXnC6tAAAlFLwO7XbcgFXXVxmcxKaR/os2ff5uYkFUKYh/9pqcHOX4gGIQ7X?=
 =?us-ascii?Q?KWqKFCZeR6qPvGLQyC30U8Czc/mFHUP2drrVqdsF4gj5Gb1kviI8/lYiTBI8?=
 =?us-ascii?Q?zxHPBvTip/iso2EWZGaF6lQN6SGwnkEeLZ4J6uzsGE5YtH7KeF4MTTcAusAv?=
 =?us-ascii?Q?svrl/h44BD8LIZee2o/+w/y4HZ17le2Ql2DFjGouRRZ3o3JwotrRsbXoyL4A?=
 =?us-ascii?Q?/8w3Eh1f0Hl0NyQpOw7ZUKApUrxISelyl5ee9EvOtWCc4ncLtUR+qOpTjeTl?=
 =?us-ascii?Q?7ztzYCgfLSHnmoyxACsuTKw191YtVNa+nm8PhaDkrdlbcBerpY2gci9pMPJ6?=
 =?us-ascii?Q?cGoA2MxIDYdXe5WOVQmbhcmrgMCwEl5QWbJthg3TcJu7s4G7lHR/1SMeArkj?=
 =?us-ascii?Q?E2nXVqL7QwH1STRMnf1TCZGDzRxpUaRNKAWOyq/BL7cE0jXa9ZWK6dj86qT7?=
 =?us-ascii?Q?fbf7IZaEWlqjszTtr8dgeb6PIyRD4q0nOrZzcgDPSd6ITac1hhXIQfLAHuMN?=
 =?us-ascii?Q?bwUuHkGRrhTe4c5zT50cQLjeb4KNnDVbpW3khpbEa6RweGJMI5y8SLrKlu9g?=
 =?us-ascii?Q?HTi8Bw0p+gfw/dPK9aJjotaL1izuJoqPLaXjBqIjlLXeQoXM9uMNFEJRVTDl?=
 =?us-ascii?Q?5Irc/3VgM9DorKSYJKztPf0yV7crSOe2yJGtbpzFlcJ329Kwk46Qfv0K928A?=
 =?us-ascii?Q?WpQIZ5R07EaGHCnsWabzFPHpF7g6+znd8dpm4mnM75uns7/k7w+v0oKZfmIs?=
 =?us-ascii?Q?Bwnz0Ik0CRYjSvyLIjRfU6F0TUsx+gcEt6r6cf8DADKemJzQ7vKOHmAKWLGn?=
 =?us-ascii?Q?Vy0vxZKYl1fkYeS6Oxg/ljNONr/r3JGO2YLvMclpZYiMdvHql5XKJK/yBjBH?=
 =?us-ascii?Q?wbK69W9PB0wGz2t7hlzPAC81hdtI/Lt+HTzw8kkxSLwpqbN61yHuRnIWfbmm?=
 =?us-ascii?Q?LUtGAFF3QC60ZOdYuszJqzc9xjPweB3Nw8xz81YpSy9MA84rQ9XKail7i7Du?=
 =?us-ascii?Q?wWlSNWNqA9P8s3AJsvesEyin9iRaweEfb0sFB8BHoAd6Tb+7kRCziCvhtoEg?=
 =?us-ascii?Q?jMv7xw5alPmSCrh6V7Va6mDCbWB+33WbNGeOUU4xvomIWRIL3GXPhEhDtKNy?=
 =?us-ascii?Q?KxdVVIFF8V6RsQTKuaFgLzNBglzCjtwjdSt2?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?pHoJOt6qzqrW+CCPas3eQB8hFgJCUmq7lap/zB4zytqvx3QKnbqC4p48Y/d7?=
 =?us-ascii?Q?PT/fjvtqXm0GbT8Uzy2TQuRnhqatFieeNegpbdGPjPdpU5Cd0kyzgKsWzko4?=
 =?us-ascii?Q?TUeBOCwsmkfwrT5Yk3EIEvMLlAuSqRB/Jbs5dNOMiGBmY02BsbQ+ZaOqtu6G?=
 =?us-ascii?Q?maxLlJyfDuikpW3SWQ6zstTjsIkxdPfkV0H5UJ7KCM4ocvrKcptEZ2ovvVAD?=
 =?us-ascii?Q?X8pJ72oqCTz1ytllVPf6YoRGyWXgm3rU97kOgeeX5iCqOgP8yMxW6OCOxSAj?=
 =?us-ascii?Q?+bvV4qAGa5dswwpLCFf9Jzauyo5FnwMBmk+4MEPfN3jMvMyTGqim02Jm8hHL?=
 =?us-ascii?Q?3LHeGJA66nwUyziAxq+KD7nCWn76tOP4ghqZjf7Zb7sMW1nTfnVVN8BAoYCw?=
 =?us-ascii?Q?O3JUU0fFXM48+zbfbghjh8u/C9qbuiZO9eKALv9HOi20POwU3LZJxzKoPu39?=
 =?us-ascii?Q?3egSvuBnmH+HnuVw1mcD1qlMWMh8/in/O80X019Y618M9n4hV0bBgIS3uebE?=
 =?us-ascii?Q?661rtvnhTRQjl8fJ59/PwYmv3mYog//SF322g4hEYUjPZzzijJZ6NydmyQ1Y?=
 =?us-ascii?Q?qCITQZ+SUiuhNrwBJKVjZzQ0HuOiUT8iyLBOvNhLKlyZJAwYyY/YVbYlLL/Y?=
 =?us-ascii?Q?xKYY8XCQctNTJaM70s9EKhzl0xHtCkNCx8uzutsUofojJJvtfKQPHYHPw9hK?=
 =?us-ascii?Q?QRs1wePDM5clEAj79DMKn95AyRxiKHdYsq9gJ75qgwRiABpF3uHV3ef+JRKc?=
 =?us-ascii?Q?kKn3vuWqvNfzXVReb5st17T5NvV4sW7BNecfDw0muEz4tBQF6GvSSfyWcSwx?=
 =?us-ascii?Q?SVNNtHjD3iDxZaM4Q1Ea9fLc1wA9pWsXWwqw8YmairVd06xl4fqqCC+P9otl?=
 =?us-ascii?Q?V0gvs3ZBhZvBEsvauy01ygM4ky/RRQHCuTzwBb6KE9qOxe/bWBRtYGgtQMnV?=
 =?us-ascii?Q?9aFSxP7GtQDgwxg39426P+sK4S87TgUt4zupkZtd1j99UbW4uBCwBf33XVR4?=
 =?us-ascii?Q?8WmzEwEPncV95brSFrzTKkZUGHDB4ZlvME45j9xlVC4c5cW+XUNXNFoYYm0T?=
 =?us-ascii?Q?QzX4zxKdOjWD0M78QyXeznJXbgTSeVy7uDMPSKvYwLCEQGGApH9pXinVaGlU?=
 =?us-ascii?Q?rr5iMeCswu7Z1X+nNyZwIF+Y0k4/6vY8h/5XLDZzYrmjkPW83QgL8Ob5oXYt?=
 =?us-ascii?Q?sWWQ+4hUMVCVglsjuaUjc/b8SFK5VHRv5/yx07ulgF+zTAZZ6U28F/bWhhzc?=
 =?us-ascii?Q?+kHCCTpPkDtW7Qyw46cMb14OtK8WmXUwk8SSj4b7SrklkdLQrgHWbBzx8tA8?=
 =?us-ascii?Q?1gGgXWLGwFml7Y1/p9aK9b1QEyv+93Avh/M8PyvuEo8QwTqkmMe3PsNZZcdU?=
 =?us-ascii?Q?ulF+Xhx8cNZM5Iwg9Mn//18hqk0HplMQ6IQ57ZOrjYYL2YdZbmp/CcDiLAYD?=
 =?us-ascii?Q?b08T768phan7BNLubC31b7h1rBm+zN3qzFNlI0QXIi3MFAER5JhevO53NTlg?=
 =?us-ascii?Q?rvxWRA5jXak3NVby9gY8Og6Q/4OPQWfhY80LWYQgrmGRfOq+uIbP3sOWBPZw?=
 =?us-ascii?Q?Yg9cIHWx+VD4XTz5VMoa11igd9LgPv6BLHDqnVp8?=
Content-Type: multipart/alternative;
	boundary="_000_BY1PR03MB79969A02DCCBAB2F9EBD0D24F3D1ABY1PR03MB7996namp_"
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa74a9ab-03d6-423d-8110-08de2c5dea80
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 20:05:01.0412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8va448tkUaJJc1kWz1m9oSmWTK1gftzWg0JFnnshyPkV6K2o2T4PUssMjoo4bUWe3jKxkInA11Uz6rI5TGcN6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8454

--_000_BY1PR03MB79969A02DCCBAB2F9EBD0D24F3D1ABY1PR03MB7996namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry I will pay more attention to the surrounding code in future.
________________________________
From: Andrew Cooper <andrew.cooper@citrix.com>
Sent: 24 November 2025 8:44 PM
To: Kevin Lampis <kevin.lampis@citrix.com>; xen-devel@lists.xenproject.org =
<xen-devel@lists.xenproject.org>
Cc: jbeulich@suse.com <jbeulich@suse.com>; Roger Pau Monne <roger.pau@citri=
x.com>
Subject: Re: [PATCH] x86: Remove x86 prefixed names from cpuinfo for intel.=
c

On 24/11/2025 11:19 am, Kevin Lampis wrote:
> diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
> index 6f71365b7e..5f780fe1aa 100644
> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -86,7 +86,7 @@ static void __init check_memory_type_self_snoop_errata(=
void)
>        if (!boot_cpu_has(X86_FEATURE_SS))
>                return;
>
> -     switch (boot_cpu_data.x86_model) {
> +     switch (boot_cpu_data.model) {
>        case 0x0f: /* Merom */
>        case 0x16: /* Merom L */
>        case 0x17: /* Penryn */

One of the reasons of making these changes is identify the places
needing converting to VFM.  This is one, and...
> @@ -137,10 +137,10 @@ static void __init probe_masking_msrs(void)
>        unsigned int exp_msr_basic, exp_msr_ext, exp_msr_xsave;
>
>        /* Only family 6 supports this feature. */
> -     if (c->x86 !=3D 6)
> +     if (c->family !=3D 6)
>                return;
>
> -     switch (c->x86_model) {
> +     switch (c->model) {

... so is this.

~Andrew

--_000_BY1PR03MB79969A02DCCBAB2F9EBD0D24F3D1ABY1PR03MB7996namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Sorry I will pay more attention to the surrounding code in future.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Andrew Cooper &lt;and=
rew.cooper@citrix.com&gt;<br>
<b>Sent:</b> 24 November 2025 8:44 PM<br>
<b>To:</b> Kevin Lampis &lt;kevin.lampis@citrix.com&gt;; xen-devel@lists.xe=
nproject.org &lt;xen-devel@lists.xenproject.org&gt;<br>
<b>Cc:</b> jbeulich@suse.com &lt;jbeulich@suse.com&gt;; Roger Pau Monne &lt=
;roger.pau@citrix.com&gt;<br>
<b>Subject:</b> Re: [PATCH] x86: Remove x86 prefixed names from cpuinfo for=
 intel.c</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 24/11/2025 11:19 am, Kevin Lampis wrote:<br>
&gt; diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c<br>
&gt; index 6f71365b7e..5f780fe1aa 100644<br>
&gt; --- a/xen/arch/x86/cpu/intel.c<br>
&gt; +++ b/xen/arch/x86/cpu/intel.c<br>
&gt; @@ -86,7 +86,7 @@ static void __init check_memory_type_self_snoop_erra=
ta(void)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!boot_cpu_has(X86_FEATUR=
E_SS))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return;<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; switch (boot_cpu_data.x86_model) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; switch (boot_cpu_data.model) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 0x0f: /* Merom */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 0x16: /* Merom L */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 0x17: /* Penryn */<br>
<br>
One of the reasons of making these changes is identify the places<br>
needing converting to VFM.&nbsp; This is one, and...<br>
&gt; @@ -137,10 +137,10 @@ static void __init probe_masking_msrs(void)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int exp_msr_basic, =
exp_msr_ext, exp_msr_xsave;<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Only family 6 supports th=
is feature. */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (c-&gt;x86 !=3D 6)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (c-&gt;family !=3D 6)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return;<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; switch (c-&gt;x86_model) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; switch (c-&gt;model) {<br>
<br>
... so is this.<br>
<br>
~Andrew<br>
</div>
</span></font></div>
</body>
</html>

--_000_BY1PR03MB79969A02DCCBAB2F9EBD0D24F3D1ABY1PR03MB7996namp_--

