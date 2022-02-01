Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D69A4A5A6F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 11:46:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263493.456201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEqfS-0006As-RA; Tue, 01 Feb 2022 10:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263493.456201; Tue, 01 Feb 2022 10:45:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEqfS-00068P-O8; Tue, 01 Feb 2022 10:45:46 +0000
Received: by outflank-mailman (input) for mailman id 263493;
 Tue, 01 Feb 2022 10:45:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nEqfR-00068J-EQ
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 10:45:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nEqfR-00013B-31; Tue, 01 Feb 2022 10:45:45 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232] helo=[10.95.141.48])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nEqfQ-0007mH-RH; Tue, 01 Feb 2022 10:45:45 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=ZPCUgDWfXSAAr9lPrx18ihP+HRSLDlvXLGuB2Spz6H4=; b=P55YRVkMyY94EME1GnRJ1oSLT9
	aV9t6gY5p3TMFU8SZbis6R7BdCx9qNz8hhZbNmzFvducmTkn3qfwnyyHGJKsSBPIALwSNu1d2Q4yo
	cOavlf23BsnKN4KX2u3xy6nB7D8ZMCFHXczTXJgfXGxcKaO7RaXZPX6teAkW3UzA5cdo=;
Message-ID: <7d9af246-9338-7862-6fee-b72f2ae6c4cc@xen.org>
Date: Tue, 1 Feb 2022 10:45:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN v5] xen/arm64: io: Decode ldr/str post-indexing instructions
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, Ayan Kumar Halder <ayankuma@xilinx.com>
References: <20220131193728.2980-1-ayankuma@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220131193728.2980-1-ayankuma@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 31/01/2022 19:37, Ayan Kumar Halder wrote:
> At the moment, Xen is only handling data abort with valid syndrome (i.e.
> ISV=0). Unfortunately, this doesn't cover all the instructions a domain
> could use to access MMIO regions.
> 
> For instance, a baremetal OS can use any of the following instructions, where
> x1 contains the address of the MMIO region:
> 
> 1.      ldr     x2,    [x1],    #8
> 2.      ldr     w2,    [x1],    #-4
> 3.      ldr     x2,    [x1],    #-8
> 4.      ldr     w2,    [x1],    #4
> 5.      ldrh    w2,    [x1],    #2
> 6.      ldrb    w2,    [x1],    #1
> 7.      str     x2,    [x1],    #8
> 8.      str     w2,    [x1],    #-4
> 9.      strh    w2,    [x1],    #2
> 10.     strb    w2,    [x1],    #1
> 
> In the following two instructions, Rn could theoretically be stack pointer which
> might contain the address of the MMIO region:-
> 11.     ldrb    w2,    [Rn],    #1
> 12.     ldrb    wzr,   [Rn],    #1
> 
> In order to handle post-indexing store/load instructions (like those mentioned
> above), Xen will need to fetch and decode the instruction.
> 
> Xen will not decode the instructions if the data abort is caused by stage1
> translation table walk or cache instructions. In the former scenario, it will
> try to update the page tables and in the latter scenario, it will ignore the
> instruction (ie simply increment the program counter).
> 
> If Xen is unable to decode the instructions, it will abort the guest.
> 
> This patch only cover post-index store/load instructions from AArch64 mode.
> For now, AArch32 mode is left unimplemented.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
> ---
> 
> Changelog :-
> v2 - 1. Updated the rn register after reading from it. (Pointed by Julien,
>          Stefano)
>       2. Used a union to represent the instruction opcode (Suggestd by Bertrand)
>       3. Fixed coding style issues (Pointed by Julien)
>       4. In the previous patch, I was updating dabt->sign based on the signedness
>          of imm9. This was incorrect. As mentioned in ARMv8 ARM  DDI 0487G.b,
>          Page 3221, SSE indicates the signedness of the data item loaded. In our
>          case, the data item loaded is always unsigned.
> 
> v3- 1. Handled all the variants of ldr/str (ie 64, 32, 16, 8 bit variants).
>         Thus, I have removed the check for "instr->code.opc == 0" (Suggested by
>         Andre)
>      2. Handled the scenario when rn = SP, rt = XZR (Suggested by Jan, Andre)
>      3. Added restriction for "rt != rn" (Suggested by Andre)
>      4. Moved union ldr_str_instr_class {} to decode.h. This is the header included
>         by io.c and decode.c (where the union is referred). (Suggested by Jan)
>      5. Indentation and typo fixes (Suggested by Jan)
> 
> v4- 1. Fixed the patch as per Stefano's comments on v3. They are as follows :-
>          1.1 Use macros to determine the fixed values in the instruction opcode
>          1.2 Checked if instr != NULL
>          1.3 Changed some data types and added #define ARM_64 for AArch64 specific
>              code
>          1.4 Moved post_increment_register() to decode.c so that the decoding
>              logic is confined to a single file.
>          1.5 Moved some checks from post_increment_register() to
>              decode_loadstore_postindexing()
>          1.6 Removed a duplicate check
>      2. Updated the commit message as per Andre's comments.
>      3. Changed the names of a label and some comments. *32bit* was erroneously
>         mentioned in a label and comments in decode_loadstore_postindexing()
>         although the function handled all variants of ldr/str post indexing.
> 
> v5- 1. Renamed decode_loadstore_postindexing() to decode_arm64(). The reason
>         being this will be extended in future to support more instructions for
>         which hsr_badt.isv = 0
>      2. Introduce a function try_decode_instruction_invalid_iss() to determine
>         if the instruction needs to be decoded before invoking decode_instruction().
> 
>         It checks :-
>         2.1  dabt->s1ptw - Returns IO_UNHANDLED
>         2.2  dabt->cache - Returns IO_IGNORED. (new enum instroduced to let the
>              caller know that the instruction needs to be ignored by Xen. Thus
>              the caller needs to increment the PC and return to the guest.
> 
>      3. Invoked try_decode_instruction_invalid_iss() from the following 2 places :-
>          3.a - try_handle_mmio() - When we have determined that there is a valid
>                mmio handler.
>          3.b - try_fwd_ioserv()
>          When ioserver completes the io request, the acknowledgement is sent via
>          handle_ioserv(). Here, we need to increment the register. As there is no
>          common data shared between try_fwd_ioserv() and handle_ioserv(), we need
>          to decode the instruction again in handle_ioserv() to determine rn, imm9.
> 
>          (NOTE to Reviewers) - This does not feel correct. However, I could not
>          think of a better approach. Please provide your inputs.
> 
>      4. Augumented struct hsr_dabt{} with struct hsr_dabt_instr_details{} to hold
>         rn and imm9. This is passed to post_increment_register() to update rn.
>      5. Other style changes as suggested in v4.
> 
>   Patch has been based on the comments received on the following two patches:-
>   1. https://lists.xenproject.org/archives/html/xen-devel/2022-01/msg01245.html
>   2. https://lists.xenproject.org/archives/html/xen-devel/2022-01/msg01279.html
> 
>   xen/arch/arm/arm32/traps.c  |  7 ++++
>   xen/arch/arm/arm64/traps.c  | 42 +++++++++++++++++++++
>   xen/arch/arm/decode.c       | 73 +++++++++++++++++++++++++++++++++++++
>   xen/arch/arm/decode.h       | 42 ++++++++++++++++++++-
>   xen/arch/arm/io.c           | 66 +++++++++++++++++++++++++++------
>   xen/arch/arm/ioreq.c        | 35 +++++++++++++++++-
>   xen/arch/arm/traps.c        |  1 +
>   xen/include/asm-arm/hsr.h   |  5 +++
>   xen/include/asm-arm/mmio.h  |  1 +
>   xen/include/asm-arm/traps.h |  1 +

I have tried to apply the patch on the latest staging. But this failed 
because xen/include/asm-arm was renamed to arch/arm/include/asm.

When sending e-mail to Xen-devel, please make sure to use the latest 
staging available.

Cheers,

-- 
Julien Grall

