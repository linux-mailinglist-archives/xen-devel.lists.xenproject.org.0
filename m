Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD7D50689F
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 12:19:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307986.523440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngkwj-000801-GB; Tue, 19 Apr 2022 10:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307986.523440; Tue, 19 Apr 2022 10:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngkwj-0007x5-Cq; Tue, 19 Apr 2022 10:18:57 +0000
Received: by outflank-mailman (input) for mailman id 307986;
 Tue, 19 Apr 2022 10:18:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Io9b=U5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ngkwh-0007wz-Ny
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 10:18:55 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d9d986b-bfca-11ec-8fbe-03012f2f19d4;
 Tue, 19 Apr 2022 12:18:54 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0F8AE1F38D;
 Tue, 19 Apr 2022 10:18:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B9A3F139BE;
 Tue, 19 Apr 2022 10:18:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 26m7K42MXmKFLAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 19 Apr 2022 10:18:53 +0000
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
X-Inumbo-ID: 1d9d986b-bfca-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650363534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=v0gLa5Y6O/P0/0TgCgwdis7Q/sd27l3CARbbhyx3ybA=;
	b=rxbKx9DmOjNjtcqeYKjgoGD6jNWse7Ro5GquN5m+ylvHS0BTI7vRvJQk1lCRB0HnxTdeDr
	qn1ZS+kRrKJihML5GWKtqB44m+UqjyTn/LuhDVaWAQLJuCV8BWaAK2+M0f3EHZFw6qPbqz
	I/Ymxsk3ceKee8G4fky4hxR7fdo2Kw8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Cheyenne Wills <cheyenne.wills@gmail.com>
Subject: [PATCH v2] xen: fix XEN_DOMCTL_gdbsx_guestmemio crash
Date: Tue, 19 Apr 2022 12:18:50 +0200
Message-Id: <20220419101850.3045-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A hypervisor built without CONFIG_GDBSX will crash in case the
XEN_DOMCTL_gdbsx_guestmemio domctl is being called, as the call will
end up in iommu_do_domctl() with d == NULL:

(XEN) CPU:    6
(XEN) RIP:    e008:[<ffff82d040269984>] iommu_do_domctl+0x4/0x30
(XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d0v0)
(XEN) rax: 00000000000003e8   rbx: ffff830856277ef8   rcx: ffff830856277fff
...
(XEN) Xen call trace:
(XEN)    [<ffff82d040269984>] R iommu_do_domctl+0x4/0x30
(XEN)    [<ffff82d04035cd5f>] S arch_do_domctl+0x7f/0x2330
(XEN)    [<ffff82d040239e46>] S do_domctl+0xe56/0x1930
(XEN)    [<ffff82d040238ff0>] S do_domctl+0/0x1930
(XEN)    [<ffff82d0402f8c59>] S pv_hypercall+0x99/0x110
(XEN)    [<ffff82d0402f5161>] S arch/x86/pv/domain.c#_toggle_guest_pt+0x11/0x90
(XEN)    [<ffff82d040366288>] S lstar_enter+0x128/0x130
(XEN)
(XEN) Pagetable walk from 0000000000000144:
(XEN)  L4[0x000] = 0000000000000000 ffffffffffffffff
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 6:
(XEN) FATAL PAGE FAULT
(XEN) [error_code=0000]
(XEN) Faulting linear address: 0000000000000144

Fix this issue by modifying the interface of gdbsx_guest_mem_io() to
take the already known domain pointer instead of the domid.

Reported-by: Cheyenne Wills <cheyenne.wills@gmail.com>
Fixes: e726a82ca0dc ("xen: make gdbsx support configurable")
Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- use gdbsx_guest_mem_io() interface modification (Jan Beulich)
---
 xen/arch/x86/debug.c                | 10 ++--------
 xen/arch/x86/domctl.c               |  6 +++---
 xen/arch/x86/include/asm/debugger.h |  2 +-
 xen/common/domctl.c                 |  1 -
 4 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/debug.c b/xen/arch/x86/debug.c
index d90dc93056..c0dd6eaf15 100644
--- a/xen/arch/x86/debug.c
+++ b/xen/arch/x86/debug.c
@@ -159,17 +159,11 @@ static unsigned int dbg_rw_guest_mem(struct domain *dp, unsigned long addr,
  * Returns: number of bytes remaining to be copied.
  */
 unsigned int dbg_rw_mem(unsigned long gva, XEN_GUEST_HANDLE_PARAM(void) buf,
-                        unsigned int len, domid_t domid, bool toaddr,
+                        unsigned int len, struct domain *d, bool toaddr,
                         uint64_t pgd3)
 {
-    struct domain *d = rcu_lock_domain_by_id(domid);
-
-    if ( d )
-    {
-        if ( !d->is_dying )
+    if ( d && !d->is_dying )
             len = dbg_rw_guest_mem(d, gva, buf, len, toaddr, pgd3);
-        rcu_unlock_domain(d);
-    }
 
     return len;
 }
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index e49f9e91b9..a6aae500a3 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -38,10 +38,10 @@
 #include <asm/cpuid.h>
 
 #ifdef CONFIG_GDBSX
-static int gdbsx_guest_mem_io(domid_t domid, struct xen_domctl_gdbsx_memio *iop)
+static int gdbsx_guest_mem_io(struct domain *d, struct xen_domctl_gdbsx_memio *iop)
 {
     iop->remain = dbg_rw_mem(iop->gva, guest_handle_from_ptr(iop->uva, void),
-                             iop->len, domid, iop->gwr, iop->pgd3val);
+                             iop->len, d, iop->gwr, iop->pgd3val);
 
     return iop->remain ? -EFAULT : 0;
 }
@@ -828,7 +828,7 @@ long arch_do_domctl(
 #ifdef CONFIG_GDBSX
     case XEN_DOMCTL_gdbsx_guestmemio:
         domctl->u.gdbsx_guest_memio.remain = domctl->u.gdbsx_guest_memio.len;
-        ret = gdbsx_guest_mem_io(domctl->domain, &domctl->u.gdbsx_guest_memio);
+        ret = gdbsx_guest_mem_io(d, &domctl->u.gdbsx_guest_memio);
         if ( !ret )
            copyback = true;
         break;
diff --git a/xen/arch/x86/include/asm/debugger.h b/xen/arch/x86/include/asm/debugger.h
index 99803bfd0c..221bcde137 100644
--- a/xen/arch/x86/include/asm/debugger.h
+++ b/xen/arch/x86/include/asm/debugger.h
@@ -94,7 +94,7 @@ static inline bool debugger_trap_entry(
 
 #ifdef CONFIG_GDBSX
 unsigned int dbg_rw_mem(unsigned long gva, XEN_GUEST_HANDLE_PARAM(void) buf,
-                        unsigned int len, domid_t domid, bool toaddr,
+                        unsigned int len, struct domain *d, bool toaddr,
                         uint64_t pgd3);
 #endif
 
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 57135d4478..5879117580 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -308,7 +308,6 @@ long cf_check do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         if ( op->domain == DOMID_INVALID )
         {
     case XEN_DOMCTL_createdomain:
-    case XEN_DOMCTL_gdbsx_guestmemio:
             d = NULL;
             break;
         }
-- 
2.34.1


