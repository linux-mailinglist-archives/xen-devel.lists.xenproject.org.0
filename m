Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bmW0MYXAQmoVAgoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 20:59:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 785326DE2D5
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 20:59:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=lzTbeKgE;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1348007.1605883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHCH-0002Ap-At; Mon, 29 Jun 2026 18:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348007.1605883; Mon, 29 Jun 2026 18:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHCH-00028g-3r; Mon, 29 Jun 2026 18:59:09 +0000
Received: by outflank-mailman (input) for mailman id 1348007;
 Mon, 29 Jun 2026 18:59:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vishal.moola@gmail.com>) id 1weHCE-0001qd-Rv
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 18:59:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weHCE-004Xi0-8h
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 20:59:06 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a42c049-5cb7-0a2a0a5109dd-0a2a4507b8a6-36
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 20:59:06 +0200
Received: from [209.85.210.172] (helo=mail-pf1-f172.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a42c078-9c8e-0a2a45070019-d155d2acedff-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 20:59:06 +0200
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-8423f236418so1857642b3a.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 11:59:05 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net
 ([2601:644:937c:6c90:6d4e:7b2d:4a39:fb0c])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-8479ff8f959sm223955b3a.3.2026.06.29.11.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 11:59:03 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782759544; x=1783364344; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=My1DbXUPRns8MM8RQE7EVMjU71GQnMwCyehhLcnwXmw=;
        b=lzTbeKgEnmI/aW6Pu/dpQLdb18mmiadeDhlOVK+knJkGNPy6RA2SochhPkFzgvkCeL
         MjC9V4gXffzUJi4wLCMWhZJSPQ0q2AhrjkMWloT4rlHwl7rByM1eWOEoeeDJOgjrfVsE
         Su9RPinOJaxSfCUJEGSxpkVORKHZKCOIITUKlLJF44B6rjNL2frnddApkM094VWnjE94
         j3mJXUep6Ou/mgxhaNP//KJxnwBTdXkMz/vnhIb0z8fhEl6vVYEoOi3ayq9tE0yOaGp7
         yU4bdhtEuZRWn1DZJTflLR0IgqyGgMWdAzAnoboux0vfdI4E9Nm0kLLrQ+NHxYZay7TD
         I3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782759544; x=1783364344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=My1DbXUPRns8MM8RQE7EVMjU71GQnMwCyehhLcnwXmw=;
        b=c5uv6yatmiwETHLJ94I3DCXw1lAVp5k/eyLRQuNXP4XZ2hbvyH5V6BnKVXd8jMC24j
         8y/2oWDwYeRvkquW0+0EUyedHq6MqBLoueXJYJPTTseSqild5Ahi+oF4SPvLXzyPZjQx
         GEXZgzhwwBrGOxpKj4Jo0Y5Ww9PecOxW/Rv6gN+LNkZGgmokzN56kDt4gt+YZdJt36Dl
         oTYD5AV5MLlsIrRZpTcgcnOokPt+WqQISIYdNWtYh5DbQZmJKCTQj55mO4xpmuZCGSLT
         7yNjGV2MMk3tiRg+fgK/cQ3W0DYlbDEEx5hG/Z/xXbg3aagusrez1x2B2lxQamrCyhyv
         dphw==
X-Forwarded-Encrypted: i=1; AHgh+RoimOS9F0Q/A55QfQoM9otBcyN0ZA91w2zMNl2mWaCzO6MGYm8iLlsysDTzTJ3j98OnbANtC1ndqCY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAxBwR4muzazHM+DcIPSqZPbvnjqV7fxe7a6KNS7CHWA2yRqCe
	dsgnx30bPyr1ohko+7QCsjMdmGOps4vmVX822dd4rPSVTu0gx1w2ZnaU
X-Gm-Gg: AfdE7cnSehMoeGWCA/iP8/9zfe1fyBqEo5Qe1EwCtylrbKyw4tBoEZd0SNvnpdnDqPf
	apN6podtgjHA6eGPzT7RUdVqqI1qCVNsvPUKk42UAdHsSMbwOFhxqI748DT24UTQ0rMPsoD2/Xw
	izQe2i0HwJWTbN2Rd+kjBDXZJiwOkOsSiGC3zIdvjKvZXaiICNf+96Jt8w3nwmqMdnjCiQ5OnQv
	FYERj08g+CAG+qtLYfQy2y810DZRZ9ZVScF7oaGyjOLn3h0nBGDpik9LOpaXKKK+12JonRXMkGc
	/DG5pghj0ku8s2hpMDlxOs5UMkJt9Dghp6Ov1LWD9by8pcEhBPyIyJTHwCj1HShaFki3HkZUtM1
	yRZBAzwsE7kf1/AANpSf/t/Q+MBrBN4E4dXKCBiOalBFJNZU2aIGyHtwsS9LocC9hDd6AEZ8/V1
	5o0n/y+edPqidqfCn3bKpQ2lXi4ybOxYwk1GI9dBtHlmCqMgCUWUMo22KkBzLK14zsOORIqBw=
X-Received: by 2002:a05:6a00:14c1:b0:847:8b11:596d with SMTP id d2e1a72fcca58-8479f2718a1mr464271b3a.41.1782759544196;
        Mon, 29 Jun 2026 11:59:04 -0700 (PDT)
From: Vishal Moola <vishal.moola@gmail.com>
To: Dave Hansen <dave.hansen@intel.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Mike Rapoport <rppt@kernel.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	xen-devel@lists.xenproject.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Vishal Moola <vishal.moola@gmail.com>,
	William Kucharski <william.kucharski@linux.dev>
Subject: [PATCH v2 6/9] x86/mm: Convert sync_global_pgds_l4() to ptdescs
Date: Mon, 29 Jun 2026 11:57:39 -0700
Message-ID: <20260629185742.126987-7-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629185742.126987-1-vishal.moola@gmail.com>
References: <20260629185742.126987-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1782759546-7C72925E-9CE1496B/0/0
X-purgate-type: clean
X-purgate-size: 1614
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,lists.xenproject.org,redhat.com,alien8.de,zytor.com,infradead.org,suse.com,oracle.com,gmail.com,linux.dev];
	FORGED_SENDER(0.00)[vishalmoola@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dave.hansen@intel.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:rppt@kernel.org,m:baolu.lu@linux.intel.com,m:xen-devel@lists.xenproject.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:vishal.moola@gmail.com,m:william.kucharski@linux.dev,m:vishalmoola@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishalmoola@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 785326DE2D5

Convert sync_global_pgds_l4() to ptdescs in preparation for the
eventual splitting of ptdescs from struct page.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: William Kucharski <william.kucharski@linux.dev>
Signed-off-by: Vishal Moola <vishal.moola@gmail.com>
---
 arch/x86/mm/init_64.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index e89b51aea2cf..a6ccb83f2d26 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -174,7 +174,7 @@ static void sync_global_pgds_l4(unsigned long start, unsigned long end)
 	for (addr = start; addr <= end; addr = ALIGN(addr + 1, PGDIR_SIZE)) {
 		pgd_t *pgd_ref = pgd_offset_k(addr);
 		const p4d_t *p4d_ref;
-		struct page *page;
+		struct ptdesc *ptdesc;
 
 		/*
 		 * With folded p4d, pgd_none() is always false, we need to
@@ -187,15 +187,15 @@ static void sync_global_pgds_l4(unsigned long start, unsigned long end)
 			continue;
 
 		spin_lock(&pgd_lock);
-		list_for_each_entry(page, &pgd_list, lru) {
+		list_for_each_entry(ptdesc, &pgd_list, pt_list) {
 			pgd_t *pgd;
 			p4d_t *p4d;
 			spinlock_t *pgt_lock;
 
-			pgd = (pgd_t *)page_address(page) + pgd_index(addr);
+			pgd = (pgd_t *)ptdesc_address(ptdesc) + pgd_index(addr);
 			p4d = p4d_offset(pgd, addr);
 			/* the pgt_lock only for Xen */
-			pgt_lock = &pgd_page_get_mm(page)->page_table_lock;
+			pgt_lock = &pgd_page_get_mm(ptdesc_page(ptdesc))->page_table_lock;
 			spin_lock(pgt_lock);
 
 			if (!p4d_none(*p4d_ref) && !p4d_none(*p4d))
-- 
2.54.0


