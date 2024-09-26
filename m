Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 548A79870F4
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 11:58:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805138.1216184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlGJ-0002WZ-OY; Thu, 26 Sep 2024 09:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805138.1216184; Thu, 26 Sep 2024 09:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlGJ-0002U3-L9; Thu, 26 Sep 2024 09:58:15 +0000
Received: by outflank-mailman (input) for mailman id 805138;
 Thu, 26 Sep 2024 09:58:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SK2l=QY=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1stlGI-0002Tx-22
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 09:58:14 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6b1f63a-7bed-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 11:58:12 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id A2A18181DE;
 Thu, 26 Sep 2024 05:58:10 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 98FAB181DD;
 Thu, 26 Sep 2024 05:58:10 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 33E68181DC;
 Thu, 26 Sep 2024 05:58:09 -0400 (EDT)
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
X-Inumbo-ID: d6b1f63a-7bed-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=Kb5CaR8B/iX278zwrZHvcWGA59WlqeG+iZBQKipmdLs=; b=fW5M
	g1AfalkJ5XXwoCTzsa2kTvH4o00E7KaKQzA8RpiGUmZR27swC6CR26PKSTp/K6k1
	L82Cn+pqnFt0SsrHgPDujeNtK4qvc4Nb6CEE/5VNrklW0yCNOC76RKbW7GYq3Jry
	knvmdnh/dl5UjQGzPyMgt2jeaLUYiAYeeuoy9SU=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [RFC PATCH] arm: introduce kconfig options to disable hypercalls
Date: Thu, 26 Sep 2024 12:58:06 +0300
Message-Id: <20240926095806.67149-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 D591C672-7BED-11EF-B0DF-2BAEEB2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Stefano Stabellini <stefano.stabellini@amd.com>

It can be beneficial for some dom0less systems to further reduce Xen foot=
print
and disable some hypercalls handling code, which isn't going to be used i=
n
such systems. Each hypercall has a separate option to keep configuration
flexible.

Options to disable hypercalls:
- domctl, sysctl
- hvm
- physdev
- platform

Options are forced to be configurable only when DOM0LESS is enabled, so t=
hat
system won't become accidentally un-bootable when any hypercall is disabl=
ed.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/arm/Makefile        | 10 +++++-----
 xen/common/Kconfig           | 26 ++++++++++++++++++++++++++
 xen/common/Makefile          |  4 ++++
 xen/common/domain.c          |  2 ++
 xen/include/hypercall-defs.c | 14 +++++++++++++-
 xen/include/xen/hypercall.h  | 20 ++++++++++++++++++++
 6 files changed, 70 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 7792bff597..09fffa7002 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -18,7 +18,7 @@ obj-$(CONFIG_IOREQ_SERVER) +=3D dm.o
 obj-$(CONFIG_DOM0LESS_BOOT) +=3D dom0less-build.init.o
 obj-y +=3D domain.o
 obj-y +=3D domain_build.init.o
-obj-y +=3D domctl.o
+obj-$(CONFIG_DOMCTL) +=3D domctl.o
 obj-$(CONFIG_EARLY_PRINTK) +=3D early_printk.o
 obj-y +=3D efi/
 obj-y +=3D gic.o
@@ -29,7 +29,7 @@ obj-$(CONFIG_HAS_ITS) +=3D gic-v3-lpi.o
 obj-y +=3D guestcopy.o
 obj-y +=3D guest_atomics.o
 obj-y +=3D guest_walk.o
-obj-y +=3D hvm.o
+obj-$(CONFIG_HVM_OP) +=3D hvm.o
 obj-y +=3D io.o
 obj-$(CONFIG_IOREQ_SERVER) +=3D ioreq.o
 obj-y +=3D irq.o
@@ -41,8 +41,8 @@ obj-y +=3D monitor.o
 obj-y +=3D p2m.o
 obj-y +=3D percpu.o
 obj-y +=3D platform.o
-obj-y +=3D platform_hypercall.o
-obj-y +=3D physdev.o
+obj-$(CONFIG_PLATFORM_HYP) +=3D platform_hypercall.o
+obj-$(CONFIG_PHYSDEVOP) +=3D physdev.o
 obj-y +=3D processor.o
 obj-y +=3D psci.o
 obj-y +=3D setup.o
@@ -52,7 +52,7 @@ obj-y +=3D smpboot.o
 obj-$(CONFIG_STATIC_EVTCHN) +=3D static-evtchn.init.o
 obj-$(CONFIG_STATIC_MEMORY) +=3D static-memory.init.o
 obj-$(CONFIG_STATIC_SHM) +=3D static-shmem.init.o
-obj-y +=3D sysctl.o
+obj-$(CONFIG_SYSCTL) +=3D sysctl.o
 obj-y +=3D time.o
 obj-y +=3D traps.o
 obj-y +=3D vcpreg.o
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 90268d9249..7e4f51958d 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -516,4 +516,30 @@ config TRACEBUFFER
 	  to be collected at run time for debugging or performance analysis.
 	  Memory and execution overhead when not active is minimal.
