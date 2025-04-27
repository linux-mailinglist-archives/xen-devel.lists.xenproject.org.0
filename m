Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E928CA9E4AB
	for <lists+xen-devel@lfdr.de>; Sun, 27 Apr 2025 23:15:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.969961.1358789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u99L2-0004bI-8b; Sun, 27 Apr 2025 21:15:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 969961.1358789; Sun, 27 Apr 2025 21:15:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u99L2-0004Z9-5g; Sun, 27 Apr 2025 21:15:00 +0000
Received: by outflank-mailman (input) for mailman id 969961;
 Sun, 27 Apr 2025 21:14:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ek1t=XN=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1u99L0-0004Z0-9R
 for xen-devel@lists.xenproject.org; Sun, 27 Apr 2025 21:14:58 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa4f72f6-23ac-11f0-9eb4-5ba50f476ded;
 Sun, 27 Apr 2025 23:14:56 +0200 (CEST)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53RLEA8k2362694
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Sun, 27 Apr 2025 14:14:11 -0700
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
X-Inumbo-ID: aa4f72f6-23ac-11f0-9eb4-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53RLEA8k2362694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745788453;
	bh=Ze1m1OgbxcZfPaCNHEsBfR0ywbk+v9kZ91CvQZouTMQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=a2YmdlaIpllK835AsIbUOmmWXu+BdsjFA1bIjZtd1rmCRff4rMiC+tSkF8J24IgC9
	 9p/avXlujTKy0r9goDgxLmoif74E6xkCuwoxS2CcjD1XCvHudk4BFNG/s24W4ylej+
	 G0H1C/e9P+j65UBjqmqvvcDjFyOOpq5stU3gxzJLbn2immFU+9L/XBEU361oQW7Xp1
	 TuWbeKVswwCjnVuPOTaa+CHfw1ZhXxpXtxYO3Spsha0qWTX/bv85jbqIyAd4gnCEHN
	 +D6Wyj0SrnQeaJOeQSEo1r1ePHt9AAxAsTLsWmNfuHD9CrCOKX3DqE6MMHKnLUha3t
	 Ke7xCgh5ffqTQ==
Date: Sun, 27 Apr 2025 14:14:08 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Cooper <andrew.cooper3@citrix.com>
CC: Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Alexander Usyskin <alexander.usyskin@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
User-Agent: K-9 Mail for Android
In-Reply-To: <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com> <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com> <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com> <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com> <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com> <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
Message-ID: <D7FA06C2-119D-4405-9116-AC3203216406@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 27, 2025 12:34:46 PM PDT, Linus Torvalds <torvalds@linux-foundatio=
n=2Eorg> wrote:
>On Sun, 27 Apr 2025 at 12:17, Andrew Cooper <andrew=2Ecooper3@citrix=2Eco=
m> wrote:
>>
>> ffs/fls are commonly found inside loops where x is the loop condition
>> too=2E  Therefore, using statically_true() to provide a form without th=
e
>> zero compatibility turns out to be a win=2E
>
>We already have the version without the zero capability - it's just
>called "__ffs()" and "__fls()", and performance-critical code uses
>those=2E
>
>So fls/ffs are the "standard" library functions that have to handle
>zero, and add that stupid "+1" because that interface was designed by
>some Pascal person who doesn't understand that we start counting from
>0=2E
>
>Standards bodies: "companies aren't sending their best people"=2E
>
>But it's silly that we then spend effort on magic cmov in inline asm
>on those things when it's literally the "don't use this version unless
>you don't actually care about performance" case=2E
>
>I don't think it would be wrong to just make the x86-32 code just do
>the check against zero ahead of time - in C=2E
>
>And yes, that will generate some extra code - you'll test for zero
>before, and then the caller might also test for a zero result that
>then results in another test for zero that can't actually happen (but
>the compiler doesn't know that)=2E But I suspect that on the whole, it
>is likely to generate better code anyway just because the compiler
>sees that first test and can DTRT=2E
>
>UNTESTED patch applied in case somebody wants to play with this=2E It
>removes 10 lines of silly code, and along with them that 'cmov' use=2E
>
>Anybody?
>
>              Linus

It's noteworthy that hardware implementations are now invariably using a d=
ifferent interface, which makes sense for the LSB case (tzcnt/ctz) but has =
its own drain bramage on for the MSB case (lzcnt/clz)=2E=2E=2E

