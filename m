Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFMKNMuR3WkLfwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 03:00:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C79DB3F4B58
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 03:00:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281376.1564287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCS87-0006fj-Ad; Tue, 14 Apr 2026 00:59:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281376.1564287; Tue, 14 Apr 2026 00:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCS87-0006cj-5u; Tue, 14 Apr 2026 00:59:51 +0000
Received: by outflank-mailman (input) for mailman id 1281376;
 Tue, 14 Apr 2026 00:59:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <joan.bae@boeing.com>) id 1wCS85-0006cZ-Ho
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 00:59:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCS84-003pRB-CM
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 02:59:48 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <joan.bae@boeing.com>)
 id 69dd916a-bab6-0a2a0a5309dd-0a2a4508da3e-10
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 02:59:47 +0200
Received: from [130.76.20.195] (helo=ewa-mbsout-02.mbs.boeing.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <joan.bae@boeing.com>)
 id 69dd9180-fab6-0a2a45080019-824c14c3c1ec-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 02:59:46 +0200
Received: from localhost (localhost [127.0.0.1])
 by ewa-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 63E0xg0S057930; Mon, 13 Apr 2026 17:59:43 -0700
Received: from ewa-av-01.mbs.boeing.net (ewa-av-01.mbs.boeing.net
 [137.137.51.75])
 by ewa-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 63E0xV3f057854
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Apr 2026 17:59:31 -0700
Received: from localhost (localhost [127.0.0.1])
 by ewa-av-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_RELAY) with SMTP id
 63E0xU3U053066; Mon, 13 Apr 2026 17:59:30 -0700
Received: from A6424298.boeing.com (a6424298.nos.boeing.com [10.191.242.201])
 by ewa-av-01.mbs.boeing.net (8.15.2/8.15.2/UPSTREAM_RELAY) with
 ESMTP id 63E0xKU3052426; Mon, 13 Apr 2026 17:59:21 -0700
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=boeing-s1912 header.d=boeing.com header.i="@boeing.com" header.h="From:To:Cc:Subject:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1776128383;
	bh=7rRZv4jH4j5UcfT3Vc0EKG1kzDe3IUvMyVRk4LD2oNo=;
	h=From:To:Cc:Subject:Date:From;
	b=jtqnKOmjyUOaNazw0e450E7ofcLvt9OZ3PnfW/LsbbZoKcz64p13tA/3fF42bZUV/
	 8ubsBSByQEZ1TRKfnMMT35FWLJn8IjfptQmlNip5BvItsqmr9rPikPgQ1wPIsY7kgj
	 6LjgLMR5vK/DO7I/KfTwOlxTqKt1BNUTvRnrjjTz7CC2WdWsNVcOHuOlSw0nboF0Mo
	 HBJhOSScUKNGabji1VOpKvaC+YphaoWK1aomRq/7NQGFu7v0+N2KNs+yv+YbIM8avk
	 uDqqXv/G3678tSf2umb4jUaomSV1aV/ZLtwj/Ns/dRokHnQrVFgKFmdnfqdHJNUQfy
	 /G8eCr7ZV//ug==
From: Joan Bae <joan.bae@boeing.com>
To: xen-devel@lists.xenproject.org
Cc: Joan Bae <joan.bae@boeing.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH] xen/common: validate shared memory guest address overlap with guest RAM
Date: Tue, 14 Apr 2026 09:59:18 +0900
Message-ID: <59dcd094173791926fff212f3f2b86df50b0dc12.1776060772.git.joan.bae@boeing.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-purgate-ID: tlsNG-c1860d/1776128387-F4F5A497-0FD6B68A/0/0
X-purgate-type: clean
X-purgate-size: 3546
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[boeing.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[boeing.com:s=boeing-s1912];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:joan.bae@boeing.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[joan.bae@boeing.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[joan.bae@boeing.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[boeing.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,boeing.com:dkim,boeing.com:email,boeing.com:mid]
X-Rspamd-Queue-Id: C79DB3F4B58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently, process_shm() does not check whether the guest physical
address of a shared memory region overlaps with the domain's allocated RAM banks.
Neither process_shm() nor p2m_set_entry() checks for existing
mappings, so the RAM mapping is silently overwritten if a user
specifies a guest physical address that falls within the guest RAM
range. Since construct_domain() loads the kernel after process_shm(),
the kernel can end up in shared memory pages. This can cause:
- Another domain corrupting the kernel via shared memory write
- Silent guest crash with no error message from Xen

Add a check in process_shm() to validate that the shared memory
guest address range does not overlap with any of the domain's
allocated RAM banks.

Signed-off-by: Joan Bae <joan.bae@boeing.com>
---
 xen/common/device-tree/static-shmem.c | 37 +++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/xen/common/device-tree/static-shmem.c b/xen/common/device-tree/static-shmem.c
index 4c4cc1b123..b0ae0304a1 100644
--- a/xen/common/device-tree/static-shmem.c
+++ b/xen/common/device-tree/static-shmem.c
@@ -293,6 +293,31 @@ static bool __init save_map_heap_pages(struct domain *d, struct page_info *pg,
     return false;
 }
 
+static bool __init
+check_shm_guest_paddr_overlap(struct kernel_info *kinfo, paddr_t gbase,
+                                paddr_t size)
+{
+    unsigned int i;
+    const struct membanks *kinfo_mem = kernel_info_get_mem_const(kinfo);
+    paddr_t gend = gbase + size;
+
+    for ( i = 0; i < kinfo_mem->nr_banks; i++ )
+    {
+        paddr_t bankbase = kinfo_mem->bank[i].start;
+        paddr_t bankend = bankbase + kinfo_mem->bank[i].size;
+
+        /* Check if shared memory overlaps with guest RAM */
+        if ( gbase < bankend && bankbase < gend )
+        {
+            printk("Shared memory guest address 0x%"PRIpaddr" - 0x%"PRIpaddr""
+                    " overlaps with guest RAM 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
+                    gbase, gend - 1, bankbase, bankend - 1);
+            return true;
+        }
+    }
+
+    return false;
+}
+
 int __init process_shm(struct domain *d, struct kernel_info *kinfo,
                        const struct dt_device_node *node)
 {
@@ -355,6 +380,12 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
             /* guest phys address is after host phys address */
             gbase = dt_read_paddr(cells + addr_cells, addr_cells);
 
+            if ( check_shm_guest_paddr_overlap(kinfo, gbase, psize) )
+            {
+                printk("%pd: shared memory region overlaps with the guest's RAM range\n", d);
+                return -EINVAL;
+            }
+
             if ( is_domain_direct_mapped(d) && (pbase != gbase) )
             {
                 printk("%pd: physical address 0x%"PRIpaddr" and guest address 0x%"PRIpaddr" are not direct-mapped.\n",
@@ -396,6 +427,12 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
             /* guest phys address is right at the beginning */
             gbase = dt_read_paddr(cells, addr_cells);
 
+            if ( check_shm_guest_paddr_overlap(kinfo, gbase, psize) )
+            {
+                printk("%pd: shared memory region overlaps with the guest's RAM range\n", d);
+                return -EINVAL;
+            }
+
             if ( !alloc_bank )
             {
                 alloc_heap_pages_cb_extra cb_arg = { d, role_str, gbase,
-- 
2.43.0


