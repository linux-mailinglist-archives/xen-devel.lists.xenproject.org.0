Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BDE2C823C
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:32:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40816.73816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgTw-0000xe-Pm; Mon, 30 Nov 2020 10:32:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40816.73816; Mon, 30 Nov 2020 10:32:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgTw-0000wq-JU; Mon, 30 Nov 2020 10:32:32 +0000
Received: by outflank-mailman (input) for mailman id 40816;
 Mon, 30 Nov 2020 10:32:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avKr=FE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kjgTu-0000Uu-Ci
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 10:32:30 +0000
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 120459cb-e07a-46e5-93cd-44136438b689;
 Mon, 30 Nov 2020 10:32:04 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id j205so20582119lfj.6
 for <xen-devel@lists.xenproject.org>; Mon, 30 Nov 2020 02:32:04 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 136sm2399393lfb.62.2020.11.30.02.32.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 02:32:01 -0800 (PST)
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
X-Inumbo-ID: 120459cb-e07a-46e5-93cd-44136438b689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aGQpvDbV6S2U1yz85teIC5aptKqTALR4gBxIs/mCIMY=;
        b=t2IZrF/i6aU21frm5KbsJgen8U407C3uQELtOD+6wxFSKI139uW/U8SpjTZ5EvGv01
         /BUhijalta439xShmd0Wr2b+9IYfLLVLwWFlQ6CQhaNJckZZAW8PBRc8XrMkmGagHkaL
         nMXgBEeL/ZQdaK0/Wf2VVnuO1zIiAKEU9/Eg7dIPoiqz8oHAYa04QA77zvxBahwwMuSo
         Ht1GSCzNTSspG+5zdU3nXWngU7RuxuJFSlPTXNHw8G4D+3jh9RGlNxynt2BQpmylnNru
         QZhT9h6enCuszWu7ms15Qz7vc4tJl/HaIJIN3FjPADqeQ/1CUgeIc2x672pvOsaG3ZkH
         6+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aGQpvDbV6S2U1yz85teIC5aptKqTALR4gBxIs/mCIMY=;
        b=EsrrE2DQty0hNj3HrslG2lpziImHx5jMLFQBOD8YURhogmIOGx/qmtocNcdrMzx9Ep
         5ymwZmeZhgViE7NKXUiIqHL2lUaFCiVhxoIER+pREV67lTt0tSmo1yWJ85/NIanOf+gm
         OApsJ2FeNTulqJG2QuRyoX1ItO1sjObi59sPYNMdrW+aVsxfxrFxytzVgNtwxiVBG3zB
         XuacEzVKugzAzy/SkZA9PpKBejPn6Uf1I1dXXscyztUOG+emm3vZMSb/mov7djZZe5vP
         FJ4KRyMdRbO/jflczMZgEsr74dpfCJ/Sz27uq+NVB3z//hzPiTUgqXez0DrA9uQx5Jl3
         ExtA==
X-Gm-Message-State: AOAM532098CZ+0IC19iwqdrmogjcj/ZCFCQZWwtuChFG4Y5iRca8LYQH
	JoI2LhLPTt9wILJYtKE9zSfJe6Y1rmGFlA==
X-Google-Smtp-Source: ABdhPJxcZ6QbqV454audB9S8a62c7d1bGO1rQuYoFSmSMHuXQZT/Hy8LOLGIhyPFn1hqTXlQV0zDAw==
X-Received: by 2002:a19:857:: with SMTP id 84mr9546062lfi.235.1606732321729;
        Mon, 30 Nov 2020 02:32:01 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Tim Deegan <tim@xen.org>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V3 04/23] xen/ioreq: Make x86's IOREQ feature common
Date: Mon, 30 Nov 2020 12:31:19 +0200
Message-Id: <1606732298-22107-5-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

As a lot of x86 code can be re-used on Arm later on, this patch
moves previously prepared IOREQ support to the common code
(the code movement is verbatim copy).

The "legacy" mechanism of mapping magic pages for the IOREQ servers
remains x86 specific and not exposed to the common code.

The common IOREQ feature is supposed to be built with IOREQ_SERVER
option enabled, which is selected for x86's config HVM for now.

In order to avoid having a gigantic patch here, the subsequent
patches will update remaining bits in the common code step by step:
- Make IOREQ related structs/materials common
- Drop the "hvm" prefixes and infixes
- Remove layering violation by moving corresponding fields
  out of *arch.hvm* or abstracting away accesses to them

Also include <xen/domain_page.h> which will be needed on Arm
to avoid touch the common code again when introducing Arm specific bits.

This support is going to be used on Arm to be able run device
emulator outside of Xen hypervisor.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

***
Please note, this patch depends on the following which is
on review:
https://patchwork.kernel.org/patch/11816689/
***

Changes RFC -> V1:
   - was split into three patches:
     - x86/ioreq: Prepare IOREQ feature for making it common
     - xen/ioreq: Make x86's IOREQ feature common
     - xen/ioreq: Make x86's hvm_ioreq_needs_completion() common
   - update MAINTAINERS file
   - do not use a separate subdir for the IOREQ stuff, move it to:
     - xen/common/ioreq.c
     - xen/include/xen/ioreq.h
   - update x86's files to include xen/ioreq.h
   - remove unneeded headers in arch/x86/hvm/ioreq.c
   - re-order the headers alphabetically in common/ioreq.c
   - update common/ioreq.c according to the newly introduced arch functions:
     arch_hvm_destroy_ioreq_server()/arch_handle_hvm_io_completion()

Changes V1 -> V2:
   - update patch description
   - make everything needed in the previous patch to achieve
     a truly rename here
   - don't include unnecessary headers from asm-x86/hvm/ioreq.h
     and xen/ioreq.h
   - use __XEN_IOREQ_H__ instead of __IOREQ_H__
   - move get_ioreq_server() to common/ioreq.c

Changes V2 -> V3:
   - update patch description
   - make everything needed in the previous patch to not
     expose "legacy" interface to the common code here
   - update patch according the "legacy interface" is x86 specific
   - include <xen/domain_page.h> in common ioreq.c
---
---
 MAINTAINERS                     |    8 +-
 xen/arch/x86/Kconfig            |    1 +
 xen/arch/x86/hvm/ioreq.c        | 1356 ++-------------------------------------
 xen/arch/x86/mm.c               |    2 +-
 xen/arch/x86/mm/shadow/common.c |    2 +-
 xen/common/Kconfig              |    3 +
 xen/common/Makefile             |    1 +
 xen/common/ioreq.c              | 1287 +++++++++++++++++++++++++++++++++++++
 xen/include/asm-x86/hvm/ioreq.h |   39 +-
 xen/include/xen/ioreq.h         |   73 +++
 10 files changed, 1432 insertions(+), 1340 deletions(-)
 create mode 100644 xen/common/ioreq.c
 create mode 100644 xen/include/xen/ioreq.h

diff --git a/MAINTAINERS b/MAINTAINERS
index dab38a6..5a44ba4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -333,6 +333,13 @@ X:	xen/drivers/passthrough/vtd/
 X:	xen/drivers/passthrough/device_tree.c
 F:	xen/include/xen/iommu.h
 
+I/O EMULATION (IOREQ)
+M:	Paul Durrant <paul@xen.org>
+S:	Supported
+F:	xen/common/ioreq.c
+F:	xen/include/xen/ioreq.h
+F:	xen/include/public/hvm/ioreq.h
+
 KCONFIG
 M:	Doug Goldstein <cardoe@cardoe.com>
 S:	Supported
@@ -549,7 +556,6 @@ F:	xen/arch/x86/hvm/ioreq.c
 F:	xen/include/asm-x86/hvm/emulate.h
 F:	xen/include/asm-x86/hvm/io.h
 F:	xen/include/asm-x86/hvm/ioreq.h
-F:	xen/include/public/hvm/ioreq.h
 
 X86 MEMORY MANAGEMENT
 M:	Jan Beulich <jbeulich@suse.com>
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 24868aa..abe0fce 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -91,6 +91,7 @@ config PV_LINEAR_PT
 
 config HVM
 	def_bool !PV_SHIM_EXCLUSIVE
+	select IOREQ_SERVER
 	prompt "HVM support"
 	---help---
 	  Interfaces to support HVM domains.  HVM domains require hardware
diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 36b1e4e..b03ceee 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -41,140 +41,6 @@ bool ioreq_complete_mmio(void)
     return handle_mmio();
 }
 
