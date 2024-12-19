Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AC19F7882
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 10:29:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860979.1272967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOCqY-0003Rp-1J; Thu, 19 Dec 2024 09:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860979.1272967; Thu, 19 Dec 2024 09:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOCqX-0003Pw-Ul; Thu, 19 Dec 2024 09:29:29 +0000
Received: by outflank-mailman (input) for mailman id 860979;
 Thu, 19 Dec 2024 09:29:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=niuL=TM=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1tOCqW-0003Pq-6J
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 09:29:28 +0000
Received: from fforwardh-b4-smtp.messagingengine.com
 (fforwardh-b4-smtp.messagingengine.com [202.12.124.199])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc7e070e-bdeb-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 10:29:26 +0100 (CET)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfforwardh.stl.internal (Postfix) with ESMTP id 1D9F01740301;
 Thu, 19 Dec 2024 04:29:24 -0500 (EST)
Received: from phl-frontend-01 ([10.202.2.160])
 by phl-compute-12.internal (MEProxy); Thu, 19 Dec 2024 04:29:24 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Dec 2024 04:29:21 -0500 (EST)
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
X-Inumbo-ID: bc7e070e-bdeb-11ef-a0d7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1734600563; x=1734686963; bh=nwmFgHahWexYFtoXDT8R32Ftn+nEypCwNBT
	ku56z0Cc=; b=0rFQl3hCaNN/FuTn4lhg69FpDetyHem/vngkor/RR0zYxN31VGu
	3JKdtYdHlJMhHgLM0EimFfq3MZU536Tmd5Y/h+4pPTzSmi4HM5HyYZfDD1SSqf4o
	dBx1iK4fO5uhBlaXpOY+Sak3/sQOLxQzZpibGyK8KY0l+L2VvsjF1cAqFfAGo6bR
	oVBTzZ2YujqaO1UPE/smyvzB4kw/mjHgfVJWBKgVMSd9eZjrm3ze9Wk3fTS/sqLT
	UEphrYhSNg/TqLpsApz6WY/KfB+TW/ebVYKYuxVWUvbqnTwaMn04jAmIDscnOEgg
	RlLAvp/7Je9a2eFNmutwXFWqdWDkVnCzy1Q==
X-ME-Sender: <xms:cudjZ1oyK2lh47ifMv-5irf-FiAFL1T2KNl3MNXbD3Oq9CZV8GpXFg>
    <xme:cudjZ3poj1X7XliUiCF5Xp9tAyamW1GYefgHXRee6zCc4t6KLRndeSim8AhJNbRnn
    xNudIoiEO8xTff8nbE>
X-ME-Received: <xmr:cudjZyNwxVkmti3EGJlKMAY8NOfdNCnY02yHePYBDGdIUPfn80WKZ4nVdi3b-srCUoIdPNLFKRZJzQO8Y8eR2wRh2kdtpq7_4J7tr2q3nJHgXp0m>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddttddgtdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfh
    rhhomhepufgvrhhgihihucfmihgsrhhikhcuoefuvghrghhihigpmfhisghrihhksegvph
    grmhdrtghomheqnecuggftrfgrthhtvghrnhepgedvfeefhfduvdetkeegleeggfelheek
    veeiuddufeehtdehleelhfekiedvvedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghk
    ihgssegurghrkhhsthgrrhdrshhithgvpdhnsggprhgtphhtthhopeduvddpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhp
    rhhojhgvtghtrdhorhhgpdhrtghpthhtohepshhtvghfrghnohdrshhtrggsvghllhhinh
    hisegrmhgurdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghp
    thhtohepsggvrhhtrhgrnhgurdhmrghrqhhuihhssegrrhhmrdgtohhmpdhrtghpthhtoh
    epmhhitghhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtohepvhholhhougih
    mhihrhgpsggrsggthhhukhesvghprghmrdgtohhmpdhrtghpthhtoheprghnthhhohhnhi
    drphgvrhgrrhgusehvrghtvghsrdhtvggthhdprhgtphhtthhopehrohhgvghrrdhprghu
    segtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:cudjZw6d95rLFQDuZgUtFrPpVSv_HzHaQ7bj8txyWA2U20WhU6qzrw>
    <xmx:cudjZ043tJuVaZ6V1o0aBebPJ4ODvT_LeuxlDuU8vg4LLa-XUmihlA>
    <xmx:cudjZ4g8OlZD2bX8EdKh_-PWUGoUrOO26xj8VUfXSzPKgUrVZS1fgQ>
    <xmx:cudjZ26HKznOCCjAV6TAX36i_Cc8G_xHlgE0QHEvbNSh9zE-dmFo6g>
    <xmx:c-djZxw579DLJUk7O_1Jsf2GkyMc9YdCXNXSZFc07Q_K5d0z9sgiFVgIuz-d>
