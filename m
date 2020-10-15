Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0BB28F712
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:45:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7577.19976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6Na-0005Rs-I0; Thu, 15 Oct 2020 16:45:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7577.19976; Thu, 15 Oct 2020 16:45:26 +0000
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
	id 1kT6Na-0005R1-DR; Thu, 15 Oct 2020 16:45:26 +0000
Received: by outflank-mailman (input) for mailman id 7577;
 Thu, 15 Oct 2020 16:45:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kT6NZ-0004yr-62
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:45:25 +0000
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ed28b36-dc40-41de-a257-d042cfe62eca;
 Thu, 15 Oct 2020 16:44:59 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id l2so4404061lfk.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:44:59 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.44.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Oct 2020 09:44:57 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kT6NZ-0004yr-62
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:45:25 +0000
X-Inumbo-ID: 8ed28b36-dc40-41de-a257-d042cfe62eca
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8ed28b36-dc40-41de-a257-d042cfe62eca;
	Thu, 15 Oct 2020 16:44:59 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id l2so4404061lfk.0
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iOP5c373gWXxnyEQtQ6/39WWsVy1IddOyO5zW1UbPhE=;
        b=kFavmZh0ZbnHd5xGoKY+YOWu68vMxGRVt2WafKGrCJngOb6uDjR/OMq8tjaaYgefme
         okFPYz4qFaKdQXGP1H1ZMrwxVfS6tDCbNnxs4abGaoRRzyo7JJSGlQX9hTZwzp5c8Sqe
         hqi+5eF8BMvKFDAM7UQ/ccFiwUWkzbOD6RRKWwTJdeZqiki5sOUEcjbLn1yCck9e4Ng9
         McW0wAD7DFOMr3ZN1/1cbgdMlH1lY9Vn4TeCZ33ub0RzYWKmVwpzI8gzGFdZ1Ddyut7V
         Pu0OTUXIemWydghO53ERVwhEJbdQooYP6gWwlfdffuRIEO/HamwQ4Wh1j7iTnx0CqUyI
         t/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=iOP5c373gWXxnyEQtQ6/39WWsVy1IddOyO5zW1UbPhE=;
        b=oglCZ/u/TmxiZbg8cjRj4MTvLeMp7ChN5A+vQOZGZsclcGPs4igeeFAlWSFPiYkXl/
         155XTF5ov8hHkOt6vaur7VYD47WyWjE5kKRUh7g732po41xx7I7Qj04NhkaFnhqSR6Ka
         S9eZ45YXlENuKTONL1BMBHKFBOxAbdc5JsxlGQvzyOs+VO7n60XVCEL3KKIfwVVBDTl7
         9QZBIceP/Huai7CV8adVsaxJMguWObpt99AwRFXP3NERto5oCXNLCaLjKrR6IEWKcgjS
         WvuXu3N82RY7Xy3fR+mO0UwxoiO7EBCcFEDDvBUfeO0dSULezYMo/8wveVJodGPl5sNt
         fmNQ==
X-Gm-Message-State: AOAM531R6cRg+UK8OdoW8tYRx0jF9STivDPxWC0htabVz3QW00WwrALx
	zha9qjqpDOJ8UnPkKICAkvKYf5GhXaBUbQ==
X-Google-Smtp-Source: ABdhPJwz+YDHJwfme7KDVmcq0ojADYmPGfgSySABhBOm8lRi65o2wRiQCuvgaOPCZMbIOk8CfIv52A==
X-Received: by 2002:a19:ee12:: with SMTP id g18mr1526973lfb.515.1602780298323;
        Thu, 15 Oct 2020 09:44:58 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.44.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2020 09:44:57 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V2 06/23] xen/ioreq: Make x86's hvm_ioreq_(page/vcpu/server) structs common
Date: Thu, 15 Oct 2020 19:44:17 +0300
Message-Id: <1602780274-29141-7-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The IOREQ is a common feature now and these structs will be used
on Arm as is. Move them to xen/ioreq.h and remove "hvm" prefixes.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - new patch

