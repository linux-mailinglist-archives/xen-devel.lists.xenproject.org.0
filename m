Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9124C80E819
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 10:48:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652849.1018930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzMn-00088Q-Vs; Tue, 12 Dec 2023 09:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652849.1018930; Tue, 12 Dec 2023 09:47:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzMn-00084j-S2; Tue, 12 Dec 2023 09:47:53 +0000
Received: by outflank-mailman (input) for mailman id 652849;
 Tue, 12 Dec 2023 09:47:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/k62=HX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rCzMm-0007Gv-Cs
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 09:47:52 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83b929aa-98d3-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 10:47:51 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C9D441F74C;
 Tue, 12 Dec 2023 09:47:50 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 68C57139E9;
 Tue, 12 Dec 2023 09:47:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id F6JoGEYseGXEfgAAn2gu4w
 (envelope-from <jgross@suse.com>); Tue, 12 Dec 2023 09:47:50 +0000
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
X-Inumbo-ID: 83b929aa-98d3-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702374470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fdRSEytmHvGpI/Z2j7dS5CoHPsmRTFiZAI41T9Vl7PE=;
	b=n/D7lrSIoQ++/5E4gz1W0B59W5XN1BfQcTyh2y1yo4XpVhdzYxEnreJPIA0FgqiOs3iiuU
	S+GxJpD56enSeKua3cujj/ttc4m+zCB0dypwvFGphoCEmEad1tLNllmwnM14W730kD1FY0
	H/I3AtDLyjSORra1rbg4zcGe1CGcJYI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702374470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fdRSEytmHvGpI/Z2j7dS5CoHPsmRTFiZAI41T9Vl7PE=;
	b=n/D7lrSIoQ++/5E4gz1W0B59W5XN1BfQcTyh2y1yo4XpVhdzYxEnreJPIA0FgqiOs3iiuU
	S+GxJpD56enSeKua3cujj/ttc4m+zCB0dypwvFGphoCEmEad1tLNllmwnM14W730kD1FY0
	H/I3AtDLyjSORra1rbg4zcGe1CGcJYI=
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
	Paul Durrant <paul@xen.org>
