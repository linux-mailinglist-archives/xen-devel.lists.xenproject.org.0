Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FFD8D80A3
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 13:14:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734821.1140911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5df-0001r7-QT; Mon, 03 Jun 2024 11:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734821.1140911; Mon, 03 Jun 2024 11:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5df-0001nT-N3; Mon, 03 Jun 2024 11:14:07 +0000
Received: by outflank-mailman (input) for mailman id 734821;
 Mon, 03 Jun 2024 11:14:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G0SM=NF=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sE5de-0001nH-1h
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 11:14:06 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6235b457-219a-11ef-b4bb-af5377834399;
 Mon, 03 Jun 2024 13:14:03 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 49F4F31605;
 Mon,  3 Jun 2024 07:14:02 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 42AD331604;
 Mon,  3 Jun 2024 07:14:02 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 485B631602;
 Mon,  3 Jun 2024 07:13:59 -0400 (EDT)
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
X-Inumbo-ID: 6235b457-219a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=Z5+rlrFJma8dHA+2EwttZvn1p
	HBH3Y8OD11pFDMz7uM=; b=ZwfXE+GKfiW/cqvlAy9rG4L2Sp7zddb9G/HLsxVgH
	MQU1KWc2I54tdUx8TPwdw52cLIsnByBmEmpRvecl+kD0/w9fYvZVCQieN0ADNqV/
	AYsEoDXmGDzptKxY74OYX3SEkuCRePDu1svT45awUhdTsubIoBjIMBJ9AvpOcc5T
	yY=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: [XEN PATCH v3 04/16] x86: introduce CONFIG_ALTP2M Kconfig option
Date: Mon,  3 Jun 2024 14:13:55 +0300
Message-Id: <035f63f2b92b963f2585064fa21e09e73157f9d3.1717410850.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 601F0EDE-219A-11EF-A03A-8F8B087618E4-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

Add new option to make altp2m code inclusion optional.
Currently altp2m implemented for Intel EPT only, so option is dependant o=
n VMX.
Also the prompt itself depends on EXPERT=3Dy, so that option is available
for fine-tuning, if one want to play around with it.

Use this option instead of more generic CONFIG_HVM option.
That implies the possibility to build hvm code without altp2m support,
hence we need to declare altp2m routines for hvm code to compile successf=
ully
(altp2m_vcpu_initialise(), altp2m_vcpu_destroy(), altp2m_vcpu_enable_ve()=
)

Also guard altp2m routines, so that they can be disabled completely in th=
e
build -- when target platform does not actually support altp2m
(AMD-V & ARM as of now).

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Tamas K Lengyel <tamas@tklengyel.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
changes in v3:
 - added help text
 - use conditional prompt depending on EXPERT=3Dy
 - corrected & extended patch description
 - put a blank line before #ifdef CONFIG_ALTP2M
 - sqashed in a separate patch for guarding altp2m code with CONFIG_ALTP2=
M option
changes in v2:
 - use separate CONFIG_ALTP2M option instead of CONFIG_VMX
---
 xen/arch/x86/Kconfig               | 11 +++++++++++
 xen/arch/x86/include/asm/altp2m.h  |  5 ++++-
 xen/arch/x86/include/asm/hvm/hvm.h |  2 +-
 xen/arch/x86/include/asm/p2m.h     | 17 ++++++++++++++++-
 xen/arch/x86/mm/Makefile           |  2 +-
 5 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 8c9f8431f0..4a35c43dc5 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -358,6 +358,17 @@ config REQUIRE_NX
 	  was unavailable. However, if enabled, Xen will no longer boot on
 	  any CPU which is lacking NX support.
=20
+config ALTP2M
+	bool "Alternate P2M support" if EXPERT
+	default y
+	depends on VMX
+	help
+	  Alternate-p2m allows a guest to manage multiple p2m guest physical
+	  "memory views" (as opposed to a single p2m).
+	  Useful for memory introspection.
+
+	  If unsure, stay with defaults.
+
 endmenu
=20
 source "common/Kconfig"
diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm=
/altp2m.h
index 2d36c5aa9b..effbef51eb 100644
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
@@ -34,6 +34,9 @@ static inline bool altp2m_active(const struct domain *d=
)
 }
=20
 /* Only declaration is needed. DCE will optimise it out when linking. */
+void altp2m_vcpu_initialise(struct vcpu *v);
+void altp2m_vcpu_destroy(struct vcpu *v);
+int altp2m_vcpu_enable_ve(struct vcpu *v, gfn_t gfn);
 void altp2m_vcpu_disable_ve(struct vcpu *v);
=20
 #endif
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/as=
m/hvm/hvm.h
index 1c01e22c8e..2ebea1a92c 100644
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
index c1478ffc36..b247aa4c7d 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -577,10 +577,10 @@ static inline gfn_t mfn_to_gfn(const struct domain =
*d, mfn_t mfn)
         return _gfn(mfn_x(mfn));
 }
=20
-#ifdef CONFIG_HVM
 #define AP2MGET_prepopulate true
 #define AP2MGET_query false
=20
+#ifdef CONFIG_ALTP2M
 /*
  * Looks up altp2m entry. If the entry is not found it looks up the entr=
y in
  * hostp2m.
@@ -589,6 +589,15 @@ static inline gfn_t mfn_to_gfn(const struct domain *=
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
@@ -914,8 +923,14 @@ static inline bool p2m_set_altp2m(struct vcpu *v, un=
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


