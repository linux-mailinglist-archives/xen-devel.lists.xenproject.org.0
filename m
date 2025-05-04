Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72659AA8480
	for <lists+xen-devel@lfdr.de>; Sun,  4 May 2025 09:16:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975522.1362938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBTZq-0004cI-8e; Sun, 04 May 2025 07:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975522.1362938; Sun, 04 May 2025 07:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBTZq-0004Zj-5n; Sun, 04 May 2025 07:15:54 +0000
Received: by outflank-mailman (input) for mailman id 975522;
 Sun, 04 May 2025 07:15:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9KSG=XU=linux-foundation.org=akpm@srs-se1.protection.inumbo.net>)
 id 1uBTZo-0004ZK-Sr
 for xen-devel@lists.xenproject.org; Sun, 04 May 2025 07:15:52 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9aab5463-28b7-11f0-9ffb-bf95429c2676;
 Sun, 04 May 2025 09:15:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C6CF2A4C040;
 Sun,  4 May 2025 07:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF4ACC4CEE7;
 Sun,  4 May 2025 07:15:47 +0000 (UTC)
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
X-Inumbo-ID: 9aab5463-28b7-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746342948;
	bh=VFl4En76y+OpLSujTCsVixWtJLfVBo8Fs18pWu67NIM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=2uXzKB5tvtLWjn/EIY9A1H8ngwh4gxek1y6s8EfSOlGHERXtBEhbis3cIKTA95NjD
	 yjN42znkaYuXQtcC5AV7PmRQ432nN/JjnMJEbs5NSR1otBH6CPfHyYBriZnESpnGbC
	 /m0ml7+nmhQfFTbiTpnqkt55ZUJbHolqqTwmGm24=
Date: Sun, 4 May 2025 00:15:47 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Hildenbrand <david@redhat.com>
Cc: Petr =?UTF-8?Q?Van=C4=9Bk?= <arkamar@atlas.cz>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Ryan Roberts <ryan.roberts@arm.com>,
 xen-devel@lists.xenproject.org, x86@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/1] mm: fix folio_pte_batch() on XEN PV
Message-Id: <20250504001547.177b2aba8c2ffbfe63e0552e@linux-foundation.org>
In-Reply-To: <9e3fb101-9a5d-43bb-924a-0df3c38333f8@redhat.com>
References: <20250502215019.822-1-arkamar@atlas.cz>
	<20250502215019.822-2-arkamar@atlas.cz>
	<20250503182858.5a02729fcffd6d4723afcfc2@linux-foundation.org>
	<9e3fb101-9a5d-43bb-924a-0df3c38333f8@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 4 May 2025 08:47:45 +0200 David Hildenbrand <david@redhat.com> wrote:

> > 
> > Methinks max_nr really wants to be unsigned long. 
> 
> We only batch within a single PTE table, so an integer was sufficient.
> 
> The unsigned value is the result of a discussion with Ryan regarding similar/related
> (rmap) functions:
> 
> "
> Personally I'd go with signed int (since
> that's what all the counters in struct folio that we are manipulating are,
> underneath the atomic_t) then check that nr_pages > 0 in
> __folio_rmap_sanity_checks().
> "
> 
> https://lore.kernel.org/linux-mm/20231204142146.91437-14-david@redhat.com/T/#ma0bfff0102f0f2391dfa94aa22a8b7219b92c957
> 
> As soon as we let "max_nr" be an "unsigned long", also the return value
> should be an "unsigned long", and everybody calling that function.
> 
> In this case here, we should likely just use whatever type "max_nr" is.
> 
> Not sure myself if we should change that here to unsigned long or long. Some
> callers also operate with the negative values IIRC (e.g., adjust the RSS by doing -= nr).

"rss -= nr" doesn't require, expect or anticipate that `nr' can be negative!

> 
> > That will permit the
> > cleanup of quite a bit of truncation, extension, signedness conversion
> > and general type chaos in folio_pte_batch()'s various callers.
> > > And...
> > 
> > Why does folio_nr_pages() return a signed quantity?  It's a count.
> 
> A partial answer is in 1ea5212aed068 ("mm: factor out large folio handling
> from folio_nr_pages() into folio_large_nr_pages()"), where I stumbled over the
> reason for a signed value myself and at least made the other
> functions be consistent with folio_nr_pages():
> 
> "
>      While at it, let's consistently return a "long" value from all these
>      similar functions.  Note that we cannot use "unsigned int" (even though
>      _folio_nr_pages is of that type), because it would break some callers that
>      do stuff like "-folio_nr_pages()".  Both "int" or "unsigned long" would
>      work as well.
> 
> "
> 
> Note that folio_nr_pages() returned a "long" since the very beginning. Probably using
> a signed value for consistency because also mapcounts / refcounts are all signed.

Geeze.

Can we step back and look at what we're doing?  Anything which counts
something (eg, has "nr" in the identifier) cannot be negative.

It's that damn "int" thing.  I think it was always a mistake that the C
language's go-to type is a signed one.  It's a system programming
language and system software rarely deals with negative scalars. 
Signed scalars are the rare case.

I do expect that the code in and around here would be cleaner and more
reliable if we were to do a careful expunging of inappropriately signed
variables.

> 
> > 
> > And why the heck is folio_pte_batch() inlined?  It's larger then my
> > first hard disk and it has five callsites!
> 
> :)
> 
> In case of fork/zap we really want it inlined because
> 
> (1) We want to optimize out all of the unnecessary checks we added for other users
> 
> (2) Zap/fork code is very sensitive to function call overhead
> 
> Probably, as that function sees more widespread use, we might want a
> non-inlined variant that can be used in places where performance doesn't
> matter all that much (although I am not sure there will be that many).

a quick test.

before:
   text	   data	    bss	    dec	    hex	filename
  12380	    470	      0	  12850	   3232	mm/madvise.o
  52975	   2689	     24	  55688	   d988	mm/memory.o
  25305	   1448	   2096	  28849	   70b1	mm/mempolicy.o
   8573	    924	      4	   9501	   251d	mm/mlock.o
  20950	   5864	     16	  26830	   68ce	mm/rmap.o

 (120183)

after:

   text	   data	    bss	    dec	    hex	filename
  11916	    470	      0	  12386	   3062	mm/madvise.o
  52990	   2697	     24	  55711	   d99f	mm/memory.o
  25161	   1448	   2096	  28705	   7021	mm/mempolicy.o
   8381	    924	      4	   9309	   245d	mm/mlock.o
  20806	   5864	     16	  26686	   683e	mm/rmap.o

 (119254)

so uninlining saves a kilobyte of text - less than I expected but
almost 1%.

Quite a lot of the inlines in internal.h could do with having a
critical eye upon them.

