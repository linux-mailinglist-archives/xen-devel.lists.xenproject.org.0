Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 44MFHQifPmoMJQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2076A6CEA1B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XRP+jsKK;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1346270.1604726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lV-0000Ld-2P; Fri, 26 Jun 2026 15:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346270.1604726; Fri, 26 Jun 2026 15:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lU-0000Gl-UW; Fri, 26 Jun 2026 15:46:48 +0000
Received: by outflank-mailman (input) for mailman id 1346270;
 Fri, 26 Jun 2026 15:46:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd8lU-0000EB-2N
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 15:46:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd8lT-004aNQ-FP
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 17:46:47 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9edc-bab6-0a2a0a5309dd-0a2a4501e980-18
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:47 +0200
Received: from [209.85.167.48] (helo=mail-lf1-f48.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ee7-400f-0a2a45010019-d155a730a4e8-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:47 +0200
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5aea1f4dc7fso1077104e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:46:47 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9cd5b232sm2612888e87.29.2026.06.26.08.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 08:46:45 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782488807; x=1783093607; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TtdpsKQe2Ojlx7r4TwViI4rHIRjvzW7vDmBaVjvSro=;
        b=XRP+jsKKJG4haAX2XYx/jWM6JWcKGpAyNq3R6TiQZneGqTuXvpwHrFb/Tunz7XsK0s
         feDjWJQSxHQT3ZPZI2l/y63+qZ4NA+Vp2xDQe5OY+5LMelUCLn6gAXLYa5k+Mu8ChBUe
         HTJJdRPcfvA2VEVi+y7HKWjHMpo6KLm/lBao8Ni/aXNU4dO/NWI10U9BZQbsMzQRcXHf
         UBGDU2T7Zr1dB93ZhUlO+uNDEnm6OqBNzzC6zSI2/m+Ei45Uh8YrkkyUVm/ZyDbJy/PE
         ngSp0qxoygjgF+/nsuy5S6ZAbR+GYrQ9cfdbp8pR5DCoUR9VfGjQ45eQpuf46hQmlxSm
         r9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488807; x=1783093607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4TtdpsKQe2Ojlx7r4TwViI4rHIRjvzW7vDmBaVjvSro=;
        b=hQ2N7PT3kIOlo5sDRdXfptz4SMU+k8wCN72V7Hpiwz8/G7RHs6598lr6zNRdKpJLHS
         x1KDLXRFPlhN6VOPL+lrctoGyVxI5RYvYBsB1iZeuSLpUV3gxjZ2OiTWv1sbkt9piTOA
         zZ/utLcaNaXbPw3ZHEpgz+wAxok0CXm1sS8P0clPmmIKKKd+6acqZSYH8OkM4c/V5EtP
         YM51lLH9fCzHuR2ipeDwLWvpELCLB+ICrpdSZxoJSOrkfZDeyft2j9kQdTXv0G/2ZNeK
         EK5D5dB8obDiG25nnsD+EsjyRfVNGvote3/Hrt2IgSYBuhpDHznJFHNqRsL54Gh5aXZu
         NWjA==
X-Gm-Message-State: AOJu0Yxsj48WakdC4n0NEd8TdF2cOIewSayYlslDUaxxoPFH3foF5xhk
	CjKGXOq47Mfwxee9ltRmXsTetLc8OqGbadbwkfDLAxVxD5XuAZ6iKfMlmI3PuQ==
X-Gm-Gg: AfdE7cnh6myxl5UYnPS6zH97Ex9zh/Bi9NwTmFHYXOSyIQ6NXS+8Z8w7VlmISsRuPhp
	pVJ10bBNS5nBdt8xQnFZAWD6H0kGLCutMPQ1SGDyhuSlYgoA8qa5P5AdoV6SgbupxqcohvlIcy7
	WzZOkNyf6NS6QAS5PTWRBXkngN22RTeSOmLbKrFVRvILlO5CCxouVkBV8zaw381/YDCBPbgUi2w
	xNiHDkxlCmu3x17E/uVC8PvqfovZgiIGf+CzSOrBzeeC7C3tUgbFUPFn7lNmmceaywVKWDY99F9
	sFKONHchTlh5XVc3RR2KRRM5+5qhCYjpBWKdBEpFo+lNznfGw6FAQxTzoh8Yx+nJ5LrzJGKPFM2
	eU8N8XsyGYZLXFFSQw0V/DyC7iw4SG2KRHCafSag/qJ1zXD7LAfW9cndImhiSyOyrcU4+ZlqTPX
	5oowWf+7nLpRxkDwhzrrpYbx4BJpLU+Fb8eh4XyEfYfYM/lUar9YMN/m+5Vw==
X-Received: by 2002:a05:6512:2c96:b0:5ae:a9ed:35a6 with SMTP id 2adb3069b0e04-5aea9ed3758mr104764e87.31.1782488806557;
        Fri, 26 Jun 2026 08:46:46 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
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
Subject: [PATCH v4 03/25] xen: arm: update p2m_set_allocation() prototype
Date: Fri, 26 Jun 2026 17:46:12 +0200
Message-ID: <d476330d88137db084b11b754b4121d116b5bada.1782487661.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782487661.git.oleksii.kurochko@gmail.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1782488807-81AD91E0-1DC5DD87/10/73395122804
X-purgate-type: spam
X-purgate-size: 8763
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,suse.com,wdc.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2076A6CEA1B

p2m_set_allocation() uses a bool *preempted out-argument that overloads two
meanings. When non-NULL, the value written back (true) duplicates information
already carried by the -ERESTART return code — pure redundancy, which the
caller-side ASSERT(preempted == (rc == -ERESTART)) only documents. Separately,
a NULL pointer is an implicit calling convention meaning "preemption is not
permitted in this context".

Replace the pointer with a plain bool can_preempt that explicitly controls
whether the preemption check runs, making the NULL-to-suppress convention
type-safe and self-documenting, and rely on the -ERESTART return code alone to
report that preemption occurred.

Since p2m_set_allocation() is called by the common dom0less build code,
move its declaration from the ARM-specific asm/p2m.h to xen/p2m-common.h.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - Reword commit message: a NULL pointer was a calling convention meaning
   "preemption not permitted", not pure redundancy.
 - Annotate the explicit can_preempt arguments at the call sites with
   /* can_preempt */ comments for readability.
 - Move the function's doc comment to the prototype in xen/p2m-common.h
   (dropping the duplicate above the Arm and RISC-V definitions) and clarify
   that -ERESTART is only returned when can_preempt is true.
 - Add __must_check to the prototype, since the return code is now the only
   preemption-status indicator.
---
Changes in v3:
 - Nothing changed. Only rebase.
---
Changes in v2:
 - new patch
---
---
 xen/arch/arm/include/asm/p2m.h          |  1 -
 xen/arch/arm/mmu/p2m.c                  | 24 ++++++------------------
 xen/arch/riscv/include/asm/paging.h     |  2 +-
 xen/arch/riscv/p2m.c                    |  9 ++-------
 xen/arch/riscv/paging.c                 |  7 ++-----
 xen/common/device-tree/dom0less-build.c |  2 +-
 xen/include/xen/p2m-common.h            |  8 ++++++++
 7 files changed, 20 insertions(+), 33 deletions(-)

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
index 51abf3504fcf..2cf35d8a3709 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -65,12 +65,7 @@ int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
     return 0;
 }
 