-static void set_ioreq_server(struct domain *d, unsigned int id,
-                             struct hvm_ioreq_server *s)
-{
-    ASSERT(id < MAX_NR_IOREQ_SERVERS);
-    ASSERT(!s || !d->arch.hvm.ioreq_server.server[id]);
-
-    d->arch.hvm.ioreq_server.server[id] = s;
-}
-
-#define GET_IOREQ_SERVER(d, id) \
-    (d)->arch.hvm.ioreq_server.server[id]
-
-static struct hvm_ioreq_server *get_ioreq_server(const struct domain *d,
-                                                 unsigned int id)
-{
-    if ( id >= MAX_NR_IOREQ_SERVERS )
-        return NULL;
-
-    return GET_IOREQ_SERVER(d, id);
-}
-
-/*
- * Iterate over all possible ioreq servers.
- *
- * NOTE: The iteration is backwards such that more recently created
- *       ioreq servers are favoured in hvm_select_ioreq_server().
- *       This is a semantic that previously existed when ioreq servers
- *       were held in a linked list.
- */
-#define FOR_EACH_IOREQ_SERVER(d, id, s) \
-    for ( (id) = MAX_NR_IOREQ_SERVERS; (id) != 0; ) \
-        if ( !(s = GET_IOREQ_SERVER(d, --(id))) ) \
-            continue; \
-        else
-
-static ioreq_t *get_ioreq(struct hvm_ioreq_server *s, struct vcpu *v)
-{
-    shared_iopage_t *p = s->ioreq.va;
-
-    ASSERT((v == current) || !vcpu_runnable(v));
-    ASSERT(p != NULL);
-
-    return &p->vcpu_ioreq[v->vcpu_id];
-}
-
-static struct hvm_ioreq_vcpu *get_pending_vcpu(const struct vcpu *v,
-                                               struct hvm_ioreq_server **srvp)
-{
-    struct domain *d = v->domain;
-    struct hvm_ioreq_server *s;
-    unsigned int id;
-
-    FOR_EACH_IOREQ_SERVER(d, id, s)
-    {
-        struct hvm_ioreq_vcpu *sv;
-
-        list_for_each_entry ( sv,
-                              &s->ioreq_vcpu_list,
-                              list_entry )
-        {
-            if ( sv->vcpu == v && sv->pending )
-            {
-                if ( srvp )
-                    *srvp = s;
-                return sv;
-            }
-        }
-    }
-
-    return NULL;
-}
-
-bool hvm_io_pending(struct vcpu *v)
-{
-    return get_pending_vcpu(v, NULL);
-}
-
-static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t *p)
-{
-    unsigned int prev_state = STATE_IOREQ_NONE;
-    unsigned int state = p->state;
-    uint64_t data = ~0;
-
-    smp_rmb();
-
-    /*
-     * The only reason we should see this condition be false is when an
-     * emulator dying races with I/O being requested.
-     */
-    while ( likely(state != STATE_IOREQ_NONE) )
-    {
-        if ( unlikely(state < prev_state) )
-        {
-            gdprintk(XENLOG_ERR, "Weird HVM ioreq state transition %u -> %u\n",
-                     prev_state, state);
-            sv->pending = false;
-            domain_crash(sv->vcpu->domain);
-            return false; /* bail */
-        }
-
-        switch ( prev_state = state )
-        {
-        case STATE_IORESP_READY: /* IORESP_READY -> NONE */
-            p->state = STATE_IOREQ_NONE;
-            data = p->data;
-            break;
-
-        case STATE_IOREQ_READY:  /* IOREQ_{READY,INPROCESS} -> IORESP_READY */
-        case STATE_IOREQ_INPROCESS:
-            wait_on_xen_event_channel(sv->ioreq_evtchn,
-                                      ({ state = p->state;
-                                         smp_rmb();
-                                         state != prev_state; }));
-            continue;
-
-        default:
-            gdprintk(XENLOG_ERR, "Weird HVM iorequest state %u\n", state);
-            sv->pending = false;
-            domain_crash(sv->vcpu->domain);
-            return false; /* bail */
-        }
-
-        break;
-    }
-
-    p = &sv->vcpu->arch.hvm.hvm_io.io_req;
-    if ( hvm_ioreq_needs_completion(p) )
-        p->data = data;
-
-    sv->pending = false;
-
-    return true;
-}
-
 bool arch_vcpu_ioreq_completion(enum hvm_io_completion io_completion)
 {
     switch ( io_completion )
@@ -198,52 +64,6 @@ bool arch_vcpu_ioreq_completion(enum hvm_io_completion io_completion)
     return true;
 }
 
-bool handle_hvm_io_completion(struct vcpu *v)
-{
-    struct domain *d = v->domain;
-    struct hvm_vcpu_io *vio = &v->arch.hvm.hvm_io;
-    struct hvm_ioreq_server *s;
-    struct hvm_ioreq_vcpu *sv;
-    enum hvm_io_completion io_completion;
-
-    if ( has_vpci(d) && vpci_process_pending(v) )
-    {
-        raise_softirq(SCHEDULE_SOFTIRQ);
-        return false;
-    }
-
-    sv = get_pending_vcpu(v, &s);
-    if ( sv && !hvm_wait_for_io(sv, get_ioreq(s, v)) )
-        return false;
-
-    vio->io_req.state = hvm_ioreq_needs_completion(&vio->io_req) ?
-        STATE_IORESP_READY : STATE_IOREQ_NONE;
-
-    msix_write_completion(v);
-    vcpu_end_shutdown_deferral(v);
-
-    io_completion = vio->io_completion;
-    vio->io_completion = HVMIO_no_completion;
-
-    switch ( io_completion )
-    {
-    case HVMIO_no_completion:
-        break;
-
-    case HVMIO_mmio_completion:
-        return ioreq_complete_mmio();
-
-    case HVMIO_pio_completion:
-        return handle_pio(vio->io_req.addr, vio->io_req.size,
-                          vio->io_req.dir);
-
-    default:
-        return arch_vcpu_ioreq_completion(io_completion);
-    }
-
-    return true;
-}
-
 static gfn_t hvm_alloc_legacy_ioreq_gfn(struct hvm_ioreq_server *s)
 {
     struct domain *d = s->target;
@@ -360,93 +180,6 @@ static int hvm_map_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
     return rc;
 }
 
-static int hvm_alloc_ioreq_mfn(struct hvm_ioreq_server *s, bool buf)
-{
-    struct hvm_ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
-    struct page_info *page;
-
-    if ( iorp->page )
-    {
-        /*
-         * If a guest frame has already been mapped (which may happen
-         * on demand if hvm_get_ioreq_server_info() is called), then
-         * allocating a page is not permitted.
-         */
-        if ( !gfn_eq(iorp->gfn, INVALID_GFN) )
-            return -EPERM;
-
-        return 0;
-    }
-
-    page = alloc_domheap_page(s->target, MEMF_no_refcount);
-
-    if ( !page )
-        return -ENOMEM;
-
-    if ( !get_page_and_type(page, s->target, PGT_writable_page) )
-    {
-        /*
-         * The domain can't possibly know about this page yet, so failure
-         * here is a clear indication of something fishy going on.
-         */
-        domain_crash(s->emulator);
-        return -ENODATA;
-    }
-
-    iorp->va = __map_domain_page_global(page);
-    if ( !iorp->va )
-        goto fail;
-
-    iorp->page = page;
-    clear_page(iorp->va);
-    return 0;
-
- fail:
-    put_page_alloc_ref(page);
-    put_page_and_type(page);
-
-    return -ENOMEM;
-}
-
-static void hvm_free_ioreq_mfn(struct hvm_ioreq_server *s, bool buf)
-{
-    struct hvm_ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
-    struct page_info *page = iorp->page;
-
-    if ( !page )
-        return;
-
-    iorp->page = NULL;
-
-    unmap_domain_page_global(iorp->va);
-    iorp->va = NULL;
-
-    put_page_alloc_ref(page);
-    put_page_and_type(page);
-}
-
-bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
-{
-    const struct hvm_ioreq_server *s;
-    unsigned int id;
-    bool found = false;
-
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
-
-    FOR_EACH_IOREQ_SERVER(d, id, s)
-    {
-        if ( (s->ioreq.page == page) || (s->bufioreq.page == page) )
-        {
-            found = true;
-            break;
-        }
-    }
-
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
-
-    return found;
-}
-
 static void hvm_remove_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
 
 {
@@ -481,125 +214,6 @@ static int hvm_add_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
     return rc;
 }
 
-static void hvm_update_ioreq_evtchn(struct hvm_ioreq_server *s,
-                                    struct hvm_ioreq_vcpu *sv)
-{
-    ASSERT(spin_is_locked(&s->lock));
-
-    if ( s->ioreq.va != NULL )
-    {
-        ioreq_t *p = get_ioreq(s, sv->vcpu);
-
-        p->vp_eport = sv->ioreq_evtchn;
-    }
-}
-
-static int hvm_ioreq_server_add_vcpu(struct hvm_ioreq_server *s,
-                                     struct vcpu *v)
-{
-    struct hvm_ioreq_vcpu *sv;
-    int rc;
-
-    sv = xzalloc(struct hvm_ioreq_vcpu);
-
-    rc = -ENOMEM;
-    if ( !sv )
-        goto fail1;
-
-    spin_lock(&s->lock);
-
-    rc = alloc_unbound_xen_event_channel(v->domain, v->vcpu_id,
-                                         s->emulator->domain_id, NULL);
-    if ( rc < 0 )
-        goto fail2;
-
-    sv->ioreq_evtchn = rc;
-
-    if ( v->vcpu_id == 0 && HANDLE_BUFIOREQ(s) )
-    {
-        rc = alloc_unbound_xen_event_channel(v->domain, 0,
-                                             s->emulator->domain_id, NULL);
-        if ( rc < 0 )
-            goto fail3;
-
-        s->bufioreq_evtchn = rc;
-    }
-
-    sv->vcpu = v;
-
-    list_add(&sv->list_entry, &s->ioreq_vcpu_list);
-
-    if ( s->enabled )
-        hvm_update_ioreq_evtchn(s, sv);
-
-    spin_unlock(&s->lock);
-    return 0;
-
- fail3:
-    free_xen_event_channel(v->domain, sv->ioreq_evtchn);
-
- fail2:
-    spin_unlock(&s->lock);
-    xfree(sv);
-
- fail1:
-    return rc;
-}
-
-static void hvm_ioreq_server_remove_vcpu(struct hvm_ioreq_server *s,
-                                         struct vcpu *v)
-{
-    struct hvm_ioreq_vcpu *sv;
-
-    spin_lock(&s->lock);
-
-    list_for_each_entry ( sv,
-                          &s->ioreq_vcpu_list,
-                          list_entry )
-    {
-        if ( sv->vcpu != v )
-            continue;
-
-        list_del(&sv->list_entry);
-
-        if ( v->vcpu_id == 0 && HANDLE_BUFIOREQ(s) )
-            free_xen_event_channel(v->domain, s->bufioreq_evtchn);
-
-        free_xen_event_channel(v->domain, sv->ioreq_evtchn);
-
-        xfree(sv);
-        break;
-    }
-
-    spin_unlock(&s->lock);
-}
-
-static void hvm_ioreq_server_remove_all_vcpus(struct hvm_ioreq_server *s)
-{
-    struct hvm_ioreq_vcpu *sv, *next;
-
-    spin_lock(&s->lock);
-
-    list_for_each_entry_safe ( sv,
-                               next,
-                               &s->ioreq_vcpu_list,
-                               list_entry )
-    {
-        struct vcpu *v = sv->vcpu;
-
-        list_del(&sv->list_entry);
-
-        if ( v->vcpu_id == 0 && HANDLE_BUFIOREQ(s) )
-            free_xen_event_channel(v->domain, s->bufioreq_evtchn);
-
-        free_xen_event_channel(v->domain, sv->ioreq_evtchn);
-
-        xfree(sv);
-    }
-
-    spin_unlock(&s->lock);
-}
-
 int arch_ioreq_server_map_pages(struct hvm_ioreq_server *s)
 {
     int rc;
@@ -621,940 +235,91 @@ void arch_ioreq_server_unmap_pages(struct hvm_ioreq_server *s)
     hvm_unmap_ioreq_gfn(s, false);
 }
 
-static int hvm_ioreq_server_alloc_pages(struct hvm_ioreq_server *s)
+void arch_ioreq_server_enable(struct hvm_ioreq_server *s)
 {
-    int rc;
-
-    rc = hvm_alloc_ioreq_mfn(s, false);
-
-    if ( !rc && (s->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF) )
-        rc = hvm_alloc_ioreq_mfn(s, true);
-
-    if ( rc )
-        hvm_free_ioreq_mfn(s, false);
-
-    return rc;
+    hvm_remove_ioreq_gfn(s, false);
+    hvm_remove_ioreq_gfn(s, true);
 }
 
