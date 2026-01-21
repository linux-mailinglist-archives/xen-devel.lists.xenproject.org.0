Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKPJJyvjcGkhawAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 15:31:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AA758748
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 15:31:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209825.1521725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viZDt-0006yA-65; Wed, 21 Jan 2026 14:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209825.1521725; Wed, 21 Jan 2026 14:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viZDt-0006vf-2j; Wed, 21 Jan 2026 14:30:17 +0000
Received: by outflank-mailman (input) for mailman id 1209825;
 Wed, 21 Jan 2026 14:30:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6Gw=72=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1viZDr-0006vP-Qe
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 14:30:15 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0cdb3ca-f6d5-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 15:30:11 +0100 (CET)
Received: from MN2PR07CA0017.namprd07.prod.outlook.com (2603:10b6:208:1a0::27)
 by CH3PR12MB7545.namprd12.prod.outlook.com (2603:10b6:610:146::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 14:30:05 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:1a0:cafe::ad) by MN2PR07CA0017.outlook.office365.com
 (2603:10b6:208:1a0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 14:30:03 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 14:30:05 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 21 Jan
 2026 08:29:59 -0600
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
X-Inumbo-ID: b0cdb3ca-f6d5-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvLvv+FEqey4y586Ljw+gykamMZ9gw6N+/JGfh6GVBU7s9+aWlpfTDaA7+3xEdwWsn2DF54A40UwDKbWlDxI+zWdJTJoN3nZu9vPtLv5gi1AFqvlrhUeQPN6KSDaG0UM0HFGS972LU0eou95dA8FCwKq1w104Mib7y/Xsu+NyZL961FAL4Bw0Rtwmqxn5ik45f3mQ3K+hmEejOn9RUe9OfQMBdHaIxPdumXux6RWmdQpGXJeloPx4GKdxUs6NhGgDOtZIuimeOdPyr7YMdVc8Kd8ISZ14M9Qns5TPrgXV2nV5JqlGLMRZ2Z2K7NbWLWUuPMXmsXuP4LohxAb8iKAKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFUWMJIT5ILfQMVeeOtM43khGeImb8Dazel0lpTU+JI=;
 b=PPSHd1rU910IYCDj95oR6HvpDL78hj7kZpTkyVtc5oYkmWBhL5TV168ujJ2F6iU4tq3aggu3KfxdxPlx6QSFHwqskrFFOys9rqGKVBEN6uAomzOf8OOLDhgW2sdI5XpEckLmSoer+GRBfH/I8/Sd6rVd3Txeof8nIPKaS3QyPgAWmDVLnFE2hSBGMQOj/UwSpBHPPxAIOK4e7/uyINhkJNsSC3yyFF+ARSev/mI8gQwrtiYyqsGLNXRRs7ORChMlwHzphgzGLLln4B3/Zl/ZIXI9Q2VSLzSK8NB2WSjkztTAZTJY0PsqZ/WheTLEldtRJO6JGKivtMszxLPN9+T+Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFUWMJIT5ILfQMVeeOtM43khGeImb8Dazel0lpTU+JI=;
 b=W5tfzqibdDGkr3+zti6Sj+Pgi77hGPrae8n0idwiEaIvL1TmvNCqm8X37CUCV3hWS4JWWmlvGJA8hzhSXcOC9tovf6O7L8PsxoACZCUmKbY6zIXqiqEvTtgkqFN7pJcI214DFM/y90d0s7pQDiGXpRdz+MAyu85RTL41KmfptV4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: [PATCH v2 2/3] x86/svm: Intercept Bus Locks for HVM guests
Date: Wed, 21 Jan 2026 15:28:54 +0100
Message-ID: <20260121142857.39069-3-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260121142857.39069-1-alejandro.garciavallejo@amd.com>
References: <20260121142857.39069-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|CH3PR12MB7545:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c03ed46-9e11-4612-ca8c-08de58f99228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OkJlMPmvVlRd6iA0o4qTGp9Eco6j6T+UqYFQFtOHjT+8fHCs3NZMQyO3QNPS?=
 =?us-ascii?Q?SpyXRI5NT49an83+yi5LT29YmKhFmnNoh8q18oBCnCYUIMmMsLo9qYwr73Et?=
 =?us-ascii?Q?OK06AMazSUbkBgsZUohTYFmAkw1cXwOwLjXCC/sVcnx1Z1/g6WAr6/PjFNBR?=
 =?us-ascii?Q?FN23rxUt0NUKx+pMtwC0wO7m8djF3MkAKZbVwk1lrbJ0EhBQo3HYt2o2xfhG?=
 =?us-ascii?Q?ZFpn4NMZ4YKbq/tsIEu7bgEcweue3lwEM+NWCG37WkmTBI1fBfkYjoboNVQB?=
 =?us-ascii?Q?wKZBRqP92akkbwoTl2qLbql2vwdOY7zjGjnq/sooHvunX67yJtGdkka+UTcZ?=
 =?us-ascii?Q?md4qdv6Gs5CLG55RdeJ4qst06QlhDfVycOZVJTE66uD+y0rVqC3B44bBfkF7?=
 =?us-ascii?Q?Qnw90H46rrinadadKQdIrrIyumyXiIyepNh8AI9jmygGExlwC/rtpY6DT/7n?=
 =?us-ascii?Q?+VF8PEWVrKMMGccuucJ1cvYIATu8DoQMJLkrvlqRoN/704uw40MIwqFjehC6?=
 =?us-ascii?Q?ZJ54TBZmw6xWMM3lk9bVzDXXgr0ZY7SoXEc4wBRBbKj+/BfKriJ3aEPH2k8S?=
 =?us-ascii?Q?vyU4s3wJUb9j+IRhOrj7OY9J+D+88RYaXM4XLDiExgh/pIDlRx10KNlEKq9t?=
 =?us-ascii?Q?VxHr0VGPQVtTgCqY/34HNDc8lzdsfTc7c+uA0+C4E5f6Wsph4IzwOp0cBysJ?=
 =?us-ascii?Q?MV4pxYtONqfwjpXutDoNbKmv80rAJhLqP76VJbYKVz9/mW/gBf11mWcwmmLJ?=
 =?us-ascii?Q?P2DQOr16Eepfjv2lbWQ9/CVseu2QlNBboeJ7AtrclaHYlfoPmaIKEtsszBRp?=
 =?us-ascii?Q?vexPJoHr5YecIGMmxZyI0qnF/WLHyO35EFY1Z+zQGlqotDMIaqzJ47R0FbdZ?=
 =?us-ascii?Q?M8237oRyd6YetvQT3xUCaquSWq649i1zVFZj+AHDZEP2/xF+tAI9EB3ciL1U?=
 =?us-ascii?Q?FsjpaxgdAdULqGa1XasMJ7obV0sgHQSo7ee0Um+sa6DBFbSHohNpaIWKu6+7?=
 =?us-ascii?Q?nKU9CgQos3GLMR81o7PK81Kyu/3Wuc25GmSBLnE9jaVd9NOjEaba0kXUJhDV?=
 =?us-ascii?Q?z5N8YLHthAF7Ax5TGc4RXJEXDe2e2DN5OFElHjZNtlaIu9HMGK5D1j3L+VpO?=
 =?us-ascii?Q?NSAwH+PAXMGSwzyOqxnHlyjraxzbLpFyXexgHNvaavC20Nys+QcPgp3w8I39?=
 =?us-ascii?Q?2m9P/Jw8hq7OmZxFJn8Lbp9WSPhbq8Ewv2O/v1dJlMGWqxpv2Jt7jyabK5cn?=
 =?us-ascii?Q?OTUBK4Xl99hSHRupcCb5iYwylY6CqXpOtbbbO2UVyEpfs5cJ7CoxPoJF6SlU?=
 =?us-ascii?Q?fTGG3DRVWSkmtr1UkPeJBrKotx+l0oWFncqaaF2vr8MUs3RFd2evGBlNaod9?=
 =?us-ascii?Q?6ou2Rvk2liX/LmvxjJnLikuuM5+pZ/xPv7c/3Lo06Lm4efqdAHRV5gLjG/G/?=
 =?us-ascii?Q?0FEbVPfYWHA3ge1RerTITW91+esn5Y4mFfS8d22svrm3WLDoLxSBE9Dhxj6c?=
 =?us-ascii?Q?zqw6nVOeBjJDHrtLTT7inuXhNKSc8SWgCeBfHtQiat8RV0UcnrNzjTtU0sLr?=
 =?us-ascii?Q?lNJgI8rfmoIF8lZvP6h29HDfqZ1JYROFZtZwlexiNhpcs5CziCYjQb1nN8WY?=
 =?us-ascii?Q?Wvh2qgLz0BaOvgNuvt384G57gt0SqB9d5Gk5DbhhPautKMibLn/bLg0mZLLU?=
 =?us-ascii?Q?Tb5kBA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 14:30:05.4981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c03ed46-9e11-4612-ca8c-08de58f99228
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7545
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 57AA758748
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Configure the Bus Lock intercept when supported by the host. The
VMCB counter is initialised to zero so it fires upon the first
instruction that locks the bus. On the #VMEXIT handler that counter
is set to 1 because it has fault behaviour and the offending instruction
needs to re-execute.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
v2:
 * Moved the P() call to this patch. We don't want to print until
   the feature is fully supported.
 * Removed the initialisation of the counter to 1 in vmcb.c, so it's
   implicitly zero-initialised.
---
 xen/arch/x86/hvm/svm/svm.c  | 6 ++++++
 xen/arch/x86/hvm/svm/vmcb.c | 3 +++
 xen/arch/x86/hvm/svm/vmcb.h | 4 ++--
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 5d23603fc1..abda5a9063 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2524,6 +2524,7 @@ const struct hvm_function_table * __init start_svm(void)
     P(cpu_has_tsc_ratio, "TSC Rate MSR");
     P(cpu_has_svm_sss, "NPT Supervisor Shadow Stack");
     P(cpu_has_svm_spec_ctrl, "MSR_SPEC_CTRL virtualisation");
+    P(cpu_has_svm_bus_lock, "BusLock-Intercept Filter");
 #undef P
 
     if ( !printed )
@@ -3087,6 +3088,11 @@ void asmlinkage svm_vmexit_handler(void)
         break;
     }
 
