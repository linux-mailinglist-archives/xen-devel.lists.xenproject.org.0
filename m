Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAE5A9DDF3
	for <lists+xen-devel@lfdr.de>; Sun, 27 Apr 2025 02:03:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.969469.1358539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8pUI-0000YG-2F; Sun, 27 Apr 2025 00:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 969469.1358539; Sun, 27 Apr 2025 00:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8pUH-0000Vb-Vm; Sun, 27 Apr 2025 00:03:13 +0000
Received: by outflank-mailman (input) for mailman id 969469;
 Sun, 27 Apr 2025 00:03:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ek1t=XN=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1u8pUG-0000VV-0w
 for xen-devel@lists.xenproject.org; Sun, 27 Apr 2025 00:03:12 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00ae6b75-22fb-11f0-9eb3-5ba50f476ded;
 Sun, 27 Apr 2025 02:03:10 +0200 (CEST)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53R02fAD1021270
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Sat, 26 Apr 2025 17:02:41 -0700
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
X-Inumbo-ID: 00ae6b75-22fb-11f0-9eb3-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53R02fAD1021270
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745712163;
	bh=jlk0WySUzgwBSqt89FwWE6HuFZFIM3PirCQAzgIEfcA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=GUyFr7K2Ifwtz4UyT6aZbS1skxkjefr619W1KEmSvlIYIusEr8s2C5D/56D1S/gaj
	 5TIg5JaG2cI23TADG/Bsd+kXCKGboPeBrpMjXmOtBC0A/41RaH+c8Dp5bjiIZT9zr7
	 4JGSVevyBY0e+wYSYf2+bharQF9IOMt9JRGOYXsi1GFL+LCkjoNrZwcocIy66HQz37
	 9qZ8STeOk05F+fX/1GmMUejEYb4soCu0SkgLOdQRJe2GhWq+ZTPfr9xuib8WfJZRWv
	 lod+D8/4hNBdCeO1yair463GuclnA5ooNhp2eVTr2xpsX1fF40aHLA7M92L4ghUwlQ
	 bYOdRku2zWt7Q==
Date: Sat, 26 Apr 2025 17:02:41 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>
CC: Ingo Molnar <mingo@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
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
In-Reply-To: <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com> <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com> <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com> <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
Message-ID: <F6CAB3B2-B8CB-4A66-AF4A-B2CD3767BE04@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 26, 2025 12:55:13 PM PDT, Linus Torvalds <torvalds@linux-foundatio=
n=2Eorg> wrote:
>On Sat, 26 Apr 2025 at 12:24, Linus Torvalds
><torvalds@linux-foundation=2Eorg> wrote:
>>
>> (And yes, one use in a x86 header file that is pretty questionable
>> too: I think the reason for the cmov is actually i486-only behavior
>> and we could probably unify the 32-bit and 64-bit implementation)
>
>Actually, what we *should* do is to remove that manual use of 'cmov'
>entirely - even if we decide that yes, that undefined zero case is
>actually real=2E
>
>We should probably change it to use CC_SET(), and the compiler will do
>a much better job - and probably never use cmov anyway=2E
>
>And yes, that will generate worse code if you have an old compiler
>that doesn't do ASM_FLAG_OUTPUTS, but hey, that's true in general=2E If
>you want good code, you need a good compiler=2E
>
>And clang needs to learn the CC_SET() pattern anyway=2E
>
>So I think that manual cmov pattern for x86-32 should be replaced with
>
>        bool zero;
>
>        asm("bsfl %[in],%[out]"
>            CC_SET(z)
>            : CC_OUT(z) (zero),
>              [out]"=3Dr" (r)
>            : [in] "rm" (x));
>
>        return zero ? 0 : r+1;
>
>instead (that's ffs(), and fls() would need the same thing except with
>bsrl insteadm, of course)=2E
>
>I bet that would actually improve code generation=2E
>
>And I also bet it doesn't actually matter, of course=2E
>
>           Linus

It is unfortunate, if understandable, that we ended up using a convention =
other than what ended up becoming standard=2E (Return the size in bits if t=
he input is 0=2E)

This would let us use __builtin_ctz() > tzcnt which I believe is always in=
line on x86, and probably would help several other architectures too=2E

How much of a pain would it really be to fix this interface?

