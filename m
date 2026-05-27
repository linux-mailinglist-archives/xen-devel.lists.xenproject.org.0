Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jLkzJ/L5FmqCzwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 16:04:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C7A5E586E
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 16:04:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320495.1587799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSErr-0006xf-M9; Wed, 27 May 2026 14:04:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320495.1587799; Wed, 27 May 2026 14:04:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSErr-0006uj-GY; Wed, 27 May 2026 14:04:19 +0000
Received: by outflank-mailman (input) for mailman id 1320495;
 Wed, 27 May 2026 14:04:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vishal.moola@gmail.com>) id 1wSErq-0006fh-7K
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 14:04:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSErp-007NWT-JI
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 16:04:17 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a16f9e1-5cb7-0a2a0a5109dd-0a2a4505b586-2
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 16:04:17 +0200
Received: from [209.85.218.41] (helo=mail-ej1-f41.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a16f9e1-aaa8-0a2a45050019-d155da29e59f-3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 16:04:17 +0200
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-bd4f8260e4eso2081869366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 07:04:17 -0700 (PDT)
Received: from fedora (cpc92878-cmbg18-2-0-cust539.5-4.cable.virginm.net.
 [86.16.54.28]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-45edb558f52sm6693771f8f.14.2026.05.27.07.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 07:04:16 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779890657; x=1780495457; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StiDcvF5NcsOIMzOzw/wp6rwR3a8/aCyRzqbH6oZvSA=;
        b=DUBZN+kBxri6T029tjHeepqnc8mt7Evg8Th0OajQZEnglCG7KA3eqKJfzhzU3xG0Ku
         m3VRqTXn2qqifqIcygro6Fg2E9YdAHMWt6bybc/gGmjnuriZ1jICNnma51KsFLek9+pF
         hKnIJ0S4C2h76kBkpZYhK4A7+lhMbvMSYk7oNVAY1wakpRkNuQZuL9XVCckoMM/ndZ+0
         7/P08Rrs5rHBjjNPhkfsh7qzBTa6/WyiSTNDmwlzRU4dZu3KdowgthadNqNovdrdRU0W
         7QTWGxzk5rPw+/nGDOgDfin1dsNM9Nfc4O22li9YNXfXHM4IvRfIJTpLSIZZhZp6+reI
         PQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779890657; x=1780495457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=StiDcvF5NcsOIMzOzw/wp6rwR3a8/aCyRzqbH6oZvSA=;
        b=lEZLENRG6hSVDobMdi1WdSaWkWlXwYutUyGOXqIxVew+yDpjGVMOeunEShKQETQ8Tt
         1i9+r+iT7wXsSQWcy8Yrbo1sXIs80rA3oeKsg+4XZASrdzZ6g7IX9V0xnc6GJlmyyWUs
         tc1ZTZy0vsgb0vHu7KNcfv0tS1KIfSlU9mkB+wefhGtFntEI11BVEkg92pdUuXRb71Un
         MP0xilrTLlUjAQlu6wfDITfVJvm4ltt+Ym3rvm+/uU8fmByPiaMP4e0DaFD5hsc1915O
         xaWzJREbRqLMCIbzrknh6vcOedI8PegQnS4wxntaiYCdRiCJZwd8o+yfHsMXw78scJkB
         0Dsw==
X-Forwarded-Encrypted: i=1; AFNElJ/9oOtamipWO9Cvt4gj9tR57phkEywylEjggnx/mjpf6YVc4MT5uICuAOm8iAxX6pPMlfW9KyRLN60=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw29Vq/4fA5e2J0Iu6E2im16Mf2USbDpmIT1ClU1xWXMuqCLZOa
	DZqbS2plauZDRm5vaNlT1shKZic9mEzXnzkkHFPk95YQhYLe0X1soyvl
X-Gm-Gg: Acq92OEwWkdbtQujYm0lwuP/SZvbkfQmB2HSnIc6LlhtxJqdDANC6/N/YpNv1xu3q4P
	F9UM1C2HrEjFhU8je0rA3zPLRJ/3KzTlYsr/GO0k6dXJ2BK5hfl5hCb1i+Ekkmz6r8a8QZPIqfN
	mYL0g6gfKtSxaqPAt0cxytJOHw6onHW81cc4NDMNmZ8FTPTBLoCccrgect37mV/Wl2hE2/OhNRi
	y+s0UFEH4kKju6LvMtkKNUQXwKFq7c1N8VBqdDLTuDc5yxplziKSxDEYkkEhVxG6F+SKZyhz1tY
	TxtXCAZ0feHWf0umx9TGYy1W6BmzOHgsAg/e+6ewOOC7FfGMMfq3NbHyGXVzxh2amZHp4fGXBIG
	AsZwrco/uABfsL6EuRf9ePETdftuXmkipoN5TYE84EOcJMR5HMyarYWO7jxGJ4L3XoI7rxUTT+G
	PpJbJ55DBm1ny2SkOeKr26QrbVjWYXJ+Bk0RaSoiHspdl3UloORFu9qF/I7YxhvLaqObm5LYM6I
	0PYLUn/i4oOvKxIk2JjVPvn0KV8xWNvdg==
X-Received: by 2002:a17:907:3e03:b0:bd9:1fb:9941 with SMTP id a640c23a62f3a-bdd25cec1f0mr1328155766b.29.1779890656754;
        Wed, 27 May 2026 07:04:16 -0700 (PDT)
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
	Vishal Moola <vishal.moola@gmail.com>
Subject: [PATCH 5/9] x86/mm: Convert sync_global_pgds_l5() to ptdescs
Date: Wed, 27 May 2026 15:03:12 +0100
Message-ID: <20260527140316.294621-6-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527140316.294621-1-vishal.moola@gmail.com>
References: <20260527140316.294621-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1779890657-E3788443-8F7770FC/0/0
X-purgate-type: clean
X-purgate-size: 1410
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dave.hansen@intel.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:rppt@kernel.org,m:baolu.lu@linux.intel.com,m:xen-devel@lists.xenproject.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:vishal.moola@gmail.com,m:vishalmoola@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,lists.xenproject.org,redhat.com,alien8.de,zytor.com,infradead.org,suse.com,oracle.com,gmail.com];
	FORGED_SENDER(0.00)[vishalmoola@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishalmoola@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.960];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 24C7A5E586E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert sync_global_pgds_l5() to ptdescs in preparation for the
eventual splitting of ptdescs from struct page.

Signed-off-by: Vishal Moola <vishal.moola@gmail.com>
---
 arch/x86/mm/init_64.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index df27379d4bb4..e89b51aea2cf 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -136,7 +136,7 @@ static void sync_global_pgds_l5(unsigned long start, unsigned long end)
 
 	for (addr = start; addr <= end; addr = ALIGN(addr + 1, PGDIR_SIZE)) {
 		const pgd_t *pgd_ref = pgd_offset_k(addr);
-		struct page *page;
+		struct ptdesc *ptdesc;
 
 		/* Check for overflow */
 		if (addr < start)
@@ -146,13 +146,13 @@ static void sync_global_pgds_l5(unsigned long start, unsigned long end)
 			continue;
 
 		spin_lock(&pgd_lock);
-		list_for_each_entry(page, &pgd_list, lru) {
+		list_for_each_entry(ptdesc, &pgd_list, pt_list) {
 			pgd_t *pgd;
 			spinlock_t *pgt_lock;
 
-			pgd = (pgd_t *)page_address(page) + pgd_index(addr);
+			pgd = (pgd_t *)ptdesc_address(ptdesc) + pgd_index(addr);
 			/* the pgt_lock only for Xen */
-			pgt_lock = &pgd_page_get_mm(page)->page_table_lock;
+			pgt_lock = &pgd_page_get_mm(ptdesc_page(ptdesc))->page_table_lock;
 			spin_lock(pgt_lock);
 
 			if (!pgd_none(*pgd_ref) && !pgd_none(*pgd))
-- 
2.54.0


