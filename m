Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C22B624A45F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 18:53:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8RKR-0003tr-Hc; Wed, 19 Aug 2020 16:52:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qP9Y=B5=gmail.com=don.slutz@srs-us1.protection.inumbo.net>)
 id 1k8RKP-0003kZ-Kt
 for xen-devel@lists.xen.org; Wed, 19 Aug 2020 16:52:45 +0000
X-Inumbo-ID: 7a440347-f763-4d42-ba2f-9bfd17d2a484
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a440347-f763-4d42-ba2f-9bfd17d2a484;
 Wed, 19 Aug 2020 16:52:24 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id d14so22197009qke.13
 for <xen-devel@lists.xen.org>; Wed, 19 Aug 2020 09:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=tr8ETHyk66gli0Zs0a+x97izMEXltG1WJae06N0roAU=;
 b=CbLvWNpvPqhn3VjusMp1+/de+9zSLTgYwFU1GZeKVrnf8kn5fMlx+A224iVQZTsv9n
 jYqr/mP+V29NmRyAMu/fBSKzuFKW5qsPAez63iyV5Nr1EcljZu/+PLpI+ZshTBGmnAgD
 IEDPatqPOJpXlnfXYWHKpFutVGWzGCN7WekpJ0xX72DGnir7s8IH69BRcZtbf5FLjNHD
 OsvOko17uUEXd4+BvH/7neI851/5o/7xRDw2KcMl1OsGywNVFzYRL1yQxTmh7pVHbEcZ
 1hHcexFUeUvfFMDYVfYWVY15D4sW74CQbaKHRDRZN7YXenhnMSev0FGfSmcyhW6Oa28D
 jl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=tr8ETHyk66gli0Zs0a+x97izMEXltG1WJae06N0roAU=;
 b=f2FybRUjpXOa7tLx7GVFtCj37npJe6hgnTKusTYBe1TljkS4D5Ov9cs4Ek5pz8FLDu
 UoRkF5HNp5Rwnc79RqqxEajNpnXhztDjEBKgBuqx06BmwJyYMGx6LpP+IRplFNO0qNVo
 82E9Sj4BRi4s8zs287mu3SmiogbQbXRu1HrAoke+R/hVnS6gInOE57j+u7e7DF9iaX07
 SJpAR+Jq1+ZrJPpD23RZyCxaNgm0/BK5YPOhdLJzcrht16dlo8uOc9iRv3yv7p4NAvd6
 q7N4TxHQZTpEvkt/pawlXA6Rq3Uih3AyQjgz+0xlQsRRpPgHUHYBdg07mxNcrBPhy/Bt
 BGAA==
X-Gm-Message-State: AOAM5301H47bZJP+zqNWZhwXCbaYxv9B8S79/zbMuM237qP+rAsh01kl
 pQoNhiV2z1e0w2sRJyrKk/qelMVMI8SFazfP
X-Google-Smtp-Source: ABdhPJwuUvKu9Gs03eick4zQO79sPn0/g0zNWlBgsDydJbkTyGo/Cu+nO3obuSX4gRUyoKET28oKdA==
X-Received: by 2002:ae9:e505:: with SMTP id w5mr22040124qkf.282.1597855944154; 
 Wed, 19 Aug 2020 09:52:24 -0700 (PDT)
Received: from TestCloud1.don.dslutz.org.zatium.us
 (pool-96-230-225-98.bstnma.fios.verizon.net. [96.230.225.98])
 by smtp.googlemail.com with ESMTPSA id
 128sm25105832qkk.101.2020.08.19.09.52.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Aug 2020 09:52:23 -0700 (PDT)
From: Don Slutz <don.slutz@gmail.com>
X-Google-Original-From: Don Slutz <Don.Slutz@Gmail.com
To: xen-devel@lists.xen.org
Cc: Aravind Gopalakrishnan <Aravind.Gopalakrishnan@amd.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Eddie Dong <eddie.dong@intel.com>, Ian Campbell <ian.campbell@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Keir Fraser <keir@xen.org>,
 Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <stefano.stabellini@eu.citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Tim Deegan <tim@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Don Slutz <dslutz@verizon.com>, Don Slutz <don.slutz@gmail.com>
