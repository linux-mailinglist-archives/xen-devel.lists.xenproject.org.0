Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A83ED2F3BF0
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 22:53:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66046.117200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRbY-0002wH-Gw; Tue, 12 Jan 2021 21:53:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66046.117200; Tue, 12 Jan 2021 21:53:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRbY-0002vW-C4; Tue, 12 Jan 2021 21:53:32 +0000
Received: by outflank-mailman (input) for mailman id 66046;
 Tue, 12 Jan 2021 21:53:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OoN1=GP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kzRbW-0002PK-HF
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 21:53:30 +0000
Received: from mail-wm1-x333.google.com (unknown [2a00:1450:4864:20::333])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6c37162-e18c-4853-9566-f49358826ad3;
 Tue, 12 Jan 2021 21:53:01 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id g8so3232415wme.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 13:53:01 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 138sm6574053wma.41.2021.01.12.13.52.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Jan 2021 13:52:59 -0800 (PST)
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
X-Inumbo-ID: a6c37162-e18c-4853-9566-f49358826ad3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Nv/8iJSp1q8sRY5B7cchG5UGicc6rqIROQrT0DQ8mUA=;
        b=eKrYEf+5C4xWpKwhKMKSC2cbrIa2A4izfMh0U+2KX3mfBuPlAD0RKkj2pOqvDRtlrK
         ioq3cC3sd8nSaGkviJEUexV0w9U9qfsOWoIwQ24uCYhXmI4PCQLvrA52uzopWIWMhgdq
         OWCIPJ2pccOMm8CtZXsjrzwr4nm/Wzvj1Zxe98pOUjHsvaLHBAD5ctlsyVNqkJT4ieIB
         z0U32LonBpMBPtG54KtP11DJTWJBGviD3EHi24CBGOd7LUpVS8LNV5XQEKlgZfxJJgz4
         CK1uz0BE2iUJSwTLG1InoAeR0HGFJUlxA9+IaGOWVq713kN/zyen27kcGXwNaRWROCZ1
         CFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Nv/8iJSp1q8sRY5B7cchG5UGicc6rqIROQrT0DQ8mUA=;
        b=YgJbSYHSehagQTKG0VQm3LDqDwlgqajAfxpGEb+rTiGl1qYwRZAnT3IUC9LkjhcNBF
         pDM06WG2ptfcqxf8DVc+pdtueKTONgZhU2aoP7WvXGI3jyVyGbpYJ1pC2ePLii5LJEfc
         AK5sTUtb63z5JrklAB+RqXCVG9WcYtkN5ZA10Kg6/RQRKhJPULsGz88SrXF9z1GUcEWq
         LduJyEBaOUgds0AzQYje01jIeIrIfMl4MSWgs2O2D7AQOAbz+rvdvtUyhtWKXWSVAfbJ
         CmR4u/iUg+lSBBr3TmC9SPaUsH3jBC5g4SUeFFn82E6Iu5QzU09KhdCqIVXYTNRGM5mT
         oYLQ==
X-Gm-Message-State: AOAM5326yf87bWhDZfg7WVWVv6Zrr4zyTKKN1Us/EZv730dtrRjmnXOs
	LM3o/rWY+qFIFXqwuQOQPaUJsRTEDWWwWg==
X-Google-Smtp-Source: ABdhPJxIvbLLpF+dsmswCKSVLjr3PvGenln1zOeS0cRtUlcOrbsIIP4untz8w0HJrENg38g4vF63rw==
X-Received: by 2002:a1c:e4c5:: with SMTP id b188mr1175711wmh.78.1610488379784;
        Tue, 12 Jan 2021 13:52:59 -0800 (PST)
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
Subject: [PATCH V4 07/24] xen/ioreq: Make x86's hvm_ioreq_(page/vcpu/server) structs common
Date: Tue, 12 Jan 2021 23:52:15 +0200
Message-Id: <1610488352-18494-8-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The IOREQ is a common feature now and these structs will be used
on Arm as is. Move them to xen/ioreq.h and remove "hvm" prefixes.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien.grall@arm.com>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - new patch

Changes V1 -> V2:
   - remove "hvm" prefix

