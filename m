Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E7+wB6rQS2odawEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C092D712EA6
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DrFd63rQ;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355487.1610295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliE-0007Ac-5H; Mon, 06 Jul 2026 15:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355487.1610295; Mon, 06 Jul 2026 15:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliE-000784-05; Mon, 06 Jul 2026 15:58:26 +0000
Received: by outflank-mailman (input) for mailman id 1355487;
 Mon, 06 Jul 2026 15:58:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wgliC-0006vR-9K
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:58:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgliB-003COz-Mc
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:58:23 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd09f-2eae-0a2a0a5409dd-0a2a450ce8e8-6
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:23 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd09f-f399-0a2a450c0019-d1558032d4fe-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:23 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-493b691cb44so22993935e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:58:23 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce03fa1sm284910325e9.11.2026.07.06.08.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:58:21 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783353503; x=1783958303; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sS+W4tqZwutZWWwcjeWai30+FMlUlIOZS6B2+B7csNw=;
        b=DrFd63rQ9QYGteiEvhbKFjs6rya25oGiGWy8KWNoaxtxSSmOxWvu/0UuqKKg50xw5A
         F42z75iNwCRLIm4g3Z0DKXz+8fC/ZYT8H921z4TBWyO+bWRIFmwQTM7AK9u3Tjc7j7h8
         3YHBJ/aySiMjb5jZ+iB1/ezryHV5uXBWcbb4Bf63WdUo8ujD2P+atGFFu3p67eidp6bc
         /X6nZ4E4HpjUD0sJz3MVO2l8cDrHxcbI08Pce3VzKjHIAYlh4Y5060/tV/7nlAhpjcac
         i8FQhFyjy1jRsDfga76cqMfccRJcUZStunRF+jJz2VAOCx+onnYKs2IMmcrkgbmoPJBq
         q31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353503; x=1783958303;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sS+W4tqZwutZWWwcjeWai30+FMlUlIOZS6B2+B7csNw=;
        b=QWWBANkkKoYBvIP6nshf+NmeLqZV4jNZFa2Bf2cviY9TOsAk4NA3nLLrkhOui5lUwi
         zMtZDsYimzL3/lwJj0i419nUzEwkefmpH0ySHGu5/ODlF6/MwMrvryEMO2qLRsVRnE/G
         LePp2gKgqrppqQk1VCnRQyn5Jr/UZZzSFdGmAdOrZ3b+RrzelZ5s3p6CXEnDbM3uN2/o
         s19IFSlgQTlJXKaIi+GSJBGJp46jx4CEsidFraURIZIIiQEbfzCKRU1BLEi5KT6PjosK
         N2APDP9iAm9VqlrsS+oieAiqaFf38+LSLqjUCGEwEUHskqYMaezKslw6SAK/+kTy7x8e
         FSvg==
X-Gm-Message-State: AOJu0YypCgH/BOIZOFO7HYc2AmlA4PvtbaL7TTA8wPHSyal3I6PYm9ib
	OHa08sQIbvQw2oBd/0hHkg/YWnge1QfBYJ+7pkLXdNaCx85yn9ENBnLjJ0XqYA==
X-Gm-Gg: AfdE7ckyA6YVJPXzDiS1hXIkJGj8yW2b+RU+djN92xcKMwxhWQ90ZGCMkBxB7iuymEG
	fLkJkGgjVzhvzRcJVnVYsJbeDMvJat5XUfwgyXaUS6uVop/uGwlEvCLcO67YyOmtejj85BdPTzA
	Z9pCEL6K+ko45qy5MY8kdmzmHTQkl7VNRF5bD1xBnDxXzpoZXqCbNa7SbS6TK2aBYL3T4tVoYQ8
	707VlQzikoTZRtWdK5GBKa0jlErUSavUDJY5LtXc2BeHbGHzOZmljf5SDOPJPgLGha/oT3/XWxf
	VbeMIi8t8pHnToJQOP1QcrOqymcQMvLQq1EcfJld4LGBGPUeCgNdJbhb4R4kYyIF9y6TT/GiiSC
	l6XsSGzgWRP+BCBqGC/pa7DN6JMiQ2dlWRgiYIz+Is9wDFP+ZfIrIJiphCMbbL4v2XGN61giui1
	PelqMLvsDXcFr0yDd0Ca4Elz3cGJ+xarOUZZPgvmTvn7Zo6jdpPEqhf4kKLe8/L/Tu21lw
X-Received: by 2002:a05:600c:3b05:b0:493:bb45:d54d with SMTP id 5b1f17b1804b1-493df09e3a9mr13736335e9.37.1783353502372;
        Mon, 06 Jul 2026 08:58:22 -0700 (PDT)
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
Subject: [PATCH v5 03/26] xen: arm: update p2m_set_allocation() prototype
Date: Mon,  6 Jul 2026 17:57:44 +0200
Message-ID: <c20193fefc23bc5a048ae29881040669237f62bd.1783331040.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783331040.git.oleksii.kurochko@gmail.com>
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1783353503-91924D51-EF473D15/10/73395122804
X-purgate-type: spam
X-purgate-size: 8891
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,suse.com:email];
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
X-Rspamd-Queue-Id: C092D712EA6

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
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v5:
 - Add Reviewed-by: Michal Orzel <michal.orzel@amd.com>
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


