Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655E8AA837E
	for <lists+xen-devel@lfdr.de>; Sun,  4 May 2025 03:30:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975477.1362918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBOAC-0002SK-5n; Sun, 04 May 2025 01:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975477.1362918; Sun, 04 May 2025 01:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBOAC-0002Qi-1M; Sun, 04 May 2025 01:29:04 +0000
Received: by outflank-mailman (input) for mailman id 975477;
 Sun, 04 May 2025 01:29:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9KSG=XU=linux-foundation.org=akpm@srs-se1.protection.inumbo.net>)
 id 1uBOAA-0002Qc-Cz
 for xen-devel@lists.xenproject.org; Sun, 04 May 2025 01:29:02 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27d57f2e-2887-11f0-9eb4-5ba50f476ded;
 Sun, 04 May 2025 03:29:01 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1B242A40294;
 Sun,  4 May 2025 01:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA00C4CEE3;
 Sun,  4 May 2025 01:28:58 +0000 (UTC)
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
X-Inumbo-ID: 27d57f2e-2887-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746322139;
	bh=7n/RkZelCee7HZb0JLnBTglCg0DQoVwRlQDp8IWWaHQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ewOq8mW8UDxL9+9ECv8Qfuakg+agxPoz8hWNSJQFDuvfrugw0npvbJUQxMy9Ahtg+
	 JM0F3+pCCGGpUGYUttE8oLGguaoQalZDqWc1OPU4/Xo3x4IPlVww/z628p+JTtuzL0
	 tuggwHoPh9Wt9A8kV+dO1nYp+gzyXcg1Mw2jHHRc=
Date: Sat, 3 May 2025 18:28:58 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Petr =?UTF-8?B?VmFuxJtr?= <arkamar@atlas.cz>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, David Hildenbrand
 <david@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 xen-devel@lists.xenproject.org, x86@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/1] mm: fix folio_pte_batch() on XEN PV
Message-Id: <20250503182858.5a02729fcffd6d4723afcfc2@linux-foundation.org>
In-Reply-To: <20250502215019.822-2-arkamar@atlas.cz>
References: <20250502215019.822-1-arkamar@atlas.cz>
	<20250502215019.822-2-arkamar@atlas.cz>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri,  2 May 2025 23:50:19 +0200 Petr Vaněk <arkamar@atlas.cz> wrote:

> On XEN PV, folio_pte_batch() can incorrectly batch beyond the end of a
> folio due to a corner case in pte_advance_pfn(). Specifically, when the
> PFN following the folio maps to an invalidated MFN,
> 
> 	expected_pte = pte_advance_pfn(expected_pte, nr);
> 
> produces a pte_none(). If the actual next PTE in memory is also
> pte_none(), the pte_same() succeeds,
> 
> 	if (!pte_same(pte, expected_pte))
> 		break;
> 
> the loop is not broken, and batching continues into unrelated memory.
> 
> ...

Looks OK for now I guess but it looks like we should pay some attention
to what types we're using.

> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -248,11 +248,9 @@ static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
>  		pte_t *start_ptep, pte_t pte, int max_nr, fpb_t flags,
>  		bool *any_writable, bool *any_young, bool *any_dirty)
>  {
> -	unsigned long folio_end_pfn = folio_pfn(folio) + folio_nr_pages(folio);
> -	const pte_t *end_ptep = start_ptep + max_nr;
>  	pte_t expected_pte, *ptep;
>  	bool writable, young, dirty;
> -	int nr;
> +	int nr, cur_nr;
>  
>  	if (any_writable)
>  		*any_writable = false;
> @@ -265,11 +263,15 @@ static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
>  	VM_WARN_ON_FOLIO(!folio_test_large(folio) || max_nr < 1, folio);
>  	VM_WARN_ON_FOLIO(page_folio(pfn_to_page(pte_pfn(pte))) != folio, folio);
>  
> +	/* Limit max_nr to the actual remaining PFNs in the folio we could batch. */
> +	max_nr = min_t(unsigned long, max_nr,
> +		       folio_pfn(folio) + folio_nr_pages(folio) - pte_pfn(pte));
> +

Methinks max_nr really wants to be unsigned long.  That will permit the
cleanup of quite a bit of truncation, extension, signedness conversion
and general type chaos in folio_pte_batch()'s various callers.

And...

Why does folio_nr_pages() return a signed quantity?  It's a count.

And why the heck is folio_pte_batch() inlined?  It's larger then my
first hard disk and it has five callsites!


