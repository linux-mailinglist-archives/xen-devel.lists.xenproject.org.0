Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 789A65B0896
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 17:31:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401970.643952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVx13-0005pH-Fq; Wed, 07 Sep 2022 15:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401970.643952; Wed, 07 Sep 2022 15:31:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVx13-0005mS-Bp; Wed, 07 Sep 2022 15:31:01 +0000
Received: by outflank-mailman (input) for mailman id 401970;
 Wed, 07 Sep 2022 15:31:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVx12-0005mM-5D
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 15:31:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVx10-0000Iz-Gz; Wed, 07 Sep 2022 15:30:58 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVx10-0000iZ-BD; Wed, 07 Sep 2022 15:30:58 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:Subject:From:Cc:To:
	MIME-Version:Date:Message-ID; bh=MMcDI8GgeHxlaAISEiJxO5zOBBxU1wk0Bp3mURHINJU=
	; b=VFW6mf3N8z21kNz8CkLqN6B5uDArGmxy4ar42rRrDYHbIvjjk1abkf5Sl1YtGHJ0dFbIHKw5W
	mlHR2ca2kqL2jM2HJvLDcFW8VERzL09oA0x6kr0rtK2+Fmhf0czZM0MA1rkTzJGyuD8dxtMb6qotJ
	C5cApNJ0rHj+gDOingjgk=;
Message-ID: <c71163f6-2646-6fae-cb22-600eb0486539@xen.org>
Date: Wed, 7 Sep 2022 16:30:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Content-Language: en-US
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Julien Grall <julien@xen.org>
Subject: Unaligned access on arm32
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I think mentioned it privately a while a go, but never sent an e-mail 
about it.

While testing arm32 with IOREQ, I noticed Xen is crashing because an 
alignment fault:

(XEN) Data Abort Trap. Syndrome=0x1800061
(XEN) Walking Hypervisor VA 0x40027ebb on CPU0 via TTBR 0x000000004012f000
(XEN) 1ST[0x001] = 0x00400000bbffff7f
(XEN) 2ND[0x000] = 0x00500000bc000f7d
(XEN) CPU0: Unexpected Trap: Data Abort
(XEN) ----[ Xen-4.17-unstable  arm32  debug=n  Tainted:   C    ]----
(XEN) CPU:    0
(XEN) PC:     002613b8 try_fwd_ioserv+0x44/0x1bc
(XEN) CPSR:   6000005a MODE:Hypervisor
(XEN)      R0: 00000000 R1: 00000001 R2: 0022a748 R3: 00000006
(XEN)      R4: 40027f20 R5: 40027f58 R6: 40028000 R7: 00000000
(XEN)      R8: 40027f20 R9: 4003a438 R10:002f0044 R11:40027edc R12:00000002
(XEN) HYP: SP: 40027e94 LR: 00260edc
(XEN)
(XEN)   VTCR_EL2: 80003558
(XEN)  VTTBR_EL2: 00010000bbff8000
(XEN)
(XEN)  SCTLR_EL2: 30cd187f
(XEN)    HCR_EL2: 007c663f
(XEN)  TTBR0_EL2: 000000004012f000
(XEN)
(XEN)    ESR_EL2: 97800061
(XEN)  HPFAR_EL2: 0067faf0
(XEN)      HDFAR: 40027ebb
(XEN)      HIFAR: 67600000
(XEN)
(XEN) Xen stack trace from sp=40027e94:
(XEN)    97800061 0022a748 00000001 00000000 8000005a 00800000 4003a000 
00000001
(XEN)    4003a180 00000000 bbff47ff 00000000 67faf200 00000000 4003a000 
40027f20
(XEN)    4003a438 40027f1c 00260edc 002f0110 40027f58 40028000 4003a000 
0000013b
(XEN)    40028000 002f0280 00000090 40027f58 67faf200 93820006 67faf200 
00000000
(XEN)    00000000 40027f54 0026b6ac 93820006 0022a748 00000001 00000004 
67faf200
(XEN)    00000000 00000000 00000000 00000000 ffffffff 68000000 400001d3 
40027f58
(XEN)    00201870 60000000 67601324 67faf200 00000000 00000013 00000000 
00000000
(XEN)    ffffffff 68000000 400001d3 00000000 00000000 00000000 ffffffff 
00000000
(XEN)    67601074 000001d3 93820006 00000000 00000000 00000000 00000000 
67601008
(XEN)    00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
(XEN)    00000000 00000000 00000000 400001d3 00000000 00000000 00000000 
00000000
(XEN)    00000000 00000000 00000001
(XEN) Xen call trace:
(XEN)    [<002613b8>] try_fwd_ioserv+0x44/0x1bc (PC)
(XEN)    [<00260edc>] try_handle_mmio+0x2b0/0x2f4 (LR)
(XEN)    [<00260edc>] try_handle_mmio+0x2b0/0x2f4
(XEN)    [<0026b6ac>] 
arch/arm/traps.c#do_trap_stage2_abort_guest+0x18c/0x34c
(XEN)    [<00201870>] entry.o#return_from_trap+0/0x4
(XEN)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) CPU0: Unexpected Trap: Data Abort
(XEN) ****************************************

