Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iF9YE9dZJ2o6vAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 02:09:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF7665B47D
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 02:09:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=DsrLNKAX;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332156.1594817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWk1w-0003mo-39; Tue, 09 Jun 2026 00:09:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332156.1594817; Tue, 09 Jun 2026 00:09:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWk1w-0003kU-07; Tue, 09 Jun 2026 00:09:20 +0000
Received: by outflank-mailman (input) for mailman id 1332156;
 Tue, 09 Jun 2026 00:09:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wWk1u-0003k0-Uo
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 00:09:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWk1u-003tJu-BF
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 02:09:18 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a27597b-e002-0a2a0a5209dd-0a2a450695b6-40
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 02:09:18 +0200
Received: from [52.101.46.11]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a2759ab-7371-0a2a45060019-34652e0bea5a-4
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 02:09:17 +0200
Received: from DS7P221CA0026.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:25c::13) by
 BL1PR12MB5900.namprd12.prod.outlook.com (2603:10b6:208:398::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 00:09:11 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:8:25c:cafe::94) by DS7P221CA0026.outlook.office365.com
 (2603:10b6:8:25c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.14 via Frontend Transport; Tue, 9
 Jun 2026 00:09:11 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 00:09:11 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 8 Jun
 2026 19:09:10 -0500
Received: from fedora.mshome.net (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 8 Jun 2026 19:09:10 -0500
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
 b=nn4xTzilSUUyPxo9EYBK1kyL8PH96khgDf5KkXISvlRmAzSMy+wG8y8n/6kuFxsag1+LU56B/ePs15rl2um4eZAqVlQA1rYA2pJKMPqwRGctIlm1UEMf2ikWI4LRUm9Um8uZ1W8ahOGtHze7ur6YVeFbMYzL82/VxmrF5UI2P0aiHKa1jJlVnlifAtpj+PYcg9lomZfC8N9n1tUlumnum6PmN/20aUZ0SLHO4eU4eZq8jE/vOqWsHsQEEX44ALpmVFWZ5DWeOaSE/6nMo3mpFFV2Geu4oMEKrWL++Z4GHZGPUkXUwqHLHC61P3dDrKw1w5vKAKwvWsGS24dndXUgVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTwb8ekE7mBmp1WJz2KP3LjX28ggFVhtoF/cTlRbrXY=;
 b=nPG2dmPiAf3w8VJsZ/9wkW2FuG2yq0Z0HBlt9j0Az0uA5fErROFRvZjpq1IaSC6xwUWJOrEjHORr+Dq/AwBhtfEfFUBPTKF+A/s7/yHdTVw6ZYexqAwL4trGadqwJRvi3pF9M+C+776B/qcq3EHT0LHrwi0W+eCD1j9C3TsbIlQikNIryLmycriFCdG5OGPdew0+XMc0YFUIT/36TeaLhARcpiK83fIQnMr1JWwvjN3s3PxNh7X0IdTl6q2peCYQ3xHXLAuOEjt7av3YllIejz2EmAkKI0BMHvPf1l5xQ/IT5bZurF3Iwyv+oevMavWa3TthBXIWgpLHDZIe4SfDrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTwb8ekE7mBmp1WJz2KP3LjX28ggFVhtoF/cTlRbrXY=;
 b=DsrLNKAXPUeLQsDPGW1g3LTGJqTovsPhWhCZOzTPNUjx7UJHQYfIIk9y/mQ8BQgblsvQjPTLvUsOdiqdoWVLuEW+IhTHttTo8xqozi0BTuTu6161PVJfS4vq8GtiZMbwOvoaaC4ojDinG0qg4wnB5EUAfhmSIqZbY2RO7bwIRAs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [PATCH v3 2/2] xen/x86: Change stub page allocation/free
Date: Mon, 8 Jun 2026 20:06:38 -0400
Message-ID: <20260609000638.121027-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609000638.121027-1-jason.andryuk@amd.com>
References: <20260609000638.121027-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|BL1PR12MB5900:EE_
X-MS-Office365-Filtering-Correlation-Id: c39c88da-e084-43d2-82ff-08dec5bb553b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	UwH7UNOMkXHopqWUtV7lCPEDT8Bixb+C6ufhaj4udoBHnT+7KUPZT4w20y1spR5LJ6hVEFddJVB3BvPYpm3765PJlS1AZ/KXOZ0mXaOvKzK96ZFWPwloV2ky2KA+KCzcYkULNgEKtuoXwaNlhl8/Rcq/jZrnCtsN8SkZplvkbzYxmBZDolctH/H8W6Gc6X6Fnz/ILPOiuYrBv4CSHIGCZtToZwLT91Gql1R++mj4GauPkEOoz6HC1Xmxtv4ROLGCM+RAAWQX+gBzermMoImx00Fk4twAoG2i+uwpjtBTT9z+WLbadRil/NTm0cfufEjI9E/6uJUDJI15qHHzuG34Yqv4QQvSh0qbR2XGgYSMhD15gBoCDNIzLi691/+w9C/yluaSBMd20NN6OL4RqZ61qOVsEFbymEX741fXRWltWr7NkULTyujWP3dkSVs0cjmEm9tBMVvh7C3rA1BaMiMPFCcGvQ2Te2Fq24Q5ESUwdEIX9V/uJS9pzRIuMawyAUDXdKNExDX7Egnai0i0e7qRT7UrtEmildK0u5Pt4PJno4jHyqjpFMzLtN7ckwzbnYcWlt4+MkUtTREl+9uCQQmOyhnAwKQUuI3GMCPQk14rq0cQX2hlokazeTn++Sj3q0ZPfV/0urDDZbHUxOpODZ/vM/a2TM8ddMVOEbGo8dV7z0cLRBfLMZPMO9MKQU0ukyEQwqMo+T0LBlS2+XKZrv+q6zhHDXqfy3z/a17KAEVb3y0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JiKznbqkzD3rEV1ZG2cjNXihkm+2i09z3NbdkNcqsh3C5nvmETIskB9izFEVQu/hUdr7JuEEh5rGB7cNVWz9U9OOF4mO5I0zMadSD5O4/QxTt0vv01BSVLEloV6hD7d6tDBQ6xhLJ+BdzK+AYQaqPePAiEqMDlWEEyHYWnianzjb0+6klv+Sua4kS3mrQGC1uQuZ+vEsz+CcsKzLiVtNdSgOB+V4jT2yWygQdPqRn8euzWrITuesXIbPjhwxMoZfaVJnkwqSYoGk2voex8i7xET8SdwDRb/tCwcv2rWFl5MHhx6yxL/x9ANqRuJk7eQ/2XqFUvNJiLeWJpEDCR7p2wCQv/vScmVHCv4NH7D+tJ1FSq2Tzz3zC9VTVZLlXS9d/sF+zG4CkjEv56B73bqOFyv/RsWCUgsNTA7NZGv/uvJR5i7SfFtG4P5LPQQmsCYL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 00:09:11.2260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c39c88da-e084-43d2-82ff-08dec5bb553b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5900
X-purgate-ID: tlsNG-16d1c6/1780963758-8D186D75-030DC01D/0/0
X-purgate-type: clean
X-purgate-size: 8330
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jason.andryuk@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8CF7665B47D

Today the inline tracking of the stub page is problematic.  0xcc is used
to indicate unused, but it is also a "clear value."  A !CONFIG_PV build
with smt=0 will bring up CPU0, bring up CPU1, bring down CPU1, and free
the in-use stub page.  Subsequent CPU onlining can write to the re-used
page.

The new approach uses a global, CPU-indexed array of stub pages.
However, to handle NUMA aware allocations, we cannot allocate all the
pages in advance because the NUMA information is not available.  Keep
track of 1 current page for each NUMA node, allocated on demand, and
allocate the stub buffers out of those pages.

The current NUMA allocation approach is opportunistic sharing among the
groups of 32 processors.  The new approach will allocate buffers densely
in a NUMA node.

stub pages are no longer freed.  They remain referenced in the global
CPU-indexed array and are re-used if the CPU is re-onlined.

stubs and node_stubs don't have an explicit lock.  During boot they are
accessed single threaded.  During runtime, &cpu_add_remove_lock
serializes access.

Fixes: 7a66ac8d1633 ("x86: move syscall trampolines off the stack")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
I'm not sure how to test the NUMA part - I don't have an NUMA system.
Also, if NUMA is active, is a cpu node of NUMA_NO_NODE still possible?
I used the MAX_NUMNODES + 1 array sizing to handle that, but it's not
obvious to me if that is necessary.

Roger mentioned removing the per-cpu stubs.mfn.  We'd need to replace
that with exposing the stubs array for traps and the emulator.  I have
no idea if that will be an improvement and am looking for agreement on
this patch before attempting.
---
 xen/arch/x86/include/asm/stubs.h |   2 +-
 xen/arch/x86/setup.c             |   3 +-
 xen/arch/x86/smpboot.c           | 110 +++++++++++++++++++++----------
 3 files changed, 77 insertions(+), 38 deletions(-)

diff --git a/xen/arch/x86/include/asm/stubs.h b/xen/arch/x86/include/asm/stubs.h
index a520928e9a..9d776f81dd 100644
--- a/xen/arch/x86/include/asm/stubs.h
+++ b/xen/arch/x86/include/asm/stubs.h
@@ -32,6 +32,6 @@ struct stubs {
 };
 
 DECLARE_PER_CPU(struct stubs, stubs);
-unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn);
+unsigned long assign_stub_page(unsigned int cpu);
 
 #endif /* X86_ASM_STUBS_H */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 19ee857abf..0cac94cbdb 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2089,8 +2089,7 @@ void asmlinkage __init noreturn __start_xen(void)
 
     init_idle_domain();
 
-    this_cpu(stubs.addr) = alloc_stub_page(smp_processor_id(),
-                                           &this_cpu(stubs).mfn);
+    this_cpu(stubs.addr) = assign_stub_page(0);
     BUG_ON(!this_cpu(stubs.addr));
 
     bsp_traps_reinit(); /* Needs stubs allocated, must be before presmp_initcalls. */
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index d7619f534b..d9cd90389d 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -641,41 +641,96 @@ static int do_boot_cpu(int apicid, int cpu)
     return rc;
 }
 
