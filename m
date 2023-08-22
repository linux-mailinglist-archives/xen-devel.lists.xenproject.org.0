Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 619BA784CCC
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 00:20:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588729.920313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYZiK-0001g8-H6; Tue, 22 Aug 2023 22:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588729.920313; Tue, 22 Aug 2023 22:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYZiK-0001de-ET; Tue, 22 Aug 2023 22:19:04 +0000
Received: by outflank-mailman (input) for mailman id 588729;
 Tue, 22 Aug 2023 22:19:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SWhE=EH=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qYZiJ-0001dY-Bc
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 22:19:03 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2976b9a-4139-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 00:18:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 90AF08284FA8;
 Tue, 22 Aug 2023 17:18:55 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id JrS0JRIztabt; Tue, 22 Aug 2023 17:18:54 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B28BC828524D;
 Tue, 22 Aug 2023 17:18:54 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Hqq8wi4c1PQr; Tue, 22 Aug 2023 17:18:54 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 53CC98284FA8;
 Tue, 22 Aug 2023 17:18:54 -0500 (CDT)
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
X-Inumbo-ID: e2976b9a-4139-11ee-9b0c-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com B28BC828524D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1692742734; bh=K9i50J5crpBftPwPzzGHwUIT2KQOC2K6yXOMHdvrams=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=kqpv8gGomFjzDAxAtYmKSY+ZDAWRd/yxrURP95JwwpWMghwRt9J94VLckKiSAr1h8
	 1DGVi+xgLZkbb4ePk4oEYRdpPyPmtx/xP3fwF1EM1e1Wuf21xsgfcMJ5KHB45yfs2r
	 eDfqQ9ufMUGOL8xEO1CvYrnbkHE5AzYJ3/kzskJ0=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <83ab8ddd-9461-075e-cc9f-d8fb02918ce4@raptorengineering.com>
Date: Tue, 22 Aug 2023 17:18:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 2/3] xen/ppc: Relocate kernel to physical address 0 on
 boot
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1691620546.git.sanastasio@raptorengineering.com>
 <6b965917ffb2185c541f04ff18a624282ca6e211.1691620546.git.sanastasio@raptorengineering.com>
 <c59ef4ea-f6a9-fee5-282b-76a4533e04fc@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <c59ef4ea-f6a9-fee5-282b-76a4533e04fc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/14/23 8:09 AM, Jan Beulich wrote:
> On 10.08.2023 00:48, Shawn Anastasio wrote:
>> --- a/xen/arch/ppc/ppc64/head.S
>> +++ b/xen/arch/ppc/ppc64/head.S
>> @@ -17,6 +17,33 @@ ENTRY(start)
>>      addis   %r2, %r12, .TOC.-1b@ha
>>      addi    %r2, %r2, .TOC.-1b@l
>>
>> +    /*
>> +     * Copy Xen to physical address zero and jump to XEN_VIRT_START
>> +     * (0xc000000000000000). This works because the hardware will ignore the top
>> +     * four address bits when the MMU is off.
>> +     */
>> +    LOAD_REG_ADDR(%r1, _start)
>> +    LOAD_IMM64(%r12, XEN_VIRT_START)
>> +
>> +    /* If we're at the correct address, skip copy */
>> +    cmpld   %r1, %r12
>> +    beq     .L_correct_address
>> +
>> +    /* Copy bytes until _end */
>> +    LOAD_REG_ADDR(%r11, _end)
>> +    addi    %r1, %r1, -8
>> +    li      %r13, -8
>> +.L_copy_xen:
>> +    ldu     %r10, 8(%r1)
>> +    stdu    %r10, 8(%r13)
>> +    cmpld   %r1, %r11
>> +    blt     .L_copy_xen
>> +
>> +    /* Jump to XEN_VIRT_START */
>> +    mtctr   %r12
>> +    bctr
>> +.L_correct_address:
> 
> Somewhat related to my earlier remark towards using %sp instead of
> %r1: Are you intentionally fiddling with the stack pointer here,
> corrupting any earlier stack that the boot loader might have set?
> This ...
> 
>>      /* set up the initial stack */
>>      LOAD_REG_ADDR(%r1, cpu0_boot_stack)
>>      li      %r11, 0
> 
> ... is where you actually switch stacks. Using the stack pointer
> here is likely okay, albeit a bit unusual, the more that you have
> ample registers available for use.

This was intentional -- I just chose it as a free register to use, since
as you point out it preceeds the stack set-up code. I agree it might be
a bit confusing though and we do have an ample amount of registers to
play with, so I'll change it to something else for clarity's sake.

> Jan

Thanks,
Shawn


