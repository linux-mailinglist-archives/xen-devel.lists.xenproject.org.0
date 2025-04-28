Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F1EA9F0C3
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 14:31:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970654.1359286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Ndk-0001yr-R8; Mon, 28 Apr 2025 12:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970654.1359286; Mon, 28 Apr 2025 12:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Ndk-0001x1-OJ; Mon, 28 Apr 2025 12:31:16 +0000
Received: by outflank-mailman (input) for mailman id 970654;
 Mon, 28 Apr 2025 12:31:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=orHk=XO=arndb.de=arnd@srs-se1.protection.inumbo.net>)
 id 1u9Ndi-0001wv-Un
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 12:31:15 +0000
Received: from fout-b3-smtp.messagingengine.com
 (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6a73640-242c-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 14:31:05 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id 5131D114025B;
 Mon, 28 Apr 2025 08:31:03 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-05.internal (MEProxy); Mon, 28 Apr 2025 08:31:03 -0400
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id BEC902220075; Mon, 28 Apr 2025 08:31:01 -0400 (EDT)
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
X-Inumbo-ID: a6a73640-242c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745843463;
	 x=1745929863; bh=l85d+c/VTG74vQy/NEAzc1LT42PJmdxc2NSt71v6MF8=; b=
	SuqVfhJw+Y3Ur7fgmVIU3Rp0m+MvJO5yJrvKVuxiNbJpYoA5ZEpGjdlX1ipnT/Uq
	NRYfNwBXA9MFNp/2YTmNVPIrlZsADnE43RAQu8DIvotj6dGLQFFIjZcXmSqx7maz
	reA3azZRDFIFZ6Znv9YmXzQKivfZbG8sd7c0O0tjNyKsdmOOe6yYGC/oWq1TQxqD
	qIjuiGOPH4XBkAETKoHOmx2QOYR0pwTUQ6U9zw3L5ss06in4+OQmiw9JFGGohkgs
	vux+Ypr3DDuPI0KnlM6VlTFbNXO+yVJNSGPf2CXBQzQXXAlywvIfrTxsoUpflgmD
	WdSfsaEUO5/rvtm+PmQYdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1745843463; x=
	1745929863; bh=l85d+c/VTG74vQy/NEAzc1LT42PJmdxc2NSt71v6MF8=; b=P
	e7cUy/ED4IPc+xS8XIUNFU+UA3mshvlZb8hAp88inYhPsvwBdXKBlae+RASnNxOh
	ELbsgfJhdc3Ow6lmm5bW6BCRWfHgW6NXXWPT5Z+tiZ0VrDahHGAkjRFRjxcu5lSg
	z/kTZ0JKsKE4UsMuScKG6w9WwOXijYVyMQaPa+MQTJIfQKla7V5bDlu8XtBxNwJz
	r/tIgrynqylLOXFu48utceWn0XXwmQtBNhVxGPegR2kCozc1O7uL5adxi6hexcK4
	I2K5hW851mZBhfHH/qfa/QbDGDbzt45oJYDqFlQUxMDgRNMuBpLHc90kDx6RWvgX
	LLl6o3rpLa8stUhXQWFZA==
X-ME-Sender: <xms:BXUPaDezTL1TN0-r_UEi_3XH69IDfnAXbjZUMVi4L7KGDhMvh5n1pA>
    <xme:BXUPaJPUVbNa1w2G92w8YZiV4Kq3KYhgrgj2EtSthgqLLX11iquLFAGOlvOhDN2cj
    nxt_vO5eaIAIQ9rwO0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddviedtleehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    vddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
    dprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhr
    tghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprg
    hlvgigrghnuggvrhdruhhshihskhhinhesihhnthgvlhdrtghomhdprhgtphhtthhopegr
    rhgusgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehr
    phhptheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgiekieeskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:BXUPaMjsa-EdZVMkQozKoOZL5CsDf8FrJh6sGT2tsVxuSqi-cmsThw>
    <xmx:BXUPaE_t8u4Cp2aH4korOXy6tG5ARYegDCcuV2jQc6HeF5mUiGPPUg>
    <xmx:BXUPaPvIu4EkBpVC3vhm9XNZJObQFKjQgmO3NLcyWmyguuNXP0cRNA>
    <xmx:BXUPaDGx0GUBpjL7k75UIGpdtm5e3wHXRVo_Sy41bRu4EZGL8EINug>
    <xmx:B3UPaLkozNo8AMc5E-AbMwXx-fMoG20mUaw5xfVSxqUuoRLHQfgAgDjy>
Feedback-ID: i56a14606:Fastmail
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T1abce48479718f0e
Date: Mon, 28 Apr 2025 14:30:41 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ingo Molnar" <mingo@kernel.org>,
 "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "Arnd Bergmann" <arnd@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Juergen Gross" <jgross@suse.com>,
 "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
 "Alexander Usyskin" <alexander.usyskin@intel.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
 "Mike Rapoport" <rppt@kernel.org>, "Ard Biesheuvel" <ardb@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Message-Id: <acc95bb8-f277-4e5c-9647-3c034748ed2c@app.fastmail.com>
In-Reply-To: <aA8q4Ot-1zTzv_Kt@gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org>
 <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>
 <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
 <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
 <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com>
 <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
 <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com>
 <aA8q4Ot-1zTzv_Kt@gmail.com>
Subject: Re: [PATCH] bitops/32: Convert variable_ffs() and fls() zero-case handling to
 C
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Apr 28, 2025, at 09:14, Ingo Molnar wrote:
>
> ... and unless I messed up the patch, it seems to have a surprisingly 
> low impact - maybe because the compiler can amortize its cost by 
> adjusting all dependent code mostly at build time, so the +1 doesn't 
> end up being generated most of the time?

Is there any reason we can't just use the compiler-builtins directly
like we do on other architectures, at least for 32-bit?

Looking at a couple of vmlinux objects confirms the  findings from
fdb6649ab7c1 ("x86/asm/bitops: Use __builtin_ctzl() to evaluate
constant expressions") from looking at the object file that using
the built-in helpers is slightly better than the current asm code
for all 32-bit targets with both gcc and clang. It's also better
for 64-bit targets with clang, but not with gcc, where the inline
asm often saves a cmov but in other cases the compiler finds an
even better instruction sequence.

     Arnd

diff --git a/arch/x86/include/asm/bitops.h b/arch/x86/include/asm/bitops.h
index eebbc8889e70..bdeae9a497e5 100644
--- a/arch/x86/include/asm/bitops.h
+++ b/arch/x86/include/asm/bitops.h
@@ -246,184 +246,18 @@ arch_test_bit_acquire(unsigned long nr, const volatile unsigned long *addr)
 					  variable_test_bit(nr, addr);
 }
 
-static __always_inline unsigned long variable__ffs(unsigned long word)
-{
-	asm("tzcnt %1,%0"
-		: "=r" (word)
-		: ASM_INPUT_RM (word));
-	return word;
-}
-
-/**
- * __ffs - find first set bit in word
- * @word: The word to search
- *
- * Undefined if no bit exists, so code should check against 0 first.
- */
-#define __ffs(word)				\
-	(__builtin_constant_p(word) ?		\
-	 (unsigned long)__builtin_ctzl(word) :	\
-	 variable__ffs(word))
-
-static __always_inline unsigned long variable_ffz(unsigned long word)
-{
-	return variable__ffs(~word);
-}
-
-/**
- * ffz - find first zero bit in word
- * @word: The word to search
- *
- * Undefined if no zero exists, so code should check against ~0UL first.
- */
-#define ffz(word)				\
-	(__builtin_constant_p(word) ?		\
-	 (unsigned long)__builtin_ctzl(~word) :	\
-	 variable_ffz(word))
-
-/*
- * __fls: find last set bit in word
- * @word: The word to search
- *
- * Undefined if no set bit exists, so code should check against 0 first.
- */
-static __always_inline unsigned long __fls(unsigned long word)
-{
-	if (__builtin_constant_p(word))
-		return BITS_PER_LONG - 1 - __builtin_clzl(word);
-
-	asm("bsr %1,%0"
-	    : "=r" (word)
-	    : ASM_INPUT_RM (word));
-	return word;
-}
-
 #undef ADDR
 
-#ifdef __KERNEL__
-static __always_inline int variable_ffs(int x)
-{
-	int r;
-
-#ifdef CONFIG_X86_64
-	/*
-	 * AMD64 says BSFL won't clobber the dest reg if x==0; Intel64 says the
-	 * dest reg is undefined if x==0, but their CPU architect says its
-	 * value is written to set it to the same as before, except that the
-	 * top 32 bits will be cleared.
-	 *
-	 * We cannot do this on 32 bits because at the very least some
-	 * 486 CPUs did not behave this way.
-	 */
-	asm("bsfl %1,%0"
-	    : "=r" (r)
-	    : ASM_INPUT_RM (x), "0" (-1));
-#elif defined(CONFIG_X86_CMOV)
-	asm("bsfl %1,%0\n\t"
-	    "cmovzl %2,%0"
-	    : "=&r" (r) : "rm" (x), "r" (-1));
-#else
-	asm("bsfl %1,%0\n\t"
-	    "jnz 1f\n\t"
-	    "movl $-1,%0\n"
-	    "1:" : "=r" (r) : "rm" (x));
-#endif
-	return r + 1;
-}
-
-/**
- * ffs - find first set bit in word
- * @x: the word to search
- *
- * This is defined the same way as the libc and compiler builtin ffs
- * routines, therefore differs in spirit from the other bitops.
- *
- * ffs(value) returns 0 if value is 0 or the position of the first
- * set bit if value is nonzero. The first (least significant) bit
- * is at position 1.
- */
-#define ffs(x) (__builtin_constant_p(x) ? __builtin_ffs(x) : variable_ffs(x))
-
-/**
- * fls - find last set bit in word
- * @x: the word to search
- *
- * This is defined in a similar way as the libc and compiler builtin
- * ffs, but returns the position of the most significant set bit.
- *
- * fls(value) returns 0 if value is 0 or the position of the last
- * set bit if value is nonzero. The last (most significant) bit is
- * at position 32.
- */
-static __always_inline int fls(unsigned int x)
-{
-	int r;
-
-	if (__builtin_constant_p(x))
-		return x ? 32 - __builtin_clz(x) : 0;
-
-#ifdef CONFIG_X86_64
-	/*
-	 * AMD64 says BSRL won't clobber the dest reg if x==0; Intel64 says the
-	 * dest reg is undefined if x==0, but their CPU architect says its
-	 * value is written to set it to the same as before, except that the
-	 * top 32 bits will be cleared.
-	 *
-	 * We cannot do this on 32 bits because at the very least some
-	 * 486 CPUs did not behave this way.
-	 */
-	asm("bsrl %1,%0"
-	    : "=r" (r)
-	    : ASM_INPUT_RM (x), "0" (-1));
-#elif defined(CONFIG_X86_CMOV)
-	asm("bsrl %1,%0\n\t"
-	    "cmovzl %2,%0"
-	    : "=&r" (r) : "rm" (x), "rm" (-1));
-#else
-	asm("bsrl %1,%0\n\t"
-	    "jnz 1f\n\t"
-	    "movl $-1,%0\n"
-	    "1:" : "=r" (r) : "rm" (x));
-#endif
-	return r + 1;
-}
-
-/**
- * fls64 - find last set bit in a 64-bit word
- * @x: the word to search
- *
- * This is defined in a similar way as the libc and compiler builtin
- * ffsll, but returns the position of the most significant set bit.
- *
- * fls64(value) returns 0 if value is 0 or the position of the last
- * set bit if value is nonzero. The last (most significant) bit is
- * at position 64.
- */
-#ifdef CONFIG_X86_64
-static __always_inline int fls64(__u64 x)
-{
-	int bitpos = -1;
-
-	if (__builtin_constant_p(x))
-		return x ? 64 - __builtin_clzll(x) : 0;
-	/*
-	 * AMD64 says BSRQ won't clobber the dest reg if x==0; Intel64 says the
-	 * dest reg is undefined if x==0, but their CPU architect says its
-	 * value is written to set it to the same as before.
-	 */
-	asm("bsrq %1,%q0"
-	    : "+r" (bitpos)
-	    : ASM_INPUT_RM (x));
-	return bitpos + 1;
-}
-#else
+#include <asm-generic/bitops/__ffs.h>
+#include <asm-generic/bitops/ffz.h>
+#include <asm-generic/bitops/builtin-fls.h>
+#include <asm-generic/bitops/__fls.h>
 #include <asm-generic/bitops/fls64.h>
-#endif
 
-#include <asm-generic/bitops/sched.h>
 
+#include <asm-generic/bitops/sched.h>
+#include <asm-generic/bitops/builtin-ffs.h>
 #include <asm/arch_hweight.h>
-
 #include <asm-generic/bitops/const_hweight.h>
 
 #include <asm-generic/bitops/instrumented-atomic.h>
@@ -434,5 +268,4 @@ static __always_inline int fls64(__u64 x)
 
 #include <asm-generic/bitops/ext2-atomic-setbit.h>
 
-#endif /* __KERNEL__ */
 #endif /* _ASM_X86_BITOPS_H */

