Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 793E8B593CC
	for <lists+xen-devel@lfdr.de>; Tue, 16 Sep 2025 12:33:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124599.1466882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uySzf-0001wO-MH; Tue, 16 Sep 2025 10:33:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124599.1466882; Tue, 16 Sep 2025 10:33:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uySzf-0001tY-Jc; Tue, 16 Sep 2025 10:33:03 +0000
Received: by outflank-mailman (input) for mailman id 1124599;
 Tue, 16 Sep 2025 10:33:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U/dE=33=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uySzd-0001tN-Eo
 for xen-devel@lists.xenproject.org; Tue, 16 Sep 2025 10:33:01 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8458780e-92e8-11f0-9d13-b5c5bf9af7f9;
 Tue, 16 Sep 2025 12:33:00 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU0PR03MB9591.eurprd03.prod.outlook.com (2603:10a6:10:422::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 10:32:55 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%5]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 10:32:55 +0000
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
X-Inumbo-ID: 8458780e-92e8-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tlJCyIVh+FoaFWUCJGxYoTBfgx63HJR0SFy53VQ5kjFvrGYoY+m1KoirDpmFLySLYwDF0ukKnHyPvkWfCHUBFvswytmyN3tSd6NS2ANhYuPJaEecbikDIGu2sj8Wf7LajyMBOHH7xw22KmxQSqT3er3dxjZuN8dlSI7Vux422CejP4HYaVJzogm4SWPaBE75TExCOyH62uSrEH5e3If1gG6MUl8mBYhY12wVFglWXjmydM9wZ0A+lLmF+4o01ryFo33Mej2SZJUtlwx7e9hmhUEaEuDorgPte8A554xVT8AcAUr3HO/Y/ENIbCqKBZc8PNnXbCijNhcDqnVC73P09A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ETb3dpCMMoT7n0RU1nZ6MxKaPbIvoDnb5WEDgR6cbo=;
 b=PtqnO8z61U47sjy3eumE5FU726KroxX2+1Ezh2YVtAOmRinT4TVLeD1Kc/xZEnje4IwcLJ6AN2wdiXMjasVUbS2+q2Bo5P4qvxGsmmIUmLObguMvLZxIlhOwinr+KuT8Br7FxcI2DLFstLpLLRauO+cFFzMPajzEzVM6uhbbwQpolJPex/SunaVq6eaQmznPRaqb3+bjIWxDfOsW6MLl6yLe7sNdxmafnRUJme9jJ+xMmfntv5+iK6d1dki+or6Uc0+psRNhioDzqWXrYDZAmYs+W1SKQk+PEDDNlNMgkccOWSlPhV75ZID8OlPv166MxLN0fgH6r5pPaZhkwU0Olw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ETb3dpCMMoT7n0RU1nZ6MxKaPbIvoDnb5WEDgR6cbo=;
 b=WnBwJDU4jXct2Om0lk7q2TCx/jqLbkdb3w84rUAaepeaTN3m0p/3n/1fDzr49A/UZZvgj6qXSCFJJM0OlIOdslUNBtfadzZlDJWqN1Ra56XVtvPsJChEFDIyAsY6GSwAVxEK5/okDuHjyahmbXMjsPTosWtPojvtUKslrfqRQKM2HBlQMi0LowCR9gOJGihwpL411iFJ66sulDip4kOaPcm4ta3A27qpvX3or3iBeTCTD4e8YGm2s6XP+ZJ9dernoYcu3bQ/SZ2GZPEQR0wBW1jZZXs/CtXD+RzAOKt9lHGkDLvsBL0iLqpXt4Pm2GE+aRxyGX9mzm6BDKVYMobEqw==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
Subject: [XEN][PATCH 1/2] x86: hvm: vmx: fix runtime vmx presence check for
 !CONFIG_INTEL_VMX case
Thread-Topic: [XEN][PATCH 1/2] x86: hvm: vmx: fix runtime vmx presence check
 for !CONFIG_INTEL_VMX case
