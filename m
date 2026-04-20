Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PqiCeSL5mlOyAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF326433AD2
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286471.1567540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBJ-0002Gp-9j; Mon, 20 Apr 2026 20:25:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286471.1567540; Mon, 20 Apr 2026 20:25:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBJ-00027C-5M; Mon, 20 Apr 2026 20:25:21 +0000
Received: by outflank-mailman (input) for mailman id 1286471;
 Mon, 20 Apr 2026 19:50:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEudv-0006GP-RZ
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:50:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEudv-004tZC-8U
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:50:51 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e68399-2eae-0a2a0a5409dd-0a2a45069f96-2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:51 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e6839a-7371-0a2a45060019-22cac1c5af48-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:51 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -306608446; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 19:50:47 +0000 (UTC)
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
DKIM-Signature: a=rsa-sha256; b=B+nYO9KEh9q0WYoB0d58RVBlQDqbuZ0LyKTA/IITuj2TR7ZhTS0wwg5scl5p9rvXSzxa9QEYQD3jbf9n6ecs0f8J5nBFDBkNq8/8U/8356GgJuD5U4N8/8EetghCFWCETsI2KOo+YgBwGMVUTOY+xBdu/p88u7/U3jYkpirPGNwULO8o1nU5YgKPdbkKfU4VxswtMItj5Bna6L3ePWAvUpOTpPvT0hJ14HL0bqUMDdSCfHup+/ZEqPMQxpigOyxTXzqDmQygBpDX1DQQtlwKiREzqKwR8A/QXUHswtjLepy6ymEDw+NesNGQGNq1F8iPAxknJGZ+LvbbBqMkTPmSTw==; s=purelymail1; d=purelymail.com; v=1; bh=6QrBhjpqDTM5a7ZOSMJOwL5c5AsZbPxqt9UWvAKgsrc=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 685805:22403:null:purelymail
X-Pm-Original-To: xen-devel@lists.xenproject.org
From: Rose.Spangler@purelymail.com
To: xen-devel@lists.xenproject.org
Cc: Rose Spangler <Rose.Spangler@elektrobit.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: [RFC PATCH v6 03/43] altp2m: Move altp2m_p2m to common domain struct
Date: Mon, 20 Apr 2026 15:50:02 -0400
Message-Id: <20260420195042.207624-4-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
References: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-16d1c6/1776714651-52B75D75-EC441CBA/0/0
X-purgate-type: clean
X-purgate-size: 13719
X-Spamd-Result: default: False [3.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[purelymail.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[purelymail.com:s=purelymail1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tamas@tklengyel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[purelymail.com:-];
	FROM_NO_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.860];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: BF326433AD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rose Spangler <Rose.Spangler@elektrobit.com>

Similarly to the previous commit, this commit moves altp2m_p2m to the
common domain struct. The representation of altp2m views as an array of
p2m_domain pointers is the same on x86 and ARM, and it seems that this
would be the case for other architectures as well.

This commit is a refactor, and no change in functionality is intended.

This is commit 3/8 of the preparation phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/hvm/vmx/vmx.c        |  2 +-
 xen/arch/x86/include/asm/domain.h |  1 -
 xen/arch/x86/include/asm/p2m.h    |  4 ++--
 xen/arch/x86/mm/altp2m.c          | 28 ++++++++++++++--------------
 xen/arch/x86/mm/hap/hap.c         |  6 +++---
 xen/arch/x86/mm/mem_access.c      |  8 ++++----
 xen/arch/x86/mm/mem_sharing.c     |  2 +-
 xen/arch/x86/mm/p2m-ept.c         |  6 +++---
 xen/arch/x86/mm/p2m.c             |  8 ++++----
 xen/include/xen/sched.h           |  1 +
 10 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index ff895f7f9437..0909929c00e0 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -5004,7 +5004,7 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_u=
ser_regs *regs)
                 if ( currd->arch.altp2m_eptp[i] =3D=3D mfn_x(INVALID_MFN) =
)
                     continue;
=20
-                ept =3D &currd->arch.altp2m_p2m[i]->ept;
+                ept =3D &currd->altp2m_p2m[i]->ept;
                 if ( cpumask_test_cpu(cpu, ept->invalidate) )
                 {
                     cpumask_clear_cpu(cpu, ept->invalidate);
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/d=
omain.h
index 0cf0c0d92087..f8038087e612 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -368,7 +368,6 @@ struct arch_domain
     mm_lock_t nested_p2m_lock;
=20
 #ifdef CONFIG_ALTP2M
-    struct p2m_domain **altp2m_p2m;
     mm_lock_t altp2m_list_lock;
     uint64_t *altp2m_eptp;
     uint64_t *altp2m_visible_eptp;
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.=
h
index 3a5a5fd43c2a..ec871717a9e4 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -901,7 +901,7 @@ static inline struct p2m_domain *p2m_get_altp2m(struct =
vcpu *v)
=20
     BUG_ON(index >=3D v->domain->nr_altp2m);
=20
-    return v->domain->arch.altp2m_p2m[index];
+    return v->domain->altp2m_p2m[index];
 }
=20
 /* set current alternate p2m table */
@@ -919,7 +919,7 @@ static inline bool p2m_set_altp2m(struct vcpu *v, unsig=
ned int idx)
     atomic_dec(&orig->active_vcpus);
=20
     vcpu_altp2m(v).p2midx =3D idx;
-    atomic_inc(&v->domain->arch.altp2m_p2m[idx]->active_vcpus);
+    atomic_inc(&v->domain->altp2m_p2m[idx]->active_vcpus);
=20
     return true;
 }
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 08db8f37c1b1..8dd3c0f96be0 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -130,14 +130,14 @@ int p2m_init_altp2m(struct domain *d)
     struct p2m_domain *hostp2m =3D p2m_get_hostp2m(d);
