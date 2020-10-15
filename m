Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A664228F70C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:45:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7571.19917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6NB-00051O-Cm; Thu, 15 Oct 2020 16:45:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7571.19917; Thu, 15 Oct 2020 16:45:01 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6NB-00050r-8f; Thu, 15 Oct 2020 16:45:01 +0000
Received: by outflank-mailman (input) for mailman id 7571;
 Thu, 15 Oct 2020 16:45:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kT6NA-0004yr-4h
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:45:00 +0000
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b31d87fb-3f7e-45dc-adf7-64a3b9353b5d;
 Thu, 15 Oct 2020 16:44:54 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id h20so3821966lji.9
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:44:54 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.44.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Oct 2020 09:44:52 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kT6NA-0004yr-4h
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:45:00 +0000
X-Inumbo-ID: b31d87fb-3f7e-45dc-adf7-64a3b9353b5d
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b31d87fb-3f7e-45dc-adf7-64a3b9353b5d;
	Thu, 15 Oct 2020 16:44:54 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id h20so3821966lji.9
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nQibM6OLGUJNh20LEK8SFBDh55fjFRwqVu7e0OezZaA=;
        b=LpY/YPInCcQOPibddOk7rTHh7vATE8tPwbTLLzOZ2joUeEnlFw9Alav9KxN5BU8rN1
         Zz+gjFLuNjP1ngfjQdkIn8ECw/vxm+lpCKdrbOClQax7tIEkKaz4/05Cn5N5z+IZAIPw
         66edSD9rtjPvQihcLu0LNUBzX+tD14l+JYOFiiQ+rXdr5yxHF/tZcrHAI7HfeqszEir3
         4wYPe1td5vZdG+kHYhcYRXg2igyqjWYhKLjVEYrmOai/j8TazrYBnhkk466ntVaOilNo
         NLc0f4OfdpbnWnbyvEew5G6xrpLDuIPg+sst0wSXWzyx8bozHokCUFH1BPvx8iEorr1m
         wpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nQibM6OLGUJNh20LEK8SFBDh55fjFRwqVu7e0OezZaA=;
        b=igt2SQuSuvtjIU3daGWKw+uJAnWjKtMH5Nyyjst98RqlvqdTRGgxbYlx956PFCqj29
         YBpWbsFgdN/zv6+8QxP+10FalJwmsnIrizRdpOQkn1+yoVEshJ4brHdLjWnY/DyiZI3n
         8Ah3GsYlPg2V4UvZ19scl8u2IFwiANvqTCtEINnz4fiS+Km9fNhK5n+XcrFC4qNMbmwS
         gLeQaM3nvd1yRQrwtrCx4hd+wrSEbshU/etHRqLJWRau40v1todQi/M9AWixl9yq1ohM
         teH2s4TtVkOZ12bWj+X1RGrMGLJebcvqO/CImNuXz0EGIUhknFWdHZl1KZRNH/kZSH1T
         NVgw==
X-Gm-Message-State: AOAM532+q+ZrGwQ+RCXMRERHJ+WFM3odbWHF+/Vlk9fbyCMjUiFyNULm
	838in9WNEWqf+Khfb8gdX0KYbQDosMx5tw==
X-Google-Smtp-Source: ABdhPJywIMlWOYIyBcJjX6BDz4MfjG3WD16fS8DtYtKnNg29oCzYIjgpeYoPH1rzE2IlVTaEUaA/Aw==
X-Received: by 2002:a2e:b04f:: with SMTP id d15mr1572191ljl.413.1602780292832;
        Thu, 15 Oct 2020 09:44:52 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.44.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2020 09:44:52 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V2 01/23] x86/ioreq: Prepare IOREQ feature for making it common
Date: Thu, 15 Oct 2020 19:44:12 +0300
Message-Id: <1602780274-29141-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

