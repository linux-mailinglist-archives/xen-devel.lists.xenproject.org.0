Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1ACC1DD47
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 00:55:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153175.1483620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEG0N-0002Qs-7h; Wed, 29 Oct 2025 23:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153175.1483620; Wed, 29 Oct 2025 23:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEG0N-0002OT-1H; Wed, 29 Oct 2025 23:55:03 +0000
Received: by outflank-mailman (input) for mailman id 1153175;
 Wed, 29 Oct 2025 23:55:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xz0O=5G=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vEG0L-0002OI-KH
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 23:55:01 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acc052ea-b522-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 00:54:58 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by VI1PR03MB6336.eurprd03.prod.outlook.com (2603:10a6:800:139::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Wed, 29 Oct
 2025 23:54:54 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 23:54:54 +0000
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
X-Inumbo-ID: acc052ea-b522-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GGm/VnwN1w6Va50pKrafDr9sNb5YZzDOgVNFBpu/DE9I9F2BqJdyOFamC01YT3BsPye/h5lSSCzs2L41d7f0LVcyk31ETqgKbXNNG5yowHnvcGRKzUdMwzw3lvPzO41BNlKcNg+RVUoza13e6mvRe4uKPto8QlD+IWfz0FlalwuUpcmEXcJfPrltt9Hh/vWp8ILd2UAGXO5lb5+/8+5fLcUvcT1GA4CqPcmqu6NIS/6qnMir+5HoUOCFXZ1HntsnxBzfKhQahFEqtdgDgoYpv2SrjH+dSEI33HvgUD608L/dQKlTVhDU39pu45ZudPgqaqf9MC94s1cCr9Hw8sDrpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vYktPG7/nwlYkKa2a3rArYpths8kX5Wcbe3ZIUmiVQ=;
 b=rmG11KwCxQvKcuryZKT3aPnqjIqJUDg8K6mbTLUDE3/2iQj0nGhDew+u77Qzl9a9uSMKnAxEPSvYDWeMEajF/wLxHRgGLS28d1szPQV4j1cclWOPB347f6tBNVbCKziPbXGFpi5MfJay6Z8gUtq6ShOvdTVxC8I1mpgoU5L70aLrTeVvX0VK0RZiFNUTPYlOp2QwGszvY3teYjgEPvjEfljKqP36/WPj5zcv8EBcepLYdARxhGQw0Ka9LJG+CdUpH5Ev9j2CPIzsLI459hl/2HKGLHw0yZN3wGGyBy1TjpQ71eCnG54JnWaf5excCxpcYquhyYjBwsO0leOIGBqWRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vYktPG7/nwlYkKa2a3rArYpths8kX5Wcbe3ZIUmiVQ=;
 b=JzHBiYXvBWUo5ZbEo66agvO2iZnmN1nOAm4qr024GVaZgr26Oz90/UepgMb/YztEFXGFWelzISHm6eUFPvILGB1rkMoPNyaT6M1XiTZ1RsO4yU61p7uxMq8RuCLLmxwrXY/GX9T6ZoL71mnqmkacLORMl0McSi6YUiU7ppffNDQ6rpIv1rRfXqrwYCy0aMwED9bQnmukvaGQj6ye1SV7HqoO0RF7NWcmGNLfGHVSjc7JOGtjPyobiYop4vpg+zs68Otjkf5Zy4eSGhIu46A6lyS2qaXcdqAhOTV0IOqQv3b5BuB5j5m87ALjYYTKcuQVC52zpemnmcgleBObGHH8Nw==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: [XEN][PATCH 1/3] x86/hvm: move hvm_shadow_handle_cd() in vmx code
Thread-Topic: [XEN][PATCH 1/3] x86/hvm: move hvm_shadow_handle_cd() in vmx
 code
Thread-Index: AQHcSS9r8alwr4OxGUujyvJHVPESBQ==
Date: Wed, 29 Oct 2025 23:54:53 +0000
Message-ID: <20251029235448.602380-2-grygorii_strashko@epam.com>
References: <20251029235448.602380-1-grygorii_strashko@epam.com>
In-Reply-To: <20251029235448.602380-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|VI1PR03MB6336:EE_
x-ms-office365-filtering-correlation-id: 1a5bce11-9fd7-4abb-170e-08de17468ee1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?LZeFzNsaIJBoTCOXegExubkfkRYB6Y/smCTVvsOwLmV/FUDwzcG9eQ+r8Q?=
 =?iso-8859-1?Q?Yyg2udo3sOMWpGanOmriJdWwbmu+guNea9qqjl5PJF7iOKb7grSADzZ3+8?=
 =?iso-8859-1?Q?eXWLJbToX/hVJKatVlduZ+XE9c/9XbTcwTi1u74+NlTmjbHezpBo3xQ2cF?=
 =?iso-8859-1?Q?FPO9MYkzAHENL0WvQnqvWgtw2fDdV19Jj53KiLKY1wBaWXHw93X/p+JFyP?=
 =?iso-8859-1?Q?VpjWgsAoOPtLt7Mu8CaXsHpAlen+PNqbUWztRxucRcNhjj32c4l6f+HppO?=
 =?iso-8859-1?Q?0rVCKcxzgoWOOWXWiqyN8OLYIf6z0Q+v5cMI5PRMUhhUZudqaqav5Jrs0d?=
 =?iso-8859-1?Q?udGswAYl61Os9pYh2u53/mtfyGnnxW7wnv/kpfn+6dS9hj/0bM/V/AKtUr?=
 =?iso-8859-1?Q?N+0ZcTg586wUXOtbeQLAX5T6vkCDg4dGBycHf5zgHpKyRWmvVffmCdYJJh?=
 =?iso-8859-1?Q?ZFo6pgE5CxR/pBTtvLPOsK+hkcM3EnpR+z03ZpSX6ztbrtXrfh/GjijBY5?=
 =?iso-8859-1?Q?uBm6J9DTcLikR/IkX9yT61BV9mKp54pqns+eZmnpHy+2/uta+utV9f2kLc?=
 =?iso-8859-1?Q?vK88VnEv+Qb3VZJDn4LRvKnfYpQ2wjE6jwVoLCsQNQB3oNI+SxNildcG2e?=
 =?iso-8859-1?Q?75A6QWWYgBZ65Z3bXpgKRWjXqW2jSiwUqiB/KwCcUcTaONDAYz0uBk0FJw?=
 =?iso-8859-1?Q?v3iYWGvcqtQzKWFd9hM5ADFQvaV5Lk5mnC9voO33iKVtZAA+qCmT4BIzOa?=
 =?iso-8859-1?Q?0goZ1AIBO+Q5D+rdIpifvpQRYL5Od0UVGS532llWowxlZajxtNVNal9hHq?=
 =?iso-8859-1?Q?sl5UOugXUES2YHIwUPk0xRgSNRtXh9fWz+cYgRHnvw/jfOu25zOopU6K+0?=
 =?iso-8859-1?Q?iVz1kpG1nVMdc2nlFhWo4PC0ToMn9/Wwa67fypCQtJM86MZ/EJrUL2/Z5a?=
 =?iso-8859-1?Q?fwP6WU3e/qOzSUDx+ZKEZOK21nO9rnX3YMuL/QFIVLDYBCCN+dzvek9tlj?=
 =?iso-8859-1?Q?1QvGTUlkY6r8tP2VcmO4VgJW6e17cK0doi57/6olP/KfO8EI1eDGeJds7g?=
 =?iso-8859-1?Q?49Z78y68++6xoQkaELXJHVtBnCYWhBPYjcQnfkhSNqh3TlPSg54Ioajk8H?=
 =?iso-8859-1?Q?uPHGhHEYh/0iN91+ED2yk0JyKNuyXGuRSWK4ILoOSIl+I/fkjWvTW07pMD?=
 =?iso-8859-1?Q?+rucJ7asMwfmvmAJp2zBpNonSLjP8N5hEBhwiypnkNHyWUJNk2O1k13x+n?=
 =?iso-8859-1?Q?N4LtVHg/A95mUlvav5JHyCdpM62EsJWEToH1PmpxOVqcPYsviEJ0nb3x+R?=
 =?iso-8859-1?Q?Xlxqb1SeKvzh5qJr+7FqzneUB+F5Uqklw0i/v/Ix/sRA7ihpjfSMeMmZ6f?=
 =?iso-8859-1?Q?9kx8y3OObd7WVpTAyMy8vIZhFg27IWbr9YqK3tCXkaO45LKKhmFhhfvxCm?=
 =?iso-8859-1?Q?PvZ37h/vamV9cwHlRCEH0RAMG782TR6XcZBHArjuEvSZHeSkWyeXQz+pK6?=
 =?iso-8859-1?Q?9dZTsJVxbmP+HFnhYVQJE7O8YU8CNfKOp+oHAxAUGlpW4Lnk/MUL3dekPF?=
 =?iso-8859-1?Q?m0VF5YSnIdY1JtZWYTtuwjglTaSX?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Ws/0G7uhLmatR0H3p3bduVLyWgoGXhlgqeYjoGPVMqRKk6Uk2FM9VldUT/?=
 =?iso-8859-1?Q?NpPH2LO+GBx9VP8u/CWwgBDGkRyqY7YqBL5SvHHsUXxv5rQXcKttx7+FTD?=
 =?iso-8859-1?Q?JLVY6X5DbRJNti7i5cvMkSHaa4fNLgRaqbFLosk5n6MyoiZp4Dlfe5bPjY?=
 =?iso-8859-1?Q?uP74OaNVOQLzY2B0DEJPJ+9RAnAOmu6im36il5uteF8zyLISyM5xm3OkqB?=
 =?iso-8859-1?Q?nOEBY5D6bWzHB1adK+9Bh4gZje4SeK2tf0ietW2ji9bsYSyQD6O3sQ22Dj?=
 =?iso-8859-1?Q?oUBHEV14ckzSNmEMvtdPMjLlDiuVHFl31UvACKGvxv9QUZqcf/26b8vw6U?=
 =?iso-8859-1?Q?LdjP3FUgmxVzOOoYte97jdDptZP6P//Ax4GTmkHHNKInvb8cB8jJxvnsV0?=
 =?iso-8859-1?Q?H3YU4BJgwf1VjYCdhQIieV4UnUWe0lT0+1xuD/naf/5syawmDdsKQlMPJy?=
 =?iso-8859-1?Q?rkjcAPOMmp1B5/gLuAJTT9fFx9yEHlSB40S1blqdkcGaOteXuWIucJRY0m?=
 =?iso-8859-1?Q?hTBbPN8MKt9EUlrZQyRACLZW2uj3pSA85p5wL5rAHygFtT4wteqFa+16sS?=
 =?iso-8859-1?Q?GOQ6VOK8lvtbv+af4G4S4Quk3mjUGnM0Wp9NTQiMLCxlr5qWAGXxDzg628?=
 =?iso-8859-1?Q?1UjINW4WgGu2GtlB4uv8yYEq3vjmtUWmyMP2uTv+wJNZthMrxLXy/Z58Jt?=
 =?iso-8859-1?Q?+w8fgHKzbxtUN78FSxvTstcRMh+RjAVbBxBem/s+4Mfw9RqA1zDxgyNAlL?=
 =?iso-8859-1?Q?FohgdPBKBYMp3G5409i4Gpa+ZQVS5WIOLCj2Sjo2yEeo1WWyV3yxGgQlKP?=
 =?iso-8859-1?Q?ZdV8WRaY8+G++ArDOB3wUe/VIQWtwyXWDFq/snfwPVH+fI/Av9bv5MKREq?=
 =?iso-8859-1?Q?xSGcHeU8ErG/obsLJYB37EESE+hmxYffyqdVYfb/omRyUJITaV95ta7Ard?=
 =?iso-8859-1?Q?qfwLLPcHt9EvsGee4Kjg7Zuz/B5m84/aufE/v1YJi8Uz8rmM81PdesvWhq?=
 =?iso-8859-1?Q?IbBo913eCy0Fe5KHt5XiK8HBP6sqbDJyQ9/wpRLAdlcV043kNxi5AudZPi?=
 =?iso-8859-1?Q?Y4pbruUgEZm0kA2scI6FXV4rIqSzPYhODf0wv+xwN/9XKM6NQWFq15UBoP?=
 =?iso-8859-1?Q?Mhkg/B45qZcRJhCmTXn35Aw0e5RQ5vA4Y/Z0S1XgXXaawjjsMRttkYPR4S?=
 =?iso-8859-1?Q?2nOx9cS8IZT5clGzpKoP/WoX/IyiNClxSsJ8rgaMwwcmUvkJ+I/xZ9SS2N?=
 =?iso-8859-1?Q?VAECC3RQ9NHf9keeWUyr7YFRS6L7IS36VmMuzmACMFT6MC+omobgb8PYFK?=
 =?iso-8859-1?Q?PzUqmMZCr+4jPBWvt+wBfMM/leaVYfygOEr5/YaDAtwRGWTofrJDBDKjKI?=
 =?iso-8859-1?Q?UONJeDw4XtJzu/j7XKLmG7mqbpJVPHptSlB5SIpySBpaKOCgs4W6+KUnQs?=
 =?iso-8859-1?Q?jgciKz4/6KVXxoV4HMvCag4RQnnp91AkDgr2U2HGZybVqBNa2DLGRgbr8v?=
 =?iso-8859-1?Q?ZF5bEd1IFRI0Fol3YiXubvQ6o/CL6ge9PTIeE/xpVgHZOtBZiCtbhzshN8?=
 =?iso-8859-1?Q?ivojMECJ6WGMLmFi7sHK26YNt64KleAquqEqb/v325mmua7HY+s0vFG7Rf?=
 =?iso-8859-1?Q?V3dWpO82FZGgstS5e8xVemeJnxT3G7eDGtpkp3HlKx+R/sWBlG8bl0XvwH?=
 =?iso-8859-1?Q?mxmxWK5oQIEb7Da6xYY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a5bce11-9fd7-4abb-170e-08de17468ee1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2025 23:54:53.2748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zstcxumgJ31Jq1/dtwdKZZJyRoluiBAQksEiK4hJ/U/tpNQXQ0Gf+BPuZDYb/KoTylGLbO/pCpOofSO4aRZNNnjKiphHV7DxxAoOxUTYJh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6336

From: Grygorii Strashko <grygorii_strashko@epam.com>

Functions:
 hvm_shadow_handle_cd()
 hvm_set_uc_mode()
 domain_exit_uc_mode()
are used only by Intel VMX code, so move them in VMX code.

While here:
- minor format change in domain_exit_uc_mode()
- s/(0/1)/(false/true) for bool types

No functional changes.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/x86/hvm/hvm.c                 | 58 -------------------------
 xen/arch/x86/hvm/vmx/vmx.c             | 59 ++++++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/support.h |  2 -
 3 files changed, 59 insertions(+), 60 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index da3cde1ff0e6..9caca93e5f56 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2168,30 +2168,6 @@ int hvm_set_efer(uint64_t value)
     return X86EMUL_OKAY;
 }