-static void hvm_ioreq_server_free_pages(struct hvm_ioreq_server *s)
+void arch_ioreq_server_disable(struct hvm_ioreq_server *s)
 {
-    hvm_free_ioreq_mfn(s, true);
-    hvm_free_ioreq_mfn(s, false);
+    hvm_add_ioreq_gfn(s, true);
+    hvm_add_ioreq_gfn(s, false);
 }
 
-static void hvm_ioreq_server_free_rangesets(struct hvm_ioreq_server *s)
+/* Called when target domain is paused */
+void arch_ioreq_server_destroy(struct hvm_ioreq_server *s)
 {
-    unsigned int i;
-
-    for ( i = 0; i < NR_IO_RANGE_TYPES; i++ )
-        rangeset_destroy(s->range[i]);
+    p2m_set_ioreq_server(s->target, 0, s);
 }
 
-static int hvm_ioreq_server_alloc_rangesets(struct hvm_ioreq_server *s,
-                                            ioservid_t id)
+/* Called with ioreq_server lock held */
+int arch_ioreq_server_map_mem_type(struct domain *d,
+                                   struct hvm_ioreq_server *s,
+                                   uint32_t flags)
 {
-    unsigned int i;
-    int rc;
+    int rc = p2m_set_ioreq_server(d, flags, s);
 
-    for ( i = 0; i < NR_IO_RANGE_TYPES; i++ )
+    if ( rc == 0 && flags == 0 )
     {
-        char *name;
-
-        rc = asprintf(&name, "ioreq_server %d %s", id,
-                      (i == XEN_DMOP_IO_RANGE_PORT) ? "port" :
-                      (i == XEN_DMOP_IO_RANGE_MEMORY) ? "memory" :
-                      (i == XEN_DMOP_IO_RANGE_PCI) ? "pci" :
-                      "");
-        if ( rc )
-            goto fail;
-
-        s->range[i] = rangeset_new(s->target, name,
-                                   RANGESETF_prettyprint_hex);
-
-        xfree(name);
-
-        rc = -ENOMEM;
-        if ( !s->range[i] )
-            goto fail;
+        const struct p2m_domain *p2m = p2m_get_hostp2m(d);
 
-        rangeset_limit(s->range[i], MAX_NR_IO_RANGES);
+        if ( read_atomic(&p2m->ioreq.entry_count) )
+            p2m_change_entry_type_global(d, p2m_ioreq_server, p2m_ram_rw);
     }
 
-    return 0;
-
- fail:
-    hvm_ioreq_server_free_rangesets(s);
-
     return rc;
 }
 
-void arch_ioreq_server_enable(struct hvm_ioreq_server *s)
+bool arch_ioreq_server_destroy_all(struct domain *d)
 {
-    hvm_remove_ioreq_gfn(s, false);
-    hvm_remove_ioreq_gfn(s, true);
+    return relocate_portio_handler(d, 0xcf8, 0xcf8, 4);
 }
 
