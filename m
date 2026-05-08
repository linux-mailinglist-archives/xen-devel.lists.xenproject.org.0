Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMV2NKv2/WlklQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:43:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 852FC4F7F6B
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:43:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303734.1576995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQZ-0004uK-8F; Fri, 08 May 2026 14:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303734.1576995; Fri, 08 May 2026 14:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQZ-0004rs-4x; Fri, 08 May 2026 14:43:43 +0000
Received: by outflank-mailman (input) for mailman id 1303734;
 Fri, 08 May 2026 14:43:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLMQX-0004eg-9J
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:43:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMQV-00Epe9-4T
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:43:40 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf689-5cb7-0a2a0a5109dd-0a2a4506c6fc-18
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:40 +0200
Received: from [209.85.218.44] (helo=mail-ej1-f44.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf69c-7371-0a2a45060019-d155da2cd14e-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:40 +0200
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-bc3582acc23so315797566b.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:43:40 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac4942068sm90736166b.62.2026.05.08.07.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 07:43:39 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778251420; x=1778856220; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ZMmWO9/I/8K7VzRErw7HfQg64F77t5aimUcSK3Fxfo=;
        b=HZKLF3BNlv20nh4wH4h5ebWGekK9N6CDpnAgQwEjuVcblZO4ArcEo2iOEdxPjcNRVg
         R9gvRziEApB1ACoeU88ihhWZ3FTQU6e7+g2+IiL2SDeJrEgPXFmi1JNzskfSkW7D1sw4
         0IBUgIqQ8tI5xb4jGXK8J3ihtmUcm+tnaZ2VC5g4TG2Mg4EFXoU3AYDffYu6k45+q80B
         dnFYcIqun42aMS+sCSmyjooILqzyFvQTckLh0gc/jUwv8iCjS8eGd+koTx/M79i0gEmB
         GcAxW3/BzhzPIKsRmMu+93hVMz6fpJC/j7USAXRXSxD+RqsY3oybJpKOX9VKHsojvmz+
         v2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251420; x=1778856220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3ZMmWO9/I/8K7VzRErw7HfQg64F77t5aimUcSK3Fxfo=;
        b=pCyk3JUsu0oEhgJMXDDQ70CGjF8lqQqYfQulg0/ziDE11pyYT+mDZ3etdWtuoRy0zP
         3cOEYllIqgIV9t8J+3ZvP9MTi0TtFNqOpQNiOn/hpKtvGGlOp7iK7r+mWguJxsQRsRg7
         OXoyvRHD9rSSRYc3ao9EkIHSP34oX4LEIiPHj23Pg/ne7CbY0oPHzZSYX0Fp4ZfRjlIU
         99DUrz5MOHgwT6pyq+ksGA3CPs8/VvwPthN/zhjChC/1bHWeBDJYNIwaosYDeeIauFPz
         gbHQH7/IF8Osqs5YE5lm2HVfA7ziZM9pkQY0bnv2cE+WenVq6ehVbckoTCB3bzmH7/Im
         raMg==
X-Gm-Message-State: AOJu0YyAyPBrVNf/PHKdiQykfqDLLg0eH8GGskGdxk0oNwvw/eqV2LBO
	VWRw+0vIOlgI7ixPpWGV6kpa5qeppBbaSyqGDz4vwVIRBPRYkYEefvD7ovZm2w==
X-Gm-Gg: AeBDievOS0+sPHqhOheukB8+FnfG9s3gXNhTBaA1VGjpe3jazAUGEtCTLIVpird8I//
	0kxfeuKzI7xA6iWiyFQKzCTVNUXjg9XGaxGR3pBQQc+ldGSTjn8zecz7127x9RUvIfmOCT2YtCG
	K0zPO97+SDhdsMnCaV7nrDHcvMB8sZVueTcZTnLoAGgmioU6i/m4eYYwN7+Zb/Wn2/kGww/B8NJ
	C0qg2jQvkUantVsU62gTqHGDL1VvTCcDar19FlwB6zUmW9Zh2axxz2SUIEKV5DRYNeo9O/EmH/c
	gTu8K5M+W3FiNsbW7cvDMTF2DvN9cP52bpxvENadoUOZ7aEqUzHkQx90+OSjG9V4WkhcMEKg4hO
	I3Cuso5xj12xSHvEIemjpGktZif5rdpV6eL/5xn32Z3SzOshPPyKMFcQ3kS3tWZXAMrfQY/qObg
	8RJ2wE/lqfcZpefjHCfGmxq68cpFzFsgk4ZoEojHx8NQ02lUQoiNEhLmxCmUvrj2At8Q==
X-Received: by 2002:a17:906:fd87:b0:bad:f5dd:6740 with SMTP id a640c23a62f3a-bc56aa411e4mr728446366b.3.1778251419579;
        Fri, 08 May 2026 07:43:39 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 01/26] xen: arm: update p2m_set_allocation() prototype
