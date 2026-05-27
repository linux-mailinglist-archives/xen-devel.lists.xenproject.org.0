Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Ik1KK/L5FmqEzwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 16:04:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE2B5E586F
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 16:04:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320497.1587822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSEru-0007dA-74; Wed, 27 May 2026 14:04:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320497.1587822; Wed, 27 May 2026 14:04:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSEru-0007Z5-1n; Wed, 27 May 2026 14:04:22 +0000
Received: by outflank-mailman (input) for mailman id 1320497;
 Wed, 27 May 2026 14:04:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vishal.moola@gmail.com>) id 1wSErs-0007At-DA
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 14:04:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSErr-007NXm-PA
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 16:04:19 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a16f9de-e002-0a2a0a5209dd-0a2a4509cc72-34
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 16:04:19 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a16f9e3-2497-0a2a45090019-d155dd2aa985-3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 16:04:19 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-43d75312379so9981903f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 07:04:19 -0700 (PDT)
Received: from fedora (cpc92878-cmbg18-2-0-cust539.5-4.cable.virginm.net.
 [86.16.54.28]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-45edb558f52sm6693771f8f.14.2026.05.27.07.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 07:04:18 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779890659; x=1780495459; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTSySM1IXuxmAttzVws8JAQ2H8JyG4d5fVSSFWyPJsM=;
        b=pwakVudxYbWD/QmHQfrY7ePZFtvyvtopk8zwpr7+wvTuTG1k+El3nRF0XKzHXC63r2
         avPmgrj9oABJA50aRyxiKQYTFqqTzTdGSKIPShZ9M2ai5spVjVvzukLH/qrkygomRQgf
         1VaXJ3DS7EKeGBaYk7EfcVXY2ZHoPd7+DTAl3bGPkP8dsUVz1ejJF4DRnSDIUwv+3ScM
         9k8jzqixkI4YWYbVEGmO9rZW5aKhH8Rhrl0jkm39QIfoYU07LQSfeFPsF1hWW78bIrzg
         Shi6SGcSdvy6UQ5Og11YPDHe/IQ2wxcPedZepbi9612QZRW4qA8N/qcg93wkGfOWoD0F
         6tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779890659; x=1780495459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fTSySM1IXuxmAttzVws8JAQ2H8JyG4d5fVSSFWyPJsM=;
        b=Zg3fqUJW16fAdmVncB5a1mp6ajNo4g40yk/wiEZmG6q5WFL4xuoBDoKPxXNMlEOGFl
         EjZI/GeFyXVVPVRVQhu4N8VhYjWmUh9U5ySAUcTk7PO30P4aAGH7HhbhkyXKu5nUhiR3
         Tb3Z5r19v+l/E61B7v5mBWLQveW9mlzwq0QND4ZhACsYHCxDPhUrLAdkrUserJfSzHKX
         +pU9fU4A4dv+UlVoRj3AIDCLfR7Dxb1ZAFCtscJRcADOseIIoDWvUSFLIu2Wypp9c4Yg
         XPIKg8Cquba+oTOX94Gfj4ff7NeAWmdYwIM9ksS8wOEFMK9RXDBkDrD3gC6/FLYf0NU2
         M6gw==
X-Forwarded-Encrypted: i=1; AFNElJ9hCKMJju77rPXL7r5OeaFfMiJ/JSJZohK/K0oZHNL6k/5QIe17U02fJpRb5gu/ZoJOGXnCDdpKzyA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx43lD7kEf1d15sO+NDYhja5e9GK2sYWZ0QSuWLebZaNFEIjPtL
	XUHC0DhNRYNfh8Dj36IKVyi9T+J5la6CtvpBts7UDVaP1bah3l2jjZKp
X-Gm-Gg: Acq92OHMXT5lWLX1JNvYq8afzKQepRqTxucs8GNKCd9RpLR8ZmQe+k96LbPAjxgDcy6
	wosoyFyM0UyPquFfLlPYAb3S2qSb3I/vvxt6K+YzY8z/vOvFHKSCo7XtaYBPRVlHheUB0f9+7j6
	YNW+QYohz42A0sTudFLcCnVRYr9VvqpEC6FYALKiy0CD5vCprq4aKeJlWS1iqbnu5jfI39n342Y
	Q1+beJ/a/3fRvpMHshvL5XUXvl+E5I1sq5SGLRPxirKu7lgSRS0ZBeAANd1AZVfnCPA1p97S34n
	xWcVvzM2cofjP7GHn2xEm81vuVjwo6+QVLdN1C4vqka/RaqgUuiI8cQ9soDzTvDIBM6gKIlEGnA
	lHp+b4FXIV30c//MaEUPDaPStqbAxwjcYXhawTWxRkTot/F1BWy/4YAiTAqGUjD/3i6yBJni9/y
	y6dpWqWK5P1+l6BmQT795XCtYbK0HdKDdFJzNSZlz2RyMsDwy0z3ZXkGMZ2WEaXKy5GY7IwcLKM
	a8Sm3icesCXzwrbAi2p12b3IsFa/G9Waw==
X-Received: by 2002:a05:6000:2992:10b0:45e:daa9:f34c with SMTP id ffacd0b85a97d-45edaa9f405mr5335873f8f.26.1779890658948;
        Wed, 27 May 2026 07:04:18 -0700 (PDT)
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
Subject: [PATCH 7/9] x86/mm: Convert pgd_page_get_mm() to ptdescs
Date: Wed, 27 May 2026 15:03:14 +0100
Message-ID: <20260527140316.294621-8-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527140316.294621-1-vishal.moola@gmail.com>
References: <20260527140316.294621-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1779890659-8B193A53-29D2D9B8/0/0
X-purgate-type: clean
X-purgate-size: 3613
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	FORGED_SENDER(0.00)[vishalmoola@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,lists.xenproject.org,redhat.com,alien8.de,zytor.com,infradead.org,suse.com,oracle.com,gmail.com];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 2BE2B5E586F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert pgd_page_get_mm() to ptdescs. Define struct ptdesc in our
pgtable_types so that our declarations recognize ptdesc as an
appropriate page table type.

Now that all callers are using ptdescs, we can pass in that
ptdesc to get the underlying mm_struct.

Signed-off-by: Vishal Moola <vishal.moola@gmail.com>
---
 arch/x86/include/asm/pgtable.h       | 2 +-
 arch/x86/include/asm/pgtable_types.h | 2 +-
 arch/x86/mm/fault.c                  | 2 +-
 arch/x86/mm/init_64.c                | 4 ++--
 arch/x86/mm/pgtable.c                | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 2187e9cfcefa..20e8a6ddd2df 100644
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
index 6c72d6668416..4d78c78a0bcc 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -276,7 +276,7 @@ void arch_sync_kernel_mappings(unsigned long start, unsigned long end)
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
index da7f0a03cf90..070e3d310eca 100644
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


