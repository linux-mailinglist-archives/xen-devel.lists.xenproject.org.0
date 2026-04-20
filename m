Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WK7XIeWL5mmZyAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C202433B47
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286513.1567713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBn-0000D9-A2; Mon, 20 Apr 2026 20:25:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286513.1567713; Mon, 20 Apr 2026 20:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBk-00088v-Ql; Mon, 20 Apr 2026 20:25:48 +0000
Received: by outflank-mailman (input) for mailman id 1286513;
 Mon, 20 Apr 2026 19:55:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEui5-0006VB-U5
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:55:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEui5-00C0mN-B4
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:55:09 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e6849d-5cb7-0a2a0a5109dd-0a2a450bd69e-2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:55:09 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e683ab-212f-0a2a450b0019-22cac1c5c2e8-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:51:08 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -306608446; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 19:50:58 +0000 (UTC)
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
DKIM-Signature: a=rsa-sha256; b=G8Au/F7w0kr3yWBN493bKoUzi1aJp5ehASYi4BlnUh6gTILN9XNytRgGapOi7MBFApd8IY5pvk4fGWY7FmNiOdKTP3NFVO+EVEVwOKjasT+Pi5mMEkubMSLcxQJj/QtiILUpuLEtAiQK/+wab7YXBiO7jPtJfWQ95xa5JzwwrkiIhxOjhmFPSFMgRE5R3R+TbmS35xpSYX5JTAXMoQSIO2ZL3QsYCw/RVEoau4CHHuV8Ely0Q1pwwo36pTfdPYZWCJUy/yxpWYpfiqoaP0bIhU6HY6WbbejJpCdA5neGJGo2D2WCi3SRI51XOBnov+kYae9EDSlUHk+A0KRdFT597A==; s=purelymail1; d=purelymail.com; v=1; bh=3WaQvrna8zsFCyA45arxMyrce2HZKSIAvzQk5fZ8kuY=; h=Feedback-ID:Received:From:To:Subject:Date;
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
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH v6 24/43] altp2m: Move altp2m_{get,set}_altp2m to common code
Date: Mon, 20 Apr 2026 15:50:23 -0400
Message-Id: <20260420195042.207624-25-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
References: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-42698a/1776714668-246B7F3B-BCC1441B/13/0
X-purgate-type: clean
X-purgate-size: 5177
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[purelymail.com:-];
	FROM_NO_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.886];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 3C202433B47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rose Spangler <Rose.Spangler@elektrobit.com>

This commit moves the altp2m_get_altp2m and altp2m_set_altp2m functions to
the common code. This make sit possible to use them in other common
routines (namely, altp2m_vcpu_{initialise,destroy}).

This commit contains only code movement, and no change in functionality is
intended.

This is commit 1/4 of the altp2m_{get,set}_altp2m phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/include/asm/altp2m.h | 35 -------------------------
 xen/arch/x86/include/asm/domain.h |  2 --
 xen/common/altp2m.c               |  1 -
 xen/include/xen/altp2m.h          | 43 +++++++++++++++++++++++++++++++
 4 files changed, 43 insertions(+), 38 deletions(-)

diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/a=
ltp2m.h
index 13017525a62f..a1b078783b3e 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -64,39 +64,6 @@ static inline uint16_t altp2m_vcpu_idx(const struct vcpu=
 *v)
  * Alternate p2m: shadow p2m tables used for alternate memory views
  */
=20
-/* get current alternate p2m table */
-static inline struct p2m_domain *altp2m_get_altp2m(struct vcpu *v)
-{
-    unsigned int index =3D vcpu_altp2m(v).p2midx;
-
-    if ( index =3D=3D INVALID_ALTP2M )
-        return NULL;
-
-    BUG_ON(index >=3D v->domain->nr_altp2m);
-
-    return v->domain->altp2m_p2m[index];
-}
-
-/* set current alternate p2m table */
-static inline bool altp2m_set_altp2m(struct vcpu *v, unsigned int idx)
-{
-    struct p2m_domain *orig;
-
-    BUG_ON(idx >=3D v->domain->nr_altp2m);
-
-    if ( idx =3D=3D vcpu_altp2m(v).p2midx )
-        return false;
-
-    orig =3D altp2m_get_altp2m(v);
-    BUG_ON(!orig);
-    atomic_dec(&orig->active_vcpus);
-
-    vcpu_altp2m(v).p2midx =3D idx;
-    atomic_inc(&v->domain->altp2m_p2m[idx]->active_vcpus);
-
-    return true;
-}
-
 /* Switch alternate p2m for a single vcpu */
 bool altp2m_switch_vcpu_by_id(struct vcpu *v, unsigned int idx);