The disassembled code is:

00261374 <try_fwd_ioserv>:
   261374:       e16d42f0        strd    r4, [sp, #-32]! ; 0xffffffe0
   261378:       e1a04002        mov     r4, r2
   26137c:       e1a05000        mov     r5, r0
   261380:       e1cd60f8        strd    r6, [sp, #8]
   261384:       e3a00000        mov     r0, #0
   261388:       e1a06001        mov     r6, r1
   26138c:       e1cd81f0        strd    r8, [sp, #16]
   261390:       e3a01001        mov     r1, #1
   261394:       e58db018        str     fp, [sp, #24]
   261398:       e28db01c        add     fp, sp, #28
   26139c:       e58de01c        str     lr, [sp, #28]
   2613a0:       e24dd028        sub     sp, sp, #40     ; 0x28
   2613a4:       e1c220d4        ldrd    r2, [r2, #4]
   2613a8:       e50b0024        str     r0, [fp, #-36]  ; 0xffffffdc
   2613ac:       e5d67a26        ldrb    r7, [r6, #2598] ; 0xa26
   2613b0:       e14b24f4        strd    r2, [fp, #-68]  ; 0xffffffbc
   2613b4:       e5d43000        ldrb    r3, [r4]
* 2613b8:       e50b0021        str     r0, [fp, #-33]  ; 0xffffffdf

The problem is GCC [1] decided to use 'str' for accessing an address 
that is not 32-bit aligned (fp - 33 = 0x40027e73). On arm32, we are 
forbidding aligned access, hence why it crashed.

Looking online, it looks like GCC has an option to turned on/off the use 
of unaligned access [2] and it is enabled by default on ARMv7 (I am not 
sure why we didn't notice this before...).

I have rebuilt Xen with the option turn off and dom0 is now booting fine.

However, I am a bit puzzled because the C code didn't contain unaligned 
access. It was all introduced by the compiler itself. This is breaking 
our assumption that the compiler will not break down correctly naturally 
aligned access.

When using the new option, Xen size is increasing by 0.40% (about ~3KB) 
in my setup. Nothing too concerning, but I would like to have some 
opinion first.

The alternative would be to allow unaligned access. That said, I think 
this is much saner to have a strict enforcement as we can catch GCC 
trying to do unaligned access when it is not expected.

There is also the argument that unaligned access can be slower on some 
platform. So it is better to avoid them.

Any thoughts?

Cheers,

[1] gcc (GCC) 7.3.1 20180712 (Red Hat 7.3.1-15)
[2] https://gcc.gnu.org/onlinedocs/gcc-4.8.5/gcc/ARM-Options.html

-- 
Julien Grall

