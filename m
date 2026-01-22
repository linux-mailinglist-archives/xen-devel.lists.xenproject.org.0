Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AquCVdVcmkJiwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:50:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D06356A50A
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:50:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211437.1523050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixt2-0007wk-Tx; Thu, 22 Jan 2026 16:50:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211437.1523050; Thu, 22 Jan 2026 16:50:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixt2-0007tf-OF; Thu, 22 Jan 2026 16:50:24 +0000
Received: by outflank-mailman (input) for mailman id 1211437;
 Thu, 22 Jan 2026 16:50:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I1tn=73=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vixt1-0007Lp-Me
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 16:50:23 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c9c739c-f7b2-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 17:50:16 +0100 (CET)
Received: from PH0PR07CA0070.namprd07.prod.outlook.com (2603:10b6:510:f::15)
 by DS0PR12MB8526.namprd12.prod.outlook.com (2603:10b6:8:163::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 16:50:07 +0000
Received: from CY4PEPF0000EE31.namprd05.prod.outlook.com
 (2603:10b6:510:f:cafe::14) by PH0PR07CA0070.outlook.office365.com
 (2603:10b6:510:f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 16:49:53 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE31.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 16:50:06 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 22 Jan
 2026 10:50:01 -0600
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
X-Inumbo-ID: 6c9c739c-f7b2-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bLJRub/oGtu+vwC94CnYuqyXPNHggChGau+wCN4HNthcw8nWa2UcZzOb/nbjzjSxKOKY8sEA9O5g6iZFT/Ul5xMq0aXCtxcy42JVc72UV0kQUd9rmeaIkieFYGud1Ko6XZ5JkMPoDhxkA/4xIKnld2Upd7LWGLNdxsuoVqRxWgYnsDqdOzV32plJVT8sX8JOvx5RRaGhqyzRd7tiJv0/YBnawJ0ou9dkjNR2FG0MmWfV57Hj3mg4Px2cDxVGgceknFps7VfKN/TFXUOJ8gCTBw7EUlMGzt9DKWfuj0iB3kaOThDXFVRuznYK3onrN1i+a7KHmtiGDW+2VA0slLPBOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2XiGBn+2TTMkvVjf7PhcT0PqgOh4b6zV4GWpM5zTgM=;
 b=VFY0i6kiylom7+1Nic3jtgZL6677FoPc3vFTGNHPah0FDMhexZEV1gUoeEF+jWpQ00ddNbKyKBr4ddQSZ2Z6J/J2mM5llF2IpHCBKCQWYs5gfBCQ6qNz1PjMF9zdWvY+8o7gy4+yMNcs+Kp4rHmBMTcb7gLLKSLxeW4899hzrCZv7tHgFYQ4x3qKW128/sV1po2M79lf4aXF9Fpo2g5lf9bM2zECpF5c1xFwLRwetvRCI5jsdfYT6Rwe/wLDcQ+7DP2cJiA8UvExNMjl6u8/3kYsL52wqxIAQSRkQgb4gTaozZM+wY+KDLCW8K9ucT1WLKIWZZ0XMyivLfo5u9CRwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2XiGBn+2TTMkvVjf7PhcT0PqgOh4b6zV4GWpM5zTgM=;
 b=M3i/E7+Fm1vqRKHh7Ba8Se9VvyIGxchSun6VsFI9KKt6T64oT/ItDaRS5DEUbBgW8wqWFLQ3FlXh6vHR4GQ9ANGqxVsH3eRLDqLPQeLAZlH/bl6F8KFXE9XBBsIPIj8NXsEJVMQr4wCpCsE7ARgNSwSzlA5/LFXHBX6JRKxxrN4=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/4] x86/hvm: Remove cross-vendor checks from MSR handlers.
Date: Thu, 22 Jan 2026 17:49:39 +0100
Message-ID: <20260122164943.20691-4-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|DS0PR12MB8526:EE_
X-MS-Office365-Filtering-Correlation-Id: 50192ebd-25e5-4e4f-d5db-08de59d64c31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P12KV/72EIAx34JT0pwD3dLZkWzZi2WxSX+l3Wv4hq0RsAX0mnMJf7dHtwk3?=
 =?us-ascii?Q?3VWRD4u+N7g7/orIVcigPvkfZ/DKqcGwFnGT1jTXgWwF4U7kP0amG2BBoVOr?=
 =?us-ascii?Q?D/sgPK/ShC5wkRUKkC4e0dKss5RZVS8U+EYVwpxLycLrgsLqHpuU9JcG5fE4?=
 =?us-ascii?Q?mszUF8a/v7oR3MPpqvac81nTOsSOrrd96z5meD9/xa7ySQXqas38uk2GJE1P?=
 =?us-ascii?Q?+O6lsrC6uACHuTO6ffUpRZbwQEUDOjv7aAox0YWT7pNRR3vX2ap75d19w2kp?=
 =?us-ascii?Q?VBACnPJaXVbIkcsuFOwFLKzxphWDDkpXpkAUF9b0DW97Vj7K8HOtmnG6SaXt?=
 =?us-ascii?Q?F4KkZ/CAUZFI8YI1c298edY77fc+Dwno0OF6Feap8EfsJBK5KPzn6TsH2KD/?=
 =?us-ascii?Q?OsASRWs6QWGf45vjWYK6HwhemWf3LXEMD7oz1BpbKsLH7tMbC+m8tVLDTIC6?=
 =?us-ascii?Q?rpcYYC/dNLgU08/aDdBxDIhglHS4XNfDyvTK6r+4/t/biGGW5A7YH4hRgLL+?=
 =?us-ascii?Q?UJyS9frW+i8CYfWrNOhaAyCPXyjEZkZ8qHWX+V/tJi/iauCmvW1TyhZUwHfe?=
 =?us-ascii?Q?NNaDj7ahcjyhZ/GkWVTX2Rz+7Y/dvCWc3+cGSrJ2EuwhKiwxqrSO1MEfJ7YC?=
 =?us-ascii?Q?5BbTBZFlxgGHSFtGlj2ntE+tV5yviUn4lvio1zbD/ibfywO7jy2u+TKxk18O?=
 =?us-ascii?Q?mMWsBOGSuqjcceSW6lDF8LWa7mH7cAIF4VHmpA478+Ed2xsHurRXorFLPF1H?=
 =?us-ascii?Q?kMnbntNY5xdOMD26pfweSihCHgaLRWMbFJZEwfPOtG8AYAriEY8NWT7UACvL?=
 =?us-ascii?Q?GfpuKU/jG8nSWoyKbQxxt1WTUbVqRCxK+udLhMqGCxQju3gM9WrlE3GW07vA?=
 =?us-ascii?Q?Lico8+I0W7aEsxs0qN8xyNzcN/uJWiEqTvP8wRZKf73eBXNiSUbtA2LC04Nb?=
 =?us-ascii?Q?sv/yAuZ5q1gNQGtHBuo/iGqK1RpB1hLoBguR1JeCQWLVxsHZ7WRzNPU9RnWc?=
 =?us-ascii?Q?0sJeRfWrjFC3AwFh/LlGy8O2yuQxOruI1T2tkue6A3s31HbKtYd9Audoqbh5?=
 =?us-ascii?Q?5ebw+QQC2gbuURIYwBFglGkPEX7LBux+A9hazc0PxQvvowgtD19bMGwa5irM?=
 =?us-ascii?Q?SgkAtIEteRmbezuP44aMK3/ffC+F5EIcawfngflItbXh5dP/vuoPtKw/5h8b?=
 =?us-ascii?Q?N0EcJSeH+lqrPdNzVz0qX2SylluGTnW14kyzy89W88pqlJTIXTSowwZDUqUs?=
 =?us-ascii?Q?yslXs+eRLtrMs4nHEF+zHIg2iEdwYlboBLaGX07Su5a90aS1A8jdzQ2i7Q8t?=
 =?us-ascii?Q?M5xCVjB7wOHn/ahvqGl6WAby3kgAW2yIdzgjlKnbAeAB0nHms1N787ZLiAqC?=
 =?us-ascii?Q?ZbaEed7TC1aolw/u5hbbnX1gfeA/T4ifJNHIibKBXP/lkN0n/W5o+UNUIzKH?=
 =?us-ascii?Q?sjqy3LNbW5jLLn8QE8P3DAdbICXClBTR+D+UVmt7cPccK1IW7DZr52KTEOnz?=
 =?us-ascii?Q?W+86xUk/jIzWcUdkYjdSlHDtnTcdtsH+YVlev8Pdct9y+x/AbZwA7ZT6bz4o?=
 =?us-ascii?Q?iyjtecsMdTxcs/v7352wWCgBrS28RZInYnC88qTRsujC5bdkpwddlOE+KtKs?=
 =?us-ascii?Q?psyNpZBhXYaeIepXe2rUwG8rqrXVvOYRk2rYLfCvGYVj8AR3qG7EnU2Viqzz?=
 =?us-ascii?Q?XfHUwQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 16:50:06.8762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50192ebd-25e5-4e4f-d5db-08de59d64c31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8526
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D06356A50A
X-Rspamd-Action: no action

Not a functional change now that cross-vendor guests are not launchable.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/msr.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index ad75a2e108..c9cc4f0692 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -169,9 +169,9 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         break;
 
     case MSR_IA32_PLATFORM_ID:
-        if ( !(cp->x86_vendor & X86_VENDOR_INTEL) ||
-             !(boot_cpu_data.x86_vendor & X86_VENDOR_INTEL) )
+        if ( cp->x86_vendor != X86_VENDOR_INTEL )
             goto gp_fault;
+
         rdmsrl(MSR_IA32_PLATFORM_ID, *val);
         break;
 
@@ -190,8 +190,6 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
          * the guest.
          */
         if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
-             !(boot_cpu_data.x86_vendor &
-               (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
              rdmsr_safe(MSR_AMD_PATCHLEVEL, val) )
             goto gp_fault;
         break;
-- 
2.43.0


