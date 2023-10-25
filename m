Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E20087D77FF
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 00:31:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623347.971136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvmOi-0003h1-3K; Wed, 25 Oct 2023 22:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623347.971136; Wed, 25 Oct 2023 22:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvmOi-0003fD-0X; Wed, 25 Oct 2023 22:30:44 +0000
Received: by outflank-mailman (input) for mailman id 623347;
 Wed, 25 Oct 2023 22:30:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nm7K=GH=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qvmOg-0003f6-Cs
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 22:30:42 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f0fefa5-7386-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 00:30:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 513EA82857E5;
 Wed, 25 Oct 2023 17:30:37 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id U7XeP55xmWDl; Wed, 25 Oct 2023 17:30:36 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 72DF08284F68;
 Wed, 25 Oct 2023 17:30:36 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id m-NCvOO2Qrb0; Wed, 25 Oct 2023 17:30:36 -0500 (CDT)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id A347182857E5;
 Wed, 25 Oct 2023 17:30:35 -0500 (CDT)
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
X-Inumbo-ID: 1f0fefa5-7386-11ee-98d5-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 72DF08284F68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1698273036; bh=bC/dn8WvQwDgpRL52f+0Qr8Ahh6DQqcAahSto6u2hWc=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=R2+hpp+8uAJZozUU8uq4qv5DkjRDdJzPO+1tl1AIR8D4DRcRlnmu/6pGab496qHNJ
	 nmqg/u+dg3+Nilfsw+/u1Vu+xo02yzSbUM44HWmNyd6z9QCP0fHRl+AfSYuFDhWjZf
	 JcYtA0q9Eh3eG6blzA1v7rbVIVh414+XeggwfF18=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <75b1ba67-0dbd-5551-5170-66a556e17bbb@raptorengineering.com>
Date: Wed, 25 Oct 2023 17:30:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/2] xen/ppc: Implement a basic exception handler
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1697220184.git.sanastasio@raptorengineering.com>
 <dfd134a6c59f329b62d2ecfaa37d74d70f8d4d90.1697220184.git.sanastasio@raptorengineering.com>
 <a5db276d-6bc0-1fe6-6cdd-7c097308fdce@suse.com>
 <4da4a57b-06ae-dd66-e8b5-a388f7e492b3@raptorengineering.com>
 <0990f0b3-ff8a-105c-5cb7-643f72ece945@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <0990f0b3-ff8a-105c-5cb7-643f72ece945@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/20/23 1:22 AM, Jan Beulich wrote:
> On 19.10.2023 22:02, Shawn Anastasio wrote:
>> On 10/18/23 10:43 AM, Jan Beulich wrote:
>>> On 13.10.2023 20:13, Shawn Anastasio wrote:
>>>> --- a/xen/arch/ppc/setup.c
>>>> +++ b/xen/arch/ppc/setup.c
>>>> @@ -11,6 +11,15 @@
>>>>  /* Xen stack for bringing up the first CPU. */
>>>>  unsigned char __initdata cpu0_boot_stack[STACK_SIZE] __aligned(STACK_SIZE);
>>>>
>>>> +void setup_exceptions(void)
>>>> +{
>>>> +    unsigned long lpcr;
>>>> +
>>>> +    /* Set appropriate interrupt location in LPCR */
>>>> +    lpcr = mfspr(SPRN_LPCR);
>>>> +    mtspr(SPRN_LPCR, lpcr | LPCR_AIL_3);
>>>> +}
>>>
>>> Please forgive my lack of PPC knowledge: There's no use of any address
>>> here afaict. Where's the link to (presumably) AIL_VECTOR_BASE? If that
>>> address is kind of magic, I'm then lacking a connection between
>>> XEN_VIRT_START and that constant. (If Xen needed moving around in
>>> address space, it would be nice if changing a single constant would
>>> suffice.)
>>>
>>
>> AIL_VECTOR_BASE is indeed a magic address defined by the ISA for AIL=3.
>> As for the second part of your question, I'm a bit confused as to what
>> you're asking. The ISRs are placed at a position relative to
>> the start of the .text.exceptions section (EXCEPTION_VECTORS_START), so
>> Xen can be arbitrarily shuffled around in address space as long as
>> EXCEPTION_VECTORS_START lies at or before AIL_VECTOR_BASE.
> 
> Well, AIL_VECTOR_BASE is #define-d to a plain constant, not derived
> from EXCEPTION_VECTORS_START. In turn EXCEPTION_VECTORS_START is
> #define-d to a plain constant in patch 1, not derived from
> XEN_VIRT_START. Therefore moving Xen around would require to change
> (at least) 3 #define-s afaict.
>

AIL_VECTOR_BASE needs to be a plain constant since it's fixed by the
ISA. EXCEPTION_VECTORS_START could be defined in terms of XEN_VIRT_START
I suppose, but that would require introducing another plain constant for
representing the offset of EXCEPTION_VECTORS_START from XEN_VIRT_START.

I think the current approach is reasonable, especially since patch 1
introduces a linker assertion that ensures that EXCEPTION_VECTORS_START
matches the actual location of _stext_exceptions, so if one was to
change Xen's address and forgot to change the #define they'd get a
build error.

If you would prefer this to be handled in a different way though, I'm
not opposed.

> Jan

Thanks,
Shawn

