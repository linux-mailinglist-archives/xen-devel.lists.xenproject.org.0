Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A81A0248BD7
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 18:44:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k84iE-0001Aq-Oq; Tue, 18 Aug 2020 16:43:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ffgU=B4=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k84iD-0001Ah-3h
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 16:43:49 +0000
X-Inumbo-ID: 78f53ef5-f0f0-4790-a735-75380bbb5bee
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 78f53ef5-f0f0-4790-a735-75380bbb5bee;
 Tue, 18 Aug 2020 16:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=4PQ+48aJTLRT42w8QYGIB3DZPRwn3uk6ccNLE36wIbM=; b=UHquhKWHKAfYde9l+yBoceDoA/
 mRQvaWqzc9YgRP8neY2cCjmguJ2zFT12arvt8ySCN2IwvBJIePIQEz5VF26qGpFGNbQxjuu6T5KPy
 6VnKVL8wNrwEVe3tQsKx25JBJ8+Oge25XEyQaDAzVBOKAORLuQEKcYv87SZsJ57tujRw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k84i2-00015X-8T; Tue, 18 Aug 2020 16:43:38 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k84i1-0006Fi-Lx; Tue, 18 Aug 2020 16:43:38 +0000
Subject: Re: [PATCH 1/2] xen/arm: entry: Place a speculation barrier following
 an ret instruction
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "security@xenproject.org" <security@xenproject.org>,
 Paul Durrant <paul@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andre Przywara <Andre.Przywara@arm.com>, Julien Grall <jgrall@amazon.com>,
 nd <nd@arm.com>
References: <20200616175913.7368-1-julien@xen.org>
 <20200616175913.7368-2-julien@xen.org>
 <alpine.DEB.2.21.2006161422240.24982@sstabellini-ThinkPad-T480s>
 <57696b4d-da83-a4d6-4d82-41a6f6c9174c@xen.org>
 <5c3a2407-3e76-3a30-7f93-036706e00f73@xen.org>
 <9DFF73C4-5141-47AF-A0DB-331787007F37@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5a406d61-293b-8dd7-44c2-d4f5dde4856f@xen.org>
Date: Tue, 18 Aug 2020 17:43:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <9DFF73C4-5141-47AF-A0DB-331787007F37@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 18/08/2020 17:35, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

> 
> Somehow we stopped on this thread and you did already most of the work so I think we should try to finish what you started

Sorry this fell-through the cracks. I have a new version for patch #1, 
but not yet patch #2.

I am still debating with myself where the speculation barrier should be 
added after the SMC :).

> 
> 
>> On 4 Jul 2020, at 17:07, Julien Grall <julien@xen.org> wrote:
>>
>> On 17/06/2020 17:23, Julien Grall wrote:
>>> Hi,
>>> On 16/06/2020 22:24, Stefano Stabellini wrote:
>>>> On Tue, 16 Jun 2020, Julien Grall wrote:
>>>>> From: Julien Grall <jgrall@amazon.com>
>>>>>
>>>>> Some CPUs can speculate past a RET instruction and potentially perform
>>>>> speculative accesses to memory before processing the return.
>>>>>
>>>>> There is no known gadget available after the RET instruction today.
>>>>> However some of the registers (such as in check_pending_guest_serror())
>>>>> may contain a value provided the guest.
>>>>                                 ^ by
>>>>
>>>>
>>>>> In order to harden the code, it would be better to add a speculation
>>>>> barrier after each RET instruction. The performance is meant to be
>>>>> negligeable as the speculation barrier is not meant to be archicturally
>>>>> executed.
>>>>>
>>>>> Note that on arm32, the ldmia instruction will act as a return from the
>>>>> function __context_switch(). While the whitepaper doesn't suggest it is
>>>>> possible to speculate after the instruction, add preventively a
>>>>> speculation barrier after it as well.
>>>>>
>>>>> This is part of the work to mitigate straight-line speculation.
>>>>>
>>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>>
>>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>>>
>>>> I did a compile-test on the patch too.
>>>>
>>>>
>>>>> ---
>>>>>
>>>>> I am still unsure whether we preventively should add a speculation barrier
>>>>> preventively after all the RET instructions in arm*/lib/. The smc call be
>>>>> taken care in a follow-up patch.
>>>>
>>>> SMC is great to have but it seems to be overkill to do the ones under
>>>> lib/.
>>>  From my understanding, the compiler will add a speculation barrier preventively after each 'ret' when the mitigation are turned on.So it feels to me we want to follow the same approach.
>>> Obviously, we can avoid them but I would like to have a justification for not adding them (nothing is overkilled against speculation ;)).
>>
>> I finally found some time to look at arm*/lib in more details. Some of the helpers can definitely be called with guest inputs.
>>
>> For instance, memchr() is called from hypfs_get_path_user() with the 3rd argument controlled by the guest. In both 32-bit and 64-bit implementation, you will reach the end of the function memchr() with r2/w2 and r3/w3 (it contains a character from the buffer) controlled by the guest.
>>
>> As this is the only function in the unit, we don't know what will be the instructions right after RET. So it would be safer to add a speculation barrier there too.
> 
> How about adding a speculation barrier directly in the ENDPROC macro ?

