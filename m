Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B11308361
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 02:49:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77575.140573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5IuQ-0004g9-R0; Fri, 29 Jan 2021 01:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77575.140573; Fri, 29 Jan 2021 01:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5IuQ-0004fc-LY; Fri, 29 Jan 2021 01:49:14 +0000
Received: by outflank-mailman (input) for mailman id 77575;
 Fri, 29 Jan 2021 01:49:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjHm=HA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5IuO-0004da-JD
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 01:49:12 +0000
Received: from mail-lj1-x22a.google.com (unknown [2a00:1450:4864:20::22a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1dfd4df-af45-4f6b-a864-b2fdf9224da7;
 Fri, 29 Jan 2021 01:49:06 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id v15so5733342ljk.13
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 17:49:06 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z128sm1840238lfa.72.2021.01.28.17.49.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Jan 2021 17:49:04 -0800 (PST)
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
X-Inumbo-ID: a1dfd4df-af45-4f6b-a864-b2fdf9224da7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iF2H7PiQj9JssMO7RoW2VaZWE1uSEl4S1uoDxu//ZpY=;
        b=cH7zHDx+WDTtSCTx4VVAeLHc+bSW+X8++MmTZV13m+/RoqHbHA2Gn9rCxgcwk8voGk
         0RAAi8Gke7mCOoR+Y53znPugF2FmmAJfvLXilVoazxf9GaJ3epM4v6C2D725Ez15ARID
         PTuVX/hilV0VT5RcTJ1bRwYDaxPIHHYe/db3dmT0q33pp4JFk6t5uFctpO0ORaLaCDLg
         2Dk3NhDlQ5aQLPEDhMF9qDwUBtGZFMaMzt3MSP9upUF4zpjYXQMsNM1zROEBa0y5jDP8
         LQMjCXuW+Zh8Jxj9YevSA/g7fwLGI+xgcGe0qg9Kq4BiM/HQFv/3BAyopCzFUW1I137T
         /16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iF2H7PiQj9JssMO7RoW2VaZWE1uSEl4S1uoDxu//ZpY=;
        b=tvwa2zmmLcQrpvYsLPpcKdrEcrCulvsooElZs6oZeyLy4aUcUwP0hDfIxbEfVbU733
         fvrwzGyFluFW8NnNHUWXHUJhoCbYEd6klVzlu11yhxl1vCdwvZkpLJaETPpY8C6PIA+D
         BII5XRFs5JAXnySrzscK6/Q4x6wP7eo2WwbUnBeIp5jl15c/0IuEjO5h6bg31hdMXcVj
         iHIY/BQtpPTnTYA18GpL2TZKXGbE+ydMIbyUTKZVSKNt6f0eafMQA7tYq6MdaT4c2BGQ
         SlAs2Wm4tr6ji3r/IqbXh20jnY7pGt4Oank2odxghDuJdu46vKg/b4dTdoepKbCLHleL
         Xy4g==
X-Gm-Message-State: AOAM53200pM7Yjto/bQyxumMd1tA8fG31MX7FgeNkIZ/7KNACMMcDT5N
	ESqmyw/AyjHuUbbgf0Ikz0RPy46Kfgu/6w==
X-Google-Smtp-Source: ABdhPJz2WiyQgDkTXNb96lI/jUceP1Ki2MqoxxsUXAGDJDpsFXKK8gBwvBUSeDC8St/HEdoLJr76jg==
X-Received: by 2002:a05:651c:15:: with SMTP id n21mr1136685lja.347.1611884945116;
        Thu, 28 Jan 2021 17:49:05 -0800 (PST)
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
Subject: [PATCH V6 01/24] x86/ioreq: Prepare IOREQ feature for making it common
Date: Fri, 29 Jan 2021 03:48:29 +0200
Message-Id: <1611884932-1851-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
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

Introduce common ioreq.h right away and put arch hook declarations
there.

Also re-order #include-s alphabetically.

This support is going to be used on Arm to be able run device
emulator outside of Xen hypervisor.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
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

Changes V4 -> V5:
   - add Julien's and Paul's R-b
   - update patch description
   - remove single use variable in arch_ioreq_server_map_mem_type_completed()
   - put multiple function parameters on a single line in the header
     where possible
   - introduce common ioreq.h right away and put arch hooks declarations
     there instead of doing that in patch #4

Changes V5 -> V6:
   - add Jan's A-b
---
---
 xen/arch/x86/hvm/ioreq.c | 175 +++++++++++++++++++++++++++++++----------------
 xen/include/xen/ioreq.h  |  54 +++++++++++++++
 2 files changed, 169 insertions(+), 60 deletions(-)
 create mode 100644 xen/include/xen/ioreq.h

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 1cc27df..3c3c173 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -16,16 +16,16 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <xen/ctype.h>
+#include <xen/domain.h>
+#include <xen/event.h>
 #include <xen/init.h>
+#include <xen/ioreq.h>
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
@@ -170,6 +170,29 @@ static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t *p)
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
+        return arch_vcpu_ioreq_completion(io_completion);
     }
 
     return true;
@@ -477,9 +489,6 @@ static void hvm_update_ioreq_evtchn(struct hvm_ioreq_server *s,
     }
 }
 
-#define HANDLE_BUFIOREQ(s) \
-    ((s)->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF)
-
 static int hvm_ioreq_server_add_vcpu(struct hvm_ioreq_server *s,
                                      struct vcpu *v)
 {
@@ -586,7 +595,7 @@ static void hvm_ioreq_server_remove_all_vcpus(struct hvm_ioreq_server *s)
     spin_unlock(&s->lock);
 }
 
