Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHsFMuOL5mlOyAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA0E433ACD
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286490.1567641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBR-0004sB-Cs; Mon, 20 Apr 2026 20:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286490.1567641; Mon, 20 Apr 2026 20:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBQ-0004hL-QP; Mon, 20 Apr 2026 20:25:28 +0000
Received: by outflank-mailman (input) for mailman id 1286490;
 Mon, 20 Apr 2026 19:50:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEue3-0006Jl-AX
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:50:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEue2-00C1UM-Np
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:50:58 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e6835b-e002-0a2a0a5209dd-0a2a45099984-32
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:58 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e683a1-2497-0a2a45090019-22cac1c59ac8-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:58 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -306608446; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 19:50:54 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=purelymail1 header.d=purelymail.com header.i="@purelymail.com" header.h="Feedback-ID:Received:From:To:Subject:Date"
DKIM-Signature: a=rsa-sha256; b=K8cAlPAo34D/KbfIAwlhMVleLBpBa7d3aFRxOMyHsW+Ig5Gt7WdPk1bTdYrOA48ZusRfG9g5Pqe9Cw5rCefSUaFKusogC6b7fvdnFQhkTxV2nk5jlXSd2O6G33vUBx2waQk/nvWrUhkTq2/lpgHT6Sh5vvaHUheA474xC0VKdse5tMKfOWQrVJOW3WOxCzmD3rJ304Hj53FG2cfC5wQCsu6/WiYBwtE7kMn+pGgcW0TQ0h23QI/SLqFk7LPIttxLw51f+GoVF9onqXxT0vXy+4j0TGfDzeoSUQ+06sqKdUMkMaCqhu7Dj1QPJwIZ7jfNGPErlOnvHVcceu4eJX8rag==; s=purelymail1; d=purelymail.com; v=1; bh=5qX8VqlfLuFzhxCaItkjpTl/pD3HY4nQgg/454o6cjs=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 685805:22403:null:purelymail
X-Pm-Original-To: xen-devel@lists.xenproject.org
From: Rose.Spangler@purelymail.com
To: xen-devel@lists.xenproject.org
Cc: Rose Spangler <Rose.Spangler@elektrobit.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Sergej Proskurin <proskurin@sec.in.tum.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien.grall@arm.com>
Subject: [RFC PATCH v6 17/43] arm/p2m: Move hostp2m init/teardown to individual functions
Date: Mon, 20 Apr 2026 15:50:16 -0400
Message-Id: <20260420195042.207624-18-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
References: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-bad1c0/1776714658-486A8A53-5272C0EC/0/0
X-purgate-type: clean
X-purgate-size: 10277
X-Spamd-Result: default: False [3.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[purelymail.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[purelymail.com:s=purelymail1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:proskurin@sec.in.tum.de,m:sstabellini@kernel.org,m:julien.grall@arm.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[purelymail.com:-];
	FROM_NO_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.874];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 2CA0E433ACD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rose Spangler <Rose.Spangler@elektrobit.com>

This commit pulls out generic init/teardown functionality out of "p2m_init"
and "p2m_teardown" into "p2m_init_one", "p2m_teardown_one", "p2m_free_one",
and "p2m_flush_table" functions. This allows our future implementation to
reuse existing code for the initialization/teardown of altp2m views.

On failure, the p2m_init_one function returns a null pointer. This means
p2m_init_one doesn't return an error code, which prevents it from
propagating the exact error from p2m_initialise (specifically, ENOMEM if
allocation fails and EBUSY if the VMID pool is exhausted). However,
returning a p2m_domain pointer simplifies usage for callers of
p2m_init_one, as they can receive an allocated and initialized p2m_domain
without needing to handle allocation separately. Therefore, the main
p2m_init function will now return ENOMEM instead of EBUSY when the VMID
pool is exhausted.

This is commit 6/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien.grall@arm.com>
---
v2: Added the function p2m_flush_table to the previous version.

v3: Removed struct vttbr.

    Moved define INVALID_VTTBR to p2m.h.

    Exported function prototypes of "p2m_flush_table", "p2m_init_one",
    and "p2m_teardown_one" in p2m.h.

    Extended the function "p2m_flush_table" by additionally resetting
    the fields lowest_mapped_gfn and max_mapped_gfn.

    Added a "p2m_flush_tlb" call in "p2m_flush_table". On altp2m reset
    in function "altp2m_reset", it is important to flush the TLBs after
    clearing the root table pages and before clearing the intermediate
    altp2m page tables to prevent illegal access to stalled TLB entries
    on currently active VCPUs.

    Added a check checking whether p2m->root is NULL in p2m_flush_table.

    Renamed the function "p2m_free_one" to "p2m_teardown_one".

    Removed resetting p2m->vttbr in "p2m_teardown_one", as it the p2m
    will be destroyed afterwards.

    Moved call to "p2m_alloc_table" back to "p2m_init_one".

    Moved the introduction of the type p2m_class_t out of this patch.

    Moved the backpointer to the struct domain out of the struct
    p2m_domain.

v4: Replaced the former use of clear_and_clean_page in p2m_flush_table
    by a routine that invalidates every p2m entry atomically. This
    avoids inconsistencies on CPUs that continue to use the views that
    are to be flushed (e.g., see altp2m_reset).

    Removed unnecessary initializations in the functions "p2m_init_one"
    and "p2m_teardown_one".

    Removed the define INVALID_VTTBR as it is not used any more.

    Cosmetic fixes.

v6: Reworked to accommodate the hostp2m being allocated separately from
    arch_domain.

    Split p2m_teardown_one into p2m_teardown_one and p2m_free_one, with
    both having the same semantics as their x86 counterparts.

    The previous version of this patch also added code to p2m_flush_table.
    This has been split out into a separate commit to minimize the number
    of actual changes in this commit.

    Updated to account for the introduction of p2m_final_teardown.  The
    code which previously was used to reclaim resources from the hostp2m
    during p2m_final_teardown was extracted into p2m_free_one. Now,
    p2m_final_teardown will call p2m_free_one on the hostp2m instead. The
    check for whether the p2m was actually initialized was moved into
    p2m_free_one. This means there is a slight behavior change where
    p2m_teardown_allocation will always be called, even if the p2m_domain
    was never initialized. I'm not sure if this is really a big deal (it
    does require the lock to be obtained, but this shouldn't be an issue at
    final teardown?), but if it is then I can duplicate the check from
    p2m_free_one to the top of p2m_final_teardown, which would replicate
    the previous behavior.

    For the sake of making the p2m_init_one function simple to use (and
    match the x86 function prototype), it returns a null pointer on error
    rather than an error code. While on x86 an error from p2m_init_one is
    always due to an ENOMEM return code (from xzalloc, zalloc_cpumask_var),
    on ARM p2m_initialise (called by p2m_init_one) can actually return
    EBUSY if the VMID pool is exhausted. Therefore, in this error case the
    null pointer return value of p2m_init_one obscures the true error code
    (EBUSY). Callers of p2m_init_one always return ENOMEM when p2m_init_one
    returns a null pointer, so this error will be propagated up as ENOMEM
    rather than EBUSY. The alternative to this would be to have callers
    pass a null **p2m_domain to p2m_init_one while still returning an
    integer return code. In order to preserve a common altp2m_init routine,
    this change would also have to be made on x86 (where there wouldn't be
    any real benefit, the return code is truly only ever ENOMEM).
    Therefore, it seems like an acceptable tradeoff to me to obscure the
    error in this case, but if other folks think we should handle this
    differently than I can revisit this.

    The p2m_teardown_allocation call and p2m_init_one return code changes
    mentioned above should be the only actual behavior changes in this
    patch, otherwise it should be just code movement.
---
 xen/arch/arm/include/asm/p2m.h | 12 ++++++
 xen/arch/arm/mmu/p2m.c         | 77 +++++++++++++++++++++++-----------
 2 files changed, 65 insertions(+), 24 deletions(-)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.=
h
index 23df91ea13e9..5c6dfe4a9789 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -216,6 +216,18 @@ int p2m_init(struct domain *d);
 int p2m_teardown(struct domain *d);
 void p2m_final_teardown(struct domain *d);
=20
+/* Flushes the page table held by the p2m. */
+int p2m_flush_table(struct p2m_domain *p2m);
+
+/* Initialize the p2m structure. */
+struct p2m_domain *p2m_init_one(struct domain *d);
+
+/* Release resources held by the p2m structure. */
+int p2m_teardown_one(struct p2m_domain *p2m);
+
+/* Free the p2m structure allocation. */
+void p2m_free_one(struct p2m_domain *p2m);
+
 /*
  * Remove mapping refcount on each mapping page in the p2m
  *
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 1009f10e5db4..1d598c66450b 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1444,14 +1444,10 @@ static int p2m_alloc_table(struct domain *d)
     return 0;
 }
=20
-int p2m_teardown(struct domain *d)
+int p2m_flush_table(struct p2m_domain *p2m)
 {
-    struct p2m_domain *p2m =3D p2m_get_hostp2m(d);
     unsigned long count =3D 0;
     struct page_info *pg;
-    int rc =3D 0;
-
-    p2m_write_lock(p2m);
=20
     while ( (pg =3D page_list_remove_head(&p2m->pages)) )
     {
@@ -1460,23 +1456,34 @@ int p2m_teardown(struct domain *d)
         /* Arbitrarily preempt every 512 iterations */
         if ( !(count % 512) && hypercall_preempt_check() )
         {
-            rc =3D -ERESTART;
-            break;
+            return -ERESTART;
         }
     }