This would unfortunately not cover all the cases because you can return 
in the middle of the function. I will have a look to see if we can 
leverage it.

Below the first draft for v2 of this patch.

commit 7f7cf1558283d0d35fc22ead909e8a812da82f27
Author: Julien Grall <jgrall@amazon.com>
Date:   Tue Jun 16 16:33:12 2020 +0100

     xen/arm: Place a speculation barrier following an ret instruction

     Some CPUs can speculate past a RET instruction and potentially perform
     speculative accesses to memory before processing the return.

     There is no known gadget available after the RET instruction today.
     However some of the registers (such as in check_pending_guest_serror())
     may contain a value provided the guest.

     In order to harden the code, it would be better to add a speculation
     barrier after each RET instruction. The performance is meant to be
     negligeable as the speculation barrier is not meant to be 
architecturally
     executed.

     The RET in boot code (i.e arm*/entry.S) are not followed by an SB
     because this is boot code. Therefore there is no concern as all the
     registers are controlled by the hypervisor.

     Note that on arm32, the ldmia instruction will act as a return from the
     function __context_switch(). While the whitepaper doesn't suggest it is
     possible to speculate after the instruction, add preventively a
     speculation barrier after it as well.

     This is part of the work to mitigate straight-line speculation.

     Signed-off-by: Julien Grall <jgrall@amazon.com>

     ---

         Changes in v2:
             - Add an a speculation barrier for the __arm_smccc_1_0_smc. 
This
             was originally part of the second patch.
             - I have now included all the arm*/lib/ assembly helpers
             because some of them are called with guest input value (e.g
             memchr).

