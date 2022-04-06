Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF884F6316
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 17:24:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299989.511408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc7Vr-0001nu-EI; Wed, 06 Apr 2022 15:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299989.511408; Wed, 06 Apr 2022 15:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc7Vr-0001lm-B5; Wed, 06 Apr 2022 15:24:03 +0000
Received: by outflank-mailman (input) for mailman id 299989;
 Wed, 06 Apr 2022 15:24:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nc7Vp-0001lY-1g
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 15:24:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nc7Vm-00073L-E5; Wed, 06 Apr 2022 15:23:58 +0000
Received: from [54.239.6.190] (helo=[192.168.16.200])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nc7Vm-0008PE-7f; Wed, 06 Apr 2022 15:23:58 +0000
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
	bh=BZxfYUHJXhRRfZAdC7ye6dY7Kdzx9CyK8T9yu+2Lti8=; b=TKuQNEBZ8LlA447ueVsfyv52BI
	J8gMu3kAxgFyA546nW5VKV1j1J3+NH/+9YRnJ2zr1MYx8z2Grrl86Hn59kuBbbkdeONTCKhFoSH6q
	EYTSNETNBbZVuP/HNFjMaIka9MLebvorDDFkyJhOewto9RAYb483x/WM7sBAvoF5Pwyk=;
Message-ID: <26ca3b75-6bd2-008f-b393-45ba11f3d0ac@xen.org>
Date: Wed, 6 Apr 2022 16:23:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] SUPPORT.md: extend security support for hosts to 12 TiB
 of memory
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4c49e4cf-9d86-e630-a1bb-37afdf091c99@suse.com>
 <6ec0e3d9-374c-1caa-9889-f091dcf894e3@xen.org>
 <44883899-a696-31e1-c134-019de999d796@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <44883899-a696-31e1-c134-019de999d796@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 06/04/2022 16:22, Jan Beulich wrote:
> On 06.04.2022 17:15, Julien Grall wrote:
>> On 06/04/2022 15:44, Jan Beulich wrote:
>>> c49ee0329ff3 ("SUPPORT.md: limit security support for hosts with very
>>> much memory"), as a result of XSA-385, restricted security support to
>>> 8 TiB of host memory. Extend this to 12 TiB, putting in place a guest
>>> restriction to 8 TiB in exchange.
>>
>> And this is even without CONFIG_BIGMEM?
> 
> Yes. BIGMEM only matters when memory extends past the 16 TiB boundary
> (i.e. when frame numbers with ore than 32 significant bits appear).

Thanks for the confirmation!

> 
>>> --- a/SUPPORT.md
>>> +++ b/SUPPORT.md
>>> @@ -50,7 +50,7 @@ For the Cortex A57 r0p0 - r1p1, see Erra
>>>    
>>>    ### Physical Memory
>>>    
>>> -    Status: Supported up to 8 TiB
>>> +    Status: Supported up to 12 TiB
>>
>> I am afraid this limit is going to be too high for Arm. Even the
>> previous one was technically incorrect. From [1], it should be:
>>     - 5TB for arm64
>>     - 16GB for arm32
> 
> May I ask that you submit a patch correcting this, and I'll rebase
> on top of that? I can't really fit such an adjustment under the
> umbrella of the title and purpose of this change.

Sure. I will submit one soon.

Cheers,

-- 
Julien Grall