-static int hvm_ioreq_server_map_pages(struct hvm_ioreq_server *s)
+int arch_ioreq_server_map_pages(struct hvm_ioreq_server *s)
 {
     int rc;
 
@@ -601,7 +610,7 @@ static int hvm_ioreq_server_map_pages(struct hvm_ioreq_server *s)
     return rc;
 }
 
-static void hvm_ioreq_server_unmap_pages(struct hvm_ioreq_server *s)
+void arch_ioreq_server_unmap_pages(struct hvm_ioreq_server *s)
 {
     hvm_unmap_ioreq_gfn(s, true);
     hvm_unmap_ioreq_gfn(s, false);
@@ -674,6 +683,12 @@ static int hvm_ioreq_server_alloc_rangesets(struct hvm_ioreq_server *s,
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
@@ -683,8 +698,7 @@ static void hvm_ioreq_server_enable(struct hvm_ioreq_server *s)
     if ( s->enabled )
         goto done;
 
-    hvm_remove_ioreq_gfn(s, false);
-    hvm_remove_ioreq_gfn(s, true);
+    arch_ioreq_server_enable(s);
 
     s->enabled = true;
 
@@ -697,6 +711,12 @@ static void hvm_ioreq_server_enable(struct hvm_ioreq_server *s)
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
@@ -704,8 +724,7 @@ static void hvm_ioreq_server_disable(struct hvm_ioreq_server *s)
     if ( !s->enabled )
         goto done;
 
-    hvm_add_ioreq_gfn(s, true);
-    hvm_add_ioreq_gfn(s, false);
+    arch_ioreq_server_disable(s);
 
     s->enabled = false;
 
@@ -750,7 +769,7 @@ static int hvm_ioreq_server_init(struct hvm_ioreq_server *s,
 
  fail_add:
     hvm_ioreq_server_remove_all_vcpus(s);
-    hvm_ioreq_server_unmap_pages(s);
+    arch_ioreq_server_unmap_pages(s);
 
     hvm_ioreq_server_free_rangesets(s);
 
@@ -764,7 +783,7 @@ static void hvm_ioreq_server_deinit(struct hvm_ioreq_server *s)
     hvm_ioreq_server_remove_all_vcpus(s);
 
     /*
-     * NOTE: It is safe to call both hvm_ioreq_server_unmap_pages() and
+     * NOTE: It is safe to call both arch_ioreq_server_unmap_pages() and
      *       hvm_ioreq_server_free_pages() in that order.
      *       This is because the former will do nothing if the pages
      *       are not mapped, leaving the page to be freed by the latter.
@@ -772,7 +791,7 @@ static void hvm_ioreq_server_deinit(struct hvm_ioreq_server *s)
      *       the page_info pointer to NULL, meaning the latter will do
      *       nothing.
      */
-    hvm_ioreq_server_unmap_pages(s);
+    arch_ioreq_server_unmap_pages(s);
     hvm_ioreq_server_free_pages(s);
 
     hvm_ioreq_server_free_rangesets(s);
@@ -836,6 +855,12 @@ int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
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
@@ -855,7 +880,7 @@ int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
 
     domain_pause(d);
 
-    p2m_set_ioreq_server(d, 0, s);
+    arch_ioreq_server_destroy(s);
 
     hvm_ioreq_server_disable(s);
 
@@ -900,7 +925,7 @@ int hvm_get_ioreq_server_info(struct domain *d, ioservid_t id,
 
     if ( ioreq_gfn || bufioreq_gfn )
     {
-        rc = hvm_ioreq_server_map_pages(s);
+        rc = arch_ioreq_server_map_pages(s);
         if ( rc )
             goto out;
     }
@@ -1080,6 +1105,22 @@ int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
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
+    if ( flags == 0 && read_atomic(&p2m_get_hostp2m(d)->ioreq.entry_count) )
+        p2m_change_entry_type_global(d, p2m_ioreq_server, p2m_ram_rw);
+}
+
 /*
  * Map or unmap an ioreq server to specific memory type. For now, only
  * HVMMEM_ioreq_server is supported, and in the future new types can be
@@ -1112,18 +1153,13 @@ int hvm_map_mem_type_to_ioreq_server(struct domain *d, ioservid_t id,
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
@@ -1210,12 +1246,17 @@ void hvm_all_ioreq_servers_remove_vcpu(struct domain *d, struct vcpu *v)
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
@@ -1239,33 +1280,28 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
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
@@ -1277,16 +1313,30 @@ struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
 
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
@@ -1515,11 +1565,16 @@ static int hvm_access_cf8(
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
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
new file mode 100644
index 0000000..d0980c5
--- /dev/null
+++ b/xen/include/xen/ioreq.h
@@ -0,0 +1,54 @@
+/*
+ * ioreq.h: Hardware virtual machine assist interface definitions.
+ *
+ * Copyright (c) 2016 Citrix Systems Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef __XEN_IOREQ_H__
+#define __XEN_IOREQ_H__
+
+#include <xen/sched.h>
+
+#define HANDLE_BUFIOREQ(s) \
+    ((s)->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF)
+
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
+bool arch_ioreq_server_get_type_addr(const struct domain *d, const ioreq_t *p,
+                                     uint8_t *type, uint64_t *addr);
+void arch_ioreq_domain_init(struct domain *d);
+
+#endif /* __XEN_IOREQ_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.7.4