-#define STUB_BUF_CPU_OFFS(cpu) (((cpu) & (STUBS_PER_PAGE - 1)) * STUB_BUF_SIZE)
+/*
+ * Indexed by CPU.  `pg` may be shared by up to STUBS_PER_PAGE CPUs.  Offset
+ * is the byte offset into the stub page for the CPU's stub buffer.
+ */
+struct stub_info {
+    struct page_info *pg;
+    unsigned int offset;
+};
+struct stub_info __read_mostly stubs[NR_CPUS];
 
-unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn)
+/*
+ * Index by NUMA node.
+ *
+ * `pg` is the current stub page for the node.
+ * `next` is the next available stub index (STUBS_PER_PAGE available).
+ *
+ * if `pg` is NULL, allocate a new one.
+ * if `pg` is !NULL, use `pg` and stub `next`
+ * When STUBS_PER_PAGE are all assigned, clear `pg` and `next`.
+ */
+struct stub_node {
+    struct page_info *pg;
+    unsigned int next;
+};
+struct stub_node stub_nodes[MAX_NUMNODES + 1];
+
+nodeid_t cpu_to_stub_node(unsigned int cpu)
 {
-    unsigned long stub_va;
+    nodeid_t node = cpu_to_node(cpu);
+
+    return node == NUMA_NO_NODE ? MAX_NUMNODES : node;
+}
+
+static struct page_info *alloc_stub_page(unsigned int cpu)
+{
+    nodeid_t node = cpu_to_stub_node(cpu);
+    unsigned int stub_idx;
     struct page_info *pg;
 
     BUILD_BUG_ON(STUBS_PER_PAGE & (STUBS_PER_PAGE - 1));
 
-    if ( *mfn )
-        pg = mfn_to_page(_mfn(*mfn));
-    else
+    if ( !stub_nodes[node].pg )
     {
-        nodeid_t node = cpu_to_node(cpu);
         unsigned int memflags = node != NUMA_NO_NODE ? MEMF_node(node) : 0;
 
-        pg = alloc_domheap_page(NULL, memflags);
-        if ( !pg )
-            return 0;
+        stub_nodes[node].pg = alloc_domheap_page(NULL, memflags);
+        stub_nodes[node].next = 0;
+
+        if ( !stub_nodes[node].pg )
+            return NULL;
 
-        unmap_domain_page(memset(__map_domain_page(pg), 0xcc, PAGE_SIZE));
+        unmap_domain_page(memset(__map_domain_page(stub_nodes[node].pg),
+                                 0xcc, PAGE_SIZE));
     }
 
+    stub_idx = stub_nodes[node].next++;
+    pg = stub_nodes[node].pg;
+    stubs[cpu].pg = stub_nodes[node].pg;
+    stubs[cpu].offset = stub_idx * STUB_BUF_SIZE;
+    if ( stub_nodes[node].next == STUBS_PER_PAGE )
+    {
+        stub_nodes[node].pg = NULL;
+        stub_nodes[node].next = 0;
+    }
+
+    return pg;
+}
+
+unsigned long assign_stub_page(unsigned int cpu)
+{
+    unsigned long stub_va;
+    struct page_info *pg = stubs[cpu].pg;
+
+    if ( !pg )
+        pg = alloc_stub_page(cpu);
+
+    if ( !pg )
+        return 0;
+
     stub_va = XEN_VIRT_END - FIXADDR_X_SIZE - (cpu + 1) * PAGE_SIZE;
     if ( map_pages_to_xen(stub_va, page_to_mfn(pg), 1,
                           PAGE_HYPERVISOR_RX | MAP_SMALL_PAGES) )
-    {
-        if ( !*mfn )
-            free_domheap_page(pg);
         stub_va = 0;
+    else
+    {
+        per_cpu(stubs.mfn, cpu) = mfn_x(page_to_mfn(pg));
+        stub_va += stubs[cpu].offset;
     }
-    else if ( !*mfn )
-        *mfn = mfn_x(page_to_mfn(pg));
 
-    return stub_va ? stub_va + STUB_BUF_CPU_OFFS(cpu) : 0;
+    return stub_va;
 }
 
 void cpu_exit_clear(unsigned int cpu)
@@ -990,19 +1045,12 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
     {
         mfn_t mfn = _mfn(per_cpu(stubs.mfn, cpu));
         unsigned char *stub_page = map_domain_page(mfn);
-        unsigned int i;
 
-        memset(stub_page + STUB_BUF_CPU_OFFS(cpu), 0xcc, STUB_BUF_SIZE);
-        for ( i = 0; i < STUBS_PER_PAGE; ++i )
-            if ( stub_page[i * STUB_BUF_SIZE] != 0xcc )
-                break;
+        memset(stub_page + stubs[cpu].offset, 0xcc, STUB_BUF_SIZE);
         unmap_domain_page(stub_page);
         destroy_xen_mappings(per_cpu(stubs.addr, cpu) & PAGE_MASK,
                              (per_cpu(stubs.addr, cpu) | ~PAGE_MASK) + 1);
         per_cpu(stubs.addr, cpu) = 0;
-        per_cpu(stubs.mfn, cpu) = 0;
-        if ( i == STUBS_PER_PAGE )
-            free_domheap_page(mfn_to_page(mfn));
     }
 
     if ( IS_ENABLED(CONFIG_PV32) )
@@ -1041,7 +1089,7 @@ void *cpu_alloc_stack(unsigned int cpu)
 static int cpu_smpboot_alloc(unsigned int cpu)
 {
     struct cpu_info *info;
-    unsigned int i, memflags = 0;
+    unsigned int memflags = 0;
     nodeid_t node = cpu_to_node(cpu);
     seg_desc_t *gdt;
     unsigned long stub_va;
@@ -1091,15 +1139,7 @@ static int cpu_smpboot_alloc(unsigned int cpu)
     memcpy(per_cpu(idt, cpu), bsp_idt, sizeof(bsp_idt));
     disable_each_ist(per_cpu(idt, cpu));
 
-    for ( stub_page = 0, i = cpu & ~(STUBS_PER_PAGE - 1);
-          i < nr_cpu_ids && i <= (cpu | (STUBS_PER_PAGE - 1)); ++i )
-        if ( cpu_online(i) && cpu_to_node(i) == node )
-        {
-            per_cpu(stubs.mfn, cpu) = per_cpu(stubs.mfn, i);
-            break;
-        }
-    BUG_ON(i == cpu);
-    stub_va = alloc_stub_page(cpu, &per_cpu(stubs.mfn, cpu));
+    stub_va = assign_stub_page(cpu);
     if ( !stub_va )
         goto out;
     per_cpu(stubs.addr, cpu) = stub_va;
-- 
2.54.0


