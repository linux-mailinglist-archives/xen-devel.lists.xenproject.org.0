Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57768308378
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 02:59:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77620.140684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5J3p-0006dI-E7; Fri, 29 Jan 2021 01:58:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77620.140684; Fri, 29 Jan 2021 01:58:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5J3p-0006cn-AX; Fri, 29 Jan 2021 01:58:57 +0000
Received: by outflank-mailman (input) for mailman id 77620;
 Fri, 29 Jan 2021 01:58:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjHm=HA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5IvH-0004da-LC
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 01:50:07 +0000
Received: from mail-lj1-x236.google.com (unknown [2a00:1450:4864:20::236])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3524506d-ba43-4f59-a4fe-2ef0c65ce5d0;
 Fri, 29 Jan 2021 01:49:20 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id f19so8726928ljn.5
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 17:49:19 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z128sm1840238lfa.72.2021.01.28.17.49.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Jan 2021 17:49:17 -0800 (PST)
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
X-Inumbo-ID: 3524506d-ba43-4f59-a4fe-2ef0c65ce5d0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rE23lbgtf65G+twheVdGK7cR9mupdBzhdkIIIy/5aEY=;
        b=dKJAnl5Pd43x0jPezgmFDPizbM6c8AkZ+Zd5H4gIgd+61vniqzmj/JzJh+mDUTZOAp
         5et5eiip4qLUz3AXXuNDXgjeLq0p5HrRG9xjeiFhCemXJVSr/M2cXRgRm0kTbTQ3fZxA
         cYUpzaAz1DzDZdVzD4dU+x7KWuenZHPWHQC+MFHIiE9XCQt1oiSzL6bq7U8w8mupcPHx
         Esfh2ZQK+/nsVDs/xzkGzCZbaSKqrOwUMrBsBrEzTZXiMVuRhVDAg2pbzAKl9FbgBle9
         3zuHG+FMx8YcpLWQ/t7lYKhFyfQkDdW3NRsQ0rmV+vxZCYujFmsruRCZCu8V8lky2+jM
         uhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rE23lbgtf65G+twheVdGK7cR9mupdBzhdkIIIy/5aEY=;
        b=Wsx1mKk9ZtmLWvPw9TILUAGTeuAxnB0NiTzUCa1/3ip3IglK9Q3MaIGzxQlVjxUUcN
         4FIRXhNdk/Gy15DV0zO1V7VtymzDCrjDZeHyXujvZOepAkKV4bg2hFbv0FyPkC//UiBB
         vbAoPdxcwQbIq/yAqadaLW647TjBN0gJ9PxS/ieb58JE/tEYvpT65B0QDyw6JyQWoBFt
         YPJW34pokPnUfH494In1iv5ku3Xdm3GhXNGXsZ/XHpBVHCQQcVG3pE7Tq2JryddMMkyx
         zkVIZI3B8/0exRKkDuyxeTT790qLy7bTa9Cux/CaPF7wiBcxqAVFRY+EyHgALQq80vdf
         RGVg==
X-Gm-Message-State: AOAM531g5DaxivU8+jYkL4G8ijtg91PJVy1c3G3Swxl5NhHGLdHRKRSW
	nJKo4ahJW/L+u/fnkp8aCVhUVWBM7mPwjg==
X-Google-Smtp-Source: ABdhPJwbnFZlevimcDR6iI7WW4iUgOlpf5rK896pBV07zOl2Vht15LBRjhLIK9chqMq6Qxosu3YtCA==
X-Received: by 2002:a2e:a583:: with SMTP id m3mr1149855ljp.291.1611884958405;
        Thu, 28 Jan 2021 17:49:18 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V6 12/24] xen/ioreq: Remove "hvm" prefixes from involved function names
Date: Fri, 29 Jan 2021 03:48:40 +0200
Message-Id: <1611884932-1851-13-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch removes "hvm" prefixes and infixes from IOREQ related
function names in the common code and performs a renaming where
appropriate according to the more consistent new naming scheme:
- IOREQ server functions should start with "ioreq_server_"
- IOREQ functions should start with "ioreq_"