=20
     mm_lock_init(&d->arch.altp2m_list_lock);
-    d->arch.altp2m_p2m =3D xvzalloc_array(struct p2m_domain *, d->nr_altp2=
m);
+    d->altp2m_p2m =3D xvzalloc_array(struct p2m_domain *, d->nr_altp2m);
=20
-    if ( !d->arch.altp2m_p2m )
+    if ( !d->altp2m_p2m )
         return -ENOMEM;
=20
     for ( i =3D 0; i < d->nr_altp2m; i++ )
     {
-        d->arch.altp2m_p2m[i] =3D p2m =3D p2m_init_one(d);
+        d->altp2m_p2m[i] =3D p2m =3D p2m_init_one(d);
         if ( p2m =3D=3D NULL )
         {
             p2m_teardown_altp2m(d);
@@ -158,14 +158,14 @@ void p2m_teardown_altp2m(struct domain *d)
=20
     for ( i =3D 0; i < d->nr_altp2m; i++ )
     {
-        if ( !d->arch.altp2m_p2m[i] )
+        if ( !d->altp2m_p2m[i] )
             continue;
-        p2m =3D d->arch.altp2m_p2m[i];
-        d->arch.altp2m_p2m[i] =3D NULL;
+        p2m =3D d->altp2m_p2m[i];
+        d->altp2m_p2m[i] =3D NULL;
         p2m_free_one(p2m);
     }
=20
-    XVFREE(d->arch.altp2m_p2m);
+    XVFREE(d->altp2m_p2m);
 }
=20
 int altp2m_get_effective_entry(struct p2m_domain *ap2m, gfn_t gfn, mfn_t *=
mfn,
@@ -325,7 +325,7 @@ static void p2m_reset_altp2m(struct domain *d, unsigned=
 int idx,
     struct p2m_domain *p2m;
=20
     ASSERT(idx < d->nr_altp2m);
-    p2m =3D d->arch.altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
+    p2m =3D d->altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
=20
     p2m_lock(p2m);
=20
@@ -368,7 +368,7 @@ static int p2m_activate_altp2m(struct domain *d, unsign=
ed int idx,
=20
     ASSERT(idx < d->nr_altp2m);
=20
-    p2m =3D d->arch.altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
+    p2m =3D d->altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
     hostp2m =3D p2m_get_hostp2m(d);
=20
     p2m_lock(p2m);
@@ -468,7 +468,7 @@ int p2m_destroy_altp2m_by_id(struct domain *d, unsigned=
 int idx)
     if ( d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] !=3D
          mfn_x(INVALID_MFN) )
     {
-        p2m =3D d->arch.altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
+        p2m =3D d->altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
=20
         if ( !_atomic_read(p2m->active_vcpus) )
         {
@@ -532,7 +532,7 @@ int p2m_change_altp2m_gfn(struct domain *d, unsigned in=
t idx,
         return rc;
=20
     hp2m =3D p2m_get_hostp2m(d);
-    ap2m =3D d->arch.altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
+    ap2m =3D d->altp2m_p2m[array_index_nospec(idx, d->nr_altp2m)];
=20
     p2m_lock(hp2m);
     p2m_lock(ap2m);
@@ -596,7 +596,7 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t=
 gfn,
         if ( d->arch.altp2m_eptp[i] =3D=3D mfn_x(INVALID_MFN) )
             continue;
=20
-        p2m =3D d->arch.altp2m_p2m[i];
+        p2m =3D d->altp2m_p2m[i];
=20
         /* Check for a dropped page that may impact this altp2m */
         if ( mfn_eq(mfn, INVALID_MFN) &&
@@ -679,7 +679,7 @@ int p2m_set_suppress_ve_multi(struct domain *d,
             return -EINVAL;
=20
         p2m =3D ap2m =3D
-            d->arch.altp2m_p2m[array_index_nospec(sve->view, d->nr_altp2m)=
];
+            d->altp2m_p2m[array_index_nospec(sve->view, d->nr_altp2m)];
     }
=20
     p2m_lock(host_p2m);
@@ -746,7 +746,7 @@ int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bo=
ol *suppress_ve,
             return -EINVAL;
=20
         p2m =3D ap2m =3D
-            d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_altp2m=
)];
+            d->altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_altp2m)];
     }
     else
         p2m =3D host_p2m;
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 3d563b3bc2d1..6918a00a2a25 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -524,7 +524,7 @@ int hap_enable(struct domain *d, u32 mode)
=20
         for ( i =3D 0; i < d->nr_altp2m; i++ )
         {
-            rv =3D p2m_alloc_table(d->arch.altp2m_p2m[i]);
+            rv =3D p2m_alloc_table(d->altp2m_p2m[i]);
             if ( rv !=3D 0 )
                goto out;
         }
@@ -548,7 +548,7 @@ void hap_final_teardown(struct domain *d)
 #ifdef CONFIG_ALTP2M
     if ( hvm_altp2m_supported() )
         for ( i =3D 0; i < d->nr_altp2m; i++ )
-            p2m_teardown(d->arch.altp2m_p2m[i], true, NULL);
+            p2m_teardown(d->altp2m_p2m[i], true, NULL);
 #endif
=20
     /* Destroy nestedp2m's first */
@@ -603,7 +603,7 @@ void hap_teardown(struct domain *d, bool *preempted)
=20
         for ( i =3D 0; i < d->nr_altp2m; i++ )
         {
-            p2m_teardown(d->arch.altp2m_p2m[i], false, preempted);
+            p2m_teardown(d->altp2m_p2m[i], false, preempted);
             if ( preempted && *preempted )
                 return;
         }
diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index a9d6b081a523..e5548e64d8d0 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -319,7 +319,7 @@ long p2m_set_mem_access(struct domain *d, gfn_t gfn, ui=
nt32_t nr,
         if ( !altp2m_is_eptp_valid(d, altp2m_idx) )
             return -EINVAL;
=20
-        ap2m =3D d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_a=
ltp2m)];
+        ap2m =3D d->altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_altp2m=
)];
     }
 #endif
