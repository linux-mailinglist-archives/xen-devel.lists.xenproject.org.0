Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E120D2E1F80
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 17:35:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58499.102954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks76Y-0000bS-Ka; Wed, 23 Dec 2020 16:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58499.102954; Wed, 23 Dec 2020 16:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks76Y-0000ah-EK; Wed, 23 Dec 2020 16:35:14 +0000
Received: by outflank-mailman (input) for mailman id 58499;
 Wed, 23 Dec 2020 16:35:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ifz=F3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ks76X-0000XE-4c
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 16:35:13 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82065b73-4d16-402a-9a87-7c23b59efd32;
 Wed, 23 Dec 2020 16:35:08 +0000 (UTC)
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
X-Inumbo-ID: 82065b73-4d16-402a-9a87-7c23b59efd32
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608741308;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=42LWWIePVgGkbX3Yus9uh6xAtV4+wGHkGPht/iiTXv4=;
  b=d3IJCzKpSYRBh/EBrlOTi0sysJTLn9hALLtbC6AVLQti0Bo31RIoqoIq
   P6xVbB/6nyPCBD+yCqh2a0y8gXoet8h09sjICAN8agpjMurQBMNjBKCBs
   nfxsl2mIhsajLTJymLm6QvsTn9uAvKfrYc0mE6PNhysnQkflI6x+KADRM
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 3aDH0fJboDmcJbf6DmZfaG4XpFr1I5ipdPzKHgk9P9ywXPB3915v9EjoBreoYaYuz4HLmkPV6h
 q1GBABUPhd9XylP9+OhOcMqkoIy3T71dOs826xG0Iy3nPEhjyRPJYgRNWrpDd98erssun9eGP3
 XES3Fr3R4v9ZjTXaeSMBCwM8XtMtAV8q+cVkeku0Hh33H9DP68hsedrpwhIcsXmalQFSx6Yovv
 J9UMdJEJ5GT6N0E9NwYBb5dMAbTsQAkM2LG5lqv4MjJLs28rUNq6rkt/QrnIfS2baIY4TPWgSZ
 des=
X-SBRS: 5.2
X-MesageID: 33881652
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,441,1599537600"; 
   d="scan'208";a="33881652"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH 3/4] xen/domctl: Introduce fault_ttl
Date: Wed, 23 Dec 2020 16:34:41 +0000
Message-ID: <20201223163442.8840-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201223163442.8840-1-andrew.cooper3@citrix.com>
References: <20201223163442.8840-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

To inject a simulated resource failure, for testing purposes.

Given a specific set of hypercall parameters, the failure is in a repeatable
position, for the currently booted Xen.  The exact position of failures is
highly dependent on the build of Xen, and hardware support.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Tamas K Lengyel <tamas@tklengyel.com>

RFC:
 * Probably wants to be Kconfig'd
 * I'm thinking of dropping handle from xen_domctl_createdomain because it's a
   waste of valuable space.
---
 xen/common/dmalloc.c        | 8 +++++++-
 xen/common/domain.c         | 8 ++++++--
 xen/include/public/domctl.h | 1 +
 xen/include/xen/sched.h     | 1 +
 4 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/xen/common/dmalloc.c b/xen/common/dmalloc.c
index e3a0e546c2..1f5d0f5627 100644
--- a/xen/common/dmalloc.c
+++ b/xen/common/dmalloc.c
@@ -10,7 +10,13 @@ void dfree(struct domain *d, void *ptr)
 
 void *_dzalloc(struct domain *d, size_t size, size_t align)
 {
-    void *ptr = _xmalloc(size, align);
+    void *ptr;
+
+    if ( atomic_read(&d->fault_ttl) &&
+         atomic_dec_and_test(&d->fault_ttl) )
+        return NULL;
+
+    ptr = _xmalloc(size, align);
 
     if ( ptr )
         atomic_inc(&d->dalloc_heap);
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 1db1c0e70a..cd73321980 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -427,14 +427,18 @@ struct domain *domain_create(domid_t domid,
     if ( (d = alloc_domain_struct()) == NULL )
         return ERR_PTR(-ENOMEM);
 
-    d->options = config ? config->flags : 0;
-
     /* Sort out our idea of is_system_domain(). */
     d->domain_id = domid;
 
     /* Debug sanity. */
     ASSERT(is_system_domain(d) ? config == NULL : config != NULL);
 
+    if ( config )
+    {
+        d->options = config->flags;
+        atomic_set(&d->fault_ttl, config->fault_ttl);
+    }
+
     /* Sort out our idea of is_control_domain(). */
     d->is_privileged = is_priv;
 
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 666aeb71bf..aaa3d66616 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -48,6 +48,7 @@
 /* XEN_DOMCTL_createdomain */
 struct xen_domctl_createdomain {
     /* IN parameters */
+    uint32_t fault_ttl;
     uint32_t ssidref;
     xen_domain_handle_t handle;
  /* Is this an HVM guest (as opposed to a PV guest)? */
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 8ed8b55a1e..620a9f20e5 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -349,6 +349,7 @@ struct domain
     atomic_t         shr_pages;         /* shared pages */
     atomic_t         paged_pages;       /* paged-out pages */
 
+    atomic_t         fault_ttl;         /* Time until a simulated resource failure. */
     atomic_t         dalloc_heap;       /* Number of xmalloc-like allocations. */
 
     /* Scheduling. */
-- 
2.11.0


