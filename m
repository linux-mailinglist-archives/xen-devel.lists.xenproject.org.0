Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A9276A4ED
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 01:39:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573518.898294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQcSd-00024w-AX; Mon, 31 Jul 2023 23:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573518.898294; Mon, 31 Jul 2023 23:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQcSd-00022m-7j; Mon, 31 Jul 2023 23:37:59 +0000
Received: by outflank-mailman (input) for mailman id 573518;
 Mon, 31 Jul 2023 23:37:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vA1f=DR=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qQcSb-00022g-Mc
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 23:37:57 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45e79538-2ffb-11ee-b257-6b7b168915f2;
 Tue, 01 Aug 2023 01:37:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 39A3682846BB;
 Mon, 31 Jul 2023 18:37:54 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id VUFWwWELxJZ0; Mon, 31 Jul 2023 18:37:53 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4F45082850DA;
 Mon, 31 Jul 2023 18:37:53 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4W3dQPQPirl4; Mon, 31 Jul 2023 18:37:53 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id D8EE582846BB;
 Mon, 31 Jul 2023 18:37:52 -0500 (CDT)
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
X-Inumbo-ID: 45e79538-2ffb-11ee-b257-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 4F45082850DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1690846673; bh=SFbRSRktHw+6jWGitffOKn3udjPo8wO6h1ujQG9tglE=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=iiLsatslWnt+tcFRNeoBMH6FbqnlYF4HYSu8TPI7Nfpi1blrAYm3nlTalSvIsGCI2
	 Fy/nCIydkuu+TPvrC1ta3aCYMw7oOJPbBP0ZhzEZH7PY1CX57+6Qz5sSCDVAGAzudb
	 qh39Tz0E8L7VgaATkI+MNxiKv+zOYqnd8iHAqvIM=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <428aa0e8-70bb-efb5-2b5a-54229b77c5a3@raptorengineering.com>
Date: Mon, 31 Jul 2023 18:37:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] xen/ppc: Relocate kernel to physical address 0 on
 boot
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690582001.git.sanastasio@raptorengineering.com>
 <0802fad2743526da4fe49f0225e14161464f192e.1690582001.git.sanastasio@raptorengineering.com>
 <3b6b0984-89fb-268e-970a-0c7eb19a4863@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <3b6b0984-89fb-268e-970a-0c7eb19a4863@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/31/23 10:46 AM, Jan Beulich wrote:
> On 29.07.2023 00:21, Shawn Anastasio wrote:
>> Introduce a small assembly loop in `start` to copy the kernel to
>> physical address 0 before continuing. This ensures that the physical
>> address lines up with XEN_VIRT_START (0xc000000000000000) and allows us
>> to identity map the kernel when the MMU is set up in the next patch.
> 
> So PPC guarantees there's always a reasonable amount of memory at 0,
> and that's available for use?

Both Linux and FreeBSD rely on this being the case, so it's essentially
a de facto standard, though I'm not aware of any specification that
guarantees it.

>> --- a/xen/arch/ppc/ppc64/head.S
>> +++ b/xen/arch/ppc/ppc64/head.S
>> @@ -18,6 +18,33 @@ ENTRY(start)
>>      addis   %r2, %r12, .TOC.-1b@ha
>>      addi    %r2, %r2, .TOC.-1b@l
>>  
>> +    /*
>> +     * Copy Xen to physical address zero and jump to XEN_VIRT_START
>> +     * (0xc000000000000000). This works because the hardware will ignore the top
>> +     * four address bits when the MMU is off.
>> +     */
>> +    LOAD_REG_ADDR(%r1, start)
> 
> I think you really mean _start here (which is missing from the linker
> script),

The PIC patch series fixes the missing _start definition in the linker
script. In the cover letter of v2 I'll add a clear note that this series
is based on that one.

> not start. See also Andrew's recent related RISC-V change.

Good point. In practice this worked because the `start` function was the
first thing in the first section of the linker script, but of course
using _start here is more correct.

> 
>> +    LOAD_IMM64(%r12, XEN_VIRT_START)
>> +
>> +    /* If we're at the correct address, skip copy */
>> +    cmpld   %r1, %r12
>> +    beq     .L_correct_address
> 
> Can this ever be the case, especially with the MMU-off behavior you
> describe in the comment above? Wouldn't you need to ignore the top
> four bits in the comparison?

It will always be the case after the code jumps to XEN_VIRT_START after
the copy takes place. I could have it jump past the copy loop entirely,
but then I'd need to duplicate the TOC setup.

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
> Can the two regions potentially overlap? Looking at the ELF header
> it's not clear to me what guarantees there are that this can't
> happen.

As I understand it, any bootloader that placed the kernel at a low
enough address for this to be an issue wouldn't be able to boot Linux or
FreeBSD, so in practice it's a safe bet that this won't be the case.

> Jan

Thanks,
Shawn