-/*
- * Set the pool of pages to the required number of pages.
- * Returns 0 for success, non-zero for failure.
- * Call with d->arch.paging.lock held.
- */
-int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
+int p2m_set_allocation(struct domain *d, unsigned long pages, bool can_preempt)
 {
     struct page_info *pg;
 
@@ -112,11 +107,8 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
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
@@ -125,7 +117,6 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
 int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
 {
     unsigned long pages = size >> PAGE_SHIFT;
-    bool preempted = false;
     int rc;
 
     if ( (size & ~PAGE_MASK) ||          /* Non page-sized request? */
@@ -133,27 +124,24 @@ int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
         return -EINVAL;
 
     spin_lock(&d->arch.paging.lock);
-    rc = p2m_set_allocation(d, pages, &preempted);
+    rc = p2m_set_allocation(d, pages, /* can_preempt */ true);
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
+        ret = p2m_set_allocation(d, 0, /* can_preempt */ true);
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
index 703b9f4d2540..566266e3e78f 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -428,17 +428,12 @@ int p2m_init(struct domain *d, const struct xen_domctl_createdomain *config)
     return 0;
 }
 
-/*
- * Set the pool of pages to the required number of pages.
- * Returns 0 for success, non-zero for failure.
- * Call with d->arch.paging.lock held.
- */
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
index eacfd93087ae..6f0b574755c5 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -747,7 +747,7 @@ static int __init domain_p2m_set_allocation(struct domain *d, uint64_t mem,
                 domain_p2m_pages(mem, d->max_vcpus);
 
     spin_lock(&d->arch.paging.lock);
-    rc = p2m_set_allocation(d, p2m_pages, NULL);
+    rc = p2m_set_allocation(d, p2m_pages, /* can_preempt */ false);
     spin_unlock(&d->arch.paging.lock);
 
     return rc;
diff --git a/xen/include/xen/p2m-common.h b/xen/include/xen/p2m-common.h
index f0bd9a6b9896..0eb061991283 100644
--- a/xen/include/xen/p2m-common.h
+++ b/xen/include/xen/p2m-common.h
@@ -43,5 +43,13 @@ int __must_check check_get_page_from_gfn(struct domain *d, gfn_t gfn,
                                          bool readonly, p2m_type_t *p2mt_p,
                                          struct page_info **page_p);
 
+/*
+ * Set the pool of pages to the required number of pages.
+ * Returns 0 for success, -ERESTART if preempted (only when can_preempt is
+ * true), or a negative error code on failure.
+ * Call with d->arch.paging.lock held.
+ */
+int __must_check p2m_set_allocation(struct domain *d, unsigned long pages,
+                                    bool can_preempt);
 
 #endif /* _XEN_P2M_COMMON_H */
-- 
2.54.0


