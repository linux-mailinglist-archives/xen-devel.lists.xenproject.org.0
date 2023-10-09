Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 952B37BD493
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 09:45:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614207.955181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpkwp-0008FB-AR; Mon, 09 Oct 2023 07:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614207.955181; Mon, 09 Oct 2023 07:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpkwp-0008D0-7l; Mon, 09 Oct 2023 07:45:03 +0000
Received: by outflank-mailman (input) for mailman id 614207;
 Mon, 09 Oct 2023 07:45:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o9Np=FX=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qpkwo-0008Cs-78
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 07:45:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfc60f07-6677-11ee-9b0d-b553b5be7939;
 Mon, 09 Oct 2023 09:45:00 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 993374EE073F;
 Mon,  9 Oct 2023 09:44:59 +0200 (CEST)
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
X-Inumbo-ID: bfc60f07-6677-11ee-9b0d-b553b5be7939
MIME-Version: 1.0
Date: Mon, 09 Oct 2023 09:44:59 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, Paul Durrant <paul@xen.org>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 8/9] xen/types: address Rule 10.1 for
 DECLARE_BITMAP use
In-Reply-To: <354c6138-509e-4106-9a27-3c75c85b85e5@xen.org>
References: <cover.1696514677.git.nicola.vetrini@bugseng.com>
 <9642dcb4ab51ec9eaeedf16056fbcd946a3efbea.1696514677.git.nicola.vetrini@bugseng.com>
 <80101145-1958-457a-8c80-cae816ae74aa@xen.org>
 <4b144869407871011c538af48b311c31@bugseng.com>
 <354c6138-509e-4106-9a27-3c75c85b85e5@xen.org>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <f8ce739932699bb44900570c262acbc8@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 06/10/2023 16:47, Julien Grall wrote:
> Hi Nicola,
> 
> On 06/10/2023 11:10, Nicola Vetrini wrote:
>> On 06/10/2023 11:34, Julien Grall wrote:
>>> Hi Nicola,
>>> 
>>> On 06/10/2023 09:26, Nicola Vetrini wrote:
>>>> Given its use in the declaration
>>>> 'DECLARE_BITMAP(features, IOMMU_FEAT_count)' the argument
>>>> 'bits' has essential type 'enum iommu_feature', which is not
>>>> allowed by the Rule as an operand to the addition operator
>>>> in macro 'BITS_TO_LONGS'.
>>>> 
>>>> A comment in BITS_TO_LONGS is added to make it clear that
>>>> values passed are meant to be positive.
>>> 
>>> I am confused. If the value is meant to be positive. Then...
>>> 
>>>> 
>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>> ---
>>>>   xen/include/xen/iommu.h | 2 +-
>>>>   xen/include/xen/types.h | 1 +
>>>>   2 files changed, 2 insertions(+), 1 deletion(-)
>>>> 
>>>> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
>>>> index 0e747b0bbc1c..34aa0b9b5b81 100644
>>>> --- a/xen/include/xen/iommu.h
>>>> +++ b/xen/include/xen/iommu.h
>>>> @@ -360,7 +360,7 @@ struct domain_iommu {
>>>>   #endif
>>>>         /* Features supported by the IOMMU */
>>>> -    DECLARE_BITMAP(features, IOMMU_FEAT_count);
>>>> +    DECLARE_BITMAP(features, (int)IOMMU_FEAT_count);
>>> 
>>> ... why do we cast to (int) rather than (unsigned int)? Also, I think
>>> this cast deserve a comment on top because this is not a very obvious
>>> one.
>>> 
>>>>         /* Does the guest share HAP mapping with the IOMMU? */
>>>>       bool hap_pt_share;
>>>> diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
>>>> index aea259db1ef2..936e83d333a0 100644
>>>> --- a/xen/include/xen/types.h
>>>> +++ b/xen/include/xen/types.h
>>>> @@ -22,6 +22,7 @@ typedef signed long ssize_t;
>>>>     typedef __PTRDIFF_TYPE__ ptrdiff_t;
>>>>   +/* Users of this macro are expected to pass a positive value */
>>>>   #define BITS_TO_LONGS(bits) \
>>>>       (((bits)+BITS_PER_LONG-1)/BITS_PER_LONG)
>>>>   #define DECLARE_BITMAP(name,bits) \
>>> 
>>> Cheers,
>> 
>> See [1] for the reason why I did so. I should have mentioned that in 
>> the commit notes, sorry.
>> In short, making BITS_TO_LONGS essentially unsigned would cause a 
>> cascade of build errors and
>> possibly other essential type violations.
> Can you share some of the errors?
> 

I don't have that build log at hand, but you can reproduce them by 
defining

#define BYTES_PER_LONG (_AC(1,U) << LONG_BYTEORDER)
#define BITS_PER_LONG (BYTES_PER_LONG << 3)

#define BITS_TO_LONGS(bits) \
   (((bits)+BITS_PER_LONG-1U)/BITS_PER_LONG)

and then fiddle a bit with the signedness of the constants in
xen/arch/x86/include/asm/page-bits.h.

They are essentially pointer comparison errors in the instances of 'min' 
and 'max'
that involve those macros or macros derived from those, which make the 
build fail because
they (rightfully) trigger a warning from gcc.

>> If this is to be fixed that way, the effort required
>> is far greater. Either way, a comment on top of can be added, along 
>> the lines of:
>> 
>> Leaving this as an enum would violate MISRA C:2012 Rule 10.1
> 
> I read this as you are simply trying to silence your tool. I think
> this the wrong approach as you are now making the code confusing for
> the reader (you pass a signed int to a function that is supposed to
> take a positive number).
> 
> I appreciate that this will result to more violations at the
> beginning. But the whole point of MISRA is to make the code better.
> 
> If this is too complex to solve now, then a possible option is to
> deviate for the time being.
> 
> Cheers,
> 

You have a point in that is sort of hides a deeper issue that is 
constituted by the
signedness of the macro, but I'd suggest adding to this patch a comment 
explaining what
needs to be done, rather than a deviation comment that hides the 
violations. The reason
is that in the former case, if you put an unsigned argument too big to 
fit in an integer
it will generate a new report, while if a negative argument is used, 
there is a warning
comment on the macro definition (not an ideal countermeasure, though).

>> 
>> [1] 
>> https://lore.kernel.org/xen-devel/6495ba58bda01eae1f4baa46096424eb@bugseng.com/
>> 

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

