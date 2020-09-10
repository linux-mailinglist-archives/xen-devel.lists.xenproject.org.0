Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4C8265098
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 22:22:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGT5W-0004Jj-S9; Thu, 10 Sep 2020 20:22:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQLO=CT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kGT5U-0004JK-SH
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 20:22:32 +0000
X-Inumbo-ID: 3bba4dcf-c72b-4725-90a8-348d49e92c4b
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3bba4dcf-c72b-4725-90a8-348d49e92c4b;
 Thu, 10 Sep 2020 20:22:27 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y11so4304714lfl.5
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2020 13:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=n2nf5IYkeDI6RdI6d71oNNusBGrb8791Be8/WSU4WGo=;
 b=Py/3IXhws5PM+yVYrHIdbxRBYMn3I1qIvkKGaMLSdwnCMpUarVDwXesFnQ5wtl7Lx6
 y7E+Zr7GJVX+SldQ3Y1JkHWwlMxlkTu88vVXK5Shptom2uF0OoySU6zn/bkhAe/66Y3H
 ZTp8mnQ9V7zmHd5cUSxyPsYzbQfvmPm3yqfjtuOdjbV64BQDU5Tl3usZa2gJxuLNB0sf
 sH5FLCMH4tRIlxVWvwA6KKZkT6rVkF3HAVQHCRl3G9yNjrdoGRAh44fX58Jg2LWceTxC
 ZrRqVsJANZOs+U+loeev31kQmjpKF0UeCRTtjkU8H3DYVVBYE43PCTvdX5ROCTcIjEjZ
 zaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=n2nf5IYkeDI6RdI6d71oNNusBGrb8791Be8/WSU4WGo=;
 b=NnYsbkulNE8mTdMYFUoLIHgr6t9/WAayVCila5Qxe4g8zia5AOpBpJ2blG7F2tkxJS
 wtfGsapQzQWTiqdviX9vrC9d3ljh+lHvvZZL0/+nPgnFXBB+bMi4DVqPQFkfMqQTlUmz
 andW2CGH1QNd4b//bvQBz8Z9uqiRBKcHdeyyp+UfUCQiPdhJ91Sht/cBelF1k3jMBflQ
 T6B3J3++SeLVyMdY7zGhxm9DIMetiUXlUbGdlbwYp9VfmUXcob/zCnlVk6s6JFYcQm7A
 7b4W+amD218yPKApsV1eKv4Xq/G7okpJYDk8jLFWbbE+c9XHvwiTXbVE/WMSt7xpO0iu
 jpZg==
X-Gm-Message-State: AOAM533ueCNqTE62u61VzKlccnMB6bj4dxtWZUMZq0krjHsBXDLACe5t
 AcF/EUgj4iIitvWIgT5JBaBDcb0NZ7Fg+g==
X-Google-Smtp-Source: ABdhPJwIZc5VNl81pBjgzc3nALZ4KlXWGfDDxaok3/m8HGZY4dO9fpP3yUJXuBUyTtXmIE7W8GmHsg==
X-Received: by 2002:a19:5214:: with SMTP id m20mr4996228lfb.138.1599769346337; 
 Thu, 10 Sep 2020 13:22:26 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u5sm1584375lfq.17.2020.09.10.13.22.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Sep 2020 13:22:25 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
Subject: [PATCH V1 01/16] x86/ioreq: Prepare IOREQ feature for making it common
Date: Thu, 10 Sep 2020 23:21:55 +0300
Message-Id: <1599769330-17656-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
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

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

As a lot of x86 code can be re-used on Arm later on, this patch
prepares IOREQ support before moving to the common code. This way
we will get almost a verbatim copy for a code movement.

This support is going to be used on Arm to be able run device
emulator outside of Xen hypervisor.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

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
---
---
 xen/arch/x86/hvm/ioreq.c        | 117 ++++++++++++++++++++++++++--------------
 xen/include/asm-x86/hvm/ioreq.h |  16 ++++++
 2 files changed, 93 insertions(+), 40 deletions(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 1cc27df..d912655 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -170,6 +170,29 @@ static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t *p)
     return true;
 }
 
