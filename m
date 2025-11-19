Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1DBC70CF7
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 20:30:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166357.1492938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLnsj-0003Jh-BV; Wed, 19 Nov 2025 19:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166357.1492938; Wed, 19 Nov 2025 19:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLnsj-0003HX-6z; Wed, 19 Nov 2025 19:30:21 +0000
Received: by outflank-mailman (input) for mailman id 1166357;
 Wed, 19 Nov 2025 19:30:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GacY=53=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vLnsh-0002Z9-K9
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 19:30:19 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2de3360a-c57e-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 20:30:17 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by DB9PR03MB7690.eurprd03.prod.outlook.com (2603:10a6:10:2c6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 19:30:10 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 19:30:10 +0000
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
X-Inumbo-ID: 2de3360a-c57e-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJN4pVjaecb08Qv8WxboLvOBhm15mGG+doAz9iSpr6ifcocJUfPLRc2O7vLJ4IC4ZynU6tq6RSPrKaf6wPnUxDJOFYnI8OKE49z5sxygDEyo51rdfhfV/KxViJReLX3F48CfRwF19/JI3QG8zTpSXawo8V5n+OzX/hTdxILL3Sa8bxIXYiwalbq+b2jvffR+9jzPQhkuLvP8vVCWPIz585WBDVfyi9qZKwfWpkAuDasbqFX4tBoGr3/HZYf6KB674PPEZ4FAWqqfTo+ClexoCtpVAdw0yNHI63SfDozkgY4ZovznnfhNCbU/qNVsS5x0b0QZXZFzaTFZSM/Ewdw5/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxVNyvT9747pN+a6JgkjBZM2A2r4H6G+Y1GFsarwU5k=;
 b=Qts7YRhjBXkKz8T5mPdGFsXRxLhudQhwrug0O+ra7pTx8K6kr2RDQ382zwRrweVSu2/LhHqhjvSfDfKej+afuVtwu2SoZNaE8Ilr47oQYpd18YZkHPDY5Yzq+Dk0tRqtH25hXCg4ET6FAod7l34q9JIoaCoB9UW/rXbEguVo5ODBwEVkl5MwqjDFOdUJKrb+TrBLeSyTNMwY7bV/qceO0wiCuvB3YBMrWGHVXNMgp1cAw5VP/IFsHrxmpxV6CbVRXHNlOib4d7Uv9nWnLfBb2Qs76/oF05tTMDO40h56KRW6BJhp7A764A2qjVH0Hv2oFAS6JWrYa20Oao86xbPT7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxVNyvT9747pN+a6JgkjBZM2A2r4H6G+Y1GFsarwU5k=;
 b=DYhY0WH02V103ZDmUe4N5iohrv5M+6bxqDRjS00moyd3bLSQJnp5k9qRkAPTB5nKeoAGisPN+Rr9udK3LYgU64HTdYMpvCHYsArFaCYLbXTEYtR5T3uYuDA4BDUCmgEaiYDq7FgHarAwIGmYLz3Yg8c1cUU0oASCnpZWXcnMPy4S7YJgGC59hkxL3W0HmT/7xaj+6q6phy2BJ7uU19uIJLUm41G473U/6EQt29tFzBU8Buo3O18X6+L2bwLfTw+uMFOy40ImBRcB3ICApFl8eXVBkyfsGlRKgfJqt3ftDpNgR29CIbYmbiQbY2NnK//KAAtxjGJiLgfnNMYYB0sRuA==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: [XEN][PATCH v2 2/4] x86: hvm: compat: introduce is_hcall_compat()
 helper
Thread-Topic: [XEN][PATCH v2 2/4] x86: hvm: compat: introduce
 is_hcall_compat() helper
Thread-Index: AQHcWYrqDL5Jc1Je5EipZt1jZOW+Bw==
Date: Wed, 19 Nov 2025 19:30:09 +0000
Message-ID: <20251119192916.1009549-3-grygorii_strashko@epam.com>
References: <20251119192916.1009549-1-grygorii_strashko@epam.com>
In-Reply-To: <20251119192916.1009549-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB4594:EE_|DB9PR03MB7690:EE_
x-ms-office365-filtering-correlation-id: b1864e68-5db8-4ffb-330c-08de27a20dd9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?qEkxN/B6rKKHTpyZfxEo3AcakfqUQoXRh3teW5jGwpO/xAgaoYKilansj/?=
 =?iso-8859-1?Q?a+gLk1Uef7jzVbWhYX0eX0V4Y8vWJsiem0mf7zZGUYNBgCy9c86h9XkcIq?=
 =?iso-8859-1?Q?/+Dq4L+pHfxUwhzKyVXOuB/zWo0wNBMssUCfGCZuj5wFlG3gvt8LgM9IU5?=
 =?iso-8859-1?Q?QMq+0lCNeQGTMzPeZkUxjbNEnWQ+Zw0adXVwatAqvkyTpysksGZNhP21kG?=
 =?iso-8859-1?Q?TZFvuVQPq46/PU8traHRo092co9tkq3ck4O1LlbYFYiEIRG2Btzofx19ly?=
 =?iso-8859-1?Q?7n4b44P/kX+E7YEW9H4o6XnAu6NbG4lduDYf48lNurGL+zijSKNd0X1swS?=
 =?iso-8859-1?Q?JHo13F0W5FAvwcDR+VfDqUERw2gPaf8flOLK1TBSSJJ54rbVa5Awcj7Fun?=
 =?iso-8859-1?Q?E7dDgqGm6oxMVhtB8x88aRRmrxDtftoynCYUgEttVJYEgWNHkQ99GO4KPh?=
 =?iso-8859-1?Q?qjeXP47BuChzGHg5o8yFuA9Ov1XRb7kE8fU9aulNpXm1mTA7IVLdSEkY5O?=
 =?iso-8859-1?Q?Liho3lp17cqtpkmqP20va+CL7EnBAUdes6KNVcCUDFFr5uc97bwkB47OzZ?=
 =?iso-8859-1?Q?F4ZVZUdtd4M0Jqrd2epzZR3R3NMbaMZLcD8PJilZdKJxWFeBsOSt/XHk5H?=
 =?iso-8859-1?Q?/0L0KgVoaPMQHLeHMaux02GwMixTxJgcRpte2N2bw/D3AFKZ+IqfbmJ7Fy?=
 =?iso-8859-1?Q?TnEJ+zCFCtteaSIJZMwwiDPSYiohmTSyiXPaSMxGf2p71VXkx5eeFPcQb5?=
 =?iso-8859-1?Q?E43YGwwJX56jhNKdMbJ+55iTECFiwV6Mpr/uZTO6bZXqyXJtSe5XqPhr6t?=
 =?iso-8859-1?Q?dS2+71Q+F9ixlCZfybgayUn6gp/shVy6oA+7+z4DV4XYxOyje3RZq7f5oM?=
 =?iso-8859-1?Q?0X4A77LVveKXwjHMGvdHiY85LvIw6R9qIiSG4/1uxNXSOJwyExjjz3nOFF?=
 =?iso-8859-1?Q?zMTYFiIBE89/nydTjakY8rcOaPpl8mvzYuxrlQdraKBHftVPgtszR4kOm6?=
 =?iso-8859-1?Q?TU0Z41zbgo1TQDxmllXy3WCPIbsJKaWVFwlfLZoi0ubOtoe4Cfr/FN/MOW?=
 =?iso-8859-1?Q?jaHrTDDsjk0/LmBHJTnr6LbsU6BvSUWJN+lsvmkasoP4w7fu83xXx+0uCS?=
 =?iso-8859-1?Q?3NAHFxh1p7J9H7K95r3L7MMFIXTCOF9RczfgcFFb24T/vlP2omYgh4JugO?=
 =?iso-8859-1?Q?8n048xt5cqkANJH0w2tWKgzn2kQ/0O/Tp2yxObp5o407xkaTZfYHATB4Mg?=
 =?iso-8859-1?Q?BeGGcpbfFTWC4jNA+qIGU9WFLH204yld8FUB8i82wPIGy9vUkS0his4Jq7?=
 =?iso-8859-1?Q?in7ZBrGfAjNJd0aWiALCuboJsbUitAiJyFQ10spid7Rz4XgRUM4YQsZ7kB?=
 =?iso-8859-1?Q?F+3eQC62ZEMBkgIxsRbSgkuQ53S05IfS150/tf45OPWA/zou9lf/GDnCCf?=
 =?iso-8859-1?Q?nBBP99kQnuaMBmB459L4XmRGCA3Rc4s/25r/qcCggy07FlfeFNu47q8vo+?=
 =?iso-8859-1?Q?NcXSLb85K8qRpxgIrIrkbHxiAigjDokzbShnfwGovbdO9/drYPWJ9urfZ7?=
 =?iso-8859-1?Q?zhRyPOM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?XZx4rqQ5i4EBI29BgzYAsSJA8r7oQUWA6Ofa1UZImoio70+TWyIZNln7Ng?=
 =?iso-8859-1?Q?Aza1YnFPtF4GOuhwq+MhADEpZqjrBj5LHT8364IgX2N7zjoHTd4L+r8ZUM?=
 =?iso-8859-1?Q?JDo7LgppnqysZwigyqJdc6vHTu1XT7xh6HSa7CWjrThsEZ8WMmpjtUq/Hv?=
 =?iso-8859-1?Q?L1p1dvPdJ49RxqUOlyQKHGACjNzZjJG8vEHj9+cj+d0fquUg7cbNZV6H2X?=
 =?iso-8859-1?Q?ruORqATuc9FgCJE9v7quEeiOLGDxIvHFOfjxB26TuGtIrOAgffpsVUFDFx?=
 =?iso-8859-1?Q?c3hC4GBZLXY/Gpak9FQPr29qSQequbGMVkc1++BYRON01n+ZgRsm/fPY/Q?=
 =?iso-8859-1?Q?gJEnqgH+VMgf4BoXHojbLjlX+aWxgomfeVbmNUBS1aHPR3zKIURnZe2CH7?=
 =?iso-8859-1?Q?Bfhbgo5GzzsoLmq+PwbtawPVpij+8kAKPd7lzBUx52TokUpL+almQe8G+P?=
 =?iso-8859-1?Q?S+ZXwdbHLoReTLXmEnghCArwMyqakQWgAO9WzK7bzMXb9uYHBHMA3s5Yr1?=
 =?iso-8859-1?Q?VHwd1Ds7iMtgnTU6cVeH3I94CplZBP/5KfG+MoC5ECUJdvA56QvInCSaNt?=
 =?iso-8859-1?Q?dyOkStkPBVf01GbmE8J8qUY3EidMvUqsdhfqu4x3b1Gu+lmJYJp41aRNU0?=
 =?iso-8859-1?Q?lYr37gFE1IgkX1AAqPLYhvxdSa2lyNanFfYqhbdgAIvOqG2Z6VcNZHq901?=
 =?iso-8859-1?Q?S5mk2RlCJSlBTxEGM7m8VgZomnF/68S1jUA3MyOumKakBR5uQqrApjWuY/?=
 =?iso-8859-1?Q?KbqrmL3mICZ5IvPUgRnqjsCvHsj3D06uwjOwpCIaZNEI1JGfpZOmgLTqJk?=
 =?iso-8859-1?Q?SXml0aCi8f8fcGLJnTFhnKOWd6Ju816Y6LzPMSSAE2SDSmjMCDgcvM56VO?=
 =?iso-8859-1?Q?dQDimKTRPRGkOR1T+CYhu3NKnctrkUho/NlGI/8PuUFpjTAHSWr83wA5+f?=
 =?iso-8859-1?Q?H4GYN/q4f59BSHQCa/Ai6JTnQ1PXX35WsnyNtG7ANyrRCzo9N8sEc/2ClD?=
 =?iso-8859-1?Q?AasXHIvLgHC+KyfH+e6nl98hAyHaq7gAlwY69Ks7H17eUJqLdP0jin4SKk?=
 =?iso-8859-1?Q?jamuNGht4iTk3HkFHQyaN04ts/T8ad9XFq/EckjwgiRbUhgrEQnZG7Uwaz?=
 =?iso-8859-1?Q?fQGDHS25XikfgsXse1IzPw3iYraUUhQCkh4UkIRjw66xk1noQSJDTxJhme?=
 =?iso-8859-1?Q?I9i+IUSu1VJWsh4HOlWua1fENpXTObZ2xR2s6oreiI4BrEWMeX5dZe1KDx?=
 =?iso-8859-1?Q?0Wb6/e5Glm4lmgvO2FYp9PA67Jxgqo0NTKCEQDcad8lzFcHwxN0K9cps4Z?=
 =?iso-8859-1?Q?L7jFnpojwTS0wzf89kRQ+XWdSLl9ETa9BYVSuLXYa9es7GnWyAmShWy6rc?=
 =?iso-8859-1?Q?cBQYFqetG3N6exU+ljtzpQ9VJoMiPWtoOIRJu1g15npc6VBBAEumB70Sm7?=
 =?iso-8859-1?Q?Im+ykd9yj8MPBzEzG/SmCLRrq1fu9YRgz6otOvp3ViDKvwGy9j/GrAmtPW?=
 =?iso-8859-1?Q?ZBmmQDlaue21DYGNOZ1W5X62bB3NQwLUXawZ45Fajw8U3mXcNfwylyUoFg?=
 =?iso-8859-1?Q?9wDnKXZJnnp3tuGZuENDrWEDttrtxQNN2Su4NJ+0bkOtYM8wlip619kDbw?=
 =?iso-8859-1?Q?yMxwsGO4K4h8rKgYIGZ5PLKJK3FaSYifQxibhDAB0nuTEBpd3smLwULw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1864e68-5db8-4ffb-330c-08de27a20dd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 19:30:09.3784
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: upMs5v4m4sEAboi5v2brPGN0pJgDjQX1loFmB9cD1i/xvUY6DvwkVG6v3NEmqsXsms6CmmY745LvyypiuZjePaoQOmMdleIDxLRb1o80pAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7690

From: Grygorii Strashko <grygorii_strashko@epam.com>

Introduce is_hcall_compat() helper and use it instead of direct access to
struct vcpu->hcall_compat field in preparation for making HVM COMPAT code
optional. The vcpu->hcall_compat field is under CONFIG_COMPAT ifdefs
already.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v2:
- change to bool is_hcall_compat(void)

 xen/arch/x86/hvm/hvm.c       | 8 ++++----
 xen/arch/x86/hvm/hypercall.c | 9 ++++-----
 xen/arch/x86/hypercall.c     | 6 +-----
 xen/common/kernel.c          | 2 +-
 xen/include/xen/sched.h      | 9 +++++++++
 5 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 0ff242d4a0d6..0fd3f95b6e0e 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3500,7 +3500,7 @@ unsigned int copy_to_user_hvm(void *to, const void *f=
rom, unsigned int len)
 {
     int rc;
=20
-    if ( current->hcall_compat && is_compat_arg_xlat_range(to, len) )
+    if ( is_hcall_compat() && is_compat_arg_xlat_range(to, len) )
     {
         memcpy(to, from, len);
         return 0;
@@ -3514,7 +3514,7 @@ unsigned int clear_user_hvm(void *to, unsigned int le=
n)
 {
     int rc;
=20
-    if ( current->hcall_compat && is_compat_arg_xlat_range(to, len) )
+    if ( is_hcall_compat() && is_compat_arg_xlat_range(to, len) )
     {
         memset(to, 0x00, len);
         return 0;
@@ -3529,7 +3529,7 @@ unsigned int copy_from_user_hvm(void *to, const void =
*from, unsigned int len)
 {
     int rc;
=20
-    if ( current->hcall_compat && is_compat_arg_xlat_range(from, len) )
+    if ( is_hcall_compat() && is_compat_arg_xlat_range(from, len) )
     {
         memcpy(to, from, len);
         return 0;
@@ -5214,7 +5214,7 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PAR=
AM(void) arg)
         break;
=20
     case HVMOP_altp2m:
-        rc =3D current->hcall_compat ? compat_altp2m_op(arg) : do_altp2m_o=
p(arg);
+        rc =3D is_hcall_compat() ? compat_altp2m_op(arg) : do_altp2m_op(ar=
g);
         break;
=20
     default:
diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index b254b3e2f7d6..52cae1d15312 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -29,7 +29,7 @@ long hvm_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PA=
RAM(void) arg)
         return -ENOSYS;
     }
=20
-    if ( !current->hcall_compat )
+    if ( !is_hcall_compat() )
         rc =3D do_memory_op(cmd, arg);
     else
         rc =3D compat_memory_op(cmd, arg);
@@ -57,7 +57,7 @@ long hvm_grant_table_op(
         return -ENOSYS;
     }
=20
-    if ( !current->hcall_compat )
+    if ( !is_hcall_compat() )
         return do_grant_table_op(cmd, uop, count);
     else
         return compat_grant_table_op(cmd, uop, count);
@@ -66,8 +66,7 @@ long hvm_grant_table_op(
=20
 long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
-    const struct vcpu *curr =3D current;
-    const struct domain *currd =3D curr->domain;
+    const struct domain *currd =3D current->domain;
=20
     switch ( cmd )
     {
@@ -96,7 +95,7 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void)=
 arg)
         return -ENOSYS;
     }
=20
-    if ( !curr->hcall_compat )
+    if ( !is_hcall_compat() )
         return do_physdev_op(cmd, arg);
     else
         return compat_physdev_op(cmd, arg);
diff --git a/xen/arch/x86/hypercall.c b/xen/arch/x86/hypercall.c
index dc0a90ca0915..5d1ac906fd37 100644
--- a/xen/arch/x86/hypercall.c
+++ b/xen/arch/x86/hypercall.c
@@ -53,11 +53,7 @@ unsigned long hypercall_create_continuation(
=20
         regs->rax =3D op;
=20
-#ifdef CONFIG_COMPAT
-        if ( !curr->hcall_compat )
-#else
-        if ( true )
-#endif
+        if ( !is_hcall_compat() )
         {
             for ( i =3D 0; *p !=3D '\0'; i++ )
             {
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index e6979352e100..3ff06e315f57 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -615,7 +615,7 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(voi=
d) arg)
         const struct vcpu *curr =3D current;
=20
 #ifdef CONFIG_COMPAT
-        if ( curr->hcall_compat )
+        if ( is_hcall_compat() )
         {
             compat_platform_parameters_t params =3D {
                 .virt_start =3D is_pv_vcpu(curr)
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 02bdc256ce37..ed6fdeeda9f9 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -311,6 +311,15 @@ struct vcpu
 #endif
 };
=20
+static inline bool is_hcall_compat(void)
+{
+#ifdef CONFIG_COMPAT
+    return current->hcall_compat;
+#else
+    return false;
+#endif /* CONFIG_COMPAT */
+}
+
 struct sched_unit {
     struct domain         *domain;
     struct vcpu           *vcpu_list;
--=20
2.34.1

