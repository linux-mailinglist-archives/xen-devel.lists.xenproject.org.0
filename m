Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BD468EFF2
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 14:38:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491797.761095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPkeC-0004cW-1R; Wed, 08 Feb 2023 13:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491797.761095; Wed, 08 Feb 2023 13:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPkeB-0004ap-Ue; Wed, 08 Feb 2023 13:38:03 +0000
Received: by outflank-mailman (input) for mailman id 491797;
 Wed, 08 Feb 2023 13:38:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pPkeA-0004aj-NB
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 13:38:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pPkdk-0003DK-AW; Wed, 08 Feb 2023 13:37:36 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.11.45]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pPkdk-0004gM-2t; Wed, 08 Feb 2023 13:37:36 +0000
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
	bh=phXoCH2rrOKW//2xnsmEj1K+tWMZjXrxZBLeSAFDrAY=; b=MNFwsGvLEZF3BgB5OIOZ7qcV9w
	MnVZgWo3qSt97IleMT8bpNVixJSmg1cphu7yQwN8QJ6rYijq4v3z006XinAizcj+xBT1hjX6wvhra
	sQqsqtNotTOEL8v0nxGVKret42RDZS9IbA9ht9+yDtCCNLpU7zySYenX4Xx8lBPRdwbQ=;
Message-ID: <86efcc2f-57ee-9add-89b3-31b4dee56bcd@xen.org>
Date: Wed, 8 Feb 2023 13:37:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH v3 12/14] xen/riscv: introduce an implementation of macros
 from <asm/bug.h>
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1675779308.git.oleksii.kurochko@gmail.com>
 <404a4d6621a2e5eb276d2fa61188429294d682ba.1675779308.git.oleksii.kurochko@gmail.com>
 <bee6af5c-6000-461b-7642-2864d412e351@suse.com>
 <e69eb6695310ed63eb68291f76ba1ec96626d68b.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e69eb6695310ed63eb68291f76ba1ec96626d68b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 08/02/2023 12:00, Oleksii wrote:
> On Tue, 2023-02-07 at 16:07 +0100, Jan Beulich wrote:
>> On 07.02.2023 15:46, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/bug.h
>>> @@ -0,0 +1,38 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Copyright (C) 2012 Regents of the University of California
>>> + * Copyright (C) 2021-2023 Vates
>>> + *
>>> + */
>>> +#ifndef _ASM_RISCV_BUG_H
>>> +#define _ASM_RISCV_BUG_H
>>> +
>>> +#include <xen/types.h>
>>> +
>>> +#ifndef __ASSEMBLY__
>>> +
>>> +#define BUG_FN_REG t0
>>> +
>>> +#define BUG_INSTR "ebreak"
>>> +
>>> +#define INSN_LENGTH_MASK        _UL(0x3)
>>> +#define INSN_LENGTH_32          _UL(0x3)
>>
>> I assume these are deliberately over-simplified (not accounting for
>> wider than 32-bit insns in any way)?
> The base instruction set has a fixed length of 32-bit naturally aligned
> instructions.
> 
> There are extensions of variable length ( where each instruction can be
> any number of 16-bit parcels in length ) but they aren't used in Xen
> and Linux kernel ( where these definitions were taken from ).
> 
> Compressed ISA is used now where the instruction length is 16 bit  and
> 'ebreak' instruction, in this case, can be either 16 or 32 bit (
> depending on if compressed ISA is used or not )
>>
>>> +#define BUG_INSN_32             _UL(0x00100073) /* ebreak */
>>> +#define BUG_INSN_16             _UL(0x9002)     /* c.ebreak */
>>> +#define COMPRESSED_INSN_MASK    _UL(0xffff)
>>> +
>>> +#define GET_INSN_LENGTH(insn)                               \
>>> +({                                                          \
>>> +    unsigned long len;                                      \
>>> +    len = ((insn & INSN_LENGTH_MASK) == INSN_LENGTH_32) ?   \
>>> +        4UL : 2UL;                                          \
>>> +    len;                                                    \
>>
>> Any reason for the use of "unsigned long" (not "unsigned int") here?
>>
> There is no specific reason (at least I don't see it now). It looks
> like it can be used here even smaller type than 'unsigned int' as len,
> in current case, can be either 4 or 2.
> 
>>> +})
>>> +
>>> +/* These are defined by the architecture */
>>> +int is_valid_bugaddr(uint32_t addr);
>>
>> A function by this name very likely wants to return bool. Also -
>> uint32_t (not "unsigned long") for an address?
>>
> It should be unsigned long.

In other part of the code, you are using vaddr_t/paddr_t to describe an 
address. It would be best to use one of those (I think vaddr_t) so it is 
clear what kind of address it is supposed to take.

Cheers,

-- 
Julien Grall

