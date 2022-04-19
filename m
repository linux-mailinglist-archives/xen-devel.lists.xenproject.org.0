Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F876506EFC
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 15:53:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308147.523715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngoHt-0003vp-0B; Tue, 19 Apr 2022 13:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308147.523715; Tue, 19 Apr 2022 13:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngoHs-0003q8-Pl; Tue, 19 Apr 2022 13:53:00 +0000
Received: by outflank-mailman (input) for mailman id 308147;
 Tue, 19 Apr 2022 13:52:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Io9b=U5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ngoHr-0003n9-94
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 13:52:59 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0515609d-bfe8-11ec-8fbe-03012f2f19d4;
 Tue, 19 Apr 2022 15:52:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DA6AA1F74E;
 Tue, 19 Apr 2022 13:52:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A1228132E7;
 Tue, 19 Apr 2022 13:52:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ANwbJrm+XmL/EgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 19 Apr 2022 13:52:57 +0000
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
X-Inumbo-ID: 0515609d-bfe8-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650376377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L4AQsF0qS2f7XQ0Ro2SIxitX/SjtNc2JqVh6FUtqIEw=;
	b=Sn0cIqdU25k6LU5Xq0tjR2hNggQ5idFBTMTSHFb+cdV+iAVHw9HqsRzQXjwQOgTo/IjHp2
	mKKdgfoqSLEkghtzRl8Ofx1m0E1oyO37SLK9kQl0v+reN9mAZuDMSW0MAW6inV0DGa0pZ1
	5IlCxWRRiDk3vcreY8Oq7bfA9rG1yk8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/3] xen: cleanup gdbsx_guest_mem_io() call
Date: Tue, 19 Apr 2022 15:52:53 +0200
Message-Id: <20220419135254.21729-3-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220419135254.21729-1-jgross@suse.com>
References: <20220419135254.21729-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify the gdbsx_guest_mem_io() interface to take the already known
domain pointer as parameter instead of the domid. This enables to
remove some more code further down the call tree.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- split off from previous patch (Andrew Cooper)
---
 xen/arch/x86/debug.c                | 12 +++---------
 xen/arch/x86/domctl.c               |  6 +++---
 xen/arch/x86/include/asm/debugger.h |  2 +-
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/debug.c b/xen/arch/x86/debug.c
index d90dc93056..62fbabb084 100644
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
-            len = dbg_rw_guest_mem(d, gva, buf, len, toaddr, pgd3);
-        rcu_unlock_domain(d);
-    }
+    if ( d && !d->is_dying )
+        len = dbg_rw_guest_mem(d, gva, buf, len, toaddr, pgd3);
 
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
 
-- 
2.34.1


