Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9BC478854
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 11:04:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248505.428643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myA6P-0008TQ-OZ; Fri, 17 Dec 2021 10:04:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248505.428643; Fri, 17 Dec 2021 10:04:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myA6P-0008RN-LP; Fri, 17 Dec 2021 10:04:37 +0000
Received: by outflank-mailman (input) for mailman id 248505;
 Fri, 17 Dec 2021 10:04:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1myA6O-0008RH-2F
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 10:04:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1myA6N-00008A-IH; Fri, 17 Dec 2021 10:04:35 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.25.72]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1myA6N-000653-BV; Fri, 17 Dec 2021 10:04:35 +0000
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
	bh=ltUrKqxg7Rrs5B08vwtBxjk5+qE/OzTO6BfBtdfTBxA=; b=hO0jFN3uMUtBIG3NxqwEcDajxY
	b/DmDzsYEikvHoFQtchGJzRy/fG5kACbuYU2gMEBM7DkNmV8j/o3hLYuGecHCU6CsHia8DtQ2uqfO
	SCAFDYL3FXo976CGzspgfIL4WtjmREIZEt7V51WhclV8UXm70j0CDwM6ZexM5tBAKpy4=;
Message-ID: <4345eaf9-d7fd-7ec8-fc98-33fa8a6b07b5@xen.org>
Date: Fri, 17 Dec 2021 10:04:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v3 02/13] xen: harmonize return types of hypercall
 handlers
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>
References: <20211208155606.20029-1-jgross@suse.com>
 <20211208155606.20029-3-jgross@suse.com>
 <7dd419c1-9ad0-798e-317b-71c8e613ff3e@xen.org>
 <4e9947b6-08b4-4ac6-9cfe-538c3b34175e@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4e9947b6-08b4-4ac6-9cfe-538c3b34175e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 15/12/2021 07:03, Juergen Gross wrote:
> On 14.12.21 18:36, Julien Grall wrote:
>> Hi,
>>
>> On 08/12/2021 15:55, Juergen Gross wrote:
>>> Today most hypercall handlers have a return type of long, while the
>>> compat ones return an int. There are a few exceptions from that rule,
>>> however.
>>
>> So on Arm64, I don't think you can make use of the full 64-bit because 
>> a 32-bit domain would not be able to see the top 32-bit.
>>
>> In fact, this could potentially cause us some trouble (see [1]) in Xen.
>> So it feels like the hypercalls should always return a 32-bit signed 
>> value on Arm.
> 
> This would break hypercalls like XENMEM_maximum_ram_page which are able
> to return larger values, right?
> 
>> The other advantage is it would be clear that the top 32-bit are not 
>> usuable. Stefano, what do you think?
> 
> Wouldn't it make more sense to check the return value to be a sign
> extended 32-bit value for 32-bit guests in do_trap_hypercall() instead?
> 
> The question is what to return if this is not the case. -EDOM?

It looks like there was a lot of discussion afterwards. I will read 
everything and answer on the last part of the thread :).

> 
>>
>>>
>>> Get rid of the exceptions by letting compat handlers always return int
>>> and others always return long.
>>>
>>> For the compat hvm case use eax instead of rax for the stored result as
>>> it should have been from the beginning.
>>>
>>> Additionally move some prototypes to include/asm-x86/hypercall.h
>>> as they are x86 specific. Move the do_physdev_op() prototype from both
>>> architecture dependant headers to the common one. Move the
>>> compat_platform_op() prototype to the common header.
>>>
>>> Switch some non style compliant types (u32, s32, s64) to style compliant
>>> ones.
>>
>> TBH, I think this should have been split because the modifications are 
>> done on lines that are untouched.
>>
>> The extra patch would have made the review easier (even if this patch 
>> is still quite small).
> 
> I can split the patch if you want.

I have already reviewed this patch. So it is not going to help me :). 
However, I would appreciate if in the future the coding style changes 
are separated at least when they are not meant to be untouched.

Cheers,

-- 
Julien Grall