diff --git a/xen/arch/arm/arm32/entry.S b/xen/arch/arm/arm32/entry.S
index b228d44b190c..bd54fc43558b 100644
--- a/xen/arch/arm/arm32/entry.S
+++ b/xen/arch/arm/arm32/entry.S
@@ -442,6 +442,7 @@ ENTRY(__context_switch)

          add     r4, r1, #VCPU_arch_saved_context
          ldmia   r4, {r4 - sl, fp, sp, pc}       /* Load registers and 
return */
+        sb

  /*
   * Local variables:
diff --git a/xen/arch/arm/arm32/lib/assembler.h 
b/xen/arch/arm/arm32/lib/assembler.h
index 6de2638a36d5..cffdb60baa29 100644
--- a/xen/arch/arm/arm32/lib/assembler.h
+++ b/xen/arch/arm/arm32/lib/assembler.h
@@ -17,6 +17,8 @@
  #ifndef __ASM_ASSEMBLER_H__
  #define __ASM_ASSEMBLER_H__

+#include <asm/macros.h>
+
  #ifndef __ASSEMBLY__
  #error "Only include this from assembly code"
  #endif
diff --git a/xen/arch/arm/arm32/lib/findbit.S 
b/xen/arch/arm/arm32/lib/findbit.S
index 00674a31efad..df86922a25bc 100644
--- a/xen/arch/arm/arm32/lib/findbit.S
+++ b/xen/arch/arm/arm32/lib/findbit.S
@@ -35,6 +35,7 @@ ENTRY(_find_first_zero_bit_le)
  		blo	1b
  3:		mov	r0, r1			@ no free bits
  		mov	pc, lr
+		sb
  ENDPROC(_find_first_zero_bit_le)

  /*
@@ -76,6 +77,7 @@ ENTRY(_find_first_bit_le)
  		blo	1b
  3:		mov	r0, r1			@ no free bits
  		mov	pc, lr
+		sb
  ENDPROC(_find_first_bit_le)

  /*
@@ -114,6 +116,7 @@ ENTRY(_find_first_zero_bit_be)
  		blo	1b
  3:		mov	r0, r1			@ no free bits
  		mov	pc, lr
+		sb
  ENDPROC(_find_first_zero_bit_be)

  ENTRY(_find_next_zero_bit_be)
@@ -148,6 +151,7 @@ ENTRY(_find_first_bit_be)
  		blo	1b
  3:		mov	r0, r1			@ no free bits
  		mov	pc, lr
+		sb
  ENDPROC(_find_first_bit_be)

  ENTRY(_find_next_bit_be)
@@ -192,4 +196,5 @@ ENDPROC(_find_next_bit_be)
  		cmp	r1, r0			@ Clamp to maxbit
  		movlo	r0, r1
  		mov	pc, lr
+		sb

diff --git a/xen/arch/arm/arm32/lib/lib1funcs.S 
b/xen/arch/arm/arm32/lib/lib1funcs.S
index f1278bd6c139..ebb9b4f1babf 100644
--- a/xen/arch/arm/arm32/lib/lib1funcs.S
+++ b/xen/arch/arm/arm32/lib/lib1funcs.S
@@ -217,15 +217,18 @@ UNWIND(.fnstart)

  	mov	r0, r2
  	mov	pc, lr
+	sb

  11:	moveq	r0, #1
  	movne	r0, #0
  	mov	pc, lr
+	sb

  12:	ARM_DIV2_ORDER r1, r2

  	mov	r0, r0, lsr r2
  	mov	pc, lr
+	sb

  UNWIND(.fnend)
  ENDPROC(__udivsi3)
@@ -245,6 +248,7 @@ UNWIND(.fnstart)
  	ARM_MOD_BODY r0, r1, r2, r3

  	mov	pc, lr
+	sb

  UNWIND(.fnend)
  ENDPROC(__umodsi3)
@@ -271,15 +275,18 @@ UNWIND(.fnstart)
  	cmp	ip, #0
  	rsbmi	r0, r0, #0
  	mov	pc, lr
+	sb

  10:	teq	ip, r0				@ same sign ?
  	rsbmi	r0, r0, #0
  	mov	pc, lr
+	sb

  11:	movlo	r0, #0
  	moveq	r0, ip, asr #31
  	orreq	r0, r0, #1
  	mov	pc, lr
+	sb

  12:	ARM_DIV2_ORDER r1, r2

@@ -287,6 +294,7 @@ UNWIND(.fnstart)
  	mov	r0, r3, lsr r2
  	rsbmi	r0, r0, #0
  	mov	pc, lr
+	sb

  UNWIND(.fnend)
  ENDPROC(__divsi3)
@@ -312,6 +320,7 @@ UNWIND(.fnstart)
  10:	cmp	ip, #0
  	rsbmi	r0, r0, #0
  	mov	pc, lr
+	sb

  UNWIND(.fnend)
  ENDPROC(__modsi3)
@@ -328,6 +337,7 @@ UNWIND(.save {r0, r1, ip, lr}	)
  	mul	r3, r0, r2
  	sub	r1, r1, r3
  	mov	pc, lr
+	sb

  UNWIND(.fnend)
  ENDPROC(__aeabi_uidivmod)
@@ -341,6 +351,7 @@ UNWIND(.save {r0, r1, ip, lr}	)
  	mul	r3, r0, r2
  	sub	r1, r1, r3
  	mov	pc, lr
+	sb

  UNWIND(.fnend)
  ENDPROC(__aeabi_idivmod)
@@ -355,6 +366,7 @@ UNWIND(.save {lr}	)
  	add sp, sp, #8
  	ldmfd sp!, {r2, r3}
  	mov	pc, lr
+	sb

  UNWIND(.fnend)
  ENDPROC(__aeabi_uldivmod)
@@ -369,6 +381,7 @@ UNWIND(.save {lr}	)
  	add sp, sp, #16
  	ldmfd	sp!, {r2, r3}
  	mov	pc, lr
+	sb

  UNWIND(.fnend)
  ENDPROC(__aeabi_ldivmod)
@@ -382,5 +395,6 @@ UNWIND(.save {lr})
  	bl	__div0
  	mov	r0, #0			@ About as wrong as it could be.
  	ldr	pc, [sp], #8
+	sb
  UNWIND(.fnend)
  ENDPROC(Ldiv0)
diff --git a/xen/arch/arm/arm32/lib/lshrdi3.S 
b/xen/arch/arm/arm32/lib/lshrdi3.S
index 88b9655282ab..e4d275842c00 100644
--- a/xen/arch/arm/arm32/lib/lshrdi3.S
+++ b/xen/arch/arm/arm32/lib/lshrdi3.S
@@ -46,6 +46,7 @@ ENTRY(__aeabi_llsr)
   THUMB(	orrmi	al, al, r3		)
  	mov	ah, ah, lsr r2
  	mov	pc, lr
+	sb

  ENDPROC(__lshrdi3)
  ENDPROC(__aeabi_llsr)
diff --git a/xen/arch/arm/arm32/lib/memchr.S 
b/xen/arch/arm/arm32/lib/memchr.S
index 7dae4ab6a6f8..e2910d381b08 100644
--- a/xen/arch/arm/arm32/lib/memchr.S
+++ b/xen/arch/arm/arm32/lib/memchr.S
@@ -22,4 +22,5 @@ ENTRY(memchr)
  	sub	r0, r0, #1
  2:	movne	r0, #0
  	mov	pc, lr
+	sb
  ENDPROC(memchr)
diff --git a/xen/arch/arm/arm32/lib/memset.S 
b/xen/arch/arm/arm32/lib/memset.S
index 5a1dadf767d7..9ce78d9e4695 100644
--- a/xen/arch/arm/arm32/lib/memset.S
+++ b/xen/arch/arm/arm32/lib/memset.S
@@ -110,6 +110,7 @@ ENTRY(memset)
  	tst	r2, #1
  	strneb	r1, [ip], #1
  	mov	pc, lr
+	sb

  6:	subs	r2, r2, #4		@ 1 do we have enough
  	blt	5b			@ 1 bytes to align with?
diff --git a/xen/arch/arm/arm32/lib/strchr.S 
b/xen/arch/arm/arm32/lib/strchr.S
index fa53ad8bc659..697b5b30e38b 100644
--- a/xen/arch/arm/arm32/lib/strchr.S
+++ b/xen/arch/arm/arm32/lib/strchr.S
@@ -25,4 +25,5 @@ ENTRY(strchr)
  		movne	r0, #0
  		subeq	r0, r0, #1
  		mov	pc, lr
+		sb
  ENDPROC(strchr)
diff --git a/xen/arch/arm/arm32/lib/strrchr.S 
b/xen/arch/arm/arm32/lib/strrchr.S
index ec4d40de5e5a..9f64f23d5cb0 100644
--- a/xen/arch/arm/arm32/lib/strrchr.S
+++ b/xen/arch/arm/arm32/lib/strrchr.S
@@ -22,4 +22,5 @@ ENTRY(strrchr)
  		bne	1b
  		mov	r0, r3
  		mov	pc, lr
+		sb
  ENDPROC(strrchr)
diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
index 175ea2981e72..b37d8fe09dc2 100644
--- a/xen/arch/arm/arm64/entry.S
+++ b/xen/arch/arm/arm64/entry.S
@@ -522,6 +522,7 @@ abort_guest_exit_end:
          cset    x19, ne

          ret
+        sb
  ENDPROC(check_pending_guest_serror)

  /*
@@ -583,6 +584,7 @@ ENTRY(__context_switch)
          ldr     lr, [x8]
          mov     sp, x9
          ret
+        sb

  /*
   * Local variables:
diff --git a/xen/arch/arm/arm64/lib/assembler.h 
b/xen/arch/arm/arm64/lib/assembler.h
index 3f9c0dcf5d32..8356fd5d11fd 100644
--- a/xen/arch/arm/arm64/lib/assembler.h
+++ b/xen/arch/arm/arm64/lib/assembler.h
@@ -5,6 +5,8 @@
  #error "Only include this from assembly code"
  #endif

+#include <asm/macros.h>
+
  /* Only LE support so far */
  #define CPU_BE(x...)
  #define CPU_LE(x...) x
