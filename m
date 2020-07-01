Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 859CD210943
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 12:28:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqZyf-00027m-AZ; Wed, 01 Jul 2020 10:28:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LFmw=AM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jqZyd-00027V-UV
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 10:28:27 +0000
X-Inumbo-ID: 996d8cb2-bb85-11ea-86e8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 996d8cb2-bb85-11ea-86e8-12813bfff9fa;
 Wed, 01 Jul 2020 10:28:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 75294AD04;
 Wed,  1 Jul 2020 10:28:26 +0000 (UTC)
Subject: [PATCH v2 7/7] x86: only generate compat headers actually needed
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
Message-ID: <5892f237-cfcf-eb19-058c-bd4f45c7bc97@suse.com>
Date: Wed, 1 Jul 2020 12:28:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

As was already the case for XSM/Flask, avoid generating compat headers
when they're not going to be needed. To address resulting build issues
- move compat/hvm/dm_op.h inclusion to the only source file needing it,
- add a little bit of #ifdef-ary.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Alternatively we could consistently drop conditionals (except for per-
arch cases perhaps).

--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -717,6 +717,8 @@ static int dm_op(const struct dmop_args
     return rc;
 }
 
+#include <compat/hvm/dm_op.h>
+
 CHECK_dm_op_create_ioreq_server;
 CHECK_dm_op_get_ioreq_server_info;
 CHECK_dm_op_ioreq_server_range;
--- a/xen/common/compat/domain.c
+++ b/xen/common/compat/domain.c
@@ -11,7 +11,6 @@ EMIT_FILE;
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
 #include <compat/vcpu.h>
-#include <compat/hvm/hvm_vcpu.h>
 
 #define xen_vcpu_set_periodic_timer vcpu_set_periodic_timer
 CHECK_vcpu_set_periodic_timer;
@@ -25,6 +24,10 @@ CHECK_SIZE_(struct, vcpu_info);
 CHECK_vcpu_register_vcpu_info;
 #undef xen_vcpu_register_vcpu_info
 
+#ifdef CONFIG_HVM
+
+#include <compat/hvm/hvm_vcpu.h>
+
 #define xen_vcpu_hvm_context vcpu_hvm_context
 #define xen_vcpu_hvm_x86_32 vcpu_hvm_x86_32
 #define xen_vcpu_hvm_x86_64 vcpu_hvm_x86_64
@@ -33,6 +36,8 @@ CHECK_vcpu_hvm_context;
 #undef xen_vcpu_hvm_x86_32
 #undef xen_vcpu_hvm_context
 
+#endif
+
 int compat_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     struct domain *d = current->domain;
@@ -49,6 +54,7 @@ int compat_vcpu_op(int cmd, unsigned int
         if ( v->vcpu_info == &dummy_vcpu_info )
             return -EINVAL;
 
+#ifdef CONFIG_HVM
         if ( is_hvm_vcpu(v) )
         {
             struct vcpu_hvm_context ctxt;
@@ -61,6 +67,7 @@ int compat_vcpu_op(int cmd, unsigned int
             domain_unlock(d);
         }
         else
+#endif
         {
             struct compat_vcpu_guest_context *ctxt;
 
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -3,32 +3,34 @@ ifneq ($(CONFIG_COMPAT),)
 compat-arch-$(CONFIG_X86) := x86_32
 
 headers-y := \
-    compat/argo.h \
-    compat/callback.h \
+    compat/arch-$(compat-arch-y).h \
     compat/elfnote.h \
     compat/event_channel.h \
     compat/features.h \
-    compat/grant_table.h \
-    compat/hypfs.h \
-    compat/kexec.h \
     compat/memory.h \
     compat/nmi.h \
     compat/physdev.h \
     compat/platform.h \
+    compat/pmu.h \
     compat/sched.h \
-    compat/trace.h \
     compat/vcpu.h \
     compat/version.h \
     compat/xen.h \
-    compat/xenoprof.h
+    compat/xlat.h
 headers-$(CONFIG_X86)     += compat/arch-x86/pmu.h
 headers-$(CONFIG_X86)     += compat/arch-x86/xen-mca.h
 headers-$(CONFIG_X86)     += compat/arch-x86/xen.h
 headers-$(CONFIG_X86)     += compat/arch-x86/xen-$(compat-arch-y).h
-headers-$(CONFIG_X86)     += compat/hvm/dm_op.h
-headers-$(CONFIG_X86)     += compat/hvm/hvm_op.h
-headers-$(CONFIG_X86)     += compat/hvm/hvm_vcpu.h
-headers-y                 += compat/arch-$(compat-arch-y).h compat/pmu.h compat/xlat.h
+headers-$(CONFIG_ARGO)    += compat/argo.h
+headers-$(CONFIG_PV)      += compat/callback.h
+headers-$(CONFIG_GRANT_TABLE) += compat/grant_table.h
+headers-$(CONFIG_HVM)     += compat/hvm/dm_op.h
+headers-$(CONFIG_HVM)     += compat/hvm/hvm_op.h
+headers-$(CONFIG_HVM)     += compat/hvm/hvm_vcpu.h
+headers-$(CONFIG_HYPFS)   += compat/hypfs.h
+headers-$(CONFIG_KEXEC)   += compat/kexec.h
+headers-$(CONFIG_TRACEBUFFER) += compat/trace.h
+headers-$(CONFIG_XENOPROF) += compat/xenoprof.h
 headers-$(CONFIG_XSM_FLASK) += compat/xsm/flask_op.h
 
 cppflags-y                := -include public/xen-compat.h -DXEN_GENERATING_COMPAT_HEADERS
--- a/xen/include/xen/hypercall.h
+++ b/xen/include/xen/hypercall.h
@@ -216,8 +216,6 @@ extern long compat_argo_op(
     unsigned long arg4);
 #endif
 
-#include <compat/hvm/dm_op.h>
-
 extern int
 compat_dm_op(
     domid_t domid,


