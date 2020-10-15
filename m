Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E2428F738
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:53:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7608.20045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6VB-00079m-A3; Thu, 15 Oct 2020 16:53:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7608.20045; Thu, 15 Oct 2020 16:53:17 +0000
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
	id 1kT6VB-00078y-2G; Thu, 15 Oct 2020 16:53:17 +0000
Received: by outflank-mailman (input) for mailman id 7608;
 Thu, 15 Oct 2020 16:53:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kT6O8-0004yr-79
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:46:00 +0000
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35a4e4e2-ae98-4920-98eb-57504424b4da;
 Thu, 15 Oct 2020 16:45:07 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id l2so4404490lfk.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:07 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.45.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Oct 2020 09:45:04 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kT6O8-0004yr-79
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:46:00 +0000
X-Inumbo-ID: 35a4e4e2-ae98-4920-98eb-57504424b4da
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 35a4e4e2-ae98-4920-98eb-57504424b4da;
	Thu, 15 Oct 2020 16:45:07 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id l2so4404490lfk.0
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ATLX0ix+70BJdDYt/n8NIsAS6V9Lo7VwWj16nLbs74s=;
        b=mZHr8xPWPC6BwR4Rvshv8pcGslgwoHeHR995f+dQp2HBfJc3N2sA66iK3KBHJZYxkN
         T/Q1JrQPnyjBHR2/3yAjBjkIeMIIhJDrHm6IP+qt2S/XUEmQu8rlcooJaRRD5y9wIMmu
         GnbdX09mpqOk1z3qj4Gz2tsgs/gQP1uOzFdLwpLIzmT7DwvmQF79h7+7kLz6iuWimTBa
         HvDIiqenfWrnRu+gHpWE3cIGhbBoWsjoUwsAr+7bPmnf3RIZmNiA55r0XSTOxfEgP5nl
         VD6KDMs895Kks5NfhecJPYNTrIbvzNyOOv8nx3zVd8lawUE/AIhUmZlcqlSpT4YWjmuO
         5IgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ATLX0ix+70BJdDYt/n8NIsAS6V9Lo7VwWj16nLbs74s=;
        b=nYwGJmitEhoZxmrhN5XLsnacY3FYcKGXoM8CRHM9LiAye77C/0DSyi4JMAxdNj1Dfn
         HyNDdUX4mndwyWGJkp8a2AtlVgWo/VGEifgLcrNNJrPQDkmF9X9QPmawjl8zne3BUT/D
         1xEZ52CG0PzzsgAhAtGfI9qYGBq4b0f8Y22jsiZm0WNI3ARrDvLw8en52p8csFJrAfsS
         S9UFBWBvj14g4j7x2mxe4NNfmWzQUd5oMdZVCWK6ME5E/iTflkuJbrdaxqJpZuOzbnKK
         MuRHqGiJs0eksU68hEjj2FxtjrWnQzG4vMDKDsWYggEp9aOnjhFtHkoCuIp0RniEToh8
         LRiA==
X-Gm-Message-State: AOAM533elyY6Ld87fcNXerFvGQ0JhNloYdK8C8KfAn4uzcGrGjQxOj2J
	ThbnGq0+PPemW4PVmak1FOrDGj8O+2bZAQ==
X-Google-Smtp-Source: ABdhPJzoVD12a1fmtxYj1gr0tCGo+X9eLMlAepPqLgCiZ1fzx12+msmYl926taDLXf7MlR7mvynsKg==
X-Received: by 2002:a19:cc8f:: with SMTP id c137mr1396381lfg.476.1602780305418;
        Thu, 15 Oct 2020 09:45:05 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.45.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2020 09:45:04 -0700 (PDT)
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
Subject: [PATCH V2 12/23] xen/ioreq: Remove "hvm" prefixes from involved function names
Date: Thu, 15 Oct 2020 19:44:23 +0300
Message-Id: <1602780274-29141-13-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch removes "hvm" prefixes and infixes from IOREQ
related function names in the common code.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes V1 -> V2:
   - new patch
