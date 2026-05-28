Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLabGEKMF2o5IwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 02:28:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E0F5EB3C2
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 02:28:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320867.1588006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSObi-0008Bo-9T; Thu, 28 May 2026 00:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320867.1588006; Thu, 28 May 2026 00:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSObi-0008A6-5j; Thu, 28 May 2026 00:28:18 +0000
Received: by outflank-mailman (input) for mailman id 1320867;
 Thu, 28 May 2026 00:28:16 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wSObg-0007lo-3E
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 00:28:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSObe-006N05-BN
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 02:28:14 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a178bc5-e002-0a2a0a5209dd-0a2a4508c6ae-38
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 02:28:14 +0200
Received: from [209.85.208.42] (helo=mail-ed1-f42.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a178c1e-63b5-0a2a45080019-d155d02ab409-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 02:28:14 +0200
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-68aad378a26so928249a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 17:28:14 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.25.69]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bddc5ece286sm655205266b.40.2026.05.27.17.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 17:28:13 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779928094; x=1780532894; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPfJ90vz5LA/T++PBxy4wc5LMm+G5DLn0jpA+XJFuNE=;
        b=BXD4QNGsvIDsUXTrirQe9itgDHx3UchKuz7kh5pCGLXeN+YKcTho3L72dPg+VLFTzu
         A9X0jzfHWOQP2QLnPKT62qb/kxXs/vsvF44WhGE1M/Ad4y4vt3Ym95NsHXhZhza65ngQ
         mynaFabY+teMH8tOddVhPfHZ2OahGTothJLVaiWO6vLaOTrrML56kobXJLL3hBBPnqRk
         MCdV6hQs3TqJIuazdF+yGRsnurJ1KW1N6ZcIn+mEW+vcxDAdV15Rk3li3ETvwLp7pibG
         sOy7kmD8kh0azeZKDMRel5WO4yjKVq+j+be/lJ+2sRh7aE0CSgVaomCHI/Oua+yRGoIH
         5aLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779928094; x=1780532894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bPfJ90vz5LA/T++PBxy4wc5LMm+G5DLn0jpA+XJFuNE=;
        b=PQKnwF+CLO8wDTohClNDGRyEhmQ3g/XrS86aQrpVUloLi2SsIQ8cJIuLdvJkhE5G9D
         MDo2m7qXsFFd23ntkbsv5F/DOsFaHzlflh+Pw42p/GQ+S5yay1pE7rMOg1nTD/DGUFug
         Qdoroq5qZK1NheG6aZE6mAck/jBmveuwm4qvr/NCIRGJUWOAsJeXDDh3ClO1ii4TmaZp
         NdWIpGVAnwHsXc3FmGJkTRLYTkK1jj9wGDO0wSp8nM4YgM8mhvLNLiNe2dJ3Lz77DPCd
         vT5/uABpTrmDNMjlu3yaq3AWjbycCvXzgf+BfDrblIsw7/kqRi+r6Ssb6vBk4W8fpqc+
         mG6Q==
X-Gm-Message-State: AOJu0Yyk0R2g6OGvQ5/jYRikrVWlwPHsvfTdlky3XIC9G/FPI5J6NWnH
	nRVsXOQFsudmF3Qe0+KIVyMXAQvS/lQCrBzimVn/gX7C9q+HzkRsplH4e3rk/g==
X-Gm-Gg: Acq92OGHgy3kHozN49LBSs1sWjgg0EGlaMyUqKWLDge2ARVkQY4ZsJAmIluaY4zn5RI
	S7ryjI7V5tjr0i1JrhlGC8iyOGNHVLRf6thtbRRVsirURGgvb5nFh9WM+9pqNmAkshM2e5qWqsB
	dXBpl9cnpMlkjnxsCQHAJMgnn2vgpWNzjx/l3qGR+sXBdAY0p4fPXmM6BLOqz2NczlfIqAN7Uq6
	hoLxosWrm/ujqdHIVHVTH5bpmgLnAIPwUBNQnzj1QVxBjnfyKTXofh/yozsdsQBRVlAkngMXThc
	lA0Q1YzxoOeRhp5v95Rahym/uEyoO6vF7aqE1MEJTOBMkfJroOdzla8PqcFSWMrO9gpbEcvdrKa
	egipMO94GahEczt59W0LaKC4cZqrOYqVTB8Q7B5QUe2cZCpNq72mDJ8JJKSmVIP6S91Qnv53EKu
	yyV+NAt9Ov/eXhn4eYRkt8iBSk80iE7M7DfGnM
X-Received: by 2002:a17:907:b5a9:b0:bd5:7a3:a58b with SMTP id a640c23a62f3a-bdd269b6a00mr1129029066b.46.1779928093812;
        Wed, 27 May 2026 17:28:13 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 4/4] xen/arm: its: handle dma-noncoherent on GIC and ITS nodes
Date: Thu, 28 May 2026 03:25:52 +0300
Message-ID: <43b0e8f6b25588ba1cfc22d367e5ed6b303a4978.1779922874.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779922874.git.mykola_kvach@epam.com>
References: <cover.1779922874.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1779928094-BFD7BDB1-690D32EC/0/0
X-purgate-type: clean
X-purgate-size: 5082
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:luca.fancellu@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:mid,epam.com:email];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 16E0F5EB3C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