+bool arch_handle_hvm_io_completion(enum hvm_io_completion io_completion)
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
 bool handle_hvm_io_completion(struct vcpu *v)
 {
     struct domain *d = v->domain;
@@ -209,19 +232,8 @@ bool handle_hvm_io_completion(struct vcpu *v)
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
+        return arch_handle_hvm_io_completion(io_completion);
     }
 
     return true;
@@ -836,6 +848,12 @@ int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
     return rc;
 }
 
+/* Called when target domain is paused */
+int arch_hvm_destroy_ioreq_server(struct hvm_ioreq_server *s)
+{
+    return p2m_set_ioreq_server(s->target, 0, s);
+}
+
 int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
 {
     struct hvm_ioreq_server *s;
@@ -855,7 +873,7 @@ int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
 
     domain_pause(d);
 
-    p2m_set_ioreq_server(d, 0, s);
+    arch_hvm_destroy_ioreq_server(s);
 
     hvm_ioreq_server_disable(s);
 
@@ -1215,8 +1233,7 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
     struct hvm_ioreq_server *s;
     unsigned int id;
 
-    if ( !relocate_portio_handler(d, 0xcf8, 0xcf8, 4) )
-        return;
+    arch_hvm_ioreq_destroy(d);
 
     spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
 
@@ -1239,19 +1256,15 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
     spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
 }
 
-struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
-                                                 ioreq_t *p)
+int hvm_get_ioreq_server_range_type(struct domain *d,
+                                    ioreq_t *p,
+                                    uint8_t *type,
+                                    uint64_t *addr)
 {
-    struct hvm_ioreq_server *s;
-    uint32_t cf8;
-    uint8_t type;
-    uint64_t addr;
-    unsigned int id;
+    uint32_t cf8 = d->arch.hvm.pci_cf8;
 
     if ( p->type != IOREQ_TYPE_COPY && p->type != IOREQ_TYPE_PIO )
-        return NULL;
-
-    cf8 = d->arch.hvm.pci_cf8;
+        return -EINVAL;
 
     if ( p->type == IOREQ_TYPE_PIO &&
          (p->addr & ~3) == 0xcfc &&
@@ -1264,8 +1277,8 @@ struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
         reg = hvm_pci_decode_addr(cf8, p->addr, &sbdf);
 
         /* PCI config data cycle */
-        type = XEN_DMOP_IO_RANGE_PCI;
-        addr = ((uint64_t)sbdf.sbdf << 32) | reg;
+        *type = XEN_DMOP_IO_RANGE_PCI;
+        *addr = ((uint64_t)sbdf.sbdf << 32) | reg;
         /* AMD extended configuration space access? */
         if ( CF8_ADDR_HI(cf8) &&
              d->arch.cpuid->x86_vendor == X86_VENDOR_AMD &&
@@ -1277,16 +1290,30 @@ struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
 
             if ( !rdmsr_safe(MSR_AMD64_NB_CFG, msr_val) &&
                  (msr_val & (1ULL << AMD64_NB_CFG_CF8_EXT_ENABLE_BIT)) )
-                addr |= CF8_ADDR_HI(cf8);
+                *addr |= CF8_ADDR_HI(cf8);
         }
     }
     else
     {
-        type = (p->type == IOREQ_TYPE_PIO) ?
-                XEN_DMOP_IO_RANGE_PORT : XEN_DMOP_IO_RANGE_MEMORY;
-        addr = p->addr;
+        *type = (p->type == IOREQ_TYPE_PIO) ?
+                 XEN_DMOP_IO_RANGE_PORT : XEN_DMOP_IO_RANGE_MEMORY;
+        *addr = p->addr;
     }
 
+    return 0;
+}
+
+struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
+                                                 ioreq_t *p)
+{
+    struct hvm_ioreq_server *s;
+    uint8_t type;
+    uint64_t addr;
+    unsigned int id;
+
+    if ( hvm_get_ioreq_server_range_type(d, p, &type, &addr) )
+        return NULL;
+
     FOR_EACH_IOREQ_SERVER(d, id, s)
     {
         struct rangeset *r;
@@ -1351,7 +1378,7 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
     pg = iorp->va;
 
     if ( !pg )
-        return X86EMUL_UNHANDLEABLE;
+        return IOREQ_IO_UNHANDLED;
 
     /*
      * Return 0 for the cases we can't deal with:
@@ -1381,7 +1408,7 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
         break;
     default:
         gdprintk(XENLOG_WARNING, "unexpected ioreq size: %u\n", p->size);
-        return X86EMUL_UNHANDLEABLE;
+        return IOREQ_IO_UNHANDLED;
     }
 
     spin_lock(&s->bufioreq_lock);
@@ -1391,7 +1418,7 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
     {
         /* The queue is full: send the iopacket through the normal path. */
         spin_unlock(&s->bufioreq_lock);
-        return X86EMUL_UNHANDLEABLE;
+        return IOREQ_IO_UNHANDLED;
     }
 
     pg->buf_ioreq[pg->ptrs.write_pointer % IOREQ_BUFFER_SLOT_NUM] = bp;
@@ -1422,7 +1449,7 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
     notify_via_xen_event_channel(d, s->bufioreq_evtchn);
     spin_unlock(&s->bufioreq_lock);
 
-    return X86EMUL_OKAY;
+    return IOREQ_IO_HANDLED;
 }
 
 int hvm_send_ioreq(struct hvm_ioreq_server *s, ioreq_t *proto_p,
@@ -1438,7 +1465,7 @@ int hvm_send_ioreq(struct hvm_ioreq_server *s, ioreq_t *proto_p,
         return hvm_send_buffered_ioreq(s, proto_p);
 
     if ( unlikely(!vcpu_start_shutdown_deferral(curr)) )
-        return X86EMUL_RETRY;
+        return IOREQ_IO_RETRY;
 
     list_for_each_entry ( sv,
                           &s->ioreq_vcpu_list,
@@ -1478,11 +1505,11 @@ int hvm_send_ioreq(struct hvm_ioreq_server *s, ioreq_t *proto_p,
             notify_via_xen_event_channel(d, port);
 
             sv->pending = true;
-            return X86EMUL_RETRY;
+            return IOREQ_IO_RETRY;
         }
     }
 
-    return X86EMUL_UNHANDLEABLE;
+    return IOREQ_IO_UNHANDLED;
 }
 
 unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered)