Changes V2 -> V3:
   - update patch according the "legacy interface" is x86 specific

Changes V3 -> V4:
   - add Jan's A-b
---
 xen/arch/x86/hvm/emulate.c       |   2 +-
 xen/arch/x86/hvm/ioreq.c         |  38 +++++++-------
 xen/arch/x86/hvm/stdvga.c        |   2 +-
 xen/arch/x86/mm/p2m.c            |   8 +--
 xen/common/ioreq.c               | 108 +++++++++++++++++++--------------------
 xen/include/asm-x86/hvm/domain.h |  36 +------------
 xen/include/asm-x86/p2m.h        |   8 +--
 xen/include/xen/ioreq.h          |  54 ++++++++++++++++----
 8 files changed, 128 insertions(+), 128 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index c3487b5..4d62199 100644
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
diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 177b964..8393922 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -63,7 +63,7 @@ bool arch_vcpu_ioreq_completion(enum hvm_io_completion io_completion)
     return true;
 }
 
-static gfn_t hvm_alloc_legacy_ioreq_gfn(struct hvm_ioreq_server *s)
+static gfn_t hvm_alloc_legacy_ioreq_gfn(struct ioreq_server *s)
 {
     struct domain *d = s->target;
     unsigned int i;
@@ -79,7 +79,7 @@ static gfn_t hvm_alloc_legacy_ioreq_gfn(struct hvm_ioreq_server *s)
     return INVALID_GFN;
 }
 
-static gfn_t hvm_alloc_ioreq_gfn(struct hvm_ioreq_server *s)
+static gfn_t hvm_alloc_ioreq_gfn(struct ioreq_server *s)
 {
     struct domain *d = s->target;
     unsigned int i;
@@ -97,7 +97,7 @@ static gfn_t hvm_alloc_ioreq_gfn(struct hvm_ioreq_server *s)
     return hvm_alloc_legacy_ioreq_gfn(s);
 }
 
-static bool hvm_free_legacy_ioreq_gfn(struct hvm_ioreq_server *s,
+static bool hvm_free_legacy_ioreq_gfn(struct ioreq_server *s,
                                       gfn_t gfn)
 {
     struct domain *d = s->target;
@@ -115,7 +115,7 @@ static bool hvm_free_legacy_ioreq_gfn(struct hvm_ioreq_server *s,
     return true;
 }
 
-static void hvm_free_ioreq_gfn(struct hvm_ioreq_server *s, gfn_t gfn)
+static void hvm_free_ioreq_gfn(struct ioreq_server *s, gfn_t gfn)
 {
     struct domain *d = s->target;
     unsigned int i = gfn_x(gfn) - d->arch.hvm.ioreq_gfn.base;
@@ -129,9 +129,9 @@ static void hvm_free_ioreq_gfn(struct hvm_ioreq_server *s, gfn_t gfn)
     }
 }
 
-static void hvm_unmap_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
+static void hvm_unmap_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
-    struct hvm_ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
 
     if ( gfn_eq(iorp->gfn, INVALID_GFN) )
         return;
@@ -143,10 +143,10 @@ static void hvm_unmap_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
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
@@ -179,11 +179,11 @@ static int hvm_map_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
     return rc;
 }
 
-static void hvm_remove_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
+static void hvm_remove_ioreq_gfn(struct ioreq_server *s, bool buf)
 
 {
     struct domain *d = s->target;
-    struct hvm_ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
 
     if ( gfn_eq(iorp->gfn, INVALID_GFN) )
         return;
@@ -194,10 +194,10 @@ static void hvm_remove_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
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
@@ -213,7 +213,7 @@ static int hvm_add_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
     return rc;
 }
 
-int arch_ioreq_server_map_pages(struct hvm_ioreq_server *s)
+int arch_ioreq_server_map_pages(struct ioreq_server *s)
 {
     int rc;
 
@@ -228,40 +228,40 @@ int arch_ioreq_server_map_pages(struct hvm_ioreq_server *s)
     return rc;
 }
 