A few function names are clarified to better fit into their purposes:
handle_hvm_io_completion -> vcpu_ioreq_handle_completion
hvm_io_pending           -> vcpu_ioreq_pending
hvm_ioreq_init           -> ioreq_domain_init
hvm_alloc_ioreq_mfn      -> ioreq_server_alloc_mfn
hvm_free_ioreq_mfn       -> ioreq_server_free_mfn

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
CC: Julien Grall <julien.grall@arm.com>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes V1 -> V2:
   - new patch

Changes V2 -> V3:
   - update patch according the "legacy interface" is x86 specific
   - update patch description
   - rename everything touched according to new naming scheme

Changes V3 -> V4:
   - rebase
   - rename ioreq_update_evtchn() to ioreq_server_update_evtchn()
   - add Jan's R-b

Changes V4 -> V5:
   - rebase
   - add Paul's R-b

Changes V5 -> V6:
   - no changes

---
---
 xen/arch/x86/hvm/emulate.c  |   6 +-
 xen/arch/x86/hvm/hvm.c      |  10 ++--
 xen/arch/x86/hvm/io.c       |   6 +-
 xen/arch/x86/hvm/ioreq.c    |   2 +-
 xen/arch/x86/hvm/stdvga.c   |   4 +-
 xen/arch/x86/hvm/vmx/vvmx.c |   2 +-
 xen/common/ioreq.c          | 138 ++++++++++++++++++++++----------------------
 xen/common/memory.c         |   2 +-
 xen/include/xen/ioreq.h     |  26 ++++-----
 9 files changed, 98 insertions(+), 98 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 21051ce..425c8dd 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -261,7 +261,7 @@ static int hvmemul_do_io(
          * an ioreq server that can handle it.
          *
          * Rules:
-         * A> PIO or MMIO accesses run through hvm_select_ioreq_server() to
+         * A> PIO or MMIO accesses run through ioreq_server_select() to
          * choose the ioreq server by range. If no server is found, the access
          * is ignored.
          *
@@ -323,7 +323,7 @@ static int hvmemul_do_io(
         }
 
         if ( !s )
-            s = hvm_select_ioreq_server(currd, &p);
+            s = ioreq_server_select(currd, &p);
 
         /* If there is no suitable backing DM, just ignore accesses */
         if ( !s )
@@ -333,7 +333,7 @@ static int hvmemul_do_io(
         }
         else
         {
-            rc = hvm_send_ioreq(s, &p, 0);
+            rc = ioreq_send(s, &p, 0);
             if ( rc != X86EMUL_RETRY || currd->is_shutting_down )
                 vio->req.state = STATE_IOREQ_NONE;
             else if ( !ioreq_needs_completion(&vio->req) )
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4ed929c..0d7bb42 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -546,7 +546,7 @@ void hvm_do_resume(struct vcpu *v)
 
     pt_restore_timer(v);
 
-    if ( !handle_hvm_io_completion(v) )
+    if ( !vcpu_ioreq_handle_completion(v) )
         return;
 
     if ( unlikely(v->arch.vm_event) )
@@ -677,7 +677,7 @@ int hvm_domain_initialise(struct domain *d)
     register_g2m_portio_handler(d);
     register_vpci_portio_handler(d);
 
-    hvm_ioreq_init(d);
+    ioreq_domain_init(d);
 
     hvm_init_guest_time(d);
 
@@ -739,7 +739,7 @@ void hvm_domain_relinquish_resources(struct domain *d)
 
     viridian_domain_deinit(d);
 
-    hvm_destroy_all_ioreq_servers(d);
+    ioreq_server_destroy_all(d);
 
     msixtbl_pt_cleanup(d);
 
@@ -1582,7 +1582,7 @@ int hvm_vcpu_initialise(struct vcpu *v)
     if ( rc )
         goto fail5;
 
-    rc = hvm_all_ioreq_servers_add_vcpu(d, v);
+    rc = ioreq_server_add_vcpu_all(d, v);
     if ( rc != 0 )
         goto fail6;
 
@@ -1618,7 +1618,7 @@ void hvm_vcpu_destroy(struct vcpu *v)
 {
     viridian_vcpu_deinit(v);
 
-    hvm_all_ioreq_servers_remove_vcpu(v->domain, v);
+    ioreq_server_remove_vcpu_all(v->domain, v);
 
     if ( hvm_altp2m_supported() )
         altp2m_vcpu_destroy(v);
diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index dd733e1..66a37ee 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -60,7 +60,7 @@ void send_timeoffset_req(unsigned long timeoff)
     if ( timeoff == 0 )
         return;
 
-    if ( hvm_broadcast_ioreq(&p, true) != 0 )
+    if ( ioreq_broadcast(&p, true) != 0 )
         gprintk(XENLOG_ERR, "Unsuccessful timeoffset update\n");
 }
 
@@ -74,7 +74,7 @@ void send_invalidate_req(void)
         .data = ~0UL, /* flush all */
     };
 
-    if ( hvm_broadcast_ioreq(&p, false) != 0 )
+    if ( ioreq_broadcast(&p, false) != 0 )
         gprintk(XENLOG_ERR, "Unsuccessful map-cache invalidate\n");
 }
 
