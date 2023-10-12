Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 387BE7C6FFE
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 16:05:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615803.957240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqwJL-0002P2-JE; Thu, 12 Oct 2023 14:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615803.957240; Thu, 12 Oct 2023 14:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqwJL-0002MT-GS; Thu, 12 Oct 2023 14:05:11 +0000
Received: by outflank-mailman (input) for mailman id 615803;
 Thu, 12 Oct 2023 14:05:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VOhV=F2=infradead.org=willy@srs-se1.protection.inumbo.net>)
 id 1qqwJK-0002Ks-Cn
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 14:05:10 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a26a0e8-6908-11ee-98d4-6d05b1d4d9a1;
 Thu, 12 Oct 2023 16:05:09 +0200 (CEST)
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qqwJA-00HHti-AI; Thu, 12 Oct 2023 14:05:00 +0000
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
X-Inumbo-ID: 5a26a0e8-6908-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZBo794QmPX3OSdLUZmZOt9sFww07PNz5cEeadQ3oMTs=; b=JnYKQQ0WWPVh7MTBsIeRXAwbLL
	3Mwulrlk764uN7k72IIbGXPlnVNdxd3DuP4FTtyqiQnYS/iJYcdNTemsLwfEgOqlceI9dvtMMyEHs
	tfsBcDwsfLzDTytRS+2uDlOzsYKG5vky7nyWiDPxhzrcUkNDlNEsbpRfSRlD91Ay1avH0/H8No0jf
	H6IApE3ZYsLteuzasQpZf0ILGJ8UT1mtlrE1sUqLngnW6ErDWU11lQn0s0bwMhqjlgdDLhALloRuP
	FdW1bavmsQroJdnauzfu0g4F4zr+DwIUpGvdzdq6oMChW9V6z73MZ7kHeFDwH58leQykL0PKBuaHJ
	SyuSi4IQ==;
Date: Thu, 12 Oct 2023 15:05:00 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Mike Rapoport <rppt@kernel.org>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 06/38] mm: Add default definition of set_ptes()
Message-ID: <ZSf9DNSvgbT9DLmk@casper.infradead.org>
References: <20230802151406.3735276-1-willy@infradead.org>
 <20230802151406.3735276-7-willy@infradead.org>
 <4c63ee3634ccfed7d687fcbdd9db60663bce481f.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c63ee3634ccfed7d687fcbdd9db60663bce481f.camel@infradead.org>

On Thu, Oct 12, 2023 at 02:53:05PM +0100, David Woodhouse wrote:
> > +       arch_enter_lazy_mmu_mode();
> > +       for (;;) {
> > +               set_pte(ptep, pte);
> > +               if (--nr == 0)
> > +                       break;
> > +               ptep++;
> > +               pte = __pte(pte_val(pte) + (1UL << PFN_PTE_SHIFT));
> > +       }
> > +       arch_leave_lazy_mmu_mode();
> 
> This breaks the Xen PV guest.
> 
> In move_ptes() in mm/mremap.c we arch_enter_lazy_mmu_mode() and then
> loop calling set_pte_at(). Which now (or at least in a few commits time
> when you wire it up for x86 in commit a3e1c9372c9b959) ends up in your
> implementation of set_ptes(), calls arch_enter_lazy_mmu_mode() again,
> and:
> 
> [    0.628700] ------------[ cut here ]------------
> [    0.628718] kernel BUG at arch/x86/kernel/paravirt.c:144!

Easy fix ... don't do that ;-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index af7639c3b0a3..f3da8836f689 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -231,9 +231,11 @@ static inline pte_t pte_next_pfn(pte_t pte)
 static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 		pte_t *ptep, pte_t pte, unsigned int nr)
 {
+	bool multiple = nr > 1;
 	page_table_check_ptes_set(mm, ptep, pte, nr);
 
-	arch_enter_lazy_mmu_mode();
+	if (multiple)
+		arch_enter_lazy_mmu_mode();
 	for (;;) {
 		set_pte(ptep, pte);
 		if (--nr == 0)
@@ -241,7 +243,8 @@ static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 		ptep++;
 		pte = pte_next_pfn(pte);
 	}
-	arch_leave_lazy_mmu_mode();
+	if (multiple)
+		arch_leave_lazy_mmu_mode();
 }
 #endif
 #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)

I think long-term, we should make lazy_mmu_mode nestable.  But this is
a reasonable quick fix.

