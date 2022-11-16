Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 561B162B07A
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 02:20:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444113.698963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ov759-0008W8-RZ; Wed, 16 Nov 2022 01:19:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444113.698963; Wed, 16 Nov 2022 01:19:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ov759-0008TH-O1; Wed, 16 Nov 2022 01:19:15 +0000
Received: by outflank-mailman (input) for mailman id 444113;
 Wed, 16 Nov 2022 01:19:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CGj7=3Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ov757-0008TB-CB
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 01:19:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac59791c-654c-11ed-91b6-6bf2151ebd3b;
 Wed, 16 Nov 2022 02:19:11 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B2ED7612C5;
 Wed, 16 Nov 2022 01:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EBCCC433D6;
 Wed, 16 Nov 2022 01:19:07 +0000 (UTC)
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
X-Inumbo-ID: ac59791c-654c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668561549;
	bh=JYQq041R94EZJjtnqoaotWOzKK3sbn68ph6ek3e+epc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dR7xN2I9C4Z7SdQmj4C5SYLWzFO1k2DKXnA9acUAxa+oCiByOuwHFC7rIHoMbuImV
	 I7W6aQ+b6ZPXqPrDWegtKEpgDihbDlcHZ8Hi9f/kgV8PGT9j/1LTOXLEzGcQlh8ooU
	 uBsVtQ6N5c21kcoQHmURnA0aBCY/eWfj7arluuyrDnz9CwYYX7lWnAMG2NsKX4kRMH
	 TTPJocyoox/a5x0YBfQnuZYmWA/nkOeRpIhpStCu6/UXh5n6Z15im4446jMqn4+shl
	 PAVyMY+p7Wytdahba5iN0VAjA23Dgx37RfHnE424uQ6lF6oiRfvYx8hc6C8YGreiOp
	 f9J7e2IaIQ90Q==
Date: Tue, 15 Nov 2022 17:19:05 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: George Dunlap <dunlapg@umich.edu>
cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, 
    Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Henry Wang <Henry.Wang@arm.com>, 
    Anthony Perard <anthony.perard@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 1/4] xen: Introduce non-broken hypercalls for the p2m
 pool size
In-Reply-To: <CAFLBxZbWkLSMxXAYRGYc9Z3Vvj6bT+m7nvdiZgWRdr+_nF0BfQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2211151715540.4020@ubuntu-linux-20-04-desktop>
References: <20221026102018.4144-1-andrew.cooper3@citrix.com> <20221026102018.4144-2-andrew.cooper3@citrix.com> <ffb8bdb8-f54b-2107-ce1a-775337c172ac@suse.com> <0f048bd2-d08c-8bd5-2a20-7e49e794c679@citrix.com> <8a8bc184-6237-ed24-8d9f-daa3c36df915@suse.com>
 <CAFLBxZbWkLSMxXAYRGYc9Z3Vvj6bT+m7nvdiZgWRdr+_nF0BfQ@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-670147019-1668561549=:4020"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-670147019-1668561549=:4020
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 28 Oct 2022, George Dunlap wrote:
> On Thu, Oct 27, 2022 at 8:12 AM Jan Beulich <jbeulich@suse.com> wrote:
>       On 26.10.2022 21:22, Andrew Cooper wrote:
>       > On 26/10/2022 14:42, Jan Beulich wrote:
> 
>  
>       > paging isn't a great name.  While it's what we call the infrastructure
>       > in x86, it has nothing to do with paging things out to disk (the thing
>       > everyone associates the name with), nor the xenpaging infrastructure
>       > (Xen's version of what OS paging supposedly means).
> 
>       Okay, "paging" can be somewhat misleading. But "p2m" also doesn't fit
>       the use(s) on x86. Yet we'd like to use a name clearly better than the
>       previous (and yet more wrong/misleading) "shadow". I have to admit that
>       I can't think of any other sensible name, and among the ones discussed
>       I still think "paging" is the one coming closest despite the
>       generally different meaning of the word elsewhere.
> 
> 
> Inside the world of operating systems / hypervisors, "paging" has always meant "things related to a pagetable"; this includes "paging out
> to disk".  In fact, the latter already has a perfectly good name -- "swap" (e.g., swap file, swappiness, hypervisor swap).
> 
> Grep for "paging" inside of Xen.  We have the paging lock, paging modes, nested paging, and so on.  There's absolutely no reason to start
> thinking of "paging" as exclusively meaning "hypervisor swap".
>  
> [ A bunch of stuff about using bytes as a unit size]
> 
>       > This is going to be a reoccurring theme through fixing the ABIs.  Its
>       > one of a several areas where there is objectively one right answer, both
>       > in terms of ease of use, and compatibility to future circumstances.
> 
>       Well, I wouldn't say using whatever base granularity as a unit is
>       "objectively" less right.
> 
> 
> Personally I don't think bytes or pages either have a particular advantage:
> 
> * Using bytes
>  - Advantage: Can always use the same number regardless of the underlying page size
>  - Disadvantage: "Trap" where if you forget to check the page size, you might accidentally pass an invalid input.  Or to put it
> differently, most "reasonable-looking" numbers are actually invalid (since most numbers aren't page-aligned)/
> * Using pages
>  - Advantage: No need to check page alignment in HV, no accidentally invalid input
>  - Disadvantage: Caller must check page size and do a shift on every call
> 
> What would personally tip me one way or the other is consistency with other hypercalls.  If most of our hypercalls (or even most of our MM
> hypercalls) use bytes, then I'd lean towards bytes.  Whereas if most of our hypercalls use pages, I'd lean towards pages.


Joining the discussion late to try to move things forward.

Let me premise that I don't have a strong feeling either way, but I
think it would be clearer to use "bytes" instead of "pages" as argument.
The reason is that with pages you are never sure of the actual
granularity. Is it 4K? 16K? 64K? Especially considering that hypervisor
pages can be of different size than guest pages. In theory you could
have a situation where Xen uses 4K, Dom0 uses 16K and domU uses 64K, or
any combination of the three. With bytes, at least you know the actual
size.

If we use "bytes" as argument, then it also makes sense not to use the
word "pages" in the hypercall name.

That said, any name would work and both bytes and pages would work, so
I would leave it to the contributor who is doing the work to choose.
--8323329-670147019-1668561549=:4020--

