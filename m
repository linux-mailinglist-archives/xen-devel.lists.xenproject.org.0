Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0527140C410
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 13:01:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187488.336364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQSek-0001i2-8D; Wed, 15 Sep 2021 11:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187488.336364; Wed, 15 Sep 2021 11:00:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQSek-0001fe-5G; Wed, 15 Sep 2021 11:00:46 +0000
Received: by outflank-mailman (input) for mailman id 187488;
 Wed, 15 Sep 2021 11:00:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3xTB=OF=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1mQSeY-0001fY-KQ
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 11:00:44 +0000
Received: from mail.skyhub.de (unknown [2a01:4f8:190:11c2::b:1457])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6a073c2-51c7-4451-8008-8a06cc411f2f;
 Wed, 15 Sep 2021 11:00:32 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0d07000c3d48728178681f.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0d:700:c3d:4872:8178:681f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9F7E51EC0493;
 Wed, 15 Sep 2021 13:00:26 +0200 (CEST)
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
X-Inumbo-ID: c6a073c2-51c7-4451-8008-8a06cc411f2f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1631703626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VhruTfx6a1vn9bJbkqwEzxTY41J4MJGsLlefXt9yGLg=;
	b=AoZxQDh0ovGCZp36TVoMqssSPPir4S4CLUTje3ga2Sl4kb+jKndFyxzIQAdJXNZ2UdIJ6s
	kfLUqWGA4EkHlLtO7vdZeGBKfn+T4gB2KoAzSvk/LcfcYioMbDg/OWsjZTxwkOGmMUGJ43
	XiSdKkF3s8/MlzVxKAN0eN5YeTY07vg=
Date: Wed, 15 Sep 2021 13:00:20 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH] x86/setup: call early_reserve_memory() earlier
Message-ID: <YUHSRKubsGT2Jvur@zn.tnic>
References: <20210914094108.22482-1-jgross@suse.com>
 <b15fa98e-f9a8-abac-2d16-83c29dafc517@suse.com>
 <6cdc71dc-c26d-5c59-b7dd-0eb47ab9c861@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6cdc71dc-c26d-5c59-b7dd-0eb47ab9c861@suse.com>

You forgot to Cc Mike, lemme add him.

And drop stable@ too.

On Tue, Sep 14, 2021 at 01:06:22PM +0200, Juergen Gross wrote:
> On 14.09.21 12:03, Jan Beulich wrote:
> > On 14.09.2021 11:41, Juergen Gross wrote:
> > > Commit a799c2bd29d19c565 ("x86/setup: Consolidate early memory
> > > reservations") introduced early_reserve_memory() to do all needed
> > > initial memblock_reserve() calls in one function. Unfortunately the
> > > call of early_reserve_memory() is done too late for Xen dom0, as in
> > > some cases a Xen hook called by e820__memory_setup() will need those
> > > memory reservations to have happened already.
> > > 
> > > Move the call of early_reserve_memory() to the beginning of
> > > setup_arch() in order to avoid such problems.
> > > 
> > > Cc: stable@vger.kernel.org
> > > Fixes: a799c2bd29d19c565 ("x86/setup: Consolidate early memory reservations")
> > > Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > ---
> > >   arch/x86/kernel/setup.c | 24 ++++++++++++------------
> > >   1 file changed, 12 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> > > index 79f164141116..f369c51ec580 100644
> > > --- a/arch/x86/kernel/setup.c
> > > +++ b/arch/x86/kernel/setup.c
> > > @@ -757,6 +757,18 @@ dump_kernel_offset(struct notifier_block *self, unsigned long v, void *p)
> > >   void __init setup_arch(char **cmdline_p)
> > >   {
> > > +	/*
> > > +	 * Do some memory reservations *before* memory is added to
> > > +	 * memblock, so memblock allocations won't overwrite it.
> > > +	 * Do it after early param, so we could get (unlikely) panic from
> > > +	 * serial.
> > 
> > Hmm, this part of the comment is not only stale now, but gets actively
> > undermined. No idea how likely such a panic() would be, and hence how
> > relevant it is to retain this particular property.
> 
> Ah, right.
> 
> The alternative would be to split it up again. Let's let the x86
> maintainers decide which way is the better one.
> 
> 
> Juergen
> 
> > 
> > Jan
> > 
> > > +	 * After this point everything still needed from the boot loader or
> > > +	 * firmware or kernel text should be early reserved or marked not
> > > +	 * RAM in e820. All other memory is free game.
> > > +	 */
> > > +	early_reserve_memory();
> > > +
> > >   #ifdef CONFIG_X86_32
> > >   	memcpy(&boot_cpu_data, &new_cpu_data, sizeof(new_cpu_data));
> > > @@ -876,18 +888,6 @@ void __init setup_arch(char **cmdline_p)
> > >   	parse_early_param();
> > > -	/*
> > > -	 * Do some memory reservations *before* memory is added to
> > > -	 * memblock, so memblock allocations won't overwrite it.
> > > -	 * Do it after early param, so we could get (unlikely) panic from
> > > -	 * serial.
> > > -	 *
> > > -	 * After this point everything still needed from the boot loader or
> > > -	 * firmware or kernel text should be early reserved or marked not
> > > -	 * RAM in e820. All other memory is free game.
> > > -	 */
> > > -	early_reserve_memory();
> > > -
> > >   #ifdef CONFIG_MEMORY_HOTPLUG
> > >   	/*
> > >   	 * Memory used by the kernel cannot be hot-removed because Linux
> > > 
> > 
> 






-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