Date: Fri,  8 May 2026 16:43:03 +0200
Message-ID: <d0188bacab958c47a7c0ae2a570e2ca1048812c6.1778250616.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778250616.git.oleksii.kurochko@gmail.com>
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1778251420-86168D75-213873DA/10/73395122804
X-purgate-type: spam
X-purgate-size: 7869
X-Rspamd-Queue-Id: 852FC4F7F6B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com,wdc.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

p2m_set_allocation() signals preemption redundantly: via a bool *preempted
out-argument (set to true) and via -ERESTART return code, both at the same
time. This led to the caller-side ASSERT(preempted == (rc == -ERESTART))
added solely to document their agreement.

Drop the out-argument entirely. The return code alone is sufficient to
distinguish preemption (-ERESTART) from success (0) or other failures.
Replace the pointer with a plain bool can_preempt that controls whether
the preemption check is performed at all, making the previous
NULL-to-suppress-preemption calling convention explicit and type-safe.

Since p2m_set_allocation() is called by the common dom0less build code,
move its declaration from the ARM-specific asm/p2m.h to xen/p2m-common.h.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - new patch
---
 xen/arch/arm/include/asm/p2m.h          |  1 -
 xen/arch/arm/mmu/p2m.c                  | 22 ++++++++--------------
 xen/arch/riscv/include/asm/paging.h     |  2 +-
 xen/arch/riscv/p2m.c                    |  7 ++++---
 xen/arch/riscv/paging.c                 |  7 ++-----
 xen/common/device-tree/dom0less-build.c |  2 +-
 xen/include/xen/p2m-common.h            |  2 ++
 7 files changed, 18 insertions(+), 25 deletions(-)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 7957dbd96e57..62b37a05f79e 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -232,7 +232,6 @@ void p2m_restore_state(struct vcpu *n);
 /* Print debugging/statistial info about a domain's p2m */
 void p2m_dump_info(struct domain *d);
 
-int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted);
 int p2m_teardown_allocation(struct domain *d);
 
 static inline void p2m_write_lock(struct p2m_domain *p2m)
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 51abf3504fcf..e5c6be7c0890 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -67,10 +67,11 @@ int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
 
 /*
  * Set the pool of pages to the required number of pages.
- * Returns 0 for success, non-zero for failure.
+ * Returns 0 for success, -ERESTART if preempted, or a negative error code on
+ * failure.
  * Call with d->arch.paging.lock held.
  */
-int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
+int p2m_set_allocation(struct domain *d, unsigned long pages, bool can_preempt)
 {
     struct page_info *pg;
 
@@ -112,11 +113,8 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
             break;
 
         /* Check to see if we need to yield and try again */
-        if ( preempted && general_preempt_check() )
-        {
-            *preempted = true;
+        if ( can_preempt && general_preempt_check() )
             return -ERESTART;
-        }
     }
 
     return 0;
