Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNTOHeSL5mmZyAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24364433AF0
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286484.1567624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBO-00044G-M9; Mon, 20 Apr 2026 20:25:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286484.1567624; Mon, 20 Apr 2026 20:25:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBO-0003nl-1J; Mon, 20 Apr 2026 20:25:26 +0000
Received: by outflank-mailman (input) for mailman id 1286484;
 Mon, 20 Apr 2026 19:50:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEue2-0006Iu-5y
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:50:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEue1-00C1UM-J9
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:50:57 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e6836e-e002-0a2a0a5209dd-0a2a45049232-14
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:57 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e683a0-1dec-0a2a45040019-22cac1c5d21a-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:57 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -306608446; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 19:50:52 +0000 (UTC)
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
DKIM-Signature: a=rsa-sha256; b=nh/3b739kWlXbEwQ2vP9czBWHaEbT/ciL86qmTDx6PuvJ+UpniIuY8UJrFKr2PwwUhUiPGSSEczTs41M23Zlfs4niXXVQbror/q+RTI2hk/T2WOqGQmNYOyRzx460DUaErPhDvSeTwD43H62YE9iDKbdPE1iQ1eUGlPgne5bznGbcaUlOw0kezmUZ0odpV5RwLDCTktOx7pXJUacyjq1o5Tj4ssUrap4R9ALb/QUn4U0S4XcU/+xtwc+wsI4Fig2YZN930DTmWfr7zNNe4AyZkexb0DW7KjSjoFoLmR5APvSldDgzZVH6FMzHiuP559t41sK5tUViqDbh7Am/1EkaQ==; s=purelymail1; d=purelymail.com; v=1; bh=2CcuIQJepfXS1zs62wK057xIURAv8ZCI9/irpntDfIw=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 685805:22403:null:purelymail
X-Pm-Original-To: xen-devel@lists.xenproject.org
From: Rose.Spangler@purelymail.com
To: xen-devel@lists.xenproject.org
Cc: Rose Spangler <Rose.Spangler@elektrobit.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [RFC PATCH v6 13/43] x86/altp2m: Add lock functions accessible from common code
Date: Mon, 20 Apr 2026 15:50:12 -0400
Message-Id: <20260420195042.207624-14-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
References: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-ebf023/1776714657-2A7613FF-26D3FBF8/0/0
X-purgate-type: clean
X-purgate-size: 6637
X-Spamd-Result: default: False [3.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[purelymail.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[purelymail.com:s=purelymail1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.873];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[purelymail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 24364433AF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rose Spangler <Rose.Spangler@elektrobit.com>

This commit adds three altp2m_lock functions which wrap the corresponding
altp2m_list_lock functions present in "mm-locks.h". The "mm-locks.h" file
is only accessible in x86 code. In order to make altp2m common across
architectures, it must be possible to acquire the altp2m lock without
including an x86-specific header file.

These functions cannot be static inline like their "mm-locks.h"
counterparts, since "mm-locks.h" is only included in source files, not
header files. Therefore, these functions might introduce a slight function
call overhead over their "mm-locks.h" counterparts. However, the altp2m
lock is mostly used in init/teardown routines and HVMOP implementations.
For these cases, the altp2m_list_lock functions have been switched out for
the altp2m_lock functions so they can be later migrated to common code. The
only other function using the altp2m lock is altp2m_get_or_propagate, which
is in the hot path of the page fault handler, so the altp2m_list_lock calls
have not been replaced for that function.

This is commit 2/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.

    This seems like the solution which makes the most sense here, but it
    would be nicer if it could be static inline. I'm also not sure if the
    "mm-locks.h" functions are really supposed to be exposed outside of
    their translation unit like this, so feedback on this is appreciated.
---
 xen/arch/x86/include/asm/altp2m.h |  4 +++
 xen/arch/x86/mm/altp2m.c          | 42 ++++++++++++++++++++-----------
 2 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/a=
ltp2m.h
index 9c58a396448d..7cff40beb7c6 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -156,6 +156,10 @@ int p2m_set_suppress_ve_multi(struct domain *d,
 int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,
                         unsigned int altp2m_idx);
=20
+void altp2m_lock_init(struct domain *d);
+void altp2m_lock(struct domain *d);
+void altp2m_unlock(struct domain *d);
+
 #else
=20
 static inline bool altp2m_is_eptp_valid(const struct domain *d,
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 2dc84b76b8c1..371bf3f0b8d4 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -129,7 +129,7 @@ int altp2m_init(struct domain *d)
     struct p2m_domain *p2m;
     struct p2m_domain *hostp2m =3D p2m_get_hostp2m(d);
=20
-    mm_lock_init(&d->arch.altp2m_list_lock);
+    altp2m_lock_init(d);
     d->altp2m_p2m =3D xvzalloc_array(struct p2m_domain *, d->nr_altp2m);
=20
     if ( !d->altp2m_p2m )
@@ -221,7 +221,7 @@ bool altp2m_switch_vcpu_by_id(struct vcpu *v, unsigned =
int idx)
     if ( idx >=3D d->nr_altp2m )
         return rc;
=20
-    altp2m_list_lock(d);
+    altp2m_lock(d);
=20
     if ( d->arch.altp2m_eptp[idx] !=3D mfn_x(INVALID_MFN) )
     {
@@ -230,7 +230,7 @@ bool altp2m_switch_vcpu_by_id(struct vcpu *v, unsigned =
int idx)
         rc =3D 1;
     }
=20
-    altp2m_list_unlock(d);
+    altp2m_unlock(d);
     return rc;
 }
=20
@@ -348,7 +348,7 @@ void altp2m_flush(struct domain *d)
 {
     unsigned int i;
=20
-    altp2m_list_lock(d);
+    altp2m_lock(d);
=20
     for ( i =3D 0; i < d->nr_altp2m; i++ )
     {
@@ -357,7 +357,7 @@ void altp2m_flush(struct domain *d)
         d->arch.altp2m_visible_eptp[i] =3D mfn_x(INVALID_MFN);
     }
=20
-    altp2m_list_unlock(d);
+    altp2m_unlock(d);
 }
=20
 static int altp2m_activate_altp2m(struct domain *d, unsigned int idx,
@@ -409,13 +409,13 @@ int altp2m_init_by_id(struct domain *d, unsigned int =
idx)
     if ( idx >=3D d->nr_altp2m )
         return rc;
=20
-    altp2m_list_lock(d);
+    altp2m_lock(d);
=20
     if ( d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] =3D=3D
          mfn_x(INVALID_MFN) )
         rc =3D altp2m_activate_altp2m(d, idx, hostp2m->default_access);
=20
-    altp2m_list_unlock(d);
+    altp2m_unlock(d);
     return rc;
 }
=20
@@ -431,7 +431,7 @@ int altp2m_init_next_available(struct domain *d, uint16=
_t *idx,
          !xenmem_access_to_p2m_access(hostp2m, hvmmem_default_access, &a) =
)
         return rc;
=20
-    altp2m_list_lock(d);
+    altp2m_lock(d);
=20
     for ( i =3D 0; i < d->nr_altp2m; i++ )
     {
@@ -446,7 +446,7 @@ int altp2m_init_next_available(struct domain *d, uint16=
_t *idx,
         break;
     }
=20
-    altp2m_list_unlock(d);
+    altp2m_unlock(d);
     return rc;
 }
=20
@@ -463,7 +463,7 @@ int altp2m_destroy_by_id(struct domain *d, unsigned int=
 idx)
         return rc;
=20
     rc =3D -EBUSY;
-    altp2m_list_lock(d);
+    altp2m_lock(d);
=20
     if ( d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] !=3D
          mfn_x(INVALID_MFN) )
@@ -481,7 +481,7 @@ int altp2m_destroy_by_id(struct domain *d, unsigned int=
 idx)
         }
     }
