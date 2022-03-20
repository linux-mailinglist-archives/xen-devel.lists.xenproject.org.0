Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB56D4E1D95
	for <lists+xen-devel@lfdr.de>; Sun, 20 Mar 2022 20:18:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292637.496952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nW13R-0002Fm-Q7; Sun, 20 Mar 2022 19:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292637.496952; Sun, 20 Mar 2022 19:17:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nW13R-0002DX-Lg; Sun, 20 Mar 2022 19:17:29 +0000
Received: by outflank-mailman (input) for mailman id 292637;
 Sun, 20 Mar 2022 19:17:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nW13Q-0002DR-5T
 for xen-devel@lists.xenproject.org; Sun, 20 Mar 2022 19:17:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nW13M-0006aF-9N; Sun, 20 Mar 2022 19:17:24 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nW13M-0006tk-2F; Sun, 20 Mar 2022 19:17:24 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	References:Cc:To:From:MIME-Version:Date:Message-ID;
	bh=3qm6hEPN2LLfSCRBhSGf6fJR+8kHyoyLOti3Bt446Ok=; b=iVsBTanu3WuxRR7tmz7FfTnHKT
	G2xvD6wG1iE0wJEpcWCZWezPJTNl3Xffs8kG6IHpqdGntRKoDBfb92TS52lNiSm9PaqbpoCtAZDSP
	eZP0eZkgDiSU7Kbta5pZA3rjbsdOtK36aLCq7UTmoSQMTWB9Mc4tqu1l2deMxnQjZL24=;
Message-ID: <1a8ed108-7485-1ed5-3819-fd921164662b@xen.org>
Date: Sun, 20 Mar 2022 19:17:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
From: Julien Grall <julien@xen.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220320010509.3605525-1-sstabellini@kernel.org>
 <33f1ea14-4486-be3d-ca9f-a82274078dba@xen.org>
Subject: Re: [PATCH] xen/arm: skip first 32 bytes of zimage32
In-Reply-To: <33f1ea14-4486-be3d-ca9f-a82274078dba@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 20/03/2022 07:47, Julien Grall wrote:
> On 20/03/2022 01:05, Stefano Stabellini wrote:
>> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>
>> The first 32 bytes of zImage32 are NOPs, not useful just there for
>> compatibility. The reason is that some bootloaders skip the first 32
>> bytes when starting the kernel. See the comment in Linux
>> arch/arm/boot/compressed/head.S.
> 
> Please mention the Linux verson.
> 
>>
>> Since the introduction of CONFIG_EFI in Linux arm32, those NOPs
>> operations have changed implementation from:
>>
>>      mov r0, r0
>>
>> to:
>>      .inst   MZ_MAGIC | (0x1310 << 16)   @ tstne r0, #0x4d000
> 
> I have duplicated the comment and the instructions below:
> 
>                  @ This is a two-instruction NOP, which happens to bear the
>                  @ PE/COFF signature "MZ" in the first two bytes, so the 
> kernel
>                  @ is accepted as an EFI binary. Booting via the UEFI stub
>                  @ will not execute those instructions, but the ARM/Linux
>                  @ boot protocol does, so we need some NOPs here.
>                  .inst   MZ_MAGIC | (0xe225 << 16)       @ eor r5, r5, 
> 0x4d000
>                  eor     r5, r5, 0x4d000                 @ undo previous 
> insn
> 
> 
> I read this as they are NOPs and this change should not break the 
> ARM/Linux boot protocol (we are using it in Xen).
> 
> BTW, the instruction decoding is different compare to me. Which version 
> of Linux are you using?
> 
>>
>> See arch/arm/boot/compressed/efi-header.S.
>>
>> The new implementation doesn't work on Xen (at least on all versions of
>> QEMU I tried).
> 
> As I wrote above, they are NOPs. So why is this breaking?

I have tried to boot the latest Linux (commit 14702b3b2438) with 
CONFIG_EFI=y on QEMU (commit fa435db8ce1d). This booted for me.

As I wrote earlier today, the instruction used as NOPs is slightly 
different. So I had a look at the git history and found the following 
commit:

commit a92882a4d270
Author: Andre Przywara <andre.przywara@arm.com>
Date:   Mon Nov 22 16:28:43 2021 +0100

     ARM: 9159/1: decompressor: Avoid UNPREDICTABLE NOP encoding

     In the decompressor's head.S we need to start with an instruction that
     is some kind of NOP, but also mimics as the PE/COFF header, when the
     kernel is linked as an UEFI application. The clever solution here is
     "tstne r0, #0x4d000", which in the worst case just clobbers the
     condition flags, and bears the magic "MZ" signature in the lowest 
16 bits.

     However the encoding used (0x13105a4d) is actually not valid, since 
bits
     [15:12] are supposed to be 0 (written as "(0)" in the ARM ARM).
     Violating this is UNPREDICTABLE, and *can* trigger an UNDEFINED
     exception. Common Cortex cores seem to ignore those bits, but QEMU
     chooses to trap, so the code goes fishing because of a missing 
exception
     handler at this point. We are just saved by the fact that commonly 
(with
     -kernel or when running from U-Boot) the "Z" bit is set, so the
     instruction is never executed. See [0] for more details.

     To make things more robust and avoid UNPREDICTABLE behaviour in the
     kernel code, lets replace this with a "two-instruction NOP":
     The first instruction is an exclusive OR, the effect of which the 
second
     instruction reverts. This does not leave any trace, neither in a
     register nor in the condition flags. Also it's a perfectly valid
     encoding. Kudos to Peter Maydell for coming up with this gem.

     [0] 
https://lore.kernel.org/qemu-devel/YTPIdbUCmwagL5%2FD@os.inf.tu-dresden.de/T/

     Link: 
https://lore.kernel.org/linux-arm-kernel/20210908162617.104962-1-andre.przywara@arm.com/T/

So this is a bug in the kernel that has nothing to do with Xen.

Therefore, I am not in favor to workaround it in Xen. Where did you get 
your kernel from? If this from a distro, then please work with them to 
ingest the above patch.

Cheers,

-- 
Julien Grall