diff --git a/xen/arch/arm/arm64/lib/clear_page.S 
b/xen/arch/arm/arm64/lib/clear_page.S
index 9f8a680e1880..cf07bd00cb7e 100644
--- a/xen/arch/arm/arm64/lib/clear_page.S
+++ b/xen/arch/arm/arm64/lib/clear_page.S
@@ -14,6 +14,8 @@
   * along with this program.  If not, see <http://www.gnu.org/licenses/>.
   */

+#include <asm/macros.h>
+
  /*
   * Clear page @dest
   *
@@ -31,4 +33,5 @@ ENTRY(clear_page)
  	tst	x0, #(PAGE_SIZE - 1)
  	b.ne	1b
  	ret
+	sb
  ENDPROC(clear_page)
diff --git a/xen/arch/arm/arm64/lib/memchr.S 
b/xen/arch/arm/arm64/lib/memchr.S
index 81f113bb1cab..ff75f03d86bc 100644
--- a/xen/arch/arm/arm64/lib/memchr.S
+++ b/xen/arch/arm/arm64/lib/memchr.S
@@ -38,6 +38,8 @@ ENTRY(memchr)
  	b.ne	1b
  	sub	x0, x0, #1
  	ret
+	sb
  2:	mov	x0, #0
  	ret
+	sb
  ENDPROC(memchr)
diff --git a/xen/arch/arm/arm64/lib/memcmp.S 
b/xen/arch/arm/arm64/lib/memcmp.S
index 87c2537ffeb7..2583bd404249 100644
--- a/xen/arch/arm/arm64/lib/memcmp.S
+++ b/xen/arch/arm/arm64/lib/memcmp.S
@@ -160,6 +160,7 @@ CPU_LE( lsr	tmp2, tmp2, tmp1 )
  1:
  	sub	result, data1, data2
  	ret
+	sb

  .Lstart_align:
  	lsr	limit_wd, limit, #3
@@ -236,6 +237,7 @@ CPU_LE( rev	data2, data2 )
  	lsr	data1, data1, #56
  	sub	result, data1, data2, lsr #56
  	ret
+	sb

  .Lremain8:
  	/* Limit % 8 == 0 =>. all data are equal.*/
