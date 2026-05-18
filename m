Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OhyK9QQC2pN/gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 15:15:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4367656D6EF
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 15:15:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311847.1582003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOxnl-0000hi-MT; Mon, 18 May 2026 13:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311847.1582003; Mon, 18 May 2026 13:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOxnl-0000es-JY; Mon, 18 May 2026 13:14:33 +0000
Received: by outflank-mailman (input) for mailman id 1311847;
 Mon, 18 May 2026 13:14:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wOxnj-0000bp-OX
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 13:14:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOxnj-009DNN-4d
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 15:14:31 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a0b10aa-e002-0a2a0a5209dd-0a2a45039368-46
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 15:14:31 +0200
Received: from [52.101.56.13]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a0b10b5-672d-0a2a45030019-3465380dc3c7-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 15:14:30 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by BY5PR03MB5111.namprd03.prod.outlook.com (2603:10b6:a03:1e2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Mon, 18 May
 2026 13:14:28 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 13:14:28 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuZlb7uKpvo9maczxH5N2NRCmDsTD9umaTmUdvS5IkGAFvhCQekVHSkTnsCcGuXGUF7380MpWvtVyprRSq/YRP/03NCOFmoSFc1hQ3YNYYCApnGOFQxyOCu9j8QReHyJjNOXPtgl9ygm3yMSgbbKGf3h+0bV+vee1jgqUVemoIiOCfotAFpn4nfbIMadR8oc/vFsp7LQGrU6XxcNRwySkZT6uPWh1FSpx3NBayikA9pfGprJmQa5GFWtsBiSE6t/6MtfOzbKd9iE8huHKhFtGdSNaD55/rlUjjUkozizHhyS/8+CPCqQQI6dNlVeUfvPyI4vv6Yvlf9KU8x/pkM3vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E01jp2Z6iewjF/MH52l40+JkT5jeEYpzfDYIumrs0IU=;
 b=GmPxPmJYcPiUyvgSKXypjGxedEU1SZdONU3G4BAKk1GPaHRzIf136TGiYJYM8Edn9Sf3RZLe3/qR/+Yuvj0QdpPPsCouz6ivFaokujG9Eg7i/haZYqPhX2xS5N131GTupEh8w1lLWz6bqyu3aw6FfZ6cfnalTuzKEXb2mARyxNpeHenFNA1/rmggHDglL1ujQ6z2jIWMa52YJIrP4rkFsesB4KYaSsmoF4gQ2mjWUu3D1TfsC0Q8UDBm8c4uXP59QJZ4OHBwJ+/1fQQW1HoNd+xmZ6JRVX5cpi6qx7QcYtuj+r+Zxkd8bKh7c9H9LehS0W3Ce2dchXSZ4Yza1F3+dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E01jp2Z6iewjF/MH52l40+JkT5jeEYpzfDYIumrs0IU=;
 b=JrwbENw0EVUBYb4agrMGNpL2rI8b8GClIi7jG6z6/M+168/nghVqLdNhwqC18zIEG1Lh/yYMF4fZtyW8O0qCaqoW77E8e9/tnkymvMgA9YiAMzDfijhZePO4Qx5YOoFLIm1r1Bu2ocWfI5uX/z+1FB5if1eNoO/4082PMCPj9+M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [RFC v1 4/7] x86/hvm: Support a fast path during emulation
Date: Mon, 18 May 2026 14:14:01 +0100
Message-ID: <20260518131404.3716969-5-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
References: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0362.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::7) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|BY5PR03MB5111:EE_
X-MS-Office365-Filtering-Correlation-Id: a667065c-4896-4d76-7bec-08deb4df63a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	hBjlCrB1Viehht3VOiAvG64AanGlSpYCI0pn6mohhk++38UJMu0gdyM7CS2Njso6dJuGzHN62c5xoFe0soDWZo9SfDHOV3/sCKAOk77kMrX+5qb7Qc/l4BgBniRP/tXDxvfZibVt1XUCJ+Xw36kt55Ah82kVGCyx3I7QbwIwfD2FYS+r/tRmSjULQHpwxbj/eJnb28V9SGjknPhlNjn8351To1CZvDF6s7cAI0H3VNK1ayRh5rjWoEt9tZfIT0+BEuazKI6fyzFXeyJxrUvmCMr3M366Tyi22SiSyVtEW20KDPv6U9NA8FahyYRCBAsEraDxkFRQsA86xitzIlMolAWW97YwIGavYCqJzcrr/wAlzFuCgOgKJy0cfuDMFLWxI/VpScrcCW9hnO7jW6xqwn6q0Km1MtYeMVbEtLlAhd5AmqGTgbOcuJBmeSLEQ6aYp95ArFNTlJXxXKnozyRz7FvsSouR+LgtMBnblGskF8/kiXZgZR6KKyD19waFvMUpwl3PTAneD+hQ1NbX0UVmC6Tr1f0H7j8y87gwCO/LKqsNJty3+FXGiuCrPBX4pv9CG9goqRWTm0asxozXm+3E9yWZdRu1b07eRsj4A3rSxw2L2ZFqulxRYNxTK5XWw9iSjDu494ySfyycX+y7dAChhmNU0jI66rVr1K1uHxr840jThlzc2gM/I3oHerkDjLpY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pcg7YG4MRPTQfOJorsLSmhTh2LWk9D8OY62tusqrtFjdpzn3C0pzJkadcjzL?=
 =?us-ascii?Q?4MOTLNJamGJ/RiZfqMEI6JzrUEtrbV8sK+flCSuMVuhmStoGEcWYsz9zigkG?=
 =?us-ascii?Q?I1GXjXJRcI1sEnuKQyJx+UUCx0QdpEryl2Ed79CtGzkbzLXh6iUTMpAo6CD3?=
 =?us-ascii?Q?Oz11ZAZaTtUtR8Y1Dq/D7WXgK7lGVszAMC9eAN63DuC7ab3hKdomcufEQRhG?=
 =?us-ascii?Q?vqOo0mMnPYe/yimQQ+d6APS3SN+NYqZgA+nwYqLbYp8cFFYkzfi+ffsTQAq1?=
 =?us-ascii?Q?ZxTlVsJa6+V99NLiMWTow+/2t3a4sEz/Es5/kg7jNEL8Q5z7ueHrmgSLeLhD?=
 =?us-ascii?Q?jlF+FJ58R50Q/syzGqu7GFx7SQbbZbg5FNZmvERwfoi7Pe60gXyyqhjgkN3T?=
 =?us-ascii?Q?Sy7RTL8Z+OVqN2RZ58g+3rzyc9AYZQZ3J3p6fbbQXuAdcZ0vaN3/R/l12vzd?=
 =?us-ascii?Q?hvY0NUpFNpbMytT7ZKIvIqUWgIKGhuco8QGE8I0PDcN/qmZBOz+k+Ifg/f1N?=
 =?us-ascii?Q?Czfe0LhKGsa2/lYwFK7/Yo3QzvuDRDSgEIdSTV7jD9UlIdMYt0GbitkYnMqf?=
 =?us-ascii?Q?FmFMi343J5UBH2nXHn1hFzpik0ob/4JsBxPH9xCdXIm8ZDXf4+Uw/TS96KvE?=
 =?us-ascii?Q?SGPlCm3d4jRvJazT2Sw2oKBfulWjeLQE22cQh8pjWqSKvZYRjr2dhmOSnCGa?=
 =?us-ascii?Q?hyOR5hZQlzLaUxempvH3pFrXRRqe8zzw1PSnQRBVVXZhjAnYcaO2IMLcVhjI?=
 =?us-ascii?Q?Qo4daVEl4CX/koEbnUr5DAhnoZnag3CjekMEC3lLcuEX7HLQN1UdyIgBUPcy?=
 =?us-ascii?Q?PIH9t2p5k7xpwwHvRUxNPYLySf9p4hqtxQ6pCn4yST/o4EYvV5g4SS8uj5Q7?=
 =?us-ascii?Q?wEIL0TFKuk/QrPL5ZuCjYS5SNDAzZAdckoJDRGiGcgoMcYDRrDxMPRcRvjZA?=
 =?us-ascii?Q?efWEjIFEG4DZoBg7W30h2tjjrERbskM2OrCL3Jv6rZOtmRiSinxvjDQlhYmr?=
 =?us-ascii?Q?h/1S+EbwRDdKBn6TTR1ji4HUowTfRiZpkW4eRZz87mE/IDs4jO79xHmp1WOc?=
 =?us-ascii?Q?GNWv6MAuNie+1GZtONKC3cAmD1w4/bmuA4H9oXqVrekkG1yOUA1iAd0U7ZBw?=
 =?us-ascii?Q?jNwp5lg0N9y5b3Qb4ACGW2IdjbmhNf2KccP0TXVOGVnqrOzzPCvEhx+JHeaN?=
 =?us-ascii?Q?l+L4g6eDJcC4Y9JZODhC7veDbAq/XEmbrVp5AM/XRPDHP/3m8X5KigaKaJa4?=
 =?us-ascii?Q?BTkGgyU947aAyVkv07AQwxNMdjQZddsQCGweAR676upMH6Xcrq3uX7xRjDKU?=
 =?us-ascii?Q?fCLnksue8rq6QM7s1oS17qzQRVJ1vNb2mW1LHGdxUz/leHqXh9DCuJl6DlU9?=
 =?us-ascii?Q?n6H3PuxtC8xpF5gXSu7E92m4rF44dpttT0KRYsTTpi9hnNjYOjYSZZtrNi7F?=
 =?us-ascii?Q?SFHjoNWBmGXlfDg5wf36+SSdgAPzENXD2S0kVGt8iq7nIjPLBf4ZnEusBatT?=
 =?us-ascii?Q?pj1fqkvL7+iGeeUt7nBCiMeAdoj6SCBHLVVGcQysgcR+UrsJGkaCikj6AbfW?=
 =?us-ascii?Q?8XtQ9GUpy2AMnf56b4KbNDi8Nahgps9W7jnDjU6eAUnhggsORLc0O1s+ztlj?=
 =?us-ascii?Q?Ub5Orc4LR+Hs1vEEDCcbAKT/V0AZLcJZeg5jdazHLG2hY4MI/lXM2isme4tp?=
 =?us-ascii?Q?TGvycLtPT+mCh3/i4i82QSGv8txqoZ/cyTGgI/xfoKNkq77LC0Dw5x41eF2J?=
 =?us-ascii?Q?BhSGVrlAgyWok678mMiHYHMMD7PoTfM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a667065c-4896-4d76-7bec-08deb4df63a9
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 13:14:28.1158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c7n2IhOyE3uYNtBgqv10I+vFnmtCAoENlcYYeNHyIV9SjaUmipL85TzaJ1BKGpfE+fHdA1+7/cYY1kBAnpBtw7EXE8OGsGWYjUvxa6fEWW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5111
X-purgate-ID: tlsNG-33051d/1779110071-4066C938-B80763D6/0/0
X-purgate-type: clean
X-purgate-size: 8277
X-Rspamd-Queue-Id: 4367656D6EF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:mid,citrix.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Information to complete the instruction may be provided by the processor
during a VMEXIT. Add a fast path during emulation to use this
information and avoid going through the full x86 emulator. Plumbing the
fast path through the emulator ensures consistent behaviour.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/emulate.c             | 160 ++++++++++++++++++-------
 xen/arch/x86/include/asm/hvm/emulate.h |   3 +
 2 files changed, 123 insertions(+), 40 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index a96d7814f91c..c9553cd28238 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2724,6 +2724,52 @@ static const struct x86_emulate_ops hvm_emulate_ops = {
     .vmfunc        = hvmemul_vmfunc,
 };
 