The DT dma-noncoherent property describes the bus coherency of the device
represented by the node. On an ITS subnode, that is memory accessed by that
ITS, so add GICV3_QUIRK_MEM_NC_NS to the corresponding host_its before
programming GITS tables and allocating ITTs.

When the property is present on the top-level GIC node, it describes the
Redistributor side of the LPI path. Collect it in
gicv3_lpi_init_host_lpis() and apply it only to the host LPI policy used
for GICR_PROPBASER and GICR_PENDBASER setup.

Do not inherit the property between parent and child nodes: ITS-node
non-coherency does not change the global host LPI policy, and GIC-node
non-coherency does not change per-ITS quirk_flags.

ACPI is left unchanged; this patch only consumes the DT dma-noncoherent
property.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v2:
- Split v1's dma-noncoherent handling into explicit ITS-node and GIC-node
  scopes.
- Apply an ITS subnode property only to the matching host_its quirk_flags.
- Collect the top-level GIC property from gic-v3-lpi.c before host LPI
  allocations use host_lpi_flags.
---
 xen/arch/arm/gic-v3-its.c | 21 +++++++++++++++++++--
 xen/arch/arm/gic-v3-lpi.c | 22 +++++++++++++++++++++-
 2 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index e055914763..606b127487 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -134,6 +134,21 @@ static const struct its_quirk *__init gicv3_its_find_quirk(
     return NULL;
 }
 
+static void __init gicv3_its_collect_fw_attrs(struct host_its *hw_its)
+{
+    /*
+     * An ITS subnode property describes memory transactions made by that ITS.
+     * Do not inherit it into the global host LPI/Redistributor policy.
+     */
+    if ( !hw_its->dt_node ||
+         !dt_property_read_bool(hw_its->dt_node, "dma-noncoherent") )
+        return;
+
+    hw_its->quirk_flags |= GICV3_QUIRK_MEM_NC_NS;
+    printk("GICv3: ITS @%#"PRIpaddr" marked dma-noncoherent\n",
+           hw_its->addr);
+}
+
 static void __init gicv3_its_collect_quirks(struct host_its *hw_its)
 {
     const struct its_quirk *quirk = gicv3_its_find_quirk(hw_its);
@@ -144,6 +159,8 @@ static void __init gicv3_its_collect_quirks(struct host_its *hw_its)
         gicv3_lpi_update_host_flags(quirk->lpi_flags);
         printk("GICv3: enabling workaround for ITS: %s\n", quirk->desc);
     }
+
+    gicv3_its_collect_fw_attrs(hw_its);
 }
 
 uint64_t gicv3_mem_get_cacheability(uint32_t flags)
@@ -578,7 +595,7 @@ static int gicv3_disable_its(struct host_its *hw_its)
     return -ETIMEDOUT;
 }
 
-static int gicv3_its_init_single_its(struct host_its *hw_its)
+static int __init gicv3_its_init_single_its(struct host_its *hw_its)
 {
     uint64_t reg;
     int i, ret;
@@ -1221,7 +1238,7 @@ static void gicv3_its_acpi_init(void)
 
 #endif
 
-int gicv3_its_init(void)
+int __init gicv3_its_init(void)
 {
     struct host_its *hw_its;
     int ret;
diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index 35f93e4756..c6f17b9b2d 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -7,7 +7,9 @@
  * Copyright (C) 2016,2017 - ARM Ltd
  */
 
+#include <xen/acpi.h>
 #include <xen/cpu.h>
+#include <xen/device_tree.h>
 #include <xen/lib.h>
 #include <xen/mm.h>
 #include <xen/param.h>
@@ -101,6 +103,20 @@ void __init gicv3_lpi_update_host_flags(uint32_t flags)
     host_lpi_flags |= flags;
 }
 
+static void __init gicv3_lpi_collect_fw_attrs(void)
+{
+    /*
+     * A top-level GIC node property describes the Redistributor side of the
+     * LPI path. Do not inherit it into per-ITS policy.
+     */
+    if ( !acpi_disabled ||
+         !dt_property_read_bool(dt_interrupt_controller, "dma-noncoherent") )
+        return;
+
+    gicv3_lpi_update_host_flags(GICV3_QUIRK_MEM_NC_NS);
+    printk("GICv3: GIC node marked dma-noncoherent for host LPI tables\n");
+}
+
 static union host_lpi *gic_get_host_lpi(uint32_t plpi)
 {
     union host_lpi *block;
@@ -442,7 +458,7 @@ integer_param("max_lpi_bits", max_lpi_bits);
  * to the page with the actual "union host_lpi" entries. Our LPI limit
  * avoids excessive memory usage.
  */
-int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
+int __init gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
 {
     unsigned int nr_lpi_ptrs;
     int rc;
@@ -450,6 +466,10 @@ int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
     /* We rely on the data structure being atomically accessible. */
     BUILD_BUG_ON(sizeof(union host_lpi) > sizeof(unsigned long));
 
+    gicv3_lpi_collect_fw_attrs();
+    if ( host_lpi_flags )
+        printk("GICv3: host LPI workaround flags: %#x\n", host_lpi_flags);
+
     /*
      * An implementation needs to support at least 14 bits of LPI IDs.
      * Tell the user about it, the actual number is reported below.
-- 
2.43.0


