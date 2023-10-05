Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C9F7B9932
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 02:21:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612814.952917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoC6Q-0006lD-0s; Thu, 05 Oct 2023 00:20:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612814.952917; Thu, 05 Oct 2023 00:20:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoC6P-0006iX-T5; Thu, 05 Oct 2023 00:20:29 +0000
Received: by outflank-mailman (input) for mailman id 612814;
 Thu, 05 Oct 2023 00:20:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9m1Y=FT=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qoC6P-0006iO-2M
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 00:20:29 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb8c9315-6314-11ee-98d3-6d05b1d4d9a1;
 Thu, 05 Oct 2023 02:20:27 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 3950K1jr002118
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 4 Oct 2023 20:20:07 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 3950K1YQ002117;
 Wed, 4 Oct 2023 17:20:01 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: fb8c9315-6314-11ee-98d3-6d05b1d4d9a1
Date: Wed, 4 Oct 2023 17:20:01 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        xen-devel@lists.xenproject.org,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: Issue with shared information page on Xen/ARM 4.17
Message-ID: <ZR4BMcO1ekycPc24@mattapan.m5p.com>
References: <ZRxpC7ukhiYvzz5m@mattapan.m5p.com>
 <ZR0erl_OSkNgIQjx@MacBookPdeRoger>
 <c0b67401-dfe5-475f-8640-b66ac32a80fb@xen.org>
 <ZR1gM19i6-vBaXh7@MacBookPdeRoger>
 <b00500ae-76b1-441c-8154-bcdd897734dc@xen.org>
 <ZR1rBP_49Y2V8VF6@MacBookPdeRoger>
 <fe94dcd2-4429-48df-8ebd-59563d43796a@xen.org>
 <ZR18dlMAbCwEOeH4@MacBookPdeRoger>
 <f8242725-7ee0-4fca-a608-d234f8f3b564@xen.org>
 <alpine.DEB.2.22.394.2310041509170.2348112@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2310041509170.2348112@ubuntu-linux-20-04-desktop>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

On Wed, Oct 04, 2023 at 03:52:54PM -0700, Stefano Stabellini wrote:
> On Wed, 4 Oct 2023, Julien Grall wrote:
> > > > If we want to handle such firmware, I think it would be better if we
> > > > provide
> > > > an hypercall that would return the GFN where it is currently mapped.
> > > 
> > > Sure, but such hypercall would be racy, as by the time the gfn is
> > > returned the value could be stale.  Adding a replacing and non
> > > replacing XENMEM_add_to_physmap variations would IMO be better.
> > > 
> > > Anyway, I don't maintain this, so it's up to you.
> > 
> > Bertrand/Stefano, any opinions?
> 
> I think we should fix EDK2 to unmap the shared info in all cases as
> that's simpler and the best implementation. What's the value of keeping
> the mapping around when the OS can't find it? Unless you have an idea on
> how the OS could find the location of the existing EDK2 shared info
> mapping.

I tend to agree.

> It is important not to have 2 different behaviors for the same hypercall
> on ARM and x86, especially when the hypercall looks arch-neutral and an
> operating system would reasonably expect to use it in common code.
> Having different behaviors on ARM/x86 is more error prone than having a
> less-than-ideal hypercall implementation.

I attempted to head this direction with FreeBSD, but there were enough
surrounding differences to make this troublesome to implement.  May be
easier on other OSes with less history though.

I do agree on general principle fewer/smaller differences are better.
Yet I note my earlier patch to have `typedef struct trap_info trap_info_t`
consistently visible didn't go through...

> I agree with Julien that the ARM behavior is the right behavior. Can we
> change the x86 implementation to match ARM somehow?
> 
> If we do, I guess we would end up breaking legacy EDK2?

I agree this ARM behavior does seem appropriate.  Due to longer history
though it will need far more transition time.  If this 4.18 tarballs
aren't out yet, I would try to see whether a warning message could be
implemented *now*.  I estimate the old behavior will need support for
5-10 years.


On Wed, Oct 04, 2023 at 03:42:00PM -0700, Stefano Stabellini wrote:
> Sorry to be pedantic but I am really not familiar with EDK2. Does
> "reserved page" in this context mean a memory page from a reserved
> region marked as reserved in the EFI memory map?

I'm not too familiar either, so a fair amount of what I write is
speculation or guesses.  I'm assuming this refers to "ACPI reserved
page", meaning marked as not for use by the OS.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