+static int hvm_emulate_insn_len(struct hvm_emulate_ctxt *hvmemul_ctxt)
+{
+    struct x86_emulate_state *state;
+    unsigned long emul_len;
+    unsigned int instr_opcode, instr_modrm;
+    unsigned int modrm_rm, modrm_reg;
+    int modrm_mod;
+
+    state = x86_decode_insn(&hvmemul_ctxt->ctxt, hvmemul_insn_fetch);
+    if ( IS_ERR_OR_NULL(state) )
+        return X86EMUL_EXCEPTION;
+
+    emul_len = x86_insn_length(state, &hvmemul_ctxt->ctxt);
+    modrm_mod = x86_insn_modrm(state, &modrm_rm, &modrm_reg);
+    x86_emulate_free_state(state);
+
+    /* Extract components from instr_enc. */
+    instr_modrm  = hvmemul_ctxt->insn & 0xff;
+    instr_opcode = hvmemul_ctxt->insn >> 8;
+
+    if ( instr_opcode == hvmemul_ctxt->ctxt.opcode )
+    {
+        if ( !instr_modrm )
+        {
+            hvmemul_ctxt->insn_len = emul_len;
+            return X86EMUL_OKAY;
+        }
+
+        if ( modrm_mod       == MASK_EXTR(instr_modrm, 0300) && /* octal-ok */
+             (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) && /* octal-ok */
+             (modrm_rm  & 7) == MASK_EXTR(instr_modrm, 0007) )  /* octal-ok */
+        {
+            hvmemul_ctxt->insn_len = emul_len;
+            return X86EMUL_OKAY;
+        }
+    }
+
+    printk(XENLOG_G_WARNING
+           "Insn mismatch: Expected opcode %#x, modrm %#x, got emul_len %lu\n",
+           instr_opcode, instr_modrm, emul_len);
+    hvm_dump_emulation_state(XENLOG_G_WARNING, "Insn len",
+                             hvmemul_ctxt, X86EMUL_UNHANDLEABLE);
+
+    return X86EMUL_EXCEPTION;
+}
+
 /*
  * Note that passing VIO_no_completion into this function serves as kind
  * of (but not fully) an "auto select completion" indicator.  When there's
@@ -2733,63 +2779,97 @@ static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
     const struct x86_emulate_ops *ops,
     enum vio_completion completion)
 {
-    const struct cpu_user_regs *regs = hvmemul_ctxt->ctxt.regs;
+    struct cpu_user_regs *regs = hvmemul_ctxt->ctxt.regs;
     struct vcpu *curr = current;
     uint32_t new_intr_shadow;
     struct hvm_vcpu_io *hvio = &curr->arch.hvm.hvm_io;
     int rc;
 
-    /*
-     * Enable caching if it's currently disabled, but leave the cache
-     * untouched if it's already enabled, for re-execution to consume
-     * entries populated by an earlier pass.
-     */
-    if ( hvio->cache->num_ents > hvio->cache->max_ents )
+    if ( hvmemul_ctxt->insn )
     {
-        ASSERT(curr->io.req.state == STATE_IOREQ_NONE);
-        hvio->cache->num_ents = 0;
+        hvm_emulate_init_per_insn(hvmemul_ctxt, NULL, 0);
+        if ( !hvmemul_ctxt->insn_len )
+        {
+            rc = hvm_emulate_insn_len(hvmemul_ctxt);
+            if ( rc == X86EMUL_EXCEPTION )
+            {
+                x86_emul_hw_exception(X86_EXC_GP, 0, &hvmemul_ctxt->ctxt);
+                goto complete_insn;
+            }
+        }
+
+        switch ( hvmemul_ctxt->insn )
+        {
+        default:
+            ASSERT_UNREACHABLE();
+            rc = X86EMUL_UNHANDLEABLE;
+            break;
+        }
+
+        if ( rc == X86EMUL_OKAY )
+        {
+            regs->rip += hvmemul_ctxt->insn_len;
+            hvmemul_ctxt->ctxt.singlestep = regs->eflags & X86_EFLAGS_TF;
+            x86_emulate_complete(&hvmemul_ctxt->ctxt, rc);
+        }
     }
     else
