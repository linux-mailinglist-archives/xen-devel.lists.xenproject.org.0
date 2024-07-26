Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E5693D645
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 17:39:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765610.1176301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXN2a-0002B4-C1; Fri, 26 Jul 2024 15:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765610.1176301; Fri, 26 Jul 2024 15:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXN2a-000272-83; Fri, 26 Jul 2024 15:39:32 +0000
Received: by outflank-mailman (input) for mailman id 765610;
 Fri, 26 Jul 2024 15:39:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bxzg=O2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sXMvW-00084Z-La
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 15:32:14 +0000
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 388cccde-4b64-11ef-bbff-fd08da9f4363;
 Fri, 26 Jul 2024 17:32:09 +0200 (CEST)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-44fdde0c8dcso4458681cf.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 08:32:09 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44fe812350bsm14403271cf.9.2024.07.26.08.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 08:32:07 -0700 (PDT)
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
X-Inumbo-ID: 388cccde-4b64-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722007928; x=1722612728; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BinizVTi7GOPnEVhKIj7EHarU0kRGEbeujfs570yXU4=;
        b=TYuQCLcln+oAe6OXvifAcjCJ7+RsJ4/Re+h1oCnelvIkpBoXY4jFGy+VPVSBGdFQGs
         PvwBAO77i1pSOYknHCEqI4eRpPN6TpfU8JcL2vLsFlX0bB181TX0rlNZ8ePRzUM9jfSc
         PoSJlx8EcxS/3eiZYPSSUplujenlp12zbLT7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722007928; x=1722612728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BinizVTi7GOPnEVhKIj7EHarU0kRGEbeujfs570yXU4=;
        b=QZb3NezfhxOpso6ImJOKKsG+LpkJSEdafCx5W9i8K3FDQIyBa5aT8OaC1y4xWjTRy4
         dvutwceBZIl8JGSzKZu06O0yPDdPQvybqcgAtREZblBg0A/S02fvgKrcUwi6Fw8nzDm2
         2zMjJcE7d5NJd6IURUoLzX0XT8wEDUW4hUqlnRyhbnLdPYvneAEFK5zbGkpkBLYay5MW
         ZLi+7A8lW4QLM/tW+PBNhu1JkfkDzw3mQ6w65gN+yskdJTXVhmvzhc5toNZG5gkylsN0
         TqSeky9NND4+fEmNEcoh2D0vZCQpUMCdCLXXGcv8n1B8xqawAE93UPVFkJM4mO+3z9Jh
         cquA==
X-Gm-Message-State: AOJu0YzPAP7gwycglyQGUgVDn8X1B7fMelDdL5vCDhThTo+vdvs4eWDF
	dJ7M/r8QXA/vVRfQqRTfHzG6BAtX24yVvau3p3egetod+f8IaJhjXZzbjREszDAU7u455nnOcPY
	3
X-Google-Smtp-Source: AGHT+IH7HhTgM9wzAwV7qVf5Dw7zzApRYlbHlcznF51xEGNl5V19OCzC2QVC77wObVn2OfyDnPT0Ug==
X-Received: by 2002:a05:622a:547:b0:44f:f7be:4d3e with SMTP id d75a77b69052e-45004d6fd41mr2330571cf.5.1722007927942;
        Fri, 26 Jul 2024 08:32:07 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: alejandro.vallejo@cloud.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 19/22] x86/mm: introduce a per-CPU fixmap area
Date: Fri, 26 Jul 2024 17:22:03 +0200
Message-ID: <20240726152206.28411-20-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726152206.28411-1-roger.pau@citrix.com>
References: <20240726152206.28411-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce the logic to manage a per-CPU fixmap area.  This includes adding a
new set of headers that are capable of creating mappings in the per-CPU
page-table regions by making use of the map_pages_to_xen_cpu().

