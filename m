Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PqiCeSL5mlOyAEAu9opvQ:T2
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4373B433AFF
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286514.1567715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBo-0000bm-KC; Mon, 20 Apr 2026 20:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286514.1567715; Mon, 20 Apr 2026 20:25:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBm-00009I-IZ; Mon, 20 Apr 2026 20:25:50 +0000
Received: by outflank-mailman (input) for mailman id 1286514;
 Mon, 20 Apr 2026 19:55:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEui5-0006VA-Sw
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:55:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEui5-00C0mN-9p
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:55:09 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e6849d-5cb7-0a2a0a5109dd-0a2a450bd69e-0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:55:09 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e683ab-212f-0a2a450b0019-22cac1c5c2e6-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:51:08 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -306608446; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 19:50:57 +0000 (UTC)
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
DKIM-Signature: a=rsa-sha256; b=YcLB+fWp94ky5pCPnNruujNicg8BuQxICWMz3/BkwTq5ox4j84lmQRhd/i/oJFV+bGrH/feNXuOJKUqWO7iRTJSJvCkQoO7DEhapiVl2SYkjE+kdkZt7F8FqHaXpUrr5ic/CYEiirwTnijxiNkgQnSXBk+OlXjsWW4IJa50rBGNCoT8Fikyua5CIFly1yk1FBT3iKWowcukxfNakHan6jqBuc9ejBefxwfCvbpzCIEpEP9zVwzXBpQpDnX97oU4sMWOSUdFnEH4mPqrqN+CNo/4ZTlCmktbbO8OWwxujmWCkzu+iHTOu3x2F3Xhz1iEeMCu4fPp/+sbYhQH2pNFYAQ==; s=purelymail1; d=purelymail.com; v=1; bh=pik6B7HNWf3xgS0SgW/KnVIMif31sL93P+diA7yc3/I=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 685805:22403:null:purelymail
X-Pm-Original-To: xen-devel@lists.xenproject.org
From: Rose.Spangler@purelymail.com
To: xen-devel@lists.xenproject.org
Cc: Rose Spangler <Rose.Spangler@elektrobit.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Sergej Proskurin <proskurin@sec.in.tum.de>,
	Aqib Javaid <Aqib.Javaid@elektrobit.com>
