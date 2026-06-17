Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AjvXJIWCMmq61AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:18:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31160698F23
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:18:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=h2rMI9lN;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1340083.1601094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHW-00010v-2W; Wed, 17 Jun 2026 11:18:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340083.1601094; Wed, 17 Jun 2026 11:18:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHV-0000ug-TR; Wed, 17 Jun 2026 11:18:05 +0000
Received: by outflank-mailman (input) for mailman id 1340083;
 Wed, 17 Jun 2026 11:18:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoHT-0000ej-VX
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:18:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoHT-008nOJ-BM
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:18:03 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328261-5cb7-0a2a0a5109dd-0a2a4504e3c0-26
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:03 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a32826b-1dec-0a2a45040019-d1558033b585-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:03 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-490cf3000f0so56724935e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:18:03 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa3a8efsm151319985e9.2.2026.06.17.04.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 04:18:01 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781695083; x=1782299883; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhf8qyknDygzxflLcvVL5fdOhndbEUmd5SDjF9WBNsg=;
        b=h2rMI9lNtRbIprvC/DFOGZPDLVBYvPyrZOw7ibt8cYOewxGzkYaZJw/7ocScAHQ7DZ
         FFUGbF37KiXc4nvFrniElLVhUOnLcuTS7wHHmA6MpC1nQjkytUxDbxwzQFc2CgNw+42I
         xWtcnJ+tbYVIcYLfI3eVbbGnH39MsBDCP5deDTZTJ0iEpBD+pt90fsXa7EZ6rwuoYNLO
         A4pJeWIPF4zW0itewdnEXRRI4v0L8h+X2izpj+vbbVTx01wP4h83T60Mdm2d4+OYt7qj
         KSxQhBt23U9MsW46/sR6hF1bateGbA6N08IZrlAA2XiQ0e+YOCP0dmA0VIriVEqdCU2M
         zzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695083; x=1782299883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jhf8qyknDygzxflLcvVL5fdOhndbEUmd5SDjF9WBNsg=;
        b=am6eXiT5jGUFm97pKoD6KTMdtPWCo8R27ua24BNietwNcC2iN+350eUiPgwgoCmUyp
         Xgxay64sVX7jrwwKyKNDgeDWXZSoooXZ6ZlNiX+C4zrUDosikRfrLKcefFRJM38ebL4i
         uvGOu49oe6IM0/BdNzz2embXgiRZykLxLTjWAFcigGD12WOdWpUfN3IvX5qa+uqLfHfv
         CR10d6E6GdKJl293i8/5nKt6u8xwY+Adj7jcUZjAcQ97/QUMud2+Ogb8OKpXuhnNrsSN
         DHEeOHZyuyHt7EcNUqWgTBJNI1TAmv1Dd7H+QuXkKRrLAP0V2dn5A+6Qo3gGllcsuiZg
         9cjw==
X-Gm-Message-State: AOJu0YwcEvOrt7QimmJRVYO/ldO3+1tCkOt2ybmj0hEkfJix17+sGYv/
	29ymcbmwwyobx3aCaYMj5bIx1BtnJlke6W5/ShZ7kX7yjs7sRIOSwZ3Xckf/dw==
X-Gm-Gg: Acq92OHAdjvzswYBZwiQ7J7N46SNyAlfT+i4v8ZoccMeeO6iHkaSc3d7zpuNedVlswq
	BgTh5+a+gouKsbRb5rUW3GYTT4kNHOnHDgqglqYjKpH4CRfPyANY46RvzTwcGHOnsBYU1LOFK4Q
	4qL2xJTVoauBKWdxjPamjA+IAw8b9fArUewT5RUW2tyHItA+fwWxojDLMM1rfOtpUfhi+AF6QI4
	LHRSA4+P7YoK3wt1sKd8GHtAnGM22aPWq+ujHkTkj282ANUgkdRQaPdJsxyiLYiwbtpEQviFC2C
	VcZpjOcjdOvu9a8M96RpKbvfb2X0rtt03e5jUzgpH+7IlO2mgB4r+c0nVoWcATaex+o0Vt7YY6V
	vQhH4SL2w2M3bJYCQS5hoos/Oxwv6b6JwWy+cOosHoARUl57jAhWPaohp5FC0GWKPE8xYWiXiUs
	hv1P10l+nY9j0sMOjIYwI6J6OfMODptqJeRCI/lQwksmykpRl0f9MABDLvSQ==
X-Received: by 2002:a05:600c:1389:b0:490:d3ef:fa4a with SMTP id 5b1f17b1804b1-49234105541mr41396255e9.14.1781695081844;
        Wed, 17 Jun 2026 04:18:01 -0700 (PDT)
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
Subject: [PATCH v3 02/23] xen: arm: update p2m_set_allocation() prototype
Date: Wed, 17 Jun 2026 13:17:30 +0200
Message-ID: <a63794ac32e157ea44c3450fc5fb6f2842e00680.1781693963.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1781693963.git.oleksii.kurochko@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1781695083-4237F3FF-CA185C7A/10/73395122804
X-purgate-type: spam
X-purgate-size: 7929
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com,wdc.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 31160698F23

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
Changes in v3:
 - Nothing changed. Only rebase.
---
Changes in v2:
 - new patch
---
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
index 4a4913716bdd..737da60dcf58 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -238,7 +238,6 @@ void p2m_restore_state(struct vcpu *n);
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
index eacfd93087ae..c3818ffed45f 100644
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


