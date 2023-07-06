Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA91774A14E
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 17:43:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559919.875359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHR8l-0004Z8-1m; Thu, 06 Jul 2023 15:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559919.875359; Thu, 06 Jul 2023 15:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHR8k-0004Vn-Uo; Thu, 06 Jul 2023 15:43:30 +0000
Received: by outflank-mailman (input) for mailman id 559919;
 Thu, 06 Jul 2023 15:43:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OuuY=CY=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qHR8k-0004Vh-6w
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 15:43:30 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d815800e-1c13-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 17:43:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 731E68285452;
 Thu,  6 Jul 2023 10:43:24 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id IYMxrxYsk_aE; Thu,  6 Jul 2023 10:43:23 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 845E08285514;
 Thu,  6 Jul 2023 10:43:23 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id F-Xbx5_Cs6bE; Thu,  6 Jul 2023 10:43:23 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 1A8928285452;
 Thu,  6 Jul 2023 10:43:23 -0500 (CDT)
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
X-Inumbo-ID: d815800e-1c13-11ee-8611-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 845E08285514
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1688658203; bh=Z/xe/+UZWeimo/sm92wEXj+a5NzsiDM7/3QqDelMVdc=;
	h=Message-ID:Date:MIME-Version:From:To;
	b=nhESvTEKiH/wm7PrTilxSFP6TlLzIA7EYkovXojTkPKXVjmqrh2n5EuU2BR8JrciX
	 p18eTIM3Elyb1OPb62I6PPbVdju0piWGogDR9jUcg2k8j2IOMKRTpR+ukz8m+m3mVL
	 BOwO/LtpUL+Kdlgu94wLPHCmlyV6w9hd70DPRHLo=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <0c0e7324-cb99-31af-34a2-94ba8d581a31@raptorengineering.com>
Date: Thu, 6 Jul 2023 10:43:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/3] xen/ppc: Set up a basic C environment
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
References: <cover.1687466822.git.sanastasio@raptorengineering.com>
 <1afe27097c5e1b55dcffa9464dc0cd0c1038a23e.1687466822.git.sanastasio@raptorengineering.com>
 <bfaba0e5-36e9-b201-30fd-b96add91cb1c@citrix.com>
 <5011cde3-b553-6a17-85aa-a30edf3102fd@raptorengineering.com>
In-Reply-To: <5011cde3-b553-6a17-85aa-a30edf3102fd@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/22/23 8:26 PM, Shawn Anastasio wrote:
> On 6/22/23 5:49 PM, Andrew Cooper wrote:
>> On 22/06/2023 9:57 pm, Shawn Anastasio wrote:
>>> Update ppc64/head.S to set up an initial boot stack, zero the .bss
>>> section, and jump to C.
>>>
>>> Also refactor the endian fixup trampoline into its own macro, since it
>>> will need to be used in multiple places, including every time we make a
>>> call into firmware (see next commit).
>>>
>>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>
>> Thankyou for making this change - it definitely simplifies things.
> 
> No problem.
> 
>> I've done a bit of reading around, and it's rather sad that things prior
>> to Power10 don't have PC-relative addressing.  So the LOAD_IMM64()'s do
>> look necessary for the stack and bss.  I guess that means we can't be
>> sensibly be position independent in head.S?
> 
> Prior to the introduction of pcrel loads/stores in P10, PIC is achieved
> using a Table of Contents (TOC) whose base address is kept in r2 and can
> be used as a relative base to address other symbols. I don't have -fPIC
> enabled in this series yet (it's in the series I was hoping to submit
> after this one), so for now I'm just loading the addresses as immediates
> directly.
> 
>> Also, why store 0 onto the stack ?
> 
> On the ELFv2 ABI which we're using here, sp+0 is reserved for the "back
> chain" pointer which is used to store the address of the caller's stack
> frame and is used to support backtraces.
> 
> At the top of the stack, we need to make sure the first back chain
> pointer is zero to ensure that anything walking the stack via these
> pointers eventually terminates.
> 
>>> +
>>> +    /* clear .bss */
>>> +    LOAD_IMM64(%r14, __bss_start)
>>> +    LOAD_IMM64(%r15, __bss_end)
>>> +1:
>>> +    std %r11, 0(%r14)
>>> +    addi %r14, %r14, 8
>>> +    cmpld %r14, %r15
>>> +    blt 1b
>>
>> This loop is correct, except for the corner case of this patch alone,
>> where the BSS is empty and this will write one word out-of-bounds.
>>
>> For RISC-V, we put a temporary "char bss_tmp;" in setup.c, and I suggest
>> you do the same here, deleting it at a later point when there's real
>> data in the bss.
> 
> Good catch. I actually introduce a .bss variable in patch 2 of this
> series, so perhaps it would make the most sense for me to move this loop
> to that patch?
> 
> Also it might make sense to have an assert in the linker script checking
> that sizeof(.bss) > 0, though past early bring-up an empty .bss is
> probably a pretty unlikely scenario...
> 
>>> +
>>> +    /* call the C entrypoint */
>>> +    LOAD_IMM64(%r12, start_xen)
>>> +    mtctr %r12
>>> +    bctrl
>>
>> Why is this a LOAD_IMM64(), and not just:
>>
>>     b start_xen
>>
>> ?  From the same reading around, PPC64 seems to have +/- 32M addressing
>> for branches, and the entire x86 hypervisor (.init included) is within 3M.
> 
> Good question. You're right that here it's entirely unnecessary. Once we
> enable -fPIC, though, the calling convention for functions changes a bit
> and necessitates that in certain scenarios r12 contains the entrypoint
> of the function being called.

Turns out I was actually wrong here -- changing the indirect load +
branch to a direct branch does actually break the code here, but for a
reason other than what I anticipated. Even with PIC disabled, r2 needs
to contain a valid TOC pointer. The function address doesn't need to be
contained in r12 to calculate it since it's an absolute address rather
than function-relative, but using a simple direct branch here causes the
linker to skip past the TOC calculation prologue in `start_xen` as an
optimization, since it assumes that r2 is already set up. Since we
haven't set up r2, though, this results in the program using a
garbage TOC pointer at run-time.

I'll just set up the TOC before making the call in `start` to fix this.

Thanks,
Shawn


