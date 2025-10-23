Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C24C0210A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 17:19:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149296.1480968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBx5p-0004Nu-EW; Thu, 23 Oct 2025 15:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149296.1480968; Thu, 23 Oct 2025 15:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBx5p-0004MM-Bl; Thu, 23 Oct 2025 15:19:09 +0000
Received: by outflank-mailman (input) for mailman id 1149296;
 Thu, 23 Oct 2025 15:19:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5hDG=5A=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vBx5n-00047y-9U
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 15:19:07 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9dc24293-b023-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 17:19:06 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PAVPR03MB9678.eurprd03.prod.outlook.com (2603:10a6:102:318::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 15:19:04 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 15:19:04 +0000
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
X-Inumbo-ID: 9dc24293-b023-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Np3/vy5mZPiLFmy3hQcdffICSiS57VGjxPUsy/a76mhXW1KDxt/ABoo90b7jcGGo1Qw9REW7BSn502HmXCa9M+mjUqtPrZSJrlyD0mYAVCul2kLv6Xop/QSJ/RuA8cD76lJScui/FLahmeRIaay4vFNQF8EpL88Cua6nTDqVP0oBNwAyJ9Mf35QMb+BO4Irve2K22Qd0RTCz5KZOE00LrU4/QpNOqnBUQYhUTmwwl1uW0uhRpSYgZVPeAYxWmHkP5fggdZrx+rZbk+ij3kubRoncLbSiLLEtJegJaeBZ5kO98XFoJcGrMHRtDJEUCZvDZlmOc6R4zTlIhEpA4I37aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lf4vObzCaBm4wdgjFD62T5/q8tMdWMcoYac2NfD3EFM=;
 b=aS/Es6m5L4fHjD60HQC1L8ohzHPEMRrA6TcrsZRYCFLvVN0wHiof+WP93KiHJJw/ojrGS6gy37k68cm9Qbx6ydp9i95+3YIVjra5+/VA7vqUMbNVWRj4dkapCxSiiljP6d6p/A4QaJHpS2Cn8pneY9RGaXcdm4pIQt5cYgU0xGzU4ih+YdcjYh7jN5a4gIB13G8iWWnllYXXLHvX7TRut/jcRqlqSrDeNKOEngQKmp2Uu3BHHyxDwiYpPiWrPDXyRE2NCcqK+PxIsZbndhgc12AAGpyAJDHs0eRxY/0e1WvxFbu8SjafGiIYF4kSM5pnrGSj1btVZBgOx4uP6agnYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lf4vObzCaBm4wdgjFD62T5/q8tMdWMcoYac2NfD3EFM=;
 b=S/BifJ//4Z5MkV1nrk0U6XDVD0k7fOgob1lI9KikYRQjbGoSIO0BKROBomjsqBsv+OZzTQcmW40xaUGRiNy2SHkurhKlQrPSi9Fz5oVehCHPgg9N+RvOKNgt9ZzukTqWae0jEGIMZa6kDTvpD5qEfIKd0u0tX3FZpxiljgUi3jwyqVw7dIfmRm5AG3lp4jxQWTQbJ0vWMdYFmduukSrjgb1krMYaT9QCWcjZTX8vvDE4nzBP6WrxWV0eaxCNoQvSZXVGH9TZjLR/QTpw38QQXM7nTAP780CKIaL3/BNWZyUtIJq5EXeH6Ltgqea7u8/BQ4dGQS2aU5Wnpg0wGuXdnw==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [XEN][PATCH] x86/hvm: move hvm_shadow_handle_cd() under
 CONFIG_INTEL_VMX ifdef
Thread-Topic: [XEN][PATCH] x86/hvm: move hvm_shadow_handle_cd() under
 CONFIG_INTEL_VMX ifdef
Thread-Index: AQHcRDBecqTU/OGuGUKeptIGBfYF6g==
Date: Thu, 23 Oct 2025 15:19:04 +0000
Message-ID: <20251023151903.560947-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|PAVPR03MB9678:EE_
x-ms-office365-filtering-correlation-id: dd629445-1166-483b-0ae2-08de124780c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ONNuyDXeLKw2uNQwAbMDBeNeHgtlJhPh44v0FZy+KLHRs8L39RoMj6eBI/?=
 =?iso-8859-1?Q?7sCQU8wfu3jPd1PC3EaGmnucOhX51yunPOOvIQ/LElK048LrsPggb72uWc?=
 =?iso-8859-1?Q?XEIvqwfI3O7+35v4H01KrtlzDS7UYBORA0bARGJ7nEdUD6Hp9trGn+kjIL?=
 =?iso-8859-1?Q?UiX8CopC6jHJWTokYHN/RvyIG97Rqrd3ElYL4CczZA2DoVhdju0jVlGClE?=
 =?iso-8859-1?Q?wl7oaF4qVgn9YIx2sAuuhL7uSY+s/bNbxhZy3s+iPLmFI71SOa0evbnYen?=
 =?iso-8859-1?Q?2BSJwp05RUmNXHRVEcmOPP/PJrM+/QfTjr/AGIaJMpsj1GG4dvSFxph0SG?=
 =?iso-8859-1?Q?7LgPL05MWNvrLgKqHaWp+AI7F1yBv4v1CRhVwlLzHARiBZBNWzGOqB969E?=
 =?iso-8859-1?Q?PA7+92niNWWRppx2T4dyEw6k7ZxqgTahnoFtPBvGKwx3Ky18HyYlU8Fa2a?=
 =?iso-8859-1?Q?5zKBX9yClP3w/sByhUUkSc09cpTBwYAB2l0DJwgPOvIdMOXnEUOfMJHtz4?=
 =?iso-8859-1?Q?blfM5Gu1id98Cb5n6lXMNajBZSLvrNPIL79IEM1U/kzZ+GU/YKbH8W7eoe?=
 =?iso-8859-1?Q?iPoZNr0JO4NCVJ8VooY76aUjb8x7IMpVS0xr4RiiFN/V0GnMQY9EuR5ZMB?=
 =?iso-8859-1?Q?pGC2i6G9m/cG0S4CgCupugIdmdniLRwxzfFz+MHTr1lLO7A0qqDH53YR2l?=
 =?iso-8859-1?Q?TY2O8CczWTjTKrDQVd5r4fFaroTNHoTPZer1mpEGnVaKWkmjR4ufDWWT2z?=
 =?iso-8859-1?Q?RFYYBtlZdNtPbQDFrJUG6Xah84OypGHpW5j7RKXfdP6FNG8ABuCjokdmG0?=
 =?iso-8859-1?Q?g3ip2oAt6unZugZ8W8vlAiiB1clTkGvjp0EC7cm3ZG97wMKicbkiZNBbpy?=
 =?iso-8859-1?Q?EVr78X7OpO/M5lE/PYev6gbsWEF4QpXhA5tDPCQMzEpwV/4yHb+m1sIxjn?=
 =?iso-8859-1?Q?04ROa7Zd6hkJ7T0pgaFPHLidiv+UjOnsJS5vKMriyWbVScmHtt+al6lOZ4?=
 =?iso-8859-1?Q?a6HFQdlZd0QwtuUc3m3l74dEaoj+QlUlbwyNveBq5oQGAT8jOHmIJG2FWH?=
 =?iso-8859-1?Q?wATGD9FscvQp+cCt94fcOsSqqyFL8EXcA74/8rwZzE+30zYlrG1BZBzUbl?=
 =?iso-8859-1?Q?6rUf/J9M3W6OCz3W8gvF3sUZ1T6JYr3vBJbvxDSKAE+Udg5FqkQMwzfETL?=
 =?iso-8859-1?Q?OoOaqk4phxvUEo53gtVnVJ8moywe51sXM0EI+18he7VSMaAtkSm6pzhdjN?=
 =?iso-8859-1?Q?haw5fhcTKEXlhPTbSKnIjGmXf2sLfPMyQhJvWNxXcBGxqTW0pwIt6pGCna?=
 =?iso-8859-1?Q?nOY/RHUVCfNgKTNr7Q68bGKhTEwG3b5MvOkcY7m4dc4gaZ6QJsvOPC+I4E?=
 =?iso-8859-1?Q?nQbSr2mcpBe+xLy4XtxuVQXCKM5D4TEORM9rVJ1GLnzqE0vkwcKIIkHl3q?=
 =?iso-8859-1?Q?3WQcgmSr/GhSXzFGJ5u+fOXlUjUOWQ0d+AqTXWPMKjTYHaJbYAYSovtufg?=
 =?iso-8859-1?Q?pDWBvP5PN5Lv176AZ23EVfJTPm2+PIfTTkomQXXdEC3IwJjv2hEq1KnABN?=
 =?iso-8859-1?Q?+efrIPSG9NN4+nYCD2F6YYcVSKR5?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ov91ly+OLY0NRaEBEy4laqpNu6kdSh58IGLLMQNJfrsApBZBL/hvh3U1f+?=
 =?iso-8859-1?Q?c0NMM0xW2R6EEKU4AiSDHLh7nNTWh3ReDifHd6TNLazjOfryNEoxj/9yS1?=
 =?iso-8859-1?Q?/ICBycxXAt5UoMdfLIaOsLtxXasVFPq0uWWnqC3HIq1XTp7tQhQusRcOQf?=
 =?iso-8859-1?Q?P4dKiaI7VKRsS8oXQk3X81eNu6wl3CQQKtzULFECjkm045YLxEgFUA2JfG?=
 =?iso-8859-1?Q?IamSM4nZq+pxXhSYjFGD3sVRsmxv1EU8j/TeIl0gJMSXZ8lkN6M8bfJfT5?=
 =?iso-8859-1?Q?qVQFj38Dx2yae+uEVowmhun+4zPTDYKbepbP/lsNrgDbbyquxyo4P8k8k5?=
 =?iso-8859-1?Q?zsN9PUoXi7Xcth0Fb4wH0Y7Iq6mRvTvwGgjwBmdBAbQtgk4WIEZeMDeSvp?=
 =?iso-8859-1?Q?rw47hQ91Su/4n2X2f8NR1TzPCwkkLM2fx/voD1E1//UhFTG3QU14XJg7SV?=
 =?iso-8859-1?Q?g0ED2KtZhLY3kSwbGWqO3d+O02f3tLVvb0zX8nPW3ppNtPiEbIklWrGmdp?=
 =?iso-8859-1?Q?8P3lQaU3fkmn1Bh1loIgNDtz8GFXB+W+VTUDjuf91lRju8kZS/15WIJxV+?=
 =?iso-8859-1?Q?Tg3JmSsELogIl7Ydl1HU4cpVL3r05cp4ggz4r0QbulLFYLl6cxItkI4DjW?=
 =?iso-8859-1?Q?+zGUYHhb7x1vIDZ0n4M+Ym+54x8lwZBWcFMcCm1DXBej1LMEx8hL99z1Hs?=
 =?iso-8859-1?Q?/GeNvRT7IxJES+2T2Fwcvrkcm94qRPQLMkSJZg2bARLwoI4d0/+yNZZOVj?=
 =?iso-8859-1?Q?y96bn91Au82mmmiYtJR/+RBDaHGhb9eNLl7gYO5PwcRJQ+ltjEmFM8iKAC?=
 =?iso-8859-1?Q?xjs60LbXYuygwKkjq0VIQryLsxK4ovgvckaAbnW/Wv3p6hdgoH6lFyGgPi?=
 =?iso-8859-1?Q?zgwyjDsHZaQ8x2vdD+2pVk+pQmLBeEHKxdHNH4iBk+f900sHs3DFrV83PC?=
 =?iso-8859-1?Q?lMTNrWB5s9fLDE5EFdgGMyJBAMRnmXtODbmQdRtCd0Mlq9K8RdDgt1yDUb?=
 =?iso-8859-1?Q?EA9Hkd3rHFuZweZfv1BbZdAIgQeBQ8obsgV97+zoCrliFxAeLVBlJXpz2v?=
 =?iso-8859-1?Q?976mPrdDOUdT0xmaCgxhF8ULmWPvgyKZuX/J99bl9DZ4xCF79qHH3wPXFN?=
 =?iso-8859-1?Q?d4GvzvSj3d4vakS17INOw9OryPWZv+M7gxlqKO1byiPAl3TlpmCsiW1S2B?=
 =?iso-8859-1?Q?XFrZHRXZT7c1/sNQTY3H1fFd7xVRbKGZBepGqA6LmZHS3fQ0PPLUjnGmtp?=
 =?iso-8859-1?Q?kW1BwT2ZG6gKbvyGJx9vQS2dRveakdOnEtHG1FG6OJbTff3mqJpWBuccMs?=
 =?iso-8859-1?Q?3kv753o45ex7/2RYsCJswtv9GH5SVVatptYunnyZmERBWHAY1Zahk+12F1?=
 =?iso-8859-1?Q?Vd0kwv355FIV2nlTdKrOTPLAXngyn7xIfk8L/Ng9HE+LNLryl3A9Z2SaGn?=
 =?iso-8859-1?Q?viQ4jK/yIT5gN2vU2CQIRKR8A/PHWcqbR00tzA5T3C/93+Z5NjKTP/cqsE?=
 =?iso-8859-1?Q?PeQxpgr+jILKzQ6dfp5SAyCBWDdx4cH1U7xasb2r4araBuDM1ebCes63A4?=
 =?iso-8859-1?Q?HpEsF1/cW62VZc8TTzQ9MgLtOYNEKVVHX7YOn5mTTj3XyKhZpUD/cTBE/r?=
 =?iso-8859-1?Q?RGOdDuhyVRkfUBnwAYZgFWQxl9aidHbxv/aMIbcSjvle4BQzL44s5i3w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd629445-1166-483b-0ae2-08de124780c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 15:19:04.4841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xZ4rJUdU+X8cY7Q/vMknwHWudJd0H07UHcVviyuoyQbY43CHfiwMrdJm1rerS8of+w8kOTabGhOsOAt1tJ1Ip9vcOtiL6krN16ntwv5C81U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9678

From: Grygorii Strashko <grygorii_strashko@epam.com>

Functions:
 hvm_shadow_handle_cd()
 hvm_set_uc_mode()
 domain_exit_uc_mode()
are used only by Intel VMX code, so move them under CONFIG_INTEL_VMX ifdef.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/x86/hvm/hvm.c | 50 ++++++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index f1035fc9f645..3a30404d9940 100644
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
@@ -2273,6 +2249,31 @@ int hvm_mov_from_cr(unsigned int cr, unsigned int gp=
r)
     return X86EMUL_UNHANDLEABLE;
 }
