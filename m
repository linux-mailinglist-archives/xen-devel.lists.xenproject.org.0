Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F0AA9E8CE
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 09:05:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970138.1358900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9IYO-0000Er-0g; Mon, 28 Apr 2025 07:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970138.1358900; Mon, 28 Apr 2025 07:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9IYN-0000DI-TI; Mon, 28 Apr 2025 07:05:23 +0000
Received: by outflank-mailman (input) for mailman id 970138;
 Mon, 28 Apr 2025 07:05:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C08U=XO=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1u9IYM-0000DC-LW
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 07:05:22 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24cdfe03-23ff-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 09:05:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1FF41A49D68;
 Mon, 28 Apr 2025 06:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4868C4CEE4;
 Mon, 28 Apr 2025 07:05:14 +0000 (UTC)
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
X-Inumbo-ID: 24cdfe03-23ff-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745823918;
	bh=ZR+51/a7SRTRGqwOHXRQQygxFCEZLSQcgVb51P3cI3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nn0CTW7mOuzrRxZANBCgZkQkHaRHLYrAdgAGn4DoDQIEzUJHMPgLbHjEoQ1u2gQa1
	 n0U1Gxbc4LOxpyQAlH2jGTbGvxi0D4T0bL9J4Alg+olwo6qCF6V3sv54uhNBGBXjQQ
	 8XJz69xiKZXFXNoyY52aCXZG/JPfpkMf0omtbRGxtjCUupqdLiCyrLwjR3e3Mp2VhN
	 Og5dbJzOwOo3hf3jDCmUUzo/FUMiLeNcfEv9ieVnwEdBWO28S2stAC54fxJSx5bYbT
	 odBHjud3aYX7F7kVQ2PYr6Wc6dNXzBHyxAkOpqNroqGgexyuhEsTKmKzmSI36hCL+l
	 7qw7NoFQPZBLA==
Date: Mon, 28 Apr 2025 09:05:12 +0200
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
Message-ID: <aA8oqKUaFU-0wb-D@gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org>
 <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>
 <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
 <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
 <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com>
 <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
 <aA8nF0moBYOIgC5J@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA8nF0moBYOIgC5J@gmail.com>


* Ingo Molnar <mingo@kernel.org> wrote:

> > UNTESTED patch applied in case somebody wants to play with this. It
> > removes 10 lines of silly code, and along with them that 'cmov' use.
> > 
> > Anybody?
> 
> Makes sense - it seems to boot here, but I only did some very light 
> testing.
> 
> There's a minor text size increase on x86-32 defconfig, GCC 14.2.0:
> 
>       text       data        bss         dec        hex    filename
>   16577728    7598826    1744896    25921450    18b87aa    vmlinux.before
>   16577908    7598838    1744896    25921642    18b886a    vmlinux.after
> 
> bloatometer output:
> 
>   add/remove: 2/1 grow/shrink: 201/189 up/down: 5681/-3486 (2195)

And once we remove 486, I think we can do the optimization below to 
just assume the output doesn't get clobbered by BS*L in the zero-case, 
right?

In the text size space it's a substantial optimization on x86-32 
defconfig:

        text	   data	       bss	     dec	    hex	filename
  16,577,728    7598826    1744896      25921450        18b87aa vmlinux.vanilla      # CMOV+BS*L
  16,577,908	7598838	   1744896	25921642	18b886a	vmlinux.linus_patch  # if()+BS*L
  16,573,568	7602922	   1744896	25921386	18b876a	vmlinux.noclobber    # BS*L

Thanks,

	Ingo

---
 arch/x86/include/asm/bitops.h | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/arch/x86/include/asm/bitops.h b/arch/x86/include/asm/bitops.h
index 6061c87f14ac..e3e94a806656 100644
--- a/arch/x86/include/asm/bitops.h
+++ b/arch/x86/include/asm/bitops.h
@@ -308,24 +308,16 @@ static __always_inline int variable_ffs(int x)
 {
 	int r;
 
-#ifdef CONFIG_X86_64
 	/*
 	 * AMD64 says BSFL won't clobber the dest reg if x==0; Intel64 says the
 	 * dest reg is undefined if x==0, but their CPU architect says its
 	 * value is written to set it to the same as before, except that the
 	 * top 32 bits will be cleared.
-	 *
-	 * We cannot do this on 32 bits because at the very least some
-	 * 486 CPUs did not behave this way.
 	 */
 	asm("bsfl %1,%0"
 	    : "=r" (r)
 	    : ASM_INPUT_RM (x), "0" (-1));
-#else
-	if (!x)
-		return 0;
-	asm("bsfl %1,%0" : "=r" (r) : "rm" (x));
-#endif
+
 	return r + 1;
 }
 
@@ -360,24 +352,16 @@ static __always_inline int fls(unsigned int x)
 	if (__builtin_constant_p(x))
 		return x ? 32 - __builtin_clz(x) : 0;
 
-#ifdef CONFIG_X86_64
 	/*
 	 * AMD64 says BSRL won't clobber the dest reg if x==0; Intel64 says the
 	 * dest reg is undefined if x==0, but their CPU architect says its
 	 * value is written to set it to the same as before, except that the
 	 * top 32 bits will be cleared.
-	 *
-	 * We cannot do this on 32 bits because at the very least some
-	 * 486 CPUs did not behave this way.
 	 */
 	asm("bsrl %1,%0"
 	    : "=r" (r)
 	    : ASM_INPUT_RM (x), "0" (-1));
-#else
-	if (!x)
-		return 0;
-	asm("bsrl %1,%0" : "=r" (r) : "rm" (x));
-#endif
+
 	return r + 1;
 }
 