=20
+    return 0;
+}
+
+int p2m_teardown_one(struct p2m_domain *p2m)
+{
+    int rc;
+
+    p2m_write_lock(p2m);
+    rc =3D p2m_flush_table(p2m);
     p2m_write_unlock(p2m);
=20
     return rc;
 }
=20
-void p2m_final_teardown(struct domain *d)
+int p2m_teardown(struct domain *d)
 {
     struct p2m_domain *p2m =3D p2m_get_hostp2m(d);
=20
-    /* p2m not actually initialized */
-    if ( !p2m->domain )
-        goto free_p2m;
+    return p2m_teardown_one(p2m);
+}
+
+void p2m_final_teardown(struct domain *d)
+{
+    struct p2m_domain *p2m =3D p2m_get_hostp2m(d);
=20
     /*
      * No need to call relinquish_p2m_mapping() here because
@@ -1484,18 +1491,27 @@ void p2m_final_teardown(struct domain *d)
      * where relinquish_p2m_mapping() has been called.
      */
=20
-    ASSERT(page_list_empty(&p2m->pages));
-
     while ( p2m_teardown_allocation(d) =3D=3D -ERESTART )
         continue; /* No preemption support here */
     ASSERT(page_list_empty(&d->arch.paging.p2m_freelist));
=20
+    p2m_free_one(p2m);
+}
+
+void p2m_free_one(struct p2m_domain *p2m)
+{
+    /* p2m not actually initialized */
+    if ( !p2m->domain )
+        goto free_p2m;
+
+    ASSERT(page_list_empty(&p2m->pages));
+
     if ( p2m->root )
         free_domheap_pages(p2m->root, P2M_ROOT_ORDER);
=20
     p2m->root =3D NULL;
=20
-    p2m_free_vmid(d);
+    p2m_free_vmid(p2m->domain);
=20
     radix_tree_destroy(&p2m->mem_access_settings, NULL);
=20
@@ -1511,9 +1527,7 @@ static int p2m_initialise(struct domain *d, struct p2=
m_domain *p2m)
     unsigned int cpu;
=20
     rwlock_init(&p2m->lock);
-    spin_lock_init(&d->arch.paging.lock);
     INIT_PAGE_LIST_HEAD(&p2m->pages);
-    INIT_PAGE_LIST_HEAD(&d->arch.paging.p2m_freelist);
=20
     p2m->vmid =3D INVALID_VMID;
     p2m->max_mapped_gfn =3D _gfn(0);
@@ -1559,22 +1573,37 @@ static int p2m_initialise(struct domain *d, struct =
p2m_domain *p2m)
     return 0;
 }
=20
-int p2m_init(struct domain *d)
+struct p2m_domain *p2m_init_one(struct domain *d)
 {
     struct p2m_domain *p2m =3D xzalloc(struct p2m_domain);
-    int rc;
+
+    if ( !p2m )
+        return NULL;
+
+    if ( !p2m_initialise(d, p2m) )
+        return p2m;
+
+    xfree(p2m);
+    return NULL;
+}
+
+static int p2m_init_hostp2m(struct domain *d)
+{
+    struct p2m_domain *p2m =3D p2m_init_one(d);
=20
     if ( !p2m )
         return -ENOMEM;
=20
-    rc =3D p2m_initialise(d, p2m);
+    d->arch.p2m =3D p2m;
+    return 0;
+}
=20
-    if ( !rc )
-        d->arch.p2m =3D p2m;
-    else
-        xfree(p2m);
+int p2m_init(struct domain *d)
+{
+    spin_lock_init(&d->arch.paging.lock);
+    INIT_PAGE_LIST_HEAD(&d->arch.paging.p2m_freelist);
=20
-    return rc;
+    return p2m_init_hostp2m(d);
 }
=20
 /*
--=20
2.34.1


