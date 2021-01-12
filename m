Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4962F3BEA
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 22:53:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66040.117128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRb4-0002Rc-3x; Tue, 12 Jan 2021 21:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66040.117128; Tue, 12 Jan 2021 21:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRb4-0002R9-0f; Tue, 12 Jan 2021 21:53:02 +0000
Received: by outflank-mailman (input) for mailman id 66040;
 Tue, 12 Jan 2021 21:53:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OoN1=GP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kzRb2-0002PK-GG
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 21:53:00 +0000
Received: from mail-wr1-x42f.google.com (unknown [2a00:1450:4864:20::42f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d71e47a5-40f1-4fca-9139-5c2857d96a4f;
 Tue, 12 Jan 2021 21:52:54 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id r3so29587wrt.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 13:52:54 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 138sm6574053wma.41.2021.01.12.13.52.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Jan 2021 13:52:52 -0800 (PST)
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
X-Inumbo-ID: d71e47a5-40f1-4fca-9139-5c2857d96a4f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gCw6lT9ULGQVEuBIpHE6YdRrisokhnjPBJH9ThI94Es=;
        b=Iel65jIQDaBiIDMJTnFYvs9s5NcidmCoFPb8coYSd/sPXP6Ey83E6tp6BWHJGyxa5G
         M93CteDmCBf2fEMch2HKvGsfdqQkxrO0qOZZeg9L9kAVRcjyeAl9J/CjNWeVf8LwsHrD
         ykN+f6w8yT6IbBvh1hGex0dokjw7tozFK0s3UqwaGvAZPPhjN19IRKiH4Ya7+zq1opG4
         CdsvUzJf+m6sRrSNycVUX8tJOawKX4CXoLr2E9a6x91JnbsNhluXrcCNgQPXowBMnBs8
         7T/v1mydKyi+jlGMOgwqkSQo2J36T/OWav6dYPTHiB4IplN4+Dpfrsuh6wsXhr4AKv2L
         eZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gCw6lT9ULGQVEuBIpHE6YdRrisokhnjPBJH9ThI94Es=;
        b=V+20PmvGd4ConX4xq4G+m1ffI+KghA2lefhige+L2tn3JvkmD7KGL+Gm64e2CPo1N/
         st7pk13G1aSsoi+gQxUMCCl40zugYIO3cdBmcpNZAqmDCEtNZNfF/y4vNxLms//QC12w
         glf+y3ngAEyrPieRZKrBnEmXZ9MVuV/GF6kt7yjA1UVLDKNV4wr1NlXMibWU0nnwe4Yv
         vgZ4TwQLWGtjOCRrXkThE2GRbD0gxt+yK7rRmKb1PwIdjzM6J3/3JuMDjTbCBAmNzqil
         8rZESoVJadQ0vKf4VJD/HtmN3CNhjhjFGKfX4u9NXFBDKdTAjI0p9EVyhOOy5YgYqFUA
         dE7A==
X-Gm-Message-State: AOAM530VrSxtVRteQCbUTRocCCsXpv+STitf5shRPb++wQcZJdz9n+gq
	YcKYe7TEgLJ+U2QIPaUlOSHXnCxOIXTCoA==
X-Google-Smtp-Source: ABdhPJyZRIcdV9UNLz/Sv8L3h0t4tsgm1HqsTM108xOv/+7HGy51OhQ3BVuRZEBowoIYjtFzT98OOQ==
X-Received: by 2002:a5d:45d0:: with SMTP id b16mr809939wrs.220.1610488373102;
        Tue, 12 Jan 2021 13:52:53 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V4 01/24] x86/ioreq: Prepare IOREQ feature for making it common
Date: Tue, 12 Jan 2021 23:52:09 +0200
Message-Id: <1610488352-18494-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

As a lot of x86 code can be re-used on Arm later on, this
patch makes some preparation to x86/hvm/ioreq.c before moving
to the common code. This way we will get a verbatim copy
for a code movement in subsequent patch.

This patch mostly introduces specific hooks to abstract arch
specific materials taking into the account the requirment to leave
the "legacy" mechanism of mapping magic pages for the IOREQ servers
x86 specific and not expose it to the common code.

These hooks are named according to the more consistent new naming
scheme right away (including dropping the "hvm" prefixes and infixes):
- IOREQ server functions should start with "ioreq_server_"
- IOREQ functions should start with "ioreq_"
other functions will be renamed in subsequent patches.

Also re-order #include-s alphabetically.

This support is going to be used on Arm to be able run device
emulator outside of Xen hypervisor.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
CC: Julien Grall <julien.grall@arm.com>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

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

Changes V2 -> V3:
   - update patch description
   - name new arch hooks according to the new naming scheme
   - don't make arch hooks inline, move them ioreq.c
   - make get_ioreq_server() local again
   - rework the whole patch taking into the account that "legacy" interface
     should remain x86 specific (additional arch hooks, etc)
   - update the code to be able to use hvm_map_mem_type_to_ioreq_server()
     in the common code (an extra arch hook, etc)
   - don’t include <asm/hvm/emulate.h> from arch header
   - add "arch" prefix to hvm_ioreq_server_get_type_addr()
   - move IOREQ_STATUS_* #define-s introduction to the separate patch
   - move HANDLE_BUFIOREQ to the arch header
   - just return relocate_portio_handler() from arch_ioreq_server_destroy_all()
   - misc adjustments proposed by Jan (adding const, unsigned int instead of uint32_t)

Changes V3 -> V4:
   - add Alex's R-b
   - update patch description
   - make arch_ioreq_server_get_type_addr return bool
   - drop #include <xen/ctype.h>
   - use two arch hooks in hvm_map_mem_type_to_ioreq_server()
     to avoid calling p2m_change_entry_type_global() with lock held
---
 xen/arch/x86/hvm/ioreq.c        | 179 ++++++++++++++++++++++++++--------------
 xen/include/asm-x86/hvm/ioreq.h |  22 +++++
 2 files changed, 141 insertions(+), 60 deletions(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 1cc27df..468fe84 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -16,16 +16,15 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <xen/ctype.h>
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
 
 #include <asm/hvm/emulate.h>
@@ -170,6 +169,29 @@ static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t *p)
     return true;
 }
 
