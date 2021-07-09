Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF883C215B
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 11:19:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153500.283600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1mf3-00072r-0n; Fri, 09 Jul 2021 09:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153500.283600; Fri, 09 Jul 2021 09:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1mf2-00070l-Sy; Fri, 09 Jul 2021 09:19:04 +0000
Received: by outflank-mailman (input) for mailman id 153500;
 Fri, 09 Jul 2021 09:19:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m1mf1-00070f-Iw
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 09:19:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m1mf1-0005Gm-6t; Fri, 09 Jul 2021 09:19:03 +0000
Received: from [54.239.6.180] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m1mf1-0005Aa-04; Fri, 09 Jul 2021 09:19:03 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=pCDBDtUrIE4AfgI7cCyh5rfWyI8a14rMuO5Qjz/aBX4=; b=bXiIfBtJbIZAa37LF/ttvcpb6h
	74iIYvBrMZDHANA9zpdxrcAdCGrimTUj2Roa7OHzDTQSDOHrdgRT0OjwmVkZ/QR5qfTBTyoK8nsTR
	jd6Ya+8eabvkUsWouww6eLjPEaQ8vykvM+H2mE0m3kNjrXEdBsvoTOQ7Ak1AyMEyd1BI=;
Subject: Re: Xen/ARM API issue (page size)
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <YOZHkGrrl694NrfZ@mattapan.m5p.com>
 <8c7d9d21-d8be-d33f-6d37-dfb54f74c179@citrix.com>
 <2f27358a-e1d1-4627-3608-0c2fcd0754c0@xen.org>
 <YOd2wSfaThhDPoHp@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b32c978e-14d0-7cea-7f66-f6e33a3fc60e@xen.org>
Date: Fri, 9 Jul 2021 10:19:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOd2wSfaThhDPoHp@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Elliott,

On 08/07/2021 23:05, Elliott Mitchell wrote:
> On Thu, Jul 08, 2021 at 05:06:42PM +0100, Julien Grall wrote:
>> On 08/07/2021 02:05, Andrew Cooper wrote:
>>> On 08/07/2021 01:32, Elliott Mitchell wrote:
>>>> Hopefully I'm not about to show the limits of my knowledge...
>>>>
>>>> Quite a few values passed to Xen via hypercalls include a page number.
>>>> This makes sense as that maps to the hardware.  Problem is, I cannot help
>>>> but notice aarch64 allows for 4KB, 16KB and 64KB pages.
>>>
>>> Yes - page size is a know error through the ABI, seeing as Xen started
>>> on x86 and 4k is the only size considered at the time.
>>>
>>> 32bit frame numbers were all the rage between the Pentum 2 (1997) and
>>> the advent of 64bit systems (~2006), because they let you efficiently
>>> reference up to 16T of physical memory, rather than being limited at 4G
>>> if you used byte addresses instead.
>>>
>>> It will be addressed in ABIv2 design (if I ever get enough time to write
>>> everything down and make a start).
>>
>> IIRC, ABIv2 will only focus on the interface between the hypervisor and
>> the guests. However, I think we will also need to update the PV protocol
>> so two domains agree on the page granularity used.
> 
> I'm inclined to concur with Andrew Cooper here.  It makes a fair bit of
> sense to consistently use full addresses across the entire ABI, just
> specify alignment so the lower bits end up zeroes.
> 
> 
>> Most of the arm64 cores supports all the page granularity. That said,
>> this is not a requirement from the Arm Arm, so it may be possible to
>> have cores only supporting a subset of the page granularity.
> 
> At which point it is possible to have a device where the page size(s)
> supported by some cores are disjoint from the page size(s) supported by
> other cores.
Well yes, it is possible to have cores with incompatible features. 
However, the software may decide to not support that configuration.

For instance, Linux will sanitize the CPU features and may not boot (or 
prevent a CPU to boot) if it can't find a valid subset.

In the case of the page granularity, all the cores where the OS will run 
needs to have a common page granularity supported. Linux will have to be 
built with PAGE_SIZE set to that granularity (Linux cannot dynamically 
switched).

> I imagine someone has plans.  An obvious use case would be a cellphone
> chip with a low-power core for the modem and a high-power OS core.
So long the OS is running on just the high-power core, then it is fine.

> 
> 
>>>> What happens if a system (and Xen) is setup to support 64KB pages, but a
>>>> particular domain has been built strictly with 4KB page support?
>>
>> If the processor only support 64KB, then you would not be able to boot a
>> 4KB kernel there.
> 
> I was being explicit about covering both cases of distinct page sizes
> between Xen and domain (Xen with smaller page size, domain with smaller
> page size).

Ok. I think I covered the case where Xen will use a smaller page 
granularity compare to the domain. But I haven't covered the opposite.

With the current ABI, a guest would need to be modified so it will 
allocate memory and talk to the hypervisor using 64KB chunk (assuming 
this is what the hypervisor was build with).

>>>> What if a particular domain wanted to use 64KB pages (4KB being too
>>>> granular), but Xen was set to use 4KB pages?
>> Today the hypercall ABI using the same page granularity as the
>> hypervisor. IOW, the domain would need to break its page in 4KB chunk to
>> talk to the hypervisor.
>>
>> FWIW, this is how Linux with 64KB/16KB page granularity is able to run
>> on current Xen.
> 
> Breaking pages up is generally easier than putting them back together.

IIRC, on Linux we are not putting them back together. Instead, we are 
wasting 60KB for every page to keep the code simple. Obviously, this 
could be improved... But this is not thing I had time to look at it.

[...]

>>>> What if a system had two domains which were set for different page sizes,
>>>> but the two needed to interact?
>>
>> They would need to agree on the page granularity used. At the moment,
>> this is implicitely fixed to 4KB.
> 
> "implicitly" -> "undocumented" -> "guess" -> "12 hour build wasted"
> 
> For the case I'm concerned with, the history is a decent hint, but not
> being explicitly documented is Bad.  In the Xen ABI there are too many
> references to "page size" without the page size being defined as 4KB.
> 
> In a few years there may be someone on this list who assumed "page size"
> meant whatever page size was in use and will be rather annoyed it means
> 4096, when both Xen and their OS were using 65536.

The documentation in Xen (including the ABI) is not at its best. The 
community is currently working on improving it.

You are welcome to help to contribute around the page size.

Cheers,

-- 
Julien Grall