Feedback-ID: idddb55c8:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v2] xen: introduce kconfig options to disable hypercalls
Date: Thu, 19 Dec 2024 11:29:17 +0200
Message-Id: <20241219092917.3006174-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

It can be beneficial for some dom0less systems to further reduce Xen footprint
and disable some hypercalls handling code, which may not to be used & required
in such systems. Each hypercall has a separate option to keep configuration
flexible.

Options to disable hypercalls:
- domctl, sysctl
- hvm
- physdev
- platform

Some of these options are forced to be configurable only when DOM0LESS is
enabled, so that system won't become accidentally un-bootable when any hypercall
is disabled.
domctl/sysctl/platform hypercalls also disabled by PV_SHIM_EXCLUSIVE config
option, so this is reflected by a dependency in kconfig and Makefiles are
changed accordingly.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v2:
 - SYSCTL & DOMCTL config option dependency on !PV_SHIM_EXCLUSIVE
 - replace build checks for CONFIG_PV_SHIM_EXCLUSIVE
 - rename options PLATFORM_HYP -> PLATFORM_OP & PHYSDEV -> PHYSDEV_OP
 - removed "arm" from subj, as patch becomes not really ARM-specific
 - updated description

changes in v1:
 - incorporated PV_SHIM_EXCLUSIVE check in Kconfig
 - drop excessive ifeq from Makefile & #ifdef from code
 - drop checks for CONFIG_HVM_OP & CONFIG_PLATFORM_HYP being off when !DOM0LESS
 - description updated

v1 patch here: https://lore.kernel.org/xen-devel/20241216114358.2845447-1-Sergiy_Kibrik@epam.com/
---
 xen/arch/arm/Makefile        | 10 +++++-----
 xen/arch/x86/Makefile        |  6 +++---
 xen/common/Kconfig           | 29 +++++++++++++++++++++++++++++
 xen/common/Makefile          |  4 ++--
 xen/include/hypercall-defs.c | 24 +++++++++++++++++-------
 xen/include/xen/domain.h     |  2 +-
 6 files changed, 57 insertions(+), 18 deletions(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index e4ad1ce851..265498fdd2 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -18,7 +18,7 @@ obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
 obj-y += domain.o
 obj-y += domain_build.init.o
-obj-y += domctl.o
+obj-$(CONFIG_DOMCTL) += domctl.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += efi/
 obj-y += gic.o
@@ -29,7 +29,7 @@ obj-$(CONFIG_HAS_ITS) += gic-v3-lpi.o
 obj-y += guestcopy.o
 obj-y += guest_atomics.o
 obj-y += guest_walk.o
-obj-y += hvm.o
+obj-$(CONFIG_HVM_OP) += hvm.o
 obj-y += io.o
 obj-$(CONFIG_IOREQ_SERVER) += ioreq.o
 obj-y += irq.o
@@ -40,8 +40,8 @@ obj-y += mm.o
 obj-y += monitor.o
 obj-y += p2m.o
 obj-y += platform.o
-obj-y += platform_hypercall.o
-obj-y += physdev.o
+obj-$(CONFIG_PLATFORM_OP) += platform_hypercall.o
+obj-$(CONFIG_PHYSDEV_OP) += physdev.o
 obj-y += processor.o
 obj-y += psci.o
 obj-y += setup.o
@@ -51,7 +51,7 @@ obj-y += smpboot.o
 obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
 obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
 obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o
-obj-y += sysctl.o
+obj-$(CONFIG_SYSCTL) += sysctl.o
 obj-y += time.o
 obj-y += traps.o
 obj-y += vcpreg.o
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index b35fd5196c..f623bddb1d 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -74,12 +74,12 @@ obj-y += hpet.o
 obj-y += vm_event.o
 obj-y += xstate.o
 
-ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
-obj-y += domctl.o
+obj-$(CONFIG_DOMCTL) += domctl.o
+ifeq ($(CONFIG_PLATFORM_OP),y)
 obj-y += platform_hypercall.o
 obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
-obj-y += sysctl.o
 endif
+obj-$(CONFIG_SYSCTL) += sysctl.o
 
 extra-y += asm-macros.i
 extra-y += xen.lds
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 90268d9249..fd5f54356f 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -516,4 +516,33 @@ config TRACEBUFFER
 	  to be collected at run time for debugging or performance analysis.
 	  Memory and execution overhead when not active is minimal.
 
+menu "Supported hypercall interfaces"
+	visible if DOM0LESS_BOOT && EXPERT
+
+config SYSCTL
+	bool "Enable sysctl hypercall"
+	depends on !PV_SHIM_EXCLUSIVE
+	default y
+
+config DOMCTL
+	bool "Enable domctl hypercalls"
+	depends on !PV_SHIM_EXCLUSIVE
+	default y
+
+config HVM_OP
+	bool "Enable HVM hypercalls"
+	depends on HVM
+	default y
+
+config PLATFORM_OP
+	bool "Enable platform hypercalls"
+	depends on !PV_SHIM_EXCLUSIVE
+	default y
+
+config PHYSDEV_OP
+	bool "Enable physdev hypercall"
+	default y
+
+endmenu
+
 endmenu
diff --git a/xen/common/Makefile b/xen/common/Makefile
index b279b09bfb..0893bed6ab 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -66,10 +66,10 @@ obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo un
 obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o)
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
-obj-y += domctl.o
 obj-y += monitor.o
