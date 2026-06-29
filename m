Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ahanG4XAQmoUAgoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 20:59:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4D36DE2D0
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 20:59:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=B2sTvS1b;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1348008.1605889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHCH-0002J5-Ts; Mon, 29 Jun 2026 18:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348008.1605889; Mon, 29 Jun 2026 18:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHCH-0002DR-P9; Mon, 29 Jun 2026 18:59:09 +0000
Received: by outflank-mailman (input) for mailman id 1348008;
 Mon, 29 Jun 2026 18:59:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vishal.moola@gmail.com>) id 1weHCG-00027G-GH
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 18:59:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weHCF-00DrOt-Te
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 20:59:07 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a42c064-2eae-0a2a0a5409dd-0a2a4504d80a-42
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 20:59:07 +0200
Received: from [209.85.215.182] (helo=mail-pg1-f182.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a42c07a-a01d-0a2a45040019-d155d7b6a576-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 20:59:07 +0200
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-c9a20f70263so484803a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 11:59:07 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net
 ([2601:644:937c:6c90:6d4e:7b2d:4a39:fb0c])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-8479ff8f959sm223955b3a.3.2026.06.29.11.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 11:59:05 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782759546; x=1783364346; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ipb9zy/CMdSBlv5dLzabanXHjYoiCYD2Nb/oCjfyVU=;
        b=B2sTvS1bbxb6bDtZTa2BZ3RNJOt2XT+OniwT3oRYMf+Yt+5EcNH/paJjReI7GtfHn7
         kkUllaTe0z7rwrLk4Kxj3FgGMxdBwzUC2JX02nr/zXFpUZWTskZKlN5PUypFHtzDLfcc
         xLqIiVhQN6B9hd/h/AGB3hEBq/tCWOUszQbZoscrmlU2/l/CW4psy9fH2gE6mKYn91c7
         SSqedC41/p6upxJIPTnW3dhk6rA3aOPbRbjBRZzfcJlrj/kPiOHe+g1qsYc6iG+6qOus
         62/8jO5gCbSQ1RzPcFHK4J/3moaOSa64c7OJEjYKMX1pEqZJvNEVEAhtBsvLZC/BtvLZ
         ZTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782759546; x=1783364346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ipb9zy/CMdSBlv5dLzabanXHjYoiCYD2Nb/oCjfyVU=;
        b=L3a3Hb8sSPdGoOD1BUUwbg2BbBzWQow8mVafRoKi4Yme0Q3pl8SIJ49dQQAtjR8Xso
         U1HcDIRHX2lpWB0qEVIa6ulrQhdO50FD1NBFzUPsVhJqVguzolPXrPybu+r+7VJFmWhm
         qMhDB/BAER6QJ57Tigq/cekqPlllsgmeDOvOHoakkYGSj39zoQkfzaQihe6aUCcrpD5h
         jFOAlvBH4nbtrIupM1MAEGUA070hv/r5mja0H/tcRPfL0E9UGhD7xYgHWOMqaKJGBWvg
         SlTfw0v4xdy2dSBTLrtCEQnAeThbiHJmjRTjiJf87K601dgp8BgkNBB9mPKEhKDsLl9D
         CdRw==
X-Forwarded-Encrypted: i=1; AHgh+RpFVpGJJ1Yxw9NKOBeLCTqjk85vwT5SL6d5NqvyjevzShdknzHQnftbH1++Rx+Q0BqZy+u6G5T/dvU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMnq32nMNrxtSRinrCCIn05WvifsluTaYUjmha6WgVBSpaoy7w
	9AvfqlTl0i2u3bv4Gkl4+BBnAtqmxIfecL6cDOnslZwHrkj6I/lxWrdA
X-Gm-Gg: AfdE7cnAZrUAsXXDEbdzOjm6L3rNWKeF5dDqqEptA/v5yPKad5rBXocAW/dIhPwCXVb
	ps21tJAa4iS/NCmZ2ls1YLjSHi51a3snr1v0Y01Bz6yN89k5g+aJicW40k0cI1a5lUMe01/ErS4
	2sSMAH3T9SmhGgRuknDJUfZSnHqOhzXfTn7eeIu4xfjwAUQV/HQu8xUf2mkJQ6aaSSh7grsjQU6
	694swE/+FKSj7kVWh1DTavrMT2xbbeRZXfm9AtDJjXBbee3NMDJmCtpA/ssF3tkYwVX3Z7E82py
	0/extGgRTmdlRuj0EL7VvCCwcRuFz7ZiiNgOnawgvlqIjqLXIOHQVxjQ70GTIktScI5SQ0M/Edd
	Kvwfm0BvmnAeKm5ZbGDnTPTI/zVknFJvs4+IrPPts6BO+9NIA+ytQRY0qzoi0af8CyPBqbYxH4k
	E9aByj+xAOXfcK6bqcymml4byZOAnU+qNMy4GYVhrKCQGNo8nu0FH8zFz9rOnp59Nu2Si8+Rg=
X-Received: by 2002:a05:6a00:9081:b0:847:9223:9726 with SMTP id d2e1a72fcca58-8479fe56b4emr318904b3a.18.1782759545854;
        Mon, 29 Jun 2026 11:59:05 -0700 (PDT)
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
Subject: [PATCH v2 7/9] x86/mm: Convert pgd_page_get_mm() to ptdescs
Date: Mon, 29 Jun 2026 11:57:40 -0700
Message-ID: <20260629185742.126987-8-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629185742.126987-1-vishal.moola@gmail.com>
References: <20260629185742.126987-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1782759547-AE7291CC-2FCEADF0/0/0
X-purgate-type: clean
X-purgate-size: 3730
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
X-Rspamd-Queue-Id: CB4D36DE2D0

Convert pgd_page_get_mm() to ptdescs. Define struct ptdesc in our
pgtable_types so that our declarations recognize ptdesc as an
appropriate page table type.

Now that all callers are using ptdescs, we can pass in that
ptdesc to get the underlying mm_struct.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: William Kucharski <william.kucharski@linux.dev>
Signed-off-by: Vishal Moola <vishal.moola@gmail.com>
---
 arch/x86/include/asm/pgtable.h       | 2 +-
 arch/x86/include/asm/pgtable_types.h | 2 +-
 arch/x86/mm/fault.c                  | 2 +-
 arch/x86/mm/init_64.c                | 4 ++--
 arch/x86/mm/pgtable.c                | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index ac295ca6c92f..dd046f29ec31 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -50,7 +50,7 @@ void ptdump_walk_user_pgd_level_checkwx(void);
 extern spinlock_t pgd_lock;
 extern struct list_head pgd_list;
 
-extern struct mm_struct *pgd_page_get_mm(struct page *page);
+struct mm_struct *pgd_page_get_mm(struct ptdesc *pt);
 
 extern pmdval_t early_pmd_flags;
 
diff --git a/arch/x86/include/asm/pgtable_types.h b/arch/x86/include/asm/pgtable_types.h
index 2ec250ba467e..95c7f453db17 100644
--- a/arch/x86/include/asm/pgtable_types.h
+++ b/arch/x86/include/asm/pgtable_types.h
@@ -512,7 +512,7 @@ static inline pgprot_t pgprot_large_2_4k(pgprot_t pgprot)
 	return __pgprot(protval_large_2_4k(pgprot_val(pgprot)));
 }
 
