Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DFD97BA08
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2024 11:19:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800204.1210104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqqqE-0008Tb-Et; Wed, 18 Sep 2024 09:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800204.1210104; Wed, 18 Sep 2024 09:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqqqE-0008Rr-BS; Wed, 18 Sep 2024 09:19:18 +0000
Received: by outflank-mailman (input) for mailman id 800204;
 Wed, 18 Sep 2024 09:19:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P1nG=QQ=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sqqqC-0008Rj-U4
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2024 09:19:17 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 122c7e04-759f-11ef-99a2-01e77a169b0f;
 Wed, 18 Sep 2024 11:19:14 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 4CED72AB66;
 Wed, 18 Sep 2024 05:19:13 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 450452AB65;
 Wed, 18 Sep 2024 05:19:13 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 6BBC02AB64;
 Wed, 18 Sep 2024 05:19:11 -0400 (EDT)
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
X-Inumbo-ID: 122c7e04-759f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=53smXasWd1kdsCxJozw3baFujpwna0GJ4sddX+8FhMw=; b=kRWi
	rD0wnWY36abD8De65J12QiJsQSjOKBH/9pnRnIKD68qz+5HLmA5ImBYLr3DVaVMI
	vO8ekBng6YLLGgXg+9nPQTcwKYxRMYugbPusJilL6id8Gtt40jKSR6D0Gh28wl01
	ttNmVWerSEz6gJ1PBeaGHEK2kDBaZyvM8mrokR4=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v2] x86/mwait-idle: add dependency on general Intel CPU support
Date: Wed, 18 Sep 2024 12:19:09 +0300
Message-Id: <20240918091909.1201170-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 10D7833E-759F-11EF-BE9A-2BAEEB2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

Currently mwait_idle driver in Xen only implements support for Intel CPUs=
.
Thus in order to reduce dead code in non-Intel build configurations it ca=
n
be made explicitly dependant on CONFIG_INTEL option.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Jan Beulich <jbeulich@suse.com>
---
v1 patch here:
https://lore.kernel.org/xen-devel/20240905160058.493057-1-Sergiy_Kibrik@e=
pam.com/

changes in v2:
  - stub returns -ENODEV
---
 xen/arch/x86/cpu/Makefile          | 2 +-
 xen/arch/x86/include/asm/cpuidle.h | 7 +++++++
 xen/arch/x86/include/asm/mwait.h   | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/Makefile b/xen/arch/x86/cpu/Makefile
index eafce5f204..7cfe28b7ec 100644
--- a/xen/arch/x86/cpu/Makefile
+++ b/xen/arch/x86/cpu/Makefile
@@ -8,7 +8,7 @@ obj-y +=3D common.o
 obj-y +=3D hygon.o
 obj-y +=3D intel.o
 obj-y +=3D intel_cacheinfo.o
-obj-y +=3D mwait-idle.o
+obj-$(CONFIG_INTEL) +=3D mwait-idle.o
 obj-y +=3D shanghai.o
 obj-y +=3D vpmu.o
 obj-$(CONFIG_AMD) +=3D vpmu_amd.o
diff --git a/xen/arch/x86/include/asm/cpuidle.h b/xen/arch/x86/include/as=
m/cpuidle.h
index 707b3e948d..3a6b73142b 100644
--- a/xen/arch/x86/include/asm/cpuidle.h
+++ b/xen/arch/x86/include/asm/cpuidle.h
@@ -15,7 +15,14 @@ extern void (*lapic_timer_on)(void);
=20
 extern uint64_t (*cpuidle_get_tick)(void);
=20
+#ifdef CONFIG_INTEL
 int mwait_idle_init(struct notifier_block *nfb);
+#else
+static inline int mwait_idle_init(struct notifier_block *nfb)
+{
+    return -ENODEV;
+}
+#endif
 int cpuidle_init_cpu(unsigned int cpu);
 void cf_check default_dead_idle(void);
 void cf_check acpi_dead_idle(void);
diff --git a/xen/arch/x86/include/asm/mwait.h b/xen/arch/x86/include/asm/=
mwait.h
index 9298f987c4..000a692f6d 100644
--- a/xen/arch/x86/include/asm/mwait.h
+++ b/xen/arch/x86/include/asm/mwait.h
@@ -14,6 +14,13 @@
 #define MWAIT_ECX_INTERRUPT_BREAK	0x1
=20
 void mwait_idle_with_hints(unsigned int eax, unsigned int ecx);
+#ifdef CONFIG_INTEL
 bool mwait_pc10_supported(void);
+#else
+static inline bool mwait_pc10_supported(void)
+{
+    return false;
+}
+#endif
=20
 #endif /* __ASM_X86_MWAIT_H__ */
--=20
2.25.1


