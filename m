Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFPOBlEOj2kgHgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:43:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B63135D01
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:43:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230719.1536175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqrZd-0008OZ-Hp; Fri, 13 Feb 2026 11:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230719.1536175; Fri, 13 Feb 2026 11:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqrZd-0008Mf-C4; Fri, 13 Feb 2026 11:43:01 +0000
Received: by outflank-mailman (input) for mailman id 1230719;
 Fri, 13 Feb 2026 11:42:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FeGe=AR=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vqrZb-0007uv-O6
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 11:42:59 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2491678a-08d1-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 12:42:59 +0100 (CET)
Received: from SJ0PR03CA0358.namprd03.prod.outlook.com (2603:10b6:a03:39c::33)
 by MN0PR12MB5740.namprd12.prod.outlook.com (2603:10b6:208:373::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 11:42:54 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::1d) by SJ0PR03CA0358.outlook.office365.com
 (2603:10b6:a03:39c::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.13 via Frontend Transport; Fri,
 13 Feb 2026 11:42:51 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 11:42:53 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Feb
 2026 05:42:49 -0600
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
X-Inumbo-ID: 2491678a-08d1-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVvRRvGvQqi63Cxfu7sQAI1Zfm+qmXWcarrRMvZMqChQBtKHuBxJWgFADtmBqjZFbqz/iD0djwReXglBckcVg5/9MkduW/qRLIqR/mM2m9cD0rbqhlvEbz1raeHifkhpXa+EvHfWh9vGtxphjDlPCkcFnvmkCSJX2PeSlEKN8ZdwOJCBnC+jE9gfopQ8bYTa2kzVoWzlcuPzWiL6jFKJDm0/7voYJQB22S11G9CZMlPr9qFjpQva+rJg+GAfjxyrADjzgC/+DC9iOYzB4JDsBsHo2tRBfWv+iMhjTii4xas72bZeGqZ0Z8hykQTpYhOd2IQ3z51whRoPEW/iM+NuMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lu82w7S6wWrz5PttTxZC5TBMrjsq6q5LHbbG5LcEEg=;
 b=vftdS7c5bShAbGkTprfY7ckQ/YelCGklfazE30LB23SwlfvZekoMfbbFDl+V2VT//kG3g8tyrkd4s4CoyC3q8eJFe5ZH5BePewgBQ6C2zOcJRAq1V8leBj0hcA4ngbv+9lM+veHRDQiRByrZzHRZFnTw0YgfAt8zoJO3BEoc1rypiTIFfhrgqDMc8Poi5vkt1eEgiYxzWJcCuOnhOJmDNcLswCrXKDkn8sQfoKmpyWsB96pQUcxNDRbDaYJ0IrauLjmRmADbBRJEsj4IAUW3skkEOZYh126r3dsoZ6T4YHPolIqL/6EQOFn5J56T22VcjmWI1cu7LTcKl/SzH0Imzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lu82w7S6wWrz5PttTxZC5TBMrjsq6q5LHbbG5LcEEg=;
 b=TK3L1QuZHfFoOm01BMwN43fJQeqzzxhEkAwCGTW8BFIqgKYA5+HhdVfhyfstQqlcJQHcqiGACNGgqFimt9t8zyNIz74ZeLcNK3y20gC8MwdTLQD4UNeSQf5O9/Wxlrejlv83EjavbaD4UQU+NEJj3IrbmE2SgQtHpx72iXRdGZo=
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
Subject: [PATCH v3 2/4] x86/hvm: Disable cross-vendor handling in #UD handler
Date: Fri, 13 Feb 2026 12:42:28 +0100
Message-ID: <20260213114232.42996-3-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213114232.42996-1-alejandro.garciavallejo@amd.com>
References: <20260213114232.42996-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|MN0PR12MB5740:EE_
X-MS-Office365-Filtering-Correlation-Id: f446344e-c4ed-4181-5b33-08de6af50663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PpnCuENGZC4F2jqMRmXTFuF7YiSfAD1qN/H/OXPCvV22GbKdZMfGQLNfcWRY?=
 =?us-ascii?Q?YqhfEeRsZzPeSzfQBF84cxi7oKfZHxgzCyCEedAhVN0Tzv+wtedHf6CfElZ2?=
 =?us-ascii?Q?wA0lvuLJ9bt0p/EBAVfaGfiJav34BvoVrIAE/LiyQnkjmt5oFIpmiiK8GEFp?=
 =?us-ascii?Q?TGCWRaqP4s4gGBa08m0xk30dYdGXOjXsrAL6I3eoK1b9lZUS+Rb0gzpUnXLW?=
 =?us-ascii?Q?aKjy/EKLHfqpU3tpCm6TYpvA9M6XIyy3lgY87c420dYyiz0hjB3+YOVz7f3T?=
 =?us-ascii?Q?YFnwmH+CEtxtEt4GD2piXpV4clpGLeNq5eqhpVatZk1Cb0AeJv/gxkyfOIVd?=
 =?us-ascii?Q?JlhXPGc7HgBwCqQIdNDZpsYgP6b+iRyY7ZIBtB92FL0W0U9uw97O47vAxwbN?=
 =?us-ascii?Q?CUIZTOe0oJhPhvmWItM2UVYOpTFvSlkxcGNBhqaXf7XE6WLgYBWagOOkofpO?=
 =?us-ascii?Q?+o1qhvurXHbjl0d8S4+kzHEcXQ6YnDcHVHXwMciq0yZpigHj5nM7rg3KxOiV?=
 =?us-ascii?Q?MuPhBM+2fWvrpJFxlEJ1agt1N98mfg9q6pULq1pF2CaeFB1CzhHv+XX4dfZK?=
 =?us-ascii?Q?+C0AVwtsqzbkH7Ut9de3+TaB23gs973/dV+rQ5wENLDSDy90vC0Licl3I3Ei?=
 =?us-ascii?Q?lT9T8qepckpcbj+PW5qkiyOPqaZNC2RvfrP9B5AvJks8ujodGINYuWR2XPzZ?=
 =?us-ascii?Q?vQsZgpJU2Bo5MfM0l7kyPAySPaJY3GOtSczJAeg4sE7vd5u6dASjYmqUtXa/?=
 =?us-ascii?Q?r2aJSiWKF6a/tJ10VGyBOs5FWFwFgH05y0Zo2WQ/l3l8YPLuib3h4ioKPDkV?=
 =?us-ascii?Q?FT5wTP1ewxp/9GrDFtVqZzBO3NTiEg7yG7iANqa2H7+Q8o0FBC93tUSN9o/t?=
 =?us-ascii?Q?pPYSEi1Qvh/FU/j/KStFXEQPbwTS+iP6Bbd9o8iF3aNEA4SKMTCIy6hULEQc?=
 =?us-ascii?Q?eetlOXECbvpegkarYhwdYqcDoxwvDLU9JLyX6Na1JEZ58UaGD1UAwtOR83Qd?=
 =?us-ascii?Q?1Ob1c78YZPUWqa94BW8G5MJI3jBYNtqtw0Y33UhoD9LXScws5IRsHUwOzwjM?=
 =?us-ascii?Q?RWwIiNdyYwmNn+X8KyCySN6VP8Ev259xelaY2KUyy3Z+31Pnsp6u/zg0Wo6Y?=
 =?us-ascii?Q?NIpzC7XelmmvCuwuKPc04hiv+RH5dGyKSoBn8OQsJ9v2cJA4wwwhaDBSmP2V?=
 =?us-ascii?Q?ZfXTc2WNYaOkE/gb39YfYgYeX0gDAGULj2uJVaY1SGn3P9pyzZz6w19pGw8a?=
 =?us-ascii?Q?3HC+W1+ZoQWFvfb7tYo/V4theNlretdTHiCYohuwrmP2Yb/9Si1yyg6lA1ID?=
 =?us-ascii?Q?LNi7UGOyinxZeGeXbh+SDuiEayZYkG8k2z4m/4Tc8Frqtg0mRDc113EZNsz5?=
 =?us-ascii?Q?2zKo+xVmM8MxJ8gYIb+/UJSGe3rjpbRcrc2iQerDOTmk9enW4WO4eBMrd30J?=
 =?us-ascii?Q?RbmOAZIqMxourhvXOFsHEXzA2cZMfxjYZbOZNp9RGyLB18ULjKxHewPbPGby?=
 =?us-ascii?Q?5OV/QJDMgX+dVYchUsqz3k+qOBLgZRxSlJwtyEEhqmq2C48bDPAB3zNJbMnP?=
 =?us-ascii?Q?tTNa16oJMxOH8eNE6kNQdgpUHaOZKKyOrzA9NqWyP+HrCXuIOyaXyq+DEGY5?=
 =?us-ascii?Q?+oMbW9/8Wf7bWClBCSpQ2JDXeSvgFBGT23dJk9eA/Tc7RnCrNI8Rqmp3V+Cj?=
 =?us-ascii?Q?fuZp4w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AzVue2CWpbtif4aZaTEeMmQqUeZwcePmCUgZQmuHXSkXyaAYaZnnEPcQ2InQHDBvE+nyjjN0yZUvdn9JR7suPWd0f7OWuRV/QfhdR4OD0Fqg5XSi+WiEIvSoaip/e14L85l3UpZqm67hMtIVhSero7OFsRrwKsAXjFZGQ+kf1m6unf2iKzVtExBZbLB4f1QfU6vl/gg/BVJD+QXdDHKeHB+HwoDnvsAlMXiKGD8LHpMzYJ6M17i9fZ9I/dTw+S3mQoyadHyVgkrwP0rTaHZ41gpuOTY/mu/TbEGSDqS9Wfk/w3jxObM7wlNqQG9ckekH7864YaeDutmTgL0HlCE1MEPlIcJEhsv720sNT+q/1o9LEo/P9mxGCcp5yNn89JX1eDwNkDUw+HsgLAo98XUmMEAKEmwlDEdCMrPxQAaoCaa8zRNcuvI68XxUtkPoS2hf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 11:42:53.8542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f446344e-c4ed-4181-5b33-08de6af50663
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5740
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C0B63135D01
X-Rspamd-Action: no action

Remove cross-vendor support now that VMs can no longer have a different
vendor than the host.

While at it, refactor the function to exit early and skip initialising
the emulation context when FEP is not enabled.

No functional change intended.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
v3:
 * No changes

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


