Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBwbNAHPhGk45QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 18:10:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5EFF5B02
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 18:10:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222283.1530283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo2rk-0003wq-8b; Thu, 05 Feb 2026 17:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222283.1530283; Thu, 05 Feb 2026 17:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo2rk-0003s9-5c; Thu, 05 Feb 2026 17:10:04 +0000
Received: by outflank-mailman (input) for mailman id 1222283;
 Thu, 05 Feb 2026 17:10:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eiMP=AJ=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vo2ri-0003It-Nu
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 17:10:02 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 808cf9f1-02b5-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 18:10:00 +0100 (CET)
Received: from BN9PR03CA0457.namprd03.prod.outlook.com (2603:10b6:408:139::12)
 by DM4PR12MB6010.namprd12.prod.outlook.com (2603:10b6:8:6a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.13; Thu, 5 Feb 2026 17:09:52 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:408:139:cafe::36) by BN9PR03CA0457.outlook.office365.com
 (2603:10b6:408:139::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 17:09:48 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.0 via Frontend Transport; Thu, 5 Feb 2026 17:09:52 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Feb
 2026 11:09:50 -0600
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
X-Inumbo-ID: 808cf9f1-02b5-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kAO+Wd9NweWWzOfASMGBmsPmgVlSuCr8f4Ot6U+rBY0QaoAQHuBghGCNLQsHcWTWyI9ZaF3MdGUDdqOVuDe8hing94uwKeStP/71nw6xV/yhuoDG5LfCfZyU5QkqMzxFW+5bcUKuQctpDJjsyIhSzH2t9++Co0zprFCO0ti45ew+7o7TJvbonSRnywDEzdeSQhH0qGNJYuSV7aLw5O3JszoMPHrkBQeNvWEXTE5m5HKHoV+swedI/SAD8Sj+DGaxubxyrTArGjByfPYXrEeZXeahFEuKEpAPEckMyQgbbWivq7NvhWNg3poySAinHZmP3PCpE7Bl/5hVsrcZOFjlEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4FKeqmCM9a2ErEXn6Kh0b9mOhoAFlSSuBV0vP6kKFk=;
 b=lpzewu1hyHLymkyEkPC+N+sBNhl7cRHUIQPCwSJhJh/5BzJv+Yaeze7MS+TZ11HZSW1Z7WqY9dUDhc4oR46SB6DMLvtWij7Xw4NNrgeFRBK/07WH2tPJY9qNQo3fNQwa6/j9kiQVCz0AjLZJG9SnfkkfEagUhI6lBgAy7Nvfn2PPvGKJGT1aeVDYezL9w9F/teDLshY8sEffkr0Tl3DbOPm87PGpd1VVYSQjZDrS8I4ZkCtaQoerXNVNeBjhSZNml1yCICIDVUUH/02WOF5/T75zR8IW6wURGEunH0LS2fC3l9rSLbDaFFS8061PjuVdW/bD1bsXH1/F3b7VM2KMbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4FKeqmCM9a2ErEXn6Kh0b9mOhoAFlSSuBV0vP6kKFk=;
 b=PEKn78Xl2QBq+omHbs3iFpua/u55cCbXz4A2J8fpQ3i5JcZpCH3Ajp7fpZMsVS3Vo4ZQz3qdpfwmJ2f2QXDWZSq57aX3UCMfiRQLQrhiM2yDkmGyFA5DPqgk4Clf1UIBeBEmktTu9SeaOilXSjiFgh0h/vdoM2tLvqWvgUqY54k=
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
Subject: [PATCH v2 2/4] x86/hvm: Disable cross-vendor handling in #UD handler
Date: Thu, 5 Feb 2026 18:09:20 +0100
Message-ID: <20260205170923.38425-3-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205170923.38425-1-alejandro.garciavallejo@amd.com>
References: <20260205170923.38425-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|DM4PR12MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f89cbd7-9528-4d3e-d118-08de64d96073
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G9I8i8Ew1CbZ5mtRMJjgB85h47SCty2b+rsbG1/ZyFV5839zd47heBpZb5FZ?=
 =?us-ascii?Q?aArGit6UdCd9/dcuGJT41zWSksq93BSJKDi22F/rNeBGmbW6Wgiu1TXV9VWJ?=
 =?us-ascii?Q?DYQX/d4v3f/s+aXwttXwYNf13KFRZJpMl7PcXmhawWOmYlc3GcmSnuIFlQke?=
 =?us-ascii?Q?jqJ2wVKh8F1VhCyqjfln3fUoeVKs8JAc6FeNgIezuKGrR5DkpYnz//rHljY8?=
 =?us-ascii?Q?h1c74Lkq94tzt2D/ytXrs1jdoB4lwXHF7njcRvo8neyt8+25iwhuQrCMeNLJ?=
 =?us-ascii?Q?RI/Rztx1z18RanENBOb2HdhQrv6BqtiHNsER4w4MsGv8Q2gGqUhjyX2e7mdJ?=
 =?us-ascii?Q?AF9Fxwn82D/lMhdSm40GTDo+7uFpFG8r0OteynvBq+WXHu85QY9vMWZfNGXc?=
 =?us-ascii?Q?+Jw79z43ELcUi+a5mntEZjVjmpOG44Q/VMLf3dXdW7KDyOIwxw7a+225Sx1+?=
 =?us-ascii?Q?nf6Rtoywp3vnJVYNSHypAESydFJWud2Tt5SbVUF/3+rkFQemjwlEQRaJaE5g?=
 =?us-ascii?Q?yIMGGKcmSLEdFPLiPo9HV3P0T3o8LRlJtOgZsb+5UM8T7MAPFB5lZhT4tdIh?=
 =?us-ascii?Q?vW0pfCXRJAAhcmy9YUK/weQlVKVVqL8cdqz2qj+Wao71pAZZfbPua6a8tBkV?=
 =?us-ascii?Q?Tsl3MMClURGPZffZ7Z6W+PMTbjBbtTWQtj2ywH7NjK52rZEkIf3Lws9KApT1?=
 =?us-ascii?Q?8Ng7gZioyydOdiTuPCYj4d5qcOmdMYIBg7NXPNxfUx6PEJ/JxCFweUaXRFmm?=
 =?us-ascii?Q?qv6DbDvgWeV6H9wwxRuHBgaqWutwy6KpC5jJ63gjkstcqyZMvepNBoGWyoOi?=
 =?us-ascii?Q?KNRJaudR4EngDlOKuK7CO5IjJK/2OC9XYIkNI5TthQPPBJjArNC7B09WJvDw?=
 =?us-ascii?Q?Ca3aQZ26NB6LEdHE2htJBOs0zJOaojLDWROQayn578Q7gJADgTztteDtNNwK?=
 =?us-ascii?Q?izc0/FPhO9GTIqy1H/RQVk3C+kP3AQTkSvQ1Z6+1tEr+eFazmpB89zI0KoRo?=
 =?us-ascii?Q?sov+It00QkgMSTzfl4s8SY84V3YgH0E7dsRXRj8vzPN02Ol130f6U9TgD6V8?=
 =?us-ascii?Q?t8QX26oPlHsRJ1BI2rQ7pAP8sQgNbyeeAdUMvblmyY2Xc9cGuJ7VQGRXwpSI?=
 =?us-ascii?Q?a0GxfyODmmnqfIapDcseLGxfHsDT+r8rHyj99BNYqw7s6N/xyAH/F3Xcp+Zg?=
 =?us-ascii?Q?9LJY/TFCS+UsZvvjo2aErDqvwFwrYTAWMTqozVsRaY7sDLEIYRT8v9NPqlSc?=
 =?us-ascii?Q?aIoz7PL4hZyTtEwoar/aZVuWpdLu7Diop81wvBBvGa05cAKZXEE4yaCh2cTf?=
 =?us-ascii?Q?s3Vxezto0KszeGch17Pu+msl4OhfeyPuEEpRYVzcbeuH0kgnLiPMuY/GSlGU?=
 =?us-ascii?Q?J13yj25gaUDhnHxX6PQ76Xxr0eM0bl0XGWl2wm1FnCHTAUjrVkK2jEQNAsXA?=
 =?us-ascii?Q?PPiyTHg8NQNRTlEp7rpkeOzqvficqXTT1Em2rbdW1NkkawfNH+p5Ls3MH2eX?=
 =?us-ascii?Q?+9J+DPHJwsJb2dvq+eW+UOrDYjbZnOVCDeHj0u8bg9Knb65O50YmYdKcs4Hp?=
 =?us-ascii?Q?oFMbOGgilkcGVfKNCfdNHu0swmNo8RlbQm+g+8qwnHQXMxVm5AuLfcfspRy7?=
 =?us-ascii?Q?7Y0j2goARDXfPz9rAnHb2sM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ED1LGKZOE2uzilZVIHgf6KW3iDGdDV/D3d850EdZdijVbVqIe81Y3DjFjr/1gQjJ7qxqHeSZ7KpYhWwL20izEkHv4+MjF/DgBPeA7vzuJ2JXhG2om0oCdphGN1d7oPXKA3PCtcUR4EW2CFiJpYBQR2aRbaDmoaNgnqg+h08SnxMr7G7m8xxTx8A4KjtguDCBVhdRhWmLcmtW3ayHxK/JC9JTaTTJH06HgDOP4sf8p6zZpAnFkQ8RnMJEs5RJmxoVgFN7XMc03KVyva1aaHCGgxnUHOtnPLY1+vmTa8B83ky6PeX3BeaVxTW86sJ+qdo5307iyQad2iMdNBvbUUwlheJfxEzFFB2w2UfuKoX6wuTvhWkTWaXkXb0qhL8InfBdblx+rfV94AOcgGjHwn4LkmtmEzopIv8GGZQKb2BZvzr1+J2JOrtKZJRXHoH0FmQ4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 17:09:52.1660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f89cbd7-9528-4d3e-d118-08de64d96073
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6010
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2B5EFF5B02
X-Rspamd-Action: no action

Remove cross-vendor support now that VMs can no longer have a different
vendor than the host.

While at it, refactor the function to exit early and skip initialising
the emulation context when FEP is not enabled.

No functional change intended.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
The diff is annoying, but keeping prior logic is silly when it can be
simplified and the emulation context initialisation removed on the
overwhelming majority of cases.

v2:
  * Fix bug introduced in v1: Don't emulate instructions when they
    shouldn't be emulated.
  * Refactor the function so it's simpler.
---
 xen/arch/x86/hvm/hvm.c     | 77 +++++++++++++++-----------------------
 xen/arch/x86/hvm/svm/svm.c |  3 +-
 xen/arch/x86/hvm/vmx/vmx.c |  3 +-
 3 files changed, 32 insertions(+), 51 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4d37a93c57..8708af9425 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3832,69 +3832,47 @@ int hvm_descriptor_access_intercept(uint64_t exit_info,
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
     struct hvm_emulate_ctxt ctxt;
+    const struct segment_register *cs = &ctxt.seg_reg[x86_seg_cs];
+    uint32_t walk = PFEC_insn_fetch;
+    unsigned long addr;
+    char sig[5]; /* ud2; .ascii "xen" */
 
-    hvm_emulate_init_once(&ctxt, opt_hvm_fep ? NULL : is_cross_vendor, regs);
+    if ( !opt_hvm_fep )
+        goto reinject;
 
-    if ( opt_hvm_fep )
-    {
-        const struct segment_register *cs = &ctxt.seg_reg[x86_seg_cs];
-        uint32_t walk = ((ctxt.seg_reg[x86_seg_ss].dpl == 3)
-                         ? PFEC_user_mode : 0) | PFEC_insn_fetch;
-        unsigned long addr;
-        char sig[5]; /* ud2; .ascii "xen" */
-
-        if ( hvm_virtual_to_linear_addr(x86_seg_cs, cs, regs->rip,
-                                        sizeof(sig), hvm_access_insn_fetch,
-                                        cs, &addr) &&
-             (hvm_copy_from_guest_linear(sig, addr, sizeof(sig),
-                                         walk, NULL) == HVMTRANS_okay) &&
-             (memcmp(sig, "\xf\xb" "xen", sizeof(sig)) == 0) )
-        {
-            regs->rip += sizeof(sig);
-            regs->eflags &= ~X86_EFLAGS_RF;
+    hvm_emulate_init_once(&ctxt, NULL, regs);
 
-            /* Zero the upper 32 bits of %rip if not in 64bit mode. */
-            if ( !(hvm_long_mode_active(cur) && cs->l) )
-                regs->rip = (uint32_t)regs->rip;
+    if ( ctxt.seg_reg[x86_seg_ss].dpl == 3 )
+        walk |= PFEC_user_mode;
 
-            add_taint(TAINT_HVM_FEP);
+    if ( hvm_virtual_to_linear_addr(x86_seg_cs, cs, regs->rip,
+                                    sizeof(sig), hvm_access_insn_fetch,
+                                    cs, &addr) &&
+         (hvm_copy_from_guest_linear(sig, addr, sizeof(sig),
+                                     walk, NULL) == HVMTRANS_okay) &&
+         (memcmp(sig, "\xf\xb" "xen", sizeof(sig)) == 0) )
+    {
+        regs->rip += sizeof(sig);
+        regs->eflags &= ~X86_EFLAGS_RF;
 
-            should_emulate = true;
-        }
-    }
+        /* Zero the upper 32 bits of %rip if not in 64bit mode. */
+        if ( !(hvm_long_mode_active(cur) && cs->l) )
+            regs->rip = (uint32_t)regs->rip;
 
-    if ( !should_emulate )
-    {
-        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
-        return;
+        add_taint(TAINT_HVM_FEP);
     }
+    else
+        goto reinject;
 
     switch ( hvm_emulate_one(&ctxt, VIO_no_completion) )
     {
     case X86EMUL_UNHANDLEABLE:
     case X86EMUL_UNIMPLEMENTED:
-        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
-        break;
+        goto reinject;
     case X86EMUL_EXCEPTION:
         hvm_inject_event(&ctxt.ctxt.event);
         /* fall through */
@@ -3902,6 +3880,11 @@ void hvm_ud_intercept(struct cpu_user_regs *regs)
         hvm_emulate_writeback(&ctxt);
         break;
     }
+
+    return;
+
+ reinject:
+    hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
 }
 
 enum hvm_intblk hvm_interrupt_blocked(struct vcpu *v, struct hvm_intack intack)
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 18ba837738..10d1bf350c 100644
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
index 82c55f49ae..eda99e268d 100644
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


