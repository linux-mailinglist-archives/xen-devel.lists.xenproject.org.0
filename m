Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C09785DDB
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 18:49:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589454.921366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYr26-0004Yh-L1; Wed, 23 Aug 2023 16:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589454.921366; Wed, 23 Aug 2023 16:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYr26-0004Vx-Hs; Wed, 23 Aug 2023 16:48:38 +0000
Received: by outflank-mailman (input) for mailman id 589454;
 Wed, 23 Aug 2023 16:48:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYr26-0004Vr-0R
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 16:48:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYr25-00066p-0F; Wed, 23 Aug 2023 16:48:37 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.29.180]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYr24-0000jd-O6; Wed, 23 Aug 2023 16:48:36 +0000
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
	bh=GHF1s+OSwRlPm6iSSAG4oUQvZpTWp8W+BXKPbrCwAN0=; b=0JMhTS2EgqRO53i1fNCYBWpzva
	R1DNcAPhynj4cEvwDOzV2/Tr8W15XMbKD721qR371SF19pnPzPwNUC+jEKUw/5a6Fzcc19SkhkfqN
	NyIwNU3hwBk608u79BIuzLO1sURnLAsmzyV5WzZe6n50eiBfCX7eHkvg4EZJBBRB8RMU=;
Message-ID: <59fad669-afc2-45e2-b647-8a0878774ba8@xen.org>
Date: Wed, 23 Aug 2023 17:48:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] arm64/vfp: address MISRA C:2012 Dir 4.3
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <998ecebdda92f1704fa35e8692b1f7e37b674d16.1692800477.git.nicola.vetrini@bugseng.com>
 <a0a4a13a-3ada-4586-81cf-86a9e583fc60@xen.org>
 <3b4d895999ad4fc51f280c8f7e854cab@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3b4d895999ad4fc51f280c8f7e854cab@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicola,

On 23/08/2023 17:09, Nicola Vetrini wrote:
> On 23/08/2023 16:59, Julien Grall wrote:
>> Hi,
>>
>> On 23/08/2023 15:27, Nicola Vetrini wrote:
>>> Directive 4.3 prescribes the following:
>>> "Assembly language shall be encapsulated and isolated",
>>> on the grounds of improved readability and ease of maintenance.
>>> The Directive is violated in this case by asm code in between C code.
>>>
>>> A macro is the chosen encapsulation mechanism.
>>
>> I would rather prefer if we use a static inline.
> 
> Just to prevent an possible back and forth on a similar patch:
> is it ok to adopt the same approach with the inline asm in
> xen/arch/arm/arm64/lib/bitops.c in the definition of the macros
> 'bitop' and 'testop'?

So, in the VFP I agree that moving the assembly part outside of 
vfp_*_state() makes sense even without MISRA. But I don't agree with 
moving the assembly code out as the C function is tightly coupled with 
the assembly code.

So this would please MISRA but IHMO would make the code more difficult 
to understand. So I think we should deviate for the bitops.

Bertrand, Stefano, what do you think?

Cheers,

-- 
Julien Grall

