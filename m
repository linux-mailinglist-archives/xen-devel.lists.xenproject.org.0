Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DC97BB7B5
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 14:33:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613564.954157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qok1L-0007z5-0w; Fri, 06 Oct 2023 12:33:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613564.954157; Fri, 06 Oct 2023 12:33:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qok1K-0007wQ-UG; Fri, 06 Oct 2023 12:33:30 +0000
Received: by outflank-mailman (input) for mailman id 613564;
 Fri, 06 Oct 2023 12:33:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qok1K-0007wI-A8
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 12:33:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qok1J-00066C-Mu; Fri, 06 Oct 2023 12:33:29 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qok1J-0003sw-G6; Fri, 06 Oct 2023 12:33:29 +0000
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
	bh=kuxg9iV9fZrTqw84KJg+Ggv2pFTJYpjIJ8QW1C3CPQc=; b=h8+6OzgW75BNgSxpbS/76rQbnY
	/I+GrwAENhPEPQPEa54mLqdo1hZDUriTOona24DHTUVOgZNDMRbnORgFihqADcJBqX2sEX8EWnOJx
	a8AM/z3OgLEXpsQm6ItBfBzoYVMwQ+ns3xPE/bsrfcamdREA6pXXaDsbmtx2T6lR0nfE=;
Message-ID: <c97bd628-1be1-46bf-a506-6ffb90cf801e@xen.org>
Date: Fri, 6 Oct 2023 13:33:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH][for-4.19 1/2] xen: introduce a deviation for Rule
 11.9
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1696494834.git.nicola.vetrini@bugseng.com>
 <98bc1d90b93856ed7516a19114facf6528120248.1696494834.git.nicola.vetrini@bugseng.com>
 <605f8045-754d-4d3c-b1b3-3bb34112bfc8@xen.org>
 <2aafb9710b4754e8d57acc1f769693b4@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2aafb9710b4754e8d57acc1f769693b4@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/10/2023 10:58, Nicola Vetrini wrote:
> On 06/10/2023 11:27, Julien Grall wrote:
>> Hi,
>>
>> On 05/10/2023 09:45, Nicola Vetrini wrote:
>>> The constant 0 is used instead of NULL in '__ACCESS_ONCE' as a
>>> compile-time check to detect non-scalar types; its usage for this
>>> purpose is documented in rules.rst as an exception.
>> Documenting ACCESS_ONCE() in rules.rst seems a bit odd. I am guessing
>> that other analysis tool may point out the same error and therefore it
>> would seem more appropriate to use a deviation.
>>
>> This would also avoid having a specific rule in the Eclair
>> configuration for __ACCESS_ONCE().
>>
> 
> I figured a single accepted use would benefit from an explicit exclusion.
> I can rework it to use an in-code comment to deviate, in whatever form 
> that comment may be
> (still with some bits of ECLAIR-specific configuration anyway, as 
> discussed for R2.1).

I think it would be preferrable to have a deviation in the code. This 
would be helpful for other analysis tools.

> 
>>>
>>> Furthermore, the 'access_field' and 'typeof_field' macros are
>>> introduced as a general way to deal with accesses to structs
>>> without declaring a struct variable.
>>>
>>> Cleanup of spurious MISRA deviations.
>>
>> Please don't do that. This is making the review of the patches a lot
>> more complicated because there are unrelated changes (see [1]).
>>
>> We often allow simple clean-up if they are in the context. But this is
>> not the case here.
>>
> 
> Understood. There will be a separate MISRA deviations cleanup/update 
> patch anyway,
> so these can be included there.

Sounds good to me. Thanks!

Cheers,

-- 
Julien Grall