This per-CPU fixmap area is currently set to use one L3 slot: 1GiB of linear
address space.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/fixmap.h | 44 +++++++++++++++++++++++++++++++
 xen/arch/x86/mm.c                 | 16 ++++++++++-
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/fixmap.h b/xen/arch/x86/include/asm/fixmap.h
index 516ec3fa6c95..a456c65072d8 100644
--- a/xen/arch/x86/include/asm/fixmap.h
+++ b/xen/arch/x86/include/asm/fixmap.h
@@ -118,6 +118,50 @@ extern void __set_fixmap_x(
 #define __fix_x_to_virt(x) (FIXADDR_X_TOP - ((x) << PAGE_SHIFT))
 #define fix_x_to_virt(x)   ((void *)__fix_x_to_virt(x))
 
+/* per-CPU fixmap area. */
+enum percpu_fixed_addresses {
+    __end_of_percpu_fixed_addresses
+};
+
+#define PERCPU_FIXADDR_SIZE (__end_of_percpu_fixed_addresses << PAGE_SHIFT)
+#define PERCPU_FIXADDR PERCPU_VIRT_SLOT(0)
+
+static inline void *percpu_fix_to_virt(enum percpu_fixed_addresses idx)
+{
+    BUG_ON(idx >=__end_of_percpu_fixed_addresses);
+    return (void *)PERCPU_FIXADDR + (idx << PAGE_SHIFT);
+}
+
+static inline void percpu_set_fixmap_remote(
+    unsigned int cpu, enum percpu_fixed_addresses idx, mfn_t mfn,
+    unsigned long flags)
+{
+    map_pages_to_xen_cpu((unsigned long)percpu_fix_to_virt(idx), mfn, 1, flags,
+                         cpu);
+}
+
+static inline void percpu_clear_fixmap_remote(
+    unsigned int cpu, enum percpu_fixed_addresses idx)
+{
+    /*
+     * Use map_pages_to_xen_cpu() instead of destroy_xen_mappings_cpu() to
+     * avoid tearing down the intermediate page-tables if empty.
+     */
+    map_pages_to_xen_cpu((unsigned long)percpu_fix_to_virt(idx), INVALID_MFN, 1,
+                         0, cpu);
+}
+
+static inline void percpu_set_fixmap(enum percpu_fixed_addresses idx, mfn_t mfn,
+                                     unsigned long flags)
+{
+    percpu_set_fixmap_remote(smp_processor_id(), idx, mfn, flags);
+}
+
+static inline void percpu_clear_fixmap(enum percpu_fixed_addresses idx)
+{
+    percpu_clear_fixmap_remote(smp_processor_id(), idx);
+}
+
 #endif /* __ASSEMBLY__ */
 
 #endif
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index faf2d42745d1..937089d203cc 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6467,7 +6467,17 @@ int allocate_perdomain_local_l3(unsigned int cpu)
 
     per_cpu(local_l3, cpu) = l3;
 
-    return 0;
+    /*
+     * Pre-allocate the page-table structures for the per-cpu fixmap.  Some of
+     * the per-cpu fixmap calls might happen in contexts where memory
+     * allocation is not possible.
+     *
+     * Only one L3 slot is currently reserved for the per-CPU fixmap.
+     */
+    BUILD_BUG_ON(PERCPU_FIXADDR_SIZE > (1 << L3_PAGETABLE_SHIFT));
+    return map_pages_to_xen_cpu(PERCPU_VIRT_START, INVALID_MFN,
+                                PFN_DOWN(PERCPU_FIXADDR_SIZE), MAP_SMALL_PAGES,
+                                cpu);
 }
 
 void free_perdomain_local_l3(unsigned int cpu)
@@ -6478,6 +6488,10 @@ void free_perdomain_local_l3(unsigned int cpu)
         return;
 
     per_cpu(local_l3, cpu) = NULL;
+
+    destroy_xen_mappings_cpu(PERCPU_VIRT_START,
+                             PERCPU_VIRT_START + PERCPU_FIXADDR_SIZE, cpu);
+
     free_xenheap_page(l3);
 }
 
-- 
2.45.2


