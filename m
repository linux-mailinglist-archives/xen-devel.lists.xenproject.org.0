Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 163E287B872
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 08:21:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692894.1080552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfOW-0006aW-Ty; Thu, 14 Mar 2024 07:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692894.1080552; Thu, 14 Mar 2024 07:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfOW-0006Y9-PG; Thu, 14 Mar 2024 07:20:52 +0000
Received: by outflank-mailman (input) for mailman id 692894;
 Thu, 14 Mar 2024 07:20:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CDQ4=KU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rkfOU-0005cd-WE
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 07:20:51 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 623eb253-e1d3-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 08:20:50 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6480F1F801;
 Thu, 14 Mar 2024 07:20:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E7ECB13977;
 Thu, 14 Mar 2024 07:20:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id nmnrNlCl8mVIDgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 14 Mar 2024 07:20:48 +0000
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
X-Inumbo-ID: 623eb253-e1d3-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1710400849; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FVq2Hhj4vgnKxymRlgvuDk+/88ycU3FDdi3C03ffSSU=;
	b=LSj85bTVer0Yyv4TshSUyjWTfE2y5k/eAAEuirfoBmlJ8JkQt9Nq9d2XFIuYPWbUOWnpd8
	wLUqj/svIK5VFADn7nOP3h5T48gWU3zM8JDh0KyIxx2Ah8MZZ5+3MkWm2Cs5+g6lWqVD0w
	vWCJs0tLIOX2UDoGxaViRCBfMFJQEh0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1710400849; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FVq2Hhj4vgnKxymRlgvuDk+/88ycU3FDdi3C03ffSSU=;
	b=LSj85bTVer0Yyv4TshSUyjWTfE2y5k/eAAEuirfoBmlJ8JkQt9Nq9d2XFIuYPWbUOWnpd8
	wLUqj/svIK5VFADn7nOP3h5T48gWU3zM8JDh0KyIxx2Ah8MZZ5+3MkWm2Cs5+g6lWqVD0w
	vWCJs0tLIOX2UDoGxaViRCBfMFJQEh0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v5 03/13] xen/spinlock: rename recursive lock functions
Date: Thu, 14 Mar 2024 08:20:19 +0100
Message-Id: <20240314072029.16937-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240314072029.16937-1-jgross@suse.com>
References: <20240314072029.16937-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=LSj85bTV
X-Spamd-Result: default: False [-1.81 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 URIBL_BLOCKED(0.00)[suse.com:email,suse.com:dkim];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_TWELVE(0.00)[15];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:106:10:150:64:167:received];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: -1.81
X-Rspamd-Queue-Id: 6480F1F801
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Rename the recursive spin_lock() functions by replacing the trailing
"_recursive" with a leading "r".

Switch the parameter to be a pointer to rspinlock_t.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
V2:
- new patch
V5:
- let rspin_trylock() return bool (Jan Beulich)
- keep inline/macro layer
---
 xen/arch/arm/domain.c         |  4 +--
 xen/arch/x86/domain.c         |  8 +++---
 xen/arch/x86/mm/mem_sharing.c |  8 +++---
 xen/arch/x86/mm/mm-locks.h    |  4 +--
 xen/common/ioreq.c            | 52 +++++++++++++++++------------------
 xen/common/page_alloc.c       | 12 ++++----
 xen/common/spinlock.c         | 12 ++++----
 xen/drivers/char/console.c    | 12 ++++----
 xen/drivers/passthrough/pci.c |  4 +--
 xen/include/xen/sched.h       |  4 +--
 xen/include/xen/spinlock.h    | 18 ++++++------
 11 files changed, 68 insertions(+), 70 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 5e7a7f3e7e..f38cb5e04c 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -987,7 +987,7 @@ static int relinquish_memory(struct domain *d, struct page_list_head *list)
     int               ret = 0;
 
     /* Use a recursive lock, as we may enter 'free_domheap_page'. */
-    spin_lock_recursive(&d->page_alloc_lock);
+    rspin_lock(&d->page_alloc_lock);
 
     page_list_for_each_safe( page, tmp, list )
     {
@@ -1014,7 +1014,7 @@ static int relinquish_memory(struct domain *d, struct page_list_head *list)
     }
 
   out:
