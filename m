Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id U2oKI+SL5mmmyAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 197B9433AEA
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286468.1567525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBI-0001t7-Dm; Mon, 20 Apr 2026 20:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286468.1567525; Mon, 20 Apr 2026 20:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBI-0001pT-4W; Mon, 20 Apr 2026 20:25:20 +0000
Received: by outflank-mailman (input) for mailman id 1286468;
 Mon, 20 Apr 2026 19:50:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEudv-0006Fi-1P
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:50:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEudu-004tZC-ET
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:50:50 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e6836c-2eae-0a2a0a5409dd-0a2a4503b316-20
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:50 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e68399-672d-0a2a45030019-22cac1c5e3bc-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:50 +0200
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
DKIM-Signature: a=rsa-sha256; b=MmOQ5QAe41G+mdw+wA2MuMRrWAiWf7RNONJMHOx4I3iOvgsHJSBFN2fUuAoO9ibEODwfLeXYVGNQ1bvKt88DLz3cGN1qn6xc/h1RnWIUeTJS9DnkKxWWxxOW3B3bZdMF1bGVWReGOm+pesXQvbrD3JF3hBWz7HNM1KkvTnAVVGLVPod8A5/NquOFR38ciqu9o+0qc7LPqUNNm82mtfFbczL/d8eaJDLTe65v4uLO8I0Zqqi9XygoJxzjruV4PsBOy9WjeQRlD8n5THzERfkW8wIyWM0F7N3D8BlJ4rb+gyL7OnmFbGs7RBw40q7fzjITNVbwY8WxCv/aQgykXcBPNA==; s=purelymail1; d=purelymail.com; v=1; bh=2PvdWtImHt0iTtxQjPZi9MEx0U+dnWA9pNgCxK8uhgE=; h=Feedback-ID:Received:From:To:Subject:Date;
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
Subject: [RFC PATCH v6 02/43] altp2m: Move altp2m_active to common domain struct
Date: Mon, 20 Apr 2026 15:50:01 -0400
Message-Id: <20260420195042.207624-3-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
References: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-33051d/1776714650-A0975938-808CC524/0/0
X-purgate-type: clean
X-purgate-size: 10782
X-Spamd-Result: default: False [3.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[purelymail.com : SPF not aligned (relaxed),reject];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[purelymail.com:s=purelymail1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tamas@tklengyel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[purelymail.com:-];
	NEURAL_SPAM(0.00)[0.067];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 197B9433AEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rose Spangler <Rose.Spangler@elektrobit.com>

This commit moves altp2m_active from arch_domain on x86 to the common
domain struct. Similarly to nr_altp2m, this is not an arch-specific value.
Moving it to common code allows the common altp2m routines introduced later
in this patch series to operate on altp2m_active without needing an
altp2m_active member on arch_domain for each architecture supporting
altp2m.

This is commit 2/8 of the preparation phase.

This commit is a refactor, and no change in functionality is intended.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/hvm/emulate.c        |  1 +
 xen/arch/x86/hvm/hvm.c            | 11 ++++++-----
 xen/arch/x86/hvm/monitor.c        |  1 +
 xen/arch/x86/hvm/vmx/vmx.c        |  1 +
 xen/arch/x86/include/asm/altp2m.h | 11 -----------
 xen/arch/x86/include/asm/domain.h |  2 --
 xen/arch/x86/mm/altp2m.c          |  1 +
 xen/arch/x86/mm/hap/hap.c         |  5 +++--
 xen/arch/x86/mm/mem_access.c      |  1 +
 xen/arch/x86/mm/mem_sharing.c     |  1 +
 xen/arch/x86/mm/p2m-ept.c         |  1 +
 xen/arch/x86/mm/p2m-pt.c          |  1 +
 xen/arch/x86/mm/p2m.c             |  1 +
 xen/common/monitor.c              |  1 +
 xen/include/asm-generic/altp2m.h  |  8 --------
 xen/include/xen/altp2m.h          | 19 +++++++++++++++++++
 xen/include/xen/sched.h           |  2 ++
 17 files changed, 40 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index f3aae158e9f8..9a9b89a232e6 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -9,6 +9,7 @@
  *    Keir Fraser <keir@xen.org>
  */
=20
+#include <xen/altp2m.h>
 #include <xen/init.h>
 #include <xen/iocap.h>
 #include <xen/ioreq.h>
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4a81afce02e7..86c12c0d1ef4 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -7,6 +7,7 @@
  * Copyright (c) 2008, Citrix Systems, Inc.
  */
=20
+#include <xen/altp2m.h>
 #include <xen/console.h>
 #include <xen/cpu.h>
 #include <xen/domain.h>
@@ -4612,7 +4613,7 @@ static int do_altp2m_op(
=20
     if ( (a.cmd !=3D HVMOP_altp2m_get_domain_state) &&
          (a.cmd !=3D HVMOP_altp2m_set_domain_state) &&
-         !d->arch.altp2m_active )
+         !d->altp2m_active )
     {
         rc =3D -EOPNOTSUPP;
         goto out;
@@ -4657,11 +4658,11 @@ static int do_altp2m_op(
         if ( rc )
             break;
=20
-        ostate =3D d->arch.altp2m_active;
-        d->arch.altp2m_active =3D !!a.u.domain_state.state;
+        ostate =3D d->altp2m_active;
+        d->altp2m_active =3D !!a.u.domain_state.state;
=20
         /* If the alternate p2m state has changed, handle appropriately */
-        if ( d->arch.altp2m_active !=3D ostate &&
+        if ( d->altp2m_active !=3D ostate &&
              (ostate || !(rc =3D p2m_init_altp2m_by_id(d, 0))) )
         {
             for_each_vcpu( d, v )
@@ -4676,7 +4677,7 @@ static int do_altp2m_op(
                 p2m_flush_altp2m(d);
         }
         else if ( rc )
-            d->arch.altp2m_active =3D false;
+            d->altp2m_active =3D false;
=20
         domain_unpause_except_self(d);
         break;
diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
index d22a2e464460..84c1c2234ca9 100644
--- a/xen/arch/x86/hvm/monitor.c
+++ b/xen/arch/x86/hvm/monitor.c
@@ -22,6 +22,7 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
=20
+#include <xen/altp2m.h>
 #include <xen/vm_event.h>
 #include <xen/mem_access.h>
 #include <xen/monitor.h>
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 269ca5643346..ff895f7f9437 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2004, Intel Corporation.
  */
=20
+#include <xen/altp2m.h>
 #include <xen/domain_page.h>
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/a=
ltp2m.h
index 9c1ac3cc2676..ad5ded833a75 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -28,12 +28,6 @@ static inline bool altp2m_is_eptp_valid(const struct dom=
ain *d,
         mfn_x(INVALID_MFN);
 }
=20
-/* Alternate p2m HVM on/off per domain */
-static inline bool altp2m_active(const struct domain *d)
-{
-    return d->arch.altp2m_active;
-}
-
 static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
 {
     return vcpu_altp2m(v).p2midx;
@@ -64,11 +58,6 @@ static inline bool altp2m_is_eptp_valid(const struct dom=
ain *d,
     return false;
 }
=20
-static inline bool altp2m_active(const struct domain *d)
-{
-    return false;
-}
-
 /* Only declaration is needed. DCE will optimise it out when linking. */
 uint16_t altp2m_vcpu_idx(const struct vcpu *v);
 void altp2m_vcpu_initialise(struct vcpu *v);
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/d=
omain.h
index 385a6666dafa..0cf0c0d92087 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -368,8 +368,6 @@ struct arch_domain
     mm_lock_t nested_p2m_lock;
=20
 #ifdef CONFIG_ALTP2M
-    /* altp2m: allow multiple copies of host p2m */
-    bool altp2m_active;
     struct p2m_domain **altp2m_p2m;
     mm_lock_t altp2m_list_lock;
     uint64_t *altp2m_eptp;
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 0bc9b9ad2f52..08db8f37c1b1 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -8,6 +8,7 @@
 #include <asm/p2m.h>
 #include <asm/altp2m.h>
 #include <public/hvm/hvm_op.h>
+#include <xen/altp2m.h>
 #include <xen/event.h>
 #include <xen/xvmalloc.h>
 #include "mm-locks.h"
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 5ccb80bda5d3..3d563b3bc2d1 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -7,6 +7,7 @@
  * Parts of this code are Copyright (c) 2007 by XenSource Inc.
  */
=20
+#include <xen/altp2m.h>
 #include <xen/types.h>
 #include <xen/mm.h>
 #include <xen/trace.h>
@@ -528,7 +529,7 @@ int hap_enable(struct domain *d, u32 mode)
                goto out;
         }
=20
-        d->arch.altp2m_active =3D false;
+        d->altp2m_active =3D false;
     }
 #endif /* CONFIG_ALTP2M */
=20
@@ -595,7 +596,7 @@ void hap_teardown(struct domain *d, bool *preempted)
             for_each_vcpu ( d, v )
                 altp2m_vcpu_disable_ve(v);
=20
-        d->arch.altp2m_active =3D false;
+        d->altp2m_active =3D false;
=20
         FREE_XENHEAP_PAGE(d->arch.altp2m_eptp);
         FREE_XENHEAP_PAGE(d->arch.altp2m_visible_eptp);
diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index e55e53f44c78..a9d6b081a523 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -9,6 +9,7 @@
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
  */
=20
+#include <xen/altp2m.h>
 #include <xen/guest_access.h> /* copy_from_guest() */
 #include <xen/mem_access.h>
 #include <xen/nospec.h>
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 5c7a0ff30e8b..8319733b1bb6 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -8,6 +8,7 @@
  * Copyright (c) 2009 Citrix Systems, Inc. (Grzegorz Milos)
  */
=20
+#include <xen/altp2m.h>
 #include <xen/types.h>
 #include <xen/domain_page.h>
 #include <xen/event.h>
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index dfdbfa0afec8..ed850723f5fd 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2007, Intel Corporation.
  */
=20
+#include <xen/altp2m.h>
 #include <xen/domain_page.h>
 #include <xen/sched.h>
 #include <public/hvm/dm_op.h>
diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index 5a6ce2f8bc2e..17f38aac14d5 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -12,6 +12,7 @@
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
  */
=20
+#include <xen/altp2m.h>
 #include <xen/vm_event.h>
 #include <xen/event.h>
 #include <xen/trace.h>
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index fddecdf978ec..41517765c5ec 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -11,6 +11,7 @@
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
  */
=20
+#include <xen/altp2m.h>
 #include <xen/iommu.h>
 #include <xen/mem_access.h>
 #include <xen/vm_event.h>
diff --git a/xen/common/monitor.c b/xen/common/monitor.c
index d5c9ff1cbf8c..e758a3fea9f1 100644
--- a/xen/common/monitor.c
+++ b/xen/common/monitor.c
@@ -19,6 +19,7 @@
  * License along with this program; If not, see <http://www.gnu.org/licens=
es/>.
  */
=20
+#include <xen/altp2m.h>
 #include <xen/event.h>
 #include <xen/monitor.h>
 #include <xen/sched.h>
diff --git a/xen/include/asm-generic/altp2m.h b/xen/include/asm-generic/alt=
p2m.h
index 39865a842ab3..ecee6942f4e8 100644
--- a/xen/include/asm-generic/altp2m.h
+++ b/xen/include/asm-generic/altp2m.h
@@ -4,16 +4,8 @@
=20
 #include <xen/bug.h>
=20
-struct domain;
 struct vcpu;
=20
-/* Alternate p2m on/off per domain */
-static inline bool altp2m_active(const struct domain *d)
-{
-    /* Not implemented on GENERIC. */
-    return false;
-}
-
 /* Alternate p2m VCPU */
 static inline unsigned int altp2m_vcpu_idx(const struct vcpu *v)
 {
diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
index 520328fd3fa8..b3b21124dd7e 100644
--- a/xen/include/xen/altp2m.h
+++ b/xen/include/xen/altp2m.h
@@ -2,4 +2,23 @@
 #ifndef __XEN_ALTP2M_H__
 #define __XEN_ALTP2M_H__
=20
+#include <xen/sched.h>
+
+#ifdef CONFIG_ALTP2M
+
+/* Alternate p2m HVM on/off per domain */
+static inline bool altp2m_active(const struct domain *d)
+{
+    return d->altp2m_active;
+}
+
+#else /* CONFIG_ALTP2M */
+
+static inline bool altp2m_active(const struct domain *d)
+{
+    return false;
+}
+
+#endif /* CONFIG_ALTP2M */
+
 #endif /* __XEN_ALTP2M_H__ */
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 212c7d765c3e..458f2f260dd7 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -623,6 +623,8 @@ struct domain
     } monitor;
=20
 #ifdef CONFIG_ALTP2M
+    /* altp2m: allow multiple copies of host p2m */
+    bool altp2m_active;
     unsigned int nr_altp2m;    /* Number of altp2m tables. */
 #endif
=20
--=20
2.34.1