Subject: [Xen-devel] [XEN PATCH v14 5/8] xen: Add vmware_port support
Date: Wed, 19 Aug 2020 12:51:59 -0400
Message-Id: <5d2e424a19ea4934be3be962cdbe6a0ec8db9a6c.1597854907.git.don.slutz@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <ce3e037dc51581629fdb158f71f8f2e9e56d9eae.1597854907.git.don.slutz@gmail.com>
References: <cover.1597854907.git.don.slutz@gmail.com>
 <34a50dc69e4c5722597e02a4df4e3da6d6586ec7.1597854907.git.don.slutz@gmail.com>
 <67b90d11eae2c88faab22d458e7e38db0f5aada4.1597854907.git.don.slutz@gmail.com>
 <c1560bc4cecae1c40de5f5cfc39832394f77c5ed.1597854907.git.don.slutz@gmail.com>
 <ce3e037dc51581629fdb158f71f8f2e9e56d9eae.1597854907.git.don.slutz@gmail.com>
In-Reply-To: <cover.1597854907.git.don.slutz@gmail.com>
References: <cover.1597854907.git.don.slutz@gmail.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Don Slutz <dslutz@verizon.com>

This includes adding is_vmware_port_enabled

This is a new xen_arch_domainconfig flag,
XEN_DOMCTL_CONFIG_VMWARE_PORT_MASK.

This enables limited support of VMware's hyper-call.

This is both a more complete support then in currently provided by
QEMU and/or KVM and less.  The missing part requires QEMU changes
and has been left out until the QEMU patches are accepted upstream.

VMware's hyper-call is also known as VMware Backdoor I/O Port.

Note: this support does not depend on vmware_hw being non-zero.

Summary is that VMware treats "in (%dx),%eax" (or "out %eax,(%dx)")
to port 0x5658 specially.  Note: since many operations return data
in EAX, "in (%dx),%eax" is the one to use.  The other lengths like
"in (%dx),%al" will still do things, only AL part of EAX will be
changed.  For "out %eax,(%dx)" of all lengths, EAX will remain
unchanged.

An open source example of using this is:

http://open-vm-tools.sourceforge.net/

Which only uses "inl (%dx)".  Also

http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=1009458

Some of the best info is at:

https://sites.google.com/site/chitchatvmback/backdoor

Signed-off-by: Don Slutz <dslutz@verizon.com>
CC: Don Slutz <don.slutz@gmail.com>
---
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

v14:
  Reworked to current code.
  Drop arch_flags and use XEN_X86_EMU_VMWARE_PORT which will not be
    added to "all".

v13:
  Changed to uint32_t arch_flags, since the emulation_flags is this.

v12:
     Surrounding code avoiding the use of "break" makes the result
     look rather inconsistent. Please move this up immediately after
     the XSM check, or drop the "break".
       Moved it up.

v11:
   Dropped ASSERT(is_hvm_domain(currd))
    Newline after break;

v10:
    Probably better as EOPNOTSUPP, as it is a configuration problem.
    This function looks as if it should be static.
    I would suggest putting vmport_register declaration in hvm.h ...
    As indicated before, I don't think this is a good use case for a
    domain creation flag.
      Switch to the new config way.
    struct domain *d => struct domain *currd
    Are you sure you don't want to zero the high halves of 64-bit ...
      Comment added.
   Then just have this handled into the default case.
      Reworked new_eax handling.
   is_hvm_domain(currd)
   And - why here rather than before the switch() or even right at the
   start of the function?
      Moved to start.
   With that, is it really correct that OUT updates the other registers
   just like IN? If so, this deserves a comment, so that readers won't
   think this is in error.
     All done in comment at start.