Thread-Index: AQHcJvVD2WER0/U75UWsICVLjMYHFA==
Date: Tue, 16 Sep 2025 10:32:55 +0000
Message-ID: <20250916103251.2144449-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|DU0PR03MB9591:EE_
x-ms-office365-filtering-correlation-id: cf1c6037-b7a4-452d-7515-08ddf50c65d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?pF/oTw65e+YALbZrDV2SBGkWT0FP5fgIj0Sc+G/JmjkuFR2uQuVnq/WL9+?=
 =?iso-8859-1?Q?URk0HheG0ISnX/y8k1TNoPuc4yu/7Jz4bTSSfPBdN1j4gJf2Yw4wpBLcRY?=
 =?iso-8859-1?Q?KXg2Z8FJEeeZyvE41GDKufHELJ3o/Ft20pAAU6LIEYc3OmQN8IYaJ9AIPI?=
 =?iso-8859-1?Q?Fsn3d9X0kV+BlTJingoLf43reUlHffayx37UCKKvfT2LUZg+hxjriK3gi+?=
 =?iso-8859-1?Q?ikLGMotMsgS6+U2DDNvam88NlECNOl8S0phy38vQrEJt2Wv6MMgWGfSeqz?=
 =?iso-8859-1?Q?U/OCnLW9r0J/p2ESXsNnR72lI/4rNTG2zhKKW83RWuBPJnubSoz+o4eYJ7?=
 =?iso-8859-1?Q?kg/Toc0JkuGQT9Bn+6tI0NJT2UvQN0YYDFycKojjhjqaX4mJjAdMr2gIKi?=
 =?iso-8859-1?Q?A79WzJ5/cQzA4haFHhWPokLc1CBDMKc3k5whDFNGcWJZXDpQOB2evF3HiX?=
 =?iso-8859-1?Q?oCB++UeMBKS9WwL7B/et+1hpri7tJYTX9Bs+xMj57c8VVQh6IyAtIY911m?=
 =?iso-8859-1?Q?D3XjZakHDrPu1WMALtYO6xIVl6zXq6BlHewEADFgd9R8rjH6l8Husfu7ua?=
 =?iso-8859-1?Q?30UfryumOguj8htPPGkrBYKUsSR8vhk87i0o+Nmf1MsnhG3zeJP66nMRDT?=
 =?iso-8859-1?Q?eEPPM4y06VC6Amff9v8aQOnA4xx6wtBSJRBtmyQecFFBaFb/So789SX5hx?=
 =?iso-8859-1?Q?Ejc4/V7ebtddaa8eHMue4eUeRJw7c0rIWMYjN58zYy6DqFKU6bAYZ2MJWo?=
 =?iso-8859-1?Q?YWgQ5TX3EWOpjzwbFsZMjuW842MKgEvL8O/7YoIyAU6wQLktJYhnEpUC4q?=
 =?iso-8859-1?Q?yrJj1617fXHCRfTTUfUYCS2SKM5ESbu5bLCti06S2xJ8yaXVhRaHHqHvUI?=
 =?iso-8859-1?Q?ap3eLz0quI7+zS+7PJumcL6Z1/NKkUTxh6OZvU3T2PdflRkJoNtfljBmqL?=
 =?iso-8859-1?Q?gtnhNbTmW+n5qoBcu4yUTv0BQzabIf+iDUqCIx94rFJIr6hW8KUVXprsv2?=
 =?iso-8859-1?Q?e3Muee5bfyIUMJ+1qF2WShKhKcPo+/rnvd5w8IWYK3rBGc1a5XwfeS5Cws?=
 =?iso-8859-1?Q?5oU5W5GRHcKSgx1CYkbiv/MUvyG0I3pHLarso8ty/bUa2PwKBN6uzHYn5k?=
 =?iso-8859-1?Q?MxLcuwr3+0riXzVJgtd3lljZRj54a+e84h2USQlCZpURDNhR53Zs95C0is?=
 =?iso-8859-1?Q?kPoluThQMznypAqkga/+DYnMhoW/PXsn6u4/deq3kdBJAA9gVIB3ERo1lF?=
 =?iso-8859-1?Q?7xb4ljshayGAZA/a0HyRPo7TYEhrGBvvAp2UNXg6DNEl7cGB2o532LT5Ve?=
 =?iso-8859-1?Q?lHozkh6c+xOkma0FAWY9npAD1klEjqTyhUxryrUKxAIBKiy/WVc6IApuUM?=
 =?iso-8859-1?Q?CI1H78fhFINhLjboQZ/vwyKpO5H154m1fhCovf1nyDXyvLD5Hu+pPUIbpE?=
 =?iso-8859-1?Q?6k6p+s5Qh5rYp8YmC9VVg2SNoXL4MjYkGInEjDll8cG5JRLVf3bGHPQC62?=
 =?iso-8859-1?Q?06FgWdK+wRJB5O4ns2Eqqg5SCQajoCsGMBDmpIC4JF/A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2tsR6AypYV/xAZiv8BvWHGp9bwFGe+wal5OT4YtoqEvzdWgI6jQimTFSNf?=
 =?iso-8859-1?Q?m6VjZcPR3Gw6YeYvQdF7C7e2YZ4u1GKFz/fBKwwXta+3lglGUbF5Wd4Y42?=
 =?iso-8859-1?Q?xX7OqhUIhJwvBX/qkN83hayYej+4RYV3AruAj+5TqCqWa6CZHNfX9mapkR?=
 =?iso-8859-1?Q?A702GRvclyX3cRCBd7LY3zm/5ng/RlNvNsQt38l1kBnGMwYAM7HSbnkOqa?=
 =?iso-8859-1?Q?htWDVfhxR1yU4UNNQoNIfvWnJNmuVldzqw3/cnQCxORPuz3YFTQmki3AZR?=
 =?iso-8859-1?Q?iGC35c3x0TLGAuBkN8dUmE9qh08cUm4HRXT0u1nLhUFqImz29iFgmkyBVl?=
 =?iso-8859-1?Q?ILuu/GcF/8UPzZIVchyk2mE18GArDaYFz17Pux2L4jbAsioEVLfPgDSVmt?=
 =?iso-8859-1?Q?UAFRplV7jOg/BC/QRM8kWtGgaahTXDYlfGD+VhrqHVBHPzy/oW79m5cs8w?=
 =?iso-8859-1?Q?/xu4hXott2QCAnEznHVckcDPqVhbKvOElY/QTSd0Qzig8T4SDKqnZorwWe?=
 =?iso-8859-1?Q?EKqo9NK988kmWkn1Zz7Hh/BIPmTe22n/8H6NsuHibrzAwbGa7aV1iirdPt?=
 =?iso-8859-1?Q?0BIpiyFuFi+CzajOCTPKlda3BchKbJoPL1UmdZQjp30kdenPBFqEoq4AsL?=
 =?iso-8859-1?Q?zBbdPF+pPejX87EdQMed7CCv9APCon6iGBXPpRPO19KpuTzL1bq1E3znjl?=
 =?iso-8859-1?Q?QdoP0FMMa5gk3pXElyANYTtLOe5dCPfwV2z7JxrxV77A4QDwWHASpXLWJS?=
 =?iso-8859-1?Q?SujVQk01xgWI00f1OTegMyg/IvN37oo5g95403u7zG3YqZo2cMZ6j+Uox/?=
 =?iso-8859-1?Q?mwaKs6zLZ0XFnHDLb4jj4XisF4PWFo5exJE4Y6Zxjd9Say9vElNF8gIssT?=
 =?iso-8859-1?Q?4Qe5Wj0FHe6I8zctjpgFeACafzy7YZZknWydLUNzuygDNIV8gixiQjB6gE?=
 =?iso-8859-1?Q?kNpT+X18v9clPliPE3G31pvHTzcSCM/ag8Ku2tf8Cnt/u60X1RnZ4HaOVe?=
 =?iso-8859-1?Q?YSqIB47XQtVqgKh/8u28c3k6agj9TX47RlJy5sS2oT2UJgywHS8j3Nose2?=
 =?iso-8859-1?Q?1K0SKiir0jtjjkNWy8rinDJK2ktC5jHAK8aTbJFsZmSfBJPgTvGhH/FWZR?=
 =?iso-8859-1?Q?grcWd3xsoPDEk62oQaTk6Eb6oQ1YV+WgdfA3Hr8G9t+MI98m9yD1gPVEts?=
 =?iso-8859-1?Q?6TGyxpKxV8bmglbljsrhREB2WcD4+P6LvbESKFo5RqVgmEcbp9p1z2xuWh?=
 =?iso-8859-1?Q?g3eJr716GjG9UXGQg1UGGCSmfFyX38wHcveBsyIPGiWRqoecmgPBbU7F2j?=
 =?iso-8859-1?Q?c6NkVAre3IKLQ8V2LHN//E4ftX82ZFWx3ahzxM56fq4X111tp/Mteh/BpU?=
 =?iso-8859-1?Q?VIoofyLzbUFMQMd9koCjvTNxWiGybaDgQ1A6eXubB0iUD/yiLf8Cf6Azuu?=
 =?iso-8859-1?Q?KYit1oc7z6YPvEk/lOrx0qtbkDBLGXOy8tOiFJlfGqN4CW9QvMavpsuMnF?=
 =?iso-8859-1?Q?VizggvOzjYO2YHnMvcWWfoGGRXMJZhW85Os9xcwkp8DvtdN8m8SUrNdCuY?=
 =?iso-8859-1?Q?2oz8sOkvpPzWm64XLjkDyyAYEuc6k4nMrPOVZ3Jfs9JDmEtIl123S3F43T?=
 =?iso-8859-1?Q?E3XUPaBeKklVZSiskXtA9bVuwQ04SQsN91XS1pnNSHmQnthikB5winwg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf1c6037-b7a4-452d-7515-08ddf50c65d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2025 10:32:55.3321
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: COdah+z+b+Ad+h1Gt1eRHVTvNn0sqNlQV3mS30Gno6njyZyhKtnIogFi9CEGRlEe013HigHx69aUkREvj7RGVFmIWotCTcadHhKi1lfnMes=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9591

