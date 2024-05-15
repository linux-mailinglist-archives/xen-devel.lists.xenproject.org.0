Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4F28C636D
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 11:10:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722045.1125869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7AeW-00046i-DH; Wed, 15 May 2024 09:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722045.1125869; Wed, 15 May 2024 09:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7AeW-00043x-AS; Wed, 15 May 2024 09:10:24 +0000
Received: by outflank-mailman (input) for mailman id 722045;
 Wed, 15 May 2024 09:10:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJut=MS=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1s7AeV-0002ND-0n
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 09:10:23 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3a04abb-129a-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 11:10:21 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id F0DCA35309;
 Wed, 15 May 2024 05:10:18 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id E724035308;
 Wed, 15 May 2024 05:10:18 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id EB06535307;
 Wed, 15 May 2024 05:10:17 -0400 (EDT)
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
X-Inumbo-ID: f3a04abb-129a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=f44NE1zYxVTaI52BPRLBMRpI7
	SYEqvO5KN8XxTWD4lc=; b=L5ANc3ibwOg99vpedtd13LOXpq8+AHFs/mozX2pID
	Ly25w6xMYD0VQvBKjxlo6a6MLcrePO6FIhfHZ2XSW7DbwTcKLWbcM/5iN5fSm0co
	U6uggbJqays0D3L3dM90Ly+riCR8YJ8d8Zvmi2OoSptqmAVtrJYActm/Jec9F15v
	WM=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: [XEN PATCH v2 06/15] x86/p2m: guard altp2m code with CONFIG_ALTP2M option
Date: Wed, 15 May 2024 12:10:16 +0300
Message-Id: <7a6980b1c67dedb306985f73afb23db359771e8f.1715761386.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 F2D1549E-129A-11EF-A0C8-25B3960A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

Instead of using generic CONFIG_HVM option switch to a bit more specific
CONFIG_ALTP2M option for altp2m support. Also guard altp2m routines, so t=
hat
they can be disabled completely in the build -- when target platform does=
 not
actually support altp2m (AMD-V & ARM as of now).

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Tamas K Lengyel <tamas@tklengyel.com>
---
changes in v2:
 - use separate CONFIG_ALTP2M option instead of CONFIG_VMX
---
 xen/arch/x86/include/asm/altp2m.h  |  5 ++++-
 xen/arch/x86/include/asm/hvm/hvm.h |  2 +-
 xen/arch/x86/include/asm/p2m.h     | 17 ++++++++++++++++-
 xen/arch/x86/mm/Makefile           |  2 +-
 4 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm=
/altp2m.h
index e5e59cbd68..092b13e231 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -7,7 +7,7 @@
 #ifndef __ASM_X86_ALTP2M_H
 #define __ASM_X86_ALTP2M_H
=20
-#ifdef CONFIG_HVM
+#ifdef CONFIG_ALTP2M
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
index 0c9e6f1564..4f03dd7af8 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -670,7 +670,7 @@ static inline bool hvm_hap_supported(void)
 /* returns true if hardware supports alternate p2m's */
 static inline bool hvm_altp2m_supported(void)
 {
-    return hvm_funcs.caps.altp2m;
+    return IS_ENABLED(CONFIG_ALTP2M) && hvm_funcs.caps.altp2m;
 }
=20
 /* Returns true if we have the minimum hardware requirements for nested =
virt */
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2=
m.h
index 111badf89a..855e69d24a 100644
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
+#ifdef CONFIG_ALTP2M
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
@@ -909,8 +918,14 @@ static inline bool p2m_set_altp2m(struct vcpu *v, un=
signed int idx)
 /* Switch alternate p2m for a single vcpu */
 bool p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsigned int idx);
=20
+#ifdef CONFIG_ALTP2M
 /* Check to see if vcpu should be switched to a different p2m. */
 void p2m_altp2m_check(struct vcpu *v, uint16_t idx);
+#else
+static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
+{
+}
+#endif
=20
 /* Flush all the alternate p2m's for a domain */
 void p2m_flush_altp2m(struct domain *d);
diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
index 0128ca7ab6..d7d57b8190 100644
--- a/xen/arch/x86/mm/Makefile
+++ b/xen/arch/x86/mm/Makefile
@@ -1,7 +1,7 @@
 obj-y +=3D shadow/
 obj-$(CONFIG_HVM) +=3D hap/
=20
-obj-$(CONFIG_HVM) +=3D altp2m.o
+obj-$(CONFIG_ALTP2M) +=3D altp2m.o
 obj-$(CONFIG_HVM) +=3D guest_walk_2.o guest_walk_3.o guest_walk_4.o
 obj-$(CONFIG_SHADOW_PAGING) +=3D guest_walk_4.o
 obj-$(CONFIG_MEM_ACCESS) +=3D mem_access.o
--=20
2.25.1