-
+struct ptdesc;
 typedef struct page *pgtable_t;
 
 extern pteval_t __supported_pte_mask;
diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index c31ffeac0714..aa88370ce739 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -282,7 +282,7 @@ void arch_sync_kernel_mappings(unsigned long start, unsigned long end)
 			spinlock_t *pgt_lock;
 
 			/* the pgt_lock only for Xen */
-			pgt_lock = &pgd_page_get_mm(ptdesc_page(ptdesc))->page_table_lock;
+			pgt_lock = &pgd_page_get_mm(ptdesc)->page_table_lock;
 
 			spin_lock(pgt_lock);
 			vmalloc_sync_one(ptdesc_address(ptdesc), addr);
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index a6ccb83f2d26..a49be75dd713 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -152,7 +152,7 @@ static void sync_global_pgds_l5(unsigned long start, unsigned long end)
 
 			pgd = (pgd_t *)ptdesc_address(ptdesc) + pgd_index(addr);
 			/* the pgt_lock only for Xen */
-			pgt_lock = &pgd_page_get_mm(ptdesc_page(ptdesc))->page_table_lock;
+			pgt_lock = &pgd_page_get_mm(ptdesc)->page_table_lock;
 			spin_lock(pgt_lock);
 
 			if (!pgd_none(*pgd_ref) && !pgd_none(*pgd))
@@ -195,7 +195,7 @@ static void sync_global_pgds_l4(unsigned long start, unsigned long end)
 			pgd = (pgd_t *)ptdesc_address(ptdesc) + pgd_index(addr);
 			p4d = p4d_offset(pgd, addr);
 			/* the pgt_lock only for Xen */
-			pgt_lock = &pgd_page_get_mm(ptdesc_page(ptdesc))->page_table_lock;
+			pgt_lock = &pgd_page_get_mm(ptdesc)->page_table_lock;
 			spin_lock(pgt_lock);
 
 			if (!p4d_none(*p4d_ref) && !p4d_none(*p4d))
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index f32facdb3035..cb03f5a2b243 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -74,9 +74,9 @@ static void pgd_set_mm(pgd_t *pgd, struct mm_struct *mm)
 	virt_to_ptdesc(pgd)->pt_mm = mm;
 }
 
-struct mm_struct *pgd_page_get_mm(struct page *page)
+struct mm_struct *pgd_page_get_mm(struct ptdesc *pt)
 {
-	return page_ptdesc(page)->pt_mm;
+	return pt->pt_mm;
 }
 
 static void pgd_ctor(struct mm_struct *mm, pgd_t *pgd)
-- 
2.54.0