From: Grygorii Strashko <grygorii_strashko@epam.com>

Since commit b99227347230 ("x86: Fix AMD_SVM and INTEL_VMX dependency") the
HVM Intel VT-x support can be gracefully disabled, but it still keeps VMX
code partially built-in, because HVM code uses mix of:

 - "cpu_has_vmx" macro, which doesn't account for CONFIG_INTEL_VMX cfg
 - "using_vmx()" function, which accounts for CONFIG_INTEL_VMX cfg

for runtime VMX availability checking. As result compiler DCE can't remove
all, unreachable VMX code.

Fix it by sticking to "cpu_has_vmx" macro usage only which is updated to
account CONFIG_INTEL_VMX cfg.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
Hi

It could be good to have it in 4.21, so vmx/svm disabling
option will be in complete state within 4.21 version.

bloat-o-meter:
add/remove: 0/0 grow/shrink: 0/7 up/down: 0/-779 (-779)
Function                                     old     new   delta
guest_wrmsr_viridian                        1062    1043     -19
hvm_monitor_descriptor_access                168     133     -35
init_guest_cpu_policies                     1200    1164     -36
nestedhvm_setup                              274     233     -41
p2m_mem_access_sanity_check                   71      27     -44
hvm_set_param                               1602    1473    -129
dom0_construct_pvh                          4438    3963    -475
Total: Before=3D3422547, After=3D3421768, chg -0.02%

 xen/arch/x86/hvm/hvm.c                | 2 +-
 xen/arch/x86/hvm/nestedhvm.c          | 2 +-
 xen/arch/x86/include/asm/cpufeature.h | 3 ++-
 xen/arch/x86/include/asm/hvm/hvm.h    | 5 -----
 xen/arch/x86/mm/p2m-basic.c           | 4 ++--
 xen/arch/x86/traps.c                  | 4 ++--
 6 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 23bd7f078a1d..57d09e02ed0f 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -158,7 +158,7 @@ static int __init cf_check hvm_enable(void)
 {
     const struct hvm_function_table *fns =3D NULL;
=20
-    if ( using_vmx() )
+    if ( cpu_has_vmx )
         fns =3D start_vmx();
     else if ( using_svm() )
         fns =3D start_svm();
diff --git a/xen/arch/x86/hvm/nestedhvm.c b/xen/arch/x86/hvm/nestedhvm.c
index bddd77d8109b..c6329ba2e51a 100644
--- a/xen/arch/x86/hvm/nestedhvm.c
+++ b/xen/arch/x86/hvm/nestedhvm.c
@@ -155,7 +155,7 @@ static int __init cf_check nestedhvm_setup(void)
      * done, so that if (for example) HAP is disabled, nested virt is
      * disabled as well.
      */
-    if ( using_vmx() )
+    if ( cpu_has_vmx )
         start_nested_vmx(&hvm_funcs);
     else if ( using_svm() )
         start_nested_svm(&hvm_funcs);
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/a=
sm/cpufeature.h
index b6cf0c8dfc7c..f42e95586966 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -136,7 +136,8 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_sse3            boot_cpu_has(X86_FEATURE_SSE3)
 #define cpu_has_pclmulqdq       boot_cpu_has(X86_FEATURE_PCLMULQDQ)
 #define cpu_has_monitor         boot_cpu_has(X86_FEATURE_MONITOR)
-#define cpu_has_vmx             boot_cpu_has(X86_FEATURE_VMX)
+#define cpu_has_vmx             (IS_ENABLED(CONFIG_INTEL_VMX) && \
+                                 boot_cpu_has(X86_FEATURE_VMX))
 #define cpu_has_eist            boot_cpu_has(X86_FEATURE_EIST)
 #define cpu_has_ssse3           boot_cpu_has(X86_FEATURE_SSSE3)
 #define cpu_has_fma             boot_cpu_has(X86_FEATURE_FMA)
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/=
hvm/hvm.h
index f02183691ea6..0fa9e3c21598 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -383,11 +383,6 @@ int hvm_copy_context_and_params(struct domain *dst, st=
ruct domain *src);
=20
 int hvm_get_param(struct domain *d, uint32_t index, uint64_t *value);
