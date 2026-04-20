Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UImvHG035mkmtgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:25:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6537D42D059
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:25:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286087.1567216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpZD-0004hG-DR; Mon, 20 Apr 2026 14:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286087.1567216; Mon, 20 Apr 2026 14:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpZD-0004fB-8a; Mon, 20 Apr 2026 14:25:39 +0000
Received: by outflank-mailman (input) for mailman id 1286087;
 Mon, 20 Apr 2026 14:25:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca.fancellu@arm.com>) id 1wEpZB-0004QW-9t
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 14:25:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEpZA-00DjKj-Mp
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 16:25:36 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69e6375d-bab6-0a2a0a5309dd-0a2a45039354-10
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:25:36 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69e6375f-672d-0a2a45030019-d98c6eac8c36-1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:25:36 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2A321516;
 Mon, 20 Apr 2026 07:25:29 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 373183F7B4;
 Mon, 20 Apr 2026 07:25:34 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="From:To:Cc:Subject:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776695135; bh=iv//vNmwKiPVjQpsnbCcSAu2c4KT7uRXnN6HNwH7kRM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C60P+blvO8zZ4OFaL3RS+PmAMBSRQ+8U/4URgbc7Ivw8aJfCG320v+cCN1h5wellN
	 WH7EO3gbwuZ+/QAQRjQHbjkbxWgtfOdVToEJ5q+WlVQ09epfIhQTsnDiIT/hA9rTqi
	 lS7LsTqjA7xVIZfOOQtxPtfidMEcipMIaXbeHYUE=
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Hari Limaye <hari.limaye@arm.com>
Subject: [PATCH 2/8] xen/arm: Implement p2m_get_entry for MPU systems
Date: Mon, 20 Apr 2026 15:25:18 +0100
Message-Id: <20260420142524.1804073-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420142524.1804073-1-luca.fancellu@arm.com>
References: <20260420142524.1804073-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1776695136-485AB938-8FD3651C/0/0
X-purgate-type: clean
X-purgate-size: 3903
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Penny.Zheng@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:penny.zheng@arm.com,m:wei.chen@arm.com,m:hari.limaye@arm.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[luca.fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,arm.com:dkim,arm.com:mid];
	FROM_NEQ_ENVFROM(0.00)[luca.fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6537D42D059
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Penny Zheng <Penny.Zheng@arm.com>

Implement the function p2m_get_entry for MPU systems, which is
responsible for looking up an entry in the p2m table.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Hari Limaye <hari.limaye@arm.com>
---
 xen/arch/arm/include/asm/mpu/p2m.h |  5 ++
 xen/arch/arm/mpu/p2m.c             | 76 ++++++++++++++++++++++++++++--
 2 files changed, 77 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/mpu/p2m.h b/xen/arch/arm/include/asm/mpu/p2m.h
index b9c7be2d9dcc..d0ec8a77a15a 100644
--- a/xen/arch/arm/include/asm/mpu/p2m.h
+++ b/xen/arch/arm/include/asm/mpu/p2m.h
@@ -31,6 +31,11 @@ static inline p2m_type_t region_get_p2m(pr_t *pr)
     return pr->p2m_type;
 }
 
+static inline bool region_is_p2m_valid(pr_t *pr)
+{
+    return (pr->p2m_type != p2m_invalid);
+}
+
 #endif /* __ARM_MPU_P2M_H__ */
 
 /*
diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
index 4a8595b1b25e..681717eacf37 100644
--- a/xen/arch/arm/mpu/p2m.c
+++ b/xen/arch/arm/mpu/p2m.c
@@ -135,11 +135,79 @@ int p2m_set_entry(struct p2m_domain *p2m, gfn_t sgfn, unsigned long nr,
     return __p2m_set_entry(p2m, sgfn, nr, smfn, t, a);
 }
 
-mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn, p2m_type_t *t,
-                    p2m_access_t *a, unsigned int *page_order, bool *valid)
+/*
+ * Get the details of guest MPU memory region [gfn, gfn + nr_gfns).
+ *
+ * If the region is mapped, `t` is set to the p2m_type of the region and the
+ * starting MFN is returned.
+ * If the region is not mapped, INVALID_MFN is returned.
+ */
+static mfn_t p2m_get_mpu_region(struct p2m_domain *p2m, gfn_t gfn,
+                                unsigned long nr_gfns, p2m_type_t *type,
+                                bool *valid)
 {
-    BUG_ON("unimplemented");
-    return INVALID_MFN;
+    pr_t *table = NULL;
+    pr_t *region = NULL;
+    uint8_t idx = INVALID_REGION_IDX;
+    gfn_t egfn = gfn_add(gfn, nr_gfns);
+    p2m_type_t optional_type = p2m_invalid;
+    bool optional_valid = false;
+    mfn_t ret = INVALID_MFN;
+
+    ASSERT(p2m_is_locked(p2m));
+
+    /*
+     * Check if the ending gfn is higher than the highest the p2m map
+     * currently holds, or the starting gfn lower than the lowest it holds.
+     */
+    if ( (gfn_x(egfn) > gfn_x(p2m->max_mapped_gfn)) ||
+         (gfn_x(gfn) < gfn_x(p2m->lowest_mapped_gfn)) )
+        goto out;
+
+    table = (pr_t *)page_to_virt(p2m->root);
+    /* The table should always be non-NULL and is always present. */
+    if ( !table )
+        ASSERT_UNREACHABLE();
+
+    if ( is_gfns_mapped(table, p2m->nr_regions, gfn, nr_gfns, &idx) )
+        goto out;
+
+    region = &table[idx];
+    if ( region_is_p2m_valid(region) )
+    {
+        optional_type = region_get_p2m(region);
+        optional_valid = region_is_valid(region);
+    }
+
+    /* Always GFN == MFN on MPU systems. */
+    ret = _mfn(gfn_x(gfn));
+
+out:
+    if ( type )
+        *type = optional_type;
+
+    if ( valid )
+        *valid = optional_valid;
+
+    return ret;
+}
+
+/*
+ * Get the details of a given gfn.
+ *
+ * If the entry is present, the associated MFN will be returned and the
+ * p2m type gets filled up.
+ * If the entry is not present, INVALID_MFN will be returned
+ *
+ * The page_order is meaningless in MPU system, and we keep it here
+ * to be compatible with MMU system.
+ */
+mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
+                    p2m_type_t *t, p2m_access_t *a,
+                    unsigned int *page_order,
+                    bool *valid)
+{
+    return p2m_get_mpu_region(p2m, gfn, 1, t, valid);
 }
 
 void p2m_dump_info(struct domain *d)
-- 
2.34.1


