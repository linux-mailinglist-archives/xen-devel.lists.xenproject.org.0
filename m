Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D294BA9E8F9
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 09:14:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970163.1358920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9IhY-0002ws-5i; Mon, 28 Apr 2025 07:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970163.1358920; Mon, 28 Apr 2025 07:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9IhY-0002tv-2Y; Mon, 28 Apr 2025 07:14:52 +0000
Received: by outflank-mailman (input) for mailman id 970163;
 Mon, 28 Apr 2025 07:14:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C08U=XO=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1u9IhW-0002ej-UW
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 07:14:50 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 780213f6-2400-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 09:14:48 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 208226115B;
 Mon, 28 Apr 2025 07:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74333C4CEEC;
 Mon, 28 Apr 2025 07:14:43 +0000 (UTC)
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
X-Inumbo-ID: 780213f6-2400-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745824487;
	bh=HU7iY1werGlJ+QoJB51RFGwv+gbaO9ieC2TdEUyfC+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XHPzu1paNX9zJyODrlzu6FElO4xhbEEZHYa20acxNqEtlqZF+nm4tKsTED6vEJvL8
	 yTvbrFIm2nCrPIIUVDcY6KSQapmLZfkO5RY1hpBE5A/4rh/d1OhBNxm+FCcxnddYtW
	 zrGxxT/iAqBcgX+g0nU6KKkNpaREP840N+xO2lkofe3/XyPCCkeUx1koDMsMSK9Hon
	 I+ZymKySOfDFK8DBZfF9HKimQmUDUIQAFmsb7vG+5xsR7XxsQ+gB1MdkoglzMR3GXW
	 3Qnrd6fTag/tIm9Obf/bxHu6QKnQUKfy65MVbupaRJc0jBWlC0zimT+7XGLduXjNH+
	 uaHdoy5OwgT+g==
Date: Mon, 28 Apr 2025 09:14:40 +0200
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
Message-ID: <aA8q4Ot-1zTzv_Kt@gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org>
 <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>
 <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
 <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
 <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com>
 <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
 <aA8nF0moBYOIgC5J@gmail.com>
 <aA8oqKUaFU-0wb-D@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA8oqKUaFU-0wb-D@gmail.com>


* Ingo Molnar <mingo@kernel.org> wrote:

> And once we remove 486, I think we can do the optimization below to 
> just assume the output doesn't get clobbered by BS*L in the 
> zero-case, right?
> 
> In the text size space it's a substantial optimization on x86-32 
> defconfig:
> 
>         text	   data	       bss	     dec	    hex	filename
>   16,577,728    7598826    1744896      25921450        18b87aa vmlinux.vanilla      # CMOV+BS*L
>   16,577,908	7598838	   1744896	25921642	18b886a	vmlinux.linus_patch  # if()+BS*L
>   16,573,568	7602922	   1744896	25921386	18b876a	vmlinux.noclobber    # BS*L

And BTW, *that* is a price that all of non-486 x86-32 was paying for 
486 support...

And, just out of intellectual curiosity, I also tried to measure the 
code generation price of the +1 standards-quirk in the fls()/ffs() 
interface as well:

         text	   data	       bss	     dec	    hex	filename
   16,577,728   7598826    1744896      25921450        18b87aa vmlinux.vanilla      # CMOV+BS*L
   16,577,908	7598838	   1744896	25921642	18b886a	vmlinux.linus_patch  # if()+BS*L
   16,573,568	7602922	   1744896	25921386	18b876a	vmlinux.noclobber    # BS*L
   ..........
   16,573,552	7602922	   1744896	25921370	18b875a	vmlinux.broken       # BROKEN: 0 baseline instead of 1

... and unless I messed up the patch, it seems to have a surprisingly 
low impact - maybe because the compiler can amortize its cost by 
adjusting all dependent code mostly at build time, so the +1 doesn't 
end up being generated most of the time?

Thanks,

	Ingo

===============================>

This broken patch is broken: it intentionally breaks the ffs()/fls() 
interface in an attempt to measure the code generation effects of 
interface details.

NOT-Signed-off-by: <anyone@anywhere.anytime>
---
 arch/x86/include/asm/bitops.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/bitops.h b/arch/x86/include/asm/bitops.h
index e3e94a806656..21707696bafe 100644
--- a/arch/x86/include/asm/bitops.h
+++ b/arch/x86/include/asm/bitops.h
@@ -318,7 +318,7 @@ static __always_inline int variable_ffs(int x)
 	    : "=r" (r)
 	    : ASM_INPUT_RM (x), "0" (-1));
 
-	return r + 1;
+	return r;
 }
 
 /**
@@ -362,7 +362,7 @@ static __always_inline int fls(unsigned int x)
 	    : "=r" (r)
 	    : ASM_INPUT_RM (x), "0" (-1));
 
-	return r + 1;
+	return r;
 }
 
 /**

