Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AWP2NJoOImr5RwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 01:47:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD9F643FEB
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 01:47:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=zj2X3jfA;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1328744.1593068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVHm7-0001S4-Mq; Thu, 04 Jun 2026 23:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328744.1593068; Thu, 04 Jun 2026 23:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVHm7-0001PM-JD; Thu, 04 Jun 2026 23:46:59 +0000
Received: by outflank-mailman (input) for mailman id 1328744;
 Thu, 04 Jun 2026 23:46:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wVHm6-0001P6-Mv
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 23:46:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVHm6-00Biis-3j
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 01:46:58 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a220e44-5cb7-0a2a0a5109dd-0a2a4505a1a0-16
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 01:46:57 +0200
Received: from [52.101.201.8]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a220e6d-aaa8-0a2a45050019-3465c9080b28-4
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 01:46:57 +0200
Received: from BY3PR04CA0009.namprd04.prod.outlook.com (2603:10b6:a03:217::14)
 by IA0PR12MB7676.namprd12.prod.outlook.com (2603:10b6:208:432::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 23:46:49 +0000
Received: from CO1PEPF00012E64.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::14) by BY3PR04CA0009.outlook.office365.com
 (2603:10b6:a03:217::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 23:46:48 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E64.mail.protection.outlook.com (10.167.249.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 23:46:48 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 4 Jun
 2026 18:46:46 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 4 Jun
 2026 18:46:46 -0500
Received: from fedora.mshome.net (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 4 Jun 2026 18:46:45 -0500
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
 b=beMpzYk4BI7eulFjYHWel2XpVSAhjCvZzVlnOh8LrisyDA+IVCWsV2W6nie7BvsT6QMcTZoMI0BXxqj904XKmT8CUyLU+0bJVxhopKMuZBSHxxGGxdb7E7ULw0k49t2/jER6/qI8ZGF3H8SyYilfSPb22/O9jLPHkuRxnNYfOUxSU5OlbnEhs71VHBiw4xX8bsRu3NwqUM/T7XnpTv6n4YNHbTjCQZQMEtp7NTuif6nmsBlGXYx2HSdR/ymuxHLvKfLaRRKd/WAdjHDeZMBksR+pydWzj8f6m+eZ6jeIpBhrBrr77ZyfmtSKS9WEJh3wxxYvzes0b+3p6w2Zl+UwcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/K276bWRhEK1HjFm+MjFQzRZlMZ7rWNjT0GqIZRCag=;
 b=j1Wc8WLJ1F5UFf19dT9G4l9upk+VYynKOXU0fMWFZqkalFXBnLUKhuK+x75YZea3vJVNysFxfUnzejB6MmNoaWv9332aY5cUGIUIPg7TKCv7r/epI2VctET07WCbonrJiwC2srhKgDKzUc3N9GlP2FCqx87thyCuZ9apd/LgFHKdkvcUjIUMimiGjxxU77Oss9Iqo7yuhJ/PLUqNPhKsDPy+ggpRBeymJQ/NdVoDVSvVsTF8VQaPLTjKPCFvmkNrma9Ul27ehexS96IAsAviM5IaAp4sful9eI2OfdfaQUhKUSh/iHecAxfdFECoJoxd4eoSf9QJKDQ1YSx/bYce1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/K276bWRhEK1HjFm+MjFQzRZlMZ7rWNjT0GqIZRCag=;
 b=zj2X3jfAuLFLbQ4Lia/yqhldc+tapSuSgpTTv5LV9s0Gme1ikhQZBXV8uv4cWEhvUDsPK4mjaJLm2l8NMl5h9nEBE+tN8urSH07xBMlnfspYmO18Z8+IhEuMr11cEVYkkfjD8IKUzWuWdrDt5aXM6dQgNcXWB+cVKgVY/4SD0wo=
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
Subject: [PATCH v2 2/3] xen/x86: Split out page_walk_mfn() helper
Date: Thu, 4 Jun 2026 19:18:36 -0400
Message-ID: <20260604231837.804560-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604231837.804560-1-jason.andryuk@amd.com>
References: <20260604231837.804560-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E64:EE_|IA0PR12MB7676:EE_
X-MS-Office365-Filtering-Correlation-Id: 3daf67a8-94bd-4328-83b9-08dec2938b16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	1GzPG10W9udahPG7+IIKmBkWwdmcR4/EpwuW5VdPBxA7r3nK1pOtDUQIt/pMWSMvd48fzSMHpk563fSKSSmlqlN48g/6dBZ197kcRUfHy5tyhLmvt/iNG51OWM9SYrnFh5WN6Cm4NdngWQPZxvia2rl3wtaFm+Ou2Tnls6BLDKEnIn3fqAmT74r13/Xc+QK+f/sZ6+e7wpF5YjfqOy7zNAxmtTfYrrCqFDmmsKWIfCVhe/bXmBp30BG9TfldZyLHStMz0Y3iX60GqiBIkKh9yzcxvWk8V2x9XFNHZJzBYAGtmHTV1WYH6neMO21lOGoysqdtr440G64p/J0sVdbwe4p2PjnU0Ph3e6PvV1RCjSsscQ8v2G40j6pkDASffoBlQ4VEmFvFt3iJilgd3nNe3Q1dPuyZwh17DmMbFCHtxzIC+UceFV7PGKT661ywBbAvUNR06L8ndzcaqjxV4Bxoprm/LNSdYOT4iok9GIPwrzqjdDTgOOeRPGhgantEmIJISYHpgz2mqr80sr+asymaPSuZ1TfyZ5S6Fm5DXK02LRjVbeUZq0lmS5eA9kKV8+YWZwUI6zbCPfZSZWFadDXFTKP0iubJqNO41p9ZhskfmezhC20ojgzvljBZxzHJUYLAfV0frVgyKnWgPv5Yy/5iykFaAHVAI1CkzE8+h3bw0KNpscnbcuz5Ob1g3TCPRmsJL6ESqswUmVLu9bPmscKi2l7qU/jQJd3DKvb0FLK7wbs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	V5q3+SvOcLlyRD62FvFNBNBs2Sy5KNRLr6VLUhZjn3AV+mdJU3zbtpXLlO5mNpOxygVvu5pY2Lv3RjrmF2jfpn7dDERHNeZpeIEDUDmszpr/Y/KSGDVNX9Rng/fiTfgwU/ZhmwHM4XOw9Mgff1oHydd48OhIy1uf+3K3boulKZedpAlZiBlzgw2kxoRe8X0d+TSv+M/zq5DcJtTKnREy6NnweZKPNoB7QQkXOykiWZaeRMs9FscMK057aihOb48fMGMU/gcy+dLG2XmTANf+37BbI8/V1RnSte7ne4uaNJHcuF47tV288ig9b/sbfxb9Lt++Si5aMYC+6lA9j45DdLbvWWe56N7n91QketJHmK8A8/OeyhyhWy4fWYaHVCIIIGfV2JMISuT0BxEdDzOuEaf9AuzN2rKzm5h/Oqqn1GH4S6fI1h1xeUtUiMkn4C5O
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 23:46:48.1335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3daf67a8-94bd-4328-83b9-08dec2938b16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E64.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7676
X-purgate-ID: tlsNG-c201ff/1780616817-D9971443-86B4A269/0/0
X-purgate-type: clean
X-purgate-size: 3566
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
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jason.andryuk@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[14];
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
X-Rspamd-Queue-Id: 2FD9F643FEB

do_page_walk() returns a mapping of the underlying address.  Split out
page_walk_mfn() which returns the mfn_ti, and have do_page_walk() use
that.

The new standalone page_walk_mfn() is generally useful for looking up the
MFN pointed to by an a virtual address.  It will be used in the x86 CPU
stub logic to determine if a stub page is already populated.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/include/asm/mm.h |  1 +
 xen/arch/x86/x86_64/mm.c      | 31 +++++++++++++++++++++----------
 2 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 06c20ab8de..6dc5115093 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -587,6 +587,7 @@ void audit_domains(void);
 void make_cr3(struct vcpu *v, mfn_t mfn);
 pagetable_t update_cr3(struct vcpu *v);
 int vcpu_destroy_pagetables(struct vcpu *v);
+mfn_t page_walk_mfn(unsigned long cr3, unsigned long addr);
 void *do_page_walk(struct vcpu *v, unsigned long addr);
 
 /* Allocator functions for Xen pagetables. */
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 8eadab7933..d197dce9f8 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -59,29 +59,26 @@ extern unsigned int compat_machine_to_phys_mapping[];
 
 #endif /* CONFIG_PV32 */
 
-void *do_page_walk(struct vcpu *v, unsigned long addr)
+mfn_t page_walk_mfn(unsigned long cr3, unsigned long addr)
 {
-    unsigned long mfn = pagetable_get_pfn(v->arch.guest_table);
+    unsigned long mfn = cr3;
     l4_pgentry_t l4e, *l4t;
     l3_pgentry_t l3e, *l3t;
     l2_pgentry_t l2e, *l2t;
     l1_pgentry_t l1e, *l1t;
 
-    if ( !is_pv_vcpu(v) || !is_canonical_address(addr) )
-        return NULL;
-
     l4t = map_domain_page(_mfn(mfn));
     l4e = l4t[l4_table_offset(addr)];
     unmap_domain_page(l4t);
     if ( !(l4e_get_flags(l4e) & _PAGE_PRESENT) )
-        return NULL;
+        return INVALID_MFN;
 
     l3t = map_l3t_from_l4e(l4e);
     l3e = l3t[l3_table_offset(addr)];
     unmap_domain_page(l3t);
     mfn = l3e_get_pfn(l3e);
     if ( !(l3e_get_flags(l3e) & _PAGE_PRESENT) || !mfn_valid(_mfn(mfn)) )
-        return NULL;
+        return INVALID_MFN;
     if ( (l3e_get_flags(l3e) & _PAGE_PSE) )
     {
         mfn += PFN_DOWN(addr & ((1UL << L3_PAGETABLE_SHIFT) - 1));
@@ -93,7 +90,7 @@ void *do_page_walk(struct vcpu *v, unsigned long addr)
     unmap_domain_page(l2t);
     mfn = l2e_get_pfn(l2e);
     if ( !(l2e_get_flags(l2e) & _PAGE_PRESENT) || !mfn_valid(_mfn(mfn)) )
-        return NULL;
+        return INVALID_MFN;
     if ( (l2e_get_flags(l2e) & _PAGE_PSE) )
     {
         mfn += PFN_DOWN(addr & ((1UL << L2_PAGETABLE_SHIFT) - 1));
@@ -105,10 +102,24 @@ void *do_page_walk(struct vcpu *v, unsigned long addr)
     unmap_domain_page(l1t);
     mfn = l1e_get_pfn(l1e);
     if ( !(l1e_get_flags(l1e) & _PAGE_PRESENT) || !mfn_valid(_mfn(mfn)) )
-        return NULL;
+        return INVALID_MFN;
 
  ret:
-    return map_domain_page(_mfn(mfn)) + (addr & ~PAGE_MASK);
+    return _mfn(mfn);
+}
+
+void *do_page_walk(struct vcpu *v, unsigned long addr)
+{
+    mfn_t mfn;
+
+    if ( !is_pv_vcpu(v) || !is_canonical_address(addr) )
+        return NULL;
+
+    mfn = page_walk_mfn(pagetable_get_pfn(v->arch.guest_table), addr);
+    if ( !mfn_valid(mfn) )
+        return NULL;
+
+    return map_domain_page(mfn) + (addr & ~PAGE_MASK);
 }
 
 /*
-- 
2.54.0


