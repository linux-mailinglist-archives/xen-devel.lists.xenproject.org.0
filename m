Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8778AD058
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 17:10:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710015.1109085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryvJg-0008Jt-FN; Mon, 22 Apr 2024 15:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710015.1109085; Mon, 22 Apr 2024 15:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryvJg-0008Hh-Ci; Mon, 22 Apr 2024 15:10:48 +0000
Received: by outflank-mailman (input) for mailman id 710015;
 Mon, 22 Apr 2024 15:10:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ryvJf-0008HZ-Bh
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 15:10:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ryvJd-0008HR-Df; Mon, 22 Apr 2024 15:10:45 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ryvJd-0005WB-8Y; Mon, 22 Apr 2024 15:10:45 +0000
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
	bh=lj9vyG1ap5RuAwEUNaYFKzJcwipzJ4AFEwnoVMl+I04=; b=0+bkxmnfotn8RZYQ15RzeCBsqf
	4p5zc3zM+2FZzX/kzZinV6chstTjSiY2uznOZI24ChvtyfhmXKiwteIs147euVBuagooesdQSIbLw
	oXgJ4wDUAdVOJh8MI9AeTVVfSxTl9WihWeAr5SA4eqXd7ZNyZ6kD9EywS0DESWoLgUyM=;
Message-ID: <29afd327-a66c-4b4e-b076-ee6ecb70807e@xen.org>
Date: Mon, 22 Apr 2024 16:10:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] public: xen: Define missing guest handle for int32_t
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20240417121442.56178-1-michal.orzel@amd.com>
 <be95f6be-0404-4c43-926f-d011782a02db@xen.org>
 <alpine.DEB.2.22.394.2404171148060.2257106@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2404171148060.2257106@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefano,

On 17/04/2024 19:49, Stefano Stabellini wrote:
> On Wed, 17 Apr 2024, Julien Grall wrote:
>> Hi Michal,
>>
>> On 17/04/2024 13:14, Michal Orzel wrote:
>>> Commit afab29d0882f ("public: s/int/int32_t") replaced int with int32_t
>>> in XEN_GUEST_HANDLE() in memory.h but there is no guest handle defined
>>> for it. This results in a build failure. Example on Arm:
>>>
>>> ./include/public/arch-arm.h:205:41: error: unknown type name
>>> ‘__guest_handle_64_int32_t’
>>>     205 | #define __XEN_GUEST_HANDLE(name)        __guest_handle_64_ ## name
>>>         |                                         ^~~~~~~~~~~~~~~~~~
>>> ./include/public/arch-arm.h:206:41: note: in expansion of macro
>>> ‘__XEN_GUEST_HANDLE’
>>>     206 | #define XEN_GUEST_HANDLE(name)          __XEN_GUEST_HANDLE(name)
>>>         |                                         ^~~~~~~~~~~~~~~~~~
>>> ./include/public/memory.h:277:5: note: in expansion of macro
>>> ‘XEN_GUEST_HANDLE’
>>>     277 |     XEN_GUEST_HANDLE(int32_t) errs;
>>>
>>> Fix it. Also, drop guest handle definition for int given no further use.
>>>
>>> Fixes: afab29d0882f ("public: s/int/int32_t")
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> 
>> So it turned out that I committed v1 from Stefano. I was meant to commit the
>> patch at all, but I think I started with a dirty staging :(. Sorry for that.
>>
>> I have reverted Stefano's commit for now so we can take the correct patch.
>>
>> Now, from my understanding, Andrew suggested on Matrix that this solution may
>> actually be a good way to handle GUEST_HANLDEs (they were removed in v2).
>> Maybe this can be folded in Stefano's patch?
> 
> v1 together with Michal's fix is correct. Also v2 alone is correct, or
> v2 with Michal's fix is also correct.

I am slightly confused, v2 + Michal's fix means that 
XEN_GUEST_HANDLE(int) is removed and we introduce XEN_GUEST_INT(int32_t) 
with no user. So wouldn't this break the build?

> 
> My preference is v2 with Michal's fix, they can be committed as separate
> patches. Also the others options are fine.

I am fine if you want to commit them separately. However, I am not sure 
your suggestion about using v2 + Michal's fix is actually correct.

Cheers,

-- 
Julien Grall

