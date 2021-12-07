Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AF346C39A
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 20:25:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241767.418244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mug5V-0005ua-IW; Tue, 07 Dec 2021 19:25:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241767.418244; Tue, 07 Dec 2021 19:25:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mug5V-0005ry-Ev; Tue, 07 Dec 2021 19:25:17 +0000
Received: by outflank-mailman (input) for mailman id 241767;
 Tue, 07 Dec 2021 19:25:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mug5U-0005rs-2Q
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 19:25:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mug5P-0000xk-SM; Tue, 07 Dec 2021 19:25:11 +0000
Received: from [54.239.6.187] (helo=[10.95.81.235])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mug5P-0000pK-L1; Tue, 07 Dec 2021 19:25:11 +0000
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
	bh=wimSA2WoZnpW6l9b4jWoQriO2mDgiXNKfENifs7vuQI=; b=bu3GJ8s+NTVINCFv2xG1lfXdD3
	7ylcnvyTTfbiGV2GDdxAunZNgxqoItMb9W6GQfYH/PBGMRqVxwxCjHAPjFOrYX2YjErMTjeoT6AmF
	fsMjsn2L/0uhqcbqMWFXyj7tcumRuhtbdPdR+Eu9jg1DVQgvxC0vH975+BFMZB46FPc8=;
Message-ID: <ed24bb81-2905-b50a-bc26-326dd5cbc934@xen.org>
Date: Tue, 7 Dec 2021 19:25:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH] xen/arm64: Zero the top 32 bits of gp registers on
 entry...
To: Jan Beulich <jbeulich@suse.com>, Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20211206142032.27536-1-michal.orzel@arm.com>
 <f3573439-4893-440f-54e1-fdeba3eb4508@xen.org>
 <dc114877-b9da-7a5b-260d-b9438cddd777@arm.com>
 <086feb9a-7d6b-3797-3643-1b4474e4a420@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <086feb9a-7d6b-3797-3643-1b4474e4a420@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan,

On 07/12/2021 09:55, Jan Beulich wrote:
>>>> --- a/xen/arch/arm/arm64/entry.S
>>>> +++ b/xen/arch/arm/arm64/entry.S
>>>> @@ -109,8 +109,16 @@
>>>>     * If 0, we rely on the on x0/x1 to have been saved at the correct
>>>>     * position on the stack before.
>>>>     */
>>>> -        .macro  entry, hyp, compat, save_x0_x1=1
>>>> +        .macro  entry, hyp, compat=0, save_x0_x1=1
>>>>            sub     sp, sp, #(UREGS_SPSR_el1 - UREGS_LR) /* CPSR, PC, SP, LR */
>>>> +
>>>> +        /* Zero the upper 32 bits of the registers when switching to AArch32 */
>>>> +        .if \compat == 1      /* AArch32 mode */
>>>> +        .irp nr,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29
>>>> +        mov w\nr, w\nr
>>>> +        .endr
>>>> +        .endif
>>>
>>> So Jan mentioned, the x0/x1 may have already been saved. So you may need to fetch them from the stack and then clobber the top 32-bit.
>>>
>> So I would do the following:
>> -fetch x0/x1 from the stack
>> -clobber them
>> -store them again on the stack
>>
>> /*
>>   * Zero the upper 32 bits of the gp registers when switching
>>   * from AArch32.
>>   */
>> .if \compat == 1      /* AArch32 mode */
>>
>> /* x0/x1 have already been saved so fetch them to zero top 32 bits */
>> .if \save_x0_x1 == 0
>> ldp     x0, x1, [sp], #(UREGS_kernel_sizeof - UREGS_X0)
>> .endif
>>
>> .irp nr,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29
>> mov w\nr, w\nr
>> .endr
>>
>> .if \save_x0_x1 == 0
>> stp     x0, x1, [sp, #-(UREGS_kernel_sizeof - UREGS_X0)]
>> .endif
>>
>> .endif
> 
> Wouldn't it be more efficient to store 32 bits of zero each into the
> high halves of the respective stack slots? Afaict same code size, but
> less memory / cache traffic.

It would indeed be more efficient.

> Plus it would avoid the latent issue of
> a user of the macro actually expecting the two registers to retain
> their values across the macro invocation.

While this is not explicitely written, a caller cannot expect the 
registers to be preserved by this macro.

> 
> I'm also puzzled by the two different memory addressing forms, but I
> can easily see that I may be lacking enough Arm knowledge there.

I agree this is quite puzzling. The first one would update 'sp' after 
loading the register but I don't quite understand why it is necessary.

Assuming the this is happening before the instruction 'sub sp, sp, ...', 
then we should only need to load/store from sp with an offset (i.e. the 
second form).

Cheers,

-- 
Julien Grall

