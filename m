Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D51948A63C3
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 08:31:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706624.1103888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcLv-0004Fj-84; Tue, 16 Apr 2024 06:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706624.1103888; Tue, 16 Apr 2024 06:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcLv-0004Ci-5G; Tue, 16 Apr 2024 06:31:35 +0000
Received: by outflank-mailman (input) for mailman id 706624;
 Tue, 16 Apr 2024 06:31:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uDI1=LV=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1rwcLt-0004CA-LU
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 06:31:33 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5a1d601-fbba-11ee-b909-491648fe20b8;
 Tue, 16 Apr 2024 08:31:32 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 1E2CD3654E;
 Tue, 16 Apr 2024 02:31:29 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 0AA0E3654D;
 Tue, 16 Apr 2024 02:31:29 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id E54993654C;
 Tue, 16 Apr 2024 02:31:24 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: f5a1d601-fbba-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=rS/UZ+/PSV3QRa1QCAslyBy27wJqULa/1N2ijCmPfxw=; b=CH+2
	PeUFlqfloks1QIAFx91lvy9NFEbmUvuJzKnCyGd+lfdKkZqV9jXOiaVir/0hh2SG
	aF2alDFT4fGolJyZwEx+aKZeC14/fGl4m/7VIZlWubFCLL+D6SLcMxqm1xaaI3FY
	6FIW4dZrfBxxv5jTxRFrZlCouyGlGT5b8HPMRNI=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 06/15] x86/p2m: guard altp2m code with CONFIG_VMX option
Date: Tue, 16 Apr 2024 09:31:21 +0300
Message-Id: <20240416063121.3469245-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 F2B5BBB8-FBBA-11EE-A681-F515D2CDFF5E-90055647!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable

Instead of using generic CONFIG_HVM option switch to a bit more specific
CONFIG_VMX option for altp2m support, as it depends on VMX. Also guard
altp2m routines, so that it can be disabled completely in the build.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/include/asm/altp2m.h  |  5 ++++-
 xen/arch/x86/include/asm/hvm/hvm.h |  7 +++++++
 xen/arch/x86/include/asm/p2m.h     | 18 +++++++++++++++++-
 xen/arch/x86/mm/Makefile           |  2 +-
 4 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm=
/altp2m.h
index e5e59cbd68..03613dc246 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -7,7 +7,7 @@
 #ifndef __ASM_X86_ALTP2M_H
 #define __ASM_X86_ALTP2M_H
=20
-#ifdef CONFIG_HVM
+#ifdef CONFIG_VMX
=20
 #include <xen/types.h>
 #include <xen/sched.h>         /* for struct vcpu, struct domain */
@@ -38,7 +38,10 @@ static inline bool altp2m_active(const struct domain *=
d)
 }
=20
 /* Only declaration is needed. DCE will optimise it out when linking. */
+void altp2m_vcpu_initialise(struct vcpu *v);
+void altp2m_vcpu_destroy(struct vcpu *v);
 uint16_t altp2m_vcpu_idx(const struct vcpu *v);
+int altp2m_vcpu_enable_ve(struct vcpu *v, gfn_t gfn);
 void altp2m_vcpu_disable_ve(struct vcpu *v);
=20
 #endif
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/as=
m/hvm/hvm.h
index 87a6935d97..870ebf3d3a 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -648,11 +648,18 @@ static inline bool hvm_hap_supported(void)
     return hvm_funcs.caps.hap;
 }
=20
+#ifdef CONFIX_VMX
 /* returns true if hardware supports alternate p2m's */
 static inline bool hvm_altp2m_supported(void)
 {
     return hvm_funcs.caps.altp2m;
 }
+#else
+static inline bool hvm_altp2m_supported(void)
+{
+    return false;
+}
+#endif
=20
 /* updates the current hardware p2m */
 static inline void altp2m_vcpu_update_p2m(struct vcpu *v)
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2=
m.h
index 111badf89a..0b2da1fd05 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -581,9 +581,9 @@ static inline gfn_t mfn_to_gfn(const struct domain *d=
, mfn_t mfn)
         return _gfn(mfn_x(mfn));
 }
=20
-#ifdef CONFIG_HVM
 #define AP2MGET_prepopulate true
 #define AP2MGET_query false
+#ifdef CONFIG_VMX
=20
 /*
  * Looks up altp2m entry. If the entry is not found it looks up the entr=
y in
@@ -593,6 +593,15 @@ static inline gfn_t mfn_to_gfn(const struct domain *=
d, mfn_t mfn)
 int altp2m_get_effective_entry(struct p2m_domain *ap2m, gfn_t gfn, mfn_t=
 *mfn,
                                p2m_type_t *t, p2m_access_t *a,
                                bool prepopulate);
+#else
+static inline int altp2m_get_effective_entry(struct p2m_domain *ap2m,
+                                             gfn_t gfn, mfn_t *mfn,
+                                             p2m_type_t *t, p2m_access_t=
 *a,
+                                             bool prepopulate)
+{
+    ASSERT_UNREACHABLE();
+    return -EOPNOTSUPP;
+}
 #endif
=20
 /* Init the datastructures for later use by the p2m code */
@@ -909,8 +918,15 @@ static inline bool p2m_set_altp2m(struct vcpu *v, un=
signed int idx)
 /* Switch alternate p2m for a single vcpu */
 bool p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsigned int idx);
=20
+#ifdef CONFIG_VMX
 /* Check to see if vcpu should be switched to a different p2m. */
 void p2m_altp2m_check(struct vcpu *v, uint16_t idx);
+#else
+static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
+{
+    /* Not supported w/o VMX */
+}
+#endif
=20
 /* Flush all the alternate p2m's for a domain */
 void p2m_flush_altp2m(struct domain *d);
diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
index 92168290a8..3af992a6e9 100644
--- a/xen/arch/x86/mm/Makefile
+++ b/xen/arch/x86/mm/Makefile
@@ -1,7 +1,7 @@
 obj-y +=3D shadow/
 obj-$(CONFIG_HVM) +=3D hap/
=20
-obj-$(CONFIG_HVM) +=3D altp2m.o
+obj-$(CONFIG_VMX) +=3D altp2m.o
 obj-$(CONFIG_HVM) +=3D guest_walk_2.o guest_walk_3.o guest_walk_4.o
 obj-$(CONFIG_SHADOW_PAGING) +=3D guest_walk_4.o
 obj-$(CONFIG_MEM_ACCESS) +=3D mem_access.o
--=20
2.25.1