=20
+#ifdef CONFIG_INTEL_VMX
+/* Exit UC mode only if all VCPUs agree on MTRR/PAT and are not in no_fill=
. */
+static bool domain_exit_uc_mode(struct vcpu *v)
+{
+    struct domain *d =3D v->domain;
+    struct vcpu *vs;
+
+    for_each_vcpu ( d, vs )
+    {
+        if ( (vs =3D=3D v) || !vs->is_initialised )
+            continue;
+        if ( (vs->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) ||
+             mtrr_pat_not_equal(vs, v) )
+            return 0;
+    }
+
+    return 1;
+}
+
+static void hvm_set_uc_mode(struct vcpu *v, bool is_in_uc_mode)
+{
+    v->domain->arch.hvm.is_in_uc_mode =3D is_in_uc_mode;
+    shadow_blow_tables_per_domain(v->domain);
+}
+
 void hvm_shadow_handle_cd(struct vcpu *v, unsigned long value)
 {
     if ( value & X86_CR0_CD )
@@ -2306,6 +2307,7 @@ void hvm_shadow_handle_cd(struct vcpu *v, unsigned lo=
ng value)
         spin_unlock(&v->domain->arch.hvm.uc_lock);
     }
 }
+#endif
=20
 static void hvm_update_cr(struct vcpu *v, unsigned int cr, unsigned long v=
alue)
 {
--=20
2.34.1