As a lot of x86 code can be re-used on Arm later on, this
patch makes some preparation to x86/hvm/ioreq.c before moving
to the common code. This way we will get a verbatim copy for
a code movement in subsequent patch (arch/x86/hvm/ioreq.c
will be *just* renamed to common/ioreq).

This patch does the following:
1. Introduce *inline* arch_hvm_ioreq_init(), arch_hvm_ioreq_destroy(),
   arch_hvm_io_completion(), arch_hvm_destroy_ioreq_server() and
   hvm_ioreq_server_get_type_addr() to abstract arch specific materials.
2  Make hvm_map_mem_type_to_ioreq_server() *inline*. It is not going
   to be called from the common code.
3. Make get_ioreq_server() global. It is going to be called from
   a few places.
4. Add IOREQ_STATUS_* #define-s and update candidates for moving.
5. Re-order #include-s alphabetically.

This support is going to be used on Arm to be able run device
emulator outside of Xen hypervisor.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - new patch, was split from:
     "[RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common"
   - fold the check of p->type into hvm_get_ioreq_server_range_type()
     and make it return success/failure
   - remove relocate_portio_handler() call from arch_hvm_ioreq_destroy()
     in arch/x86/hvm/ioreq.c
   - introduce arch_hvm_destroy_ioreq_server()/arch_handle_hvm_io_completion()

Changes V1 -> V2:
   - update patch description
   - make arch functions inline and put them into arch header
     to achieve a truly rename by the subsequent patch
   - return void in arch_hvm_destroy_ioreq_server()
   - return bool in arch_hvm_ioreq_destroy()
   - bring relocate_portio_handler() back to arch_hvm_ioreq_destroy()
   - rename IOREQ_IO* to IOREQ_STATUS*
   - remove *handle* from arch_handle_hvm_io_completion()
   - re-order #include-s alphabetically
   - rename hvm_get_ioreq_server_range_type() to hvm_ioreq_server_get_type_addr()
     and add "const" to several arguments
