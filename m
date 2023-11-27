Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 215437F9DA9
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:36:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641808.1000745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Yyw-0004Ru-M4; Mon, 27 Nov 2023 10:36:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641808.1000745; Mon, 27 Nov 2023 10:36:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Yyw-0004P2-J0; Mon, 27 Nov 2023 10:36:50 +0000
Received: by outflank-mailman (input) for mailman id 641808;
 Mon, 27 Nov 2023 10:36:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7YoS-0000Co-8B
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:26:00 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b43082a-8d0f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 11:25:59 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B939E21B08;
 Mon, 27 Nov 2023 10:25:58 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 90147132A6;
 Mon, 27 Nov 2023 10:25:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 8XjpIbZuZGWffgAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 27 Nov 2023 10:25:58 +0000
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
X-Inumbo-ID: 5b43082a-8d0f-11ee-98e2-6d05b1d4d9a1
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 06/32] Mini-OS: add EXPORT_SYMBOL() instances to mm.c
Date: Mon, 27 Nov 2023 11:24:57 +0100
Message-Id: <20231127102523.28003-7-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231127102523.28003-1-jgross@suse.com>
References: <20231127102523.28003-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: *********************
X-Spamd-Bar: +++++++++++++++++++++
Authentication-Results: smtp-out1.suse.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine);
	spf=fail (smtp-out1.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:98 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [21.50 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 NEURAL_SPAM_SHORT(3.00)[1.000];
	 MX_GOOD(-0.01)[];
	 NEURAL_SPAM_LONG(3.50)[1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 21.50
X-Rspamd-Queue-Id: B939E21B08
X-Spam-Flag: NO

Add the needed instances of EXPORT_SYMBOL() to mm.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 arch/arm/mm.c | 2 ++
 arch/x86/mm.c | 5 +++++
 mm.c          | 4 ++++
 3 files changed, 11 insertions(+)

diff --git a/arch/arm/mm.c b/arch/arm/mm.c
index 11962f8b..c269ab14 100644
--- a/arch/arm/mm.c
+++ b/arch/arm/mm.c
@@ -85,6 +85,7 @@ int do_map_frames(unsigned long addr,
 {
     return -ENOSYS;
 }
+EXPORT_SYMBOL(do_map_frames);
 
 /* Get Xen's suggested physical page assignments for the grant table. */
 static paddr_t get_gnttab_base(void)
@@ -149,3 +150,4 @@ unsigned long map_frame_virt(unsigned long mfn)
 {
     return mfn_to_virt(mfn);
 }
+EXPORT_SYMBOL(map_frame_virt);
diff --git a/arch/x86/mm.c b/arch/x86/mm.c
index cfc978f6..767a5f07 100644
--- a/arch/x86/mm.c
+++ b/arch/x86/mm.c
@@ -493,6 +493,7 @@ pgentry_t *need_pgt(unsigned long va)
     offset = l1_table_offset(va);
     return &tab[offset];
 }
+EXPORT_SYMBOL(need_pgt);
 
 /*
  * Reserve an area of virtual address space for mappings and Heap
@@ -634,6 +635,7 @@ int do_map_frames(unsigned long va,
 
     return 0;
 }
+EXPORT_SYMBOL(do_map_frames);
 
 /*
  * Map an array of MFNs contiguous into virtual address space. Virtual
@@ -654,6 +656,7 @@ void *map_frames_ex(const unsigned long *mfns, unsigned long n,
 
     return (void *)va;
 }
+EXPORT_SYMBOL(map_frames_ex);
 
 /*
  * Unmap nun_frames frames mapped at virtual address va.
@@ -724,6 +727,7 @@ int unmap_frames(unsigned long va, unsigned long num_frames)
     }
     return 0;
 }
+EXPORT_SYMBOL(unmap_frames);
 
 /*
  * Clear some of the bootstrap memory
@@ -859,3 +863,4 @@ unsigned long map_frame_virt(unsigned long mfn)
 
     return addr;
 }
+EXPORT_SYMBOL(map_frame_virt);
diff --git a/mm.c b/mm.c
index 6493bdd4..eb0e34de 100644
--- a/mm.c
+++ b/mm.c
@@ -280,6 +280,7 @@ unsigned long alloc_pages(int order)
 
     return 0;
 }
+EXPORT_SYMBOL(alloc_pages);
 
 void free_pages(void *pointer, int order)
 {
@@ -336,6 +337,7 @@ void free_pages(void *pointer, int order)
     free_head[order] = freed_ch;   
    
 }
+EXPORT_SYMBOL(free_pages);
 
 int free_physical_pages(xen_pfn_t *mfns, int n)
 {
@@ -352,6 +354,7 @@ int map_frame_rw(unsigned long addr, unsigned long mfn)
 {
     return do_map_frames(addr, &mfn, 1, 1, 1, DOMID_SELF, NULL, L1_PROT);
 }
+EXPORT_SYMBOL(map_frame_rw);
 
 #ifdef HAVE_LIBC
 void *sbrk(ptrdiff_t increment)
@@ -385,6 +388,7 @@ void *sbrk(ptrdiff_t increment)
 
     return (void *) old_brk;
 }
+EXPORT_SYMBOL(sbrk);
 #endif
 
 
-- 
2.35.3