@@ -251,7 +253,9 @@ CPU_LE( rev	data2, data2 )
  	b.eq	.Ltiny8proc
  	sub	result, data1, data2
  	ret
+	sb
  .Lret0:
  	mov	result, #0
  	ret
+	sb
  ENDPROC(memcmp)
diff --git a/xen/arch/arm/arm64/lib/memcpy.S 
b/xen/arch/arm/arm64/lib/memcpy.S
index d90d20ef3ea8..f79ba8cb9515 100644
--- a/xen/arch/arm/arm64/lib/memcpy.S
+++ b/xen/arch/arm/arm64/lib/memcpy.S
@@ -142,6 +142,7 @@ ENTRY(memcpy)

  .Lexitfunc:
  	ret
+	sb

  .Lcpy_over64:
  	subs	count, count, #128
@@ -162,6 +163,7 @@ ENTRY(memcpy)
  	tst	count, #0x3f
  	b.ne	.Ltail63
  	ret
+	sb

  	/*
  	* Critical loop.  Start at a new cache line boundary.  Assuming
@@ -197,4 +199,5 @@ ENTRY(memcpy)
  	tst	count, #0x3f
  	b.ne	.Ltail63
  	ret
+	sb
  ENDPROC(memcpy)
diff --git a/xen/arch/arm/arm64/lib/memmove.S 
b/xen/arch/arm/arm64/lib/memmove.S
index a49de845d066..dc0429583db7 100644
--- a/xen/arch/arm/arm64/lib/memmove.S
+++ b/xen/arch/arm/arm64/lib/memmove.S
@@ -138,6 +138,7 @@ ENTRY(memmove)

  .Lexitfunc:
  	ret
+	sb

  .Lcpy_over64:
  	subs	count, count, #128
@@ -158,6 +159,7 @@ ENTRY(memmove)
  	tst	count, #0x3f
  	b.ne	.Ltail63
  	ret
+	sb

  	/*
  	* Critical loop. Start at a new cache line boundary. Assuming
@@ -193,4 +195,5 @@ ENTRY(memmove)
  	tst	count, #0x3f
  	b.ne	.Ltail63
  	ret
+	sb
  ENDPROC(memmove)
diff --git a/xen/arch/arm/arm64/lib/memset.S 
b/xen/arch/arm/arm64/lib/memset.S
index 5bf751521b60..e052d7c937d8 100644
--- a/xen/arch/arm/arm64/lib/memset.S
+++ b/xen/arch/arm/arm64/lib/memset.S
@@ -76,6 +76,7 @@ ENTRY(memset)
  	strb	A_lw, [dst]
  4:
  	ret
+	sb

  .Lover16_proc:
  	/*Whether  the start address is aligned with 16.*/