---
 xen/arch/x86/hvm/ioreq.c        | 153 +++++--------------------------------
 xen/include/asm-x86/hvm/ioreq.h | 165 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 184 insertions(+), 134 deletions(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 1cc27df..d3433d7 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -1,5 +1,5 @@
 /*
- * hvm/io.c: hardware virtual machine I/O emulation
+ * ioreq.c: hardware virtual machine I/O emulation
  *
  * Copyright (c) 2016 Citrix Systems Inc.
  *
@@ -17,21 +17,18 @@
  */
 
 #include <xen/ctype.h>
+#include <xen/domain.h>
+#include <xen/event.h>
 #include <xen/init.h>
+#include <xen/irq.h>
 #include <xen/lib.h>
-#include <xen/trace.h>
+#include <xen/paging.h>
 #include <xen/sched.h>
-#include <xen/irq.h>
 #include <xen/softirq.h>
-#include <xen/domain.h>
-#include <xen/event.h>
-#include <xen/paging.h>
+#include <xen/trace.h>
 #include <xen/vpci.h>
 
-#include <asm/hvm/emulate.h>
-#include <asm/hvm/hvm.h>
 #include <asm/hvm/ioreq.h>
-#include <asm/hvm/vmx/vmx.h>
 
 #include <public/hvm/ioreq.h>
 #include <public/hvm/params.h>
@@ -48,8 +45,8 @@ static void set_ioreq_server(struct domain *d, unsigned int id,
 #define GET_IOREQ_SERVER(d, id) \
     (d)->arch.hvm.ioreq_server.server[id]
 
-static struct hvm_ioreq_server *get_ioreq_server(const struct domain *d,
-                                                 unsigned int id)
+struct hvm_ioreq_server *get_ioreq_server(const struct domain *d,
+                                          unsigned int id)
 {
     if ( id >= MAX_NR_IOREQ_SERVERS )
         return NULL;
@@ -209,19 +206,8 @@ bool handle_hvm_io_completion(struct vcpu *v)
         return handle_pio(vio->io_req.addr, vio->io_req.size,
                           vio->io_req.dir);
 
-    case HVMIO_realmode_completion:
-    {
-        struct hvm_emulate_ctxt ctxt;
-
-        hvm_emulate_init_once(&ctxt, NULL, guest_cpu_user_regs());
-        vmx_realmode_emulate_one(&ctxt);
-        hvm_emulate_writeback(&ctxt);
-
-        break;
-    }
     default:
-        ASSERT_UNREACHABLE();
-        break;
+        return arch_hvm_io_completion(io_completion);
     }
 
     return true;
@@ -855,7 +841,7 @@ int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
 
     domain_pause(d);
 
-    p2m_set_ioreq_server(d, 0, s);
+    arch_hvm_destroy_ioreq_server(s);
 
     hvm_ioreq_server_disable(s);
 
@@ -1080,54 +1066,6 @@ int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
     return rc;
 }
 
-/*
- * Map or unmap an ioreq server to specific memory type. For now, only
- * HVMMEM_ioreq_server is supported, and in the future new types can be
- * introduced, e.g. HVMMEM_ioreq_serverX mapped to ioreq server X. And
- * currently, only write operations are to be forwarded to an ioreq server.
- * Support for the emulation of read operations can be added when an ioreq
- * server has such requirement in the future.
- */
-int hvm_map_mem_type_to_ioreq_server(struct domain *d, ioservid_t id,
-                                     uint32_t type, uint32_t flags)
-{
-    struct hvm_ioreq_server *s;
-    int rc;
-
-    if ( type != HVMMEM_ioreq_server )
-        return -EINVAL;
-
-    if ( flags & ~XEN_DMOP_IOREQ_MEM_ACCESS_WRITE )
-        return -EINVAL;
-
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
-
-    s = get_ioreq_server(d, id);
-
-    rc = -ENOENT;
-    if ( !s )
-        goto out;
-
-    rc = -EPERM;
-    if ( s->emulator != current->domain )
-        goto out;
-
-    rc = p2m_set_ioreq_server(d, flags, s);
-
- out:
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
-
-    if ( rc == 0 && flags == 0 )
-    {
-        struct p2m_domain *p2m = p2m_get_hostp2m(d);
-
-        if ( read_atomic(&p2m->ioreq.entry_count) )
-            p2m_change_entry_type_global(d, p2m_ioreq_server, p2m_ram_rw);
-    }
-
-    return rc;
-}
-
 int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
                                bool enabled)
 {
@@ -1215,7 +1153,7 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
     struct hvm_ioreq_server *s;
     unsigned int id;
 
-    if ( !relocate_portio_handler(d, 0xcf8, 0xcf8, 4) )
+    if ( !arch_hvm_ioreq_destroy(d) )
         return;
 
     spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
@@ -1243,50 +1181,13 @@ struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
                                                  ioreq_t *p)
 {
     struct hvm_ioreq_server *s;
-    uint32_t cf8;
     uint8_t type;
     uint64_t addr;
     unsigned int id;
 
-    if ( p->type != IOREQ_TYPE_COPY && p->type != IOREQ_TYPE_PIO )
+    if ( hvm_ioreq_server_get_type_addr(d, p, &type, &addr) )
         return NULL;
 
-    cf8 = d->arch.hvm.pci_cf8;
-
-    if ( p->type == IOREQ_TYPE_PIO &&
-         (p->addr & ~3) == 0xcfc &&
-         CF8_ENABLED(cf8) )
-    {
-        uint32_t x86_fam;
-        pci_sbdf_t sbdf;
-        unsigned int reg;
-
-        reg = hvm_pci_decode_addr(cf8, p->addr, &sbdf);
-
-        /* PCI config data cycle */
-        type = XEN_DMOP_IO_RANGE_PCI;
-        addr = ((uint64_t)sbdf.sbdf << 32) | reg;
-        /* AMD extended configuration space access? */
-        if ( CF8_ADDR_HI(cf8) &&
-             d->arch.cpuid->x86_vendor == X86_VENDOR_AMD &&
-             (x86_fam = get_cpu_family(
-                 d->arch.cpuid->basic.raw_fms, NULL, NULL)) >= 0x10 &&
-             x86_fam < 0x17 )
-        {
-            uint64_t msr_val;
-
-            if ( !rdmsr_safe(MSR_AMD64_NB_CFG, msr_val) &&
-                 (msr_val & (1ULL << AMD64_NB_CFG_CF8_EXT_ENABLE_BIT)) )
-                addr |= CF8_ADDR_HI(cf8);
-        }
-    }
-    else
-    {
-        type = (p->type == IOREQ_TYPE_PIO) ?
-                XEN_DMOP_IO_RANGE_PORT : XEN_DMOP_IO_RANGE_MEMORY;
-        addr = p->addr;
-    }
-
     FOR_EACH_IOREQ_SERVER(d, id, s)
     {
         struct rangeset *r;
@@ -1351,7 +1252,7 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
     pg = iorp->va;
 
     if ( !pg )
-        return X86EMUL_UNHANDLEABLE;
+        return IOREQ_STATUS_UNHANDLED;
 
     /*
      * Return 0 for the cases we can't deal with:
@@ -1381,7 +1282,7 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
         break;
     default:
         gdprintk(XENLOG_WARNING, "unexpected ioreq size: %u\n", p->size);
-        return X86EMUL_UNHANDLEABLE;
+        return IOREQ_STATUS_UNHANDLED;
     }
 
     spin_lock(&s->bufioreq_lock);
@@ -1391,7 +1292,7 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
     {
         /* The queue is full: send the iopacket through the normal path. */
         spin_unlock(&s->bufioreq_lock);
-        return X86EMUL_UNHANDLEABLE;
+        return IOREQ_STATUS_UNHANDLED;
     }
 
     pg->buf_ioreq[pg->ptrs.write_pointer % IOREQ_BUFFER_SLOT_NUM] = bp;
@@ -1422,7 +1323,7 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
     notify_via_xen_event_channel(d, s->bufioreq_evtchn);
     spin_unlock(&s->bufioreq_lock);
 
-    return X86EMUL_OKAY;
+    return IOREQ_STATUS_HANDLED;
 }
 
 int hvm_send_ioreq(struct hvm_ioreq_server *s, ioreq_t *proto_p,
@@ -1438,7 +1339,7 @@ int hvm_send_ioreq(struct hvm_ioreq_server *s, ioreq_t *proto_p,
         return hvm_send_buffered_ioreq(s, proto_p);
 
     if ( unlikely(!vcpu_start_shutdown_deferral(curr)) )
-        return X86EMUL_RETRY;
+        return IOREQ_STATUS_RETRY;
 
     list_for_each_entry ( sv,
                           &s->ioreq_vcpu_list,
@@ -1478,11 +1379,11 @@ int hvm_send_ioreq(struct hvm_ioreq_server *s, ioreq_t *proto_p,
             notify_via_xen_event_channel(d, port);
 
             sv->pending = true;
-            return X86EMUL_RETRY;
+            return IOREQ_STATUS_RETRY;
         }
     }
 
-    return X86EMUL_UNHANDLEABLE;
+    return IOREQ_STATUS_UNHANDLED;
 }
 
 unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered)