@@ -155,7 +155,7 @@ bool handle_pio(uint16_t port, unsigned int size, int dir)
          * We should not advance RIP/EIP if the domain is shutting down or
          * if X86EMUL_RETRY has been returned by an internal handler.
          */
-        if ( curr->domain->is_shutting_down || !hvm_io_pending(curr) )
+        if ( curr->domain->is_shutting_down || !vcpu_ioreq_pending(curr) )
             return false;
         break;
 
diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 62a4b33..02ad9db 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -153,7 +153,7 @@ static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
     {
         /*
          * If a page has already been allocated (which will happen on
-         * demand if hvm_get_ioreq_server_frame() is called), then
+         * demand if ioreq_server_get_frame() is called), then
          * mapping a guest frame is not permitted.
          */
         if ( gfn_eq(iorp->gfn, INVALID_GFN) )
diff --git a/xen/arch/x86/hvm/stdvga.c b/xen/arch/x86/hvm/stdvga.c
index ee13449..ab9781d 100644
--- a/xen/arch/x86/hvm/stdvga.c
+++ b/xen/arch/x86/hvm/stdvga.c
@@ -507,11 +507,11 @@ static int stdvga_mem_write(const struct hvm_io_handler *handler,
     }
 
  done:
-    srv = hvm_select_ioreq_server(current->domain, &p);
+    srv = ioreq_server_select(current->domain, &p);
     if ( !srv )
         return X86EMUL_UNHANDLEABLE;
 
-    return hvm_send_ioreq(srv, &p, 1);
+    return ioreq_send(srv, &p, 1);
 }
 
 static bool_t stdvga_mem_accept(const struct hvm_io_handler *handler,
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 0ddb6a4..e9f94da 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1517,7 +1517,7 @@ void nvmx_switch_guest(void)
      * don't want to continue as this setup is not implemented nor supported
      * as of right now.
      */
-    if ( hvm_io_pending(v) )
+    if ( vcpu_ioreq_pending(v) )
         return;
     /*
      * a softirq may interrupt us between a virtual vmentry is
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index ce3ef59..de3066a 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -59,7 +59,7 @@ static struct ioreq_server *get_ioreq_server(const struct domain *d,
  * Iterate over all possible ioreq servers.
  *
  * NOTE: The iteration is backwards such that more recently created
- *       ioreq servers are favoured in hvm_select_ioreq_server().
+ *       ioreq servers are favoured in ioreq_server_select().
  *       This is a semantic that previously existed when ioreq servers
  *       were held in a linked list.
  */
@@ -106,12 +106,12 @@ static struct ioreq_vcpu *get_pending_vcpu(const struct vcpu *v,
     return NULL;
 }
 
-bool hvm_io_pending(struct vcpu *v)
+bool vcpu_ioreq_pending(struct vcpu *v)
 {
     return get_pending_vcpu(v, NULL);
 }
 
-static bool hvm_wait_for_io(struct ioreq_vcpu *sv, ioreq_t *p)
+static bool wait_for_io(struct ioreq_vcpu *sv, ioreq_t *p)
 {
     unsigned int prev_state = STATE_IOREQ_NONE;
     unsigned int state = p->state;
@@ -168,7 +168,7 @@ static bool hvm_wait_for_io(struct ioreq_vcpu *sv, ioreq_t *p)
     return true;
 }
 
-bool handle_hvm_io_completion(struct vcpu *v)
+bool vcpu_ioreq_handle_completion(struct vcpu *v)
 {
     struct domain *d = v->domain;
     struct vcpu_io *vio = &v->io;
@@ -183,7 +183,7 @@ bool handle_hvm_io_completion(struct vcpu *v)
     }
 
     sv = get_pending_vcpu(v, &s);
-    if ( sv && !hvm_wait_for_io(sv, get_ioreq(s, v)) )
+    if ( sv && !wait_for_io(sv, get_ioreq(s, v)) )
         return false;
 
     vio->req.state = ioreq_needs_completion(&vio->req) ?
@@ -214,7 +214,7 @@ bool handle_hvm_io_completion(struct vcpu *v)
     return true;
 }
 