=20
@@ -178,8 +145,6 @@ static inline int _altp2m_get_effective_entry(struct p2=
m_domain *ap2m,
         _altp2m_get_effective_entry(ap2m, gfn, mfn, t, a)
=20
 /* Only declaration is needed. DCE will optimise it out when linking. */
-struct p2m_domain *altp2m_get_altp2m(struct vcpu *v);
-bool altp2m_set_altp2m(struct vcpu *v, unsigned int idx);
 uint16_t altp2m_vcpu_idx(const struct vcpu *v);
 void altp2m_vcpu_initialise(struct vcpu *v);
 void altp2m_vcpu_destroy(struct vcpu *v);
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/d=
omain.h
index f8038087e612..72460e38f581 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -277,8 +277,6 @@ struct paging_vcpu {
 #define MAX_NR_ALTP2M   MAX_EPTP
 #define MAX_NESTEDP2M   10
=20
-#define INVALID_ALTP2M  0xffff
-
 struct p2m_domain;
 struct time_scale {
     int shift;
diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index 989d8bdcb923..a731ad7cdab8 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -5,7 +5,6 @@
 #include <xen/xvmalloc.h>
=20
 #include <asm/altp2m.h>
-#include <asm/p2m.h>
=20
 #include <public/hvm/params.h>
=20
diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
index 238c7a935586..58e74be6deb0 100644
--- a/xen/include/xen/altp2m.h
+++ b/xen/include/xen/altp2m.h
@@ -8,6 +8,10 @@
=20
 #include <public/hvm/hvm_op.h>
=20
+#include <asm/p2m.h>
+
+#define INVALID_ALTP2M  0xffff
+
 /*
  * Common alternate p2m declarations that need to be visible
  * regardless of CONFIG_ALTP2M
@@ -27,6 +31,41 @@ static inline bool altp2m_active(const struct domain *d)
     return d->altp2m_active;
 }
=20
+#ifdef CONFIG_X86
+/* get current alternate p2m table */
+static inline struct p2m_domain *altp2m_get_altp2m(struct vcpu *v)
+{
+    unsigned int index =3D vcpu_altp2m(v).p2midx;
+
+    if ( index =3D=3D INVALID_ALTP2M )
+        return NULL;
+
+    BUG_ON(index >=3D v->domain->nr_altp2m);
+
+    return v->domain->altp2m_p2m[index];
+}
+
+/* set current alternate p2m table */
+static inline bool altp2m_set_altp2m(struct vcpu *v, unsigned int idx)
+{
+    struct p2m_domain *orig;
+
+    BUG_ON(idx >=3D v->domain->nr_altp2m);
+
+    if ( idx =3D=3D vcpu_altp2m(v).p2midx )
+        return false;
+
+    orig =3D altp2m_get_altp2m(v);
+    BUG_ON(!orig);
+    atomic_dec(&orig->active_vcpus);
+
+    vcpu_altp2m(v).p2midx =3D idx;
+    atomic_inc(&v->domain->altp2m_p2m[idx]->active_vcpus);
+
+    return true;
+}
+#endif
+
 int do_altp2m_op(XEN_GUEST_HANDLE_PARAM(void) arg);
=20
 #else /* CONFIG_ALTP2M */
@@ -41,6 +80,10 @@ static inline int do_altp2m_op(XEN_GUEST_HANDLE_PARAM(vo=
id) arg)
     return -EOPNOTSUPP;
 }
=20
+/* Only declaration is needed. DCE will optimise it out when linking. */
+struct p2m_domain *altp2m_get_altp2m(struct vcpu *v);
+bool altp2m_set_altp2m(struct vcpu *v, unsigned int idx);
+
 #endif /* CONFIG_ALTP2M */
=20
 #endif /* __XEN_ALTP2M_H__ */
--=20
2.34.1