v9:
  Switch to x86_emulator to handle #GP code moved to next patch.
    Can you explain why a HVM param isn't suitable here?
      Issue with changing QEMU on the fly.
      Andrew Cooper: My recommendation is still to use a creation flag
        So no change.
    Please move SVM's identical definition into ...
      Did this as #1.  No longer needed, but since the patch was ready
      I have included it.
    --Lots of questions about code that no long is part of this patch. --
    With this, is handling other than 32-bit in/out really
    meaningful/correct?
      Added comment about this.
    Since you can't get here for PV, I can't see what you need this.
      Changed to an ASSERT.
    Why version 4?
      Added comment about this.
    -- Several questions about register changes.
      Re-coded to use new_eax and set *val to this.
      Change to generealy use reg->_e..
    These ei1/ei2 checks belong in the callers imo -
      Moved.
    the "port" function parameter isn't even checked
      Add check for exact match.
    If dropping the code is safe without also forbidding the
    combination of nested and VMware emulation.
      Added the forbidding the combination of nested and VMware.
      Mostly do to the cases of the nested virtual code is the one
      to handle VMware stuff if needed, not the root one.  Also I am
      having issues testing xen nested in xen and using hvm.

v7:
      More on AMD in the commit message.
      Switch to only change 32bit part of registers, what VMware
        does.
    Too much logging and tracing.
      Dropped a lot of it.  This includes vmport_debug=

v6:
      Dropped the attempt to use svm_nextrip_insn_length via
      __get_instruction_length (added in v2).  Just always look
      at upto 15 bytes on AMD.

v5:
      we should make sure that svm_vmexit_gp_intercept is not executed for
      any other guest.
        Added an ASSERT on is_vmware_port_enabled.
      magic integers?
        Added #define for them.
      I am fairly certain that you need some brackets here.
        Added brackets.

 xen/arch/x86/domain.c             |  15 ++--
 xen/arch/x86/hvm/hvm.c            |   9 +++
 xen/arch/x86/hvm/vmware/Makefile  |   1 +
 xen/arch/x86/hvm/vmware/vmport.c  | 148 ++++++++++++++++++++++++++++++++++++++
 xen/include/asm-x86/hvm/domain.h  |   3 +
 xen/include/asm-x86/hvm/hvm.h     |   2 +
 xen/include/public/arch-x86/xen.h |   4 ++
 7 files changed, 177 insertions(+), 5 deletions(-)
 create mode 100644 xen/arch/x86/hvm/vmware/vmport.c

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index a317907..0cf73ef 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -504,6 +504,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 
 static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
 {
+    uint32_t all_emflags = emflags & XEN_X86_EMU_ALL;
+
 #ifdef CONFIG_HVM
     /* This doesn't catch !CONFIG_HVM case but it is better than nothing */
     BUILD_BUG_ON(X86_EMU_ALL != XEN_X86_EMU_ALL);
@@ -512,14 +514,15 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
     if ( is_hvm_domain(d) )
     {
         if ( is_hardware_domain(d) &&
-             emflags != (X86_EMU_VPCI | X86_EMU_LAPIC | X86_EMU_IOAPIC) )
+             all_emflags != (X86_EMU_VPCI | X86_EMU_LAPIC | X86_EMU_IOAPIC) )
             return false;
         if ( !is_hardware_domain(d) &&
-             emflags != (X86_EMU_ALL & ~X86_EMU_VPCI) &&
-             emflags != X86_EMU_LAPIC )
+             all_emflags != (X86_EMU_ALL & ~X86_EMU_VPCI) &&
+             all_emflags != X86_EMU_LAPIC )
             return false;
     }