---
 xen/arch/x86/hvm/emulate.c      |   6 +-
 xen/arch/x86/hvm/hvm.c          |  10 +-
 xen/arch/x86/hvm/io.c           |   6 +-
 xen/arch/x86/hvm/stdvga.c       |   4 +-
 xen/arch/x86/hvm/vmx/vvmx.c     |   2 +-
 xen/common/dm.c                 |  28 ++---
 xen/common/ioreq.c              | 240 ++++++++++++++++++++--------------------
 xen/common/memory.c             |   2 +-
 xen/include/asm-x86/hvm/ioreq.h |  16 +--
 xen/include/xen/ioreq.h         |  58 +++++-----
 10 files changed, 186 insertions(+), 186 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index f6a4eef..54cd493 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -261,7 +261,7 @@ static int hvmemul_do_io(
          * an ioreq server that can handle it.
          *
          * Rules:
-         * A> PIO or MMIO accesses run through hvm_select_ioreq_server() to
+         * A> PIO or MMIO accesses run through select_ioreq_server() to
          * choose the ioreq server by range. If no server is found, the access
          * is ignored.
          *
@@ -323,7 +323,7 @@ static int hvmemul_do_io(
         }
 
         if ( !s )
-            s = hvm_select_ioreq_server(currd, &p);
+            s = select_ioreq_server(currd, &p);
 
         /* If there is no suitable backing DM, just ignore accesses */
         if ( !s )
@@ -333,7 +333,7 @@ static int hvmemul_do_io(
         }
         else
         {
-            rc = hvm_send_ioreq(s, &p, 0);
+            rc = send_ioreq(s, &p, 0);
             if ( rc != X86EMUL_RETRY || currd->is_shutting_down )
                 vio->io_req.state = STATE_IOREQ_NONE;
             else if ( !ioreq_needs_completion(&vio->io_req) )
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 341093b..1e788b5 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -546,7 +546,7 @@ void hvm_do_resume(struct vcpu *v)
 
     pt_restore_timer(v);
 
-    if ( !handle_hvm_io_completion(v) )
+    if ( !handle_io_completion(v) )
         return;
 
     if ( unlikely(v->arch.vm_event) )
@@ -677,7 +677,7 @@ int hvm_domain_initialise(struct domain *d)
     register_g2m_portio_handler(d);
     register_vpci_portio_handler(d);
 
-    hvm_ioreq_init(d);
+    ioreq_init(d);
 
     hvm_init_guest_time(d);
 
@@ -739,7 +739,7 @@ void hvm_domain_relinquish_resources(struct domain *d)
 
     viridian_domain_deinit(d);
 
-    hvm_destroy_all_ioreq_servers(d);
+    destroy_all_ioreq_servers(d);
 
     msixtbl_pt_cleanup(d);
 
@@ -1582,7 +1582,7 @@ int hvm_vcpu_initialise(struct vcpu *v)
     if ( rc )
         goto fail5;
 
-    rc = hvm_all_ioreq_servers_add_vcpu(d, v);
+    rc = all_ioreq_servers_add_vcpu(d, v);
     if ( rc != 0 )
         goto fail6;
 
@@ -1618,7 +1618,7 @@ void hvm_vcpu_destroy(struct vcpu *v)
 {
     viridian_vcpu_deinit(v);
 
-    hvm_all_ioreq_servers_remove_vcpu(v->domain, v);
+    all_ioreq_servers_remove_vcpu(v->domain, v);
 
     if ( hvm_altp2m_supported() )
         altp2m_vcpu_destroy(v);
diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index 36584de..2d03ffe 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -60,7 +60,7 @@ void send_timeoffset_req(unsigned long timeoff)
     if ( timeoff == 0 )
         return;
 
-    if ( hvm_broadcast_ioreq(&p, true) != 0 )
+    if ( broadcast_ioreq(&p, true) != 0 )
         gprintk(XENLOG_ERR, "Unsuccessful timeoffset update\n");
 }
 
@@ -74,7 +74,7 @@ void send_invalidate_req(void)
         .data = ~0UL, /* flush all */
     };
 
-    if ( hvm_broadcast_ioreq(&p, false) != 0 )
+    if ( broadcast_ioreq(&p, false) != 0 )
         gprintk(XENLOG_ERR, "Unsuccessful map-cache invalidate\n");
 }
 
@@ -155,7 +155,7 @@ bool handle_pio(uint16_t port, unsigned int size, int dir)
          * We should not advance RIP/EIP if the domain is shutting down or
          * if X86EMUL_RETRY has been returned by an internal handler.
          */
-        if ( curr->domain->is_shutting_down || !hvm_io_pending(curr) )
+        if ( curr->domain->is_shutting_down || !io_pending(curr) )
             return false;
         break;
 
diff --git a/xen/arch/x86/hvm/stdvga.c b/xen/arch/x86/hvm/stdvga.c
index bafb3f6..cb1cc7f 100644
--- a/xen/arch/x86/hvm/stdvga.c
+++ b/xen/arch/x86/hvm/stdvga.c
@@ -507,11 +507,11 @@ static int stdvga_mem_write(const struct hvm_io_handler *handler,
     }
 
  done:
-    srv = hvm_select_ioreq_server(current->domain, &p);
+    srv = select_ioreq_server(current->domain, &p);
     if ( !srv )
         return X86EMUL_UNHANDLEABLE;
 
