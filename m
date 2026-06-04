Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j3prOZoOImr7RwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 01:47:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9261C643FEC
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 01:47:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=nBA2nMKB;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1328745.1593077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVHmA-0001h8-V2; Thu, 04 Jun 2026 23:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328745.1593077; Thu, 04 Jun 2026 23:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVHmA-0001eA-SC; Thu, 04 Jun 2026 23:47:02 +0000
Received: by outflank-mailman (input) for mailman id 1328745;
 Thu, 04 Jun 2026 23:47:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wVHm9-0001d4-4K
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 23:47:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVHm8-00Biis-HD
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 01:47:00 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a220e44-5cb7-0a2a0a5109dd-0a2a4505a1a0-20
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 01:46:59 +0200
Received: from [52.101.53.25]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a220e72-aaa8-0a2a45050019-346535190fa7-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 01:46:59 +0200
Received: from BL1PR13CA0432.namprd13.prod.outlook.com (2603:10b6:208:2c3::17)
 by PH7PR12MB7967.namprd12.prod.outlook.com (2603:10b6:510:273::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 23:46:50 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:208:2c3:cafe::5e) by BL1PR13CA0432.outlook.office365.com
 (2603:10b6:208:2c3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Thu, 4
 Jun 2026 23:46:49 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 23:46:49 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 4 Jun
 2026 18:46:47 -0500
Received: from fedora.mshome.net (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 4 Jun 2026 18:46:46 -0500
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
 b=DjOyVFw2/QVWNFLjXHaF6j+8H+X0sF6WJ5mXvqdeS1bmpo3EnssE3I60+rwa0bjyXUFTEhyUAFIk/P6y8gZkP2ffhiTI/e5n0Yfp6ggbed+iVRGUwAB1o/5otyL7I/4r9AixlfmbAyiHjxDqKWWG2jocUVItF23S04XrmQ2pcti80UUPWsyA+vSMD/35JiV5bfXE6WSAFcx9H7jabNRXXmGDRwXQcneC/L6tXdkmxfl8wDd+ms+eM/LDYhaKpmsR3JHtdTCgASA0XZTi5Vs0/zB99HA+JXxgzCzCmp2CK8qSHTSlSJ48dHp4A2Mv2wjiJNGOBXxXF82dpe5n9FPWZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=culTp5npElJ0EQCOehNU8q2yQwTQyvCCP0XUiLS9xBE=;
 b=mSKaooZ3gqYoBiHPajhtKWDi1nbAxT6nBKdEhuaNM/rEoCzzOch5RHEaXqwxbIgwI96PTh9QbRxe/v/aEfNyxuVqJi9ml8bux61IWr6UuIeDV/nvPvswAHBd4BHGVenD+PhsKExygSCkb2Db4wZGJTvtMVyJrm9IcZQF2ELyami2SLVvEHqIW9WOImbI60ZVp9iSHOE2MAyPeeu/raw81cXUf4IvvQ9OeQJN7eejexsV7wYxZoIMb4NOv3iw7lrgb7gmWpzZF1dBDBWgjXgsX8VvxajqWpwTQr4yJaVHgY6iFFUGwFjobRt9tylwxlWlb1/mP/oGvdry6VgXJfMNVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=culTp5npElJ0EQCOehNU8q2yQwTQyvCCP0XUiLS9xBE=;
 b=nBA2nMKBcre1GUFqrK1iO486e6YpiEqpshMX5r4cbMrPXJCLg9sl/MuCY09XBfhQEDYU+abNJwg5HIf3ezjgCaaHGg5W4WuKm38eeDGPXPsTrvLX7/Dres6TH2Fo+GfWcOhhOHVdqlD+8Ux5h/9b2SuAJYo3Nh0Llr3lQ9k0B2s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [PATCH v2 3/3] xen/x86: Change stub page allocation/free logic
Date: Thu, 4 Jun 2026 19:18:37 -0400
Message-ID: <20260604231837.804560-4-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604231837.804560-1-jason.andryuk@amd.com>
References: <20260604231837.804560-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|PH7PR12MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: 81cef292-8943-40d1-98e1-08dec2938bc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	DtCqgdskuSN4ag7qf6YcMx3DJReKpHSfDIfI0zz+9yeH9/MZ3WJ8ZGKwnQNLwUkwPrOEG5CfQvMMvRYoqUaiOJ4KmV59M2COjs9Utq7oLy5G6vJJzpNU7Zaax9SHa2AqRJO0gc0OvrBYzPcH04AQOiLEgpzVETEavv684nMGWZxwUmBCLQq9Y2yy1SsLVOx3GRrD8ywdAq5fyEDbvo8JuDDEoh7DTfCxKGRusHEvA2LUUjCDB9bK1uCh/NhRaKZI67GDM1PmtgRQwQcKRc9t1l/Yyso0HkgtvpSP1hyVBnk83FsXw2ZIcaufht8zRkYdJwro3msKiLfrTAaRZAQAySzN7klV8PSQ/4vfehAmy7leMuBjf+A+tQDjEojgCELNH03wL0xqZOdSleEa2H06ju4fJhjStSRxcZXaYWMyDU4F56uSoyH9i2TME2hbF6SbsSy5v2RBxjdFjOi1WjBmkOq1+OhU0Nql586dmGTHD0con0BYz+/8heESUWF9CDHCTKeASQAWg+tKIuqLhQi+a6h7cYG3r4JNPgmg0ng3h3N/+FcyhJpGk9E3KQRYQdepLKgWggikExcgYcdt56r/IeEAFXj5jb+U5jkwSj3nHz2MEwbntzpLRQkdb8n/tzXEKEdjwEla7ltH0ZpFMXy3PkaEOoxNGXvUEk8HV63Kn+Yql/xLvCh/Cb4WWuAui7AsZbiNkKNYKqlLH1bBuExwUUV82ZuJL92hnEoHchTnOLo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	56uhjYu24TXiQJw2BVkKUmWlV6fjHtfzGgvsxzxYnRaH2Vvt+IbOHYRAWLFSiGaTv9mvlrACqolMwwk6BMR38YCyk9HGwog4YLntgrHu8xY0c5sWTzdXChqrC3uFm55Ww5qSnpNUutFXfdYQhPIkqumdqtL1Tvc5OV8CAwLKVe7hgsYXjyPyCMPBFPtA5arHzg27bTG+iXMMGA6OZ7CjVl1aG1EAYg3JGqqo5QiLtbCIS0tJk+tyqzn7uRmm37q2LtEeXYnofHx0jf+O/L/FPTSbOwYMi/xADcU5guDC6mKqO77i3erPcCXC36fgbbi26M0mJStoVgIs6P3VSWWQfMrpIIEGSpb6J5g7v3jzjnTpEXGUFWGQm3KEaAC//Yb+Ktm0/2Qk4HZsBdvIo5uoHY77KwQ2kKg58cXJQOaEhIOLfYLyhGOOOlGygEzigx1l
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 23:46:49.3630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81cef292-8943-40d1-98e1-08dec2938bc4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7967
X-purgate-ID: tlsNG-c201ff/1780616819-D9B70443-D0A78CEA/0/0
X-purgate-type: clean
X-purgate-size: 3846
X-Rspamd-Action: no action
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
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jason.andryuk@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9261C643FEC

Today the inine tracking of the stub page is problematic.  0xcc is used
to indicate unused, but it is also a "clear value."  A !CONFIG_PV build
with smt=0 will bring up CPU0, bring up CPU1, bring down CPU1, and free
the in-use stub page.  Subsequent CPU onlining can write to the re-used
page.

Each stub page accomodates 32 stub regions, and each CPU uses an offset
into its portion of the page.  Each CPU used a CPU-specific mapping of
the whole page.  The virtual address of the CPU-specific mapping is
fixed, so it can be used to track the stub page.

Remove the actual free-ing from cpu_smpboot_free().  Use the stub_va PTE
to track the underlying page.  destroy_xen_mapping() would clear the
mapping, so replace it with modify_xen_mappings() to retain the PFN in
the PTE (with NX set).

In alloc_stub_page(), check for a valid PFN in the stub_va PTE.  When
found, it will be used.  This handles re-onlining a CPU.  Otherwise the
existing logic is retained to use a passed in mfn or allocate one.
These paths handle to bringing up new CPUs.

If all CPUs for a stub page are offlined, the page will be dangling and
unusable.  But it will be re-used if CPUs are re-onlined.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/smpboot.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 7241dba621..11937175a9 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -647,11 +647,21 @@ unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn)
 {
     unsigned long stub_va;
     struct page_info *pg;
+    mfn_t stub_mfn;
 
     BUILD_BUG_ON(STUBS_PER_PAGE & (STUBS_PER_PAGE - 1));
 
-    if ( *mfn )
+    stub_va = XEN_VIRT_END - FIXADDR_X_SIZE - (cpu + 1) * PAGE_SIZE;
+    stub_mfn = page_walk_mfn(virt_to_mfn(idle_pg_table), stub_va);
+    if ( mfn_valid(stub_mfn) )
+    {
+        *mfn = mfn_x(stub_mfn);
+        pg = mfn_to_page(stub_mfn);
+    }
+    else if ( *mfn )
+    {
         pg = mfn_to_page(_mfn(*mfn));
+    }
     else
     {
         nodeid_t node = cpu_to_node(cpu);
@@ -664,7 +674,6 @@ unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn)
         unmap_domain_page(memset(__map_domain_page(pg), 0xcc, PAGE_SIZE));
     }
 
-    stub_va = XEN_VIRT_END - FIXADDR_X_SIZE - (cpu + 1) * PAGE_SIZE;
     if ( map_pages_to_xen(stub_va, page_to_mfn(pg), 1,
                           PAGE_HYPERVISOR_RX | MAP_SMALL_PAGES) )
     {
@@ -990,19 +999,18 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
     {
         mfn_t mfn = _mfn(per_cpu(stubs.mfn, cpu));
         unsigned char *stub_page = map_domain_page(mfn);
-        unsigned int i;
 
         memset(stub_page + STUB_BUF_CPU_OFFS(cpu), 0xcc, STUB_BUF_SIZE);
-        for ( i = 0; i < STUBS_PER_PAGE; ++i )
-            if ( stub_page[i * STUB_BUF_SIZE] != 0xcc )
-                break;
         unmap_domain_page(stub_page);
-        destroy_xen_mappings(per_cpu(stubs.addr, cpu) & PAGE_MASK,
-                             (per_cpu(stubs.addr, cpu) | ~PAGE_MASK) + 1);
+        /*
+         * destroy_xen_mappings() clears the PFN from the PTE, but we want to
+         * keep it for potential reuse if re-onlined.  Pass _PAGE_PRESENT to
+         * retain the PFN.
+         */
+        modify_xen_mappings(per_cpu(stubs.addr, cpu) & PAGE_MASK,
+                            (per_cpu(stubs.addr, cpu) | ~PAGE_MASK) + 1,
+                            _PAGE_PRESENT | _PAGE_NX);
         per_cpu(stubs.addr, cpu) = 0;
-        per_cpu(stubs.mfn, cpu) = 0;
-        if ( i == STUBS_PER_PAGE )
-            free_domheap_page(mfn_to_page(mfn));
     }
 
     if ( IS_ENABLED(CONFIG_PV32) )
-- 
2.54.0