-    else if ( emflags != 0 && emflags != X86_EMU_PIT )
+    else if ( emflags & XEN_X86_EMU_VMWARE_PORT ||
+              (all_emflags != 0 && all_emflags != X86_EMU_PIT) )
     {
         /* PV or classic PVH. */
         return false;
@@ -581,7 +584,7 @@ int arch_domain_create(struct domain *d,
     if ( is_hardware_domain(d) && is_pv_domain(d) )
         emflags |= XEN_X86_EMU_PIT;
 
-    if ( emflags & ~XEN_X86_EMU_ALL )
+    if ( emflags & ~(XEN_X86_EMU_ALL | XEN_X86_EMU_VMWARE_PORT) )
     {
         printk(XENLOG_G_ERR "d%d: Invalid emulation bitmap: %#x\n",
                d->domain_id, emflags);
@@ -600,6 +603,8 @@ int arch_domain_create(struct domain *d,
     if ( is_hvm_domain(d) )
     {
         d->arch.hvm.vmware_hwver = config->arch.vmware_hwver;
+        d->arch.hvm.is_vmware_port_enabled =
+            !!(emflags & XEN_X86_EMU_VMWARE_PORT);
     }
 
     HYPERVISOR_COMPAT_VIRT_START(d) =
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index e91169f..42d96b1 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -697,6 +697,9 @@ int hvm_domain_initialise(struct domain *d)
     if ( hvm_tsc_scaling_supported )
         d->arch.hvm.tsc_scaling_ratio = hvm_default_tsc_scaling_ratio;
 
+    if ( d->arch.hvm.is_vmware_port_enabled )
+        vmport_register(d);
+
     rc = viridian_domain_init(d);
     if ( rc )
         goto fail2;
@@ -4214,6 +4217,12 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
         rc = xsm_hvm_param_nested(XSM_PRIV, d);
         if ( rc )
             break;
+        /* Prevent nestedhvm enable with vmport */
+        if ( value && d->arch.hvm.is_vmware_port_enabled )
+        {
+            rc = -EOPNOTSUPP;
+            break;
+        }
         if ( value > 1 )
             rc = -EINVAL;
         /*
diff --git a/xen/arch/x86/hvm/vmware/Makefile b/xen/arch/x86/hvm/vmware/Makefile
index f864486..74aea16 100644
--- a/xen/arch/x86/hvm/vmware/Makefile
+++ b/xen/arch/x86/hvm/vmware/Makefile
@@ -1 +1,2 @@
 obj-y += vmware.o
+obj-y += vmport.o
diff --git a/xen/arch/x86/hvm/vmware/vmport.c b/xen/arch/x86/hvm/vmware/vmport.c
new file mode 100644
index 0000000..863ec50
--- /dev/null
+++ b/xen/arch/x86/hvm/vmware/vmport.c
@@ -0,0 +1,148 @@
+/*
+ * HVM VMPORT emulation
+ *
+ * Copyright (C) 2012 Verizon Corporation
+ *
+ * This file is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License Version 2 (GPLv2)
+ * as published by the Free Software Foundation.
+ *
+ * This file is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details. <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/lib.h>
+#include <asm/hvm/hvm.h>
+#include <asm/hvm/support.h>
+
+#include "backdoor_def.h"
+
+static int vmport_ioport(int dir, uint32_t port, uint32_t bytes, uint32_t *val)
+{
+    struct cpu_user_regs *regs = guest_cpu_user_regs();
+
+    /*
+     * While VMware expects only 32-bit in, they do support using
+     * other sizes and out.  However they do require only the 1 port
+     * and the correct value in eax.  Since some of the data
+     * returned in eax is smaller the 32 bits and/or you only need
+     * the other registers the dir and bytes do not need any
+     * checking.  The caller will handle the bytes, and dir is
+     * handled below for eax.
+     */
+    if ( port == BDOOR_PORT && regs->eax == BDOOR_MAGIC )
+    {
+        uint32_t new_eax = ~0u;
+        uint64_t value;
+        struct vcpu *curr = current;
+        struct domain *currd = curr->domain;
+
+        /*
+         * VMware changes the other (non eax) registers ignoring dir
+         * (IN vs OUT).  It also changes only the 32-bit part
+         * leaving the high 32-bits unchanged, unlike what one would
+         * expect to happen.
+         */
+        switch ( regs->ecx & 0xffff )
+        {
+        case BDOOR_CMD_GETMHZ:
+            new_eax = currd->arch.tsc_khz / 1000;
+            break;
+
+        case BDOOR_CMD_GETVERSION:
+            /* MAGIC */
+            regs->ebx = BDOOR_MAGIC;
+            /* VERSION_MAGIC */
+            new_eax = 6;
+            /* Claim we are an ESX. VMX_TYPE_SCALABLE_SERVER */
+            regs->ecx = 2;
+            break;
+
+        case BDOOR_CMD_GETHWVERSION:
+            /* vmware_hw */
+            new_eax = currd->arch.hvm.vmware_hwver;
+            /*
+             * Returning zero is not the best.  VMware was not at
+             * all consistent in the handling of this command until
+             * VMware hardware version 4.  So it is better to claim
+             * 4 then 0.  This should only happen in strange configs.
+             */
+            if ( !new_eax )
+                new_eax = 4;
+            break;
+
+        case BDOOR_CMD_GETHZ:
+        {
+            struct segment_register sreg;
+
+            hvm_get_segment_register(curr, x86_seg_ss, &sreg);
+            if ( sreg.dpl == 0 )
+            {
+                value = currd->arch.tsc_khz * 1000;
+                /* apic-frequency (bus speed) */
+                regs->ecx = 1000000000ULL / APIC_BUS_CYCLE_NS;
+                /* High part of tsc-frequency */
+                regs->ebx = value >> 32;
+                /* Low part of tsc-frequency */
+                new_eax = value;
+            }
+            break;
+
+        }
+        case BDOOR_CMD_GETTIME:
+            value = get_localtime_us(currd) -
+                currd->time_offset.seconds * 1000000ULL;
+            /* hostUsecs */
+            regs->ebx = value % 1000000UL;
+            /* hostSecs */
+            new_eax = value / 1000000ULL;
+            /* maxTimeLag */
+            regs->ecx = 1000000;
+            /* offset to GMT in minutes */
+            regs->edx = currd->time_offset.seconds / 60;
+            break;
+
+        case BDOOR_CMD_GETTIMEFULL:
+            /* BDOOR_MAGIC */
+            new_eax = BDOOR_MAGIC;
+            value = get_localtime_us(currd) -
+                currd->time_offset.seconds * 1000000ULL;
+            /* hostUsecs */
+            regs->ebx = value % 1000000UL;
+            /* hostSecs low 32 bits */
+            regs->edx = value / 1000000ULL;
+            /* hostSecs high 32 bits */
+            regs->esi = (value / 1000000ULL) >> 32;
+            /* maxTimeLag */
+            regs->ecx = 1000000;
+            break;
+
+        default:
+            /* Let backing DM handle */
+            return X86EMUL_UNHANDLEABLE;
+        }
+        if ( dir == IOREQ_READ )
+            *val = new_eax;
+    }
+    else if ( dir == IOREQ_READ )
+        *val = ~0u;
+
+    return X86EMUL_OKAY;
+}
+
+void vmport_register(struct domain *d)
+{
+    register_portio_handler(d, BDOOR_PORT, 4, vmport_ioport);
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-set-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/asm-x86/hvm/domain.h b/xen/include/asm-x86/hvm/domain.h
index 0f64a4b..355777c 100644
--- a/xen/include/asm-x86/hvm/domain.h
+++ b/xen/include/asm-x86/hvm/domain.h
@@ -162,6 +162,9 @@ struct hvm_domain {
     spinlock_t             uc_lock;
     bool_t                 is_in_uc_mode;
 
+    /* VMware backdoor port available */
+    bool_t                 is_vmware_port_enabled;
+
     /* hypervisor intercepted msix table */
     struct list_head       msixtbl_list;
 
diff --git a/xen/include/asm-x86/hvm/hvm.h b/xen/include/asm-x86/hvm/hvm.h
index cb55dfb..74a9590 100644
--- a/xen/include/asm-x86/hvm/hvm.h
+++ b/xen/include/asm-x86/hvm/hvm.h
@@ -789,6 +789,8 @@ static inline bool hvm_has_set_descriptor_access_exiting(void)
 
 #endif  /* CONFIG_HVM */
 
+void vmport_register(struct domain *d);
+
 #endif /* __ASM_X86_HVM_HVM_H__ */
 
 /*
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index 54b1c4d..105c6a3 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -296,6 +296,10 @@ struct xen_arch_domainconfig {
 #define XEN_X86_EMU_USE_PIRQ        (1U<<_XEN_X86_EMU_USE_PIRQ)
 #define _XEN_X86_EMU_VPCI           10
 #define XEN_X86_EMU_VPCI            (1U<<_XEN_X86_EMU_VPCI)
+/* Enable use of vmware backdoor port.
+ * Not part of XEN_X86_EMU_ALL */
+#define _XEN_X86_EMU_VMWARE_PORT    11
+#define XEN_X86_EMU_VMWARE_PORT     (1U<<_XEN_X86_EMU_VMWARE_PORT)
 
 #define XEN_X86_EMU_ALL             (XEN_X86_EMU_LAPIC | XEN_X86_EMU_HPET |  \
                                      XEN_X86_EMU_PM | XEN_X86_EMU_RTC |      \
-- 
1.8.3.1


