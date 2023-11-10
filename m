Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 554B37E7A6F
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 10:06:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629991.982606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1NT8-0002J8-L1; Fri, 10 Nov 2023 09:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629991.982606; Fri, 10 Nov 2023 09:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1NT8-0002Gw-Gx; Fri, 10 Nov 2023 09:06:26 +0000
Received: by outflank-mailman (input) for mailman id 629991;
 Fri, 10 Nov 2023 09:06:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r1NT6-0002Bc-OH
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 09:06:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r1NT0-00008n-99; Fri, 10 Nov 2023 09:06:18 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.18.68]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r1NT0-0003XY-1S; Fri, 10 Nov 2023 09:06:18 +0000
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
	bh=wcXnzfBPAMpHbeq7N/cs9o4/hYT3dG2zIckP3SWpz40=; b=pUYZIJjzPX3AeN0xOtKGHP9BrY
	upROH9Uzhsl9xSDCgzu0ZxcSBHF3wmaqA4Eja66UJ0BBrWNd6GTakoGEa05A9Lwbx9tXiedr7TqNp
	cfu2/RJUYmpXq1+Mvw3dzJXmS5AGSq0dh9uONZ7xyzGadPzdA0Fw3pxYCR8pDqx1g5vY=;
Message-ID: <cffef994-1cba-4ce2-acb5-96e0ddd61064@xen.org>
Date: Fri, 10 Nov 2023 09:06:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH][for-4.19] domain: add ASSERT to help static analysis
 tools
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <3f163bb58993410183229e72eb1f227057f9b1c7.1699034273.git.nicola.vetrini@bugseng.com>
 <d67ec7e2-a606-ed62-150f-08e3c1c9aabe@suse.com>
 <44df74cb532bfb9642b1c8752ee8c0d6@bugseng.com>
 <2c8c246d-caea-5c8b-4a2a-83248422c48d@suse.com>
 <b407f981-c58c-4272-bc7c-1470a87e2487@xen.org>
 <4b4583f5-4cdb-6be9-20eb-22466b6aef28@suse.com>
 <483f3b34-ebd4-4613-b083-596bebf5ac15@xen.org>
 <alpine.DEB.2.22.394.2311091614010.3478774@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2311091614010.3478774@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 10/11/2023 00:29, Stefano Stabellini wrote:
> On Thu, 9 Nov 2023, Julien Grall wrote:
>> On 09/11/2023 07:42, Jan Beulich wrote:
>>> On 08.11.2023 14:33, Julien Grall wrote:
>>>> Hi Jan,
>>>>
>>>> On 08/11/2023 11:19, Jan Beulich wrote:
>>>>> On 08.11.2023 12:03, Nicola Vetrini wrote:
>>>>>> On 2023-11-08 09:24, Jan Beulich wrote:
>>>>>>> On 03.11.2023 18:58, Nicola Vetrini wrote:
>>>>>>>> Static analysis tools may detect a possible null
>>>>>>>> pointer dereference at line 760 (the memcpy call)
>>>>>>>> of xen/common/domain.c. This ASSERT helps them in
>>>>>>>> detecting that such a condition is not possible
>>>>>>>> and also provides a basic sanity check.
>>>>>>>
>>>>>>> I disagree with this being a possible justification for adding such
>>>>>>> a
>>>>>>> redundant assertion. More detail is needed on what is actually
>>>>>>> (suspected to be) confusing the tool. Plus it also needs explaining
>>>>>>> why (a) adding such an assertion helps and (b) how that's going to
>>>>>>> cover release builds.
>>>>>>>
>>>>>>
>>>>>> How about:
>>>>>> "Static analysis tools may detect a possible null pointer dereference
>>>>>> at line 760 (config->handle) due to config possibly being NULL.
>>>>>>
>>>>>> However, given that all system domains, including IDLE, have a NULL
>>>>>> config and in the code path leading to the assertion only real domains
>>>>>> (which have a non-NULL config) can be present."
>>>>>>
>>>>>> On point b): this finding is a false positive, therefore even if the
>>>>>> ASSERT is
>>>>>> expanded to effectively a no-op, there is no inherent problem with
>>>>>> Xen's
>>>>>> code.
>>>>>> The context in which the patch was suggested [1] hinted at avoiding
>>>>>> inserting in
>>>>>> the codebase false positive comments.
>>>>>
>>>>> Which I largely agree with. What I don't agree with is adding an
>>>>> assertion which is only papering over the issue, and only in debug
>>>>> builds.
>>>>
>>>> I expect that the number of issues will increase a lot as soon as we
>>>> start to analyze production builds.
>>>>
>>>> I don't think it will be a solution to either replace all the ASSERT()
>>>> with runtime check in all configuration or even...
>>>>
>>>>> So perhaps instead we need a different way of tracking
>>>>> false positives (which need to be tied to specific checker versions
>>>>> anyway).
>>>>
>>>> ... documenting false positive.
>>>>
>>>> IMHO, the only viable option would be to have a configuration to keep
>>>> ASSERT in production build for scanning tools.
>>>
>>> But wouldn't that then likely mean scanning to be done on builds not also
>>> used in production? Would doing so even be permitted when certification
>>> is a requirement? Or do you expect such production builds to be used with
>>> the assertions left in place (increasing the risk of a crash; recall that
>>> assertions themselves may also be wrong, and hence one triggering in rare
>>> cases may not really be a reason to bring down the system)?
>>
>> I will leave Stefano/Nicola to answer from the certification perspective. But
>> I don't really see how we could get away unless we replace most of the
>> ASSERT() with proper runtime check (which may not be desirable for ASSERT()s
>> like this one).
> 
> For sure we don't want to replace ASSERTs with runtime checks.
> 
> Nicola, do we really need the ASSERT to be implemented as a check, or
> would the presence of the ASSERT alone suffice as a tag, the same way we
> would be using /* SAF-xx-safe */ or asmlinkage?
> 
> If we only need ASSERT as a deviation tag, then production builds vs.
> debug build doesn't matter.
> 
> If ECLAIR actually needs ASSERT to be implemented as a check, could we
> have a special #define to define ASSERT in a special way for static
> analysis tools in production builds? For instance:
> 
> #ifdef STATIC_ANALYSIS
> #define ASSERT(p) \
>      do { if ( unlikely(!(p)) ) printk("ASSERT triggered %s:%d", __file__,__LINE__); } while (0)
> #endif

Just to make 100% clear, you are saying that assessor will be happy if 
we analyze it with ASSERT enabled but in production we use it wout them 
enabled? The assumption here is that they should have *never* been 
triggered so they surely should not happen in production.

Cheers,

-- 
Julien Grall