=20
+menu "Supported hypercall interfaces"
+	visible if DOM0LESS_BOOT && EXPERT
+
+config SYSCTL
+	bool "Enable sysctl hypercall"
+	default y
+
+config DOMCTL
+	bool "Enable domctl hypercalls"
+	default y
+
+config HVM_OP
+	bool "Enable HVM hypercalls"
+	depends on HVM
+	default y
+
+config PLATFORM_HYP
+	bool "Enable platform hypercalls"
+	default y
+
+config PHYSDEVOP
+	bool "Enable physdev hypercall"
+	default y
+
+endmenu
+
 endmenu
diff --git a/xen/common/Makefile b/xen/common/Makefile
index fc52e0857d..ea0557aee5 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -64,10 +64,14 @@ obj-bin-$(CONFIG_X86) +=3D $(foreach n,decompress bun=
zip2 unxz unlzma lzo unlzo un
 obj-$(CONFIG_COMPAT) +=3D $(addprefix compat/,domain.o memory.o multical=
l.o xlat.o)
=20
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
+ifeq ($(CONFIG_DOMCTL),y)
 obj-y +=3D domctl.o
+endif
 obj-y +=3D monitor.o
+ifeq ($(CONFIG_SYSCTL),y)
 obj-y +=3D sysctl.o
 endif
+endif
=20
 extra-y :=3D symbols-dummy.o
=20
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 92263a4fbd..77d15a317f 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1053,7 +1053,9 @@ int domain_kill(struct domain *d)
         d->is_dying =3D DOMDYING_dying;
         rspin_barrier(&d->domain_lock);
         argo_destroy(d);
+#ifdef CONFIG_DOMCTL
         vnuma_destroy(d->vnuma);
+#endif
         domain_set_outstanding_pages(d, 0);
         /* fallthrough */
     case DOMDYING_dying:
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 47c093acc8..93b4f5a1e3 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -235,8 +235,10 @@ set_callbacks                      compat   do      =
 -        -        -
 fpu_taskswitch                     do       do       -        -        -
 sched_op_compat                    do       do       -        -        d=
ep
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#ifdef CONFIG_PLATFORM_HYP
 platform_op                        compat   do       compat   do       d=
o
 #endif
+#endif
 set_debugreg                       do       do       -        -        -
 get_debugreg                       do       do       -        -        -
 update_descriptor                  compat   do       -        -        -
@@ -247,7 +249,9 @@ set_timer_op                       compat   do       =
compat   do       -
 event_channel_op_compat            do       do       -        -        d=
ep
 xen_version                        do       do       do       do       d=
o
 console_io                         do       do       do       do       d=
o
+#ifdef CONFIG_PHYSDEV
 physdev_op_compat                  compat   do       -        -        d=
ep
+#endif
 #if defined(CONFIG_GRANT_TABLE)
 grant_table_op                     compat   do       hvm      hvm      d=
o
 #elif defined(CONFIG_PV_SHIM)
@@ -269,14 +273,20 @@ callback_op                        compat   do     =
  -        -        -
 xenoprof_op                        compat   do       -        -        -
 #endif
 event_channel_op                   do       do       do:1     do:1     d=
o:1
+#ifdef CONFIG_PHYSDEVOP
 physdev_op                         compat   do       hvm      hvm      d=
o_arm
-#ifdef CONFIG_HVM
+#endif
+#ifdef CONFIG_HVM_OP
 hvm_op                             do       do       do       do       d=
o
 #endif
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#ifdef CONFIG_SYSCTL
 sysctl                             do       do       do       do       d=
o
+#endif
+#ifdef CONFIG_DOMCTL
 domctl                             do       do       do       do       d=
o
 #endif
+#endif
 #ifdef CONFIG_KEXEC
 kexec_op                           compat   do       -        -        -
 #endif
@@ -293,7 +303,9 @@ hypfs_op                           do       do       =
do       do       do
 #endif
 mca                                do       do       -        -        -
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#ifdef CONFIG_DOMCTL
 paging_domctl_cont                 do       do       do       do       -
 #endif
+#endif
=20
 #endif /* !CPPCHECK */
diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
index f307dfb597..10d551c751 100644
--- a/xen/include/xen/hypercall.h
+++ b/xen/include/xen/hypercall.h
@@ -24,6 +24,26 @@
 /* Needs to be after asm/hypercall.h. */
 #include <xen/hypercall-defs.h>
=20
+#if !defined(CONFIG_DOMCTL) && !defined(CONFIG_DOM0LESS_BOOT)
+#error "domctl and dom0less can't be disabled simultaneously"
+#endif
+
+#if !defined(CONFIG_HVM_OP) && !defined(CONFIG_DOM0LESS_BOOT)
+#error "hvm_op and dom0less can't be disabled simultaneously"
+#endif
+
+#if !defined(CONFIG_PHYSDEVOP) && !defined(CONFIG_DOM0LESS_BOOT)
+#error "physdevop and dom0less can't be disabled simultaneously"
+#endif
+
+#if !defined(CONFIG_PLATFORM_HYP) && !defined(CONFIG_DOM0LESS_BOOT)
+#error "platform hypercalls and dom0less can't be disabled simultaneousl=
y"
+#endif
+
+#if !defined(CONFIG_SYSCTL) && !defined(CONFIG_DOM0LESS_BOOT)
+#error "sysctl and dom0less can't be disabled simultaneously"
+#endif
+
 extern long
 arch_do_domctl(
     struct xen_domctl *domctl, struct domain *d,
--=20
2.25.1


