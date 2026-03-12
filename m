Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BNtHtqhsmkOOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:22:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 319CB270CD5
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:22:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252078.1548888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0e72-0007Qj-Dy; Thu, 12 Mar 2026 11:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252078.1548888; Thu, 12 Mar 2026 11:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0e72-0007KS-8f; Thu, 12 Mar 2026 11:21:56 +0000
Received: by outflank-mailman (input) for mailman id 1252078;
 Thu, 12 Mar 2026 11:21:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=17Qz=BM=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1w0e6z-0006gG-Vq
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 11:21:53 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9874ec0-1e05-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 12:21:51 +0100 (CET)
Received: from BLAPR03CA0179.namprd03.prod.outlook.com (2603:10b6:208:32f::33)
 by LV8PR12MB9405.namprd12.prod.outlook.com (2603:10b6:408:1fa::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.7; Thu, 12 Mar
 2026 11:21:42 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:32f:cafe::36) by BLAPR03CA0179.outlook.office365.com
 (2603:10b6:208:32f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Thu,
 12 Mar 2026 11:21:37 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 11:21:42 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Mar
 2026 06:21:39 -0500
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
X-Inumbo-ID: a9874ec0-1e05-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pzFx4z92leE4X94xzu6vXFjM59CEBxe0fnTSy0wdRI6obVtU+DxheYnlV+yBGahDO0Uk6qZUL2RQWDcog3MxdadXcqWdBo6NnSVwTpAHVvDpf9OFRI/T+T6mLs7afU6r3IFI28zD6aklfsRz+mHDKd607I8Z834/afqFdCO9qwIvfbbOJsGyxLdY6Wp+u5SrvhrFEaBL+liuR8E0hSvOKTw7F6b+StW+yYgdVvsYp2mSPSn40F5YBsMjPaYVlmOm2P1633CIDIwhCYjDpURHd2H+b9y+6WpX8aj/5ASuAIB8nTRNV/BOKR1+jIiNXHfajSj9O6H6Ri/QhfEeYgbqeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wv5wvI380mS69M5JH7UHNf7qmRDw4qiA/tgGNcS4cFM=;
 b=feBmPoti15B5Q4AoZ1DKIEngV8URAIk6B44RRlrlEsJG+44j/1+t9l5lyQ8+xStRVkEfGsLKYfXMt1AFbw6iKnQK+oZalzQdOVFmh8chw4ImRZK5NZahB6pN3jsIOjrrafjKoBMNAY6GAU6Ld20MsoOl52JTY82IVSJeSyU9wMu+BSOpDK6AcoYPGXYnx872p2ugwsIJkT/qIWxkpp50ah1Mt3dsCoOw+mcfJeWlqzJD/kF7q/rvuuCIT928cT3tmqSS/64hMU0aZh0MOUQxyve5DwU2Am0YIIqUMzhOhHBaDPBFuqvwzvw3wGnPXpeXGhhdw0q4ke8Xpz1o0JDQZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wv5wvI380mS69M5JH7UHNf7qmRDw4qiA/tgGNcS4cFM=;
 b=GX/rSusZYPQm81Z6n0EQJKB3UAfJpaaUIq5ZR+RXWD0zW1LTbedBJ5qeDAfaDaRQyKmFGxB98VJPwGXQvPywhDhaSDeMYSzi7RfS5IkFCEIqveJuQbfWj0rW2VwaxqQ4kNBFQHILgmYCvaEF2RUm3EfV7XCvu50z5LcAq1GJlcs=
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
Subject: [PATCH v5 2/5] x86/hvm: Disable cross-vendor handling in #UD handler
Date: Thu, 12 Mar 2026 12:21:11 +0100
Message-ID: <20260312112116.22563-3-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|LV8PR12MB9405:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cfe8d4c-7893-4c72-3952-08de8029896d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tUoTV/kTkQL2wetZ09nm49C92ytV/0meKac80akq1LuKClxmq9qhlq0mUrHpDGsSlk7Hmd83EocIS+GYaINXV8JYH65CbgpUah8mHulqDFdr7ZtVC0WHFQDDPNLB8iDeLo3HEydWzBkEN6ux9dyre6zOoHxFrFY5K5RNmpylFf2t9hfeBkfRMUEdcmRo9Kdt2nZJ6eS5U4S6vQmCu7SYfrsEpkS4aSgDI8xaeLyZE2QCRpjI6Vl0Dl4kx0FX3/ad0MCflByk/a3jmwuJergu6ad287S2YKsawBWPx/pgkBUWEx23Lf1rWJK9GcOVVHpgqIclAzh7AOWTwJpqW2Uds09LUvfmYSxm5n5iZykq5mIMbQ6cLW3QAqlKCMWk3mDsHZoSNKqB19IbyR/HUhf7ID3/8a3+5bCk+/Cj6G4bq63HyMQEAVttmPpqW2fZrBsnVxquhFbnw2fTewxywFFBIEWJMRgx1FlTMkeTBjb0I1cL0QbSlNfrf+xKWcUTpAQpq9sygXeNv3vfnA4SLkTodqFZpjhad2Ryvjgdiz1rU0MTQK7TLgQSkkvB2uWCjkVBhcN9y6S5UXeymOGhzrjlM3PxUGITZmQBnyJ6GIGpFmYda9Lr9QexH/FyZPKs3XyGUHAGQqGAXMBcd/7eQJYZR8ohWsgpfQlqk22JePrpc/IQPImpEfpW2gfkGvMXj5wC6tk6+Kgrpb9qAko0W2OLvbvA5lt1L+eg6wyp+cxxA7dw0QIq1gXGEjBk1scw//DYbugKTBsodcZf0eGRLfX7XQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+QpxfV8ndm2BiwAr6EMhW9o1SOzpXerkK1X5rEDNjoRwPHwUFBD88eKPmYkQqx/Pk76bRv2d3XwQRLJ/RzVwStMlNJFPuZE/SL0tQ6ICyOtHkTwIzjb+mOrqoYivOD1akeGtNaQcxrsqMdJMwtk/eLwxZGYDAoz8eR0/4pbZYI59Zj0qS6yJbOBXVDSZt9nX915Aj7coxnOhBeFBnrOqbbiKWL/tPrtm28TrY+d6wa4Y0VReEJenBublWKwioXSIgLn/x0H5NhA3tBTG8KIzsM6RzReR11I7wdOslzVk0gid4OlUvLZbEzC/y+ANQjf3ZvxiR8ZdK+YMfG/E0eLC4H7jVi6rQaXLxY4QMrPBpVQ0ozVav41GjgfRbXZRwP7riF+DEuYULfo1q8WTXGmhQP3TQTxDE6lGUbP6JGxBhy67dg1bxrMkwSQXukdiuFqb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 11:21:42.0393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cfe8d4c-7893-4c72-3952-08de8029896d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9405
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:dkim,amd.com:email,amd.com:mid];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 319CB270CD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove cross-vendor support now that VMs can no longer have a different
vendor than the host.

