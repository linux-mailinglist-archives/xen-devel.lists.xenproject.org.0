Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFepCeSL5mmbyAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BC3433AD3
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286523.1567753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBw-0002SI-OZ; Mon, 20 Apr 2026 20:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286523.1567753; Mon, 20 Apr 2026 20:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBv-0001wv-7o; Mon, 20 Apr 2026 20:25:59 +0000
Received: by outflank-mailman (input) for mailman id 1286523;
 Mon, 20 Apr 2026 20:20:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEv6h-0001fD-7U
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 20:20:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEv6g-00C4rw-6h
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 22:20:34 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e68a53-2eae-0a2a0a5409dd-0a2a45088fc8-46
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 22:20:34 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e68a91-63b5-0a2a45080019-22cac1c5b4ee-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 22:20:34 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1875363766; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 20:20:32 +0000 (UTC)
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
DKIM-Signature: a=rsa-sha256; b=X7BlSDaHD2ZN34svscwHtzMfbiMmT2qfzrjzlITnOA5z8VSmdQKwqfWkynM2turRCGNeCrBLyGZjTriSpJwaldmF2rhgB/hqeKX60WflFBuQLptyO9atGRXWlwuCqwO/xnhV1MCnMlATCPvWbEzuoVCpK7XhQXPYqMzHCWLEEVYZg3LN/GMEbHhvVbQAqaQK44vcJlYg3JDtW1OiduhgOQpWqvqU03EDFMoJIY7vOsOQWx7OlShlCkH63nNJ4R5aMgQWZfJY8OU/YyfyJTR06sp19FDM9ahqc1nxiZtaoOynBRvdn9ohRjgiQ0OwaFvovQUKbXm54bMfDpbozylzHw==; s=purelymail1; d=purelymail.com; v=1; bh=Kv6dybNvgNtP37AvVC3V395nXDoMWOm3zuegSLm3PkU=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 685805:22403:null:purelymail
X-Pm-Original-To: xen-devel@lists.xenproject.org
From: Rose.Spangler@purelymail.com
To: xen-devel@lists.xenproject.org
Cc: Rose Spangler <Rose.Spangler@elektrobit.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH v6 30/43] arm/altp2m: Add altp2m view validity/visibility indicator
Date: Mon, 20 Apr 2026 16:20:13 -0400
Message-Id: <20260420202026.208110-2-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420202026.208110-1-Rose.Spangler@purelymail.com>
References: <20260420202026.208110-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-c1860d/1776716434-C357FDB1-F7CE8E96/0/0
X-purgate-type: clean
X-purgate-size: 5580
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[purelymail.com:-];
	FROM_NO_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.880];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: C7BC3433AD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rose Spangler <Rose.Spangler@elektrobit.com>

This commit adds the altp2m_view_state enum, which indicates whether an
altp2m view is invalid, visible, or invisible. The altp2m_state array is
comprised of altp2m_view_state values, where each entry corresponds to the
altp2m view with the same entry. This is analogous to the altp2m_eptp and
altp2m_visible_eptp arrays on x86.

This addition is necessary to tell whether an altp2m is valid, in addition
to whether it is visible. Since all altp2m views are allocated up-front
during p2m initialization, there must be an additional mechanism to
determine whether an altp2m view is valid. Since the implementation of
HVMOP_altp2m_set_visibility also needs an additional mechanism to determine
whether a view is visible, it makes sense to combine altp2m view validity
and visibility into a single mechanism. Therefore, the altp2m_state array
is used to track both view validitity and visibility.

This is commit 1/5 of the altp2m view validity/visibility phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.

    In the v4/v5 patch series, view validity was determined by simply
    checking if the altp2m p2m_domain pointer is NULL. This isn't possible
    in the v6 patch series, since altp2m views are allocated up-front
    during altp2m_init.

    Since the altp2m_view_state enum definition has to be available in
    asm/domain.h, this commit removes the sched.h dependency from altp2m.h.
    Unfortunately, this means that it's not possible to have static inline
    functions in altp2m.h which need a complete definition of arch_domain
    and arch_vcpu. If there would be a better place to put the
    altp2m_view_state definition, feedback would be appreciated.
---
 xen/arch/arm/altp2m.c             | 13 +++++++++++++
 xen/arch/arm/include/asm/altp2m.h | 23 +++++++++++++----------
 xen/arch/arm/include/asm/domain.h |  4 ++++
 xen/arch/arm/mmu/p2m.c            | 14 +++++++++++++-
 4 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/altp2m.c b/xen/arch/arm/altp2m.c