-void arch_ioreq_server_unmap_pages(struct hvm_ioreq_server *s)
+void arch_ioreq_server_unmap_pages(struct ioreq_server *s)
 {
     hvm_unmap_ioreq_gfn(s, true);
     hvm_unmap_ioreq_gfn(s, false);
 }
 
-void arch_ioreq_server_enable(struct hvm_ioreq_server *s)
+void arch_ioreq_server_enable(struct ioreq_server *s)
 {
     hvm_remove_ioreq_gfn(s, false);
     hvm_remove_ioreq_gfn(s, true);
 }
 
-void arch_ioreq_server_disable(struct hvm_ioreq_server *s)
+void arch_ioreq_server_disable(struct ioreq_server *s)
 {
     hvm_add_ioreq_gfn(s, true);
     hvm_add_ioreq_gfn(s, false);
 }
 
 /* Called when target domain is paused */
-void arch_ioreq_server_destroy(struct hvm_ioreq_server *s)
+void arch_ioreq_server_destroy(struct ioreq_server *s)
 {
     p2m_set_ioreq_server(s->target, 0, s);
 }
 
 /* Called with ioreq_server lock held */
 int arch_ioreq_server_map_mem_type(struct domain *d,
-                                   struct hvm_ioreq_server *s,
+                                   struct ioreq_server *s,
                                    uint32_t flags)
 {
     return p2m_set_ioreq_server(d, flags, s);
 }
 
 void arch_ioreq_server_map_mem_type_completed(struct domain *d,
-                                              struct hvm_ioreq_server *s,
+                                              struct ioreq_server *s,
                                               uint32_t flags)
 {
     if ( flags == 0 )
diff --git a/xen/arch/x86/hvm/stdvga.c b/xen/arch/x86/hvm/stdvga.c
index 17dee74..ee13449 100644
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
index ad4bb94..71fda06 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -372,7 +372,7 @@ void p2m_memory_type_changed(struct domain *d)
 
 int p2m_set_ioreq_server(struct domain *d,
                          unsigned int flags,
-                         struct hvm_ioreq_server *s)
+                         struct ioreq_server *s)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     int rc;
@@ -420,11 +420,11 @@ int p2m_set_ioreq_server(struct domain *d,
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
index a196e14..3f631ec 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -35,7 +35,7 @@
 #include <public/hvm/params.h>
 
 static void set_ioreq_server(struct domain *d, unsigned int id,
-                             struct hvm_ioreq_server *s)
+                             struct ioreq_server *s)
 {
     ASSERT(id < MAX_NR_IOREQ_SERVERS);
     ASSERT(!s || !d->arch.hvm.ioreq_server.server[id]);
@@ -46,8 +46,8 @@ static void set_ioreq_server(struct domain *d, unsigned int id,
 #define GET_IOREQ_SERVER(d, id) \
     (d)->arch.hvm.ioreq_server.server[id]
 
-static struct hvm_ioreq_server *get_ioreq_server(const struct domain *d,
-                                                 unsigned int id)
+static struct ioreq_server *get_ioreq_server(const struct domain *d,
+                                             unsigned int id)
 {
     if ( id >= MAX_NR_IOREQ_SERVERS )
         return NULL;
@@ -69,7 +69,7 @@ static struct hvm_ioreq_server *get_ioreq_server(const struct domain *d,
             continue; \
         else
 
-static ioreq_t *get_ioreq(struct hvm_ioreq_server *s, struct vcpu *v)
+static ioreq_t *get_ioreq(struct ioreq_server *s, struct vcpu *v)
 {
     shared_iopage_t *p = s->ioreq.va;
 
@@ -79,16 +79,16 @@ static ioreq_t *get_ioreq(struct hvm_ioreq_server *s, struct vcpu *v)
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
@@ -111,7 +111,7 @@ bool hvm_io_pending(struct vcpu *v)
     return get_pending_vcpu(v, NULL);
 }
 
-static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t *p)
+static bool hvm_wait_for_io(struct ioreq_vcpu *sv, ioreq_t *p)
 {
     unsigned int prev_state = STATE_IOREQ_NONE;
     unsigned int state = p->state;
@@ -172,8 +172,8 @@ bool handle_hvm_io_completion(struct vcpu *v)
 {
     struct domain *d = v->domain;
     struct hvm_vcpu_io *vio = &v->arch.hvm.hvm_io;
-    struct hvm_ioreq_server *s;
-    struct hvm_ioreq_vcpu *sv;
+    struct ioreq_server *s;
+    struct ioreq_vcpu *sv;
     enum hvm_io_completion io_completion;
 
     if ( has_vpci(d) && vpci_process_pending(v) )
@@ -214,9 +214,9 @@ bool handle_hvm_io_completion(struct vcpu *v)
     return true;
 }
 
-static int hvm_alloc_ioreq_mfn(struct hvm_ioreq_server *s, bool buf)
+static int hvm_alloc_ioreq_mfn(struct ioreq_server *s, bool buf)
 {
-    struct hvm_ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
     struct page_info *page;
 
     if ( iorp->page )
@@ -262,9 +262,9 @@ static int hvm_alloc_ioreq_mfn(struct hvm_ioreq_server *s, bool buf)
     return -ENOMEM;
 }
 
-static void hvm_free_ioreq_mfn(struct hvm_ioreq_server *s, bool buf)
+static void hvm_free_ioreq_mfn(struct ioreq_server *s, bool buf)
 {
-    struct hvm_ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
     struct page_info *page = iorp->page;
 
     if ( !page )
@@ -281,7 +281,7 @@ static void hvm_free_ioreq_mfn(struct hvm_ioreq_server *s, bool buf)
 
 bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
 {
-    const struct hvm_ioreq_server *s;
+    const struct ioreq_server *s;
     unsigned int id;
     bool found = false;
 
@@ -301,8 +301,8 @@ bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
     return found;
 }
 
-static void hvm_update_ioreq_evtchn(struct hvm_ioreq_server *s,
-                                    struct hvm_ioreq_vcpu *sv)
+static void hvm_update_ioreq_evtchn(struct ioreq_server *s,
+                                    struct ioreq_vcpu *sv)
 {
     ASSERT(spin_is_locked(&s->lock));
 
@@ -314,13 +314,13 @@ static void hvm_update_ioreq_evtchn(struct hvm_ioreq_server *s,
     }
 }
 
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
@@ -366,10 +366,10 @@ static int hvm_ioreq_server_add_vcpu(struct hvm_ioreq_server *s,
     return rc;
 }
 
-static void hvm_ioreq_server_remove_vcpu(struct hvm_ioreq_server *s,
+static void hvm_ioreq_server_remove_vcpu(struct ioreq_server *s,
                                          struct vcpu *v)
 {
-    struct hvm_ioreq_vcpu *sv;
+    struct ioreq_vcpu *sv;
 
     spin_lock(&s->lock);
 
@@ -394,9 +394,9 @@ static void hvm_ioreq_server_remove_vcpu(struct hvm_ioreq_server *s,
     spin_unlock(&s->lock);
 }
 
-static void hvm_ioreq_server_remove_all_vcpus(struct hvm_ioreq_server *s)
+static void hvm_ioreq_server_remove_all_vcpus(struct ioreq_server *s)
 {
-    struct hvm_ioreq_vcpu *sv, *next;
+    struct ioreq_vcpu *sv, *next;
 
     spin_lock(&s->lock);
 
@@ -420,7 +420,7 @@ static void hvm_ioreq_server_remove_all_vcpus(struct hvm_ioreq_server *s)
     spin_unlock(&s->lock);
 }
 
-static int hvm_ioreq_server_alloc_pages(struct hvm_ioreq_server *s)
+static int hvm_ioreq_server_alloc_pages(struct ioreq_server *s)
 {
     int rc;
 
@@ -435,13 +435,13 @@ static int hvm_ioreq_server_alloc_pages(struct hvm_ioreq_server *s)
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
 
@@ -449,7 +449,7 @@ static void hvm_ioreq_server_free_rangesets(struct hvm_ioreq_server *s)
         rangeset_destroy(s->range[i]);
 }
 
-static int hvm_ioreq_server_alloc_rangesets(struct hvm_ioreq_server *s,
+static int hvm_ioreq_server_alloc_rangesets(struct ioreq_server *s,
                                             ioservid_t id)
 {
     unsigned int i;
@@ -487,9 +487,9 @@ static int hvm_ioreq_server_alloc_rangesets(struct hvm_ioreq_server *s,
     return rc;
 }
 
-static void hvm_ioreq_server_enable(struct hvm_ioreq_server *s)
+static void hvm_ioreq_server_enable(struct ioreq_server *s)
 {
-    struct hvm_ioreq_vcpu *sv;
+    struct ioreq_vcpu *sv;
 
     spin_lock(&s->lock);
 
@@ -509,7 +509,7 @@ static void hvm_ioreq_server_enable(struct hvm_ioreq_server *s)
     spin_unlock(&s->lock);
 }
 
-static void hvm_ioreq_server_disable(struct hvm_ioreq_server *s)
+static void hvm_ioreq_server_disable(struct ioreq_server *s)
 {
     spin_lock(&s->lock);
 
@@ -524,7 +524,7 @@ static void hvm_ioreq_server_disable(struct hvm_ioreq_server *s)
     spin_unlock(&s->lock);
 }
 
-static int hvm_ioreq_server_init(struct hvm_ioreq_server *s,
+static int hvm_ioreq_server_init(struct ioreq_server *s,
                                  struct domain *d, int bufioreq_handling,
                                  ioservid_t id)
 {
@@ -569,7 +569,7 @@ static int hvm_ioreq_server_init(struct hvm_ioreq_server *s,
     return rc;
 }
 
-static void hvm_ioreq_server_deinit(struct hvm_ioreq_server *s)
+static void hvm_ioreq_server_deinit(struct ioreq_server *s)
 {
     ASSERT(!s->enabled);
     hvm_ioreq_server_remove_all_vcpus(s);
@@ -594,14 +594,14 @@ static void hvm_ioreq_server_deinit(struct hvm_ioreq_server *s)
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
 
@@ -649,7 +649,7 @@ int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
 
 int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
 {
-    struct hvm_ioreq_server *s;
+    struct ioreq_server *s;
     int rc;
 
     spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
@@ -694,7 +694,7 @@ int hvm_get_ioreq_server_info(struct domain *d, ioservid_t id,
                               unsigned long *bufioreq_gfn,
                               evtchn_port_t *bufioreq_port)
 {
-    struct hvm_ioreq_server *s;
+    struct ioreq_server *s;
     int rc;
 
     spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
@@ -739,7 +739,7 @@ int hvm_get_ioreq_server_info(struct domain *d, ioservid_t id,
 int hvm_get_ioreq_server_frame(struct domain *d, ioservid_t id,
                                unsigned long idx, mfn_t *mfn)
 {
-    struct hvm_ioreq_server *s;
+    struct ioreq_server *s;
     int rc;
 
     ASSERT(is_hvm_domain(d));
@@ -791,7 +791,7 @@ int hvm_map_io_range_to_ioreq_server(struct domain *d, ioservid_t id,
                                      uint32_t type, uint64_t start,
                                      uint64_t end)
 {
-    struct hvm_ioreq_server *s;
+    struct ioreq_server *s;
     struct rangeset *r;
     int rc;
 
@@ -843,7 +843,7 @@ int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
                                          uint32_t type, uint64_t start,
                                          uint64_t end)
 {
-    struct hvm_ioreq_server *s;
+    struct ioreq_server *s;
     struct rangeset *r;
     int rc;
 
@@ -902,7 +902,7 @@ int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
 int hvm_map_mem_type_to_ioreq_server(struct domain *d, ioservid_t id,
                                      uint32_t type, uint32_t flags)
 {
-    struct hvm_ioreq_server *s;
+    struct ioreq_server *s;
     int rc;
 
     if ( type != HVMMEM_ioreq_server )
@@ -937,7 +937,7 @@ int hvm_map_mem_type_to_ioreq_server(struct domain *d, ioservid_t id,
 int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
                                bool enabled)
 {
-    struct hvm_ioreq_server *s;
+    struct ioreq_server *s;
     int rc;
 
     spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
@@ -970,7 +970,7 @@ int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
 
 int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v)
 {
-    struct hvm_ioreq_server *s;
+    struct ioreq_server *s;
     unsigned int id;
     int rc;
 
@@ -1005,7 +1005,7 @@ int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v)
 
 void hvm_all_ioreq_servers_remove_vcpu(struct domain *d, struct vcpu *v)
 {
-    struct hvm_ioreq_server *s;
+    struct ioreq_server *s;
     unsigned int id;
 
     spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
@@ -1018,7 +1018,7 @@ void hvm_all_ioreq_servers_remove_vcpu(struct domain *d, struct vcpu *v)
 
 void hvm_destroy_all_ioreq_servers(struct domain *d)
 {
-    struct hvm_ioreq_server *s;
+    struct ioreq_server *s;
     unsigned int id;
 
     if ( !arch_ioreq_server_destroy_all(d) )
@@ -1045,10 +1045,10 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
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
@@ -1101,10 +1101,10 @@ struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
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
@@ -1194,12 +1194,12 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
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
 
@@ -1257,7 +1257,7 @@ int hvm_send_ioreq(struct hvm_ioreq_server *s, ioreq_t *proto_p,
 unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered)
 {
     struct domain *d = current->domain;
-    struct hvm_ioreq_server *s;
+    struct ioreq_server *s;
     unsigned int id, failed = 0;
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
diff --git a/xen/include/asm-x86/hvm/domain.h b/xen/include/asm-x86/hvm/domain.h
index 9d247ba..1c4ca47 100644
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
+        struct ioreq_server *server[MAX_NR_IOREQ_SERVERS];
     } ioreq_server;
 
     /* Cached CF8 for guest PCI config cycles */
diff --git a/xen/include/asm-x86/p2m.h b/xen/include/asm-x86/p2m.h
index 6447696..7df2878 100644
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -363,7 +363,7 @@ struct p2m_domain {
           * ioreq server who's responsible for the emulation of
           * gfns with specific p2m type(for now, p2m_ioreq_server).
           */
-         struct hvm_ioreq_server *server;
+         struct ioreq_server *server;
          /*
           * flags specifies whether read, write or both operations
           * are to be emulated by an ioreq server.
@@ -937,9 +937,9 @@ static inline unsigned int p2m_get_iommu_flags(p2m_type_t p2mt, mfn_t mfn)
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
index aeea67e..bc79c37 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -21,6 +21,40 @@
 
 #include <xen/sched.h>
 
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
 static inline paddr_t ioreq_mmio_first_byte(const ioreq_t *p)
 {
     return unlikely(p->df) ?
@@ -75,9 +109,9 @@ int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v);
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
 
@@ -85,16 +119,16 @@ void hvm_ioreq_init(struct domain *d);
 
 bool arch_ioreq_complete_mmio(void);
 bool arch_vcpu_ioreq_completion(enum hvm_io_completion io_completion);
-int arch_ioreq_server_map_pages(struct hvm_ioreq_server *s);
-void arch_ioreq_server_unmap_pages(struct hvm_ioreq_server *s);
-void arch_ioreq_server_enable(struct hvm_ioreq_server *s);
-void arch_ioreq_server_disable(struct hvm_ioreq_server *s);
-void arch_ioreq_server_destroy(struct hvm_ioreq_server *s);
+int arch_ioreq_server_map_pages(struct ioreq_server *s);
+void arch_ioreq_server_unmap_pages(struct ioreq_server *s);
+void arch_ioreq_server_enable(struct ioreq_server *s);
+void arch_ioreq_server_disable(struct ioreq_server *s);
+void arch_ioreq_server_destroy(struct ioreq_server *s);
 int arch_ioreq_server_map_mem_type(struct domain *d,
-                                   struct hvm_ioreq_server *s,
+                                   struct ioreq_server *s,
                                    uint32_t flags);
 void arch_ioreq_server_map_mem_type_completed(struct domain *d,
-                                              struct hvm_ioreq_server *s,
+                                              struct ioreq_server *s,
                                               uint32_t flags);
 bool arch_ioreq_server_destroy_all(struct domain *d);
 bool arch_ioreq_server_get_type_addr(const struct domain *d,
-- 
2.7.4