@@ -1496,30 +1397,18 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered)
         if ( !s->enabled )
             continue;
 
-        if ( hvm_send_ioreq(s, p, buffered) == X86EMUL_UNHANDLEABLE )
+        if ( hvm_send_ioreq(s, p, buffered) == IOREQ_STATUS_UNHANDLED )
             failed++;
     }
 
     return failed;
 }
 
-static int hvm_access_cf8(
-    int dir, unsigned int port, unsigned int bytes, uint32_t *val)
-{
-    struct domain *d = current->domain;
-
-    if ( dir == IOREQ_WRITE && bytes == 4 )
-        d->arch.hvm.pci_cf8 = *val;
-
-    /* We always need to fall through to the catch all emulator */
-    return X86EMUL_UNHANDLEABLE;
-}
-
 void hvm_ioreq_init(struct domain *d)
 {
     spin_lock_init(&d->arch.hvm.ioreq_server.lock);
 
-    register_portio_handler(d, 0xcf8, 4, hvm_access_cf8);
+    arch_hvm_ioreq_init(d);
 }
 
 /*
diff --git a/xen/include/asm-x86/hvm/ioreq.h b/xen/include/asm-x86/hvm/ioreq.h
index e2588e9..376e2ef 100644
--- a/xen/include/asm-x86/hvm/ioreq.h
+++ b/xen/include/asm-x86/hvm/ioreq.h
@@ -19,6 +19,165 @@
 #ifndef __ASM_X86_HVM_IOREQ_H__
 #define __ASM_X86_HVM_IOREQ_H__
 
+#include <asm/hvm/emulate.h>
+#include <asm/hvm/vmx/vmx.h>
+
+#include <public/hvm/params.h>
+
+struct hvm_ioreq_server *get_ioreq_server(const struct domain *d,
+                                          unsigned int id);
+
+static inline bool arch_hvm_io_completion(enum hvm_io_completion io_completion)
+{
+    switch ( io_completion )
+    {
+    case HVMIO_realmode_completion:
+    {
+        struct hvm_emulate_ctxt ctxt;
+
+        hvm_emulate_init_once(&ctxt, NULL, guest_cpu_user_regs());
+        vmx_realmode_emulate_one(&ctxt);
+        hvm_emulate_writeback(&ctxt);
+
+        break;
+    }
+
+    default:
+        ASSERT_UNREACHABLE();
+        break;
+    }
+
+    return true;
+}
+
+/* Called when target domain is paused */
+static inline void arch_hvm_destroy_ioreq_server(struct hvm_ioreq_server *s)
+{
+    p2m_set_ioreq_server(s->target, 0, s);
+}
+
+/*
+ * Map or unmap an ioreq server to specific memory type. For now, only
+ * HVMMEM_ioreq_server is supported, and in the future new types can be
+ * introduced, e.g. HVMMEM_ioreq_serverX mapped to ioreq server X. And
+ * currently, only write operations are to be forwarded to an ioreq server.
+ * Support for the emulation of read operations can be added when an ioreq
+ * server has such requirement in the future.
+ */
+static inline int hvm_map_mem_type_to_ioreq_server(struct domain *d,
+                                                   ioservid_t id,
+                                                   uint32_t type,
+                                                   uint32_t flags)
+{
+    struct hvm_ioreq_server *s;
+    int rc;
+
+    if ( type != HVMMEM_ioreq_server )
+        return -EINVAL;
+
+    if ( flags & ~XEN_DMOP_IOREQ_MEM_ACCESS_WRITE )
+        return -EINVAL;
+
+    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+
+    s = get_ioreq_server(d, id);
+
+    rc = -ENOENT;
+    if ( !s )
+        goto out;
+
+    rc = -EPERM;
+    if ( s->emulator != current->domain )
+        goto out;
+
+    rc = p2m_set_ioreq_server(d, flags, s);
+
+ out:
+    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+
+    if ( rc == 0 && flags == 0 )
+    {
+        struct p2m_domain *p2m = p2m_get_hostp2m(d);
+
+        if ( read_atomic(&p2m->ioreq.entry_count) )
+            p2m_change_entry_type_global(d, p2m_ioreq_server, p2m_ram_rw);
+    }
+
+    return rc;
+}
+
+static inline int hvm_ioreq_server_get_type_addr(const struct domain *d,
+                                                 const ioreq_t *p,
+                                                 uint8_t *type,
+                                                 uint64_t *addr)
+{
+    uint32_t cf8 = d->arch.hvm.pci_cf8;
+
+    if ( p->type != IOREQ_TYPE_COPY && p->type != IOREQ_TYPE_PIO )
+        return -EINVAL;
+
+    if ( p->type == IOREQ_TYPE_PIO &&
+         (p->addr & ~3) == 0xcfc &&
+         CF8_ENABLED(cf8) )
+    {
+        uint32_t x86_fam;
+        pci_sbdf_t sbdf;
+        unsigned int reg;
+
+        reg = hvm_pci_decode_addr(cf8, p->addr, &sbdf);
+
+        /* PCI config data cycle */
+        *type = XEN_DMOP_IO_RANGE_PCI;
+        *addr = ((uint64_t)sbdf.sbdf << 32) | reg;
+        /* AMD extended configuration space access? */
+        if ( CF8_ADDR_HI(cf8) &&
+             d->arch.cpuid->x86_vendor == X86_VENDOR_AMD &&
+             (x86_fam = get_cpu_family(
+                 d->arch.cpuid->basic.raw_fms, NULL, NULL)) >= 0x10 &&
+             x86_fam < 0x17 )
+        {
+            uint64_t msr_val;
+
+            if ( !rdmsr_safe(MSR_AMD64_NB_CFG, msr_val) &&
+                 (msr_val & (1ULL << AMD64_NB_CFG_CF8_EXT_ENABLE_BIT)) )
+                *addr |= CF8_ADDR_HI(cf8);
+        }
+    }
+    else
+    {
+        *type = (p->type == IOREQ_TYPE_PIO) ?
+                 XEN_DMOP_IO_RANGE_PORT : XEN_DMOP_IO_RANGE_MEMORY;
+        *addr = p->addr;
+    }
+
+    return 0;
+}
+
+static inline int hvm_access_cf8(
+    int dir, unsigned int port, unsigned int bytes, uint32_t *val)
+{
+    struct domain *d = current->domain;
+
+    if ( dir == IOREQ_WRITE && bytes == 4 )
+        d->arch.hvm.pci_cf8 = *val;
+
+    /* We always need to fall through to the catch all emulator */
+    return X86EMUL_UNHANDLEABLE;
+}
+
+static inline void arch_hvm_ioreq_init(struct domain *d)
+{
+    register_portio_handler(d, 0xcf8, 4, hvm_access_cf8);
+}
+
+static inline bool arch_hvm_ioreq_destroy(struct domain *d)
+{
+    if ( !relocate_portio_handler(d, 0xcf8, 0xcf8, 4) )
+        return false;
+
+    return true;
+}
+
 bool hvm_io_pending(struct vcpu *v);
 bool handle_hvm_io_completion(struct vcpu *v);
 bool is_ioreq_server_page(struct domain *d, const struct page_info *page);
@@ -38,8 +197,6 @@ int hvm_map_io_range_to_ioreq_server(struct domain *d, ioservid_t id,
 int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
                                          uint32_t type, uint64_t start,
                                          uint64_t end);
-int hvm_map_mem_type_to_ioreq_server(struct domain *d, ioservid_t id,
-                                     uint32_t type, uint32_t flags);
 int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
                                bool enabled);
 
@@ -55,6 +212,10 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered);
 
 void hvm_ioreq_init(struct domain *d);
 
+#define IOREQ_STATUS_HANDLED     X86EMUL_OKAY
+#define IOREQ_STATUS_UNHANDLED   X86EMUL_UNHANDLEABLE
+#define IOREQ_STATUS_RETRY       X86EMUL_RETRY
+
 #endif /* __ASM_X86_HVM_IOREQ_H__ */
 
 /*
-- 
2.7.4


