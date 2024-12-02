Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AF59E0D17
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 21:39:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847067.1262201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIDC1-0004xj-0a; Mon, 02 Dec 2024 20:38:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847067.1262201; Mon, 02 Dec 2024 20:38:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIDC0-0004vd-Tp; Mon, 02 Dec 2024 20:38:52 +0000
Received: by outflank-mailman (input) for mailman id 847067;
 Mon, 02 Dec 2024 20:38:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tIDBz-0004vU-HM
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 20:38:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tIDBw-000Ogs-19;
 Mon, 02 Dec 2024 20:38:48 +0000
Received: from [2a02:8012:3a1:0:c6e:c614:26eb:b495]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tIDBw-00B8XO-17;
 Mon, 02 Dec 2024 20:38:48 +0000
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
	bh=SX1o11VmnEru2ojH9pmsWmrHAe7Uo3A6MYVEmSKK2xA=; b=qXVBMAUZzcNUL/4TYyq5XGR2LJ
	Mk0Fyrivh4YzHtPjpK2lm1JcqB+7HiQyp0ifNggT0TClDsK7AFmfXaEBz/rbZK/K+nIi2oeaBTd7P
	cdNXwyNr2HNBnllDsaswFaR863BOr1j1IihBtV9jooB61oxA0tvqGypSshCFc343JTH4=;
Message-ID: <6d4134c9-25ac-4b16-9928-2a4bdc48d996@xen.org>
Date: Mon, 2 Dec 2024 20:38:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] build: arm64: provide -target and -march if using
 clang
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20241129014850.2852844-1-volodymyr_babchuk@epam.com>
 <20241129014850.2852844-4-volodymyr_babchuk@epam.com>
 <d8bdd084-3e0a-40aa-b829-534219b24df7@suse.com> <87iks5bsgd.fsf@epam.com>
 <8df584b8-fb23-4db4-af87-903fde91e42e@xen.org>
 <faefeec9-15db-4ab5-9c51-613056418755@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <faefeec9-15db-4ab5-9c51-613056418755@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 02/12/2024 07:52, Jan Beulich wrote:
> On 30.11.2024 18:15, Julien Grall wrote:
>> On 29/11/2024 22:12, Volodymyr Babchuk wrote:
>>> Jan Beulich <jbeulich@suse.com> writes:
>>>> On 29.11.2024 02:49, Volodymyr Babchuk wrote:
>>>>> --- a/config/arm64.mk
>>>>> +++ b/config/arm64.mk
>>>>> @@ -5,6 +5,10 @@ CONFIG_XEN_INSTALL_SUFFIX :=
>>>>>    
>>>>>    CFLAGS += #-marm -march= -mcpu= etc
>>>>>    
>>>>> +ifeq ($(clang),y)
>>>>> +CFLAGS += -target aarch64 -march=armv8-a
>>>>> +endif
>>>>
>>>> Why is this dependent on (just?) $(clang), not (also?) $(llvm)?
>>>
>>> Because this parameter is handled by clang only. There is no harm in
>>> providing it explicitly. When building on arm64, value of this parameter
>>> will match the default value for the platform. When building on x86, we
>>> need to tell clang that it should generate arm64 code anyways. There is
>>> no reason in trying to make ARM build with x86 instruction set.
>>>
>>>> Also
>>>> this affects both toolstack builds and hypervisor. Is applying -march
>>>> like this actually appropriate for the toolstack?
>>>
>>> This is a good question. I can't see why this can't be appropriate for
>>> toolstack. I.e. what bad can happen when building the toolstack.
>>
>> In the future, we may want to build the tools for Armv8-M. So I think
>> the -march should also applies for the toolstack.
> 
> Perhaps I don't know enough of the Arm world, but: Wouldn't it be possible
> to build a tool stack suitable for a wide range for Arm64 flavors, while
> requiring more targeted hypervisor binaries?

Good question. There are some commonnality between ARMv8-M and ARMv8-R 
but I am not sure whether it means we could use -march=armv8-a build and 
run on ARMv8-M. Adding Ayan and Luca.

Cheers,

-- 
Julien Grall