-    spin_unlock_recursive(&d->page_alloc_lock);
+    rspin_unlock(&d->page_alloc_lock);
     return ret;
 }
 
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index bda853e3c9..a11c55f921 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1323,7 +1323,7 @@ int arch_set_info_guest(
         {
             bool done = false;
 
-            spin_lock_recursive(&d->page_alloc_lock);
+            rspin_lock(&d->page_alloc_lock);
 
             for ( i = 0; ; )
             {
@@ -1344,7 +1344,7 @@ int arch_set_info_guest(
                     break;
             }
 
-            spin_unlock_recursive(&d->page_alloc_lock);
+            rspin_unlock(&d->page_alloc_lock);
 
             if ( !done )
                 return -ERESTART;
@@ -2183,7 +2183,7 @@ static int relinquish_memory(
     int               ret = 0;
 
     /* Use a recursive lock, as we may enter 'free_domheap_page'. */
-    spin_lock_recursive(&d->page_alloc_lock);
+    rspin_lock(&d->page_alloc_lock);
 
     while ( (page = page_list_remove_head(list)) )
     {
@@ -2324,7 +2324,7 @@ static int relinquish_memory(
     page_list_move(list, &d->arch.relmem_list);
 
  out:
-    spin_unlock_recursive(&d->page_alloc_lock);
+    rspin_unlock(&d->page_alloc_lock);
     return ret;
 }
 
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index fe299a2bf9..f58576c702 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -682,7 +682,7 @@ static int page_make_sharable(struct domain *d,
     int rc = 0;
     bool drop_dom_ref = false;
 
-    spin_lock_recursive(&d->page_alloc_lock);
+    rspin_lock(&d->page_alloc_lock);
 
     if ( d->is_dying )
     {
@@ -725,7 +725,7 @@ static int page_make_sharable(struct domain *d,
     }
 
 out:
-    spin_unlock_recursive(&d->page_alloc_lock);
+    rspin_unlock(&d->page_alloc_lock);
 
     if ( drop_dom_ref )
         put_domain(d);
@@ -1936,7 +1936,7 @@ int mem_sharing_fork_reset(struct domain *d, bool reset_state,
         goto state;
 
     /* need recursive lock because we will free pages */
-    spin_lock_recursive(&d->page_alloc_lock);
+    rspin_lock(&d->page_alloc_lock);
     page_list_for_each_safe(page, tmp, &d->page_list)
     {
         shr_handle_t sh;
@@ -1965,7 +1965,7 @@ int mem_sharing_fork_reset(struct domain *d, bool reset_state,
         put_page_alloc_ref(page);
         put_page_and_type(page);
     }
-    spin_unlock_recursive(&d->page_alloc_lock);
+    rspin_unlock(&d->page_alloc_lock);
 
  state:
     if ( reset_state )
diff --git a/xen/arch/x86/mm/mm-locks.h b/xen/arch/x86/mm/mm-locks.h
index c25261b4c0..669969c6ee 100644
--- a/xen/arch/x86/mm/mm-locks.h
+++ b/xen/arch/x86/mm/mm-locks.h
@@ -79,7 +79,7 @@ static always_inline void _mm_lock(const struct domain *d, mm_lock_t *l,
 {
     if ( !((mm_locked_by_me(l)) && rec) )
         _check_lock_level(d, level);
-    spin_lock_recursive(&l->lock);
+    rspin_lock(&l->lock);
     if ( l->lock.recurse_cnt == 1 )
     {
         l->locker_function = func;
@@ -202,7 +202,7 @@ static inline void mm_unlock(mm_lock_t *l)
         l->locker_function = "nobody";
         _set_lock_level(l->unlock_level);
     }
-    spin_unlock_recursive(&l->lock);
+    rspin_unlock(&l->lock);
 }
 
 static inline void mm_enforce_order_unlock(int unlock_level,
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 652c18a9b5..1257a3d972 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -329,7 +329,7 @@ bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
     unsigned int id;
     bool found = false;
 
-    spin_lock_recursive(&d->ioreq_server.lock);
+    rspin_lock(&d->ioreq_server.lock);
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
     {
@@ -340,7 +340,7 @@ bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
         }
     }
 
-    spin_unlock_recursive(&d->ioreq_server.lock);
+    rspin_unlock(&d->ioreq_server.lock);
 
     return found;
 }
@@ -658,7 +658,7 @@ static int ioreq_server_create(struct domain *d, int bufioreq_handling,
         return -ENOMEM;
 
     domain_pause(d);
-    spin_lock_recursive(&d->ioreq_server.lock);
+    rspin_lock(&d->ioreq_server.lock);
 
     for ( i = 0; i < MAX_NR_IOREQ_SERVERS; i++ )
     {
@@ -686,13 +686,13 @@ static int ioreq_server_create(struct domain *d, int bufioreq_handling,
     if ( id )
         *id = i;
 
-    spin_unlock_recursive(&d->ioreq_server.lock);
+    rspin_unlock(&d->ioreq_server.lock);
     domain_unpause(d);
 
     return 0;
 
  fail:
-    spin_unlock_recursive(&d->ioreq_server.lock);
+    rspin_unlock(&d->ioreq_server.lock);
     domain_unpause(d);
 
     xfree(s);
@@ -704,7 +704,7 @@ static int ioreq_server_destroy(struct domain *d, ioservid_t id)
     struct ioreq_server *s;
     int rc;
 
-    spin_lock_recursive(&d->ioreq_server.lock);
+    rspin_lock(&d->ioreq_server.lock);
 
     s = get_ioreq_server(d, id);
 
@@ -736,7 +736,7 @@ static int ioreq_server_destroy(struct domain *d, ioservid_t id)
     rc = 0;
 
  out:
-    spin_unlock_recursive(&d->ioreq_server.lock);
+    rspin_unlock(&d->ioreq_server.lock);
 
     return rc;
 }
@@ -749,7 +749,7 @@ static int ioreq_server_get_info(struct domain *d, ioservid_t id,
     struct ioreq_server *s;
     int rc;
 
-    spin_lock_recursive(&d->ioreq_server.lock);
+    rspin_lock(&d->ioreq_server.lock);
 
     s = get_ioreq_server(d, id);
 
@@ -783,7 +783,7 @@ static int ioreq_server_get_info(struct domain *d, ioservid_t id,
     rc = 0;
 
  out:
-    spin_unlock_recursive(&d->ioreq_server.lock);
+    rspin_unlock(&d->ioreq_server.lock);
 
     return rc;
 }
@@ -796,7 +796,7 @@ int ioreq_server_get_frame(struct domain *d, ioservid_t id,
 
     ASSERT(is_hvm_domain(d));
 
-    spin_lock_recursive(&d->ioreq_server.lock);
+    rspin_lock(&d->ioreq_server.lock);
 
     s = get_ioreq_server(d, id);
 
@@ -834,7 +834,7 @@ int ioreq_server_get_frame(struct domain *d, ioservid_t id,
     }
 
  out:
-    spin_unlock_recursive(&d->ioreq_server.lock);
+    rspin_unlock(&d->ioreq_server.lock);
 
     return rc;
 }
@@ -850,7 +850,7 @@ static int ioreq_server_map_io_range(struct domain *d, ioservid_t id,
     if ( start > end )
         return -EINVAL;
 
-    spin_lock_recursive(&d->ioreq_server.lock);
+    rspin_lock(&d->ioreq_server.lock);
 
     s = get_ioreq_server(d, id);
 
@@ -886,7 +886,7 @@ static int ioreq_server_map_io_range(struct domain *d, ioservid_t id,
     rc = rangeset_add_range(r, start, end);
 
  out:
-    spin_unlock_recursive(&d->ioreq_server.lock);
+    rspin_unlock(&d->ioreq_server.lock);
 
     return rc;
 }
@@ -902,7 +902,7 @@ static int ioreq_server_unmap_io_range(struct domain *d, ioservid_t id,
     if ( start > end )
         return -EINVAL;
 
-    spin_lock_recursive(&d->ioreq_server.lock);
+    rspin_lock(&d->ioreq_server.lock);
 
     s = get_ioreq_server(d, id);
 
@@ -938,7 +938,7 @@ static int ioreq_server_unmap_io_range(struct domain *d, ioservid_t id,
     rc = rangeset_remove_range(r, start, end);
 
  out:
-    spin_unlock_recursive(&d->ioreq_server.lock);
+    rspin_unlock(&d->ioreq_server.lock);
 
     return rc;
 }
@@ -963,7 +963,7 @@ int ioreq_server_map_mem_type(struct domain *d, ioservid_t id,
     if ( flags & ~XEN_DMOP_IOREQ_MEM_ACCESS_WRITE )
         return -EINVAL;
 
-    spin_lock_recursive(&d->ioreq_server.lock);
+    rspin_lock(&d->ioreq_server.lock);
 
     s = get_ioreq_server(d, id);
 
@@ -978,7 +978,7 @@ int ioreq_server_map_mem_type(struct domain *d, ioservid_t id,
     rc = arch_ioreq_server_map_mem_type(d, s, flags);
 
  out:
-    spin_unlock_recursive(&d->ioreq_server.lock);
+    rspin_unlock(&d->ioreq_server.lock);
 
     if ( rc == 0 )
         arch_ioreq_server_map_mem_type_completed(d, s, flags);
@@ -992,7 +992,7 @@ static int ioreq_server_set_state(struct domain *d, ioservid_t id,
     struct ioreq_server *s;
     int rc;
 
-    spin_lock_recursive(&d->ioreq_server.lock);
+    rspin_lock(&d->ioreq_server.lock);
 
     s = get_ioreq_server(d, id);
 
@@ -1016,7 +1016,7 @@ static int ioreq_server_set_state(struct domain *d, ioservid_t id,
     rc = 0;
 
  out:
-    spin_unlock_recursive(&d->ioreq_server.lock);
+    rspin_unlock(&d->ioreq_server.lock);
     return rc;
 }
 
@@ -1026,7 +1026,7 @@ int ioreq_server_add_vcpu_all(struct domain *d, struct vcpu *v)
     unsigned int id;
     int rc;
 
-    spin_lock_recursive(&d->ioreq_server.lock);
+    rspin_lock(&d->ioreq_server.lock);
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
     {
@@ -1035,7 +1035,7 @@ int ioreq_server_add_vcpu_all(struct domain *d, struct vcpu *v)
             goto fail;
     }
 
-    spin_unlock_recursive(&d->ioreq_server.lock);
+    rspin_unlock(&d->ioreq_server.lock);
 
     return 0;
 
@@ -1050,7 +1050,7 @@ int ioreq_server_add_vcpu_all(struct domain *d, struct vcpu *v)
         ioreq_server_remove_vcpu(s, v);
     }
 
-    spin_unlock_recursive(&d->ioreq_server.lock);
+    rspin_unlock(&d->ioreq_server.lock);
 
     return rc;
 }
@@ -1060,12 +1060,12 @@ void ioreq_server_remove_vcpu_all(struct domain *d, struct vcpu *v)
     struct ioreq_server *s;
     unsigned int id;
 
-    spin_lock_recursive(&d->ioreq_server.lock);
+    rspin_lock(&d->ioreq_server.lock);
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
         ioreq_server_remove_vcpu(s, v);
 
-    spin_unlock_recursive(&d->ioreq_server.lock);
+    rspin_unlock(&d->ioreq_server.lock);
 }
 
 void ioreq_server_destroy_all(struct domain *d)
@@ -1076,7 +1076,7 @@ void ioreq_server_destroy_all(struct domain *d)
     if ( !arch_ioreq_server_destroy_all(d) )
         return;
 
-    spin_lock_recursive(&d->ioreq_server.lock);
+    rspin_lock(&d->ioreq_server.lock);
 
     /* No need to domain_pause() as the domain is being torn down */
 
@@ -1094,7 +1094,7 @@ void ioreq_server_destroy_all(struct domain *d)
         xfree(s);
     }
 
-    spin_unlock_recursive(&d->ioreq_server.lock);
+    rspin_unlock(&d->ioreq_server.lock);
 }
 
 struct ioreq_server *ioreq_server_select(struct domain *d,
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 2ec17df9b4..b4e0ef3a4c 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2500,7 +2500,7 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
     if ( unlikely(is_xen_heap_page(pg)) )
     {
         /* NB. May recursively lock from relinquish_memory(). */
-        spin_lock_recursive(&d->page_alloc_lock);
+        rspin_lock(&d->page_alloc_lock);
 
         for ( i = 0; i < (1 << order); i++ )
             arch_free_heap_page(d, &pg[i]);
@@ -2508,7 +2508,7 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
         d->xenheap_pages -= 1 << order;
         drop_dom_ref = (d->xenheap_pages == 0);
 
-        spin_unlock_recursive(&d->page_alloc_lock);
+        rspin_unlock(&d->page_alloc_lock);
     }
     else
     {
@@ -2517,7 +2517,7 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
         if ( likely(d) && likely(d != dom_cow) )
         {
             /* NB. May recursively lock from relinquish_memory(). */
-            spin_lock_recursive(&d->page_alloc_lock);
+            rspin_lock(&d->page_alloc_lock);
 
             for ( i = 0; i < (1 << order); i++ )
             {
@@ -2540,7 +2540,7 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
 
             drop_dom_ref = !domain_adjust_tot_pages(d, -(1 << order));
 
-            spin_unlock_recursive(&d->page_alloc_lock);
+            rspin_unlock(&d->page_alloc_lock);
 
             /*
              * Normally we expect a domain to clear pages before freeing them,
@@ -2756,7 +2756,7 @@ void free_domstatic_page(struct page_info *page)
     ASSERT_ALLOC_CONTEXT();
 
     /* NB. May recursively lock from relinquish_memory(). */
-    spin_lock_recursive(&d->page_alloc_lock);
+    rspin_lock(&d->page_alloc_lock);
 
     arch_free_heap_page(d, page);
 
@@ -2767,7 +2767,7 @@ void free_domstatic_page(struct page_info *page)
     /* Add page on the resv_page_list *after* it has been freed. */
     page_list_add_tail(page, &d->resv_page_list);
 
-    spin_unlock_recursive(&d->page_alloc_lock);
+    rspin_unlock(&d->page_alloc_lock);
 
     if ( drop_dom_ref )
         put_domain(d);
diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 09028af864..11e13e1259 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -436,7 +436,7 @@ void _spin_barrier(spinlock_t *lock)
     smp_mb();
 }
 
-int _spin_trylock_recursive(spinlock_t *lock)
+bool _rspin_trylock(rspinlock_t *lock)
 {
     unsigned int cpu = smp_processor_id();
 
@@ -448,8 +448,8 @@ int _spin_trylock_recursive(spinlock_t *lock)
 
     if ( likely(lock->recurse_cpu != cpu) )
     {
-        if ( !spin_trylock(lock) )
-            return 0;
+        if ( !_spin_trylock(lock) )
+            return false;
         lock->recurse_cpu = cpu;
     }
 
@@ -457,10 +457,10 @@ int _spin_trylock_recursive(spinlock_t *lock)
     ASSERT(lock->recurse_cnt < SPINLOCK_MAX_RECURSE);
     lock->recurse_cnt++;
 
-    return 1;
+    return true;
 }
 
-void _spin_lock_recursive(spinlock_t *lock)
+void _rspin_lock(rspinlock_t *lock)
 {
     unsigned int cpu = smp_processor_id();
 
@@ -475,7 +475,7 @@ void _spin_lock_recursive(spinlock_t *lock)
     lock->recurse_cnt++;
 }
 
-void _spin_unlock_recursive(spinlock_t *lock)
+void _rspin_unlock(rspinlock_t *lock)
 {
     if ( likely(--lock->recurse_cnt == 0) )
     {
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 6a88a0b32c..eca17b55b4 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -919,7 +919,7 @@ static void vprintk_common(const char *prefix, const char *fmt, va_list args)
 
     /* console_lock can be acquired recursively from __printk_ratelimit(). */
     local_irq_save(flags);
-    spin_lock_recursive(&console_lock);
+    rspin_lock(&console_lock);
     state = &this_cpu(state);
 
     (void)vsnprintf(buf, sizeof(buf), fmt, args);
@@ -955,7 +955,7 @@ static void vprintk_common(const char *prefix, const char *fmt, va_list args)
         state->continued = 1;
     }
 
-    spin_unlock_recursive(&console_lock);
+    rspin_unlock(&console_lock);
     local_irq_restore(flags);
 }
 
@@ -1162,14 +1162,14 @@ unsigned long console_lock_recursive_irqsave(void)
     unsigned long flags;
 
     local_irq_save(flags);
-    spin_lock_recursive(&console_lock);
+    rspin_lock(&console_lock);
 
     return flags;
 }
 
 void console_unlock_recursive_irqrestore(unsigned long flags)
 {
-    spin_unlock_recursive(&console_lock);
+    rspin_unlock(&console_lock);
     local_irq_restore(flags);
 }
 
@@ -1230,12 +1230,12 @@ int __printk_ratelimit(int ratelimit_ms, int ratelimit_burst)
             char lost_str[8];
             snprintf(lost_str, sizeof(lost_str), "%d", lost);
             /* console_lock may already be acquired by printk(). */
-            spin_lock_recursive(&console_lock);
+            rspin_lock(&console_lock);
             printk_start_of_line("(XEN) ");
             __putstr("printk: ");
             __putstr(lost_str);
             __putstr(" messages suppressed.\n");
-            spin_unlock_recursive(&console_lock);
+            rspin_unlock(&console_lock);
         }
         local_irq_restore(flags);
         return 1;
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index b6b2196ab0..4fcc7e2cde 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -55,12 +55,12 @@ static DEFINE_RSPINLOCK(_pcidevs_lock);
 /* Do not use, as it has no speculation barrier, use pcidevs_lock() instead. */
 void pcidevs_lock_unsafe(void)
 {
-    _spin_lock_recursive(&_pcidevs_lock);
+    _rspin_lock(&_pcidevs_lock);
 }
 
 void pcidevs_unlock(void)
 {
-    spin_unlock_recursive(&_pcidevs_lock);
+    rspin_unlock(&_pcidevs_lock);
 }
 
 bool pcidevs_locked(void)
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index bc320f4e55..85d44a16f5 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -358,8 +358,8 @@ struct sched_unit {
           (v) = (v)->next_in_list )
 
 /* Per-domain lock can be recursively acquired in fault handlers. */
-#define domain_lock(d) spin_lock_recursive(&(d)->domain_lock)
-#define domain_unlock(d) spin_unlock_recursive(&(d)->domain_lock)
+#define domain_lock(d) rspin_lock(&(d)->domain_lock)
+#define domain_unlock(d) rspin_unlock(&(d)->domain_lock)
 
 struct evtchn_port_ops;
 
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index bbf12b93c4..50f6580f52 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -210,10 +210,6 @@ int _spin_is_locked(const spinlock_t *lock);
 int _spin_trylock(spinlock_t *lock);
 void _spin_barrier(spinlock_t *lock);
 
-int _spin_trylock_recursive(spinlock_t *lock);
-void _spin_lock_recursive(spinlock_t *lock);
-void _spin_unlock_recursive(spinlock_t *lock);
-
 static always_inline void spin_lock(spinlock_t *l)
 {
     _spin_lock(l);
@@ -268,21 +264,23 @@ static always_inline void spin_lock_if(bool condition, spinlock_t *l)
 #define spin_barrier(l)               _spin_barrier(l)
 
 /*
- * spin_[un]lock_recursive(): Use these forms when the lock can (safely!) be
+ * rspin_[un]lock(): Use these forms when the lock can (safely!) be
  * reentered recursively on the same CPU. All critical regions that may form
  * part of a recursively-nested set must be protected by these forms. If there
  * are any critical regions that cannot form part of such a set, they can use
  * standard spin_[un]lock().
  */
-#define spin_trylock_recursive(l) \
-    lock_evaluate_nospec(_spin_trylock_recursive(l))
+bool _rspin_trylock(rspinlock_t *lock);
+void _rspin_lock(rspinlock_t *lock);
+void _rspin_unlock(rspinlock_t *lock);
 
-static always_inline void spin_lock_recursive(spinlock_t *l)
+static always_inline void rspin_lock(rspinlock_t *lock)
 {
-    _spin_lock_recursive(l);
+    _rspin_lock(lock);
     block_lock_speculation();
 }
 
-#define spin_unlock_recursive(l)      _spin_unlock_recursive(l)
+#define rspin_trylock(l)              lock_evaluate_nospec(_rspin_trylock(l))
+#define rspin_unlock(l)               _rspin_unlock(l)
 
 #endif /* __SPINLOCK_H__ */
-- 
2.35.3


