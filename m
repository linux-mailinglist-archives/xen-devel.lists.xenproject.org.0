Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E31776FED7
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 12:48:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577096.903972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRsLy-00050F-77; Fri, 04 Aug 2023 10:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577096.903972; Fri, 04 Aug 2023 10:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRsLy-0004xg-43; Fri, 04 Aug 2023 10:48:18 +0000
Received: by outflank-mailman (input) for mailman id 577096;
 Fri, 04 Aug 2023 10:48:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qRsLx-0004xa-AJ
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 10:48:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRsLw-0008F4-L4; Fri, 04 Aug 2023 10:48:16 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228] helo=[10.95.104.46])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRsLw-0000jf-Ed; Fri, 04 Aug 2023 10:48:16 +0000
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
	bh=54NkfgdlCAe4IBkP3+xatAn/Ck3HRr4zZ5qA60Udh9c=; b=aogGuu+z39Rw/JW857l4zF+05z
	R7flRj2VKYK10gLbb2WeHzN9rQ4V2bRkAB2CJumB4YHLs0GQbSqIkOAD7Kd1bQ1Ll1EateDwgV7gj
	UXs0h/bOwVSnZ2gMqXxiAKnpmgtipjFTWvHdVGgbBzab/gEHF2p2VkCvb6jNn9EHA1nY=;
Message-ID: <58d49a0e-d6e0-43fa-9fa6-22965862a2e2@xen.org>
Date: Fri, 4 Aug 2023 11:48:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] x86/mm: address violations of MISRA C:2012 Rules
 8.2 and 8.3
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
References: <c690d653a6fc2dd9cd0d1aa3b204d6ac7fb12ed6.1691141621.git.federico.serafini@bugseng.com>
 <c74bd41e-20e3-2616-f077-f213bf115dbc@citrix.com>
 <3c642d70-1b1a-5b09-fb34-127172f96118@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3c642d70-1b1a-5b09-fb34-127172f96118@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Federico,

On 04/08/2023 11:29, Federico Serafini wrote:
> On 04/08/23 11:47, Andrew Cooper wrote:
>> On 04/08/2023 10:38 am, Federico Serafini wrote:
>>> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
>>> index be2b10a391..e1d9b94007 100644
>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -5591,7 +5591,7 @@ int __init populate_pt_range(unsigned long 
>>> virt, unsigned long nr_mfns)
>>>    *
>>>    * It is an error to call with present flags over an unpopulated 
>>> range.
>>>    */
>>> -int modify_xen_mappings(unsigned long s, unsigned long e, unsigned 
>>> int nf)
>>> +int modify_xen_mappings(unsigned long s, unsigned long e, unsigned 
>>> int flags)
>>
>> I think both of these examples want to stay as nf (new flags).  Flags on
>> its own is ambiguous in context, and nf is a common shorthand in our
>> pagetable code.

I guess you mean x86 code? I agree that 'flags' is ambiguous but...

>>
>> And it will make the patch rather shorter.
>>
>> ~Andrew
> 
> The arm code has its own implementation of modify_xen_mappings()
> which uses `flags`.
> I put Stefano and Julien in CC, so that if everyone likes `nf` I can 
> propagate the change.

... I would not say I like the name 'nf'. I would prefer 'new_flags'.

Anyway, unlike arm, the x86 version of modify_xen_mappings() is quite 
large. So I would be OK to switch the Arm code to use 'nf' (only in 
modify_xen_mappings()) for the sake of avoid too much code churn.

Cheers,

-- 
Julien Grall