Subject: [RFC PATCH v6 23/43] arm/altp2m: Add support for altp2m init/teardown routines
Date: Mon, 20 Apr 2026 15:50:22 -0400
Message-Id: <20260420195042.207624-24-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
References: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-42698a/1776714668-0636CF3B-EAFEFEF9/13/0
X-purgate-type: clean
X-purgate-size: 7918
X-Spamd-Result: default: False [3.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[purelymail.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[purelymail.com:s=purelymail1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:proskurin@sec.in.tum.de,m:Aqib.Javaid@elektrobit.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[purelymail.com:-];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.884];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 4373B433AFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rose Spangler <Rose.Spangler@elektrobit.com>

The p2m initialization now invokes initialization routines responsible for
the allocation and initialization of altp2m structures. The same applies to
teardown routines.

This commit adds the prerequisites for the common altp2m_init and
altp2m_teardown functions to work on ARM; No further changes were necessary
other than removing the CONFIG_X86 gating.

This is commit 12/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
Signed-off-by: Aqib Javaid <Aqib.Javaid@elektrobit.com>
---
v2: Shared code between host/altp2m init/teardown functions.
    Added conditional init/teardown of altp2m.
    Altp2m related functions are moved to altp2m.c

v3: Removed locking the altp2m_lock in altp2m_teardown. Locking this
    lock at this point is unnecessary.

    Removed re-setting altp2m_vttbr, altp2m_p2m, and altp2m_active
    values in the function "altp2m_teardown". Re-setting these values is
    unnecessary as the entire domain will be destroyed right afterwards.

    Removed check for "altp2m_enabled" in "p2m_init" as altp2m has not yet
    been enabled by libxl at this point.

    Removed check for "altp2m_enabled" before tearing down altp2m within
    the function "p2m_teardown" so that altp2m gets destroyed even if
    the HVM_PARAM_ALTP2M gets reset before "p2m_teardown" is called.

    Added initialization of the field d->arch.altp2m_active in
    "altp2m_init".

    Removed check for already initialized vmid's in "altp2m_init_one",
    as "altp2m_init_one" is now called always with an uninitialized p2m.

    Removed the array altp2m_vttbr[] in struct arch_domain.

v4: Removed initialization of altp2m_p2m[] to NULL in altp2m_init, as
    the "struct arch_domain" is already initialized to zero.

    We moved the definition of the macro MAX_ALTP2M to a common place in
    a separate commit.

v6: Reworked to use common altp2m init and teardown routines.

    Added altp2m_lock_init macro for use in altp2m_init.

    Split altp2m initialization in p2m_init into a separate function,
    p2m_init_altp2m, to more easily gate code behind CONFIG_ALTP2M.

    Pulled in addition of active_vcpus from a later patch in the patch
    series.

    Split teardown and free of altp2m views into p2m_teardown and
    p2m_teardown_final (part of altp2m_teardown), respectively.
---
 xen/arch/arm/include/asm/altp2m.h |  4 +++
 xen/arch/arm/include/asm/domain.h |  8 ++++++
 xen/arch/arm/include/asm/p2m.h    |  5 ++++
 xen/arch/arm/mmu/p2m.c            | 44 ++++++++++++++++++++++++++++++-
 xen/common/altp2m.c               |  2 --
 xen/include/xen/altp2m.h          |  2 --
 6 files changed, 60 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/include/asm/altp2m.h b/xen/arch/arm/include/asm/a=
ltp2m.h
index 698c35427e75..5a217f48b103 100644
--- a/xen/arch/arm/include/asm/altp2m.h
+++ b/xen/arch/arm/include/asm/altp2m.h
@@ -19,6 +19,10 @@ static inline bool altp2m_supported(void)
     return true;
 }
=20
+#define altp2m_lock_init(d) spin_lock_init(&(d)->arch.altp2m_lock)
+#define altp2m_lock(d)      spin_lock(&(d)->arch.altp2m_lock)
+#define altp2m_unlock(d)    spin_unlock(&(d)->arch.altp2m_lock)
+
 /* Alternate p2m VCPU */
 static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
 {
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/d=
omain.h
index 576dbdec20af..9e69d62086cd 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -128,6 +128,14 @@ struct arch_domain
 #endif
=20
     struct resume_info resume_ctx;
+
+#ifdef CONFIG_ALTP2M
+    /*
+     * Lock that protects critical altp2m operations that must not be perf=
ormed
+     * concurrently.
+     */
+    spinlock_t altp2m_lock;
+#endif
 }  __cacheline_aligned;
=20
 struct arch_vcpu
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.=
h
index 8ae0cd7ff589..db715c4f8bfc 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -9,6 +9,8 @@
 #include <asm/current.h>
 #include <asm/hsr.h>
=20
+#include <asm/atomic.h>
+
 #define paddr_bits PADDR_BITS
=20
 /* Holds the bit size of IPAs in p2m tables.  */
@@ -117,6 +119,9 @@ struct p2m_domain {
     /* Keeping track on which CPU this p2m was used and for which vCPU */
     uint8_t last_vcpu_ran[NR_CPUS];
=20
+    /* Alternate p2m: count of vcpu's currently using this p2m. */
+    atomic_t active_vcpus;
+
     /* Choose between: host/alternate. */
     p2m_class_t p2m_class;
 };
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 0d37760ef5d5..04d17e787259 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1,4 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
+#include <xen/altp2m.h>
 #include <xen/cpu.h>
 #include <xen/domain_page.h>
 #include <xen/ioreq.h>
@@ -7,6 +8,7 @@
 #include <xen/softirq.h>
 #include <xen/xmalloc.h>
=20
+#include <asm/altp2m.h>
 #include <asm/alternative.h>
 #include <asm/event.h>
 #include <asm/flushtlb.h>
@@ -1486,6 +1488,20 @@ int p2m_teardown(struct domain *d)
 {
     struct p2m_domain *p2m =3D p2m_get_hostp2m(d);
=20
+#ifdef CONFIG_ALTP2M
+    unsigned int i;
+    int rc;
+
+    d->altp2m_active =3D false;
+
+    for ( i =3D 0; i < d->nr_altp2m; i++ )
+    {
+        rc =3D p2m_teardown_one(d->altp2m_p2m[i]);
+        if ( rc )
+            return rc;
+    }
+#endif
+
     return p2m_teardown_one(p2m);
 }
=20
@@ -1499,6 +1515,9 @@ void p2m_final_teardown(struct domain *d)
      * where relinquish_p2m_mapping() has been called.
      */
=20
+    if ( altp2m_supported() )
+        altp2m_teardown(d);
+
     while ( p2m_teardown_allocation(d) =3D=3D -ERESTART )
         continue; /* No preemption support here */
     ASSERT(page_list_empty(&d->arch.paging.p2m_freelist));
@@ -1595,6 +1614,24 @@ struct p2m_domain *p2m_init_one(struct domain *d)
     return NULL;
 }
=20
+static int p2m_init_altp2m(struct domain *d)
+{
+#ifdef CONFIG_ALTP2M
+    int rc;
+
+    rc =3D altp2m_init(d);
+    if ( rc )
+    {
+        p2m_free_one(p2m_get_hostp2m(d));
+        return rc;
+    }
+
+    d->altp2m_active =3D false;
+#endif
+
+    return 0;
+}
+
 static int p2m_init_hostp2m(struct domain *d)
 {
     struct p2m_domain *p2m =3D p2m_init_one(d);
@@ -1608,10 +1645,15 @@ static int p2m_init_hostp2m(struct domain *d)
=20
 int p2m_init(struct domain *d)
 {
+    int rc;
     spin_lock_init(&d->arch.paging.lock);
     INIT_PAGE_LIST_HEAD(&d->arch.paging.p2m_freelist);
=20
-    return p2m_init_hostp2m(d);
+    rc =3D p2m_init_hostp2m(d);
+    if ( rc )
+        return rc;
+
+    return p2m_init_altp2m(d);
 }
=20
 /*
diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index cda653b713f0..989d8bdcb923 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -15,7 +15,6 @@
 #include <asm/hvm/nestedhvm.h>
 #endif
=20
-#if CONFIG_X86
 int altp2m_init(struct domain *d)
 {
     unsigned int i;
@@ -60,7 +59,6 @@ void altp2m_teardown(struct domain *d)
=20
     XVFREE(d->altp2m_p2m);
 }
-#endif /* CONFIG_X86 */
=20
 /*
  * altp2m operations are envisioned as being used in several different
diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
index 85ef22c2b29e..238c7a935586 100644
--- a/xen/include/xen/altp2m.h
+++ b/xen/include/xen/altp2m.h
@@ -13,13 +13,11 @@
  * regardless of CONFIG_ALTP2M
  */
=20
-#ifdef CONFIG_X86
 /* Initialize altp2m views */
 int altp2m_init(struct domain *d);
=20
 /* Free altp2m views */
 void altp2m_teardown(struct domain *d);
-#endif
=20
 #ifdef CONFIG_ALTP2M
=20
--=20
2.34.1


