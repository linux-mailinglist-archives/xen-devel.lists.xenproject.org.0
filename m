Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F27440D599
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 11:12:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188266.337367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQnQU-0002hM-07; Thu, 16 Sep 2021 09:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188266.337367; Thu, 16 Sep 2021 09:11:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQnQT-0002ep-T6; Thu, 16 Sep 2021 09:11:25 +0000
Received: by outflank-mailman (input) for mailman id 188266;
 Thu, 16 Sep 2021 09:09:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZTNT=OG=kernel.org=rppt@srs-us1.protection.inumbo.net>)
 id 1mQnOh-0001q1-6d
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 09:09:35 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc95ff71-0a91-46a1-986e-218db9df7375;
 Thu, 16 Sep 2021 09:09:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0125F60F93;
 Thu, 16 Sep 2021 09:09:30 +0000 (UTC)
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
X-Inumbo-ID: dc95ff71-0a91-46a1-986e-218db9df7375
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631783373;
	bh=aVfsrAoPBPm3coDtX7qouVYko5lvAFm1LHfu7NPpcGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MneUb0wyDDhB+jVjJDBgKLy9ijrzyLgrNSegUd6/ufKx2wmAO77YL8v1W7Ik0xdcu
	 4kcQiXhxthJmd4+/P0YKZRygro6d9sojkrXTR8Gaja+JSCcb3r14aRIlhK6xhphcfK
	 qhbs0IdIZmoR9gBA+I2tNMHb6bCZc6MqwwZeuqcolYjGaNZxL3uWnXOZagZWVh9sns
	 U3PWs9FQpVTaifKmtsAkRDOKLj7KOgFlYDvJqD3T+JUYBxhB+SZ/zBs7/5KbHCVe3I
	 ahEtu6Hs6WXeX5OzurOobc3oH1U32Gfu1KZxQ+MkTp5e3qXuV7eZ2mmeOeooyBfxIA
	 CyUVnQXowSVKA==
Date: Thu, 16 Sep 2021 12:09:27 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/setup: call early_reserve_memory() earlier
Message-ID: <YUMJx2ckLlWKi3VF@kernel.org>
References: <20210914094108.22482-1-jgross@suse.com>
 <b15fa98e-f9a8-abac-2d16-83c29dafc517@suse.com>
 <6cdc71dc-c26d-5c59-b7dd-0eb47ab9c861@suse.com>
 <YUHSRKubsGT2Jvur@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YUHSRKubsGT2Jvur@zn.tnic>

On Wed, Sep 15, 2021 at 01:00:20PM +0200, Borislav Petkov wrote:
> You forgot to Cc Mike, lemme add him.
> 
> And drop stable@ too.
> 
> On Tue, Sep 14, 2021 at 01:06:22PM +0200, Juergen Gross wrote:
> > On 14.09.21 12:03, Jan Beulich wrote:
> > > On 14.09.2021 11:41, Juergen Gross wrote:
> > > > Commit a799c2bd29d19c565 ("x86/setup: Consolidate early memory
> > > > reservations") introduced early_reserve_memory() to do all needed
> > > > initial memblock_reserve() calls in one function. Unfortunately the
> > > > call of early_reserve_memory() is done too late for Xen dom0, as in
> > > > some cases a Xen hook called by e820__memory_setup() will need those
> > > > memory reservations to have happened already.
> > > > 
> > > > Move the call of early_reserve_memory() to the beginning of
> > > > setup_arch() in order to avoid such problems.
> > > > 
> > > > Cc: stable@vger.kernel.org
> > > > Fixes: a799c2bd29d19c565 ("x86/setup: Consolidate early memory reservations")
> > > > Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > > ---
> > > >   arch/x86/kernel/setup.c | 24 ++++++++++++------------
> > > >   1 file changed, 12 insertions(+), 12 deletions(-)
> > > > 
> > > > diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> > > > index 79f164141116..f369c51ec580 100644
> > > > --- a/arch/x86/kernel/setup.c
> > > > +++ b/arch/x86/kernel/setup.c
> > > > @@ -757,6 +757,18 @@ dump_kernel_offset(struct notifier_block *self, unsigned long v, void *p)
> > > >   void __init setup_arch(char **cmdline_p)
> > > >   {
> > > > +	/*
> > > > +	 * Do some memory reservations *before* memory is added to
> > > > +	 * memblock, so memblock allocations won't overwrite it.
> > > > +	 * Do it after early param, so we could get (unlikely) panic from
> > > > +	 * serial.
> > > 
> > > Hmm, this part of the comment is not only stale now, but gets actively
> > > undermined. No idea how likely such a panic() would be, and hence how
> > > relevant it is to retain this particular property.
> > 
> > Ah, right.
> > 
> > The alternative would be to split it up again. Let's let the x86
> > maintainers decide which way is the better one.

I think the first sentence about reserving memory before memblock
allocations are possible is important and I think we should keep it.

With that

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> > 
> > 
> > Juergen
> > 
> > > 
> > > Jan
> > > 
> > > > +	 * After this point everything still needed from the boot loader or
> > > > +	 * firmware or kernel text should be early reserved or marked not
> > > > +	 * RAM in e820. All other memory is free game.
> > > > +	 */
> > > > +	early_reserve_memory();
> > > > +
> > > >   #ifdef CONFIG_X86_32
> > > >   	memcpy(&boot_cpu_data, &new_cpu_data, sizeof(new_cpu_data));
> > > > @@ -876,18 +888,6 @@ void __init setup_arch(char **cmdline_p)
> > > >   	parse_early_param();
> > > > -	/*
> > > > -	 * Do some memory reservations *before* memory is added to
> > > > -	 * memblock, so memblock allocations won't overwrite it.
> > > > -	 * Do it after early param, so we could get (unlikely) panic from
> > > > -	 * serial.
> > > > -	 *
> > > > -	 * After this point everything still needed from the boot loader or
> > > > -	 * firmware or kernel text should be early reserved or marked not
> > > > -	 * RAM in e820. All other memory is free game.
> > > > -	 */
> > > > -	early_reserve_memory();
> > > > -
> > > >   #ifdef CONFIG_MEMORY_HOTPLUG
> > > >   	/*
> > > >   	 * Memory used by the kernel cannot be hot-removed because Linux
> > > > 
> > > 
> > 
> 
> 
> 
> 
> 
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette

-- 
Sincerely yours,
Mike.

