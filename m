Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F9AC4083E
	for <lists+xen-devel@lfdr.de>; Fri, 07 Nov 2025 16:05:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157664.1486367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHO1Q-0007eI-Tc; Fri, 07 Nov 2025 15:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157664.1486367; Fri, 07 Nov 2025 15:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHO1Q-0007Zu-Pg; Fri, 07 Nov 2025 15:05:04 +0000
Received: by outflank-mailman (input) for mailman id 1157664;
 Fri, 07 Nov 2025 15:05:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qRNH=5P=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vHO1P-0007Wa-Tx
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 15:05:04 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2316626e-bbeb-11f0-9d17-b5c5bf9af7f9;
 Fri, 07 Nov 2025 16:05:02 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AM9PR03MB7605.eurprd03.prod.outlook.com (2603:10a6:20b:419::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 15:05:00 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 15:05:00 +0000
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
X-Inumbo-ID: 2316626e-bbeb-11f0-9d17-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YA34QMzvgeR/MSMSF8jh4tPbyd90G5VCOvJHvg2kaa/I0eAOp9XsJrgQBG/aeuVAg5I9oFWknC2drhioC+dv6camMmz6ULvuyPTKEx9WxeNFi1ZSYCuGTy/cDkamhWJVynURC6dWVRVKBA+A7iFG7ByG0O5aSeqWs7LFOIMrkNxQQJBGBmGI+H6BqXkih3Bqz2jrqP5gMFoKdKlWj5g91RCUx+GYPlcHhSQ6C/IoDbiqYefZGgcvPGSnzww0XPu72Mbov6yEHYUAA00gl9gkaQ3PLO4kaRP70MMFQW8NFliohijL0laSySGPgZ+/LWmUoBqPGr9ocb40QYMUb9qN7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+avs39yG5SK8mfCma+H15nY8tDlKMQPGd027kBE3V08=;
 b=um2jmdZpLoF/8tsjwWPjNTPAed9YbYtUcp/y/BWGAIOgQfh09wBzKtTDsezT4ncv8WTDqcFSh5sCM6r+COrZp9O+o9yjNAaiBDX1RFNRhQdppW7OulohqEpbAmuA+BD19LzXj/1UjIdNfd7hXokhCJRXm1PxL9wBpULYpr+TRaEoA1MnAOnpBofSRhJT6PcwI7hVX9HZFC1oQACDQMq1m/RtdDAVyXYEmIrKaYRU1WbdOFsFwdtKVPp3OgQpunug0nvwhOZKAluKuT8BgcwzFbQW1CJ8AnNb67i4PlVXeDHekE/EH/z9xhnlII9ASl4mRLjR4OQ5yRd1AylCj5lBTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+avs39yG5SK8mfCma+H15nY8tDlKMQPGd027kBE3V08=;
 b=E7rEDkO5Xka+JJovUY77Xt80eGYvU3GXTbPEbpJzSTZZFE+RPMcSR+Qwy27xJRohZjvCbZXm8T10PGdxdiGbFXyDsY2SRIVpLabiO630sEHJhLjPgfUihbD410O0FSE4wwvC3R1K7tMDCfBVV0imKkqccV90efTwzSiYSL9AuLGdg63JaBwhQ7EjYhD4JtQ3sCfaZcXtuRxB4r4IfRDo+S+2XWNTTDYkirXaYDW6WyvIF1xZYvDkrCyuin92tSkAAeBIEkGnQyzwe9ZElgcAf7PoZi/WZdGnb4BnDlDgqQT9ha/1srPmIYK+iY9b5XjfSoGlKIXHiJI+mUhS+PqOJQ==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: [XEN][PATCH v2 1/3] x86/hvm: move hvm_shadow_handle_cd() to vmx code
Thread-Topic: [XEN][PATCH v2 1/3] x86/hvm: move hvm_shadow_handle_cd() to vmx
 code
Thread-Index: AQHcT/fjfIdwynHJNUWYN6zFEsAQrQ==
Date: Fri, 7 Nov 2025 15:05:00 +0000
Message-ID: <20251107150456.2965906-2-grygorii_strashko@epam.com>
References: <20251107150456.2965906-1-grygorii_strashko@epam.com>
In-Reply-To: <20251107150456.2965906-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AM9PR03MB7605:EE_
x-ms-office365-filtering-correlation-id: 4b4f7f08-54c4-45f1-538f-08de1e0f05cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?yQLpeaXyF1ms7dYtUSBjr37me8bPFMXijFv/xbojjLJE/6d/91kM6QoXQA?=
 =?iso-8859-1?Q?gFmOQyLdtFj867XDpNWhjwRHI3FKPu+6nqR4l/s+wjp7qET4EAlf/uaRZ8?=
 =?iso-8859-1?Q?r5tVq9Dyvofpl29/fmzCBvgrNexu8MpSMsoFra2dCvJtSFQEQbXdJ3IA3x?=
 =?iso-8859-1?Q?7y32F0gBI4qujABea7FFbl1VFer6/S6iLqyuKHKgByi9CT/AVGmcobqlOy?=
 =?iso-8859-1?Q?TBCCCWMydZIIQErXF1iU2MiNQJibEfNnyTHeRQQoQ1EbIaHinEn1gcXevj?=
 =?iso-8859-1?Q?LfqDgGh8DzBQBlh03HdO1UXRoXQVYbXexZFnfqNTQqI7ME0o8/Ri4qq+Hw?=
 =?iso-8859-1?Q?QU1PsMFgEAbpYVvb9V3rELJav5sBiiF2AVo2OH0SL0YjKqSCPcoZePn4tv?=
 =?iso-8859-1?Q?9BAwPe/KuHhqbRlxSlkNQpbfDHU/Li9YTE9BYGud3yDRrhUe52V5uQeLSe?=
 =?iso-8859-1?Q?qyO9w6WemUpBrDD8NtUNGma/5rzxRTkrSLi7WeQ+6YeMkRu8VOk5eAGDgl?=
 =?iso-8859-1?Q?0E+99Nak8w116cMwzlMXKXd0rBzGu9B/8LuzMWetlu/JCpA6WnjtfT4hN+?=
 =?iso-8859-1?Q?XGrcvrLvJTPnvKUMz6xBN/VLavKfYveuj3NoTgA6RXW2VDSg5qGAHGVm8y?=
 =?iso-8859-1?Q?vmWuwa0dVQUjWKxQ9RQbiYyLMoKsmXolfqOU2SW9fxCYD1TXl0bcs6kqfF?=
 =?iso-8859-1?Q?j4P4lLmnLIXz8dokPsUHeo0otln44STNyFVUdjib0JQ5OXTzfzKc/CT/fs?=
 =?iso-8859-1?Q?8JB/M2iXV2be9B2AqBdITdmev7TGNVd+6or8bR6Bk1YAnRqJGaLbXd56BZ?=
 =?iso-8859-1?Q?ciFHCdDeUdB531bYEnODLTQtZEoctSdFpLgtrorCOXh/wEEmlDKXNu9Fp0?=
 =?iso-8859-1?Q?r0FobRJuDknh1WQD37todUOKhbXymmAesiS7VNNKdgcOw1EtN2iIDpEaG8?=
 =?iso-8859-1?Q?hQDpO75jyJJZKGgeqWT4LcMpMadUviLDf070DfI47Gv7Bz6WgLxTMX/+Ve?=
 =?iso-8859-1?Q?9IvjcqKJkGKpuUSmaWgJutbNJl4GnCKj2IPs/T+6N3RCGy9mu3lgxEDHnf?=
 =?iso-8859-1?Q?aeSMphMsLfJR3GmQOr1CL4IYlJcBJdeHfMYVcBiz7WJrPCak6v57927NcO?=
 =?iso-8859-1?Q?d0XjOt1o9b3Pfn7snd9NUCN21lc+/aosbh8DNjDTggas8mH6x20iSwDrHy?=
 =?iso-8859-1?Q?XSZhAjpjyZXGBo0+6lWL0kKWFAu2FdzkTk7IP5/TfrTE3qJVnqVVAf5bqZ?=
 =?iso-8859-1?Q?Ib/NYjj9v0444pwZc6oTlkpB6WXSNuM2btptGtuBveNcqg7pD4UYt9owWd?=
 =?iso-8859-1?Q?3fQFZ3AxF/wmTG5WVify03GqWO5dtSS+n38hH4lSMrQc7zrjJDdCw9fkGu?=
 =?iso-8859-1?Q?9NGQ/Z6xr8agjHV0B0JloaphjlQP1xz/b4G2J7MlkZtrftlP3211qmudvF?=
 =?iso-8859-1?Q?dS9KCRpR7mp8B0MVS1xS0/yE+CU3c9mX3lC6pDuvtzT2dKBudlVT0P+/Ut?=
 =?iso-8859-1?Q?gVYnDQR034GvhspPUslTrrEzOeMqxgpx/QPwpOYd318WsOjFoQ0xSmfc1I?=
 =?iso-8859-1?Q?ly16kh7iTiPe6t71hn56m5n7daAC?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?FboyO9z46MQzkXuYNbvVOCWjzzvKBNZIj77sxSEGGXF19HTo5cG+MGnNu1?=
 =?iso-8859-1?Q?XtZPLAWa6zw9aBgR5gMqUf0fPp4LIkvxt4hPKegm4XDhLUIXKS8YZGPFAO?=
 =?iso-8859-1?Q?TfzjoVLOFSE5ozezaCUdqoMB754hcezXLK9V5TV2J6f0Xq2vO5+7Gt0og7?=
 =?iso-8859-1?Q?77N8WG99LwZvK954CTNhz5nbY37uwsF47HjCNxB8sl4115K3ayUG+AeCmN?=
 =?iso-8859-1?Q?ZZEzmecgaaOJxsuxVoG09BjNZ3gonM2+un7aXGG7AMuvMjBnfLZefMNnkN?=
 =?iso-8859-1?Q?MVBq/6wlh6sua0fV4HHvtIt4thD0Vp+rZavyBqiiTc53VnPrJ3PI41ql2q?=
 =?iso-8859-1?Q?16rPG6Luk4hNFCMJYmJAbBH98ZL+ojHiz9DgeYLyZt/d7EUunkZcGHMujJ?=
 =?iso-8859-1?Q?oVWnI9bUpxVP6SbXinWwyBjnjKVmQqxg04WpKGrDscmIASWkA7Nv3cjFb+?=
 =?iso-8859-1?Q?TQXmnL4XJToyZbV2N+4EWWeTP0gK5ihyjJ6o3FKMxFMc3UrEE5b+zxSXOT?=
 =?iso-8859-1?Q?FpT70/FJ0o2/Zsx+TUQfXYCcQ0e4hxS9eY0wFT+qb6KSlgVFfzC0bVIDEs?=
 =?iso-8859-1?Q?xy3ViWAscU1I2u1uPNzgtXczlCtJvSPRwcKuMD55uvatvJh8VosLSKo7Jf?=
 =?iso-8859-1?Q?XCnIENTINmRra8vmzxMaEk38GFKPCB+9iVOQiffaE5M23sxByhW0hnLLu7?=
 =?iso-8859-1?Q?ml8txp2ozuzksBxpEbs4RGFgEeApUkXf1It/bN8I1ZhfvLxx4NovShCdx0?=
 =?iso-8859-1?Q?SwP/1bg23y1j9yeRf+BJ0Mw//Zj5ybVXeXCpC2R7hqU1gjF6yN4nxMnqYe?=
 =?iso-8859-1?Q?1WFaigmAULJ2uIVpgLH08DgUYX5/HPi/Pc3fqKT6V1c3JX1rRRNSYBjhKU?=
 =?iso-8859-1?Q?T8jwxpS/U5120EOxRvdXcAY458ID9B2su3IUYjTZZDTvu13xo1g93f33/W?=
 =?iso-8859-1?Q?SyDUXN499RAH/OCNcjDSN5BDYsF42mhay3S+08Hk4y21p0KJ1VqTZfNjPt?=
 =?iso-8859-1?Q?N7UyD3CxvXpiCZDnTw3Qzj0TYvbmiP5BMwANf5gTzqfavoodimiC01MqqR?=
 =?iso-8859-1?Q?YXLI6xIoU9ziRixh478vA89s4RBE++zRo4NBqnfS77eqFIvDwPa6YhQv0E?=
 =?iso-8859-1?Q?PtnjWwDaF9aKLK2e4Apvm7IExlBtBVii0yPRa7YNHSLTgJ8w4bRydVeEkX?=
 =?iso-8859-1?Q?o//SBc6Fo15+HQNSqzR4UqWNzdUL5uREhKr5V0UHRqyk7PNmnC80oqWrWL?=
 =?iso-8859-1?Q?PdUZUksgqI+243Pvj9chxffm0PIvhrQfkfE+Vfvd++cYNHAuUBNaWOXqy0?=
 =?iso-8859-1?Q?FAOQgTdAEgnZFWvfQRnZEb9qCMKpTm8ThwgOiz80QWlnNThDdlFMDS39to?=
 =?iso-8859-1?Q?MDo9kPXcIsK3jzQjoI47jQGfobvaSpH/v1DfPyib4LkeAwrjgxpBSO/p+k?=
 =?iso-8859-1?Q?mHE+tJbuw7RlI63CmFKLaYKpVTd/T9GN2BA7qb67eo/fQCOHKYQs0XIU5N?=
 =?iso-8859-1?Q?PZI2RN1ItfWB8zbRAZiKwxAYKdrAF7OK4N8YSi2A0wKhV6SGJg1MXsnLhR?=
 =?iso-8859-1?Q?B2Y83K5GNNFwEYSuqAuO55SYZAJoF4KaBlCtT8RCs0OcA3Yh4e9rnQAmLj?=
 =?iso-8859-1?Q?0S1FDZvtmXLUd7hhI/csg1/pMrMKkpQZKCocQ/AMIHYZY2PoXrOhUphA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b4f7f08-54c4-45f1-538f-08de1e0f05cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 15:05:00.3744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uuk/r+JUyJNIqjj9opMYhATCbp1glxnJIPrvF5h7nMdZ7sr6BvxhzBIuuwhmatMpxx6SalBcVpV5SNZVELJTJB2f+V91Pgmo5QPby0IgLo0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7605

From: Grygorii Strashko <grygorii_strashko@epam.com>

Functions:
 hvm_shadow_handle_cd()
 hvm_set_uc_mode()
 domain_exit_uc_mode()
are used only by Intel VMX code, so move them to VMX code.

While here:
- minor format change in domain_exit_uc_mode()
- s/(0/1)/(false/true) for bool types
- use "struct domain *" as parameter in hvm_set_uc_mode()
- use "struct domain *d" as local var in hvm_shadow_handle_cd()

No functional changes.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v2:
- use "struct domain *" as parameter in hvm_set_uc_mode()
- use "struct domain *d" as local var in hvm_shadow_handle_cd()
- move code before vmx_handle_cd()

 xen/arch/x86/hvm/hvm.c                 | 58 ------------------------
 xen/arch/x86/hvm/vmx/vmx.c             | 61 ++++++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/support.h |  2 -
 3 files changed, 61 insertions(+), 60 deletions(-)

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
index 6f2cc635e582..d7efd0a73add 100644
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
@@ -1451,6 +1452,66 @@ static int cf_check vmx_get_guest_pat(struct vcpu *v=
, u64 *gpat)
     return 1;
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
+static void hvm_set_uc_mode(struct domain *d, bool is_in_uc_mode)
+{
+    d->arch.hvm.is_in_uc_mode =3D is_in_uc_mode;
+    shadow_blow_tables_per_domain(d);
+}
+
+static void hvm_shadow_handle_cd(struct vcpu *v, unsigned long value)
+{
+    struct domain *d =3D v->domain;
+
+    if ( value & X86_CR0_CD )
+    {
+        /* Entering no fill cache mode. */
+        spin_lock(&d->arch.hvm.uc_lock);
+        v->arch.hvm.cache_mode =3D NO_FILL_CACHE_MODE;
+
+        if ( !d->arch.hvm.is_in_uc_mode )
+        {
+            domain_pause_nosync(d);
+
+            /* Flush physical caches. */
+            flush_all(FLUSH_CACHE_EVICT);
+            hvm_set_uc_mode(d, true);
+
+            domain_unpause(d);
+        }
+        spin_unlock(&d->arch.hvm.uc_lock);
+    }
+    else if ( !(value & X86_CR0_CD) &&
+              (v->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) )
+    {
+        /* Exit from no fill cache mode. */
+        spin_lock(&d->arch.hvm.uc_lock);
+        v->arch.hvm.cache_mode =3D NORMAL_CACHE_MODE;
+
+        if ( domain_exit_uc_mode(v) )
+            hvm_set_uc_mode(d, false);
+
+        spin_unlock(&d->arch.hvm.uc_lock);
+    }
+}
+
 static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
 {
     if ( !paging_mode_hap(v->domain) )
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

