Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJ12ByQ4xmm7HgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 08:56:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8719E340A8D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 08:56:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265113.1556193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w6231-0001Sw-Sv; Fri, 27 Mar 2026 07:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265113.1556193; Fri, 27 Mar 2026 07:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w6231-0001Pu-PV; Fri, 27 Mar 2026 07:56:03 +0000
Received: by outflank-mailman (input) for mailman id 1265113;
 Fri, 27 Mar 2026 07:56:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <penny.zheng@amd.com>) id 1w6230-0001PM-57
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 07:56:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w622x-001U1q-Q6
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 08:56:01 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <penny.zheng@amd.com>)
 id 69c63810-5cb7-0a2a0a5109dd-0a2a450599c4-2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 08:56:01 +0100
Received: from [52.101.85.62]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <penny.zheng@amd.com>)
 id 69c6380f-5aeb-0a2a45050019-3465553e1339-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 08:56:00 +0100
Received: from DM6PR12CA0031.namprd12.prod.outlook.com (2603:10b6:5:1c0::44)
 by PH7PR12MB9174.namprd12.prod.outlook.com (2603:10b6:510:2ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Fri, 27 Mar
 2026 07:55:54 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:5:1c0:cafe::68) by DM6PR12CA0031.outlook.office365.com
 (2603:10b6:5:1c0::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.22 via Frontend Transport; Fri,
 27 Mar 2026 07:55:53 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 07:55:53 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 27 Mar 2026 02:55:50 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uNoEnqCNMGfN08G61n00dAavKvL08z0Delr1E2gLDi8QtHiRll6fy6nFRjHsLQpXoFLwHC+embdvi5JoDG57tRq/a1jZE4/IEit7L8qUyvqrjK/K3SIv2UprSiUwJgNoTpSu6XiTcRNcaEMJW/lAc4r0sI00l0xJSaaEFVHafCNfjFNAtg9bPcbrWhqP57cHn3FJNr/3yw/EevZP4+Ca+yqW12jH+WduzV+sTtCu7a57jmHLG8dnK2e5FUc67uYt9oAKMTnaCIID14mxDUBxTYMaiqvap/r8COjO85kAofAp8hIBc1Pfi/h7NRLX1u1AZk8Mmbi+ixRGeVCywwHmmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YAfPwcQ9WQkre89jhdMSQOFTVOhS6f3es3Xfay/BKB8=;
 b=I2Rel786idscsezSDB46Ya8tfyx+y99eXMBzvM4J+SAj6Rb3UMPHo69+JqXUE9zmbNJYy3nP3rXp8Ov1/ZlLnBsAw/+XZ1iEkBasagKr/xAqsYjzmraIqGO1bl0wdR/rFZ0M1G5GKOnlN7mB5YGRxjeU/nLBTh+2pbpwjk8mgwgwFTds0cJ/AjKsi8OLNE/lN902hcpaTn6biJUB9ViwKxDBvvdr0TsQm95j4rYUqB/2mOX4Pyd3m/TjpmcXOC4WyMYW6vZKzj+rUvxQnvrJtSJ8obg7p8pTcvb92x1qoeYb1+TRq0C1i/YbRod5S619iyLk1U4SitYFwMDQPGY7Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YAfPwcQ9WQkre89jhdMSQOFTVOhS6f3es3Xfay/BKB8=;
 b=add8h5DK7EnfMbTLPQm1+DbYu7NEBy7JJskCBMZev3ClIeCa34l6fhC4CZOz/P//TBwXdUd09dXHN8e9kzak7kUW2YamRO+9Glbg1OJv4N46GTd05hWJXaN/cRT/13wEas6IJ37bEFbwpA09pdGAdICjEtFkqjEfVTW7k4TNvQU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>, <alejandro.garciavallejo@amd.com>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Penny Zheng <penny.zheng@amd.com>
Subject: [PATCH v1 1/3] xen/arm: generalize per-page GFN storage beyond xenheap pages
Date: Fri, 27 Mar 2026 15:50:23 +0800
Message-ID: <20260327075025.3008606-2-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260327075025.3008606-1-Penny.Zheng@amd.com>
References: <20260327075025.3008606-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|PH7PR12MB9174:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc710ff-bd1e-4720-6a11-08de8bd64561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EsNfP2mNFa8Tdtg52bILYkE53UStOkl/y+hFLXK1wC42iW+lNwWlafhRTKb2J1puWfhH48C7POwIQpF/qA9qSyNrziadplzDp9nKKv0S1ahmzdxFPRzclhxcHt7aHmxgAnldpb4rBuU075bzf0C6sZ3DGaPC5gxzb3p5el6MATjueFlu4tA2bko1JdnEuRbrvz7UKGr4JBp9QrVvQsb6TJZ98WPaWF4+NLB7u4DuvhJ6ceJmjv+hUKlHp3+STRJyGgKIgWKUsQHbyIM0hTy7v+wvJ1/MIDRG4e8/yBk546OT0hk6Avl2dAp0CUmbK9XoaENmKTpbeAnJ6yJB36ifkg3Js7yryb6e7KEagL2nxvfeszOvoC2RSwMVr8+q0KRLCY1FAera7G2EuueNDk9tX3slnFgGn9ADEP/Blnbn6RC6xoWJQQC/1e8sxh6rNJNfkBgK0OeD9GEjLj1yh/vhqbFhAs5svS0hcnJCBPlJEfzpZ4ARN95o28DlC7O2F9byaLAKXFPjCo/1f+zrJpzE7rP8bKnzrWrywx5thNTkY1peZwnbFhUzWGRVqQzMTqTDIT971qPTAnW4uVxuCs6QpMN3l1ynsJt6VHikF0QxxESkryYZyUXTlFPBp15db/TefQcMYpNl7JYq+61h+7NDzCN91BSscGEKnkZtq8snFvptJf/6f/XPwpAAFICrl71ySWVoM5ZJCL91zJUKVN4MybqLYAa4B/mqkTE4LVgi0MvNJX7LaWyt8IzcQAnp2hdi1G154FfZcjawNp3ImXryOg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4f83CXG7K+yjcPrkVabmky5LMIMSIBD3vUmnG+YA6bwkddrpMRwf/8MW+Xa6T2NYLnDOH6dP9GDSVVN9/BEhXEvYt3xXHQOmR1ASgHXMwxK0lJWLlqBoZ+H19Boyn88dYTg1Z+RH5m99OVNMZyZbn1xwjoCXI2Kp9ldobmq61+VquFGFVxevDhBqbCalM6uV892/YoCiv763uJ1gIhb8+Lz/U0BbxBAs3M4uh4Gm6/Q9y+TR1wXKVyY/VE4840PBEo1UAGReO8G2XO3ioDIoLnat3lKh3NI+4qA98iKksulAYfkwKCUaWpHMRRdhZa4tW5UnkzW6OWcp31AE6B/UNYu7dAVPLCUs7dJx1I273T1iDiiSyXRIU6bPbjcEVmjuTgTmulJgOvb46XYhTJqi7XwonNMj3CyIn9PDDsP95Lq3C/t/At4yhPKadVzZ4Z2b
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 07:55:53.5689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc710ff-bd1e-4720-6a11-08de8bd64561
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9174
X-purgate-ID: tlsNG-c201ff/1774598161-81156488-BDD22C9E/0/0
X-purgate-type: clean
X-purgate-size: 3611
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:ray.huang@amd.com,m:Penny.Zheng@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:penny.zheng@amd.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[Penny.Zheng@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Penny.Zheng@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: 8719E340A8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As preparation for fixing mfn_to_gfn() on ARM, we extend the existing GFN
field in page_info's type_info to be usable for not only xenheap ones.
Another usage will be introduced later for stolen pages in memory exchaging.

Introduce general-purpose page_get_gfn() and page_set_gfn() helpers
that read and write the GFN stored in type_info. The old
page_get_xenheap_gfn() and page_set_xenheap_gfn() are retained as thin
wrappers with their xenheap ASSERTs, so all current callers remain unchanged.

Also introduce PGT_INVALID_GFN as the general sentinel, with
PGT_INVALID_XENHEAP_GFN aliased to it for backward compatibility.

Signed-off-by: Penny Zheng <penny.zheng@amd.com>
---
 xen/arch/arm/include/asm/mm.h | 37 +++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 72a6928624..d1873ec212 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -113,18 +113,21 @@ struct page_info
 #define PGT_count_mask    PG_mask(3, 3)
 
 /*
- * Stored in bits [28:0] (arm32) or [60:0] (arm64) GFN if page is xenheap page.
+ * Stored in bits [28:0] (arm32) or [60:0] (arm64) GFN if page is xenheap page,
+ * or stolen ones in memory exchanging.
  */
 #define PGT_gfn_width     PG_shift(3)
 #define PGT_gfn_mask      ((1UL<<PGT_gfn_width)-1)
 
-#define PGT_INVALID_XENHEAP_GFN   _gfn(PGT_gfn_mask)
+#define PGT_INVALID_GFN           _gfn(PGT_gfn_mask)
+#define PGT_INVALID_XENHEAP_GFN   PGT_INVALID_GFN
 
 /*
  * An arch-specific initialization pattern is needed for the type_info field
- * as it's GFN portion can contain the valid GFN if page is xenheap page.
+ * as it's GFN portion can contain the valid GFN if page is xenheap page, or
+ * stolen in memory exchanging.
  */
-#define PGT_TYPE_INFO_INITIALIZER   gfn_x(PGT_INVALID_XENHEAP_GFN)
+#define PGT_TYPE_INFO_INITIALIZER   gfn_x(PGT_INVALID_GFN)
 
  /* Cleared when the owning guest 'frees' this page. */
 #define _PGC_allocated    PG_shift(1)
@@ -338,28 +341,38 @@ unsigned int arch_get_dma_bitsize(void);
  * that requirement (risk of deadlock, lock inversion, etc) it is important
  * to make sure that all non-protected updates to this field are atomic.
  */
-static inline gfn_t page_get_xenheap_gfn(const struct page_info *p)
+static inline gfn_t page_get_gfn(const struct page_info *p)
 {
     gfn_t gfn_ = _gfn(ACCESS_ONCE(p->u.inuse.type_info) & PGT_gfn_mask);
 
-    ASSERT(is_xen_heap_page(p));
-
-    return gfn_eq(gfn_, PGT_INVALID_XENHEAP_GFN) ? INVALID_GFN : gfn_;
+    return gfn_eq(gfn_, PGT_INVALID_GFN) ? INVALID_GFN : gfn_;
 }
 
-static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
+static inline void page_set_gfn(struct page_info *p, gfn_t gfn)
 {
-    gfn_t gfn_ = gfn_eq(gfn, INVALID_GFN) ? PGT_INVALID_XENHEAP_GFN : gfn;
+    gfn_t gfn_ = gfn_eq(gfn, INVALID_GFN) ? PGT_INVALID_GFN : gfn;
     unsigned long x, nx, y = p->u.inuse.type_info;
 
-    ASSERT(is_xen_heap_page(p));
-
     do {
         x = y;
         nx = (x & ~PGT_gfn_mask) | gfn_x(gfn_);
     } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
 }
 
+static inline gfn_t page_get_xenheap_gfn(const struct page_info *p)
+{
+    ASSERT(is_xen_heap_page(p));
+
+    return page_get_gfn(p);
+}
+
+static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
+{
+    ASSERT(is_xen_heap_page(p));
+
+    page_set_gfn(p, gfn);
+}
+
 #endif /*  __ARCH_ARM_MM__ */
 /*
  * Local variables:
-- 
2.43.0


