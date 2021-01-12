Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 329402F3C01
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 22:59:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66082.117278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRgq-0003hN-Al; Tue, 12 Jan 2021 21:59:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66082.117278; Tue, 12 Jan 2021 21:59:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRgp-0003fz-Uo; Tue, 12 Jan 2021 21:58:59 +0000
Received: by outflank-mailman (input) for mailman id 66082;
 Tue, 12 Jan 2021 21:58:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OoN1=GP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kzRcA-0002PK-Il
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 21:54:10 +0000
Received: from mail-wm1-x329.google.com (unknown [2a00:1450:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3247a3ae-341e-4613-a803-ea647edea240;
 Tue, 12 Jan 2021 21:53:07 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id r4so3488503wmh.5
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 13:53:07 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 138sm6574053wma.41.2021.01.12.13.53.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Jan 2021 13:53:05 -0800 (PST)
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
X-Inumbo-ID: 3247a3ae-341e-4613-a803-ea647edea240
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KptDLtZiPJUj2pq8DO71RGEQ9ixZa+sozo8Z+p+jkOY=;
        b=aah2k/71n77+0QspVNumbYsWocK1/W+OFOirF+W0z2C6GHsADy5cFtCfWxmVsbm5Gl
         T37l1IpufKSXXuUIVPFoT2lk7w1H4RfVoXg53F7ir5K5pBBTlicKJ+7h2TpUoNUxaBUu
         zHcest7rKKrn/pkskwpwAN31defVdhvsaUjisQQk72NnkcqCCYvESniFJQutB18N7m35
         xy08sXUs3sTIRR0BEe8yvDOM5NL/0t64jH8z9Ax68eJqciWRO95fXL9zG3iozVLnlJsW
         yWw1njSlMwsYxURYhQafKpUcq0vLgzBh+LRASkLQuHy2r4J9VV20ElG7z/hykkJ2P9iO
         vOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KptDLtZiPJUj2pq8DO71RGEQ9ixZa+sozo8Z+p+jkOY=;
        b=eHUojkA80PZQecnJBQni+VSAsapWKhZseGhFwLQp6XyfNNdIDq3dODJvEVVHrS9N1C
         bFziOHNPfqlGI3Vbvdn5jb51k63O3+tqxaiMH3vykAHV2/52MhU1VAiuVXFIZmoOEK4j
         HCBJytkXUwvsckYFTAeZ7/ozLgAg2dbXeDWsVQwYXuZL8vZd58hehq4mpJXQ0C6g9eGB
         yXSWkPD+UZFEe0EM1YntWxzaW++1VnZeKYG0qnpDWjUlgW5ED1asCSzAj+bXsMcfwZek
         ax5FK19q+RII2ucyvTLFjetSZiX1Ij8iVTfXKE+B5s91afYSyJBRu3hlRJKXvSlETmeS
         FZ8Q==
X-Gm-Message-State: AOAM5315NSL6Cyy9zk9aG5e0b+h1XKXdPHilLm+vz55V66jXuYQS7GIT
	b3U3qWs4PR3VmwYI60dudbq2QP/QebUsfg==
X-Google-Smtp-Source: ABdhPJwspKAhEPetDwMZeFnkyBENtkIN7y+/Ye0yarKPsYWeTn9aRoUgFdzOZZnhOA5njNKLoCsLpQ==
X-Received: by 2002:a7b:c3d6:: with SMTP id t22mr1182025wmj.134.1610488386141;
        Tue, 12 Jan 2021 13:53:06 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V4 12/24] xen/ioreq: Remove "hvm" prefixes from involved function names
Date: Tue, 12 Jan 2021 23:52:20 +0200
Message-Id: <1610488352-18494-13-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>

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
---
 xen/arch/x86/hvm/dm.c       |   4 +-
 xen/arch/x86/hvm/emulate.c  |   6 +-
 xen/arch/x86/hvm/hvm.c      |  10 +--
 xen/arch/x86/hvm/io.c       |   6 +-
 xen/arch/x86/hvm/ioreq.c    |   2 +-
 xen/arch/x86/hvm/stdvga.c   |   4 +-
 xen/arch/x86/hvm/vmx/vvmx.c |   2 +-
 xen/common/ioreq.c          | 202 ++++++++++++++++++++++----------------------
 xen/common/memory.c         |   2 +-
 xen/include/xen/ioreq.h     |  30 +++----
 10 files changed, 134 insertions(+), 134 deletions(-)

diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index dc8e47d..f770536 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -415,8 +415,8 @@ static int dm_op(const struct dmop_args *op_args)
             break;
 
         if ( first_gfn == 0 )
-            rc = hvm_map_mem_type_to_ioreq_server(d, data->id,
-                                                  data->type, data->flags);
+            rc = ioreq_server_map_mem_type(d, data->id,
+                                           data->type, data->flags);
         else
             rc = 0;
 
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
index c00ee8e..5c9f3a5 100644
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
index 273683f..d233a49 100644
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
@@ -223,7 +223,7 @@ static int hvm_alloc_ioreq_mfn(struct ioreq_server *s, bool buf)
     {
         /*
          * If a guest frame has already been mapped (which may happen
-         * on demand if hvm_get_ioreq_server_info() is called), then
+         * on demand if ioreq_server_get_info() is called), then
          * allocating a page is not permitted.
          */
         if ( !gfn_eq(iorp->gfn, INVALID_GFN) )
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
@@ -584,15 +584,15 @@ static void hvm_ioreq_server_deinit(struct ioreq_server *s)
      *       nothing.
      */
     arch_ioreq_server_unmap_pages(s);
-    hvm_ioreq_server_free_pages(s);
+    ioreq_server_free_pages(s);
 
-    hvm_ioreq_server_free_rangesets(s);
+    ioreq_server_free_rangesets(s);
 
     put_domain(s->emulator);
 }
 
-static int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
-                                   ioservid_t *id)
+static int ioreq_server_create(struct domain *d, int bufioreq_handling,
+                               ioservid_t *id)
 {
     struct ioreq_server *s;
     unsigned int i;
@@ -620,11 +620,11 @@ static int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
 
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
@@ -647,7 +647,7 @@ static int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
     return rc;
 }
 
