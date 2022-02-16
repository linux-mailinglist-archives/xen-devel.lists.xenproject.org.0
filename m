Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0115A4B86FC
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 12:46:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274039.469373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKIl4-00044n-BE; Wed, 16 Feb 2022 11:46:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274039.469373; Wed, 16 Feb 2022 11:46:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKIl4-00042F-7k; Wed, 16 Feb 2022 11:46:06 +0000
Received: by outflank-mailman (input) for mailman id 274039;
 Wed, 16 Feb 2022 11:46:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nKIl3-000427-B9
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 11:46:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nKIl2-0006in-Db; Wed, 16 Feb 2022 11:46:04 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.30.223]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nKIl2-0006OZ-73; Wed, 16 Feb 2022 11:46:04 +0000
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
	bh=7h/sHj+EdCh/XC90cUNXekG2JrGuF0kkYxv0quBeevA=; b=QVPaBh+ox+D7UEA7KDR+5pcO4J
	5V1q4CU0pTLBMh8Sks7LZYWNHXGJEEHLqcUpAzAbUV7acRB4zXdTUJdurYzFf5gxpG4pq/kUAuPyG
	PqXvhKIvG0OHvgrNkF7Q0/F0ZJy7w/MCQrIb4HK0reQ919VkY3rvFTg2jVsQuNCrqxBs=;
Message-ID: <f5d6de10-5d3c-f86e-71eb-203dd06b6a11@xen.org>
Date: Wed, 16 Feb 2022 11:46:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v2 02/70] xen/sort: Switch to an extern inline
 implementation
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-3-andrew.cooper3@citrix.com>
 <70824a0c-cc48-b064-695c-35c2d06c0ad1@xen.org>
 <alpine.DEB.2.22.394.2202151800230.43738@ubuntu-linux-20-04-desktop>
 <faa6c523-6e88-8987-c0c9-3652c002fda3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <faa6c523-6e88-8987-c0c9-3652c002fda3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 16/02/2022 10:44, Andrew Cooper wrote:
> On 16/02/2022 03:46, Stefano Stabellini wrote:
>> On Mon, 14 Feb 2022, Julien Grall wrote:
>>> On 14/02/2022 12:50, Andrew Cooper wrote:
>>>> There are exactly 3 callers of sort() in the hypervisor.  Callbacks in a
>>>> tight
>>>> loop like this are problematic for performance, especially with Spectre v2
>>>> protections, which is why extern inline is used commonly by libraries.
>>>>
>>>> Both ARM callers pass in NULL for the swap function, and while this might
>>>> seem
>>>> like an attractive option at first, it causes generic_swap() to be used,
>>>> which
>>>> forced a byte-wise copy.  Provide real swap functions so the compiler can
>>>> optimise properly, which is very important for ARM downstreams where
>>>> milliseconds until the system is up matters.
>>> Did you actually benchmark it? Both those lists will have < 128 elements in
>>> them. So I would be extremely surprised if you save more than a few hundreds
>>> microseconds with this approach.
>>>
>>> So, my opinion on this approach hasn't changed. On v1, we discussed an
>>> approach that would suit both Stefano and I. Jan seemed to confirm that would
>>> also suit x86.
>> This patch series has become 70 patches and for the sake of helping
>> Andrew move forward in the quickest and most painless way possible, I
>> append the following using generic_swap as static inline.
>>
>> Julien, Bertrand, is that acceptable to you?
>>
>> Andrew, I know this is not your favorite approach but you have quite a
>> lot of changes to handle -- probably not worth focussing on one detail
>> which is pretty minor?
> 
> It's not pretty minor.  My version really is the best thing for ARM.
 >
> The perf improvement alone, marginal as it may be in practice, is

Our take on Arm has always been to avoid micro-optimization when the 
resulting code is more difficult to maintain.

> justification alone for the patch, and Bertrand's R-by is testament to this.

I am not sure why calling out that Bertrand agreed means that everyone 
else should accept your approach.

This reminds me other series that have been blocked for a long time by 
you. Yet you made no effort to compromise... How ironic.

> 
> But the reasons why getting rid the swap functions is important for
> CET-IBT on x86 are exactly the same as why getting rid of them on ARM
> will be important for BTI support.  A tagged function doing an arbitrary
> bytewise swap from two parameters controlled by the third is far more
> valuable to an attackers gadget library than a typical function.

This is a more compelling reason. However, I am a bit puzzled why it 
took you so long to come up with this reason.

> i.e. this proposed intermediary, if it compiles, is just busywork which
> someone else is going to have to revert in the future, along with having
> this argument again.

Well, this argument would have never happened if your commit message 
contained information about BTI.

Instead you decided to just mention the performance part despite me 
objecting it and requesting for a different reason in v1 (see [1]).

Anyway, I will wait for a reword of the commit message before lifting my 
Nacked-by.

Cheers,

[1] 
https://lore.kernel.org/xen-devel/f7bb7a08-4721-f2a8-8602-0cd1baf1f083@xen.org/

-- 
Julien Grall