-static void hvm_ioreq_server_enable(struct hvm_ioreq_server *s)
+int arch_ioreq_server_get_type_addr(const struct domain *d,
+                                    const ioreq_t *p,
+                                    uint8_t *type,
+                                    uint64_t *addr)
 {
-    struct hvm_ioreq_vcpu *sv;
+    unsigned int cf8 = d->arch.hvm.pci_cf8;
 
-    spin_lock(&s->lock);
+    if ( p->type != IOREQ_TYPE_COPY && p->type != IOREQ_TYPE_PIO )
+        return -EINVAL;
 
-    if ( s->enabled )
-        goto done;
+    if ( p->type == IOREQ_TYPE_PIO &&
+         (p->addr & ~3) == 0xcfc &&
+         CF8_ENABLED(cf8) )
+    {
+        unsigned int x86_fam, reg;
+        pci_sbdf_t sbdf;
 
-    arch_ioreq_server_enable(s);
+        reg = hvm_pci_decode_addr(cf8, p->addr, &sbdf);
 
-    s->enabled = true;
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
 
-    list_for_each_entry ( sv,
-                          &s->ioreq_vcpu_list,
-                          list_entry )
-        hvm_update_ioreq_evtchn(s, sv);
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
 
-  done:
-    spin_unlock(&s->lock);
-}
-
-void arch_ioreq_server_disable(struct hvm_ioreq_server *s)
-{
-    hvm_add_ioreq_gfn(s, true);
-    hvm_add_ioreq_gfn(s, false);
-}
-
-static void hvm_ioreq_server_disable(struct hvm_ioreq_server *s)
-{
-    spin_lock(&s->lock);
-
-    if ( !s->enabled )
-        goto done;
-
-    arch_ioreq_server_disable(s);
-
-    s->enabled = false;
-
- done:
-    spin_unlock(&s->lock);
-}
-
-static int hvm_ioreq_server_init(struct hvm_ioreq_server *s,
-                                 struct domain *d, int bufioreq_handling,
-                                 ioservid_t id)
-{
-    struct domain *currd = current->domain;
-    struct vcpu *v;
-    int rc;
-
-    s->target = d;
-
-    get_knownalive_domain(currd);
-    s->emulator = currd;
-
-    spin_lock_init(&s->lock);
-    INIT_LIST_HEAD(&s->ioreq_vcpu_list);
-    spin_lock_init(&s->bufioreq_lock);
-
-    s->ioreq.gfn = INVALID_GFN;
-    s->bufioreq.gfn = INVALID_GFN;
-
-    rc = hvm_ioreq_server_alloc_rangesets(s, id);
-    if ( rc )
-        return rc;
-
-    s->bufioreq_handling = bufioreq_handling;
-
-    for_each_vcpu ( d, v )
-    {
-        rc = hvm_ioreq_server_add_vcpu(s, v);
-        if ( rc )
-            goto fail_add;
-    }
-
-    return 0;
-
- fail_add:
-    hvm_ioreq_server_remove_all_vcpus(s);
-    arch_ioreq_server_unmap_pages(s);
-
-    hvm_ioreq_server_free_rangesets(s);
-
-    put_domain(s->emulator);
-    return rc;
-}
-
-static void hvm_ioreq_server_deinit(struct hvm_ioreq_server *s)
-{
-    ASSERT(!s->enabled);
-    hvm_ioreq_server_remove_all_vcpus(s);
-
-    /*
-     * NOTE: It is safe to call both arch_ioreq_server_unmap_pages() and
-     *       hvm_ioreq_server_free_pages() in that order.
-     *       This is because the former will do nothing if the pages
-     *       are not mapped, leaving the page to be freed by the latter.
-     *       However if the pages are mapped then the former will set
-     *       the page_info pointer to NULL, meaning the latter will do
-     *       nothing.
-     */
-    arch_ioreq_server_unmap_pages(s);
-    hvm_ioreq_server_free_pages(s);
-
-    hvm_ioreq_server_free_rangesets(s);
-
-    put_domain(s->emulator);
-}
-
-int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
-                            ioservid_t *id)
-{
-    struct hvm_ioreq_server *s;
-    unsigned int i;
-    int rc;
-
-    if ( bufioreq_handling > HVM_IOREQSRV_BUFIOREQ_ATOMIC )
-        return -EINVAL;
-
-    s = xzalloc(struct hvm_ioreq_server);
-    if ( !s )
-        return -ENOMEM;
-
-    domain_pause(d);
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
-
-    for ( i = 0; i < MAX_NR_IOREQ_SERVERS; i++ )
-    {
-        if ( !GET_IOREQ_SERVER(d, i) )
-            break;
-    }
-
-    rc = -ENOSPC;
-    if ( i >= MAX_NR_IOREQ_SERVERS )
-        goto fail;
-
-    /*
-     * It is safe to call set_ioreq_server() prior to
-     * hvm_ioreq_server_init() since the target domain is paused.
-     */
-    set_ioreq_server(d, i, s);
-
-    rc = hvm_ioreq_server_init(s, d, bufioreq_handling, i);
-    if ( rc )
-    {
-        set_ioreq_server(d, i, NULL);
-        goto fail;
-    }
-
-    if ( id )
-        *id = i;
-
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
-    domain_unpause(d);
-
-    return 0;
-
- fail:
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
-    domain_unpause(d);
-
-    xfree(s);
-    return rc;
-}
-
-/* Called when target domain is paused */
-void arch_ioreq_server_destroy(struct hvm_ioreq_server *s)
-{
-    p2m_set_ioreq_server(s->target, 0, s);
-}
-
-int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
-{
-    struct hvm_ioreq_server *s;
-    int rc;
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
-    domain_pause(d);
-
-    arch_ioreq_server_destroy(s);
-
-    hvm_ioreq_server_disable(s);
-
-    /*
-     * It is safe to call hvm_ioreq_server_deinit() prior to
-     * set_ioreq_server() since the target domain is paused.
-     */
-    hvm_ioreq_server_deinit(s);
-    set_ioreq_server(d, id, NULL);
-
-    domain_unpause(d);
-
-    xfree(s);
-
-    rc = 0;
-
- out:
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
-
-    return rc;
-}
-
-int hvm_get_ioreq_server_info(struct domain *d, ioservid_t id,
-                              unsigned long *ioreq_gfn,
-                              unsigned long *bufioreq_gfn,
-                              evtchn_port_t *bufioreq_port)
-{
-    struct hvm_ioreq_server *s;
-    int rc;
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
-    if ( ioreq_gfn || bufioreq_gfn )
-    {
-        rc = arch_ioreq_server_map_pages(s);
-        if ( rc )
-            goto out;
-    }
-
-    if ( ioreq_gfn )
-        *ioreq_gfn = gfn_x(s->ioreq.gfn);
-
-    if ( HANDLE_BUFIOREQ(s) )
-    {
-        if ( bufioreq_gfn )
-            *bufioreq_gfn = gfn_x(s->bufioreq.gfn);
-
-        if ( bufioreq_port )
-            *bufioreq_port = s->bufioreq_evtchn;
-    }
-
-    rc = 0;
-
- out:
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
-
-    return rc;
-}
-
-int hvm_get_ioreq_server_frame(struct domain *d, ioservid_t id,
-                               unsigned long idx, mfn_t *mfn)
-{
-    struct hvm_ioreq_server *s;
-    int rc;
-
-    ASSERT(is_hvm_domain(d));
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
-    rc = hvm_ioreq_server_alloc_pages(s);
-    if ( rc )
-        goto out;
-
-    switch ( idx )
-    {
-    case XENMEM_resource_ioreq_server_frame_bufioreq:
-        rc = -ENOENT;
-        if ( !HANDLE_BUFIOREQ(s) )
-            goto out;
-
-        *mfn = page_to_mfn(s->bufioreq.page);
-        rc = 0;
-        break;
-
-    case XENMEM_resource_ioreq_server_frame_ioreq(0):
-        *mfn = page_to_mfn(s->ioreq.page);
-        rc = 0;
-        break;
-
-    default:
-        rc = -EINVAL;
-        break;
-    }
-
- out:
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
-
-    return rc;
-}
-
-int hvm_map_io_range_to_ioreq_server(struct domain *d, ioservid_t id,
-                                     uint32_t type, uint64_t start,
-                                     uint64_t end)
-{
-    struct hvm_ioreq_server *s;
-    struct rangeset *r;
-    int rc;
-
-    if ( start > end )
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
-    switch ( type )
-    {
-    case XEN_DMOP_IO_RANGE_PORT:
-    case XEN_DMOP_IO_RANGE_MEMORY:
-    case XEN_DMOP_IO_RANGE_PCI:
-        r = s->range[type];
-        break;
-
-    default:
-        r = NULL;
-        break;
-    }
-
-    rc = -EINVAL;
-    if ( !r )
-        goto out;
-
-    rc = -EEXIST;
-    if ( rangeset_overlaps_range(r, start, end) )
-        goto out;
-
-    rc = rangeset_add_range(r, start, end);
-
- out:
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
-
-    return rc;
-}
-
-int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
-                                         uint32_t type, uint64_t start,
-                                         uint64_t end)
-{
-    struct hvm_ioreq_server *s;
-    struct rangeset *r;
-    int rc;
-
-    if ( start > end )
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
-    switch ( type )
-    {
-    case XEN_DMOP_IO_RANGE_PORT:
-    case XEN_DMOP_IO_RANGE_MEMORY:
-    case XEN_DMOP_IO_RANGE_PCI:
-        r = s->range[type];
-        break;
-
-    default:
-        r = NULL;
-        break;
-    }
-
-    rc = -EINVAL;
-    if ( !r )
-        goto out;
-
-    rc = -ENOENT;
-    if ( !rangeset_contains_range(r, start, end) )
-        goto out;
-
-    rc = rangeset_remove_range(r, start, end);
-
- out:
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
-
-    return rc;
-}
-
-/* Called with ioreq_server lock held */
-int arch_ioreq_server_map_mem_type(struct domain *d,
-                                   struct hvm_ioreq_server *s,
-                                   uint32_t flags)
-{
-    int rc = p2m_set_ioreq_server(d, flags, s);
-
-    if ( rc == 0 && flags == 0 )
-    {
-        const struct p2m_domain *p2m = p2m_get_hostp2m(d);
-
-        if ( read_atomic(&p2m->ioreq.entry_count) )
-            p2m_change_entry_type_global(d, p2m_ioreq_server, p2m_ram_rw);
-    }
-
-    return rc;
-}
-
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
-    rc = arch_ioreq_server_map_mem_type(d, s, flags);
-
- out:
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
-
-    return rc;
-}
-
-int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
-                               bool enabled)
-{
-    struct hvm_ioreq_server *s;
-    int rc;
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
-    domain_pause(d);
-
-    if ( enabled )
-        hvm_ioreq_server_enable(s);
-    else
-        hvm_ioreq_server_disable(s);
-
-    domain_unpause(d);
-
-    rc = 0;
-
- out:
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
-    return rc;
-}
-
-int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v)
-{
-    struct hvm_ioreq_server *s;
-    unsigned int id;
-    int rc;
-
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
-
-    FOR_EACH_IOREQ_SERVER(d, id, s)
-    {
-        rc = hvm_ioreq_server_add_vcpu(s, v);
-        if ( rc )
-            goto fail;
-    }
-
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
-
-    return 0;
-
- fail:
-    while ( ++id != MAX_NR_IOREQ_SERVERS )
-    {
-        s = GET_IOREQ_SERVER(d, id);
-
-        if ( !s )
-            continue;
-
-        hvm_ioreq_server_remove_vcpu(s, v);
-    }
-
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
-
-    return rc;
-}
-
-void hvm_all_ioreq_servers_remove_vcpu(struct domain *d, struct vcpu *v)
-{
-    struct hvm_ioreq_server *s;
-    unsigned int id;
-
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
-
-    FOR_EACH_IOREQ_SERVER(d, id, s)
-        hvm_ioreq_server_remove_vcpu(s, v);
-
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
-}
-
-bool arch_ioreq_server_destroy_all(struct domain *d)
-{
-    return relocate_portio_handler(d, 0xcf8, 0xcf8, 4);
-}
-
-void hvm_destroy_all_ioreq_servers(struct domain *d)
-{
-    struct hvm_ioreq_server *s;
-    unsigned int id;
-
-    if ( !arch_ioreq_server_destroy_all(d) )
-        return;
-
-    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
-
-    /* No need to domain_pause() as the domain is being torn down */
-
-    FOR_EACH_IOREQ_SERVER(d, id, s)
-    {
-        hvm_ioreq_server_disable(s);
-
-        /*
-         * It is safe to call hvm_ioreq_server_deinit() prior to
-         * set_ioreq_server() since the target domain is being destroyed.
-         */
-        hvm_ioreq_server_deinit(s);
-        set_ioreq_server(d, id, NULL);
-
-        xfree(s);
-    }
-
-    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
-}
-
-int arch_ioreq_server_get_type_addr(const struct domain *d,
-                                    const ioreq_t *p,
-                                    uint8_t *type,
-                                    uint64_t *addr)
-{
-    unsigned int cf8 = d->arch.hvm.pci_cf8;
-
-    if ( p->type != IOREQ_TYPE_COPY && p->type != IOREQ_TYPE_PIO )
-        return -EINVAL;
-
-    if ( p->type == IOREQ_TYPE_PIO &&
-         (p->addr & ~3) == 0xcfc &&
-         CF8_ENABLED(cf8) )
-    {
-        unsigned int x86_fam, reg;
-        pci_sbdf_t sbdf;
-
-        reg = hvm_pci_decode_addr(cf8, p->addr, &sbdf);
-
-        /* PCI config data cycle */
-        *type = XEN_DMOP_IO_RANGE_PCI;
-        *addr = ((uint64_t)sbdf.sbdf << 32) | reg;
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
-                *addr |= CF8_ADDR_HI(cf8);
-        }
-    }
-    else
-    {
-        *type = (p->type == IOREQ_TYPE_PIO) ?
-                 XEN_DMOP_IO_RANGE_PORT : XEN_DMOP_IO_RANGE_MEMORY;
-        *addr = p->addr;
-    }
-
-    return 0;
-}
-
-struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
-                                                 ioreq_t *p)
-{
-    struct hvm_ioreq_server *s;
-    uint8_t type;
-    uint64_t addr;
-    unsigned int id;
-
-    if ( arch_ioreq_server_get_type_addr(d, p, &type, &addr) )
-        return NULL;
-
-    FOR_EACH_IOREQ_SERVER(d, id, s)
-    {
-        struct rangeset *r;
-
-        if ( !s->enabled )
-            continue;
-
-        r = s->range[type];
-
-        switch ( type )
-        {
-            unsigned long start, end;
-
-        case XEN_DMOP_IO_RANGE_PORT:
-            start = addr;
-            end = start + p->size - 1;
-            if ( rangeset_contains_range(r, start, end) )
-                return s;
-
-            break;
-
-        case XEN_DMOP_IO_RANGE_MEMORY:
-            start = hvm_mmio_first_byte(p);
-            end = hvm_mmio_last_byte(p);
-
-            if ( rangeset_contains_range(r, start, end) )
-                return s;
-
-            break;
-
-        case XEN_DMOP_IO_RANGE_PCI:
-            if ( rangeset_contains_singleton(r, addr >> 32) )
-            {
-                p->type = IOREQ_TYPE_PCI_CONFIG;
-                p->addr = addr;
-                return s;
-            }
-
-            break;
-        }
-    }
-
-    return NULL;
-}
-
-static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
-{
-    struct domain *d = current->domain;
-    struct hvm_ioreq_page *iorp;
-    buffered_iopage_t *pg;
-    buf_ioreq_t bp = { .data = p->data,
-                       .addr = p->addr,
-                       .type = p->type,
-                       .dir = p->dir };
-    /* Timeoffset sends 64b data, but no address. Use two consecutive slots. */
-    int qw = 0;
-
-    /* Ensure buffered_iopage fits in a page */
-    BUILD_BUG_ON(sizeof(buffered_iopage_t) > PAGE_SIZE);
-
-    iorp = &s->bufioreq;
-    pg = iorp->va;
-
-    if ( !pg )
-        return IOREQ_STATUS_UNHANDLED;
-
-    /*
-     * Return 0 for the cases we can't deal with:
-     *  - 'addr' is only a 20-bit field, so we cannot address beyond 1MB
-     *  - we cannot buffer accesses to guest memory buffers, as the guest
-     *    may expect the memory buffer to be synchronously accessed
-     *  - the count field is usually used with data_is_ptr and since we don't
-     *    support data_is_ptr we do not waste space for the count field either
-     */
-    if ( (p->addr > 0xffffful) || p->data_is_ptr || (p->count != 1) )
-        return 0;
-
-    switch ( p->size )
-    {
-    case 1:
-        bp.size = 0;
-        break;
-    case 2:
-        bp.size = 1;
-        break;
-    case 4:
-        bp.size = 2;
-        break;
-    case 8:
-        bp.size = 3;
-        qw = 1;
-        break;
-    default:
-        gdprintk(XENLOG_WARNING, "unexpected ioreq size: %u\n", p->size);
-        return IOREQ_STATUS_UNHANDLED;
-    }
-
-    spin_lock(&s->bufioreq_lock);
-
-    if ( (pg->ptrs.write_pointer - pg->ptrs.read_pointer) >=
-         (IOREQ_BUFFER_SLOT_NUM - qw) )
-    {
-        /* The queue is full: send the iopacket through the normal path. */
-        spin_unlock(&s->bufioreq_lock);
-        return IOREQ_STATUS_UNHANDLED;
-    }
-
-    pg->buf_ioreq[pg->ptrs.write_pointer % IOREQ_BUFFER_SLOT_NUM] = bp;
-
-    if ( qw )
-    {
-        bp.data = p->data >> 32;
-        pg->buf_ioreq[(pg->ptrs.write_pointer+1) % IOREQ_BUFFER_SLOT_NUM] = bp;
-    }
-
-    /* Make the ioreq_t visible /before/ write_pointer. */
-    smp_wmb();
-    pg->ptrs.write_pointer += qw ? 2 : 1;
-
-    /* Canonicalize read/write pointers to prevent their overflow. */
-    while ( (s->bufioreq_handling == HVM_IOREQSRV_BUFIOREQ_ATOMIC) &&
-            qw++ < IOREQ_BUFFER_SLOT_NUM &&
-            pg->ptrs.read_pointer >= IOREQ_BUFFER_SLOT_NUM )
-    {
-        union bufioreq_pointers old = pg->ptrs, new;
-        unsigned int n = old.read_pointer / IOREQ_BUFFER_SLOT_NUM;
-
-        new.read_pointer = old.read_pointer - n * IOREQ_BUFFER_SLOT_NUM;
-        new.write_pointer = old.write_pointer - n * IOREQ_BUFFER_SLOT_NUM;
-        cmpxchg(&pg->ptrs.full, old.full, new.full);
-    }
-
-    notify_via_xen_event_channel(d, s->bufioreq_evtchn);
-    spin_unlock(&s->bufioreq_lock);
-
-    return IOREQ_STATUS_HANDLED;
-}
-
-int hvm_send_ioreq(struct hvm_ioreq_server *s, ioreq_t *proto_p,
-                   bool buffered)
-{
-    struct vcpu *curr = current;
-    struct domain *d = curr->domain;
-    struct hvm_ioreq_vcpu *sv;
-
-    ASSERT(s);
-
-    if ( buffered )
-        return hvm_send_buffered_ioreq(s, proto_p);
-
-    if ( unlikely(!vcpu_start_shutdown_deferral(curr)) )
-        return IOREQ_STATUS_RETRY;
-
-    list_for_each_entry ( sv,
-                          &s->ioreq_vcpu_list,
-                          list_entry )
-    {
-        if ( sv->vcpu == curr )
-        {
-            evtchn_port_t port = sv->ioreq_evtchn;
-            ioreq_t *p = get_ioreq(s, curr);
-
-            if ( unlikely(p->state != STATE_IOREQ_NONE) )
-            {
-                gprintk(XENLOG_ERR, "device model set bad IO state %d\n",
-                        p->state);
-                break;
-            }
-
-            if ( unlikely(p->vp_eport != port) )
-            {
-                gprintk(XENLOG_ERR, "device model set bad event channel %d\n",
-                        p->vp_eport);
-                break;
-            }
-
-            proto_p->state = STATE_IOREQ_NONE;
-            proto_p->vp_eport = port;
-            *p = *proto_p;
-
-            prepare_wait_on_xen_event_channel(port);
-
-            /*
-             * Following happens /after/ blocking and setting up ioreq
-             * contents. prepare_wait_on_xen_event_channel() is an implicit
-             * barrier.
-             */
-            p->state = STATE_IOREQ_READY;
-            notify_via_xen_event_channel(d, port);
-
-            sv->pending = true;
-            return IOREQ_STATUS_RETRY;
-        }
-    }
-
-    return IOREQ_STATUS_UNHANDLED;
-}
-
-unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered)
-{
-    struct domain *d = current->domain;
-    struct hvm_ioreq_server *s;
-    unsigned int id, failed = 0;
-
-    FOR_EACH_IOREQ_SERVER(d, id, s)
-    {
-        if ( !s->enabled )
-            continue;
-
-        if ( hvm_send_ioreq(s, p, buffered) == IOREQ_STATUS_UNHANDLED )
-            failed++;
-    }
-
-    return failed;
+    return 0;
 }
 
 static int hvm_access_cf8(
@@ -1574,13 +339,6 @@ void arch_ioreq_domain_init(struct domain *d)
     register_portio_handler(d, 0xcf8, 4, hvm_access_cf8);
 }
 