Changes V1 -> V2:
   - remove "hvm" prefix
---
 xen/arch/x86/hvm/emulate.c       |   2 +-
 xen/arch/x86/hvm/stdvga.c        |   2 +-
 xen/arch/x86/mm/p2m.c            |   8 +--
 xen/common/ioreq.c               | 134 +++++++++++++++++++--------------------
 xen/include/asm-x86/hvm/domain.h |  36 +----------
 xen/include/asm-x86/hvm/ioreq.h  |   4 +-
 xen/include/asm-x86/p2m.h        |   8 +--
 xen/include/xen/ioreq.h          |  44 +++++++++++--
 8 files changed, 119 insertions(+), 119 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 5700274..4746d5a 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -287,7 +287,7 @@ static int hvmemul_do_io(
          * However, there's no cheap approach to avoid above situations in xen,
          * so the device model side needs to check the incoming ioreq event.
          */
-        struct hvm_ioreq_server *s = NULL;
+        struct ioreq_server *s = NULL;
         p2m_type_t p2mt = p2m_invalid;
 
         if ( is_mmio )
diff --git a/xen/arch/x86/hvm/stdvga.c b/xen/arch/x86/hvm/stdvga.c
index e184664..bafb3f6 100644
--- a/xen/arch/x86/hvm/stdvga.c
+++ b/xen/arch/x86/hvm/stdvga.c
@@ -466,7 +466,7 @@ static int stdvga_mem_write(const struct hvm_io_handler *handler,
         .dir = IOREQ_WRITE,
         .data = data,
     };
-    struct hvm_ioreq_server *srv;
+    struct ioreq_server *srv;
 
     if ( !stdvga_cache_is_enabled(s) || !s->stdvga )
         goto done;
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 928344b..6102771 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -366,7 +366,7 @@ void p2m_memory_type_changed(struct domain *d)
 
 int p2m_set_ioreq_server(struct domain *d,
                          unsigned int flags,
-                         struct hvm_ioreq_server *s)
+                         struct ioreq_server *s)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     int rc;
@@ -414,11 +414,11 @@ int p2m_set_ioreq_server(struct domain *d,
     return rc;
 }
 