=20
@@ -375,7 +375,7 @@ long p2m_set_mem_access_multi(struct domain *d,
         if ( !altp2m_is_eptp_valid(d, altp2m_idx) )
             return -EINVAL;
=20
-        ap2m =3D d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_a=
ltp2m)];
+        ap2m =3D d->altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_altp2m=
)];
     }
 #endif
=20
@@ -438,7 +438,7 @@ int p2m_get_mem_access(struct domain *d, gfn_t gfn, xen=
mem_access_t *access,
         if ( !altp2m_is_eptp_valid(d, altp2m_idx) )
             return -EINVAL;
=20
-        p2m =3D d->arch.altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_al=
tp2m)];
+        p2m =3D d->altp2m_p2m[array_index_nospec(altp2m_idx, d->nr_altp2m)=
];
     }
 #endif
=20
@@ -457,7 +457,7 @@ void arch_p2m_set_access_required(struct domain *d, boo=
l access_required)
         unsigned int i;
         for ( i =3D 0; i < d->nr_altp2m; i++ )
         {
-            struct p2m_domain *p2m =3D d->arch.altp2m_p2m[i];
+            struct p2m_domain *p2m =3D d->altp2m_p2m[i];
=20
             if ( p2m )
                 p2m->access_required =3D access_required;
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 8319733b1bb6..b7d8fb9ad1aa 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -919,7 +919,7 @@ static int nominate_page(struct domain *d, gfn_t gfn,
=20
         for ( i =3D 0; i < d->nr_altp2m; i++ )
         {
-            ap2m =3D d->arch.altp2m_p2m[i];
+            ap2m =3D d->altp2m_p2m[i];
             if ( !ap2m )
                 continue;
=20
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index ed850723f5fd..ddb4c7606be1 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -1311,7 +1311,7 @@ static void ept_set_ad_sync(struct domain *d, bool va=
lue)
             if ( d->arch.altp2m_eptp[i] =3D=3D mfn_x(INVALID_MFN) )
                 continue;
=20
-            p2m =3D d->arch.altp2m_p2m[i];
+            p2m =3D d->altp2m_p2m[i];
=20
             p2m_lock(p2m);
             p2m->ept.ad =3D value;
@@ -1579,7 +1579,7 @@ void __init setup_ept_dump(void)
 void p2m_init_altp2m_ept(struct domain *d, unsigned int i)
 {
     struct p2m_domain *p2m =3D
-        d->arch.altp2m_p2m[array_index_nospec(i, d->nr_altp2m)];
+        d->altp2m_p2m[array_index_nospec(i, d->nr_altp2m)];
     struct p2m_domain *hostp2m =3D p2m_get_hostp2m(d);
     struct ept_data *ept;
=20
@@ -1603,7 +1603,7 @@ unsigned int p2m_find_altp2m_by_eptp(struct domain *d=
, uint64_t eptp)
         if ( d->arch.altp2m_eptp[i] =3D=3D mfn_x(INVALID_MFN) )
             continue;
=20
-        p2m =3D d->arch.altp2m_p2m[i];
+        p2m =3D d->altp2m_p2m[i];
         ept =3D &p2m->ept;
=20
         if ( eptp =3D=3D ept->eptp )
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 41517765c5ec..5bd426296f20 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -111,7 +111,7 @@ void p2m_change_entry_type_global(struct domain *d,
         {
             if ( d->arch.altp2m_eptp[i] !=3D mfn_x(INVALID_MFN) )
             {
-                struct p2m_domain *altp2m =3D d->arch.altp2m_p2m[i];
+                struct p2m_domain *altp2m =3D d->altp2m_p2m[i];
=20
                 p2m_lock(altp2m);
                 change_entry_type_global(altp2m, ot, nt);
@@ -157,7 +157,7 @@ bool p2m_memory_type_changed(struct domain *d)
         {
             if ( d->arch.altp2m_eptp[i] !=3D mfn_x(INVALID_MFN) )
             {
-                struct p2m_domain *altp2m =3D d->arch.altp2m_p2m[i];
+                struct p2m_domain *altp2m =3D d->altp2m_p2m[i];
=20
                 p2m_lock(altp2m);
                 _memory_type_changed(altp2m);
@@ -955,7 +955,7 @@ void p2m_change_type_range(struct domain *d,
         {
             if ( d->arch.altp2m_eptp[i] !=3D mfn_x(INVALID_MFN) )
             {
-                struct p2m_domain *altp2m =3D d->arch.altp2m_p2m[i];
+                struct p2m_domain *altp2m =3D d->altp2m_p2m[i];
=20
                 p2m_lock(altp2m);
                 change_type_range(altp2m, start, end, ot, nt);
@@ -1031,7 +1031,7 @@ int p2m_finish_type_change(struct domain *d,
         {
             if ( d->arch.altp2m_eptp[i] !=3D mfn_x(INVALID_MFN) )
             {
-                struct p2m_domain *altp2m =3D d->arch.altp2m_p2m[i];
+                struct p2m_domain *altp2m =3D d->altp2m_p2m[i];
=20
                 p2m_lock(altp2m);
                 rc =3D finish_type_change(altp2m, first_gfn, max_nr);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 458f2f260dd7..5d8ba2d2ab19 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -626,6 +626,7 @@ struct domain
     /* altp2m: allow multiple copies of host p2m */
     bool altp2m_active;
     unsigned int nr_altp2m;    /* Number of altp2m tables. */
+    struct p2m_domain **altp2m_p2m;
 #endif
=20
 #ifdef CONFIG_VMTRACE
--=20
2.34.1