+    case VMEXIT_BUS_LOCK:
+        perfc_incr(buslock);
+        vmcb->bus_lock_count = 1;
+        break;
+
     default:
     unexpected_exit_type:
         gprintk(XENLOG_ERR, "Unexpected vmexit: reason %#"PRIx64", "
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index cbee10d046..15223a693e 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -66,6 +66,9 @@ static int construct_vmcb(struct vcpu *v)
         GENERAL2_INTERCEPT_XSETBV      | GENERAL2_INTERCEPT_ICEBP       |
         GENERAL2_INTERCEPT_RDPRU;
 
+    if ( cpu_has_svm_bus_lock )
+        vmcb->_general3_intercepts |= GENERAL3_INTERCEPT_BUS_LOCK;
+
     /* Intercept all debug-register writes. */
     vmcb->_dr_intercepts = ~0u;
 
diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
index 231f9b1b06..68cf5eaf0b 100644
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -68,7 +68,7 @@ enum GenericIntercept2bits
 /* general 3 intercepts */
 enum GenericIntercept3bits
 {
-    GENERAL3_INTERCEPT_BUS_LOCK_THRESH = 1 << 5,
+    GENERAL3_INTERCEPT_BUS_LOCK = 1 << 5,
 };
 
 /* control register intercepts */
@@ -497,7 +497,7 @@ struct vmcb_struct {
     u8  guest_ins_len;          /* offset 0xD0 */
     u8  guest_ins[15];          /* offset 0xD1 */
     u64 res10a[8];              /* offset 0xE0 */
-    u16 bus_lock_thresh;        /* offset 0x120 */
+    u16 bus_lock_count;         /* offset 0x120 */
     u16 res10b[3];              /* offset 0x122 */
     u64 res10c[91];             /* offset 0x128 pad to save area */
 
-- 
2.43.0


