Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 720DB651CA3
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 09:52:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466656.725661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YMU-0001WI-3U; Tue, 20 Dec 2022 08:52:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466656.725661; Tue, 20 Dec 2022 08:52:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YMT-0001UH-Vw; Tue, 20 Dec 2022 08:52:33 +0000
Received: by outflank-mailman (input) for mailman id 466656;
 Tue, 20 Dec 2022 08:52:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p7YMT-0001U5-1O
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 08:52:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7YMQ-0002s4-29; Tue, 20 Dec 2022 08:52:30 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.6.189]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7YMP-0006TH-T2; Tue, 20 Dec 2022 08:52:30 +0000
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
	bh=83WCZCBN2RZa3OayZ9pbSFK4gncuCswxnB2PgrqopQc=; b=ZR58lbW77M9ci3zoOKKmOkkKHS
	EdlAkYmbHxzFiB5untzxqC9TdiQJ+pMR/4nfQgZK4hnFnq4XnxOkEBR29ScZHvEBNV7elEsdoMSEE
	RQpdiE+XRdMurRtwwlTNf51oN8xtubN3Igd4oy717RI3S7GLKvbgmNqctdSsolnwG2Z4=;
Message-ID: <63836495-0942-f00f-5381-cd3cba46c4b3@xen.org>
Date: Tue, 20 Dec 2022 08:52:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH RFC 10/10] common: convert vCPU info area registration
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <f1745e62-8a46-e9af-6a79-592a5402a5f4@suse.com>
 <92e35f8b-72d9-e55f-9218-3f21742c14c6@xen.org>
 <e87503e1-992f-28d6-cfa5-e0882541a12b@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e87503e1-992f-28d6-cfa5-e0882541a12b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 19/12/2022 15:01, Jan Beulich wrote:
> On 17.12.2022 16:53, Julien Grall wrote:
>> On 19/10/2022 08:45, Jan Beulich wrote:
>>> Switch to using map_guest_area(). Noteworthy differences from
>>> map_vcpu_info():
>>> - remote vCPU-s are paused rather than checked for being down (which in
>>>     principle can change right after the check),
>>> - the domain lock is taken for a much smaller region,
>>> - areas could now be registered more than once, if we want this,
>>> - as a corner case registering the area at GFN 0 offset 0 is no longer
>>>     possible (this is considered an invalid de-registration request).
>>>
>>> Note that this eliminates a bug in copy_vcpu_settings(): The function
>>> did allocate a new page regardless of the GFN already having a mapping,
>>> thus in particular breaking the case of two vCPU-s having their info
>>> areas on the same page.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> RFC: While the "no re-registration" check is retained, it is now racy.
>>>        If we really think it needs retaining _and_ properly enforcing,
>>>        then locking will be needed, but I don't think we can hold the
>>>        domain lock around a call to map_guest_area(), first and foremost
>>>        because of its use of vcpu_pause().
>>
>> function like evtchn_2l_unmask() may access vcpu_info that is not the
>> current one.
>>
>> So I believe the check needs to be reatined and properly enforced.
>> Otherwise, the old structure may still be used for a short time even if
>> it has been freed.
> 
> Good point, I'll try to come up with something suitable.
> 
>>> RFC: Is the GFN 0 offset 0 behavioral change deemed acceptable?
>>
>> I would say n  (See the previous discussion for more details).
> 
> Of course - with 0 going to be replaced in map_guest_area(), the check
> there needs to be adjusted accordingly. And ~0 was already invalid to
> pass in here, due to the alignment check.
> 
>>> RFC: To have just a single instance of casts to vcpu_info_t *,
>>>        introducing a macro (or inline function if header dependencies
>>>        permit) might be nice. However, the only sensible identifier for it
>>>        would imo be vcpu_info(). Yet we already have a macro of that name.
>>>        With some trickery it might be possible to overload the macro
>>>        (making the "field" argument optional), but this may not be
>>>        desirable for other reasons (it could e.g. be deemed confusing).
>>
>> You might be able to reduce the number of cast by using local variables.
>>
>> But it is not entirely clear why we can't use the existing vcpu_info()
>> in many of the cases. For instance...
>>
>>
>>>
>>> --- a/xen/arch/x86/include/asm/shared.h
>>> +++ b/xen/arch/x86/include/asm/shared.h
>>> @@ -27,16 +27,16 @@ static inline void arch_set_##field(stru
>>>    static inline type arch_get_##field(const struct vcpu *v)       \
>>>    {                                                               \
>>>        return !has_32bit_shinfo(v->domain) ?                       \
>>> -           v->vcpu_info->native.arch.field :                    \
>>> -           v->vcpu_info->compat.arch.field;                     \
>>> +           ((const vcpu_info_t *)v->vcpu_info_area.map)->native.arch.field : \
>>> +           ((const vcpu_info_t *)v->vcpu_info_area.map)->compat.arch.field;  \
>>
>> ... here.
> 
> vcpu_info() has a property which gets in the way of using the macro
> here. Since __vcpu_info() wants to return something which can also
> be used as lvalue, the 2nd and 3rd operands of the conditional
> operator need to resolve to the same pointer type. Hence the smaller
> (compat) type is the only one which is safe to use. See the comment
> next to __shared_info()'s definition (which is the one __vcpu_info()'s
> refers to).

Thanks for the pointer! I hadn't noticed the subtlety. Then, the 
open-cast (even if I dislike them) is probably the way go for now.

As I mentioned above, it would nice if they can be reduced by using 
local variables (this will also return the length of the line).

Cheers,

-- 
Julien Grall

