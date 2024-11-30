Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B339DF237
	for <lists+xen-devel@lfdr.de>; Sat, 30 Nov 2024 18:16:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846194.1261401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tHR4V-0001yG-5n; Sat, 30 Nov 2024 17:15:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846194.1261401; Sat, 30 Nov 2024 17:15:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tHR4V-0001wC-2T; Sat, 30 Nov 2024 17:15:55 +0000
Received: by outflank-mailman (input) for mailman id 846194;
 Sat, 30 Nov 2024 17:15:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tHR4T-0001w6-Ec
 for xen-devel@lists.xenproject.org; Sat, 30 Nov 2024 17:15:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tHR4R-00DSUs-0P;
 Sat, 30 Nov 2024 17:15:51 +0000
Received: from [2a02:8012:3a1:0:d435:aa99:ecdf:cc2c]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tHR4R-005v0U-0V;
 Sat, 30 Nov 2024 17:15:51 +0000
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
	bh=wloi3SwMnImRS9WGoCbRDA5YpKNGOzYxXmM9SYbOphg=; b=7PiqsUxCblZf/zdUfaxe9vwome
	W/2l4f/ImJZ50ufaa/aUilT5MSta2J/IYoDLUj/JxIjYUiJZQicenewTIJLAAF9ZfPTMBimFqTK4I
	lcnzwdzVf+LG+UL/pzeBrhYu9rLCsJtbug421sCebwSY3QGrtRRlcaJ9iHKsvE4MP4a4=;
Message-ID: <8df584b8-fb23-4db4-af87-903fde91e42e@xen.org>
Date: Sat, 30 Nov 2024 17:15:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] build: arm64: provide -target and -march if using
 clang
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20241129014850.2852844-1-volodymyr_babchuk@epam.com>
 <20241129014850.2852844-4-volodymyr_babchuk@epam.com>
 <d8bdd084-3e0a-40aa-b829-534219b24df7@suse.com> <87iks5bsgd.fsf@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <87iks5bsgd.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 29/11/2024 22:12, Volodymyr Babchuk wrote:
> 
> Hi Jan,
> 
> Jan Beulich <jbeulich@suse.com> writes:
> 
>> On 29.11.2024 02:49, Volodymyr Babchuk wrote:
>>> Provide -target and -march explicitly when building with clang. This
>>> makes cross-compilation much easier, because clang accept this
>>> parameters regardless of host platform. Basically,
>>>
>>>    make XEN_TARGET_ARCH=arm64 clang=y llvm=y
>>>
>>> will behave in the same way if building Xen on x86, or on arm64 or on
>>> any other platform.
>>>
>>> -march is required because with default value, clang will not
>>> recognize EL2 registers.
>>>
>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>> ---
>>>   config/arm64.mk | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/config/arm64.mk b/config/arm64.mk
>>> index c4662f67d0..97eb9a82e7 100644
>>> --- a/config/arm64.mk
>>> +++ b/config/arm64.mk
>>> @@ -5,6 +5,10 @@ CONFIG_XEN_INSTALL_SUFFIX :=
>>>   
>>>   CFLAGS += #-marm -march= -mcpu= etc
>>>   
>>> +ifeq ($(clang),y)
>>> +CFLAGS += -target aarch64 -march=armv8-a
>>> +endif
>>
>> Why is this dependent on (just?) $(clang), not (also?) $(llvm)?
> 
> Because this parameter is handled by clang only. There is no harm in
> providing it explicitly. When building on arm64, value of this parameter
> will match the default value for the platform. When building on x86, we
> need to tell clang that it should generate arm64 code anyways. There is
> no reason in trying to make ARM build with x86 instruction set.
> 
>> Also
>> this affects both toolstack builds and hypervisor. Is applying -march
>> like this actually appropriate for the toolstack?
> 
> This is a good question. I can't see why this can't be appropriate for
> toolstack. I.e. what bad can happen when building the toolstack.

In the future, we may want to build the tools for Armv8-M. So I think 
the -march should also applies for the toolstack.

Cheers,

-- 
Julien Grall