-void hvm_ioreq_init(struct domain *d)
-{
-    spin_lock_init(&d->arch.hvm.ioreq_server.lock);
-
-    arch_ioreq_domain_init(d);
-}
-
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 5a50339..e4638ef 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -100,6 +100,7 @@
  */
 
 #include <xen/init.h>
+#include <xen/ioreq.h>
 #include <xen/kernel.h>
 #include <xen/lib.h>
 #include <xen/mm.h>
@@ -141,7 +142,6 @@
 #include <asm/io_apic.h>
 #include <asm/pci.h>
 #include <asm/guest.h>
-#include <asm/hvm/ioreq.h>
 
 #include <asm/hvm/grant_table.h>
 #include <asm/pv/domain.h>
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index a33e100..f7d74d3 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -20,6 +20,7 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/ioreq.h>
 #include <xen/types.h>
 #include <xen/mm.h>
 #include <xen/trace.h>
@@ -34,7 +35,6 @@
 #include <asm/current.h>
 #include <asm/flushtlb.h>
 #include <asm/shadow.h>
-#include <asm/hvm/ioreq.h>
 #include <xen/numa.h>
 #include "private.h"
 
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 3e2cf25..c971ded 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -139,6 +139,9 @@ config HYPFS_CONFIG
 	  Disable this option in case you want to spare some memory or you
 	  want to hide the .config contents from dom0.
 
+config IOREQ_SERVER
+	bool
+
 config KEXEC
 	bool "kexec support"
 	default y
diff --git a/xen/common/Makefile b/xen/common/Makefile
index d109f27..c0e91c4 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_GRANT_TABLE) += grant_table.o
 obj-y += guestcopy.o
 obj-bin-y += gunzip.init.o
 obj-$(CONFIG_HYPFS) += hypfs.o