=20
-static inline bool using_vmx(void)
-{
-    return IS_ENABLED(CONFIG_INTEL_VMX) && cpu_has_vmx;
-}
-
 static inline bool using_svm(void)
 {
     return IS_ENABLED(CONFIG_AMD_SVM) && cpu_has_svm;
diff --git a/xen/arch/x86/mm/p2m-basic.c b/xen/arch/x86/mm/p2m-basic.c
index e126fda26760..08007a687c32 100644
--- a/xen/arch/x86/mm/p2m-basic.c
+++ b/xen/arch/x86/mm/p2m-basic.c
@@ -40,7 +40,7 @@ static int p2m_initialise(struct domain *d, struct p2m_do=
main *p2m)
     p2m_pod_init(p2m);
     p2m_nestedp2m_init(p2m);
=20
-    if ( hap_enabled(d) && using_vmx() )
+    if ( hap_enabled(d) && cpu_has_vmx )
         ret =3D ept_p2m_init(p2m);
     else
         p2m_pt_init(p2m);
@@ -72,7 +72,7 @@ struct p2m_domain *p2m_init_one(struct domain *d)
 void p2m_free_one(struct p2m_domain *p2m)
 {
     p2m_free_logdirty(p2m);
-    if ( hap_enabled(p2m->domain) && using_vmx() )
+    if ( hap_enabled(p2m->domain) && cpu_has_vmx )
         ept_p2m_uninit(p2m);
     free_cpumask_var(p2m->dirty_cpumask);
     xfree(p2m);
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 0c5393cb2166..e5141f819330 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -918,7 +918,7 @@ void vcpu_show_execution_state(struct vcpu *v)
      * region. Despite this being a layering violation, engage the VMCS ri=
ght
      * here. This then also avoids doing so several times in close success=
ion.
      */
-    if ( using_vmx() && is_hvm_vcpu(v) )
+    if ( cpu_has_vmx && is_hvm_vcpu(v) )
     {
         ASSERT(!in_irq());
         vmx_vmcs_enter(v);
@@ -947,7 +947,7 @@ void vcpu_show_execution_state(struct vcpu *v)
         console_unlock_recursive_irqrestore(flags);
     }
=20
-    if ( using_vmx() && is_hvm_vcpu(v) )
+    if ( cpu_has_vmx && is_hvm_vcpu(v) )
         vmx_vmcs_exit(v);
=20
     vcpu_unpause(v);
--=20
2.34.1