-        ASSERT(curr->io.req.state == STATE_IORESP_READY);
+    {
+        /* No fast path. Go through full emulator */
+        /*
+         * Enable caching if it's currently disabled, but leave the cache
+         * untouched if it's already enabled, for re-execution to consume
+         * entries populated by an earlier pass.
+         */
+        if ( hvio->cache->num_ents > hvio->cache->max_ents )
+        {
+            ASSERT(curr->io.req.state == STATE_IOREQ_NONE);
+            hvio->cache->num_ents = 0;
+        }
+        else
+            ASSERT(curr->io.req.state == STATE_IORESP_READY);
 
-    hvm_emulate_init_per_insn(hvmemul_ctxt, hvio->mmio_insn,
-                              hvio->mmio_insn_bytes);
+        hvm_emulate_init_per_insn(hvmemul_ctxt, hvio->mmio_insn,
+                                  hvio->mmio_insn_bytes);
 
-    hvio->mmio_retry = 0;
+        hvio->mmio_retry = 0;
 
-    rc = x86_emulate(&hvmemul_ctxt->ctxt, ops);
-    if ( rc == X86EMUL_OKAY && hvio->mmio_retry )
-        rc = X86EMUL_RETRY;
+        rc = x86_emulate(&hvmemul_ctxt->ctxt, ops);
+        if ( rc == X86EMUL_OKAY && hvio->mmio_retry )
+            rc = X86EMUL_RETRY;
 
-    if ( !ioreq_needs_completion(&curr->io.req) )
-        completion = VIO_no_completion;
-    else if ( completion == VIO_no_completion )
-        completion = (curr->io.req.type != IOREQ_TYPE_PIO ||
-                      hvmemul_ctxt->is_mem_access) ? VIO_mmio_completion
-                                                   : VIO_pio_completion;
+        if ( !ioreq_needs_completion(&curr->io.req) )
+            completion = VIO_no_completion;
+        else if ( completion == VIO_no_completion )
+            completion = (curr->io.req.type != IOREQ_TYPE_PIO ||
+                          hvmemul_ctxt->is_mem_access) ? VIO_mmio_completion
+                                                       : VIO_pio_completion;
 
-    switch ( curr->io.completion = completion )
-    {
-    case VIO_no_completion:
-    case VIO_pio_completion:
-        hvio->mmio_cache_count = 0;
-        hvio->mmio_insn_bytes = 0;
-        hvio->mmio_access = (struct npfec){};
-        hvmemul_cache_disable(curr);
-        break;
+        switch ( curr->io.completion = completion )
+        {
+        case VIO_no_completion:
+        case VIO_pio_completion:
+            hvio->mmio_cache_count = 0;
+            hvio->mmio_insn_bytes = 0;
+            hvio->mmio_access = (struct npfec){};
+            hvmemul_cache_disable(curr);
+            break;
 
-    case VIO_mmio_completion:
-    case VIO_realmode_completion:
-        BUILD_BUG_ON(sizeof(hvio->mmio_insn) < sizeof(hvmemul_ctxt->insn_buf));
-        hvio->mmio_insn_bytes = hvmemul_ctxt->insn_buf_bytes;
-        memcpy(hvio->mmio_insn, hvmemul_ctxt->insn_buf, hvio->mmio_insn_bytes);
-        break;
+        case VIO_mmio_completion:
+        case VIO_realmode_completion:
+            BUILD_BUG_ON(sizeof(hvio->mmio_insn) < sizeof(hvmemul_ctxt->insn_buf));
+            hvio->mmio_insn_bytes = hvmemul_ctxt->insn_buf_bytes;
+            memcpy(hvio->mmio_insn, hvmemul_ctxt->insn_buf, hvio->mmio_insn_bytes);
+            break;
 
-    default:
-        ASSERT_UNREACHABLE();
-        return X86EMUL_UNHANDLEABLE;
+        default:
+            ASSERT_UNREACHABLE();
+            return X86EMUL_UNHANDLEABLE;
+        }
     }
 
+ complete_insn:
+
     if ( hvmemul_ctxt->ctxt.retire.singlestep )
         hvm_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
 
diff --git a/xen/arch/x86/include/asm/hvm/emulate.h b/xen/arch/x86/include/asm/hvm/emulate.h
index 084e2bd90588..1e626f8af8f2 100644
--- a/xen/arch/x86/include/asm/hvm/emulate.h
+++ b/xen/arch/x86/include/asm/hvm/emulate.h
@@ -53,6 +53,9 @@ struct hvm_emulate_ctxt {
     bool is_mem_access;
 
     bool set_context;
+
+    unsigned int insn;
+    unsigned int insn_len;
 };
 
 enum emul_kind {
-- 
2.53.0