+obj-$(CONFIG_IOREQ_SERVER) += ioreq.o
 obj-y += irq.o
 obj-y += kernel.o
 obj-y += keyhandler.o
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
new file mode 100644
index 0000000..13ea959
--- /dev/null
+++ b/xen/common/ioreq.c
@@ -0,0 +1,1287 @@
+/*
+ * ioreq.c: hardware virtual machine I/O emulation
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
+#include <xen/ctype.h>
+#include <xen/domain.h>
+#include <xen/domain_page.h>
+#include <xen/event.h>
+#include <xen/init.h>
+#include <xen/irq.h>
+#include <xen/lib.h>
+#include <xen/paging.h>
+#include <xen/sched.h>
+#include <xen/softirq.h>
+#include <xen/trace.h>
+#include <xen/vpci.h>
+
+#include <asm/hvm/ioreq.h>
+
+#include <public/hvm/ioreq.h>
+#include <public/hvm/params.h>
+
+static void set_ioreq_server(struct domain *d, unsigned int id,
+                             struct hvm_ioreq_server *s)
+{
+    ASSERT(id < MAX_NR_IOREQ_SERVERS);
+    ASSERT(!s || !d->arch.hvm.ioreq_server.server[id]);
+
+    d->arch.hvm.ioreq_server.server[id] = s;
+}
+
+#define GET_IOREQ_SERVER(d, id) \
+    (d)->arch.hvm.ioreq_server.server[id]
+
+static struct hvm_ioreq_server *get_ioreq_server(const struct domain *d,
+                                                 unsigned int id)
+{
+    if ( id >= MAX_NR_IOREQ_SERVERS )
+        return NULL;
+
+    return GET_IOREQ_SERVER(d, id);
+}
+
+/*
+ * Iterate over all possible ioreq servers.
+ *
+ * NOTE: The iteration is backwards such that more recently created
+ *       ioreq servers are favoured in hvm_select_ioreq_server().
+ *       This is a semantic that previously existed when ioreq servers
+ *       were held in a linked list.
+ */
+#define FOR_EACH_IOREQ_SERVER(d, id, s) \
+    for ( (id) = MAX_NR_IOREQ_SERVERS; (id) != 0; ) \
+        if ( !(s = GET_IOREQ_SERVER(d, --(id))) ) \
+            continue; \
+        else
+
+static ioreq_t *get_ioreq(struct hvm_ioreq_server *s, struct vcpu *v)
+{
+    shared_iopage_t *p = s->ioreq.va;
+
+    ASSERT((v == current) || !vcpu_runnable(v));
+    ASSERT(p != NULL);
+
+    return &p->vcpu_ioreq[v->vcpu_id];
+}
+
+static struct hvm_ioreq_vcpu *get_pending_vcpu(const struct vcpu *v,
+                                               struct hvm_ioreq_server **srvp)
+{
+    struct domain *d = v->domain;
+    struct hvm_ioreq_server *s;
+    unsigned int id;
+
+    FOR_EACH_IOREQ_SERVER(d, id, s)
+    {
+        struct hvm_ioreq_vcpu *sv;
+
+        list_for_each_entry ( sv,
+                              &s->ioreq_vcpu_list,
+                              list_entry )
+        {
+            if ( sv->vcpu == v && sv->pending )
+            {
+                if ( srvp )
+                    *srvp = s;
+                return sv;
+            }
+        }
+    }
+
+    return NULL;
+}
+
+bool hvm_io_pending(struct vcpu *v)
+{
+    return get_pending_vcpu(v, NULL);
+}
+
+static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t *p)
+{
+    unsigned int prev_state = STATE_IOREQ_NONE;
+    unsigned int state = p->state;
+    uint64_t data = ~0;
+
+    smp_rmb();
+
+    /*
+     * The only reason we should see this condition be false is when an
+     * emulator dying races with I/O being requested.
+     */
+    while ( likely(state != STATE_IOREQ_NONE) )
+    {
+        if ( unlikely(state < prev_state) )
+        {
+            gdprintk(XENLOG_ERR, "Weird HVM ioreq state transition %u -> %u\n",
+                     prev_state, state);
+            sv->pending = false;
+            domain_crash(sv->vcpu->domain);
+            return false; /* bail */
+        }
+
+        switch ( prev_state = state )
+        {
+        case STATE_IORESP_READY: /* IORESP_READY -> NONE */
+            p->state = STATE_IOREQ_NONE;
+            data = p->data;
+            break;
+
+        case STATE_IOREQ_READY:  /* IOREQ_{READY,INPROCESS} -> IORESP_READY */
+        case STATE_IOREQ_INPROCESS:
+            wait_on_xen_event_channel(sv->ioreq_evtchn,
+                                      ({ state = p->state;
+                                         smp_rmb();
+                                         state != prev_state; }));
+            continue;
+
+        default:
+            gdprintk(XENLOG_ERR, "Weird HVM iorequest state %u\n", state);
+            sv->pending = false;
+            domain_crash(sv->vcpu->domain);
+            return false; /* bail */
+        }
+
+        break;
+    }
+
+    p = &sv->vcpu->arch.hvm.hvm_io.io_req;
+    if ( hvm_ioreq_needs_completion(p) )
+        p->data = data;
+
+    sv->pending = false;
+
+    return true;
+}
+
+bool handle_hvm_io_completion(struct vcpu *v)
+{
+    struct domain *d = v->domain;
+    struct hvm_vcpu_io *vio = &v->arch.hvm.hvm_io;
+    struct hvm_ioreq_server *s;
+    struct hvm_ioreq_vcpu *sv;
+    enum hvm_io_completion io_completion;
+
+    if ( has_vpci(d) && vpci_process_pending(v) )
+    {
+        raise_softirq(SCHEDULE_SOFTIRQ);
+        return false;
+    }
+
+    sv = get_pending_vcpu(v, &s);
+    if ( sv && !hvm_wait_for_io(sv, get_ioreq(s, v)) )
+        return false;
+
+    vio->io_req.state = hvm_ioreq_needs_completion(&vio->io_req) ?
+        STATE_IORESP_READY : STATE_IOREQ_NONE;
+
+    msix_write_completion(v);
+    vcpu_end_shutdown_deferral(v);
+
+    io_completion = vio->io_completion;
+    vio->io_completion = HVMIO_no_completion;
+
+    switch ( io_completion )
+    {
+    case HVMIO_no_completion:
+        break;
+
+    case HVMIO_mmio_completion:
+        return ioreq_complete_mmio();
+
+    case HVMIO_pio_completion:
+        return handle_pio(vio->io_req.addr, vio->io_req.size,
+                          vio->io_req.dir);
+
+    default:
+        return arch_vcpu_ioreq_completion(io_completion);
+    }
+
+    return true;
+}
+
+static int hvm_alloc_ioreq_mfn(struct hvm_ioreq_server *s, bool buf)
+{
+    struct hvm_ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    struct page_info *page;
+
+    if ( iorp->page )
+    {
+        /*
+         * If a guest frame has already been mapped (which may happen
+         * on demand if hvm_get_ioreq_server_info() is called), then
+         * allocating a page is not permitted.
+         */
+        if ( !gfn_eq(iorp->gfn, INVALID_GFN) )
+            return -EPERM;
+
+        return 0;
+    }
+
+    page = alloc_domheap_page(s->target, MEMF_no_refcount);
+
+    if ( !page )
+        return -ENOMEM;
+
+    if ( !get_page_and_type(page, s->target, PGT_writable_page) )
+    {
+        /*
+         * The domain can't possibly know about this page yet, so failure
+         * here is a clear indication of something fishy going on.
+         */
+        domain_crash(s->emulator);
+        return -ENODATA;
+    }
+
+    iorp->va = __map_domain_page_global(page);
+    if ( !iorp->va )
+        goto fail;
+
+    iorp->page = page;
+    clear_page(iorp->va);
+    return 0;
+
+ fail:
+    put_page_alloc_ref(page);
+    put_page_and_type(page);
+
+    return -ENOMEM;
+}
+
+static void hvm_free_ioreq_mfn(struct hvm_ioreq_server *s, bool buf)
+{
+    struct hvm_ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    struct page_info *page = iorp->page;
+
+    if ( !page )
+        return;
+
+    iorp->page = NULL;
+
+    unmap_domain_page_global(iorp->va);
+    iorp->va = NULL;
+
+    put_page_alloc_ref(page);
+    put_page_and_type(page);
+}
+
+bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
+{
+    const struct hvm_ioreq_server *s;
+    unsigned int id;
+    bool found = false;
+
+    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+
+    FOR_EACH_IOREQ_SERVER(d, id, s)
+    {
+        if ( (s->ioreq.page == page) || (s->bufioreq.page == page) )
+        {
+            found = true;
+            break;
+        }
+    }
+
+    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+
+    return found;
+}
+
+static void hvm_update_ioreq_evtchn(struct hvm_ioreq_server *s,
+                                    struct hvm_ioreq_vcpu *sv)
+{
+    ASSERT(spin_is_locked(&s->lock));
+
+    if ( s->ioreq.va != NULL )
+    {
+        ioreq_t *p = get_ioreq(s, sv->vcpu);
+
+        p->vp_eport = sv->ioreq_evtchn;
+    }
+}
+
+static int hvm_ioreq_server_add_vcpu(struct hvm_ioreq_server *s,
+                                     struct vcpu *v)
+{
+    struct hvm_ioreq_vcpu *sv;
+    int rc;
+
+    sv = xzalloc(struct hvm_ioreq_vcpu);
+
+    rc = -ENOMEM;
+    if ( !sv )
+        goto fail1;
+
+    spin_lock(&s->lock);
+
+    rc = alloc_unbound_xen_event_channel(v->domain, v->vcpu_id,
+                                         s->emulator->domain_id, NULL);
+    if ( rc < 0 )
+        goto fail2;
+
+    sv->ioreq_evtchn = rc;
+
+    if ( v->vcpu_id == 0 && HANDLE_BUFIOREQ(s) )
+    {
+        rc = alloc_unbound_xen_event_channel(v->domain, 0,
+                                             s->emulator->domain_id, NULL);
+        if ( rc < 0 )
+            goto fail3;
+
+        s->bufioreq_evtchn = rc;
+    }
+
+    sv->vcpu = v;
+
+    list_add(&sv->list_entry, &s->ioreq_vcpu_list);
+
+    if ( s->enabled )
+        hvm_update_ioreq_evtchn(s, sv);
+
+    spin_unlock(&s->lock);
+    return 0;
+
+ fail3:
+    free_xen_event_channel(v->domain, sv->ioreq_evtchn);
+
+ fail2:
+    spin_unlock(&s->lock);
+    xfree(sv);
+
+ fail1:
+    return rc;
+}
+
+static void hvm_ioreq_server_remove_vcpu(struct hvm_ioreq_server *s,
+                                         struct vcpu *v)
+{
+    struct hvm_ioreq_vcpu *sv;
+
+    spin_lock(&s->lock);
+
+    list_for_each_entry ( sv,
+                          &s->ioreq_vcpu_list,
+                          list_entry )
+    {
+        if ( sv->vcpu != v )
+            continue;
+
+        list_del(&sv->list_entry);
+
+        if ( v->vcpu_id == 0 && HANDLE_BUFIOREQ(s) )
+            free_xen_event_channel(v->domain, s->bufioreq_evtchn);
+
+        free_xen_event_channel(v->domain, sv->ioreq_evtchn);
+
+        xfree(sv);
+        break;
+    }
+
+    spin_unlock(&s->lock);
+}
+
+static void hvm_ioreq_server_remove_all_vcpus(struct hvm_ioreq_server *s)
+{
+    struct hvm_ioreq_vcpu *sv, *next;
+
+    spin_lock(&s->lock);
+
+    list_for_each_entry_safe ( sv,
+                               next,
+                               &s->ioreq_vcpu_list,
+                               list_entry )
+    {
+        struct vcpu *v = sv->vcpu;
+
+        list_del(&sv->list_entry);
+
+        if ( v->vcpu_id == 0 && HANDLE_BUFIOREQ(s) )
+            free_xen_event_channel(v->domain, s->bufioreq_evtchn);
+
+        free_xen_event_channel(v->domain, sv->ioreq_evtchn);
+
+        xfree(sv);
+    }
+
+    spin_unlock(&s->lock);
+}
+
+static int hvm_ioreq_server_alloc_pages(struct hvm_ioreq_server *s)
+{
+    int rc;
+
+    rc = hvm_alloc_ioreq_mfn(s, false);
+
+    if ( !rc && (s->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF) )
+        rc = hvm_alloc_ioreq_mfn(s, true);
+
+    if ( rc )
+        hvm_free_ioreq_mfn(s, false);
+
+    return rc;
+}
+
+static void hvm_ioreq_server_free_pages(struct hvm_ioreq_server *s)
+{
+    hvm_free_ioreq_mfn(s, true);
+    hvm_free_ioreq_mfn(s, false);
+}
+
+static void hvm_ioreq_server_free_rangesets(struct hvm_ioreq_server *s)
+{
+    unsigned int i;
+
+    for ( i = 0; i < NR_IO_RANGE_TYPES; i++ )
+        rangeset_destroy(s->range[i]);
+}
+
+static int hvm_ioreq_server_alloc_rangesets(struct hvm_ioreq_server *s,
+                                            ioservid_t id)
+{
+    unsigned int i;
+    int rc;
+
+    for ( i = 0; i < NR_IO_RANGE_TYPES; i++ )
+    {
+        char *name;
+
+        rc = asprintf(&name, "ioreq_server %d %s", id,
+                      (i == XEN_DMOP_IO_RANGE_PORT) ? "port" :
+                      (i == XEN_DMOP_IO_RANGE_MEMORY) ? "memory" :
+                      (i == XEN_DMOP_IO_RANGE_PCI) ? "pci" :
+                      "");
+        if ( rc )
+            goto fail;
+
+        s->range[i] = rangeset_new(s->target, name,
+                                   RANGESETF_prettyprint_hex);
+
+        xfree(name);
+
+        rc = -ENOMEM;
+        if ( !s->range[i] )
+            goto fail;
+
+        rangeset_limit(s->range[i], MAX_NR_IO_RANGES);
+    }
+
+    return 0;
+
+ fail:
+    hvm_ioreq_server_free_rangesets(s);
+
+    return rc;
+}
+
+static void hvm_ioreq_server_enable(struct hvm_ioreq_server *s)
+{
+    struct hvm_ioreq_vcpu *sv;
+
+    spin_lock(&s->lock);
+
+    if ( s->enabled )
+        goto done;
+
+    arch_ioreq_server_enable(s);
+
+    s->enabled = true;
+
+    list_for_each_entry ( sv,
+                          &s->ioreq_vcpu_list,
+                          list_entry )
+        hvm_update_ioreq_evtchn(s, sv);
+
+  done:
+    spin_unlock(&s->lock);
+}
+
+static void hvm_ioreq_server_disable(struct hvm_ioreq_server *s)
+{
+    spin_lock(&s->lock);
+
+    if ( !s->enabled )
+        goto done;
+
+    arch_ioreq_server_disable(s);
+
+    s->enabled = false;
+
+ done:
+    spin_unlock(&s->lock);
+}
+
+static int hvm_ioreq_server_init(struct hvm_ioreq_server *s,
+                                 struct domain *d, int bufioreq_handling,
+                                 ioservid_t id)
+{
+    struct domain *currd = current->domain;
+    struct vcpu *v;
+    int rc;
+
+    s->target = d;
+
+    get_knownalive_domain(currd);
+    s->emulator = currd;
+
+    spin_lock_init(&s->lock);
+    INIT_LIST_HEAD(&s->ioreq_vcpu_list);
+    spin_lock_init(&s->bufioreq_lock);
+
+    s->ioreq.gfn = INVALID_GFN;
+    s->bufioreq.gfn = INVALID_GFN;
+
+    rc = hvm_ioreq_server_alloc_rangesets(s, id);
+    if ( rc )
+        return rc;
+
+    s->bufioreq_handling = bufioreq_handling;
+
+    for_each_vcpu ( d, v )
+    {
+        rc = hvm_ioreq_server_add_vcpu(s, v);
+        if ( rc )
+            goto fail_add;
+    }
+
+    return 0;
+
+ fail_add:
+    hvm_ioreq_server_remove_all_vcpus(s);
+    arch_ioreq_server_unmap_pages(s);
+
+    hvm_ioreq_server_free_rangesets(s);
+
+    put_domain(s->emulator);
+    return rc;
+}
+
+static void hvm_ioreq_server_deinit(struct hvm_ioreq_server *s)
+{
+    ASSERT(!s->enabled);
+    hvm_ioreq_server_remove_all_vcpus(s);
+
+    /*
+     * NOTE: It is safe to call both arch_ioreq_server_unmap_pages() and
+     *       hvm_ioreq_server_free_pages() in that order.
+     *       This is because the former will do nothing if the pages
+     *       are not mapped, leaving the page to be freed by the latter.
+     *       However if the pages are mapped then the former will set
+     *       the page_info pointer to NULL, meaning the latter will do
+     *       nothing.
+     */
+    arch_ioreq_server_unmap_pages(s);
+    hvm_ioreq_server_free_pages(s);
+
+    hvm_ioreq_server_free_rangesets(s);
+
+    put_domain(s->emulator);
+}
+
+int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
+                            ioservid_t *id)
+{
+    struct hvm_ioreq_server *s;
+    unsigned int i;
+    int rc;
+
+    if ( bufioreq_handling > HVM_IOREQSRV_BUFIOREQ_ATOMIC )
+        return -EINVAL;
+
+    s = xzalloc(struct hvm_ioreq_server);
+    if ( !s )
+        return -ENOMEM;
+
+    domain_pause(d);
+    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+
+    for ( i = 0; i < MAX_NR_IOREQ_SERVERS; i++ )
+    {
+        if ( !GET_IOREQ_SERVER(d, i) )
+            break;
+    }
+
+    rc = -ENOSPC;
+    if ( i >= MAX_NR_IOREQ_SERVERS )
+        goto fail;
+
+    /*
+     * It is safe to call set_ioreq_server() prior to
+     * hvm_ioreq_server_init() since the target domain is paused.
+     */
+    set_ioreq_server(d, i, s);
+
+    rc = hvm_ioreq_server_init(s, d, bufioreq_handling, i);
+    if ( rc )
+    {
+        set_ioreq_server(d, i, NULL);
+        goto fail;
+    }
+
+    if ( id )
+        *id = i;
+
+    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    domain_unpause(d);
+
+    return 0;
+
+ fail:
+    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    domain_unpause(d);
+
+    xfree(s);
+    return rc;
+}
+
+int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
+{
+    struct hvm_ioreq_server *s;
+    int rc;
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
+    domain_pause(d);
+
+    arch_ioreq_server_destroy(s);
+
+    hvm_ioreq_server_disable(s);
+
+    /*
+     * It is safe to call hvm_ioreq_server_deinit() prior to
+     * set_ioreq_server() since the target domain is paused.
+     */
+    hvm_ioreq_server_deinit(s);
+    set_ioreq_server(d, id, NULL);
+
+    domain_unpause(d);
+
+    xfree(s);
+
+    rc = 0;
+
+ out:
+    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+
+    return rc;
+}
+
+int hvm_get_ioreq_server_info(struct domain *d, ioservid_t id,
+                              unsigned long *ioreq_gfn,
+                              unsigned long *bufioreq_gfn,
+                              evtchn_port_t *bufioreq_port)
+{
+    struct hvm_ioreq_server *s;
+    int rc;
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
+    if ( ioreq_gfn || bufioreq_gfn )
+    {
+        rc = arch_ioreq_server_map_pages(s);
+        if ( rc )
+            goto out;
+    }
+
+    if ( ioreq_gfn )
+        *ioreq_gfn = gfn_x(s->ioreq.gfn);
+
+    if ( HANDLE_BUFIOREQ(s) )
+    {
+        if ( bufioreq_gfn )
+            *bufioreq_gfn = gfn_x(s->bufioreq.gfn);
+
+        if ( bufioreq_port )
+            *bufioreq_port = s->bufioreq_evtchn;
+    }
+
+    rc = 0;
+
+ out:
+    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+
+    return rc;
+}
+
+int hvm_get_ioreq_server_frame(struct domain *d, ioservid_t id,
+                               unsigned long idx, mfn_t *mfn)
+{
+    struct hvm_ioreq_server *s;
+    int rc;
+
+    ASSERT(is_hvm_domain(d));
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
+    rc = hvm_ioreq_server_alloc_pages(s);
+    if ( rc )
+        goto out;
+
+    switch ( idx )
+    {
+    case XENMEM_resource_ioreq_server_frame_bufioreq:
+        rc = -ENOENT;
+        if ( !HANDLE_BUFIOREQ(s) )
+            goto out;
+
+        *mfn = page_to_mfn(s->bufioreq.page);
+        rc = 0;
+        break;
+
+    case XENMEM_resource_ioreq_server_frame_ioreq(0):
+        *mfn = page_to_mfn(s->ioreq.page);
+        rc = 0;
+        break;
+
+    default:
+        rc = -EINVAL;
+        break;
+    }
+
+ out:
+    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+
+    return rc;
+}
+
+int hvm_map_io_range_to_ioreq_server(struct domain *d, ioservid_t id,
+                                     uint32_t type, uint64_t start,
+                                     uint64_t end)
+{
+    struct hvm_ioreq_server *s;
+    struct rangeset *r;
+    int rc;
+
+    if ( start > end )
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
+    switch ( type )
+    {
+    case XEN_DMOP_IO_RANGE_PORT:
+    case XEN_DMOP_IO_RANGE_MEMORY:
+    case XEN_DMOP_IO_RANGE_PCI:
+        r = s->range[type];
+        break;
+
+    default:
+        r = NULL;
+        break;
+    }
+
+    rc = -EINVAL;
+    if ( !r )
+        goto out;
+
+    rc = -EEXIST;
+    if ( rangeset_overlaps_range(r, start, end) )
+        goto out;
+
+    rc = rangeset_add_range(r, start, end);
+
+ out:
+    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+
+    return rc;
+}
+
+int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
+                                         uint32_t type, uint64_t start,
+                                         uint64_t end)
+{
+    struct hvm_ioreq_server *s;
+    struct rangeset *r;
+    int rc;
+
+    if ( start > end )
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
+    switch ( type )
+    {
+    case XEN_DMOP_IO_RANGE_PORT:
+    case XEN_DMOP_IO_RANGE_MEMORY:
+    case XEN_DMOP_IO_RANGE_PCI:
+        r = s->range[type];
+        break;
+
+    default:
+        r = NULL;
+        break;
+    }
+
+    rc = -EINVAL;
+    if ( !r )
+        goto out;
+
+    rc = -ENOENT;
+    if ( !rangeset_contains_range(r, start, end) )
+        goto out;
+
+    rc = rangeset_remove_range(r, start, end);
+
+ out:
+    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+
+    return rc;
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
+int hvm_map_mem_type_to_ioreq_server(struct domain *d, ioservid_t id,
+                                     uint32_t type, uint32_t flags)
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
+    rc = arch_ioreq_server_map_mem_type(d, s, flags);
+
+ out:
+    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+
+    return rc;
+}
+
+int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
+                               bool enabled)
+{
+    struct hvm_ioreq_server *s;
+    int rc;
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
+    domain_pause(d);
+
+    if ( enabled )
+        hvm_ioreq_server_enable(s);
+    else
+        hvm_ioreq_server_disable(s);
+
+    domain_unpause(d);
+
+    rc = 0;
+
+ out:
+    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+    return rc;
+}
+
+int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v)
+{
+    struct hvm_ioreq_server *s;
+    unsigned int id;
+    int rc;
+
+    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+
+    FOR_EACH_IOREQ_SERVER(d, id, s)
+    {
+        rc = hvm_ioreq_server_add_vcpu(s, v);
+        if ( rc )
+            goto fail;
+    }
+
+    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+
+    return 0;
+
+ fail:
+    while ( ++id != MAX_NR_IOREQ_SERVERS )
+    {
+        s = GET_IOREQ_SERVER(d, id);
+
+        if ( !s )
+            continue;
+
+        hvm_ioreq_server_remove_vcpu(s, v);
+    }
+
+    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+
+    return rc;
+}
+
+void hvm_all_ioreq_servers_remove_vcpu(struct domain *d, struct vcpu *v)
+{
+    struct hvm_ioreq_server *s;
+    unsigned int id;
+
+    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+
+    FOR_EACH_IOREQ_SERVER(d, id, s)
+        hvm_ioreq_server_remove_vcpu(s, v);
+
+    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
+}
+
+void hvm_destroy_all_ioreq_servers(struct domain *d)
+{
+    struct hvm_ioreq_server *s;
+    unsigned int id;
+
+    if ( !arch_ioreq_server_destroy_all(d) )
+        return;
+
+    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
+
+    /* No need to domain_pause() as the domain is being torn down */
+
+    FOR_EACH_IOREQ_SERVER(d, id, s)
+    {
+        hvm_ioreq_server_disable(s);
+
+        /*
+         * It is safe to call hvm_ioreq_server_deinit() prior to
+         * set_ioreq_server() since the target domain is being destroyed.
+         */
+        hvm_ioreq_server_deinit(s);
+        set_ioreq_server(d, id, NULL);
+
+        xfree(s);
+    }
+
+    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
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
+    if ( arch_ioreq_server_get_type_addr(d, p, &type, &addr) )
+        return NULL;
+
+    FOR_EACH_IOREQ_SERVER(d, id, s)
+    {
+        struct rangeset *r;
+
+        if ( !s->enabled )
+            continue;
+
+        r = s->range[type];
+
+        switch ( type )
+        {
+            unsigned long start, end;
+
+        case XEN_DMOP_IO_RANGE_PORT:
+            start = addr;
+            end = start + p->size - 1;
+            if ( rangeset_contains_range(r, start, end) )
+                return s;
+
+            break;
+
+        case XEN_DMOP_IO_RANGE_MEMORY:
+            start = hvm_mmio_first_byte(p);
+            end = hvm_mmio_last_byte(p);
+
+            if ( rangeset_contains_range(r, start, end) )
+                return s;
+
+            break;
+
+        case XEN_DMOP_IO_RANGE_PCI:
+            if ( rangeset_contains_singleton(r, addr >> 32) )
+            {
+                p->type = IOREQ_TYPE_PCI_CONFIG;
+                p->addr = addr;
+                return s;
+            }
+
+            break;
+        }
+    }
+
+    return NULL;
+}
+
+static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
+{
+    struct domain *d = current->domain;
+    struct hvm_ioreq_page *iorp;
+    buffered_iopage_t *pg;
+    buf_ioreq_t bp = { .data = p->data,
+                       .addr = p->addr,
+                       .type = p->type,
+                       .dir = p->dir };
+    /* Timeoffset sends 64b data, but no address. Use two consecutive slots. */
+    int qw = 0;
+
+    /* Ensure buffered_iopage fits in a page */
+    BUILD_BUG_ON(sizeof(buffered_iopage_t) > PAGE_SIZE);
+
+    iorp = &s->bufioreq;
+    pg = iorp->va;
+
+    if ( !pg )
+        return IOREQ_STATUS_UNHANDLED;
+
+    /*
+     * Return 0 for the cases we can't deal with:
+     *  - 'addr' is only a 20-bit field, so we cannot address beyond 1MB
+     *  - we cannot buffer accesses to guest memory buffers, as the guest
+     *    may expect the memory buffer to be synchronously accessed
+     *  - the count field is usually used with data_is_ptr and since we don't
+     *    support data_is_ptr we do not waste space for the count field either
+     */
+    if ( (p->addr > 0xffffful) || p->data_is_ptr || (p->count != 1) )
+        return 0;
+
+    switch ( p->size )
+    {
+    case 1:
+        bp.size = 0;
+        break;
+    case 2:
+        bp.size = 1;
+        break;
+    case 4:
+        bp.size = 2;
+        break;
+    case 8:
+        bp.size = 3;
+        qw = 1;
+        break;
+    default:
+        gdprintk(XENLOG_WARNING, "unexpected ioreq size: %u\n", p->size);
+        return IOREQ_STATUS_UNHANDLED;
+    }
+
+    spin_lock(&s->bufioreq_lock);
+
+    if ( (pg->ptrs.write_pointer - pg->ptrs.read_pointer) >=
+         (IOREQ_BUFFER_SLOT_NUM - qw) )
+    {
+        /* The queue is full: send the iopacket through the normal path. */
+        spin_unlock(&s->bufioreq_lock);
+        return IOREQ_STATUS_UNHANDLED;
+    }
+
+    pg->buf_ioreq[pg->ptrs.write_pointer % IOREQ_BUFFER_SLOT_NUM] = bp;
+
+    if ( qw )
+    {
+        bp.data = p->data >> 32;
+        pg->buf_ioreq[(pg->ptrs.write_pointer+1) % IOREQ_BUFFER_SLOT_NUM] = bp;
+    }
+
+    /* Make the ioreq_t visible /before/ write_pointer. */
+    smp_wmb();
+    pg->ptrs.write_pointer += qw ? 2 : 1;
+
+    /* Canonicalize read/write pointers to prevent their overflow. */
+    while ( (s->bufioreq_handling == HVM_IOREQSRV_BUFIOREQ_ATOMIC) &&
+            qw++ < IOREQ_BUFFER_SLOT_NUM &&
+            pg->ptrs.read_pointer >= IOREQ_BUFFER_SLOT_NUM )
+    {
+        union bufioreq_pointers old = pg->ptrs, new;
+        unsigned int n = old.read_pointer / IOREQ_BUFFER_SLOT_NUM;
+
+        new.read_pointer = old.read_pointer - n * IOREQ_BUFFER_SLOT_NUM;
+        new.write_pointer = old.write_pointer - n * IOREQ_BUFFER_SLOT_NUM;
+        cmpxchg(&pg->ptrs.full, old.full, new.full);
+    }
+
+    notify_via_xen_event_channel(d, s->bufioreq_evtchn);
+    spin_unlock(&s->bufioreq_lock);
+
+    return IOREQ_STATUS_HANDLED;
+}
+
+int hvm_send_ioreq(struct hvm_ioreq_server *s, ioreq_t *proto_p,
+                   bool buffered)
+{
+    struct vcpu *curr = current;
+    struct domain *d = curr->domain;
+    struct hvm_ioreq_vcpu *sv;
+
+    ASSERT(s);
+
+    if ( buffered )
+        return hvm_send_buffered_ioreq(s, proto_p);
+
+    if ( unlikely(!vcpu_start_shutdown_deferral(curr)) )
+        return IOREQ_STATUS_RETRY;
+
+    list_for_each_entry ( sv,
+                          &s->ioreq_vcpu_list,
+                          list_entry )
+    {
+        if ( sv->vcpu == curr )
+        {
+            evtchn_port_t port = sv->ioreq_evtchn;
+            ioreq_t *p = get_ioreq(s, curr);
+
+            if ( unlikely(p->state != STATE_IOREQ_NONE) )
+            {
+                gprintk(XENLOG_ERR, "device model set bad IO state %d\n",
+                        p->state);
+                break;
+            }
+
+            if ( unlikely(p->vp_eport != port) )
+            {
+                gprintk(XENLOG_ERR, "device model set bad event channel %d\n",
+                        p->vp_eport);
+                break;
+            }
+
+            proto_p->state = STATE_IOREQ_NONE;
+            proto_p->vp_eport = port;
+            *p = *proto_p;
+
+            prepare_wait_on_xen_event_channel(port);
+
+            /*
+             * Following happens /after/ blocking and setting up ioreq
+             * contents. prepare_wait_on_xen_event_channel() is an implicit
+             * barrier.
+             */
+            p->state = STATE_IOREQ_READY;
+            notify_via_xen_event_channel(d, port);
+
+            sv->pending = true;
+            return IOREQ_STATUS_RETRY;
+        }
+    }
+
+    return IOREQ_STATUS_UNHANDLED;
+}
+
+unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered)
+{
+    struct domain *d = current->domain;
+    struct hvm_ioreq_server *s;
+    unsigned int id, failed = 0;
+
+    FOR_EACH_IOREQ_SERVER(d, id, s)
+    {
+        if ( !s->enabled )
+            continue;
+
+        if ( hvm_send_ioreq(s, p, buffered) == IOREQ_STATUS_UNHANDLED )
+            failed++;
+    }
+
+    return failed;
+}
+
+void hvm_ioreq_init(struct domain *d)
+{
+    spin_lock_init(&d->arch.hvm.ioreq_server.lock);
+
+    arch_ioreq_domain_init(d);
+}
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
diff --git a/xen/include/asm-x86/hvm/ioreq.h b/xen/include/asm-x86/hvm/ioreq.h
index c7563e1..ab2f3f8 100644
--- a/xen/include/asm-x86/hvm/ioreq.h
+++ b/xen/include/asm-x86/hvm/ioreq.h
@@ -19,8 +19,7 @@
 #ifndef __ASM_X86_HVM_IOREQ_H__
 #define __ASM_X86_HVM_IOREQ_H__
 