-static int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
+static int ioreq_server_destroy(struct domain *d, ioservid_t id)
 {
     struct ioreq_server *s;
     int rc;
@@ -668,13 +668,13 @@ static int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
 
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
@@ -689,10 +689,10 @@ static int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
     return rc;
 }
 
-static int hvm_get_ioreq_server_info(struct domain *d, ioservid_t id,
-                                     unsigned long *ioreq_gfn,
-                                     unsigned long *bufioreq_gfn,
-                                     evtchn_port_t *bufioreq_port)
+static int ioreq_server_get_info(struct domain *d, ioservid_t id,
+                                 unsigned long *ioreq_gfn,
+                                 unsigned long *bufioreq_gfn,
+                                 evtchn_port_t *bufioreq_port)
 {
     struct ioreq_server *s;
     int rc;
@@ -736,8 +736,8 @@ static int hvm_get_ioreq_server_info(struct domain *d, ioservid_t id,
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
 
@@ -787,9 +787,9 @@ int hvm_get_ioreq_server_frame(struct domain *d, ioservid_t id,
     return rc;
 }
 
-static int hvm_map_io_range_to_ioreq_server(struct domain *d, ioservid_t id,
-                                            uint32_t type, uint64_t start,
-                                            uint64_t end)
+static int ioreq_server_map_io_range(struct domain *d, ioservid_t id,
+                                     uint32_t type, uint64_t start,
+                                     uint64_t end)
 {
     struct ioreq_server *s;
     struct rangeset *r;
@@ -839,9 +839,9 @@ static int hvm_map_io_range_to_ioreq_server(struct domain *d, ioservid_t id,
     return rc;
 }
 
-static int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
-                                                uint32_t type, uint64_t start,
-                                                uint64_t end)
+static int ioreq_server_unmap_io_range(struct domain *d, ioservid_t id,
+                                       uint32_t type, uint64_t start,
+                                       uint64_t end)
 {
     struct ioreq_server *s;
     struct rangeset *r;
@@ -899,8 +899,8 @@ static int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
  * Support for the emulation of read operations can be added when an ioreq
  * server has such requirement in the future.
  */
-int hvm_map_mem_type_to_ioreq_server(struct domain *d, ioservid_t id,
-                                     uint32_t type, uint32_t flags)
+int ioreq_server_map_mem_type(struct domain *d, ioservid_t id,
+                              uint32_t type, uint32_t flags)
 {
     struct ioreq_server *s;
     int rc;
@@ -934,8 +934,8 @@ int hvm_map_mem_type_to_ioreq_server(struct domain *d, ioservid_t id,
     return rc;
 }
 
-static int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
-                                      bool enabled)
+static int ioreq_server_set_state(struct domain *d, ioservid_t id,
+                                  bool enabled)
 {
     struct ioreq_server *s;
     int rc;
@@ -955,9 +955,9 @@ static int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
     domain_pause(d);
 
     if ( enabled )
-        hvm_ioreq_server_enable(s);
+        ioreq_server_enable(s);
     else
-        hvm_ioreq_server_disable(s);
+        ioreq_server_disable(s);
 
     domain_unpause(d);
 
@@ -968,7 +968,7 @@ static int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
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
 
@@ -1296,8 +1296,8 @@ int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *const_op)
         if ( data->pad[0] || data->pad[1] || data->pad[2] )
             break;
 
-        rc = hvm_create_ioreq_server(d, data->handle_bufioreq,
-                                     &data->id);
+        rc = ioreq_server_create(d, data->handle_bufioreq,
+                                 &data->id);
         break;
     }
 
@@ -1313,12 +1313,12 @@ int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *const_op)
         if ( data->flags & ~valid_flags )
             break;
 
-        rc = hvm_get_ioreq_server_info(d, data->id,
-                                       (data->flags & XEN_DMOP_no_gfns) ?
-                                       NULL : (unsigned long *)&data->ioreq_gfn,
-                                       (data->flags & XEN_DMOP_no_gfns) ?
-                                       NULL : (unsigned long *)&data->bufioreq_gfn,
-                                       &data->bufioreq_port);
+        rc = ioreq_server_get_info(d, data->id,
+                                   (data->flags & XEN_DMOP_no_gfns) ?
+                                   NULL : (unsigned long *)&data->ioreq_gfn,
+                                   (data->flags & XEN_DMOP_no_gfns) ?
+                                   NULL : (unsigned long *)&data->bufioreq_gfn,
+                                   &data->bufioreq_port);
         break;
     }
 
