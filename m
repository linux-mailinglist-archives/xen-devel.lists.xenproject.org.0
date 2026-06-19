Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iv3TJ8OMNWrZzQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 20:38:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BD56A7671
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 20:38:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=gRLmta2x;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1342621.1602677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wae6D-00019j-Re; Fri, 19 Jun 2026 18:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342621.1602677; Fri, 19 Jun 2026 18:37:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wae6D-000175-Oj; Fri, 19 Jun 2026 18:37:53 +0000
Received: by outflank-mailman (input) for mailman id 1342621;
 Fri, 19 Jun 2026 18:37:52 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wae6C-00016z-Iu
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 18:37:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wae6B-00GOtS-OZ
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 20:37:51 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a358c75-e002-0a2a0a5209dd-0a2a450c8764-6
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 20:37:51 +0200
Received: from [52.101.66.95]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a358c7f-94a4-0a2a450c0019-3465425fad8a-4
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 20:37:51 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by DU5PR03MB10523.eurprd03.prod.outlook.com (2603:10a6:10:525::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 18:37:49 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%4]) with mapi id 15.21.0139.018; Fri, 19 Jun 2026
 18:37:48 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z3lEUtxFur0hB/wqvueqWLNioBat4iLi6Qj/s+dCXMl3798dXg0Qq/B2cnDIrSSdMhDUV+7ICEByx2UV3PCp7BLpqfSj2SHy6/Af/2PzFhdingV+rWhTn3+49//23NKBb9Dnr7Wjcj0DVmu4HgNqugdJ3qwpJArY3eYqAffgJDx1PAlXMhBwgrW7ykzN/f+hfYtS1TWS8Fx1iUpldfpCvMtlU7KiYFgLZTQpszt3fl7UDv70SsRNadJ0OHkENBq8As3e3zMD6JNP/y6L6GYujlUIkcod6wEGkZ6S2oj0bxB98NbCbU209LLTaBAjPvtOGqbUEHdJrcnAbMRbmyTf2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pExjzv71O2OjFeZiCvLguBuONPyYVmPDW24YAYPi3ac=;
 b=MoGDx224fyodRO/GfnNucb4aiyNSKgwtQAFpbKYeRyshGoJ2ZLB94WDU7ruEHEdFmXhxmqvL5Ru1dqdGwwiYgPGB3r69OyX7SjfMiAK/exJWpra8QOskY4Vg7PBDb8WffM9C/qBwkBXRVA12/sjgUHxOmc9tBP/Z/0gPDcoLcnOK1gkohSaTGzsTRJ3OI8reC6cDJzjp7Egd21VgkBiZ1v/6sLTMZaFwzXEDrZ0arLsU2grPyRvRarY9mAFNWnlypUJ/wmXyVe6E6Wx/26sE2s/I+nkIh4WZPjmDDlYcZ/iLCLOjorlRbEnO8psvPQuNzxeuLpf0JAgBhXzYHVoGag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pExjzv71O2OjFeZiCvLguBuONPyYVmPDW24YAYPi3ac=;
 b=gRLmta2xK6SwtJV9iZ3mHSdpssAeZCIXNDLlPIB4oqoXJjvpvkPyuAYkNRkgIlYSO2N8NsP711kY+ZoPUjRPHEJR+DnCqkWsuAZ0h8YKtlDGjDpKGrB7A2VOq4Mp857IAoPFKFkI9LaV8IoZbGoIkNAlFYaG8KsPtvdAUCLV9n8cnfXil1Oy5+6DwkqAvIOzNLU1vdyLy/z5Myagm9DHYplqkOvBS+GhO/A3NOeSbL+KMFsGERmasg8pZAbOEZFtSg+UpSBqEYzbZm0CC+HBBO52qRTGUD0OdmXXosWFKwg3Z8yMhdAiezIIMRpALmFk51bLmS/dT60kxNgpE0IhaA==
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.22?] xen/arm: mask debug exceptions in initial AArch64 guest state
Date: Fri, 19 Jun 2026 21:37:38 +0300
Message-ID: <74e132a5f3dff64be5bd0c04eb82fe78d9c2fe84.1781892316.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1PEPF00005B8E.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::62f) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|DU5PR03MB10523:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f0fcbe9-8ff5-47f2-5167-08dece31dc76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|11063799006|3023799007|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	v4wlEDjmh4VVJhGnYoG34xQ4RqayOWPBQT3LX/Wo9oebdgEawyBFIiqi3ese5Z2V1ZjSce5G/45e0l9l4ERLPKrdW1hSW91pJn/ISdjvT58ELHlwWVQkKAcxkQOVE0HDtAH3be3SLMwEm7uKsYKJrSwrHi8vYTlmRkP+U7Wp+LD35Lqpc8mYE8R0Cl2myDMiQN1+md40L8US0ugdON+IfqnRTVWOD1q3D+cu2ucTf5g9tLJTcR+GHu94WuUf3Rkj9gELGfG5pGOoZuKpSteXcIZTPjEJ/dB23JY0Mci0OlKoOmopMxAUdDPOxivf8MuoG6K47Y7AbasW6LlDbJqZjMQumfOPeiDvj8QEag3o1b7xt+NGB8JRyi3xh9z/ijxkwPmYYx5qOInZxt7E1G2UQkR3ljtRfI2VGOeK4i2PcLhYGvsr+QLLQMIrPyrQ33gCFYxsIUISAcX/yg23V2m75AQLoIuYWv0G3vU2ZG9jXMRjQWdzkkghPhBpOhzyjcMw21VV+IzgjIX+TrmqwYK/mJqOplQcMskFa1VeFirFR5/2AAHHm3Pfio+oV0jCzLSyuMjbbsd9y+vEcrln7eJDe5vH6v7/+p5XgBr3BPc3frQUsy0V/kZIzByklscmCn5tPGvuthKwFQXC2FckIwjR/073Lhyb+qr9rhqm8c5AKa4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(11063799006)(3023799007)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2B40ECsqJOyGb6f4D3k09+QmGgvYRv2KlPzBCddGaxzPiYzuYNblU3GxQOsx?=
 =?us-ascii?Q?x2eTW4aCuyWZiBlDWL0JcASelbwUFWnTyF1VO3aKSqDoTSLGlwr1fyal585D?=
 =?us-ascii?Q?r65sltPD8AkSwHcfN1VPSc2LSBV1AFbrr4G+PpExMvWxs3L7w8WzGGprOrxM?=
 =?us-ascii?Q?0+7jcz3JcVfgnNS2S3M7Hdmo3miXMafwC+FGXpVlshEDqVNFLGE5cLH4a8zC?=
 =?us-ascii?Q?HH/7kIxu2haaBhpFrHWlO7lEZ9TqZdYsEZI6xOolI2M+vte5z8PhM55xK9Rw?=
 =?us-ascii?Q?HVHbxHYgiHkHN2hEXRpcYUULm6RquWHEeDug9F++ZkZi/btIXAWsj07VyDUK?=
 =?us-ascii?Q?05jzK2M01od0KWgo5DM+ojj9uuHZnLHHNOg21SgNZjVmVcgnFQvPDAjc3Ors?=
 =?us-ascii?Q?L+cFNdWy6w0B/jZM8ZNwIVsYptQHB5SeWTqfC1vWRBsOufW7ygvsWsfSP3V3?=
 =?us-ascii?Q?pViecPj82SppVy+DI0Yryd0HRlt3prjcRAa6XV/mmIrauCuxbjCtQoOlNIwL?=
 =?us-ascii?Q?dDu3jZqthgnpxYE0+fcRWRVGTlGgduGkMyLOSPGRyfR2VnXkN2m4lb58BL4Z?=
 =?us-ascii?Q?mrKdrQM7k5McfKGNxD3qnTfaHpraB/IdHan1sq7Yu9hvppXA6uIldkjfgppO?=
 =?us-ascii?Q?dvTBsH+5161YEb1CY/nKEsqrYdvbStR0pvuxDTOCmZoTvVOcvyPi//9t3eaz?=
 =?us-ascii?Q?mExBjMXXrOY0i/VFV02rV+pDGkNDxmcZzYVuvgv1NzSnIhAm+RQhYRlfqYKC?=
 =?us-ascii?Q?l9TLYnc+p8wp9mD567HZDW2Mkmvy+ThNvNEoXQQcCVtxEgfnSjiT0mo3zqmA?=
 =?us-ascii?Q?PeRze/Lb700Sq0ggHk8J8U6SqmGo05t7VQXhpIhYmqx0ZoRiaOgV+tR6xmqI?=
 =?us-ascii?Q?ZoSGg0e5QA9zhOUSlfnFZw9eEk3e/aAmdWrfWq9mVrypR2t22khcfxmVm6S1?=
 =?us-ascii?Q?E/8aTCFGUekMu6mRhiEUpLA/wGVuINIn5MaqappvB7pUR2hRKMgvESf7Pekd?=
 =?us-ascii?Q?l3RVmh/fbjk5dfqFaVYcK34O2iRSb6aPOvt6hQ4pyvCPC4wgOYecL1jSW+Ye?=
 =?us-ascii?Q?2akq4oek20MmnI0uShgM3tnRXnhs08Xj0G1udfnQsZ+OB9e6QMhwaa0p4537?=
 =?us-ascii?Q?B8NwGo+hTirmNA8Id+ZF5Loor2eQN39AvG6YmPn0P5CfCfAjj8t0s9VebDXW?=
 =?us-ascii?Q?2r8HeIg02XJq+1m4wmoLNMjifV8lXqa81GXpQqzAtudg5G7OF99z5S4KvbgU?=
 =?us-ascii?Q?giwvw7wkRSVKY90/J6NZ6Z6nj+TIt8mZk1i3EOWDUvrfcn3FAvMciEo+7ejz?=
 =?us-ascii?Q?6ehjf1X7WTlG+TzcVaGSB9jRO51l5Lzjw7oiuC6PyRkm3bWRDQTnvBv58eH8?=
 =?us-ascii?Q?UNGp7Psmr38fNRhMhu4r8Xy3HS6+70Ypqnj7Jn7DPXs0SvriAtIshr92QTDf?=
 =?us-ascii?Q?x4p5bkXXPfEA6hSTcO3DBRpyarLhzIq87AncMdpZNW0yoCSYGQ0XL0oNm58l?=
 =?us-ascii?Q?Lmhs1rrLdN6YBJCNsF8n6IbDvF9gvsJYra5j5Xdz5pVVzK0RaANjeaI4NnTB?=
 =?us-ascii?Q?UGmD/dK2GVhJsiPxvN5rqtAvaYJrYDmkM7pf5Uhao7Dmf5Y0AJvs6qsiGGhV?=
 =?us-ascii?Q?F4xUxmbTUcBn1+ZG02wrawhoBH2CcgJFFOLiHDtNZwiuX6UfhFmaeExcIUQy?=
 =?us-ascii?Q?MzP60t6kPPPWRvgYhrTqHZHHF0YUEOwbiWmu56aWcTNAK478tQcvscmLFHkJ?=
 =?us-ascii?Q?TjZ+GBsdkw=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0fcbe9-8ff5-47f2-5167-08dece31dc76
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 18:37:48.2889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b81xXZIMxbRSJPPKiYk13hGUnUFt5258yCIjl31covSRZaHAdncDGqfFo645f9yAnpqpPFJtsBmn7W+O/dxndg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10523
X-purgate-ID: tlsNG-d25034/1781894271-521F6ABF-289CA542/0/0
X-purgate-type: clean
X-purgate-size: 1127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,amd.com,epam.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	FROM_NEQ_ENVFROM(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:email,epam.com:mid,epam.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1BD56A7671

PSR_GUEST64_INIT currently masks SError, IRQ and FIQ, but leaves debug
exceptions unmasked. Both the AArch64 Linux boot protocol and PSCI entry
requirements expect PSTATE.DAIF to be masked.

Add PSR_DBG_MASK to PSR_GUEST64_INIT. This fixes the initial AArch64 guest
entry state as well as virtual PSCI CPU_ON and SYSTEM_SUSPEND resume entry.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/include/public/arch-arm.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 7d6f87e8b2..00de30b896 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -420,7 +420,8 @@ typedef uint64_t xen_callback_t;
  * zImage kernels on aarch32.
  */
 #define PSR_GUEST32_INIT (PSR_Z|PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MODE_SVC)
-#define PSR_GUEST64_INIT (PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MODE_EL1h)
+#define PSR_GUEST64_INIT \
+    (PSR_DBG_MASK|PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MODE_EL1h)
 
 #define SCTLR_GUEST_INIT    xen_mk_ullong(0x00c50078)
 
-- 
2.43.0


