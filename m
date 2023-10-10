Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 810947BF912
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 12:54:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614671.955899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqAMy-0001RM-Po; Tue, 10 Oct 2023 10:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614671.955899; Tue, 10 Oct 2023 10:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqAMy-0001OV-Mk; Tue, 10 Oct 2023 10:53:44 +0000
Received: by outflank-mailman (input) for mailman id 614671;
 Tue, 10 Oct 2023 10:53:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qqAMx-0001OP-Mg
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 10:53:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qqAMw-00063s-NT; Tue, 10 Oct 2023 10:53:42 +0000
Received: from [15.248.2.156] (helo=[10.24.67.48])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qqAMw-0007LK-H9; Tue, 10 Oct 2023 10:53:42 +0000
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
	bh=ixf8k1756FNFD8mFB8+qcMRr7YVyy7RBToj5fk7EBFc=; b=nKD44a1Kf6XzeZxfDqeXt14cuR
	oZCHNdc7aerVlgbNgKu/IpeskEqSvAkeVWjGo2i1ZKyWmn65o2ulHqsCoaIqKqnXIz7xSr7kYpHAQ
	poLVr36mOjhfP2i7/IkE+jADrzQQxTvLMhlqM0wFUS+0gbGXDVX20mBpPvB7KBkVH+74=;
Message-ID: <f9a24504-97e7-4a2e-8601-8e4672b45f88@xen.org>
Date: Tue, 10 Oct 2023 11:53:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH][for-4.19 8/9] xen/types: address Rule 10.1 for
 DECLARE_BITMAP use
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Paul Durrant <paul@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>
References: <cover.1696514677.git.nicola.vetrini@bugseng.com>
 <9642dcb4ab51ec9eaeedf16056fbcd946a3efbea.1696514677.git.nicola.vetrini@bugseng.com>
 <80101145-1958-457a-8c80-cae816ae74aa@xen.org>
 <4b144869407871011c538af48b311c31@bugseng.com>
 <354c6138-509e-4106-9a27-3c75c85b85e5@xen.org>
 <alpine.DEB.2.22.394.2310061746190.3431292@ubuntu-linux-20-04-desktop>
 <d90524b8-70ee-457e-8d6a-9e69f135b81d@xen.org>
 <alpine.DEB.2.22.394.2310091803060.3431292@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2310091803060.3431292@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/10/2023 02:09, Stefano Stabellini wrote:
