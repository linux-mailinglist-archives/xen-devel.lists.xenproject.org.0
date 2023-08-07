Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E2B772A35
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 18:11:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578705.906339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT2pC-0006cm-P3; Mon, 07 Aug 2023 16:11:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578705.906339; Mon, 07 Aug 2023 16:11:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT2pC-0006am-MI; Mon, 07 Aug 2023 16:11:18 +0000
Received: by outflank-mailman (input) for mailman id 578705;
 Mon, 07 Aug 2023 16:11:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Un4=DY=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qT2pB-0006ag-FM
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 16:11:17 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 077e640e-353d-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 18:11:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5A9358285869;
 Mon,  7 Aug 2023 11:11:12 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id pYCinvAMIQ1S; Mon,  7 Aug 2023 11:11:11 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 69F8E8285885;
 Mon,  7 Aug 2023 11:11:11 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id yZ_eAsO6-xEJ; Mon,  7 Aug 2023 11:11:11 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id DE94D8285869;
 Mon,  7 Aug 2023 11:11:10 -0500 (CDT)
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
X-Inumbo-ID: 077e640e-353d-11ee-8613-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 69F8E8285885
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1691424671; bh=0cRbmjHmU3vpRBmIhesDOLeQ7IvDLovh8+UtZ5ei1MA=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=bZMSz66/lCl7cQaJnvlSVMYir8u3lMpZFdlln4522UTw5Xf8mSrDouU9NOpNr6Esc
	 uqHGT+r9pe3oZPUnV4ouIbzeVl0n0/D1hSxX+Mw07RfSvPGgp5pGs91HIhRZgsa14N
	 AXdvFlMaTC00I0RtdanLhSASKa0cxaUcp2chkFGU=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <7c4468be-a487-6497-f207-0d3c4e942d99@raptorengineering.com>
Date: Mon, 7 Aug 2023 11:11:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/4] xen/ppc: Implement early serial console on PowerNV
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690934409.git.sanastasio@raptorengineering.com>
 <3176762c2eb09d01d65a348e296a94cf0356ff46.1690934409.git.sanastasio@raptorengineering.com>
 <8cf5b42d-a80d-a8de-b564-8b45c97474c4@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <8cf5b42d-a80d-a8de-b564-8b45c97474c4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/7/23 10:05 AM, Jan Beulich wrote:
> On 02.08.2023 02:11, Shawn Anastasio wrote:
>> Implement the OPAL firmware calls required to write to the serial
>> console on PowerNV systems. Unlike pseries/Open Firmware, the OPAL
>> firmware interface can be used past early boot and as such the relevant
>> functions are not marked as __init.
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> Constraint as before and with two nits
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
>> @@ -20,8 +22,20 @@
>>   * Load the address of a symbol from the TOC into the specified GPR.
>>   */
>>  #define LOAD_REG_ADDR(reg,name)                                              \
>> -    addis reg,%r2,name@toc@ha;                                               \
>> -    addi  reg,reg,name@toc@l
>> +    addis reg, %r2, name@toc@ha;                                             \
>> +    addi  reg, reg, name@toc@l
>> +
>> +/*
>> + * Declare a global assembly function with a proper TOC setup prologue
>> + */
>> +#define _GLOBAL_TOC(name)                                                   \
>> +    .balign 4;                                                              \
>> +    .type name, @function;                                                  \
>> +    .globl name;                                                            \
>> +name:                                                                       \
>> +0:  addis %r2, %r12, (.TOC.-0b)@ha;                                         \
>> +    addi  %r2, %r2, (.TOC.-0b)@l;                                           \
> 
> Strictly speaking the - want surrounding by blanks, but I wonder whether
> to PPC eyes these constructs look more natural without. Please clarify.

This is admittedly very subjective, but to my eyes the code as-is looks
perfectly natural. That said, I wouldn't be opposed to adding spaces if
that's what you prefer.

>> --- /dev/null
>> +++ b/xen/arch/ppc/ppc64/opal-calls.S
>> @@ -0,0 +1,81 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Adapted from Linux's arch/powerpc/boot/opal-calls.S
>> + *
>> + * Copyright (c) 2016 IBM Corporation.
>> + * Copyright Raptor Engineering, LLC
>> + */
>> +
>> +#include <asm/asm-defns.h>
>> +#include <asm/opal-api.h>
>> +#include <asm/msr.h>
>> +
>> +    .text
>> +
>> +#define OPAL_CALL(name, token)  \
>> +    .globl name;                \
>> +name:                           \
>> +    li      %r0, token;         \
>> +    b       opal_call
>> +
>> + _GLOBAL_TOC(opal_call)
> 
> Any reason for the leading blank here?

No -- that was a mistake on my part.

> 
> Where necessary I again think these small items can be taken care of
> while committing.

Sounds good.

> Jan

Thanks,
Shawn