-static int hvm_alloc_ioreq_mfn(struct ioreq_server *s, bool buf)
+static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
 {
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
     struct page_info *page;
@@ -262,7 +262,7 @@ static int hvm_alloc_ioreq_mfn(struct ioreq_server *s, bool buf)
     return -ENOMEM;
 }
 
-static void hvm_free_ioreq_mfn(struct ioreq_server *s, bool buf)
+static void ioreq_server_free_mfn(struct ioreq_server *s, bool buf)
 {
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
     struct page_info *page = iorp->page;
@@ -301,8 +301,8 @@ bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
     return found;
 }
 
-static void hvm_update_ioreq_evtchn(struct ioreq_server *s,
-                                    struct ioreq_vcpu *sv)
+static void ioreq_server_update_evtchn(struct ioreq_server *s,
+                                       struct ioreq_vcpu *sv)
 {
     ASSERT(spin_is_locked(&s->lock));
 
@@ -314,8 +314,8 @@ static void hvm_update_ioreq_evtchn(struct ioreq_server *s,
     }
 }
 
-static int hvm_ioreq_server_add_vcpu(struct ioreq_server *s,
-                                     struct vcpu *v)
+static int ioreq_server_add_vcpu(struct ioreq_server *s,
+                                 struct vcpu *v)
 {
     struct ioreq_vcpu *sv;
     int rc;
@@ -350,7 +350,7 @@ static int hvm_ioreq_server_add_vcpu(struct ioreq_server *s,
     list_add(&sv->list_entry, &s->ioreq_vcpu_list);
 
     if ( s->enabled )
-        hvm_update_ioreq_evtchn(s, sv);
+        ioreq_server_update_evtchn(s, sv);
 
     spin_unlock(&s->lock);
     return 0;
@@ -366,8 +366,8 @@ static int hvm_ioreq_server_add_vcpu(struct ioreq_server *s,
     return rc;
 }
 
-static void hvm_ioreq_server_remove_vcpu(struct ioreq_server *s,
-                                         struct vcpu *v)
+static void ioreq_server_remove_vcpu(struct ioreq_server *s,
+                                     struct vcpu *v)
 {
     struct ioreq_vcpu *sv;
 
@@ -394,7 +394,7 @@ static void hvm_ioreq_server_remove_vcpu(struct ioreq_server *s,
     spin_unlock(&s->lock);
 }
 
-static void hvm_ioreq_server_remove_all_vcpus(struct ioreq_server *s)
+static void ioreq_server_remove_all_vcpus(struct ioreq_server *s)
 {
     struct ioreq_vcpu *sv, *next;
 
@@ -420,28 +420,28 @@ static void hvm_ioreq_server_remove_all_vcpus(struct ioreq_server *s)
     spin_unlock(&s->lock);
 }
 
-static int hvm_ioreq_server_alloc_pages(struct ioreq_server *s)
+static int ioreq_server_alloc_pages(struct ioreq_server *s)
 {
     int rc;
 
-    rc = hvm_alloc_ioreq_mfn(s, false);
+    rc = ioreq_server_alloc_mfn(s, false);
 
     if ( !rc && (s->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF) )
-        rc = hvm_alloc_ioreq_mfn(s, true);
+        rc = ioreq_server_alloc_mfn(s, true);
 
     if ( rc )
-        hvm_free_ioreq_mfn(s, false);
+        ioreq_server_free_mfn(s, false);
 
     return rc;
 }
 
-static void hvm_ioreq_server_free_pages(struct ioreq_server *s)
+static void ioreq_server_free_pages(struct ioreq_server *s)
 {
-    hvm_free_ioreq_mfn(s, true);
-    hvm_free_ioreq_mfn(s, false);
+    ioreq_server_free_mfn(s, true);
+    ioreq_server_free_mfn(s, false);
 }
 
-static void hvm_ioreq_server_free_rangesets(struct ioreq_server *s)
+static void ioreq_server_free_rangesets(struct ioreq_server *s)
 {
     unsigned int i;
 
@@ -449,8 +449,8 @@ static void hvm_ioreq_server_free_rangesets(struct ioreq_server *s)
         rangeset_destroy(s->range[i]);
 }
 
-static int hvm_ioreq_server_alloc_rangesets(struct ioreq_server *s,
-                                            ioservid_t id)
+static int ioreq_server_alloc_rangesets(struct ioreq_server *s,
+                                        ioservid_t id)
 {
     unsigned int i;
     int rc;
@@ -482,12 +482,12 @@ static int hvm_ioreq_server_alloc_rangesets(struct ioreq_server *s,
     return 0;
 
  fail:
-    hvm_ioreq_server_free_rangesets(s);
+    ioreq_server_free_rangesets(s);
 
     return rc;
 }
 
-static void hvm_ioreq_server_enable(struct ioreq_server *s)
+static void ioreq_server_enable(struct ioreq_server *s)
 {
     struct ioreq_vcpu *sv;
 
@@ -503,13 +503,13 @@ static void hvm_ioreq_server_enable(struct ioreq_server *s)
     list_for_each_entry ( sv,
                           &s->ioreq_vcpu_list,
                           list_entry )
-        hvm_update_ioreq_evtchn(s, sv);
+        ioreq_server_update_evtchn(s, sv);
 
   done:
     spin_unlock(&s->lock);
 }
 
-static void hvm_ioreq_server_disable(struct ioreq_server *s)
+static void ioreq_server_disable(struct ioreq_server *s)
 {
     spin_lock(&s->lock);
 
@@ -524,9 +524,9 @@ static void hvm_ioreq_server_disable(struct ioreq_server *s)
     spin_unlock(&s->lock);
 }
 
-static int hvm_ioreq_server_init(struct ioreq_server *s,
-                                 struct domain *d, int bufioreq_handling,
-                                 ioservid_t id)
+static int ioreq_server_init(struct ioreq_server *s,
+                             struct domain *d, int bufioreq_handling,
+                             ioservid_t id)
 {
     struct domain *currd = current->domain;
     struct vcpu *v;
@@ -544,7 +544,7 @@ static int hvm_ioreq_server_init(struct ioreq_server *s,
     s->ioreq.gfn = INVALID_GFN;
     s->bufioreq.gfn = INVALID_GFN;
 
-    rc = hvm_ioreq_server_alloc_rangesets(s, id);
+    rc = ioreq_server_alloc_rangesets(s, id);
     if ( rc )
         return rc;
 
@@ -552,7 +552,7 @@ static int hvm_ioreq_server_init(struct ioreq_server *s,
 
     for_each_vcpu ( d, v )
     {
-        rc = hvm_ioreq_server_add_vcpu(s, v);
+        rc = ioreq_server_add_vcpu(s, v);
         if ( rc )
             goto fail_add;
     }
@@ -560,23 +560,23 @@ static int hvm_ioreq_server_init(struct ioreq_server *s,
     return 0;
 
  fail_add:
-    hvm_ioreq_server_remove_all_vcpus(s);
+    ioreq_server_remove_all_vcpus(s);
     arch_ioreq_server_unmap_pages(s);
 
-    hvm_ioreq_server_free_rangesets(s);
+    ioreq_server_free_rangesets(s);
 
     put_domain(s->emulator);
     return rc;
 }
 
-static void hvm_ioreq_server_deinit(struct ioreq_server *s)
+static void ioreq_server_deinit(struct ioreq_server *s)
 {
     ASSERT(!s->enabled);
-    hvm_ioreq_server_remove_all_vcpus(s);
+    ioreq_server_remove_all_vcpus(s);
 
     /*
      * NOTE: It is safe to call both arch_ioreq_server_unmap_pages() and
-     *       hvm_ioreq_server_free_pages() in that order.
+     *       ioreq_server_free_pages() in that order.
      *       This is because the former will do nothing if the pages
      *       are not mapped, leaving the page to be freed by the latter.
      *       However if the pages are mapped then the former will set
@@ -584,9 +584,9 @@ static void hvm_ioreq_server_deinit(struct ioreq_server *s)
      *       nothing.
      */
     arch_ioreq_server_unmap_pages(s);
-    hvm_ioreq_server_free_pages(s);
+    ioreq_server_free_pages(s);
 
-    hvm_ioreq_server_free_rangesets(s);
+    ioreq_server_free_rangesets(s);
 
     put_domain(s->emulator);
 }
@@ -620,11 +620,11 @@ static int ioreq_server_create(struct domain *d, int bufioreq_handling,
 
     /*
      * It is safe to call set_ioreq_server() prior to
-     * hvm_ioreq_server_init() since the target domain is paused.
+     * ioreq_server_init() since the target domain is paused.
      */
     set_ioreq_server(d, i, s);
 
-    rc = hvm_ioreq_server_init(s, d, bufioreq_handling, i);
+    rc = ioreq_server_init(s, d, bufioreq_handling, i);
     if ( rc )
     {
         set_ioreq_server(d, i, NULL);
@@ -668,13 +668,13 @@ static int ioreq_server_destroy(struct domain *d, ioservid_t id)
 
     arch_ioreq_server_destroy(s);
 
-    hvm_ioreq_server_disable(s);
+    ioreq_server_disable(s);
 
     /*
-     * It is safe to call hvm_ioreq_server_deinit() prior to
+     * It is safe to call ioreq_server_deinit() prior to
      * set_ioreq_server() since the target domain is paused.
      */
-    hvm_ioreq_server_deinit(s);
+    ioreq_server_deinit(s);
     set_ioreq_server(d, id, NULL);
 
     domain_unpause(d);
@@ -736,8 +736,8 @@ static int ioreq_server_get_info(struct domain *d, ioservid_t id,
     return rc;
 }
 
-int hvm_get_ioreq_server_frame(struct domain *d, ioservid_t id,
-                               unsigned long idx, mfn_t *mfn)
+int ioreq_server_get_frame(struct domain *d, ioservid_t id,
+                           unsigned long idx, mfn_t *mfn)
 {
     struct ioreq_server *s;
     int rc;
@@ -756,7 +756,7 @@ int hvm_get_ioreq_server_frame(struct domain *d, ioservid_t id,
     if ( s->emulator != current->domain )
         goto out;
 
-    rc = hvm_ioreq_server_alloc_pages(s);
+    rc = ioreq_server_alloc_pages(s);
     if ( rc )
         goto out;
 
@@ -955,9 +955,9 @@ static int ioreq_server_set_state(struct domain *d, ioservid_t id,
     domain_pause(d);
 
     if ( enabled )
-        hvm_ioreq_server_enable(s);
+        ioreq_server_enable(s);
     else
-        hvm_ioreq_server_disable(s);
+        ioreq_server_disable(s);
 
     domain_unpause(d);
 
@@ -968,7 +968,7 @@ static int ioreq_server_set_state(struct domain *d, ioservid_t id,
     return rc;
 }
 
-int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v)
+int ioreq_server_add_vcpu_all(struct domain *d, struct vcpu *v)
 {
     struct ioreq_server *s;
     unsigned int id;
@@ -978,7 +978,7 @@ int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v)
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
     {
-        rc = hvm_ioreq_server_add_vcpu(s, v);
+        rc = ioreq_server_add_vcpu(s, v);
         if ( rc )
             goto fail;
     }
@@ -995,7 +995,7 @@ int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v)
         if ( !s )
             continue;
 
-        hvm_ioreq_server_remove_vcpu(s, v);
+        ioreq_server_remove_vcpu(s, v);
     }
 
     spin_unlock_recursive(&d->ioreq_server.lock);
@@ -1003,7 +1003,7 @@ int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v)
     return rc;
 }
 
-void hvm_all_ioreq_servers_remove_vcpu(struct domain *d, struct vcpu *v)
+void ioreq_server_remove_vcpu_all(struct domain *d, struct vcpu *v)
 {
     struct ioreq_server *s;
     unsigned int id;
@@ -1011,12 +1011,12 @@ void hvm_all_ioreq_servers_remove_vcpu(struct domain *d, struct vcpu *v)
     spin_lock_recursive(&d->ioreq_server.lock);
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
-        hvm_ioreq_server_remove_vcpu(s, v);
+        ioreq_server_remove_vcpu(s, v);
 
     spin_unlock_recursive(&d->ioreq_server.lock);
 }
 
-void hvm_destroy_all_ioreq_servers(struct domain *d)
+void ioreq_server_destroy_all(struct domain *d)
 {
     struct ioreq_server *s;
     unsigned int id;
@@ -1030,13 +1030,13 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
     {
-        hvm_ioreq_server_disable(s);
+        ioreq_server_disable(s);
 
         /*
-         * It is safe to call hvm_ioreq_server_deinit() prior to
+         * It is safe to call ioreq_server_deinit() prior to
          * set_ioreq_server() since the target domain is being destroyed.
          */
-        hvm_ioreq_server_deinit(s);
+        ioreq_server_deinit(s);
         set_ioreq_server(d, id, NULL);
 
         xfree(s);
@@ -1045,8 +1045,8 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
     spin_unlock_recursive(&d->ioreq_server.lock);
 }
 
-struct ioreq_server *hvm_select_ioreq_server(struct domain *d,
-                                             ioreq_t *p)
+struct ioreq_server *ioreq_server_select(struct domain *d,
+                                         ioreq_t *p)
 {
     struct ioreq_server *s;
     uint8_t type;
@@ -1101,7 +1101,7 @@ struct ioreq_server *hvm_select_ioreq_server(struct domain *d,
     return NULL;
 }
 
-static int hvm_send_buffered_ioreq(struct ioreq_server *s, ioreq_t *p)
+static int ioreq_send_buffered(struct ioreq_server *s, ioreq_t *p)
 {
     struct domain *d = current->domain;
     struct ioreq_page *iorp;
@@ -1194,8 +1194,8 @@ static int hvm_send_buffered_ioreq(struct ioreq_server *s, ioreq_t *p)
     return IOREQ_STATUS_HANDLED;
 }
 
-int hvm_send_ioreq(struct ioreq_server *s, ioreq_t *proto_p,
-                   bool buffered)
+int ioreq_send(struct ioreq_server *s, ioreq_t *proto_p,
+               bool buffered)
 {
     struct vcpu *curr = current;
     struct domain *d = curr->domain;
@@ -1204,7 +1204,7 @@ int hvm_send_ioreq(struct ioreq_server *s, ioreq_t *proto_p,
     ASSERT(s);
 
     if ( buffered )
-        return hvm_send_buffered_ioreq(s, proto_p);
+        return ioreq_send_buffered(s, proto_p);
 
     if ( unlikely(!vcpu_start_shutdown_deferral(curr)) )
         return IOREQ_STATUS_RETRY;
@@ -1254,7 +1254,7 @@ int hvm_send_ioreq(struct ioreq_server *s, ioreq_t *proto_p,
     return IOREQ_STATUS_UNHANDLED;
 }
 
-unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered)
+unsigned int ioreq_broadcast(ioreq_t *p, bool buffered)
 {
     struct domain *d = current->domain;
     struct ioreq_server *s;
@@ -1265,14 +1265,14 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered)
         if ( !s->enabled )
             continue;
 
-        if ( hvm_send_ioreq(s, p, buffered) == IOREQ_STATUS_UNHANDLED )
+        if ( ioreq_send(s, p, buffered) == IOREQ_STATUS_UNHANDLED )
             failed++;
     }
 
     return failed;
 }
 
-void hvm_ioreq_init(struct domain *d)
+void ioreq_domain_init(struct domain *d)
 {
     spin_lock_init(&d->ioreq_server.lock);
 
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 2f274a6..8eb05b1 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1113,7 +1113,7 @@ static int acquire_ioreq_server(struct domain *d,
     {
         mfn_t mfn;
 
-        rc = hvm_get_ioreq_server_frame(d, id, frame + i, &mfn);
+        rc = ioreq_server_get_frame(d, id, frame + i, &mfn);
         if ( rc )
             return rc;
 
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index eace1d3..0b433e2 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -83,26 +83,26 @@ static inline bool ioreq_needs_completion(const ioreq_t *ioreq)
 #define HANDLE_BUFIOREQ(s) \
     ((s)->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF)
 
-bool hvm_io_pending(struct vcpu *v);
-bool handle_hvm_io_completion(struct vcpu *v);
+bool vcpu_ioreq_pending(struct vcpu *v);
+bool vcpu_ioreq_handle_completion(struct vcpu *v);
 bool is_ioreq_server_page(struct domain *d, const struct page_info *page);
 
-int hvm_get_ioreq_server_frame(struct domain *d, ioservid_t id,
-                               unsigned long idx, mfn_t *mfn);
+int ioreq_server_get_frame(struct domain *d, ioservid_t id,
+                           unsigned long idx, mfn_t *mfn);
 int ioreq_server_map_mem_type(struct domain *d, ioservid_t id,
                               uint32_t type, uint32_t flags);
 
-int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v);
-void hvm_all_ioreq_servers_remove_vcpu(struct domain *d, struct vcpu *v);
-void hvm_destroy_all_ioreq_servers(struct domain *d);
+int ioreq_server_add_vcpu_all(struct domain *d, struct vcpu *v);
+void ioreq_server_remove_vcpu_all(struct domain *d, struct vcpu *v);
+void ioreq_server_destroy_all(struct domain *d);
 
-struct ioreq_server *hvm_select_ioreq_server(struct domain *d,
-                                             ioreq_t *p);
-int hvm_send_ioreq(struct ioreq_server *s, ioreq_t *proto_p,
-                   bool buffered);
-unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered);
+struct ioreq_server *ioreq_server_select(struct domain *d,
+                                         ioreq_t *p);
+int ioreq_send(struct ioreq_server *s, ioreq_t *proto_p,
+               bool buffered);
+unsigned int ioreq_broadcast(ioreq_t *p, bool buffered);
 
-void hvm_ioreq_init(struct domain *d);
+void ioreq_domain_init(struct domain *d);
 
 int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *const_op);
 
-- 
2.7.4