No functional change intended.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
v5:
  * This patch now performs a minimal diff, with the other parts appended
    to the tail of the series.
---
 xen/arch/x86/hvm/hvm.c     | 19 ++-----------------
 xen/arch/x86/hvm/svm/svm.c |  3 +--
 xen/arch/x86/hvm/vmx/vmx.c |  3 +--
 3 files changed, 4 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4d37a93c57a..c8cae41705d 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3832,28 +3832,13 @@ int hvm_descriptor_access_intercept(uint64_t exit_info,
     return X86EMUL_OKAY;
 }
 
-static bool cf_check is_cross_vendor(
-    const struct x86_emulate_state *state, const struct x86_emulate_ctxt *ctxt)
-{
-    switch ( ctxt->opcode )
-    {
-    case X86EMUL_OPC(0x0f, 0x05): /* syscall */
-    case X86EMUL_OPC(0x0f, 0x34): /* sysenter */
-    case X86EMUL_OPC(0x0f, 0x35): /* sysexit */
-        return true;
-    }
-
-    return false;
-}
-
 void hvm_ud_intercept(struct cpu_user_regs *regs)
 {
     struct vcpu *cur = current;
-    bool should_emulate =
-        cur->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor;
+    bool should_emulate = false;
     struct hvm_emulate_ctxt ctxt;
 
-    hvm_emulate_init_once(&ctxt, opt_hvm_fep ? NULL : is_cross_vendor, regs);
+    hvm_emulate_init_once(&ctxt, NULL, regs);
 
     if ( opt_hvm_fep )
     {
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 243c41fb13a..20591c4a44f 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -589,8 +589,7 @@ static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
     const struct cpu_policy *cp = v->domain->arch.cpu_policy;
     u32 bitmap = vmcb_get_exception_intercepts(vmcb);
 
-    if ( opt_hvm_fep ||
-         (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor) )
+    if ( opt_hvm_fep )
         bitmap |= (1U << X86_EXC_UD);
     else
         bitmap &= ~(1U << X86_EXC_UD);
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 82c55f49aea..eda99e268d1 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -803,8 +803,7 @@ static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
     const struct cpu_policy *cp = v->domain->arch.cpu_policy;
     int rc = 0;
 
-    if ( opt_hvm_fep ||
-         (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor) )
+    if ( opt_hvm_fep )
         v->arch.hvm.vmx.exception_bitmap |= (1U << X86_EXC_UD);
     else
         v->arch.hvm.vmx.exception_bitmap &= ~(1U << X86_EXC_UD);
-- 
2.43.0


