Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8192BAA081E
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 12:08:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971756.1360114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9hsu-0000VT-Kr; Tue, 29 Apr 2025 10:08:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971756.1360114; Tue, 29 Apr 2025 10:08:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9hsu-0000Ta-IN; Tue, 29 Apr 2025 10:08:16 +0000
Received: by outflank-mailman (input) for mailman id 971756;
 Tue, 29 Apr 2025 10:08:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G2DP=XP=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1u9hss-0000TU-H8
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 10:08:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id daf36215-24e1-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 12:08:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C5BAF5C2953;
 Tue, 29 Apr 2025 10:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E22C4CEE3;
 Tue, 29 Apr 2025 10:08:05 +0000 (UTC)
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
X-Inumbo-ID: daf36215-24e1-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745921289;
	bh=FNkyaJGp8MfoVlpMeJugXq0KnLpj/jBe07Y8pBAACqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VZKOu799+4V5pW/WeIPX/qMOLrBUca2dqVJr++ECXW2r6WG/1H+svFEldDbiX7Oo/
	 DY94o1FtmcdGss/70ZUqk4LKljL1SvgzZ16Pvv24LIf9hBcyY3/XJyf68AQiZDjjnH
	 L59TxFlHG20sFn7drQpXUlPUJ8ThkOni004ozQLvINNZUhpm+KdEjz3/Qpbg7khDuH
	 I3DrOfWwhOeomddlNJ2qQxoiV/uAX1X4erXjcI2/wTWBJc2z9ALHBdlzAJpLs36VLl
	 yOaXD0OWQbj4s1mQ1vUixWVu+yj/43QylJFIKx1Vy87I6Ai25BDi8HqaBo91TVBiwI
	 exBh1/FcloI/Q==
Date: Tue, 29 Apr 2025 12:08:03 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] bitops/32: Convert variable_ffs() and fls() zero-case
 handling to C
Message-ID: <aBClAy837xcLnVpp@gmail.com>
References: <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>
 <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
 <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
 <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com>
 <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
 <aA8nF0moBYOIgC5J@gmail.com>
 <aA8oqKUaFU-0wb-D@gmail.com>
 <aA8q4Ot-1zTzv_Kt@gmail.com>
 <CAHk-=wh5DUS+nhfTxPEEbaB9dsFib39gWatrX4NoFq_MpdOzGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wh5DUS+nhfTxPEEbaB9dsFib39gWatrX4NoFq_MpdOzGw@mail.gmail.com>


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Mon, 28 Apr 2025 at 00:14, Ingo Molnar <mingo@kernel.org> wrote:
> >
> > And, just out of intellectual curiosity, I also tried to measure the
> > code generation price of the +1 standards-quirk in the fls()/ffs()
> > interface as well:
> >
> > ... and unless I messed up the patch, it seems to have a surprisingly
> > low impact - maybe because the compiler can amortize its cost by
> > adjusting all dependent code mostly at build time, so the +1 doesn't
> > end up being generated most of the time?
> 
> No, I think one issue is that most users actually end up subtracting
> one from the return value of 'ffs()', because the "bit #0 returns 1"
> semantics of the standard ffs() function really is insane.
> 
> It's not just that it doesn't match sane hardware, it's also that it
> doesn't match sane *users*. If bit #0 is set, people want '0', so they
> typically subtract 1.
> 
> So when you stop adding one, you aren't actually removing code -
> you're often adding it.
> 
> Just see how many hits you get from
> 
>     git grep '\<ffs(.*).*-.*1'
> 
> which is obviously not a very precise pattern, but just look at the
> output and see just *how* common that "subtract one" thing is.
> 
> I really don't understand how anybody *ever* thought that the whole
> "return one bigger" was a good idea for ffs().

Yeah. No argument from me that it's a badly thought out interface - I 
was just surprised that it doesn't seem to impact performance as badly 
as I expected. I have to add that a lot of work went into absorbing the 
negative effects of the ffs()/fls() interfaces:

  starship:~/tip> git grep -Ee '__ffs\(|__fls\(' | wc -l
  1055

So it impacts code quality negatively, which is arguably the worse side 
effect.

> But maybe people really were poisoned by the Pascal mindset. Or maybe 
> it was invented by some ancient Roman who hadn't heard of the concept 
> of zero. Who knows?

Hey, ancient Romans didn't even have the concept of *whitespaces* and 
punctuation to begin with:

    https://historyofinformation.com/images/Vergilius_Augusteus,_Georgica_121.jpg

Lazy stonemasons the lot of them.

Romans were the worst ever coders too I suspect. What have the Romans 
ever done for us??

	Ingo