Subject: [PATCH v4 04/12] xen/spinlock: rename recursive lock functions
Date: Tue, 12 Dec 2023 10:47:17 +0100
Message-Id: <20231212094725.22184-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231212094725.22184-1-jgross@suse.com>
References: <20231212094725.22184-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 18.90
X-Spam-Flag: YES
X-Spam-Level: *******
X-Rspamd-Server: rspamd1
X-Spamd-Result: default: False [7.29 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(5.10)[100.00%];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 DMARC_POLICY_ALLOW(0.00)[suse.com,quarantine];
	 DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(0.00)[-all];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 SPAM_FLAG(5.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 WHITELIST_DMARC(-7.00)[suse.com:D:+];
	 RCPT_COUNT_TWELVE(0.00)[14];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Rspamd-Queue-Id: C9D441F74C
X-Spam-Flag: NO
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="n/D7lrSI";
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=fail (smtp-out2.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:98 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Spamd-Bar: +++++++
X-Spam-Score: 7.29

Rename the recursive spin_lock() functions by replacing the trailing
"_recursive" with a leading "r".

Switch the parameter to be a pointer to rspinlock_t.

Remove the indirection through a macro, as it is adding only complexity
without any gain.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 xen/arch/arm/domain.c         |  4 +--
 xen/arch/x86/domain.c         |  8 +++---
 xen/arch/x86/mm/mem_sharing.c |  8 +++---
 xen/arch/x86/mm/mm-locks.h    |  4 +--
 xen/common/ioreq.c            | 52 +++++++++++++++++------------------
 xen/common/page_alloc.c       | 12 ++++----
 xen/common/spinlock.c         |  6 ++--
 xen/drivers/char/console.c    | 12 ++++----
 xen/drivers/passthrough/pci.c |  4 +--
 xen/include/xen/sched.h       |  4 +--
 xen/include/xen/spinlock.h    | 24 +++++++---------
 11 files changed, 67 insertions(+), 71 deletions(-)

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
index 3712e36df9..69ce1fd5cf 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1321,7 +1321,7 @@ int arch_set_info_guest(
         {
             bool done = false;
 
-            spin_lock_recursive(&d->page_alloc_lock);
+            rspin_lock(&d->page_alloc_lock);
 
             for ( i = 0; ; )
             {
@@ -1342,7 +1342,7 @@ int arch_set_info_guest(
                     break;
             }
 
-            spin_unlock_recursive(&d->page_alloc_lock);
+            rspin_unlock(&d->page_alloc_lock);
 
             if ( !done )
                 return -ERESTART;
@@ -2181,7 +2181,7 @@ static int relinquish_memory(
     int               ret = 0;
 
     /* Use a recursive lock, as we may enter 'free_domheap_page'. */
-    spin_lock_recursive(&d->page_alloc_lock);
+    rspin_lock(&d->page_alloc_lock);
 
     while ( (page = page_list_remove_head(list)) )
     {
@@ -2322,7 +2322,7 @@ static int relinquish_memory(
     page_list_move(list, &d->arch.relmem_list);
 
  out:
-    spin_unlock_recursive(&d->page_alloc_lock);
+    rspin_unlock(&d->page_alloc_lock);
     return ret;
 }
 
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 4f810706a3..1720079fd9 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -688,7 +688,7 @@ static int page_make_sharable(struct domain *d,
     int rc = 0;
     bool drop_dom_ref = false;
 
-    spin_lock_recursive(&d->page_alloc_lock);
+    rspin_lock(&d->page_alloc_lock);
 
     if ( d->is_dying )
     {
@@ -731,7 +731,7 @@ static int page_make_sharable(struct domain *d,
     }
 
 out:
-    spin_unlock_recursive(&d->page_alloc_lock);
+    rspin_unlock(&d->page_alloc_lock);
 
     if ( drop_dom_ref )
         put_domain(d);
@@ -1942,7 +1942,7 @@ int mem_sharing_fork_reset(struct domain *d, bool reset_state,
         goto state;
 
     /* need recursive lock because we will free pages */
-    spin_lock_recursive(&d->page_alloc_lock);
+    rspin_lock(&d->page_alloc_lock);
     page_list_for_each_safe(page, tmp, &d->page_list)
     {
         shr_handle_t sh;
@@ -1971,7 +1971,7 @@ int mem_sharing_fork_reset(struct domain *d, bool reset_state,
         put_page_alloc_ref(page);
         put_page_and_type(page);
     }
-    spin_unlock_recursive(&d->page_alloc_lock);
+    rspin_unlock(&d->page_alloc_lock);
 
  state:
     if ( reset_state )
diff --git a/xen/arch/x86/mm/mm-locks.h b/xen/arch/x86/mm/mm-locks.h
index b05cad1752..c867ad7d53 100644
--- a/xen/arch/x86/mm/mm-locks.h
+++ b/xen/arch/x86/mm/mm-locks.h
@@ -79,7 +79,7 @@ static inline void _mm_lock(const struct domain *d, mm_lock_t *l,
 {
     if ( !((mm_locked_by_me(l)) && rec) )
         _check_lock_level(d, level);
-    spin_lock_recursive(&l->lock);
+    rspin_lock(&l->lock);
     if ( l->lock.recurse_cnt == 1 )
     {
         l->locker_function = func;
@@ -200,7 +200,7 @@ static inline void mm_unlock(mm_lock_t *l)
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
index 9b5df74fdd..8c6a3d9274 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2497,7 +2497,7 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
     if ( unlikely(is_xen_heap_page(pg)) )
     {
         /* NB. May recursively lock from relinquish_memory(). */
-        spin_lock_recursive(&d->page_alloc_lock);
+        rspin_lock(&d->page_alloc_lock);
 
         for ( i = 0; i < (1 << order); i++ )
             arch_free_heap_page(d, &pg[i]);
@@ -2505,7 +2505,7 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
         d->xenheap_pages -= 1 << order;
         drop_dom_ref = (d->xenheap_pages == 0);
 
-        spin_unlock_recursive(&d->page_alloc_lock);
+        rspin_unlock(&d->page_alloc_lock);
     }
     else
     {
@@ -2514,7 +2514,7 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
         if ( likely(d) && likely(d != dom_cow) )
         {
             /* NB. May recursively lock from relinquish_memory(). */
-            spin_lock_recursive(&d->page_alloc_lock);
+            rspin_lock(&d->page_alloc_lock);
 
             for ( i = 0; i < (1 << order); i++ )
             {
@@ -2537,7 +2537,7 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
 
             drop_dom_ref = !domain_adjust_tot_pages(d, -(1 << order));
 
-            spin_unlock_recursive(&d->page_alloc_lock);
+            rspin_unlock(&d->page_alloc_lock);
 
             /*
              * Normally we expect a domain to clear pages before freeing them,
@@ -2753,7 +2753,7 @@ void free_domstatic_page(struct page_info *page)
     ASSERT_ALLOC_CONTEXT();
 
     /* NB. May recursively lock from relinquish_memory(). */
-    spin_lock_recursive(&d->page_alloc_lock);
+    rspin_lock(&d->page_alloc_lock);
 
     arch_free_heap_page(d, page);
 
@@ -2764,7 +2764,7 @@ void free_domstatic_page(struct page_info *page)
     /* Add page on the resv_page_list *after* it has been freed. */
     page_list_add_tail(page, &d->resv_page_list);
 
-    spin_unlock_recursive(&d->page_alloc_lock);
+    rspin_unlock(&d->page_alloc_lock);
 
     if ( drop_dom_ref )
         put_domain(d);
diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 09028af864..422a7fb1db 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -436,7 +436,7 @@ void _spin_barrier(spinlock_t *lock)
     smp_mb();
 }
 
-int _spin_trylock_recursive(spinlock_t *lock)
+int rspin_trylock(rspinlock_t *lock)
 {
     unsigned int cpu = smp_processor_id();
 
@@ -460,7 +460,7 @@ int _spin_trylock_recursive(spinlock_t *lock)
     return 1;
 }
 
-void _spin_lock_recursive(spinlock_t *lock)
+void rspin_lock(rspinlock_t *lock)
 {
     unsigned int cpu = smp_processor_id();
 
@@ -475,7 +475,7 @@ void _spin_lock_recursive(spinlock_t *lock)
     lock->recurse_cnt++;
 }
 
-void _spin_unlock_recursive(spinlock_t *lock)
+void rspin_unlock(rspinlock_t *lock)
 {
     if ( likely(--lock->recurse_cnt == 0) )
     {
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 76e455bacd..f6f61dc5a1 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -920,7 +920,7 @@ static void vprintk_common(const char *prefix, const char *fmt, va_list args)
 
     /* console_lock can be acquired recursively from __printk_ratelimit(). */
     local_irq_save(flags);
-    spin_lock_recursive(&console_lock);
+    rspin_lock(&console_lock);
     state = &this_cpu(state);
 
     (void)vsnprintf(buf, sizeof(buf), fmt, args);
@@ -956,7 +956,7 @@ static void vprintk_common(const char *prefix, const char *fmt, va_list args)
         state->continued = 1;
     }
 
-    spin_unlock_recursive(&console_lock);
+    rspin_unlock(&console_lock);
     local_irq_restore(flags);
 }
 
@@ -1163,14 +1163,14 @@ unsigned long console_lock_recursive_irqsave(void)
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
 
@@ -1231,12 +1231,12 @@ int __printk_ratelimit(int ratelimit_ms, int ratelimit_burst)
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
index d604ed5634..41444f8e2e 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -54,12 +54,12 @@ static DEFINE_RSPINLOCK(_pcidevs_lock);
 
 void pcidevs_lock(void)
 {
-    spin_lock_recursive(&_pcidevs_lock);
+    rspin_lock(&_pcidevs_lock);
 }
 
 void pcidevs_unlock(void)
 {
-    spin_unlock_recursive(&_pcidevs_lock);
+    rspin_unlock(&_pcidevs_lock);
 }
 
 bool pcidevs_locked(void)
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index c6604aef78..8cf751ad0c 100644
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
index 20d15f34dd..ee536c302c 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -209,9 +209,16 @@ int _spin_is_locked(const spinlock_t *lock);
 int _spin_trylock(spinlock_t *lock);
 void _spin_barrier(spinlock_t *lock);
 
-int _spin_trylock_recursive(spinlock_t *lock);
-void _spin_lock_recursive(spinlock_t *lock);
-void _spin_unlock_recursive(spinlock_t *lock);
+/*
+ * rspin_[un]lock(): Use these forms when the lock can (safely!) be
+ * reentered recursively on the same CPU. All critical regions that may form
+ * part of a recursively-nested set must be protected by these forms. If there
+ * are any critical regions that cannot form part of such a set, they can use
+ * standard spin_[un]lock().
+ */
+int rspin_trylock(rspinlock_t *lock);
+void rspin_lock(rspinlock_t *lock);
+void rspin_unlock(rspinlock_t *lock);
 
 #define spin_lock(l)                  _spin_lock(l)
 #define spin_lock_cb(l, c, d)         _spin_lock_cb(l, c, d)
@@ -241,15 +248,4 @@ void _spin_unlock_recursive(spinlock_t *lock);
 /* Ensure a lock is quiescent between two critical operations. */
 #define spin_barrier(l)               _spin_barrier(l)
 
-/*
- * spin_[un]lock_recursive(): Use these forms when the lock can (safely!) be
- * reentered recursively on the same CPU. All critical regions that may form
- * part of a recursively-nested set must be protected by these forms. If there
- * are any critical regions that cannot form part of such a set, they can use
- * standard spin_[un]lock().
- */
-#define spin_trylock_recursive(l)     _spin_trylock_recursive(l)
-#define spin_lock_recursive(l)        _spin_lock_recursive(l)
-#define spin_unlock_recursive(l)      _spin_unlock_recursive(l)
-
 #endif /* __SPINLOCK_H__ */
-- 
2.35.3