@@ -1331,8 +1331,8 @@ int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *const_op)
         if ( data->pad )
             break;
 
-        rc = hvm_map_io_range_to_ioreq_server(d, data->id, data->type,
-                                              data->start, data->end);
+        rc = ioreq_server_map_io_range(d, data->id, data->type,
+                                       data->start, data->end);
         break;
     }
 
@@ -1345,8 +1345,8 @@ int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *const_op)
         if ( data->pad )
             break;
 
-        rc = hvm_unmap_io_range_from_ioreq_server(d, data->id, data->type,
-                                                  data->start, data->end);
+        rc = ioreq_server_unmap_io_range(d, data->id, data->type,
+                                         data->start, data->end);
         break;
     }
 
@@ -1359,7 +1359,7 @@ int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *const_op)
         if ( data->pad )
             break;
 
-        rc = hvm_set_ioreq_server_state(d, data->id, !!data->enabled);
+        rc = ioreq_server_set_state(d, data->id, !!data->enabled);
         break;
     }
 
@@ -1372,7 +1372,7 @@ int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *const_op)
         if ( data->pad )
             break;
 
-        rc = hvm_destroy_ioreq_server(d, data->id);
+        rc = ioreq_server_destroy(d, data->id);
         break;
     }
 
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 7e560b5..66828d9 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1112,7 +1112,7 @@ static int acquire_ioreq_server(struct domain *d,
     {
         mfn_t mfn;
 
-        rc = hvm_get_ioreq_server_frame(d, id, frame + i, &mfn);
+        rc = ioreq_server_get_frame(d, id, frame + i, &mfn);
         if ( rc )
             return rc;
 
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index dffed60..ec7e98d 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -81,26 +81,26 @@ static inline bool ioreq_needs_completion(const ioreq_t *ioreq)
 #define HANDLE_BUFIOREQ(s) \
     ((s)->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF)
 
-bool hvm_io_pending(struct vcpu *v);
-bool handle_hvm_io_completion(struct vcpu *v);
+bool vcpu_ioreq_pending(struct vcpu *v);
+bool vcpu_ioreq_handle_completion(struct vcpu *v);
 bool is_ioreq_server_page(struct domain *d, const struct page_info *page);
 
-int hvm_get_ioreq_server_frame(struct domain *d, ioservid_t id,
-                               unsigned long idx, mfn_t *mfn);
-int hvm_map_mem_type_to_ioreq_server(struct domain *d, ioservid_t id,
-                                     uint32_t type, uint32_t flags);
+int ioreq_server_get_frame(struct domain *d, ioservid_t id,
+                           unsigned long idx, mfn_t *mfn);
+int ioreq_server_map_mem_type(struct domain *d, ioservid_t id,
+                              uint32_t type, uint32_t flags);
 
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


