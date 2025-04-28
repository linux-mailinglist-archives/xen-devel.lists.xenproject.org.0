Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E52AA9E8AC
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 08:58:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970114.1358879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9IRv-0006AG-4I; Mon, 28 Apr 2025 06:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970114.1358879; Mon, 28 Apr 2025 06:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9IRv-00067g-1d; Mon, 28 Apr 2025 06:58:43 +0000
Received: by outflank-mailman (input) for mailman id 970114;
 Mon, 28 Apr 2025 06:58:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C08U=XO=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1u9IRs-00067a-VB
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 06:58:40 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3614fbb3-23fe-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 08:58:39 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A48E0435ED;
 Mon, 28 Apr 2025 06:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5CD1C4CEE4;
 Mon, 28 Apr 2025 06:58:33 +0000 (UTC)
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
X-Inumbo-ID: 3614fbb3-23fe-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745823517;
	bh=pPJ8R19J2/szrRXylX5/tWCymsrUsn/Hl5OGFoBEBSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dBwmuAg8gdgySu+Dso+50czrM27i9adBTCNGKbFopGertwGmXvg+EXHTGSC/LII3w
	 OOiQvXI6nmTe5mdAul07ryxnGeqbNKU2TJV55XvbjBOkhs+Sf0TAHsFtzzzAnN+El/
	 4zfWFWERnPei7BLat2VsFSYo3DGbPWaTo+XG1yMW31vZbiMjOMZr2igKVwaKxRwOCc
	 hA8L8g50+TPIGA6RNsgrXNeH8TuH33QJeDeOmpIszuvwc+j7gtFBgNJMyL3TZYFzE8
	 1UGB1hQLdXt52S3MeiHESNkgrVuaFhfLCbEgjghtIffhPpyD+KMZNihmVsINSybWxz
	 5Rin8vh5R2oig==
Date: Mon, 28 Apr 2025 08:58:31 +0200
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
Subject: [PATCH] bitops/32: Convert variable_ffs() and fls() zero-case
 handling to C
Message-ID: <aA8nF0moBYOIgC5J@gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org>
 <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>
 <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
 <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
 <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com>
 <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Sun, 27 Apr 2025 at 12:17, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >
> > ffs/fls are commonly found inside loops where x is the loop condition
> > too.  Therefore, using statically_true() to provide a form without the
> > zero compatibility turns out to be a win.
> 
> We already have the version without the zero capability - it's just
> called "__ffs()" and "__fls()", and performance-critical code uses
> those.
> 
> So fls/ffs are the "standard" library functions that have to handle
> zero, and add that stupid "+1" because that interface was designed by
> some Pascal person who doesn't understand that we start counting from
> 0.
> 
> Standards bodies: "companies aren't sending their best people".
> 
> But it's silly that we then spend effort on magic cmov in inline asm
> on those things when it's literally the "don't use this version unless
> you don't actually care about performance" case.
> 
> I don't think it would be wrong to just make the x86-32 code just do
> the check against zero ahead of time - in C.
> 
> And yes, that will generate some extra code - you'll test for zero
> before, and then the caller might also test for a zero result that
> then results in another test for zero that can't actually happen (but
> the compiler doesn't know that). But I suspect that on the whole, it
> is likely to generate better code anyway just because the compiler
> sees that first test and can DTRT.
> 
> UNTESTED patch applied in case somebody wants to play with this. It
> removes 10 lines of silly code, and along with them that 'cmov' use.
> 
> Anybody?

Makes sense - it seems to boot here, but I only did some very light 
testing.

There's a minor text size increase on x86-32 defconfig, GCC 14.2.0:

      text       data        bss         dec        hex    filename
  16577728    7598826    1744896    25921450    18b87aa    vmlinux.before
  16577908    7598838    1744896    25921642    18b886a    vmlinux.after

bloatometer output:

  add/remove: 2/1 grow/shrink: 201/189 up/down: 5681/-3486 (2195)

Patch with changelog and your SOB added attached. Does it look good to 
you?

Thanks,

	Ingo

================>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Apr 2025 08:38:35 +0200
Subject: [PATCH] bitops/32: Convert variable_ffs() and fls() zero-case handling to C

Don't do the complicated and probably questionable BS*L+CMOVZL
asm() optimization in variable_ffs() and fls(): performance-critical
code is already using __ffs() and __fls() that use sane interfaces
close to the machine instruction ABI. Check ahead for zero in C.

There's a minor text size increase on x86-32 defconfig:

      text       data        bss         dec        hex    filename
  16577728    7598826    1744896    25921450    18b87aa    vmlinux.before
  16577908    7598838    1744896    25921642    18b886a    vmlinux.after

bloatometer output:

  add/remove: 2/1 grow/shrink: 201/189 up/down: 5681/-3486 (2195)

Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/asm/bitops.h | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/arch/x86/include/asm/bitops.h b/arch/x86/include/asm/bitops.h
index 100413aff640..6061c87f14ac 100644
--- a/arch/x86/include/asm/bitops.h
+++ b/arch/x86/include/asm/bitops.h
@@ -321,15 +321,10 @@ static __always_inline int variable_ffs(int x)
 	asm("bsfl %1,%0"
 	    : "=r" (r)
 	    : ASM_INPUT_RM (x), "0" (-1));
-#elif defined(CONFIG_X86_CMOV)
-	asm("bsfl %1,%0\n\t"
-	    "cmovzl %2,%0"
-	    : "=&r" (r) : "rm" (x), "r" (-1));
 #else
-	asm("bsfl %1,%0\n\t"
-	    "jnz 1f\n\t"
-	    "movl $-1,%0\n"
-	    "1:" : "=r" (r) : "rm" (x));
+	if (!x)
+		return 0;
+	asm("bsfl %1,%0" : "=r" (r) : "rm" (x));
 #endif
 	return r + 1;
 }
@@ -378,15 +373,10 @@ static __always_inline int fls(unsigned int x)
 	asm("bsrl %1,%0"
 	    : "=r" (r)
 	    : ASM_INPUT_RM (x), "0" (-1));
-#elif defined(CONFIG_X86_CMOV)
-	asm("bsrl %1,%0\n\t"
-	    "cmovzl %2,%0"
-	    : "=&r" (r) : "rm" (x), "rm" (-1));
 #else
-	asm("bsrl %1,%0\n\t"
-	    "jnz 1f\n\t"
-	    "movl $-1,%0\n"
-	    "1:" : "=r" (r) : "rm" (x));
+	if (!x)
+		return 0;
+	asm("bsrl %1,%0" : "=r" (r) : "rm" (x));
 #endif
 	return r + 1;
 }

