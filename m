Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE4F7A9D6B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 21:36:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606551.944543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjPSP-0006PS-8D; Thu, 21 Sep 2023 19:35:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606551.944543; Thu, 21 Sep 2023 19:35:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjPSP-0006MB-5E; Thu, 21 Sep 2023 19:35:25 +0000
Received: by outflank-mailman (input) for mailman id 606551;
 Thu, 21 Sep 2023 19:35:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gWeo=FF=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qjPSN-0006M2-9b
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 19:35:23 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff45104d-58b5-11ee-878a-cb3800f73035;
 Thu, 21 Sep 2023 21:35:20 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 38LJYcGK073129
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 21 Sep 2023 15:34:44 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 38LJYboP073128;
 Thu, 21 Sep 2023 12:34:37 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: ff45104d-58b5-11ee-878a-cb3800f73035
Message-Id: <7a880e33ff91d0c76986159e3559c56ee6894d21.1695324653.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
        "Roger Pau Monné" <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
        George Dunlap <george.dunlap@citrix.com>,
        Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>
Date: Thu, 21 Sep 2023 09:18:42 -0700
Subject: [PATCH WIP] xen/public: move incomplete type definitions to xen.h
X-Spam-Status: No, score=1.5 required=10.0 tests=DATE_IN_PAST_03_06,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

Hypercall wrappers need the incomplete type definitions.  Only when the
actual structure needed.  As such these incomplete definitions should be
in xen.h next to their hypercalls, rather than spread all over.

trap_info_t is particularly notable since even though the hypercall is
x86-only, the wrapper is likely to be visible to generic source code.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
trap_info_t and HYPERVISOR_set_trap_table() is something I ran into.
With the incomplete definition, the wrapper is accaptable to an ARM
compiler.  Without the incomplete definition, it fails.

Note, this has been shown to build in my environment.  I'm unsure
whether the incomplete structure plus type definition is acceptable to
all supportted compilers.

I'm wondering about __ASSEMBLY__.  I suspect this could be handled better
by having a macro for all these suspiciously similar type definitions.  I
suspect it would be handy for DEFINE_XEN_GUEST_HANDLE() to be null when
__ASSEMBLY__ is defined.

This seems to suggest all the __HYPERVISOR_* definitions need to move
later in the file.
---
 xen/include/public/arch-x86/xen.h |  2 --
 xen/include/public/platform.h     |  2 --
 xen/include/public/sched.h        |  2 --
 xen/include/public/xen.h          | 24 ++++++++++++++++++++----
 4 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index c0f4551247..896440333c 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -143,8 +143,6 @@ struct trap_info {
     uint16_t      cs;      /* code selector                                 */
     unsigned long address; /* code offset                                   */
 };
-typedef struct trap_info trap_info_t;
-DEFINE_XEN_GUEST_HANDLE(trap_info_t);
 
 typedef uint64_t tsc_timestamp_t; /* RDTSC timestamp */
 
diff --git a/xen/include/public/platform.h b/xen/include/public/platform.h
index 15777b5416..bb7f2dfcb0 100644
--- a/xen/include/public/platform.h
+++ b/xen/include/public/platform.h
@@ -659,8 +659,6 @@ struct xen_platform_op {
         uint8_t                       pad[128];
     } u;
 };
-typedef struct xen_platform_op xen_platform_op_t;
-DEFINE_XEN_GUEST_HANDLE(xen_platform_op_t);
 
 #endif /* __XEN_PUBLIC_PLATFORM_H__ */
 
diff --git a/xen/include/public/sched.h b/xen/include/public/sched.h
index b4362c6a1d..2b65c0db8c 100644
--- a/xen/include/public/sched.h
+++ b/xen/include/public/sched.h
@@ -118,8 +118,6 @@
 struct sched_shutdown {
     unsigned int reason; /* SHUTDOWN_* => enum sched_shutdown_reason */
 };
-typedef struct sched_shutdown sched_shutdown_t;
-DEFINE_XEN_GUEST_HANDLE(sched_shutdown_t);
 
 struct sched_poll {
     XEN_GUEST_HANDLE(evtchn_port_t) ports;
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index b812a0a324..32a76afbd4 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -75,13 +75,25 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
  */
 
 #define __HYPERVISOR_set_trap_table        0
+#ifndef __ASSEMBLY__
+typedef struct trap_info trap_info_t;
+DEFINE_XEN_GUEST_HANDLE(trap_info_t);
+#endif
 #define __HYPERVISOR_mmu_update            1
+#ifndef __ASSEMBLY__
+typedef struct mmu_update mmu_update_t;
+DEFINE_XEN_GUEST_HANDLE(mmu_update_t);
+#endif
 #define __HYPERVISOR_set_gdt               2
 #define __HYPERVISOR_stack_switch          3
 #define __HYPERVISOR_set_callbacks         4
 #define __HYPERVISOR_fpu_taskswitch        5
 #define __HYPERVISOR_sched_op_compat       6 /* compat since 0x00030101 */
 #define __HYPERVISOR_platform_op           7
+#ifndef __ASSEMBLY__
+typedef struct xen_platform_op xen_platform_op_t;
+DEFINE_XEN_GUEST_HANDLE(xen_platform_op_t);
+#endif
 #define __HYPERVISOR_set_debugreg          8
 #define __HYPERVISOR_get_debugreg          9
 #define __HYPERVISOR_update_descriptor    10
@@ -100,9 +112,17 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
 #define __HYPERVISOR_vcpu_op              24
 #define __HYPERVISOR_set_segment_base     25 /* x86/64 only */
 #define __HYPERVISOR_mmuext_op            26
+#ifndef __ASSEMBLY__
+typedef struct mmuext_op mmuext_op_t;
+DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
+#endif
 #define __HYPERVISOR_xsm_op               27
 #define __HYPERVISOR_nmi_op               28
 #define __HYPERVISOR_sched_op             29
+#ifndef __ASSEMBLY__
+typedef struct sched_shutdown sched_shutdown_t;
+DEFINE_XEN_GUEST_HANDLE(sched_shutdown_t);
+#endif
 #define __HYPERVISOR_callback_op          30
 #define __HYPERVISOR_xenoprof_op          31
 #define __HYPERVISOR_event_channel_op     32
@@ -449,8 +469,6 @@ struct mmuext_op {
         xen_pfn_t src_mfn;
     } arg2;
 };
-typedef struct mmuext_op mmuext_op_t;
-DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
 #endif
 
 /*
@@ -615,8 +633,6 @@ struct mmu_update {
     uint64_t ptr;       /* Machine address of PTE. */
     uint64_t val;       /* New contents of PTE.    */
 };
-typedef struct mmu_update mmu_update_t;
-DEFINE_XEN_GUEST_HANDLE(mmu_update_t);
 
 /*
  * ` enum neg_errnoval
-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |       ehem+sigmsg@m5p.com      PGP 87145445       |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