-    return hvm_send_ioreq(srv, &p, 1);
+    return send_ioreq(srv, &p, 1);
 }
 
 static bool_t stdvga_mem_accept(const struct hvm_io_handler *handler,
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 3a37e9e..d5a17f12 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1516,7 +1516,7 @@ void nvmx_switch_guest(void)
      * don't want to continue as this setup is not implemented nor supported
      * as of right now.
      */
-    if ( hvm_io_pending(v) )
+    if ( io_pending(v) )
         return;
     /*
      * a softirq may interrupt us between a virtual vmentry is
diff --git a/xen/common/dm.c b/xen/common/dm.c
index 36e01a2..f3a8353 100644
--- a/xen/common/dm.c
+++ b/xen/common/dm.c
@@ -100,8 +100,8 @@ static int dm_op(const struct dmop_args *op_args)
         if ( data->pad[0] || data->pad[1] || data->pad[2] )
             break;
 
-        rc = hvm_create_ioreq_server(d, data->handle_bufioreq,
-                                     &data->id);
+        rc = create_ioreq_server(d, data->handle_bufioreq,
+                                 &data->id);
         break;
     }
 
@@ -117,12 +117,12 @@ static int dm_op(const struct dmop_args *op_args)
         if ( data->flags & ~valid_flags )
             break;
 
-        rc = hvm_get_ioreq_server_info(d, data->id,
-                                       (data->flags & XEN_DMOP_no_gfns) ?
-                                       NULL : (unsigned long *)&data->ioreq_gfn,
-                                       (data->flags & XEN_DMOP_no_gfns) ?
-                                       NULL : (unsigned long *)&data->bufioreq_gfn,
-                                       &data->bufioreq_port);
+        rc = get_ioreq_server_info(d, data->id,
+                                   (data->flags & XEN_DMOP_no_gfns) ?
+                                   NULL : (unsigned long *)&data->ioreq_gfn,
+                                   (data->flags & XEN_DMOP_no_gfns) ?
+                                   NULL : (unsigned long *)&data->bufioreq_gfn,
+                                   &data->bufioreq_port);
         break;
     }
 
@@ -135,8 +135,8 @@ static int dm_op(const struct dmop_args *op_args)
         if ( data->pad )
             break;
 
-        rc = hvm_map_io_range_to_ioreq_server(d, data->id, data->type,
-                                              data->start, data->end);
+        rc = map_io_range_to_ioreq_server(d, data->id, data->type,
+                                          data->start, data->end);
         break;
     }
 
@@ -149,8 +149,8 @@ static int dm_op(const struct dmop_args *op_args)
         if ( data->pad )
             break;
 
-        rc = hvm_unmap_io_range_from_ioreq_server(d, data->id, data->type,
-                                                  data->start, data->end);
+        rc = unmap_io_range_from_ioreq_server(d, data->id, data->type,
+                                              data->start, data->end);
         break;
     }
 
@@ -163,7 +163,7 @@ static int dm_op(const struct dmop_args *op_args)
         if ( data->pad )
             break;
 
-        rc = hvm_set_ioreq_server_state(d, data->id, !!data->enabled);
+        rc = set_ioreq_server_state(d, data->id, !!data->enabled);
         break;
     }
 
@@ -176,7 +176,7 @@ static int dm_op(const struct dmop_args *op_args)
         if ( data->pad )
             break;
 
-        rc = hvm_destroy_ioreq_server(d, data->id);
+        rc = destroy_ioreq_server(d, data->id);
         break;
     }
 
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 57ddaaa..98fffae 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -58,7 +58,7 @@ struct ioreq_server *get_ioreq_server(const struct domain *d,
  * Iterate over all possible ioreq servers.
  *
  * NOTE: The iteration is backwards such that more recently created
- *       ioreq servers are favoured in hvm_select_ioreq_server().
+ *       ioreq servers are favoured in select_ioreq_server().
  *       This is a semantic that previously existed when ioreq servers
  *       were held in a linked list.
  */
@@ -105,12 +105,12 @@ static struct ioreq_vcpu *get_pending_vcpu(const struct vcpu *v,
     return NULL;
 }
 
-bool hvm_io_pending(struct vcpu *v)
+bool io_pending(struct vcpu *v)
 {
     return get_pending_vcpu(v, NULL);
 }
 
-static bool hvm_wait_for_io(struct ioreq_vcpu *sv, ioreq_t *p)
+static bool wait_for_io(struct ioreq_vcpu *sv, ioreq_t *p)
 {
     unsigned int prev_state = STATE_IOREQ_NONE;
     unsigned int state = p->state;
@@ -167,7 +167,7 @@ static bool hvm_wait_for_io(struct ioreq_vcpu *sv, ioreq_t *p)
     return true;
 }
 
-bool handle_hvm_io_completion(struct vcpu *v)
+bool handle_io_completion(struct vcpu *v)
 {
     struct domain *d = v->domain;
     struct vcpu_io *vio = &v->io;
@@ -182,7 +182,7 @@ bool handle_hvm_io_completion(struct vcpu *v)
     }
 
     sv = get_pending_vcpu(v, &s);
-    if ( sv && !hvm_wait_for_io(sv, get_ioreq(s, v)) )
+    if ( sv && !wait_for_io(sv, get_ioreq(s, v)) )
         return false;
 
     vio->io_req.state = ioreq_needs_completion(&vio->io_req) ?
@@ -207,13 +207,13 @@ bool handle_hvm_io_completion(struct vcpu *v)
                           vio->io_req.dir);
 
     default:
-        return arch_hvm_io_completion(io_completion);
+        return arch_io_completion(io_completion);
     }
 
     return true;
 }
 
-static gfn_t hvm_alloc_legacy_ioreq_gfn(struct ioreq_server *s)
+static gfn_t alloc_legacy_ioreq_gfn(struct ioreq_server *s)
 {
     struct domain *d = s->target;
     unsigned int i;
@@ -229,7 +229,7 @@ static gfn_t hvm_alloc_legacy_ioreq_gfn(struct ioreq_server *s)
     return INVALID_GFN;
 }
 
-static gfn_t hvm_alloc_ioreq_gfn(struct ioreq_server *s)
+static gfn_t alloc_ioreq_gfn(struct ioreq_server *s)
 {
     struct domain *d = s->target;
     unsigned int i;
@@ -244,11 +244,11 @@ static gfn_t hvm_alloc_ioreq_gfn(struct ioreq_server *s)
      * If we are out of 'normal' GFNs then we may still have a 'legacy'
      * GFN available.
      */
-    return hvm_alloc_legacy_ioreq_gfn(s);
+    return alloc_legacy_ioreq_gfn(s);
 }
 