+bool arch_vcpu_ioreq_completion(enum hvm_io_completion io_completion)
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
@@ -209,19 +231,8 @@ bool handle_hvm_io_completion(struct vcpu *v)
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
+        return arch_vcpu_ioreq_completion(io_completion);
     }
 
     return true;
@@ -477,9 +488,6 @@ static void hvm_update_ioreq_evtchn(struct hvm_ioreq_server *s,
     }
 }
 
-#define HANDLE_BUFIOREQ(s) \
-    ((s)->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF)
-
 static int hvm_ioreq_server_add_vcpu(struct hvm_ioreq_server *s,
                                      struct vcpu *v)
 {
@@ -586,7 +594,7 @@ static void hvm_ioreq_server_remove_all_vcpus(struct hvm_ioreq_server *s)
     spin_unlock(&s->lock);
 }
 
-static int hvm_ioreq_server_map_pages(struct hvm_ioreq_server *s)
+int arch_ioreq_server_map_pages(struct hvm_ioreq_server *s)
 {
     int rc;
 
@@ -601,7 +609,7 @@ static int hvm_ioreq_server_map_pages(struct hvm_ioreq_server *s)
     return rc;
 }
 
-static void hvm_ioreq_server_unmap_pages(struct hvm_ioreq_server *s)
+void arch_ioreq_server_unmap_pages(struct hvm_ioreq_server *s)
 {
     hvm_unmap_ioreq_gfn(s, true);
     hvm_unmap_ioreq_gfn(s, false);
@@ -674,6 +682,12 @@ static int hvm_ioreq_server_alloc_rangesets(struct hvm_ioreq_server *s,
     return rc;
 }
 
+void arch_ioreq_server_enable(struct hvm_ioreq_server *s)
+{
+    hvm_remove_ioreq_gfn(s, false);
+    hvm_remove_ioreq_gfn(s, true);
+}
+
 static void hvm_ioreq_server_enable(struct hvm_ioreq_server *s)
 {
     struct hvm_ioreq_vcpu *sv;
@@ -683,8 +697,7 @@ static void hvm_ioreq_server_enable(struct hvm_ioreq_server *s)
     if ( s->enabled )
         goto done;
 
-    hvm_remove_ioreq_gfn(s, false);
-    hvm_remove_ioreq_gfn(s, true);
+    arch_ioreq_server_enable(s);
 
     s->enabled = true;
 
@@ -697,6 +710,12 @@ static void hvm_ioreq_server_enable(struct hvm_ioreq_server *s)
     spin_unlock(&s->lock);
 }
 
+void arch_ioreq_server_disable(struct hvm_ioreq_server *s)
+{
+    hvm_add_ioreq_gfn(s, true);
+    hvm_add_ioreq_gfn(s, false);
+}
+
 static void hvm_ioreq_server_disable(struct hvm_ioreq_server *s)
 {
     spin_lock(&s->lock);
@@ -704,8 +723,7 @@ static void hvm_ioreq_server_disable(struct hvm_ioreq_server *s)
     if ( !s->enabled )
         goto done;
 
-    hvm_add_ioreq_gfn(s, true);
-    hvm_add_ioreq_gfn(s, false);
+    arch_ioreq_server_disable(s);
 
     s->enabled = false;
 
@@ -750,7 +768,7 @@ static int hvm_ioreq_server_init(struct hvm_ioreq_server *s,
 
  fail_add:
     hvm_ioreq_server_remove_all_vcpus(s);
-    hvm_ioreq_server_unmap_pages(s);
+    arch_ioreq_server_unmap_pages(s);
 
     hvm_ioreq_server_free_rangesets(s);
 
@@ -764,7 +782,7 @@ static void hvm_ioreq_server_deinit(struct hvm_ioreq_server *s)
     hvm_ioreq_server_remove_all_vcpus(s);
 
     /*
-     * NOTE: It is safe to call both hvm_ioreq_server_unmap_pages() and
+     * NOTE: It is safe to call both arch_ioreq_server_unmap_pages() and
      *       hvm_ioreq_server_free_pages() in that order.
      *       This is because the former will do nothing if the pages
      *       are not mapped, leaving the page to be freed by the latter.
@@ -772,7 +790,7 @@ static void hvm_ioreq_server_deinit(struct hvm_ioreq_server *s)
      *       the page_info pointer to NULL, meaning the latter will do
      *       nothing.
      */
-    hvm_ioreq_server_unmap_pages(s);
+    arch_ioreq_server_unmap_pages(s);
     hvm_ioreq_server_free_pages(s);
 
     hvm_ioreq_server_free_rangesets(s);
@@ -836,6 +854,12 @@ int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
     return rc;
 }
 
+/* Called when target domain is paused */
+void arch_ioreq_server_destroy(struct hvm_ioreq_server *s)
+{
+    p2m_set_ioreq_server(s->target, 0, s);
+}
+
 int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
 {
     struct hvm_ioreq_server *s;
@@ -855,7 +879,7 @@ int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
 
     domain_pause(d);
 
-    p2m_set_ioreq_server(d, 0, s);
+    arch_ioreq_server_destroy(s);
 
     hvm_ioreq_server_disable(s);
 
@@ -900,7 +924,7 @@ int hvm_get_ioreq_server_info(struct domain *d, ioservid_t id,
 
     if ( ioreq_gfn || bufioreq_gfn )
     {
-        rc = hvm_ioreq_server_map_pages(s);
+        rc = arch_ioreq_server_map_pages(s);
         if ( rc )
             goto out;
     }
@@ -1080,6 +1104,27 @@ int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
     return rc;
 }
 
+/* Called with ioreq_server lock held */
+int arch_ioreq_server_map_mem_type(struct domain *d,
+                                   struct hvm_ioreq_server *s,
+                                   uint32_t flags)
+{
+    return p2m_set_ioreq_server(d, flags, s);
+}
+
+void arch_ioreq_server_map_mem_type_completed(struct domain *d,
+                                              struct hvm_ioreq_server *s,
+                                              uint32_t flags)
+{
+    if ( flags == 0 )
+    {
+        const struct p2m_domain *p2m = p2m_get_hostp2m(d);
+
+        if ( read_atomic(&p2m->ioreq.entry_count) )
+            p2m_change_entry_type_global(d, p2m_ioreq_server, p2m_ram_rw);
+    }
+}
+
 /*
  * Map or unmap an ioreq server to specific memory type. For now, only
  * HVMMEM_ioreq_server is supported, and in the future new types can be
@@ -1112,18 +1157,13 @@ int hvm_map_mem_type_to_ioreq_server(struct domain *d, ioservid_t id,
     if ( s->emulator != current->domain )
         goto out;
 
-    rc = p2m_set_ioreq_server(d, flags, s);
+    rc = arch_ioreq_server_map_mem_type(d, s, flags);
 
  out:
     spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
 
-    if ( rc == 0 && flags == 0 )
-    {
-        struct p2m_domain *p2m = p2m_get_hostp2m(d);
-
-        if ( read_atomic(&p2m->ioreq.entry_count) )
-            p2m_change_entry_type_global(d, p2m_ioreq_server, p2m_ram_rw);
-    }
+    if ( rc == 0 )
+        arch_ioreq_server_map_mem_type_completed(d, s, flags);
 
     return rc;
 }
@@ -1210,12 +1250,17 @@ void hvm_all_ioreq_servers_remove_vcpu(struct domain *d, struct vcpu *v)
     spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
 }
 
+bool arch_ioreq_server_destroy_all(struct domain *d)
+{
+    return relocate_portio_handler(d, 0xcf8, 0xcf8, 4);
+}
+
 void hvm_destroy_all_ioreq_servers(struct domain *d)
 {
     struct hvm_ioreq_server *s;
     unsigned int id;
 
-    if ( !relocate_portio_handler(d, 0xcf8, 0xcf8, 4) )
+    if ( !arch_ioreq_server_destroy_all(d) )
         return;
 
     spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
@@ -1239,33 +1284,28 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
     spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
 }
 
-struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
-                                                 ioreq_t *p)
+bool arch_ioreq_server_get_type_addr(const struct domain *d,
+                                     const ioreq_t *p,
+                                     uint8_t *type,
+                                     uint64_t *addr)
 {
-    struct hvm_ioreq_server *s;
-    uint32_t cf8;
-    uint8_t type;
-    uint64_t addr;
-    unsigned int id;
+    unsigned int cf8 = d->arch.hvm.pci_cf8;
 
     if ( p->type != IOREQ_TYPE_COPY && p->type != IOREQ_TYPE_PIO )
-        return NULL;
-
-    cf8 = d->arch.hvm.pci_cf8;
+        return false;
 
     if ( p->type == IOREQ_TYPE_PIO &&
          (p->addr & ~3) == 0xcfc &&
          CF8_ENABLED(cf8) )
     {
-        uint32_t x86_fam;
+        unsigned int x86_fam, reg;
         pci_sbdf_t sbdf;
-        unsigned int reg;
 
         reg = hvm_pci_decode_addr(cf8, p->addr, &sbdf);
 
         /* PCI config data cycle */
-        type = XEN_DMOP_IO_RANGE_PCI;
-        addr = ((uint64_t)sbdf.sbdf << 32) | reg;
+        *type = XEN_DMOP_IO_RANGE_PCI;
+        *addr = ((uint64_t)sbdf.sbdf << 32) | reg;
         /* AMD extended configuration space access? */
         if ( CF8_ADDR_HI(cf8) &&
              d->arch.cpuid->x86_vendor == X86_VENDOR_AMD &&
@@ -1277,16 +1317,30 @@ struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
 
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
 
+    return true;
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
+    if ( !arch_ioreq_server_get_type_addr(d, p, &type, &addr) )
+        return NULL;
+
     FOR_EACH_IOREQ_SERVER(d, id, s)
     {
         struct rangeset *r;
@@ -1515,11 +1569,16 @@ static int hvm_access_cf8(
     return X86EMUL_UNHANDLEABLE;
 }
 
+void arch_ioreq_domain_init(struct domain *d)
+{
+    register_portio_handler(d, 0xcf8, 4, hvm_access_cf8);
+}
+
 void hvm_ioreq_init(struct domain *d)
 {
     spin_lock_init(&d->arch.hvm.ioreq_server.lock);
 
-    register_portio_handler(d, 0xcf8, 4, hvm_access_cf8);
+    arch_ioreq_domain_init(d);
 }
 
 /*
diff --git a/xen/include/asm-x86/hvm/ioreq.h b/xen/include/asm-x86/hvm/ioreq.h
index e2588e9..13d35e1 100644
--- a/xen/include/asm-x86/hvm/ioreq.h
+++ b/xen/include/asm-x86/hvm/ioreq.h
@@ -19,6 +19,9 @@
 #ifndef __ASM_X86_HVM_IOREQ_H__
 #define __ASM_X86_HVM_IOREQ_H__
 
+#define HANDLE_BUFIOREQ(s) \
+    ((s)->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF)
+
 bool hvm_io_pending(struct vcpu *v);
 bool handle_hvm_io_completion(struct vcpu *v);
 bool is_ioreq_server_page(struct domain *d, const struct page_info *page);
@@ -55,6 +58,25 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered);
 
 void hvm_ioreq_init(struct domain *d);
 
+bool arch_vcpu_ioreq_completion(enum hvm_io_completion io_completion);
+int arch_ioreq_server_map_pages(struct hvm_ioreq_server *s);
+void arch_ioreq_server_unmap_pages(struct hvm_ioreq_server *s);
+void arch_ioreq_server_enable(struct hvm_ioreq_server *s);
+void arch_ioreq_server_disable(struct hvm_ioreq_server *s);
+void arch_ioreq_server_destroy(struct hvm_ioreq_server *s);
+int arch_ioreq_server_map_mem_type(struct domain *d,
+                                   struct hvm_ioreq_server *s,
+                                   uint32_t flags);
+void arch_ioreq_server_map_mem_type_completed(struct domain *d,
+                                              struct hvm_ioreq_server *s,
+                                              uint32_t flags);
+bool arch_ioreq_server_destroy_all(struct domain *d);
+bool arch_ioreq_server_get_type_addr(const struct domain *d,
+                                     const ioreq_t *p,
+                                     uint8_t *type,
+                                     uint64_t *addr);
+void arch_ioreq_domain_init(struct domain *d);
+
 #endif /* __ASM_X86_HVM_IOREQ_H__ */
 
 /*
-- 
2.7.4