-#define HANDLE_BUFIOREQ(s) \
-    ((s)->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF)
+#include <xen/ioreq.h>
 
 bool arch_vcpu_ioreq_completion(enum hvm_io_completion io_completion);
 int arch_ioreq_server_map_pages(struct hvm_ioreq_server *s);
@@ -38,42 +37,6 @@ int arch_ioreq_server_get_type_addr(const struct domain *d,
                                     uint64_t *addr);
 void arch_ioreq_domain_init(struct domain *d);
 
-bool hvm_io_pending(struct vcpu *v);
-bool handle_hvm_io_completion(struct vcpu *v);
-bool is_ioreq_server_page(struct domain *d, const struct page_info *page);
-
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
-                                     uint32_t type, uint64_t start,
-                                     uint64_t end);
-int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
-                                         uint32_t type, uint64_t start,
-                                         uint64_t end);
-int hvm_map_mem_type_to_ioreq_server(struct domain *d, ioservid_t id,
-                                     uint32_t type, uint32_t flags);
-int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
-                               bool enabled);
-
-int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v);
-void hvm_all_ioreq_servers_remove_vcpu(struct domain *d, struct vcpu *v);
-void hvm_destroy_all_ioreq_servers(struct domain *d);
-
-struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
-                                                 ioreq_t *p);
-int hvm_send_ioreq(struct hvm_ioreq_server *s, ioreq_t *proto_p,
-                   bool buffered);
-unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered);
-
-void hvm_ioreq_init(struct domain *d);
-
 bool ioreq_complete_mmio(void);
 
 #define IOREQ_STATUS_HANDLED     X86EMUL_OKAY
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
new file mode 100644
index 0000000..ad47c61
--- /dev/null
+++ b/xen/include/xen/ioreq.h
@@ -0,0 +1,73 @@
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
+bool hvm_io_pending(struct vcpu *v);
+bool handle_hvm_io_completion(struct vcpu *v);
+bool is_ioreq_server_page(struct domain *d, const struct page_info *page);
+
+int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
+                            ioservid_t *id);
+int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id);
+int hvm_get_ioreq_server_info(struct domain *d, ioservid_t id,
+                              unsigned long *ioreq_gfn,
+                              unsigned long *bufioreq_gfn,
+                              evtchn_port_t *bufioreq_port);
+int hvm_get_ioreq_server_frame(struct domain *d, ioservid_t id,
+                               unsigned long idx, mfn_t *mfn);
+int hvm_map_io_range_to_ioreq_server(struct domain *d, ioservid_t id,
+                                     uint32_t type, uint64_t start,
+                                     uint64_t end);
+int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
+                                         uint32_t type, uint64_t start,
+                                         uint64_t end);
+int hvm_map_mem_type_to_ioreq_server(struct domain *d, ioservid_t id,
+                                     uint32_t type, uint32_t flags);
+int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
+                               bool enabled);
+
+int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v);
+void hvm_all_ioreq_servers_remove_vcpu(struct domain *d, struct vcpu *v);
+void hvm_destroy_all_ioreq_servers(struct domain *d);
+
+struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
+                                                 ioreq_t *p);
+int hvm_send_ioreq(struct hvm_ioreq_server *s, ioreq_t *proto_p,
+                   bool buffered);
+unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered);
+
+void hvm_ioreq_init(struct domain *d);
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