-static bool hvm_free_legacy_ioreq_gfn(struct ioreq_server *s,
-                                      gfn_t gfn)
+static bool free_legacy_ioreq_gfn(struct ioreq_server *s,
+                                  gfn_t gfn)
 {
     struct domain *d = s->target;
     unsigned int i;
@@ -265,21 +265,21 @@ static bool hvm_free_legacy_ioreq_gfn(struct ioreq_server *s,
     return true;
 }
 
-static void hvm_free_ioreq_gfn(struct ioreq_server *s, gfn_t gfn)
+static void free_ioreq_gfn(struct ioreq_server *s, gfn_t gfn)
 {
     struct domain *d = s->target;
     unsigned int i = gfn_x(gfn) - d->ioreq_gfn.base;
 
     ASSERT(!gfn_eq(gfn, INVALID_GFN));
 
-    if ( !hvm_free_legacy_ioreq_gfn(s, gfn) )
+    if ( !free_legacy_ioreq_gfn(s, gfn) )
     {
         ASSERT(i < sizeof(d->ioreq_gfn.mask) * 8);
         set_bit(i, &d->ioreq_gfn.mask);
     }
 }
 
-static void hvm_unmap_ioreq_gfn(struct ioreq_server *s, bool buf)
+static void unmap_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
 
@@ -289,11 +289,11 @@ static void hvm_unmap_ioreq_gfn(struct ioreq_server *s, bool buf)
     destroy_ring_for_helper(&iorp->va, iorp->page);
     iorp->page = NULL;
 
-    hvm_free_ioreq_gfn(s, iorp->gfn);
+    free_ioreq_gfn(s, iorp->gfn);
     iorp->gfn = INVALID_GFN;
 }
 
-static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
+static int map_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
     struct domain *d = s->target;
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
@@ -303,7 +303,7 @@ static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
     {
         /*
          * If a page has already been allocated (which will happen on
-         * demand if hvm_get_ioreq_server_frame() is called), then
+         * demand if get_ioreq_server_frame() is called), then
          * mapping a guest frame is not permitted.
          */
         if ( gfn_eq(iorp->gfn, INVALID_GFN) )
@@ -315,7 +315,7 @@ static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
     if ( d->is_dying )
         return -EINVAL;
 
-    iorp->gfn = hvm_alloc_ioreq_gfn(s);
+    iorp->gfn = alloc_ioreq_gfn(s);
 
     if ( gfn_eq(iorp->gfn, INVALID_GFN) )
         return -ENOMEM;
@@ -324,12 +324,12 @@ static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
                                  &iorp->va);
 
     if ( rc )
-        hvm_unmap_ioreq_gfn(s, buf);
+        unmap_ioreq_gfn(s, buf);
 
     return rc;
 }
 
-static int hvm_alloc_ioreq_mfn(struct ioreq_server *s, bool buf)
+static int alloc_ioreq_mfn(struct ioreq_server *s, bool buf)
 {
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
     struct page_info *page;
@@ -338,7 +338,7 @@ static int hvm_alloc_ioreq_mfn(struct ioreq_server *s, bool buf)
     {
         /*
          * If a guest frame has already been mapped (which may happen
-         * on demand if hvm_get_ioreq_server_info() is called), then
+         * on demand if get_ioreq_server_info() is called), then
          * allocating a page is not permitted.
          */
         if ( !gfn_eq(iorp->gfn, INVALID_GFN) )
@@ -377,7 +377,7 @@ static int hvm_alloc_ioreq_mfn(struct ioreq_server *s, bool buf)
     return -ENOMEM;
 }
 
-static void hvm_free_ioreq_mfn(struct ioreq_server *s, bool buf)
+static void free_ioreq_mfn(struct ioreq_server *s, bool buf)
 {
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
     struct page_info *page = iorp->page;
@@ -416,7 +416,7 @@ bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
     return found;
 }
 
-static void hvm_remove_ioreq_gfn(struct ioreq_server *s, bool buf)
+static void remove_ioreq_gfn(struct ioreq_server *s, bool buf)
 
 {
     struct domain *d = s->target;
@@ -431,7 +431,7 @@ static void hvm_remove_ioreq_gfn(struct ioreq_server *s, bool buf)
     clear_page(iorp->va);
 }
 
-static int hvm_add_ioreq_gfn(struct ioreq_server *s, bool buf)
+static int add_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
     struct domain *d = s->target;
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
@@ -450,8 +450,8 @@ static int hvm_add_ioreq_gfn(struct ioreq_server *s, bool buf)
     return rc;
 }
 