@@ -120,6 +121,7 @@ ENTRY(memset)
  	stp	A_l, A_l, [dst, #-16]	/* Repeat some/all of last store. */
  4:
  	ret
+	sb

  	/*
  	* Critical loop. Start at a new cache line boundary. Assuming
@@ -141,6 +143,7 @@ ENTRY(memset)
  	b.ne	.Ltail63
  .Lexitfunc:
  	ret
+	sb

  	/*
  	* For zeroing memory, check to see if we can use the ZVA feature to
@@ -212,4 +215,5 @@ ENTRY(memset)
  	ands	count, count, zva_bits_x
  	b.ne	.Ltail_maybe_long
  	ret
+	sb
  ENDPROC(memset)
diff --git a/xen/arch/arm/arm64/lib/strchr.S 
b/xen/arch/arm/arm64/lib/strchr.S
index 0506b0ff7f3a..be1d2fa2ec82 100644
--- a/xen/arch/arm/arm64/lib/strchr.S
+++ b/xen/arch/arm/arm64/lib/strchr.S
@@ -17,6 +17,7 @@
   * along with this program.  If not, see <http://www.gnu.org/licenses/>.
   */

+#include <asm/macros.h>

  /*
   * Find the first occurrence of a character in a string.
@@ -37,4 +38,5 @@ ENTRY(strchr)
  	cmp	w2, w1
  	csel	x0, x0, xzr, eq
  	ret
+	sb
  ENDPROC(strchr)
diff --git a/xen/arch/arm/arm64/lib/strcmp.S 
b/xen/arch/arm/arm64/lib/strcmp.S
index c6f42dd2550b..08eda29302f0 100644
--- a/xen/arch/arm/arm64/lib/strcmp.S
+++ b/xen/arch/arm/arm64/lib/strcmp.S
@@ -133,6 +133,7 @@ CPU_LE( lsr	tmp2, tmp2, tmp1 )	/* Shift (tmp1 & 63).  */
  1:
  	sub	result, data1, data2
  	ret
+	sb

  .Lstart_align:
  	ands	xzr, src1, #7
@@ -205,6 +206,7 @@ CPU_BE( cmp	data1, data2 )
  CPU_BE( cset	result, ne )
  CPU_BE( cneg	result, result, lo )
  CPU_BE( ret )
+CPU_BE( sb )
  CPU_BE( 1: )
  	/*Re-compute the NUL-byte detection, using a byte-reversed value. */
  CPU_BE(	rev	tmp3, data1 )
@@ -230,4 +232,5 @@ CPU_BE(	orr	syndrome, diff, has_nul )
  	lsr	data1, data1, #56
  	sub	result, data1, data2, lsr #56
  	ret
+	sb
  ENDPROC(strcmp)
diff --git a/xen/arch/arm/arm64/lib/strlen.S 
b/xen/arch/arm/arm64/lib/strlen.S
index fb6aaf1a6afb..92df3c5e4418 100644
--- a/xen/arch/arm/arm64/lib/strlen.S
+++ b/xen/arch/arm/arm64/lib/strlen.S
@@ -106,6 +106,7 @@ CPU_BE( bic	has_nul2, tmp1, tmp2 )
  	clz	pos, has_nul2
  	add	len, len, pos, lsr #3		/* Bits to bytes.  */
  	ret
+	sb

  .Lmisaligned:
  	cmp	tmp1, #8
diff --git a/xen/arch/arm/arm64/lib/strncmp.S 
b/xen/arch/arm/arm64/lib/strncmp.S
index a4a0f779f56e..e13ff99fe75e 100644
--- a/xen/arch/arm/arm64/lib/strncmp.S
+++ b/xen/arch/arm/arm64/lib/strncmp.S
@@ -182,6 +182,7 @@ CPU_LE( lsr	tmp2, tmp2, tmp3 )	/* Shift (tmp1 & 63).  */
  1:
  	sub	result, data1, data2
  	ret
+	sb

  .Lstart_align:
  	lsr	limit_wd, limit, #3
@@ -264,6 +265,7 @@ CPU_BE( cmp	data1, data2 )
  CPU_BE( cset	result, ne )
  CPU_BE( cneg	result, result, lo )
  CPU_BE( ret )
+CPU_BE( ret )
  CPU_BE( 1: )
  	/* Re-compute the NUL-byte detection, using a byte-reversed value.*/
  CPU_BE( rev	tmp3, data1 )
@@ -288,6 +290,7 @@ CPU_BE( orr	syndrome, diff, has_nul )
  	lsr	data1, data1, #56
  	sub	result, data1, data2, lsr #56
  	ret
+	sb

  .Lremain8:
  	/* Limit % 8 == 0 => all bytes significant.  */
@@ -303,8 +306,10 @@ CPU_BE( orr	syndrome, diff, has_nul )
  	b.eq	.Ltiny8proc
  	sub	result, data1, data2
  	ret
+	sb

  .Lret0:
  	mov	result, #0
  	ret
+	sb
  ENDPROC(strncmp)
diff --git a/xen/arch/arm/arm64/lib/strnlen.S 
b/xen/arch/arm/arm64/lib/strnlen.S
index 81c8e8b54ea9..c59467bf17e1 100644
--- a/xen/arch/arm/arm64/lib/strnlen.S
+++ b/xen/arch/arm/arm64/lib/strnlen.S
@@ -126,6 +126,7 @@ CPU_BE( bic	has_nul2, tmp1, tmp2 )
  	cmp	len, limit
  	csel	len, len, limit, ls     /* Return the lower value.  */
  	ret
+	sb

  .Lmisaligned:
  	/*
@@ -168,4 +169,5 @@ CPU_LE( lsr	tmp2, tmp2, tmp4 )	/* Shift (tmp1 & 63).  */
  .Lhit_limit:
  	mov	len, limit
  	ret
+	sb
  ENDPROC(strnlen)
diff --git a/xen/arch/arm/arm64/lib/strrchr.S 
b/xen/arch/arm/arm64/lib/strrchr.S
index 07059983f828..fc8b6e446071 100644
--- a/xen/arch/arm/arm64/lib/strrchr.S
+++ b/xen/arch/arm/arm64/lib/strrchr.S
@@ -17,6 +17,8 @@
   * along with this program.  If not, see <http://www.gnu.org/licenses/>.
   */

+#include <asm/macros.h>
+
  /*
   * Find the last occurrence of a character in a string.
   *
@@ -37,4 +39,5 @@ ENTRY(strrchr)
  	b	1b
  2:	mov	x0, x3
  	ret
+	sb
  ENDPROC(strrchr)
diff --git a/xen/arch/arm/arm64/smc.S b/xen/arch/arm/arm64/smc.S
index b0752be57e8f..e0a3106dd7ec 100644
--- a/xen/arch/arm/arm64/smc.S
+++ b/xen/arch/arm/arm64/smc.S
@@ -30,3 +30,4 @@ ENTRY(__arm_smccc_1_0_smc)
          stp     x2, x3, [x4, #SMCCC_RES_a2]
  1:
          ret
+        sb

-- 
Julien Grall