=20
-/* Exit UC mode only if all VCPUs agree on MTRR/PAT and are not in no_fill=
. */
-static bool domain_exit_uc_mode(struct vcpu *v)
-{
-    struct domain *d =3D v->domain;
-    struct vcpu *vs;
-
-    for_each_vcpu ( d, vs )
-    {
-        if ( (vs =3D=3D v) || !vs->is_initialised )
-            continue;
-        if ( (vs->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) ||
-             mtrr_pat_not_equal(vs, v) )
-            return 0;
-    }
-
-    return 1;
-}
-
-static void hvm_set_uc_mode(struct vcpu *v, bool is_in_uc_mode)
-{
-    v->domain->arch.hvm.is_in_uc_mode =3D is_in_uc_mode;
-    shadow_blow_tables_per_domain(v->domain);
-}
-
 int hvm_mov_to_cr(unsigned int cr, unsigned int gpr)
 {
     struct vcpu *curr =3D current;
@@ -2273,40 +2249,6 @@ int hvm_mov_from_cr(unsigned int cr, unsigned int gp=
r)
     return X86EMUL_UNHANDLEABLE;
 }
=20
-void hvm_shadow_handle_cd(struct vcpu *v, unsigned long value)
-{
-    if ( value & X86_CR0_CD )
-    {
-        /* Entering no fill cache mode. */
-        spin_lock(&v->domain->arch.hvm.uc_lock);
-        v->arch.hvm.cache_mode =3D NO_FILL_CACHE_MODE;
-
-        if ( !v->domain->arch.hvm.is_in_uc_mode )
-        {
-            domain_pause_nosync(v->domain);
-
-            /* Flush physical caches. */
-            flush_all(FLUSH_CACHE_EVICT);
-            hvm_set_uc_mode(v, 1);
-
-            domain_unpause(v->domain);
-        }
-        spin_unlock(&v->domain->arch.hvm.uc_lock);
-    }
-    else if ( !(value & X86_CR0_CD) &&
-              (v->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) )
-    {
-        /* Exit from no fill cache mode. */
-        spin_lock(&v->domain->arch.hvm.uc_lock);
-        v->arch.hvm.cache_mode =3D NORMAL_CACHE_MODE;
-
-        if ( domain_exit_uc_mode(v) )
-            hvm_set_uc_mode(v, 0);
-
-        spin_unlock(&v->domain->arch.hvm.uc_lock);
-    }
-}
-
 static void hvm_update_cr(struct vcpu *v, unsigned int cr, unsigned long v=
alue)
 {
     v->arch.hvm.guest_cr[cr] =3D value;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index e2b5077654ef..a7ee0519957a 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -44,6 +44,7 @@
 #include <asm/processor.h>
 #include <asm/prot-key.h>
 #include <asm/regs.h>
+#include <asm/shadow.h>
 #include <asm/spec_ctrl.h>
 #include <asm/stubs.h>
 #include <asm/x86_emulate.h>
@@ -1421,6 +1422,64 @@ static void cf_check vmx_set_segment_register(
     vmx_vmcs_exit(v);
 }
=20
+/* Exit UC mode only if all VCPUs agree on MTRR/PAT and are not in no_fill=
. */
+static bool domain_exit_uc_mode(struct vcpu *v)
+{
+    struct domain *d =3D v->domain;
+    struct vcpu *vs;
+
+    for_each_vcpu(d, vs)
+    {
+        if ( (vs =3D=3D v) || !vs->is_initialised )
+            continue;
+        if ( (vs->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) ||
+             mtrr_pat_not_equal(vs, v) )
+            return false;
+    }
+
+    return true;
+}
+
+static void hvm_set_uc_mode(struct vcpu *v, bool is_in_uc_mode)
+{
+    v->domain->arch.hvm.is_in_uc_mode =3D is_in_uc_mode;
+    shadow_blow_tables_per_domain(v->domain);
+}
+
+static void hvm_shadow_handle_cd(struct vcpu *v, unsigned long value)
+{
+    if ( value & X86_CR0_CD )
+    {
+        /* Entering no fill cache mode. */
+        spin_lock(&v->domain->arch.hvm.uc_lock);
+        v->arch.hvm.cache_mode =3D NO_FILL_CACHE_MODE;
+
+        if ( !v->domain->arch.hvm.is_in_uc_mode )
+        {
+            domain_pause_nosync(v->domain);
+
+            /* Flush physical caches. */
+            flush_all(FLUSH_CACHE_EVICT);
+            hvm_set_uc_mode(v, true);
+
+            domain_unpause(v->domain);
+        }
+        spin_unlock(&v->domain->arch.hvm.uc_lock);
+    }
+    else if ( !(value & X86_CR0_CD) &&
+              (v->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) )
+    {
+        /* Exit from no fill cache mode. */
+        spin_lock(&v->domain->arch.hvm.uc_lock);
+        v->arch.hvm.cache_mode =3D NORMAL_CACHE_MODE;
+
+        if ( domain_exit_uc_mode(v) )
+            hvm_set_uc_mode(v, false);
+
+        spin_unlock(&v->domain->arch.hvm.uc_lock);
+    }
+}
+
 static int cf_check vmx_set_guest_pat(struct vcpu *v, u64 gpat)
 {
     if ( !paging_mode_hap(v->domain) ||
diff --git a/xen/arch/x86/include/asm/hvm/support.h b/xen/arch/x86/include/=
asm/hvm/support.h
index 2a7ba36af06f..9e9fa6295567 100644
--- a/xen/arch/x86/include/asm/hvm/support.h
+++ b/xen/arch/x86/include/asm/hvm/support.h
@@ -119,8 +119,6 @@ void hvm_rdtsc_intercept(struct cpu_user_regs *regs);
=20
 int __must_check hvm_handle_xsetbv(u32 index, u64 new_bv);
=20
-void hvm_shadow_handle_cd(struct vcpu *v, unsigned long value);
-
 /*
  * These functions all return X86EMUL return codes.  For hvm_set_*(), the
  * caller is responsible for injecting #GP[0] if X86EMUL_EXCEPTION is
--=20
2.34.1

