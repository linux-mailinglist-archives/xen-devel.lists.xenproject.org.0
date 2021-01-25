Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AF2302B23
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 20:09:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74298.133529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47EZ-0008Ve-Cn; Mon, 25 Jan 2021 19:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74298.133529; Mon, 25 Jan 2021 19:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47EZ-0008V2-8y; Mon, 25 Jan 2021 19:09:07 +0000
Received: by outflank-mailman (input) for mailman id 74298;
 Mon, 25 Jan 2021 19:09:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DTVL=G4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l47EX-0008N7-Ft
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 19:09:05 +0000
Received: from mail-wm1-x332.google.com (unknown [2a00:1450:4864:20::332])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1bf78242-ef3a-4bc0-a562-3df55556a015;
 Mon, 25 Jan 2021 19:08:54 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id i9so560585wmq.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Jan 2021 11:08:54 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k6sm12991031wro.27.2021.01.25.11.08.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 11:08:53 -0800 (PST)
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
X-Inumbo-ID: 1bf78242-ef3a-4bc0-a562-3df55556a015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T4YlJPXxZbXKgBsejUH07Ya0YvCCETQ+Uu7/Rje4XkQ=;
        b=M04qiFqNVD66m2MWoGNhNKculhhp/yHquCxkhF/Ppn3D0WfoGDzhIDBd8h11hn8GBM
         E1J1vt+51knG0U7SapDz5nkpN/Y9PRDxTJbjU4sOBrSikm0I3sLdpAzod+XIzqNJB6ra
         fYGph/n1+LNnfuBTbq0izXOh21lxJaOgNTdQoL0zv6XR8IkM3YQenw+dJB38iq4Ukv/J
         5kN4DS0qH91ANgfxaKV0fM1mDXdHHKBKlfwNqe0G0ZIJdi/xEOELcrZmMUxa88qWPeYZ
         RlEpXdZrOGu6RuR8r8kwoY4KWJAElpDQJZ7TYizJUkctoRrHQHfla+17BaVggB5CIIjy
         X/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T4YlJPXxZbXKgBsejUH07Ya0YvCCETQ+Uu7/Rje4XkQ=;
        b=CPhJNEldIDpVZekZafsz6Flz7PLn+daJg790J1uwizRZo3u9U+E4tmrKt7yP8bBNZt
         1ffHdHh6jtH8koUdL+VyVMB8n+Z23xPRa4PnZt9P4aYqw6L+Un6dvtAIWjI7cYpKD4RU
         Kwki8y7ZPFbcIK9eEABBvVon7o3fbFxB1zbtRsHLNWfa40aq8ELddgztoRywjjoTGxr/
         MtuNurtOu0/mMck57Eoa5NNdo3Z6gKK1xSXVPstvB3a8ieIGyvSCfsH9+L1lfK6mA0hC
         FaCEZbMLGZrN2d8dvNiEasOPtnbEXo9pFbg0kXm8g6dQ8tCfO53mToA37RQoHTUhMBQe
         Sdng==
X-Gm-Message-State: AOAM531gAyVph67g7woRw8omsco4H5SfptMQoU4nMvF0R5uH02HJsk0J
	yiuggjxOZervLlrEc54QjTZrXxemFYqqYQ==
X-Google-Smtp-Source: ABdhPJwhgdaM3c4+MfVVPDpQhYLDJsXNbIjvhJ9mYh3ZxL0/Y4caRqY8tCjRpW10DXvzSzh1GODqAw==
X-Received: by 2002:a1c:9844:: with SMTP id a65mr1435985wme.113.1611601733422;
        Mon, 25 Jan 2021 11:08:53 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V5 01/22] x86/ioreq: Prepare IOREQ feature for making it common
Date: Mon, 25 Jan 2021 21:08:08 +0200
Message-Id: <1611601709-28361-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
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