-static void hvm_update_ioreq_evtchn(struct ioreq_server *s,
-                                    struct ioreq_vcpu *sv)
+static void update_ioreq_evtchn(struct ioreq_server *s,
+                                struct ioreq_vcpu *sv)
 {
     ASSERT(spin_is_locked(&s->lock));
 
@@ -466,8 +466,8 @@ static void hvm_update_ioreq_evtchn(struct ioreq_server *s,
 #define HANDLE_BUFIOREQ(s) \
     ((s)->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF)
 
-static int hvm_ioreq_server_add_vcpu(struct ioreq_server *s,
-                                     struct vcpu *v)
+static int ioreq_server_add_vcpu(struct ioreq_server *s,
+                                 struct vcpu *v)
 {
     struct ioreq_vcpu *sv;
     int rc;
@@ -502,7 +502,7 @@ static int hvm_ioreq_server_add_vcpu(struct ioreq_server *s,
     list_add(&sv->list_entry, &s->ioreq_vcpu_list);
 
     if ( s->enabled )
-        hvm_update_ioreq_evtchn(s, sv);
+        update_ioreq_evtchn(s, sv);
 
     spin_unlock(&s->lock);
     return 0;
@@ -518,8 +518,8 @@ static int hvm_ioreq_server_add_vcpu(struct ioreq_server *s,
     return rc;
 }
 
-static void hvm_ioreq_server_remove_vcpu(struct ioreq_server *s,
-                                         struct vcpu *v)
+static void ioreq_server_remove_vcpu(struct ioreq_server *s,
+                                     struct vcpu *v)
 {
     struct ioreq_vcpu *sv;
 
@@ -546,7 +546,7 @@ static void hvm_ioreq_server_remove_vcpu(struct ioreq_server *s,
     spin_unlock(&s->lock);
 }
 
-static void hvm_ioreq_server_remove_all_vcpus(struct ioreq_server *s)
+static void ioreq_server_remove_all_vcpus(struct ioreq_server *s)
 {
     struct ioreq_vcpu *sv, *next;
 
@@ -572,49 +572,49 @@ static void hvm_ioreq_server_remove_all_vcpus(struct ioreq_server *s)
     spin_unlock(&s->lock);
 }
 
-static int hvm_ioreq_server_map_pages(struct ioreq_server *s)
+static int ioreq_server_map_pages(struct ioreq_server *s)
 {
     int rc;
 
-    rc = hvm_map_ioreq_gfn(s, false);
+    rc = map_ioreq_gfn(s, false);
 
     if ( !rc && HANDLE_BUFIOREQ(s) )
-        rc = hvm_map_ioreq_gfn(s, true);
+        rc = map_ioreq_gfn(s, true);
 
     if ( rc )
-        hvm_unmap_ioreq_gfn(s, false);
+        unmap_ioreq_gfn(s, false);
 
     return rc;
 }
 
-static void hvm_ioreq_server_unmap_pages(struct ioreq_server *s)
+static void ioreq_server_unmap_pages(struct ioreq_server *s)
 {
-    hvm_unmap_ioreq_gfn(s, true);
-    hvm_unmap_ioreq_gfn(s, false);
+    unmap_ioreq_gfn(s, true);
+    unmap_ioreq_gfn(s, false);
 }
 
-static int hvm_ioreq_server_alloc_pages(struct ioreq_server *s)
+static int ioreq_server_alloc_pages(struct ioreq_server *s)
 {
     int rc;
 
-    rc = hvm_alloc_ioreq_mfn(s, false);
+    rc = alloc_ioreq_mfn(s, false);
 
     if ( !rc && (s->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF) )
-        rc = hvm_alloc_ioreq_mfn(s, true);
+        rc = alloc_ioreq_mfn(s, true);
 
     if ( rc )
-        hvm_free_ioreq_mfn(s, false);
+        free_ioreq_mfn(s, false);
 
     return rc;
 }
 
-static void hvm_ioreq_server_free_pages(struct ioreq_server *s)
+static void ioreq_server_free_pages(struct ioreq_server *s)
 {
-    hvm_free_ioreq_mfn(s, true);
-    hvm_free_ioreq_mfn(s, false);
+    free_ioreq_mfn(s, true);
+    free_ioreq_mfn(s, false);
 }
 
-static void hvm_ioreq_server_free_rangesets(struct ioreq_server *s)
+static void ioreq_server_free_rangesets(struct ioreq_server *s)
 {
     unsigned int i;
 
@@ -622,8 +622,8 @@ static void hvm_ioreq_server_free_rangesets(struct ioreq_server *s)
         rangeset_destroy(s->range[i]);
 }
 
-static int hvm_ioreq_server_alloc_rangesets(struct ioreq_server *s,
-                                            ioservid_t id)
+static int ioreq_server_alloc_rangesets(struct ioreq_server *s,
+                                        ioservid_t id)
 {
     unsigned int i;
     int rc;
@@ -655,12 +655,12 @@ static int hvm_ioreq_server_alloc_rangesets(struct ioreq_server *s,
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
 
@@ -669,29 +669,29 @@ static void hvm_ioreq_server_enable(struct ioreq_server *s)
     if ( s->enabled )
         goto done;
 
-    hvm_remove_ioreq_gfn(s, false);
-    hvm_remove_ioreq_gfn(s, true);
+    remove_ioreq_gfn(s, false);
+    remove_ioreq_gfn(s, true);
 
     s->enabled = true;
 
     list_for_each_entry ( sv,
                           &s->ioreq_vcpu_list,
                           list_entry )
-        hvm_update_ioreq_evtchn(s, sv);
+        update_ioreq_evtchn(s, sv);
 
   done:
     spin_unlock(&s->lock);
 }
 
-static void hvm_ioreq_server_disable(struct ioreq_server *s)
+static void ioreq_server_disable(struct ioreq_server *s)
 {
     spin_lock(&s->lock);
 
     if ( !s->enabled )
         goto done;
 
-    hvm_add_ioreq_gfn(s, true);
-    hvm_add_ioreq_gfn(s, false);
+    add_ioreq_gfn(s, true);
+    add_ioreq_gfn(s, false);
 
     s->enabled = false;
 
@@ -699,9 +699,9 @@ static void hvm_ioreq_server_disable(struct ioreq_server *s)
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
@@ -719,7 +719,7 @@ static int hvm_ioreq_server_init(struct ioreq_server *s,
     s->ioreq.gfn = INVALID_GFN;
     s->bufioreq.gfn = INVALID_GFN;
 
-    rc = hvm_ioreq_server_alloc_rangesets(s, id);
+    rc = ioreq_server_alloc_rangesets(s, id);
     if ( rc )
         return rc;
 
@@ -727,7 +727,7 @@ static int hvm_ioreq_server_init(struct ioreq_server *s,
 
     for_each_vcpu ( d, v )
     {
-        rc = hvm_ioreq_server_add_vcpu(s, v);
+        rc = ioreq_server_add_vcpu(s, v);
         if ( rc )
             goto fail_add;
     }
@@ -735,39 +735,39 @@ static int hvm_ioreq_server_init(struct ioreq_server *s,
     return 0;
 
  fail_add:
-    hvm_ioreq_server_remove_all_vcpus(s);
-    hvm_ioreq_server_unmap_pages(s);
+    ioreq_server_remove_all_vcpus(s);
+    ioreq_server_unmap_pages(s);
 
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
-     * NOTE: It is safe to call both hvm_ioreq_server_unmap_pages() and
-     *       hvm_ioreq_server_free_pages() in that order.
+     * NOTE: It is safe to call both ioreq_server_unmap_pages() and
+     *       ioreq_server_free_pages() in that order.
      *       This is because the former will do nothing if the pages
      *       are not mapped, leaving the page to be freed by the latter.
      *       However if the pages are mapped then the former will set
      *       the page_info pointer to NULL, meaning the latter will do
      *       nothing.
      */
-    hvm_ioreq_server_unmap_pages(s);
-    hvm_ioreq_server_free_pages(s);
+    ioreq_server_unmap_pages(s);
+    ioreq_server_free_pages(s);
 
-    hvm_ioreq_server_free_rangesets(s);
+    ioreq_server_free_rangesets(s);
 
     put_domain(s->emulator);
 }
 
-int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
-                            ioservid_t *id)
+int create_ioreq_server(struct domain *d, int bufioreq_handling,
+                        ioservid_t *id)
 {
     struct ioreq_server *s;
     unsigned int i;
@@ -795,11 +795,11 @@ int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
 
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
@@ -822,7 +822,7 @@ int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
     return rc;
 }
 
-int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
+int destroy_ioreq_server(struct domain *d, ioservid_t id)
 {
     struct ioreq_server *s;
     int rc;
@@ -841,15 +841,15 @@ int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
 
     domain_pause(d);
 
-    arch_hvm_destroy_ioreq_server(s);
+    arch_destroy_ioreq_server(s);
 
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
@@ -864,10 +864,10 @@ int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
     return rc;
 }
 
-int hvm_get_ioreq_server_info(struct domain *d, ioservid_t id,
-                              unsigned long *ioreq_gfn,
-                              unsigned long *bufioreq_gfn,
-                              evtchn_port_t *bufioreq_port)
+int get_ioreq_server_info(struct domain *d, ioservid_t id,
+                          unsigned long *ioreq_gfn,
+                          unsigned long *bufioreq_gfn,
+                          evtchn_port_t *bufioreq_port)
 {
     struct ioreq_server *s;
     int rc;
@@ -886,7 +886,7 @@ int hvm_get_ioreq_server_info(struct domain *d, ioservid_t id,
 
     if ( ioreq_gfn || bufioreq_gfn )
     {
-        rc = hvm_ioreq_server_map_pages(s);
+        rc = ioreq_server_map_pages(s);
         if ( rc )
             goto out;
     }
@@ -911,8 +911,8 @@ int hvm_get_ioreq_server_info(struct domain *d, ioservid_t id,
     return rc;
 }
 
-int hvm_get_ioreq_server_frame(struct domain *d, ioservid_t id,
-                               unsigned long idx, mfn_t *mfn)
+int get_ioreq_server_frame(struct domain *d, ioservid_t id,
+                           unsigned long idx, mfn_t *mfn)
 {
     struct ioreq_server *s;
     int rc;
@@ -931,7 +931,7 @@ int hvm_get_ioreq_server_frame(struct domain *d, ioservid_t id,
     if ( s->emulator != current->domain )
         goto out;
 
-    rc = hvm_ioreq_server_alloc_pages(s);
+    rc = ioreq_server_alloc_pages(s);
     if ( rc )
         goto out;
 
@@ -962,9 +962,9 @@ int hvm_get_ioreq_server_frame(struct domain *d, ioservid_t id,
     return rc;
 }
 
-int hvm_map_io_range_to_ioreq_server(struct domain *d, ioservid_t id,
-                                     uint32_t type, uint64_t start,
-                                     uint64_t end)
+int map_io_range_to_ioreq_server(struct domain *d, ioservid_t id,
+                                 uint32_t type, uint64_t start,
+                                 uint64_t end)
 {
     struct ioreq_server *s;
     struct rangeset *r;
@@ -1014,9 +1014,9 @@ int hvm_map_io_range_to_ioreq_server(struct domain *d, ioservid_t id,
     return rc;
 }
 
-int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
-                                         uint32_t type, uint64_t start,
-                                         uint64_t end)
+int unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
+                                     uint32_t type, uint64_t start,
+                                     uint64_t end)
 {
     struct ioreq_server *s;
     struct rangeset *r;
@@ -1066,8 +1066,8 @@ int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
     return rc;
 }
 
-int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
-                               bool enabled)
+int set_ioreq_server_state(struct domain *d, ioservid_t id,
+                           bool enabled)
 {
     struct ioreq_server *s;
     int rc;
@@ -1087,9 +1087,9 @@ int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
     domain_pause(d);
 
     if ( enabled )
-        hvm_ioreq_server_enable(s);
+        ioreq_server_enable(s);
     else
-        hvm_ioreq_server_disable(s);
+        ioreq_server_disable(s);
 
     domain_unpause(d);
 
@@ -1100,7 +1100,7 @@ int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
     return rc;
 }
 
-int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v)
+int all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v)
 {
     struct ioreq_server *s;
     unsigned int id;
@@ -1110,7 +1110,7 @@ int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v)
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
     {
-        rc = hvm_ioreq_server_add_vcpu(s, v);
+        rc = ioreq_server_add_vcpu(s, v);
         if ( rc )
             goto fail;
     }
@@ -1127,7 +1127,7 @@ int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v)
         if ( !s )
             continue;
 
-        hvm_ioreq_server_remove_vcpu(s, v);
+        ioreq_server_remove_vcpu(s, v);
     }
 
     spin_unlock_recursive(&d->ioreq_server.lock);
@@ -1135,7 +1135,7 @@ int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v)
     return rc;
 }
 
-void hvm_all_ioreq_servers_remove_vcpu(struct domain *d, struct vcpu *v)
+void all_ioreq_servers_remove_vcpu(struct domain *d, struct vcpu *v)
 {
     struct ioreq_server *s;
     unsigned int id;
@@ -1143,17 +1143,17 @@ void hvm_all_ioreq_servers_remove_vcpu(struct domain *d, struct vcpu *v)
     spin_lock_recursive(&d->ioreq_server.lock);
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
-        hvm_ioreq_server_remove_vcpu(s, v);
+        ioreq_server_remove_vcpu(s, v);
 
     spin_unlock_recursive(&d->ioreq_server.lock);
 }
 
-void hvm_destroy_all_ioreq_servers(struct domain *d)
+void destroy_all_ioreq_servers(struct domain *d)
 {
     struct ioreq_server *s;
     unsigned int id;
 
-    if ( !arch_hvm_ioreq_destroy(d) )
+    if ( !arch_ioreq_destroy(d) )
         return;
 
     spin_lock_recursive(&d->ioreq_server.lock);
@@ -1162,13 +1162,13 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
 
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
@@ -1177,15 +1177,15 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
     spin_unlock_recursive(&d->ioreq_server.lock);
 }
 
-struct ioreq_server *hvm_select_ioreq_server(struct domain *d,
-                                             ioreq_t *p)
+struct ioreq_server *select_ioreq_server(struct domain *d,
+                                         ioreq_t *p)
 {
     struct ioreq_server *s;
     uint8_t type;
     uint64_t addr;
     unsigned int id;
 
-    if ( hvm_ioreq_server_get_type_addr(d, p, &type, &addr) )
+    if ( ioreq_server_get_type_addr(d, p, &type, &addr) )
         return NULL;
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
@@ -1233,7 +1233,7 @@ struct ioreq_server *hvm_select_ioreq_server(struct domain *d,
     return NULL;
 }
 
-static int hvm_send_buffered_ioreq(struct ioreq_server *s, ioreq_t *p)
+static int send_buffered_ioreq(struct ioreq_server *s, ioreq_t *p)
 {
     struct domain *d = current->domain;
     struct ioreq_page *iorp;
@@ -1326,8 +1326,8 @@ static int hvm_send_buffered_ioreq(struct ioreq_server *s, ioreq_t *p)
     return IOREQ_STATUS_HANDLED;
 }
 
-int hvm_send_ioreq(struct ioreq_server *s, ioreq_t *proto_p,
-                   bool buffered)
+int send_ioreq(struct ioreq_server *s, ioreq_t *proto_p,
+               bool buffered)
 {
     struct vcpu *curr = current;
     struct domain *d = curr->domain;
@@ -1336,7 +1336,7 @@ int hvm_send_ioreq(struct ioreq_server *s, ioreq_t *proto_p,
     ASSERT(s);
 
     if ( buffered )
-        return hvm_send_buffered_ioreq(s, proto_p);
+        return send_buffered_ioreq(s, proto_p);
 
     if ( unlikely(!vcpu_start_shutdown_deferral(curr)) )
         return IOREQ_STATUS_RETRY;
@@ -1386,7 +1386,7 @@ int hvm_send_ioreq(struct ioreq_server *s, ioreq_t *proto_p,
     return IOREQ_STATUS_UNHANDLED;
 }
 
-unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered)
+unsigned int broadcast_ioreq(ioreq_t *p, bool buffered)
 {
     struct domain *d = current->domain;
     struct ioreq_server *s;
@@ -1397,18 +1397,18 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered)
         if ( !s->enabled )
             continue;
 
-        if ( hvm_send_ioreq(s, p, buffered) == IOREQ_STATUS_UNHANDLED )
+        if ( send_ioreq(s, p, buffered) == IOREQ_STATUS_UNHANDLED )
             failed++;
     }
 
     return failed;
 }
 
-void hvm_ioreq_init(struct domain *d)
+void ioreq_init(struct domain *d)
 {
     spin_lock_init(&d->ioreq_server.lock);
 
-    arch_hvm_ioreq_init(d);
+    arch_ioreq_init(d);
 }
 
 /*
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 83d800f..cf53ca3 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1070,7 +1070,7 @@ static int acquire_ioreq_server(struct domain *d,
     {
         mfn_t mfn;
 
-        rc = hvm_get_ioreq_server_frame(d, id, frame + i, &mfn);
+        rc = get_ioreq_server_frame(d, id, frame + i, &mfn);
         if ( rc )
             return rc;
 
diff --git a/xen/include/asm-x86/hvm/ioreq.h b/xen/include/asm-x86/hvm/ioreq.h
index 5ed977e..1340441 100644
--- a/xen/include/asm-x86/hvm/ioreq.h
+++ b/xen/include/asm-x86/hvm/ioreq.h
@@ -26,7 +26,7 @@
 
 #include <public/hvm/params.h>
 
-static inline bool arch_hvm_io_completion(enum io_completion io_completion)
+static inline bool arch_io_completion(enum io_completion io_completion)
 {
     switch ( io_completion )
     {
@@ -50,7 +50,7 @@ static inline bool arch_hvm_io_completion(enum io_completion io_completion)
 }
 
 /* Called when target domain is paused */
-static inline void arch_hvm_destroy_ioreq_server(struct ioreq_server *s)
+static inline void arch_destroy_ioreq_server(struct ioreq_server *s)
 {
     p2m_set_ioreq_server(s->target, 0, s);
 }
@@ -105,10 +105,10 @@ static inline int hvm_map_mem_type_to_ioreq_server(struct domain *d,
     return rc;
 }
 
-static inline int hvm_ioreq_server_get_type_addr(const struct domain *d,
-                                                 const ioreq_t *p,
-                                                 uint8_t *type,
-                                                 uint64_t *addr)
+static inline int ioreq_server_get_type_addr(const struct domain *d,
+                                             const ioreq_t *p,
+                                             uint8_t *type,
+                                             uint64_t *addr)
 {
     uint32_t cf8 = d->arch.hvm.pci_cf8;
 
@@ -164,12 +164,12 @@ static inline int hvm_access_cf8(
     return X86EMUL_UNHANDLEABLE;
 }
 
-static inline void arch_hvm_ioreq_init(struct domain *d)
+static inline void arch_ioreq_init(struct domain *d)
 {
     register_portio_handler(d, 0xcf8, 4, hvm_access_cf8);
 }
 
-static inline bool arch_hvm_ioreq_destroy(struct domain *d)
+static inline bool arch_ioreq_destroy(struct domain *d)
 {
     if ( !relocate_portio_handler(d, 0xcf8, 0xcf8, 4) )
         return false;
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index 8451866..7b03ab5 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -81,39 +81,39 @@ static inline bool ioreq_needs_completion(const ioreq_t *ioreq)
            (ioreq->type != IOREQ_TYPE_PIO || ioreq->dir != IOREQ_WRITE);
 }
 
-bool hvm_io_pending(struct vcpu *v);
-bool handle_hvm_io_completion(struct vcpu *v);
+bool io_pending(struct vcpu *v);
+bool handle_io_completion(struct vcpu *v);
 bool is_ioreq_server_page(struct domain *d, const struct page_info *page);
 
-int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
-                            ioservid_t *id);
-int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id);
-int hvm_get_ioreq_server_info(struct domain *d, ioservid_t id,
-                              unsigned long *ioreq_gfn,
-                              unsigned long *bufioreq_gfn,
-                              evtchn_port_t *bufioreq_port);
-int hvm_get_ioreq_server_frame(struct domain *d, ioservid_t id,
-                               unsigned long idx, mfn_t *mfn);
-int hvm_map_io_range_to_ioreq_server(struct domain *d, ioservid_t id,
+int create_ioreq_server(struct domain *d, int bufioreq_handling,
+                        ioservid_t *id);
+int destroy_ioreq_server(struct domain *d, ioservid_t id);
+int get_ioreq_server_info(struct domain *d, ioservid_t id,
+                          unsigned long *ioreq_gfn,
+                          unsigned long *bufioreq_gfn,
+                          evtchn_port_t *bufioreq_port);
+int get_ioreq_server_frame(struct domain *d, ioservid_t id,
+                           unsigned long idx, mfn_t *mfn);
+int map_io_range_to_ioreq_server(struct domain *d, ioservid_t id,
+                                 uint32_t type, uint64_t start,
+                                 uint64_t end);
+int unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
                                      uint32_t type, uint64_t start,
                                      uint64_t end);
-int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
-                                         uint32_t type, uint64_t start,
-                                         uint64_t end);
-int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
-                               bool enabled);
-
-int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v);
-void hvm_all_ioreq_servers_remove_vcpu(struct domain *d, struct vcpu *v);
-void hvm_destroy_all_ioreq_servers(struct domain *d);
-
-struct ioreq_server *hvm_select_ioreq_server(struct domain *d,
-                                             ioreq_t *p);
-int hvm_send_ioreq(struct ioreq_server *s, ioreq_t *proto_p,
-                   bool buffered);
-unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered);
-
-void hvm_ioreq_init(struct domain *d);
+int set_ioreq_server_state(struct domain *d, ioservid_t id,
+                           bool enabled);
+
+int all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v);
+void all_ioreq_servers_remove_vcpu(struct domain *d, struct vcpu *v);
+void destroy_all_ioreq_servers(struct domain *d);
+
+struct ioreq_server *select_ioreq_server(struct domain *d,
+                                         ioreq_t *p);
+int send_ioreq(struct ioreq_server *s, ioreq_t *proto_p,
+               bool buffered);
+unsigned int broadcast_ioreq(ioreq_t *p, bool buffered);
+
+void ioreq_init(struct domain *d);
 
 #endif /* __XEN_IOREQ_H__ */
 
-- 
2.7.4


