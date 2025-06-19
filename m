Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D145ADFF28
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 09:52:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019774.1396276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSA4C-0001p0-Pu; Thu, 19 Jun 2025 07:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019774.1396276; Thu, 19 Jun 2025 07:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSA4C-0001lw-Mi; Thu, 19 Jun 2025 07:52:12 +0000
Received: by outflank-mailman (input) for mailman id 1019774;
 Thu, 19 Jun 2025 07:52:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xoG=ZC=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uSA4C-0001lq-29
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 07:52:12 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20625.outbound.protection.outlook.com
 [2a01:111:f403:2413::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4de5e4fe-4ce2-11f0-a30c-13f23c93f187;
 Thu, 19 Jun 2025 09:52:10 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 IA0PR12MB7700.namprd12.prod.outlook.com (2603:10b6:208:430::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 07:52:06 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 07:52:06 +0000
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
X-Inumbo-ID: 4de5e4fe-4ce2-11f0-a30c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMXI8aaUINWHVWpNXWFVRd/gzbjzEEEQtGFLleGKreNLaphzYT3W9UMMv2HOPJYxqiJfa+HPheWvF30rrHCczu2LQao8pYzPIY4OZ9jCVHVCQDgPAvQEAG4hAAO3cdBO+9yICrTjkiuRVM86vJi2j7vjaq0+jiiusgrqshNU2VA5513bYCf0AvGP6W3Pn7ifkDlGQWEOhaEPS7tyXwiDrVkUQbgizOYZlD3m8ksB5hWQO+8dy4DQAMG55MKaktxknYcGHmohNj09H+ZBiWwFJvK3qVpxuWJ1xtREVjpNGMoivvUHMaWb1Ltn7SLQPIFTCNZGNulqlIQ6JRNuZn/rGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FiGHkcXSGFGRRShXVoDSJ7totaxv6WoEg6qrDeU4hZI=;
 b=POh5x8PraMUZrSQfv0AddSHVKWQlPR31D7IBoBXtWN2hv/NbVHDS+JQ1XCTCWIYQOB+LPBqCQHhoxgPR6QYWM1IPre37U4m5Zb+mM6sPk4vnmsVSgv+bZ3TlJHAW2v4bz1pzkAldmZFH2pyVoqW5PPmNfajaLu2drPQ84FFaqoVLC67+nEsLz6Sd19cu4i4Cd/toayD98bJpmeHmwRzp5ry7GvtH6VoQhIzYA5+mOjuj8ACFHclVN/wvHZRgFTWdcsKWTSi+JYxR4D6U7mrmU703ZUGj9fp9Zxi6pXIHRR0DHF7AADBJfHeHOtFS27H5AtlNigUPmd10BCnubRlq+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FiGHkcXSGFGRRShXVoDSJ7totaxv6WoEg6qrDeU4hZI=;
 b=g0Jxhxkkx8a81fSveCkd0Fup/C5Oo3weETpNo1jjjZ3sxYVxbHYA/R9v5iKeiuJFf4nslD7YdhVRVwKCU7YnDGYME88i9Ic1K5B5PDko9L+h0TiaA30SiFLRh9GzaHegtAWZ3BX2YlLgkNX0j7/iCnVCkoxCAEFBtLQsTieeOPQ=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, "Andryuk, Jason" <Jason.Andryuk@amd.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Jan Beulich <jbeulich@suse.com>
Subject: RE: [PATCH v4 04/15] xen/cpufreq: refactor cmdline "cpufreq=xxx"
Thread-Topic: [PATCH v4 04/15] xen/cpufreq: refactor cmdline "cpufreq=xxx"
Thread-Index: AQHbrRCkbAdH8T2kS0OlR5huTdSxQbQKgmtQ
Date: Thu, 19 Jun 2025 07:52:05 +0000
Message-ID:
 <DM4PR12MB8451E8D3F2D8E055679A2AEEE17DA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-5-Penny.Zheng@amd.com>
In-Reply-To: <20250414074056.3696888-5-Penny.Zheng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-06-19T07:51:58.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|IA0PR12MB7700:EE_
x-ms-office365-filtering-correlation-id: 58080d38-acbd-4dda-53d7-08ddaf062fa3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?MbBEDmDqXBNzjPPbXT66HzU/eUtZO8eLQ20odXNwrmZcgbCAdVEDh3wR/lTb?=
 =?us-ascii?Q?r87G9UpL1GEeUdYzOOrxwfX4LySzfqLM3m2X59U/WLmDkxd2Ct8NfsaYmIxo?=
 =?us-ascii?Q?qpdJTNS7eDWy5LeLgnoNlHjZGcBtEHEHD9PLt7g1YNboznS/MQ9D69jnD7im?=
 =?us-ascii?Q?90hgdo/33OTlac10TvEjpcM9LgMYfhAfnf48Ip7x/p2xHcUFUnaWZxveK816?=
 =?us-ascii?Q?EU1BZcrgI2v1QTEdF4JeqNumpfkrfMIJb124S58fKJZXS4dCSYbOpjdh+GNv?=
 =?us-ascii?Q?roqfvvblsZPdLbR2K4qxWhpInQoUn01CCAdq4kQZiY6xLdHbBIBf6nyM+Ylh?=
 =?us-ascii?Q?rmhhpUKtsTF6HgQ/5NSqDGmg/FrQwYaH/wbyED3MjNniArVRm0QtxFFwkBma?=
 =?us-ascii?Q?/6jGhPaCAc0IwxE5otRQEB9EyJEYO1/z94WvRV6MacojpUGiehDgysYpVix/?=
 =?us-ascii?Q?QN17TVqPqt8GIg7FyuA8VcmAKI2KK9hfoXKSrhW3pAJA/R+YbRG+KqhEpH72?=
 =?us-ascii?Q?2OFVXQ4pMITQblh5W52BpdLjGUtiJ2jgFQVyiwMA7lGu4zJav4ByZcxvGRd7?=
 =?us-ascii?Q?aH9FSC6GzbAE6s6M/kJsrUEsmEPo5jrxGvG7nm1Bban8qBxMsvlJXNS/+MaJ?=
 =?us-ascii?Q?vWSkkwxbnlKTeGJiNInLt1P0j26PTHXzm7yw053NH3IzSF+4ombbAqecTuqm?=
 =?us-ascii?Q?FEJAHV/RK9nLOkzGqLEKM5e9IABXk1lHfQH8h37ZqyA1vQLepysWxdl7iPyH?=
 =?us-ascii?Q?BOE3TGUIJ7K09EBVH0dQ4h90/v0LQAmlylu9dvmCqHEXej1bV0dPVl+goHxn?=
 =?us-ascii?Q?BqPREaq3b5I/3veC4cthOBrUlBlLuKzCWr+HkW8zp1cY/8P/IdehWjkHFehV?=
 =?us-ascii?Q?j9aQGKSi0CORXYtsL5sH9BTSnFn5NCue/0LxJvke+0VU0tyhiWhFkbscNZGd?=
 =?us-ascii?Q?SD91oX2cyQ5iavwHCyOG0D7c6V4qnXn4JL+wtFTfCeUVs5Wzqpgx52LMlSwn?=
 =?us-ascii?Q?XQqeot7/kgudsFH12lIq933JcWV0dVDzzs659zFKxTG/Hs2bWBxGlYfcDYRR?=
 =?us-ascii?Q?On4iRPjobozSEAaxP9o5Ng6gcrolreuqr5lbRrKTVWsYOJYVPdBTDXCT0/Ts?=
 =?us-ascii?Q?TiDkM61HRlPChPDb9mXyx57bpp1Za3EresGmA3wBWTranDk9qiL5OayfPG9s?=
 =?us-ascii?Q?QFxRM8DjeaZkP/X2B4rFxdMDeYv/98qASngS6ky0IXdOLhmklvgwRlfliqU3?=
 =?us-ascii?Q?wIdaLzPEgR+N7OPjhO7nb7mqWZF9IuSjTtDAhGgQo9cdODKJM92Vm4t8ZUsX?=
 =?us-ascii?Q?CUavPSN+w22A2eK5ha90DjsSqHK17QOSWw494CQKAl4xV0O+ZuMvo/Xeel/8?=
 =?us-ascii?Q?HE4nRfELp/KKVCUX3BNDXfAaSUiue5LDcr4Ms+pET6p5LpZ7isTk13JbzIWR?=
 =?us-ascii?Q?aHZvAn7j11ctOeIDtDZFPAZ3CoULL0Y50bOr3Meb1Cyam7iHdYvNIzK9XCGI?=
 =?us-ascii?Q?1mxPZVvMuw0KnEA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?PdClTdNVDze5iRxob/ihaByLm4FaPmtrReGHP11yiM+uBwzR07L357mu8rnO?=
 =?us-ascii?Q?faZ4JsOP1qz6Kd+gxlndryf/pE8xZD94J1TcEXKi58OK5bnRibOrgAxYRBJo?=
 =?us-ascii?Q?h7880plrtiUU7KCo/DdeXbGXawjvvssr4Y4cGFY+RuV8qkyjffg8h2gD2yr2?=
 =?us-ascii?Q?95uvGRGIlyzciPYLCsauLWeO5aZLeaaSFfnmOdrbqXZTAsJYQWCs5Jd9CicK?=
 =?us-ascii?Q?G4a9swyxKtvImT4niU94HOqnt9RdhxN3AA+Q3GmjJOgPf+ykBghsb6lUkx6n?=
 =?us-ascii?Q?t4vjnWw59ILQkA2+NWfZxore6NnO9DABqyD7nbnuSR3qWg3nJe2i8UhkmgB2?=
 =?us-ascii?Q?fngHizv+P2CdTAtG+/+m17RGeckPRLnDsQf0oQx5ecgRr56ua+Y6I4e2vCj1?=
 =?us-ascii?Q?OrdzOCPRAUxCS3skQs9dE1AAbt/aMpIPu7vPCBCEdHGRsN/+dUU9gG20ehy2?=
 =?us-ascii?Q?oqe5C/kpxNY3ZxyDTdwtn1Ghbe1H/BzZ1uiJDvUC8xUYnkJUZoXD1YYWfxW4?=
 =?us-ascii?Q?EbWTQlBvuhJnjdJWomAbTVzrFyYXr1eaIZeJn7UE9Ndmy2lC1p6x/srjoAGW?=
 =?us-ascii?Q?f1aaOdppBuNGt4MmR9+OcMXJZLXaxMVpVqRIk41ftpYEyQn+Y3Bp9H10q9TX?=
 =?us-ascii?Q?WBdcLmXHmFN7zpLz/7FOtqlbsIrKSsF80KGRm+5dlThk5/vC2OWTFXZ5FJEu?=
 =?us-ascii?Q?BdFSIUYjPz0uSBo7sKOiVJwN0oNCtsOqeRcbC6+UsehFA2pCf6rtOpf0D/yp?=
 =?us-ascii?Q?PYJLAOBRX5OLuO7JmAAGvQts8Bb9ujY5ctaWrT0dL10HPac4WBM5dawp5wb2?=
 =?us-ascii?Q?lOVW3BI8wIskoewm/1mHtWgGBiG2ZFKQK+C+nbWkxoXbH0ej5911YanJKT1G?=
 =?us-ascii?Q?uZ9MDnFsruvxBEMjDHYitcRjOVsSk+1VBQUimqV4pdScoxfDjjUULQgPB6RN?=
 =?us-ascii?Q?izSv3O7Nzxxg5XM9nRvIxa77TCQ1GDm7mC1cOfpKEH63C++2BqJFiEV4ZCX3?=
 =?us-ascii?Q?kMrE7IqCLJQYTHwRNqNzxx+Zw5LCOAUTr3vP9sqT6gI703NO2mg5hKkUZunn?=
 =?us-ascii?Q?nbpYM5R19MUX72SpGJgNVD4jtjZo557ta7i9HlbK5qYSafPMy8HUDTsuEzAI?=
 =?us-ascii?Q?BIg04VgbHNK1o6q66jdX89tIYIQc/HHzpFSGXhkHwO2FLaucJGGzu1h0sWuD?=
 =?us-ascii?Q?AlafNqlDEi77YjadQTkxomcSYZSGnaYGBAshMe+ksvhO4qOGXjAr5+o8pE+i?=
 =?us-ascii?Q?uF1Ss6b6OIwMAVCwBNEczF26v9hks4jixSM/7gpOZmyX5y1WQFlGSPGVq/6s?=
 =?us-ascii?Q?A9io2uCLbPM5tdT/R/N2kQz76QfYmSb1dMc4Dv91lKdSiN8I9/ASiPcNqVCT?=
 =?us-ascii?Q?0NsZyD5f+WLT3TQQwVfS8OD4+aIvxqf/sC0/liRzBukaKwKI9t/4EsywhonS?=
 =?us-ascii?Q?2Vj8nfGFXdvAjxM4TIti74cOLDGJtzl5Y4rDH8L6MNIjaV3+73g+3xJ2w1+w?=
 =?us-ascii?Q?Vt0MFZmiTHvZEiGPcjjxssUkxAwy3+URKeH3Dnp1GJcQJN6MsqlOOqCCVxE7?=
 =?us-ascii?Q?AD9XBcC/CkHyCRccR7k=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58080d38-acbd-4dda-53d7-08ddaf062fa3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 07:52:06.0040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V+3Jrc2CgHNW0q4AqsgLJJnXTPkZ+m/QLGazRxmZS+xEPWFHxklFOD/qCMCh1kyeCTlwjkt7xgr4xgfAL5NoiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7700

[Public]

> -----Original Message-----
> From: Penny, Zheng <penny.zheng@amd.com>
> Sent: Monday, April 14, 2025 3:41 PM
> To: xen-devel@lists.xenproject.org
> Cc: Huang, Ray <Ray.Huang@amd.com>; Penny, Zheng
> <penny.zheng@amd.com>; Jan Beulich <jbeulich@suse.com>
> Subject: [PATCH v4 04/15] xen/cpufreq: refactor cmdline "cpufreq=3Dxxx"
>
> A helper function handle_cpufreq_cmdline() is introduced to tidy differen=
t handling
> pathes.
> We also add a new helper cpufreq_opts_contain() to ignore and warn user r=
edundant
> setting, like "cpufreq=3Dhwp;hwp;xen"
>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v2 -> v3:
> - new commit
> ---
> v3 -> v4:
> - add one single helper to do the tidy work
> - ignore and warn user redundant setting
> ---
>  xen/drivers/cpufreq/cpufreq.c | 53 +++++++++++++++++++++++++++++------
>  1 file changed, 45 insertions(+), 8 deletions(-)
>
> diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.=
c index
> e01acc0c2d..79c6444116 100644
> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -71,6 +71,49 @@ unsigned int __initdata cpufreq_xen_cnt =3D 1;
>
>  static int __init cpufreq_cmdline_parse(const char *s, const char *e);
>
> +static bool __init cpufreq_opts_contain(enum cpufreq_xen_opt option) {
> +    unsigned int count =3D cpufreq_xen_cnt;
> +
> +    while ( count )
> +    {
> +        if ( cpufreq_xen_opts[--count] =3D=3D option )
> +            return true;
> +    }
> +
> +    return false;
> +}
> +
> +static int __init handle_cpufreq_cmdline(enum cpufreq_xen_opt option) {
> +    int ret =3D 0;
> +
> +    if ( cpufreq_opts_contain(option) )
> +    {
> +        const char *cpufreq_opts_str[] =3D { "CPUFREQ_xen", "CPUFREQ_hwp=
"
> + };
> +
> +        printk(XENLOG_WARNING
> +               "Duplicate cpufreq driver option: %s",
> +               cpufreq_opts_str[option - 1]);
> +        return 0;
> +    }
> +
> +    cpufreq_controller =3D FREQCTL_xen;
> +    cpufreq_xen_opts[cpufreq_xen_cnt++] =3D option;
> +    switch ( option )
> +    {
> +    case CPUFREQ_hwp:
> +    case CPUFREQ_xen:
> +        xen_processor_pmbits |=3D XEN_PROCESSOR_PM_PX;
> +        break;
> +    default:
> +        ret =3D -EINVAL;

I'm thinking since handle_cpufreq_cmdline() is totally internal and has ver=
y few caller, maybe  ASSERT_UNREACHABLE() is more suitable. Then the functi=
on itself could become void return.

> +        break;
> +    }
> +
> +    return ret;
> +}
> +
>  static int __init cf_check setup_cpufreq_option(const char *str)  {
>      const char *arg =3D strpbrk(str, ",:;"); @@ -114,20 +157,14 @@ stati=
c int __init
> cf_check setup_cpufreq_option(const char *str)
>
>          if ( choice > 0 || !cmdline_strcmp(str, "xen") )
>          {
> -            xen_processor_pmbits |=3D XEN_PROCESSOR_PM_PX;
> -            cpufreq_controller =3D FREQCTL_xen;
> -            cpufreq_xen_opts[cpufreq_xen_cnt++] =3D CPUFREQ_xen;
> -            ret =3D 0;
> +            ret =3D handle_cpufreq_cmdline(CPUFREQ_xen);
>              if ( arg[0] && arg[1] )
>                  ret =3D cpufreq_cmdline_parse(arg + 1, end);
>          }
>          else if ( IS_ENABLED(CONFIG_INTEL) && choice < 0 &&
>                    !cmdline_strcmp(str, "hwp") )
>          {
> -            xen_processor_pmbits |=3D XEN_PROCESSOR_PM_PX;
> -            cpufreq_controller =3D FREQCTL_xen;
> -            cpufreq_xen_opts[cpufreq_xen_cnt++] =3D CPUFREQ_hwp;
> -            ret =3D 0;
> +            ret =3D handle_cpufreq_cmdline(CPUFREQ_hwp);
>              if ( arg[0] && arg[1] )
>                  ret =3D hwp_cmdline_parse(arg + 1, end);
>          }
> --
> 2.34.1