-struct hvm_ioreq_server *p2m_get_ioreq_server(struct domain *d,
-                                              unsigned int *flags)
+struct ioreq_server *p2m_get_ioreq_server(struct domain *d,
+                                          unsigned int *flags)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
-    struct hvm_ioreq_server *s;
+    struct ioreq_server *s;
 
     spin_lock(&p2m->ioreq.lock);
 
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 5fa10b6..1d62d13 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -34,7 +34,7 @@
 #include <public/hvm/params.h>
 
 static void set_ioreq_server(struct domain *d, unsigned int id,
-                             struct hvm_ioreq_server *s)
+                             struct ioreq_server *s)
 {
     ASSERT(id < MAX_NR_IOREQ_SERVERS);
     ASSERT(!s || !d->arch.hvm.ioreq_server.server[id]);
@@ -45,8 +45,8 @@ static void set_ioreq_server(struct domain *d, unsigned int id,
 #define GET_IOREQ_SERVER(d, id) \
     (d)->arch.hvm.ioreq_server.server[id]
 
-struct hvm_ioreq_server *get_ioreq_server(const struct domain *d,
-                                          unsigned int id)
+struct ioreq_server *get_ioreq_server(const struct domain *d,
+                                      unsigned int id)
 {
     if ( id >= MAX_NR_IOREQ_SERVERS )
         return NULL;
@@ -68,7 +68,7 @@ struct hvm_ioreq_server *get_ioreq_server(const struct domain *d,
             continue; \
         else
 
-static ioreq_t *get_ioreq(struct hvm_ioreq_server *s, struct vcpu *v)
+static ioreq_t *get_ioreq(struct ioreq_server *s, struct vcpu *v)
 {
     shared_iopage_t *p = s->ioreq.va;
 
@@ -78,16 +78,16 @@ static ioreq_t *get_ioreq(struct hvm_ioreq_server *s, struct vcpu *v)
     return &p->vcpu_ioreq[v->vcpu_id];
 }
 
-static struct hvm_ioreq_vcpu *get_pending_vcpu(const struct vcpu *v,
-                                               struct hvm_ioreq_server **srvp)
+static struct ioreq_vcpu *get_pending_vcpu(const struct vcpu *v,
+                                           struct ioreq_server **srvp)
 {
     struct domain *d = v->domain;
-    struct hvm_ioreq_server *s;
+    struct ioreq_server *s;
     unsigned int id;
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
     {
-        struct hvm_ioreq_vcpu *sv;
+        struct ioreq_vcpu *sv;
 
         list_for_each_entry ( sv,
                               &s->ioreq_vcpu_list,
@@ -110,7 +110,7 @@ bool hvm_io_pending(struct vcpu *v)
     return get_pending_vcpu(v, NULL);
 }
 
-static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t *p)
+static bool hvm_wait_for_io(struct ioreq_vcpu *sv, ioreq_t *p)
 {
     unsigned int prev_state = STATE_IOREQ_NONE;
     unsigned int state = p->state;
@@ -171,8 +171,8 @@ bool handle_hvm_io_completion(struct vcpu *v)
 {
     struct domain *d = v->domain;
     struct hvm_vcpu_io *vio = &v->arch.hvm.hvm_io;
-    struct hvm_ioreq_server *s;
-    struct hvm_ioreq_vcpu *sv;
+    struct ioreq_server *s;
+    struct ioreq_vcpu *sv;
     enum hvm_io_completion io_completion;
 
     if ( has_vpci(d) && vpci_process_pending(v) )
@@ -213,7 +213,7 @@ bool handle_hvm_io_completion(struct vcpu *v)
     return true;
 }
 
-static gfn_t hvm_alloc_legacy_ioreq_gfn(struct hvm_ioreq_server *s)
+static gfn_t hvm_alloc_legacy_ioreq_gfn(struct ioreq_server *s)
 {
     struct domain *d = s->target;
     unsigned int i;
@@ -229,7 +229,7 @@ static gfn_t hvm_alloc_legacy_ioreq_gfn(struct hvm_ioreq_server *s)
     return INVALID_GFN;
 }
 
-static gfn_t hvm_alloc_ioreq_gfn(struct hvm_ioreq_server *s)
+static gfn_t hvm_alloc_ioreq_gfn(struct ioreq_server *s)
 {
     struct domain *d = s->target;
     unsigned int i;
@@ -247,7 +247,7 @@ static gfn_t hvm_alloc_ioreq_gfn(struct hvm_ioreq_server *s)
     return hvm_alloc_legacy_ioreq_gfn(s);
 }
 
-static bool hvm_free_legacy_ioreq_gfn(struct hvm_ioreq_server *s,
+static bool hvm_free_legacy_ioreq_gfn(struct ioreq_server *s,
                                       gfn_t gfn)
 {
     struct domain *d = s->target;
@@ -265,7 +265,7 @@ static bool hvm_free_legacy_ioreq_gfn(struct hvm_ioreq_server *s,
     return true;
 }
 
-static void hvm_free_ioreq_gfn(struct hvm_ioreq_server *s, gfn_t gfn)
+static void hvm_free_ioreq_gfn(struct ioreq_server *s, gfn_t gfn)
 {
     struct domain *d = s->target;
     unsigned int i = gfn_x(gfn) - d->arch.hvm.ioreq_gfn.base;
@@ -279,9 +279,9 @@ static void hvm_free_ioreq_gfn(struct hvm_ioreq_server *s, gfn_t gfn)
     }
 }
 
-static void hvm_unmap_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
+static void hvm_unmap_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
-    struct hvm_ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
 
     if ( gfn_eq(iorp->gfn, INVALID_GFN) )
         return;
@@ -293,10 +293,10 @@ static void hvm_unmap_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
     iorp->gfn = INVALID_GFN;
 }
 
-static int hvm_map_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
+static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
     struct domain *d = s->target;
-    struct hvm_ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
     int rc;
 
     if ( iorp->page )
@@ -329,9 +329,9 @@ static int hvm_map_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
     return rc;
 }
 
-static int hvm_alloc_ioreq_mfn(struct hvm_ioreq_server *s, bool buf)
+static int hvm_alloc_ioreq_mfn(struct ioreq_server *s, bool buf)
 {
-    struct hvm_ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
     struct page_info *page;
 
     if ( iorp->page )
@@ -377,9 +377,9 @@ static int hvm_alloc_ioreq_mfn(struct hvm_ioreq_server *s, bool buf)
     return -ENOMEM;
 }
 
-static void hvm_free_ioreq_mfn(struct hvm_ioreq_server *s, bool buf)
+static void hvm_free_ioreq_mfn(struct ioreq_server *s, bool buf)
 {
-    struct hvm_ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
     struct page_info *page = iorp->page;
 
     if ( !page )
@@ -396,7 +396,7 @@ static void hvm_free_ioreq_mfn(struct hvm_ioreq_server *s, bool buf)
 
 bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
 {
-    const struct hvm_ioreq_server *s;
+    const struct ioreq_server *s;
     unsigned int id;
     bool found = false;
 
@@ -416,11 +416,11 @@ bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
     return found;
 }
 
-static void hvm_remove_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
+static void hvm_remove_ioreq_gfn(struct ioreq_server *s, bool buf)
 
 {
     struct domain *d = s->target;
-    struct hvm_ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
 
     if ( gfn_eq(iorp->gfn, INVALID_GFN) )
         return;
@@ -431,10 +431,10 @@ static void hvm_remove_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
     clear_page(iorp->va);
 }
 
-static int hvm_add_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
+static int hvm_add_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
     struct domain *d = s->target;
-    struct hvm_ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
     int rc;
 
     if ( gfn_eq(iorp->gfn, INVALID_GFN) )
@@ -450,8 +450,8 @@ static int hvm_add_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
     return rc;
 }
 
-static void hvm_update_ioreq_evtchn(struct hvm_ioreq_server *s,
-                                    struct hvm_ioreq_vcpu *sv)
+static void hvm_update_ioreq_evtchn(struct ioreq_server *s,
+                                    struct ioreq_vcpu *sv)
 {
     ASSERT(spin_is_locked(&s->lock));
 
@@ -466,13 +466,13 @@ static void hvm_update_ioreq_evtchn(struct hvm_ioreq_server *s,
 #define HANDLE_BUFIOREQ(s) \
     ((s)->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF)
 
-static int hvm_ioreq_server_add_vcpu(struct hvm_ioreq_server *s,
+static int hvm_ioreq_server_add_vcpu(struct ioreq_server *s,
                                      struct vcpu *v)
 {
-    struct hvm_ioreq_vcpu *sv;
+    struct ioreq_vcpu *sv;
     int rc;
 
-    sv = xzalloc(struct hvm_ioreq_vcpu);
+    sv = xzalloc(struct ioreq_vcpu);
 
     rc = -ENOMEM;
     if ( !sv )
@@ -518,10 +518,10 @@ static int hvm_ioreq_server_add_vcpu(struct hvm_ioreq_server *s,
     return rc;
 }
 
-static void hvm_ioreq_server_remove_vcpu(struct hvm_ioreq_server *s,
+static void hvm_ioreq_server_remove_vcpu(struct ioreq_server *s,
                                          struct vcpu *v)
 {
-    struct hvm_ioreq_vcpu *sv;
+    struct ioreq_vcpu *sv;
 
     spin_lock(&s->lock);
 
@@ -546,9 +546,9 @@ static void hvm_ioreq_server_remove_vcpu(struct hvm_ioreq_server *s,
     spin_unlock(&s->lock);
 }
 
-static void hvm_ioreq_server_remove_all_vcpus(struct hvm_ioreq_server *s)
+static void hvm_ioreq_server_remove_all_vcpus(struct ioreq_server *s)
 {
-    struct hvm_ioreq_vcpu *sv, *next;
+    struct ioreq_vcpu *sv, *next;
 
     spin_lock(&s->lock);
 
@@ -572,7 +572,7 @@ static void hvm_ioreq_server_remove_all_vcpus(struct hvm_ioreq_server *s)
     spin_unlock(&s->lock);
 }
 
-static int hvm_ioreq_server_map_pages(struct hvm_ioreq_server *s)
+static int hvm_ioreq_server_map_pages(struct ioreq_server *s)
 {
     int rc;
 
@@ -587,13 +587,13 @@ static int hvm_ioreq_server_map_pages(struct hvm_ioreq_server *s)
     return rc;
 }
 
-static void hvm_ioreq_server_unmap_pages(struct hvm_ioreq_server *s)
+static void hvm_ioreq_server_unmap_pages(struct ioreq_server *s)
 {
     hvm_unmap_ioreq_gfn(s, true);
     hvm_unmap_ioreq_gfn(s, false);
 }
 
-static int hvm_ioreq_server_alloc_pages(struct hvm_ioreq_server *s)
+static int hvm_ioreq_server_alloc_pages(struct ioreq_server *s)
 {
     int rc;
 
@@ -608,13 +608,13 @@ static int hvm_ioreq_server_alloc_pages(struct hvm_ioreq_server *s)
     return rc;
 }
 
-static void hvm_ioreq_server_free_pages(struct hvm_ioreq_server *s)
+static void hvm_ioreq_server_free_pages(struct ioreq_server *s)
 {
     hvm_free_ioreq_mfn(s, true);
     hvm_free_ioreq_mfn(s, false);
 }
 
-static void hvm_ioreq_server_free_rangesets(struct hvm_ioreq_server *s)
+static void hvm_ioreq_server_free_rangesets(struct ioreq_server *s)
 {
     unsigned int i;
 
@@ -622,7 +622,7 @@ static void hvm_ioreq_server_free_rangesets(struct hvm_ioreq_server *s)
         rangeset_destroy(s->range[i]);
 }
 
-static int hvm_ioreq_server_alloc_rangesets(struct hvm_ioreq_server *s,
+static int hvm_ioreq_server_alloc_rangesets(struct ioreq_server *s,
                                             ioservid_t id)
 {
     unsigned int i;
@@ -660,9 +660,9 @@ static int hvm_ioreq_server_alloc_rangesets(struct hvm_ioreq_server *s,
     return rc;
 }
 
-static void hvm_ioreq_server_enable(struct hvm_ioreq_server *s)
+static void hvm_ioreq_server_enable(struct ioreq_server *s)
 {
-    struct hvm_ioreq_vcpu *sv;
+    struct ioreq_vcpu *sv;
 
     spin_lock(&s->lock);
 
@@ -683,7 +683,7 @@ static void hvm_ioreq_server_enable(struct hvm_ioreq_server *s)
     spin_unlock(&s->lock);
 }
 
-static void hvm_ioreq_server_disable(struct hvm_ioreq_server *s)
+static void hvm_ioreq_server_disable(struct ioreq_server *s)
 {
     spin_lock(&s->lock);
 
@@ -699,7 +699,7 @@ static void hvm_ioreq_server_disable(struct hvm_ioreq_server *s)
     spin_unlock(&s->lock);
 }
 
-static int hvm_ioreq_server_init(struct hvm_ioreq_server *s,
+static int hvm_ioreq_server_init(struct ioreq_server *s,
                                  struct domain *d, int bufioreq_handling,
                                  ioservid_t id)
 {
@@ -744,7 +744,7 @@ static int hvm_ioreq_server_init(struct hvm_ioreq_server *s,
     return rc;
 }
 
-static void hvm_ioreq_server_deinit(struct hvm_ioreq_server *s)
+static void hvm_ioreq_server_deinit(struct ioreq_server *s)
 {
     ASSERT(!s->enabled);
     hvm_ioreq_server_remove_all_vcpus(s);
@@ -769,14 +769,14 @@ static void hvm_ioreq_server_deinit(struct hvm_ioreq_server *s)
 int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
                             ioservid_t *id)
 {
-    struct hvm_ioreq_server *s;
+    struct ioreq_server *s;
     unsigned int i;
     int rc;
 
     if ( bufioreq_handling > HVM_IOREQSRV_BUFIOREQ_ATOMIC )
         return -EINVAL;
 
-    s = xzalloc(struct hvm_ioreq_server);
+    s = xzalloc(struct ioreq_server);
     if ( !s )
         return -ENOMEM;
 
@@ -824,7 +824,7 @@ int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
 
 int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
 {
-    struct hvm_ioreq_server *s;
+    struct ioreq_server *s;
     int rc;
 
     spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
@@ -869,7 +869,7 @@ int hvm_get_ioreq_server_info(struct domain *d, ioservid_t id,
                               unsigned long *bufioreq_gfn,
                               evtchn_port_t *bufioreq_port)
 {
-    struct hvm_ioreq_server *s;
+    struct ioreq_server *s;
     int rc;
 
     spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
@@ -914,7 +914,7 @@ int hvm_get_ioreq_server_info(struct domain *d, ioservid_t id,
 int hvm_get_ioreq_server_frame(struct domain *d, ioservid_t id,
                                unsigned long idx, mfn_t *mfn)
 {
-    struct hvm_ioreq_server *s;
+    struct ioreq_server *s;
     int rc;
 
     ASSERT(is_hvm_domain(d));
@@ -966,7 +966,7 @@ int hvm_map_io_range_to_ioreq_server(struct domain *d, ioservid_t id,
                                      uint32_t type, uint64_t start,
                                      uint64_t end)
 {
-    struct hvm_ioreq_server *s;
+    struct ioreq_server *s;
     struct rangeset *r;
     int rc;
 
@@ -1018,7 +1018,7 @@ int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
                                          uint32_t type, uint64_t start,
                                          uint64_t end)
 {
-    struct hvm_ioreq_server *s;
+    struct ioreq_server *s;
     struct rangeset *r;
     int rc;
 
@@ -1069,7 +1069,7 @@ int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
 int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
                                bool enabled)
 {
-    struct hvm_ioreq_server *s;
+    struct ioreq_server *s;
     int rc;
 
     spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
@@ -1102,7 +1102,7 @@ int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
 
 int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v)
 {
-    struct hvm_ioreq_server *s;
+    struct ioreq_server *s;
     unsigned int id;
     int rc;
 
@@ -1137,7 +1137,7 @@ int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v)
 
 void hvm_all_ioreq_servers_remove_vcpu(struct domain *d, struct vcpu *v)
 {
-    struct hvm_ioreq_server *s;
+    struct ioreq_server *s;
     unsigned int id;
 
     spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
@@ -1150,7 +1150,7 @@ void hvm_all_ioreq_servers_remove_vcpu(struct domain *d, struct vcpu *v)
 
 void hvm_destroy_all_ioreq_servers(struct domain *d)
 {
-    struct hvm_ioreq_server *s;
+    struct ioreq_server *s;
     unsigned int id;
 
     if ( !arch_hvm_ioreq_destroy(d) )
@@ -1177,10 +1177,10 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
     spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
 }
 
-struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
-                                                 ioreq_t *p)
+struct ioreq_server *hvm_select_ioreq_server(struct domain *d,
+                                             ioreq_t *p)
 {
-    struct hvm_ioreq_server *s;
+    struct ioreq_server *s;
     uint8_t type;
     uint64_t addr;
     unsigned int id;
@@ -1233,10 +1233,10 @@ struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
     return NULL;
 }
 
-static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
+static int hvm_send_buffered_ioreq(struct ioreq_server *s, ioreq_t *p)
 {
     struct domain *d = current->domain;
-    struct hvm_ioreq_page *iorp;
+    struct ioreq_page *iorp;
     buffered_iopage_t *pg;
     buf_ioreq_t bp = { .data = p->data,
                        .addr = p->addr,
@@ -1326,12 +1326,12 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
     return IOREQ_STATUS_HANDLED;
 }
 
-int hvm_send_ioreq(struct hvm_ioreq_server *s, ioreq_t *proto_p,
+int hvm_send_ioreq(struct ioreq_server *s, ioreq_t *proto_p,
                    bool buffered)
 {
     struct vcpu *curr = current;
     struct domain *d = curr->domain;
-    struct hvm_ioreq_vcpu *sv;
+    struct ioreq_vcpu *sv;
 
     ASSERT(s);
 
@@ -1389,7 +1389,7 @@ int hvm_send_ioreq(struct hvm_ioreq_server *s, ioreq_t *proto_p,
 unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered)
 {
     struct domain *d = current->domain;
-    struct hvm_ioreq_server *s;
+    struct ioreq_server *s;
     unsigned int id, failed = 0;
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
diff --git a/xen/include/asm-x86/hvm/domain.h b/xen/include/asm-x86/hvm/domain.h
index 9d247ba..3b36c2f 100644
--- a/xen/include/asm-x86/hvm/domain.h
+++ b/xen/include/asm-x86/hvm/domain.h
@@ -30,40 +30,6 @@
 
 #include <public/hvm/dm_op.h>
 
-struct hvm_ioreq_page {
-    gfn_t gfn;
-    struct page_info *page;
-    void *va;
-};
-
-struct hvm_ioreq_vcpu {
-    struct list_head list_entry;
-    struct vcpu      *vcpu;
-    evtchn_port_t    ioreq_evtchn;
-    bool             pending;
-};
-
-#define NR_IO_RANGE_TYPES (XEN_DMOP_IO_RANGE_PCI + 1)
-#define MAX_NR_IO_RANGES  256
-
-struct hvm_ioreq_server {
-    struct domain          *target, *emulator;
-
-    /* Lock to serialize toolstack modifications */
-    spinlock_t             lock;
-
-    struct hvm_ioreq_page  ioreq;
-    struct list_head       ioreq_vcpu_list;
-    struct hvm_ioreq_page  bufioreq;
-
-    /* Lock to serialize access to buffered ioreq ring */
-    spinlock_t             bufioreq_lock;
-    evtchn_port_t          bufioreq_evtchn;
-    struct rangeset        *range[NR_IO_RANGE_TYPES];
-    bool                   enabled;
-    uint8_t                bufioreq_handling;
-};
-
 #ifdef CONFIG_MEM_SHARING
 struct mem_sharing_domain
 {
@@ -110,7 +76,7 @@ struct hvm_domain {
     /* Lock protects all other values in the sub-struct and the default */
     struct {
         spinlock_t              lock;
-        struct hvm_ioreq_server *server[MAX_NR_IOREQ_SERVERS];
+        struct ioreq_server     *server[MAX_NR_IOREQ_SERVERS];
     } ioreq_server;
 
     /* Cached CF8 for guest PCI config cycles */
diff --git a/xen/include/asm-x86/hvm/ioreq.h b/xen/include/asm-x86/hvm/ioreq.h
index a147856..d2d64a8 100644
--- a/xen/include/asm-x86/hvm/ioreq.h
+++ b/xen/include/asm-x86/hvm/ioreq.h
@@ -50,7 +50,7 @@ static inline bool arch_hvm_io_completion(enum hvm_io_completion io_completion)
 }
 
 /* Called when target domain is paused */
-static inline void arch_hvm_destroy_ioreq_server(struct hvm_ioreq_server *s)
+static inline void arch_hvm_destroy_ioreq_server(struct ioreq_server *s)
 {
     p2m_set_ioreq_server(s->target, 0, s);
 }
@@ -68,7 +68,7 @@ static inline int hvm_map_mem_type_to_ioreq_server(struct domain *d,
                                                    uint32_t type,
                                                    uint32_t flags)
 {
-    struct hvm_ioreq_server *s;
+    struct ioreq_server *s;
     int rc;
 
     if ( type != HVMMEM_ioreq_server )
diff --git a/xen/include/asm-x86/p2m.h b/xen/include/asm-x86/p2m.h
index 8abae34..5f7ba31 100644
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -350,7 +350,7 @@ struct p2m_domain {
           * ioreq server who's responsible for the emulation of
           * gfns with specific p2m type(for now, p2m_ioreq_server).
           */
-         struct hvm_ioreq_server *server;
+         struct ioreq_server *server;
          /*
           * flags specifies whether read, write or both operations
           * are to be emulated by an ioreq server.
@@ -933,9 +933,9 @@ static inline unsigned int p2m_get_iommu_flags(p2m_type_t p2mt, mfn_t mfn)
 }
 
 int p2m_set_ioreq_server(struct domain *d, unsigned int flags,
-                         struct hvm_ioreq_server *s);
-struct hvm_ioreq_server *p2m_get_ioreq_server(struct domain *d,
-                                              unsigned int *flags);
+                         struct ioreq_server *s);
+struct ioreq_server *p2m_get_ioreq_server(struct domain *d,
+                                          unsigned int *flags);
 
 static inline int p2m_entry_modify(struct p2m_domain *p2m, p2m_type_t nt,
                                    p2m_type_t ot, mfn_t nfn, mfn_t ofn,
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index 768ac94..8451866 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -21,8 +21,42 @@
 
 #include <xen/sched.h>
 
-struct hvm_ioreq_server *get_ioreq_server(const struct domain *d,
-                                          unsigned int id);
+struct ioreq_page {
+    gfn_t gfn;
+    struct page_info *page;
+    void *va;
+};
+
+struct ioreq_vcpu {
+    struct list_head list_entry;
+    struct vcpu      *vcpu;
+    evtchn_port_t    ioreq_evtchn;
+    bool             pending;
+};
+
+#define NR_IO_RANGE_TYPES (XEN_DMOP_IO_RANGE_PCI + 1)
+#define MAX_NR_IO_RANGES  256
+
+struct ioreq_server {
+    struct domain          *target, *emulator;
+
+    /* Lock to serialize toolstack modifications */
+    spinlock_t             lock;
+
+    struct ioreq_page      ioreq;
+    struct list_head       ioreq_vcpu_list;
+    struct ioreq_page      bufioreq;
+
+    /* Lock to serialize access to buffered ioreq ring */
+    spinlock_t             bufioreq_lock;
+    evtchn_port_t          bufioreq_evtchn;
+    struct rangeset        *range[NR_IO_RANGE_TYPES];
+    bool                   enabled;
+    uint8_t                bufioreq_handling;
+};
+
+struct ioreq_server *get_ioreq_server(const struct domain *d,
+                                      unsigned int id);
 
 static inline paddr_t ioreq_mmio_first_byte(const ioreq_t *p)
 {
@@ -73,9 +107,9 @@ int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v);
 void hvm_all_ioreq_servers_remove_vcpu(struct domain *d, struct vcpu *v);
 void hvm_destroy_all_ioreq_servers(struct domain *d);
 
-struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
-                                                 ioreq_t *p);
-int hvm_send_ioreq(struct hvm_ioreq_server *s, ioreq_t *proto_p,
+struct ioreq_server *hvm_select_ioreq_server(struct domain *d,
+                                             ioreq_t *p);
+int hvm_send_ioreq(struct ioreq_server *s, ioreq_t *proto_p,
                    bool buffered);
 unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered);
 
-- 
2.7.4