-obj-y += sysctl.o
 endif
+obj-$(CONFIG_DOMCTL) += domctl.o
+obj-$(CONFIG_SYSCTL) += sysctl.o
 
 extra-y := symbols-dummy.o
 
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 7720a29ade..e4872e7e28 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -95,7 +95,7 @@ handle: const_char const char
 
 #ifdef CONFIG_COMPAT
 defhandle: multicall_entry_compat_t
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#ifdef CONFIG_PLATFORM_OP
 defhandle: compat_platform_op_t
 #endif
 #endif
@@ -150,7 +150,7 @@ update_va_mapping(unsigned int va, uint32_t lo, uint32_t hi, unsigned int flags)
 physdev_op_compat(physdev_op_compat_t *uop)
 update_va_mapping_otherdomain(unsigned int va, uint32_t lo, uint32_t hi, unsigned int flags, domid_t domid)
 #endif
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#ifdef CONFIG_PLATFORM_OP
 platform_op(compat_platform_op_t *u_xenpf_op)
 #endif
 #ifdef CONFIG_KEXEC
@@ -194,10 +194,14 @@ kexec_op(unsigned long op, void *uarg)
 #ifdef CONFIG_IOREQ_SERVER
 dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
 #endif
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#ifdef CONFIG_SYSCTL
 sysctl(xen_sysctl_t *u_sysctl)
+#endif
+#ifdef CONFIG_DOMCTL
 domctl(xen_domctl_t *u_domctl)
 paging_domctl_cont(xen_domctl_t *u_domctl)
+#endif
+#ifdef CONFIG_PLATFORM_OP
 platform_op(xen_platform_op_t *u_xenpf_op)
 #endif
 #ifdef CONFIG_HVM
@@ -234,7 +238,7 @@ stack_switch                       do:2     do:2     -        -        -
 set_callbacks                      compat   do       -        -        -
 fpu_taskswitch                     do       do       -        -        -
 sched_op_compat                    do       do       -        -        dep
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#ifdef CONFIG_PLATFORM_OP
 platform_op                        compat   do       compat   do       do
 #endif
 set_debugreg                       do       do       -        -        -
@@ -247,7 +251,9 @@ set_timer_op                       compat   do       compat   do       -
 event_channel_op_compat            do       do       -        -        dep
 xen_version                        do       do       do       do       do
 console_io                         do       do       do       do       do
+#ifdef CONFIG_PHYSDEV_OP
 physdev_op_compat                  compat   do       -        -        dep
+#endif
 #if defined(CONFIG_GRANT_TABLE)
 grant_table_op                     compat   do       hvm      hvm      do
 #elif defined(CONFIG_PV_SHIM)
@@ -269,12 +275,16 @@ callback_op                        compat   do       -        -        -
 xenoprof_op                        compat   do       -        -        -
 #endif
 event_channel_op                   do       do       do:1     do:1     do:1
+#ifdef CONFIG_PHYSDEV_OP
 physdev_op                         compat   do       hvm      hvm      do_arm
-#ifdef CONFIG_HVM
+#endif
+#ifdef CONFIG_HVM_OP
 hvm_op                             do       do       do       do       do
 #endif
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#ifdef CONFIG_SYSCTL
 sysctl                             do       do       do       do       do
+#endif
+#ifdef CONFIG_DOMCTL
 domctl                             do       do       do       do       do
 #endif
 #ifdef CONFIG_KEXEC
@@ -292,7 +302,7 @@ dm_op                              compat   do       compat   do       do
 hypfs_op                           do       do       do       do       do
 #endif
 mca                                do       do       -        -        -
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#ifdef CONFIG_DOMCTL
 paging_domctl_cont                 do       do       do       do       -
 #endif
 
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 3de5635291..62b5d70a8a 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -161,7 +161,7 @@ struct vnuma_info {
     struct xen_vmemrange *vmemrange;
 };
 
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#ifdef CONFIG_DOMCTL
 void vnuma_destroy(struct vnuma_info *vnuma);
 #else
 static inline void vnuma_destroy(struct vnuma_info *vnuma) { ASSERT(!vnuma); }
-- 
2.25.1