=20
-    altp2m_list_unlock(d);
+    altp2m_unlock(d);
=20
     domain_unpause_except_self(d);
=20
@@ -501,7 +501,7 @@ int altp2m_switch_domain_altp2m_by_id(struct domain *d,=
 unsigned int idx)
         return rc;
=20
     rc =3D -EINVAL;
-    altp2m_list_lock(d);
+    altp2m_lock(d);
=20
     if ( d->arch.altp2m_visible_eptp[idx] !=3D mfn_x(INVALID_MFN) )
     {
@@ -512,7 +512,7 @@ int altp2m_switch_domain_altp2m_by_id(struct domain *d,=
 unsigned int idx)
         rc =3D 0;
     }
=20
-    altp2m_list_unlock(d);
+    altp2m_unlock(d);
=20
     domain_unpause_except_self(d);
=20
@@ -773,7 +773,7 @@ int altp2m_set_view_visibility(struct domain *d, unsign=
ed int altp2m_idx,
 {
     int rc =3D 0;
=20
-    altp2m_list_lock(d);
+    altp2m_lock(d);
=20
     if ( !altp2m_is_eptp_valid(d, altp2m_idx) )
         rc =3D -EINVAL;
@@ -784,11 +784,23 @@ int altp2m_set_view_visibility(struct domain *d, unsi=
gned int altp2m_idx,
         d->arch.altp2m_visible_eptp[array_index_nospec(altp2m_idx, MAX_EPT=
P)] =3D
             mfn_x(INVALID_MFN);
=20
-    altp2m_list_unlock(d);
+    altp2m_unlock(d);
=20
     return rc;
 }
=20
+void altp2m_lock_init(struct domain *d) {
+    mm_lock_init(&d->arch.altp2m_list_lock);
+}
+
+void altp2m_lock(struct domain *d) {
+    altp2m_list_lock(d);
+}
+
+void altp2m_unlock(struct domain *d) {
+    altp2m_list_unlock(d);
+}
+
 /*
  * Local variables:
  * mode: C
--=20
2.34.1