index 339f82835caf..e741648ff5a1 100644
--- a/xen/arch/arm/altp2m.c
+++ b/xen/arch/arm/altp2m.c
@@ -5,6 +5,8 @@
  * Copyright (c) 2016 Sergej Proskurin <proskurin@sec.in.tum.de>
  */
=20
+#include <xen/sched.h>
+
 #include <asm/p2m.h>
=20
 /* Check to see if vcpu should be switched to a different p2m. */
@@ -14,6 +16,17 @@ void altp2m_check(struct vcpu *v, uint16_t idx)
     BUG();
 }
=20
+/* Alternate p2m VCPU */
+uint16_t altp2m_vcpu_idx(const struct vcpu *v)
+{
+    return v->arch.ap2m_idx;
+}
+
+void altp2m_set_vcpu_idx(struct vcpu *v, unsigned int idx)
+{
+    v->arch.ap2m_idx =3D idx;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/altp2m.h b/xen/arch/arm/include/asm/a=
ltp2m.h
index f001e022a213..05beb7f698a7 100644
--- a/xen/arch/arm/include/asm/altp2m.h
+++ b/xen/arch/arm/include/asm/altp2m.h
@@ -9,7 +9,10 @@
 #ifndef __ASM_ARM_ALTP2M_H
 #define __ASM_ARM_ALTP2M_H
=20
-#include <xen/sched.h>
+#include <xen/mem_access.h>
+
+struct domain;
+struct vcpu;
=20
 #ifdef CONFIG_ALTP2M
=20
@@ -24,15 +27,15 @@ static inline bool altp2m_supported(void)
 #define altp2m_unlock(d)    spin_unlock(&(d)->arch.altp2m_lock)
=20
 /* Alternate p2m VCPU */
-static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
-{
-    return v->arch.ap2m_idx;
-}
-
-static inline void altp2m_set_vcpu_idx(struct vcpu *v, unsigned int idx)
-{
-    v->arch.ap2m_idx =3D idx;
-}
+uint16_t altp2m_vcpu_idx(const struct vcpu *v);
+void altp2m_set_vcpu_idx(struct vcpu *v, unsigned int idx);
+
+/* The current state of an altp2m view */
+enum altp2m_view_state {
+    ALTP2M_INVALID,
+    ALTP2M_VISIBLE,
+    ALTP2M_INVISIBLE,
+};
=20
 #else /* CONFIG_ALTP2M */
=20
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/d=
omain.h
index 4d497a21b648..28533b08db1f 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -3,6 +3,7 @@
=20
 #include <xen/cache.h>
 #include <xen/timer.h>
+#include <asm/altp2m.h>
 #include <asm/page.h>
 #include <asm/p2m.h>
 #include <asm/suspend.h>
@@ -135,6 +136,9 @@ struct arch_domain
      * concurrently.
      */
     spinlock_t altp2m_lock;
+
+    /* Validity/visibility of altp2m views */
+    enum altp2m_view_state *altp2m_state;
 #endif
 }  __cacheline_aligned;
=20
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 04d17e787259..7c23995f8074 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1494,6 +1494,8 @@ int p2m_teardown(struct domain *d)
=20
     d->altp2m_active =3D false;
=20
+    FREE_XENHEAP_PAGE(d->arch.altp2m_state);
+
     for ( i =3D 0; i < d->nr_altp2m; i++ )
     {
         rc =3D p2m_teardown_one(d->altp2m_p2m[i]);
@@ -1617,7 +1619,7 @@ struct p2m_domain *p2m_init_one(struct domain *d)
 static int p2m_init_altp2m(struct domain *d)
 {
 #ifdef CONFIG_ALTP2M
-    int rc;
+    int rc, i;
=20
     rc =3D altp2m_init(d);
     if ( rc )
@@ -1626,6 +1628,16 @@ static int p2m_init_altp2m(struct domain *d)
         return rc;
     }
=20
+    if ( (d->arch.altp2m_state =3D alloc_xenheap_page()) =3D=3D NULL )
+    {
+        return -ENOMEM;
+    }
+
+    for ( i =3D 0; i < d->nr_altp2m; i++ )
+    {
+        d->arch.altp2m_state[i] =3D ALTP2M_INVALID;
+    }
+
     d->altp2m_active =3D false;
 #endif
=20
--=20
2.34.1