@@ -125,7 +123,6 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
 int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
 {
     unsigned long pages = size >> PAGE_SHIFT;
-    bool preempted = false;
     int rc;
 
     if ( (size & ~PAGE_MASK) ||          /* Non page-sized request? */
@@ -133,27 +130,24 @@ int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
         return -EINVAL;
 
     spin_lock(&d->arch.paging.lock);
-    rc = p2m_set_allocation(d, pages, &preempted);
+    rc = p2m_set_allocation(d, pages, true);
     spin_unlock(&d->arch.paging.lock);
 
-    ASSERT(preempted == (rc == -ERESTART));
-
     return rc;
 }
 
 int p2m_teardown_allocation(struct domain *d)
 {
     int ret = 0;
-    bool preempted = false;
 
     spin_lock(&d->arch.paging.lock);
     if ( d->arch.paging.p2m_total_pages != 0 )
     {
-        ret = p2m_set_allocation(d, 0, &preempted);
-        if ( preempted )
+        ret = p2m_set_allocation(d, 0, true);
+        if ( ret == -ERESTART )
         {
             spin_unlock(&d->arch.paging.lock);
-            return -ERESTART;
+            return ret;
         }
         ASSERT(d->arch.paging.p2m_total_pages == 0);
     }
diff --git a/xen/arch/riscv/include/asm/paging.h b/xen/arch/riscv/include/asm/paging.h
index e487c89a4ccd..103384723dc5 100644
--- a/xen/arch/riscv/include/asm/paging.h
+++ b/xen/arch/riscv/include/asm/paging.h
@@ -9,7 +9,7 @@ struct page_info;
 int paging_domain_init(struct domain *d);
 
 int paging_freelist_adjust(struct domain *d, unsigned long pages,
-                           bool *preempted);
+                           bool can_preempt);
 
 int paging_ret_to_domheap(struct domain *d, unsigned int nr_pages);
 int paging_refill_from_domheap(struct domain *d, unsigned int nr_pages);
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 703b9f4d2540..41d6d3d5e699 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -430,15 +430,16 @@ int p2m_init(struct domain *d, const struct xen_domctl_createdomain *config)
 
 /*
  * Set the pool of pages to the required number of pages.
- * Returns 0 for success, non-zero for failure.
+ * Returns 0 for success, -ERESTART if preempted, or a negative error code on
+ * failure.
  * Call with d->arch.paging.lock held.
  */
-int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
+int p2m_set_allocation(struct domain *d, unsigned long pages, bool can_preempt)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     int rc;
 
-    if ( (rc = paging_freelist_adjust(d, pages, preempted)) )
+    if ( (rc = paging_freelist_adjust(d, pages, can_preempt)) )
         return rc;
 
     /*
diff --git a/xen/arch/riscv/paging.c b/xen/arch/riscv/paging.c
index 76a203edbb0c..35f572689a7c 100644
--- a/xen/arch/riscv/paging.c
+++ b/xen/arch/riscv/paging.c
@@ -47,7 +47,7 @@ static int _paging_add_to_freelist(struct domain *d)
 }
 
 int paging_freelist_adjust(struct domain *d, unsigned long pages,
-                           bool *preempted)
+                           bool can_preempt)
 {
     ASSERT(spin_is_locked(&d->arch.paging.lock));
 
@@ -66,11 +66,8 @@ int paging_freelist_adjust(struct domain *d, unsigned long pages,
             return rc;
 
         /* Check to see if we need to yield and try again */
-        if ( preempted && general_preempt_check() )
-        {
-            *preempted = true;
+        if ( can_preempt && general_preempt_check() )
             return -ERESTART;
-        }
     }
 
     return 0;
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 6d6882a34b5a..1058699ab25b 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -747,7 +747,7 @@ static int __init domain_p2m_set_allocation(struct domain *d, uint64_t mem,
                 domain_p2m_pages(mem, d->max_vcpus);
 
     spin_lock(&d->arch.paging.lock);
-    rc = p2m_set_allocation(d, p2m_pages, NULL);
+    rc = p2m_set_allocation(d, p2m_pages, false);
     spin_unlock(&d->arch.paging.lock);
 
     return rc;
diff --git a/xen/include/xen/p2m-common.h b/xen/include/xen/p2m-common.h
index f0bd9a6b9896..1b44ec8ce36c 100644
--- a/xen/include/xen/p2m-common.h
+++ b/xen/include/xen/p2m-common.h
@@ -43,5 +43,7 @@ int __must_check check_get_page_from_gfn(struct domain *d, gfn_t gfn,
                                          bool readonly, p2m_type_t *p2mt_p,
                                          struct page_info **page_p);
 
+int p2m_set_allocation(struct domain *d, unsigned long pages,
+                       bool can_preempt);
 
 #endif /* _XEN_P2M_COMMON_H */
-- 
2.54.0