> On Mon, 9 Oct 2023, Julien Grall wrote:
>> On 07/10/2023 02:04, Stefano Stabellini wrote:
>>> On Fri, 6 Oct 2023, Julien Grall wrote:
>>>> Hi Nicola,
>>>>
>>>> On 06/10/2023 11:10, Nicola Vetrini wrote:
>>>>> On 06/10/2023 11:34, Julien Grall wrote:
>>>>>> Hi Nicola,
>>>>>>
>>>>>> On 06/10/2023 09:26, Nicola Vetrini wrote:
>>>>>>> Given its use in the declaration
>>>>>>> 'DECLARE_BITMAP(features, IOMMU_FEAT_count)' the argument
>>>>>>> 'bits' has essential type 'enum iommu_feature', which is not
>>>>>>> allowed by the Rule as an operand to the addition operator
>>>>>>> in macro 'BITS_TO_LONGS'.
>>>>>>>
>>>>>>> A comment in BITS_TO_LONGS is added to make it clear that
>>>>>>> values passed are meant to be positive.
>>>>>>
>>>>>> I am confused. If the value is meant to be positive. Then...
>>>>>>
>>>>>>>
>>>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>>>> ---
>>>>>>>     xen/include/xen/iommu.h | 2 +-
>>>>>>>     xen/include/xen/types.h | 1 +
>>>>>>>     2 files changed, 2 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
>>>>>>> index 0e747b0bbc1c..34aa0b9b5b81 100644
>>>>>>> --- a/xen/include/xen/iommu.h
>>>>>>> +++ b/xen/include/xen/iommu.h
>>>>>>> @@ -360,7 +360,7 @@ struct domain_iommu {
>>>>>>>     #endif
>>>>>>>           /* Features supported by the IOMMU */
>>>>>>> -    DECLARE_BITMAP(features, IOMMU_FEAT_count);
>>>>>>> +    DECLARE_BITMAP(features, (int)IOMMU_FEAT_count);
>>>>>>
>>>>>> ... why do we cast to (int) rather than (unsigned int)? Also, I think
>>>>>> this cast deserve a comment on top because this is not a very obvious
>>>>>> one.
>>>>>>
>>>>>>>           /* Does the guest share HAP mapping with the IOMMU? */
>>>>>>>         bool hap_pt_share;
>>>>>>> diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
>>>>>>> index aea259db1ef2..936e83d333a0 100644
>>>>>>> --- a/xen/include/xen/types.h
>>>>>>> +++ b/xen/include/xen/types.h
>>>>>>> @@ -22,6 +22,7 @@ typedef signed long ssize_t;
>>>>>>>       typedef __PTRDIFF_TYPE__ ptrdiff_t;
>>>>>>>     +/* Users of this macro are expected to pass a positive value */
>>>>>>>     #define BITS_TO_LONGS(bits) \
>>>>>>>         (((bits)+BITS_PER_LONG-1)/BITS_PER_LONG)
>>>>>>>     #define DECLARE_BITMAP(name,bits) \
>>>>>>
>>>>>> Cheers,
>>>>>
>>>>> See [1] for the reason why I did so. I should have mentioned that in the
>>>>> commit notes, sorry.
>>>>> In short, making BITS_TO_LONGS essentially unsigned would cause a
>>>>> cascade of
>>>>> build errors and
>>>>> possibly other essential type violations.
>>>> Can you share some of the errors?
>>>>
>>>>> If this is to be fixed that way, the effort required
>>>>> is far greater. Either way, a comment on top of can be added, along the
>>>>> lines of:
>>>>>
>>>>> Leaving this as an enum would violate MISRA C:2012 Rule 10.1
>>>>
>>>> I read this as you are simply trying to silence your tool. I think this
>>>> the
>>>> wrong approach as you are now making the code confusing for the reader
>>>> (you
>>>> pass a signed int to a function that is supposed to take a positive
>>>> number).
>>>>
>>>> I appreciate that this will result to more violations at the beginning.
>>>> But
>>>> the whole point of MISRA is to make the code better.
>>>>
>>>> If this is too complex to solve now, then a possible option is to deviate
>>>> for
>>>> the time being.
>>>
>>> I agree on everything Julien's wrote and I was about to suggest to use a
>>> SAF comment to suppress the warning because it is clearer than a int
>>> cast.
>>>
>>> But then I realized that even if BITS_TO_LONGS was fixed, wouldn't still
>>> we have a problem because IOMMU_FEAT_count is an enum?
>>>
>>> Is it the case that IOMMU_FEAT_count would have to be cast regardless,
>>> either to int or unsigned int or whatever to be used in DECLARE_BITMAP?
>>>
>>>
>>> So we have 2 problems here: one problem is DECLARE_BITMAP taking int
>>> instead of unsigned int, and another problem is IOMMU_FEAT_count being
>>> an enum.
>>>
>>> If I got it right, then I would go with the cast to int (like done in
>>> this patch) with a decent comment on top of it.
>>
>> I might be missing something here. But why should we use cast rather than /*
>> SAF-X */ just above? I would have expected we wanted to highlight the
>> violation rather than hiding it.
> 
> My understanding is that the cast is required when converting an enum
> type to an integer type and vice versa. The idea is that we shouldn't do
> implicit conversions as they are error prone, only explicit conversions
> are allowed between enum and integers.

We have a lot of places in Xen using implicit conversion from enum to 
integer (for instance in the P2M code for p2m_type_t). Does ECLAIR 
report all of them? If not, then why?

> 
> So we need either (int) or (unsigned int). The question is which one
> between the two, and theoretically (unsigned int) is better but due to
> the reasons above (int) is the simplest choice.
> 
> Yes, instead of the cast we can also add a SAF-x comment, which refers
> to a deviation that says something along the lines "we could fix this
> with a cast but we prefer a deviation because it makes the code easier
> to read".
> 
> In general my personal preference would be to use a cast, because we
> shouldn't implicitly convert enums to integers.

See above. I'd like to understand whether we are going to sprinkle the 
code with cast. If so, I am afraid I am against this solution.

Cheers,

-- 
Julien Grall