@@ -1496,7 +1523,7 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered)
         if ( !s->enabled )
             continue;
 
-        if ( hvm_send_ioreq(s, p, buffered) == X86EMUL_UNHANDLEABLE )
+        if ( hvm_send_ioreq(s, p, buffered) == IOREQ_IO_UNHANDLED )
             failed++;
     }
 
@@ -1515,11 +1542,21 @@ static int hvm_access_cf8(
     return X86EMUL_UNHANDLEABLE;
 }
 
+void arch_hvm_ioreq_init(struct domain *d)
+{
+    register_portio_handler(d, 0xcf8, 4, hvm_access_cf8);
+}
+
+void arch_hvm_ioreq_destroy(struct domain *d)
+{
+
+}
+
 void hvm_ioreq_init(struct domain *d)
 {
     spin_lock_init(&d->arch.hvm.ioreq_server.lock);
 
-    register_portio_handler(d, 0xcf8, 4, hvm_access_cf8);
+    arch_hvm_ioreq_init(d);
 }
 
 /*
diff --git a/xen/include/asm-x86/hvm/ioreq.h b/xen/include/asm-x86/hvm/ioreq.h
index e2588e9..151b92b 100644
--- a/xen/include/asm-x86/hvm/ioreq.h
+++ b/xen/include/asm-x86/hvm/ioreq.h
@@ -55,6 +55,22 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered);
 
 void hvm_ioreq_init(struct domain *d);
 
+int arch_hvm_destroy_ioreq_server(struct hvm_ioreq_server *s);
+
+bool arch_handle_hvm_io_completion(enum hvm_io_completion io_completion);
+
+int hvm_get_ioreq_server_range_type(struct domain *d,
+                                    ioreq_t *p,
+                                    uint8_t *type,
+                                    uint64_t *addr);
+
+void arch_hvm_ioreq_init(struct domain *d);
+void arch_hvm_ioreq_destroy(struct domain *d);
+
+#define IOREQ_IO_HANDLED     X86EMUL_OKAY
+#define IOREQ_IO_UNHANDLED   X86EMUL_UNHANDLEABLE
+#define IOREQ_IO_RETRY       X86EMUL_RETRY
+
 #endif /* __ASM_X86_HVM_IOREQ_H__ */
 
 /*
-- 
2.7.4


