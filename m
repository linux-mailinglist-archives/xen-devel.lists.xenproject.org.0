Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YO1CKbXEsmmvPAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 14:50:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E34D272E87
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 14:50:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252408.1549103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0gQv-00064h-4d; Thu, 12 Mar 2026 13:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252408.1549103; Thu, 12 Mar 2026 13:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0gQv-00062J-1T; Thu, 12 Mar 2026 13:50:37 +0000
Received: by outflank-mailman (input) for mailman id 1252408;
 Thu, 12 Mar 2026 13:50:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=17Qz=BM=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1w0gQt-000628-ML
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 13:50:35 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7002c2a1-1e1a-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 14:50:33 +0100 (CET)
Received: from BYAPR02CA0060.namprd02.prod.outlook.com (2603:10b6:a03:54::37)
 by LV8PR12MB9081.namprd12.prod.outlook.com (2603:10b6:408:188::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Thu, 12 Mar
 2026 13:50:28 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:54:cafe::8e) by BYAPR02CA0060.outlook.office365.com
 (2603:10b6:a03:54::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Thu,
 12 Mar 2026 13:50:28 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 13:50:27 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Mar
 2026 08:50:19 -0500
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
X-Inumbo-ID: 7002c2a1-1e1a-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lts2hOeEooK5cdjHD5svNT5XN/8Pbt37zKVH4hER71TCka+QbpuCYJDyBlXgMHo+KyREXlkXAU+nO4rx+WHi+55sMv2xBdKs6gEZ6vbmOzoEZzzEjlX88U9E74R5j9f6cnD77d9VZqpwU3rPvtnta+2dOJcXOYa5Ob/mMrdLonZPIEptpKLFekx4QF9V9eFDpJOR6Yw5RHIl7YqLcHoaJ92hLWCGlqPA1WutVAsKwmND8SrJiVBUamhzIyeHShryymCZ7QfdddZS40BWXX4BzLuzzZa7G4rfEDYg1faPJMdAhMKrpICqA5nLI+SOelCiVLDTb9irz/a7QjRNcXkCWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWAqciHDj/rPLHpzZWTBXdYeHhPDbCPzvP3OS9/0ZqE=;
 b=a1L+ek6pCCxpBX9MAQvNOFFmLiMYC+dXs7YX1Roz+nziCXPkOlCDSb3yg5JvFsQfGnU8VLG/Ee5U9YIxna5oiTWvp9ce81yYQunoZxloPVPwJxMNpN04KlidkTmR0FMfa/U+QBda0l4CWCrBhzQ2QT/N2tBRn5qZtvulEt+vR63cZxjndci6i30t2fHV2u09C5S51yTnzKT9yrEI5y3aCf/fgW77iR16zN+UxCJfrM9EycJSITaxEj15LjR6bJrAPqW6EfZhk/VrW8dd5P9pt5Qsr7ZAlHyis/brTxbqJXiZnHwsP/TJm9mYmt5RGswTvXR0SpkQSawTCALOGHfqXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWAqciHDj/rPLHpzZWTBXdYeHhPDbCPzvP3OS9/0ZqE=;
 b=goFBfRMZa2ddZF7Rft9sUiDr39CIljZd9WitLEWMSGB2xPYinIT32ohhB0C+WvGQVPyvLIVR26EGn9Ea834nKIj53Cf+0LYTsXZdYZBaVKwyS7o0oGNc6otnoyjwGu2fgVi3NYyqbWn9e8YfLFQrnfqYBMgh9nc48vOaoMU8Fgs=
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
Subject: [PATCH v5 6/5] x86/hvm: Add a non-FEP path to the #UD handler
Date: Thu, 12 Mar 2026 14:45:32 +0100
Message-ID: <20260312134731.38475-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312112116.22563-1-alejandro.garciavallejo@amd.com>
References: <20260312112116.22563-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|LV8PR12MB9081:EE_
X-MS-Office365-Filtering-Correlation-Id: f6f644ae-54f9-4e24-edcd-08de803e5162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	45y+UOPSUMZqbIYQ4/S+jeUG3K7Eu+WDwoxQtcgpHvIN3ctyuRzh3U0TXvSr+L98Q7++Wb9lJQAoAldhdRPj94scs+Mm+3u3R4yxsAVwvfObSL9BGZFfIQAoxt44Qa7iWYeQqLmYiTiQB2CO8I2vwoXA0Z/ajVis5zmARx5eJPUR6/WaGUL+aLU2BUEz03XtYb9lv+rbRWXEbzTGGSkaHvuagQr2cr/oKdRCSSElWOAnL7CBJqNaZDSyEUwdMIqiJc7mMXn3ITvy2RcdRBI3saRzgF4S5Z8mM2wGw0kRJhZ5NRu5l/X+14wNReedZyA1pMuoICYO3ntWK1HA4YUcimjJb4sXFqDRWV3UTAADBvar1JiTs4nA836oi/BT1I54vdZEjGDVXc3HkD+vElBWTKsel40AO8X8O3Vf2oYZ/ezUkeS2q88Pm4KXUwZQRPljJSL2Mbbszn8CEszPlj3l/is9OwyWk9ZMZgxIZnP77k3yZ3h2BPC8u6QLE1luGwqx5vHztaYQwCQVLhfYjti3AXUKBNbrb1pJa4+vb9qC1qzftBmRe1fnQw76ya6lLph8seq8/tCqzEu33Y+p6Olm510WC0nS79EtuMRBNErte5E41JTg7xgKQhd2RBplD71XfrFZ9C0I6uzf8vFESsVrSrehOXEKBCkt9pnU9UmAaoKDvwmtfck8nGepPZrzjVs/1ujnredoY0s5BcJXslwLiO/mX0wW6jxLF9K5XIF/CKhL4StO05Bu+D64xofGwrbBMlSEvERbz/aWTmXc6NEmKA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ERaXtcZcwu6gIXKunYsRPcFnK45DLXcRVdkZuXYG3tzNYidgADF2JHdan0cGiFBwNMSzbqtXFXmIR715Zh+/knhwhNhNlEgYXznVIyffu8DbgoKEEwYCTVA9l8BhhQltamWOTm9/MPhl8KvqwcSLjEbj1/3ugYlnk/JffhIF7EjNTTlruR1Jpxxw2GX/KaOVow6bc1IyboEUfmGy5erl8MUk9h6zBKgMpXf//k0PhjpVr4uPP0mputtBueXRotDqY6OfY7ziBvaM//WrZd+pGkMngr15NeLZnU9f8qOwI9p9g2Z5iYugfQJMNJRz6324MFVEXW3PZPhXbd41VJ4CYc4OrXHUqwuqKh1KzCuIP1lLtSpFBNnE7fGUVL7nN3cKJ965DyPGkG+dDW5VEfQfdZiA9LlqrboKVpAZYwf01QnSwLBV+z+027+c0Dmwb7jQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 13:50:27.4192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f644ae-54f9-4e24-edcd-08de803e5162
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9081
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2E34D272E87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

While the #UD handler is dead code when CONFIG_HVM_FEP is disabled it's
helpful to keep the function around. Reinject #UD in the non-FEP case so
DCE can remove the rest.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/hvm/hvm.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4c00cf4c4fe..0eaeb728382 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3835,13 +3835,18 @@ int hvm_descriptor_access_intercept(uint64_t exit_info,
 void hvm_ud_intercept(struct cpu_user_regs *regs)
 {
     struct vcpu *cur = current;
-    bool should_emulate = false;
     struct hvm_emulate_ctxt ctxt;
     const struct segment_register *cs;
     uint32_t walk;
     unsigned long addr;
     char sig[5]; /* ud2; .ascii "xen" */
 
+    if ( !opt_hvm_fep )
+    {
+        ASSERT_UNREACHABLE();
+        goto reinject;
+    }
+
     hvm_emulate_init_once(&ctxt, NULL, regs);
 
     cs = &ctxt.seg_reg[x86_seg_cs];
@@ -3863,20 +3868,15 @@ void hvm_ud_intercept(struct cpu_user_regs *regs)
             regs->rip = (uint32_t)regs->rip;
 
         add_taint(TAINT_HVM_FEP);
-
-        should_emulate = true;
-    }
-
-    if ( !should_emulate )
-    {
-        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
-        return;
     }
+    else
+        goto reinject;
 
     switch ( hvm_emulate_one(&ctxt, VIO_no_completion) )
     {
     case X86EMUL_UNHANDLEABLE:
     case X86EMUL_UNIMPLEMENTED:
+    reinject:
         hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
         break;
     case X86EMUL_EXCEPTION:
-- 
2.43.0


