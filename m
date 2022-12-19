Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7179465118D
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 19:13:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466289.725166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Kch-000294-IH; Mon, 19 Dec 2022 18:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466289.725166; Mon, 19 Dec 2022 18:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Kch-00026Z-FY; Mon, 19 Dec 2022 18:12:23 +0000
Received: by outflank-mailman (input) for mailman id 466289;
 Mon, 19 Dec 2022 18:12:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p7Kcg-00026T-45
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 18:12:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7Kcf-0006xM-Ok; Mon, 19 Dec 2022 18:12:21 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=[192.168.8.73])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7Kcf-0001sb-JB; Mon, 19 Dec 2022 18:12:21 +0000
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
	bh=HqOpz242rglbN0SSClJMJQbjsO/Dh1TcC3F5ozj/lig=; b=flamfbuYtaH3RdVSyqeLG5wX6/
	RVQOAMZSX+Z8YAXobvg41Cx7pAULSnePG9xDJAKRcKg++iipaM4rgy6o3qhWK9rNqaqD9Z5CUgzaf
	WTnlo0fpSdBbfOvwH1e6tVbZ2hUc+7kU8nZ8g5Mpay5hLYgj/VQG7FiwN8aN5ct4EFQ0=;
Message-ID: <a527322c-4609-2a72-18ba-e14069dbbb54@xen.org>
Date: Mon, 19 Dec 2022 18:12:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2 3/3] x86/ucode: load microcode earlier on boot CPU
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>
References: <20221219144533.19836-1-sergey.dyasli@citrix.com>
 <20221219144533.19836-4-sergey.dyasli@citrix.com>
 <78f8b94f-7a60-8739-cd3b-e2ce28ca9e3d@xen.org>
 <8c71f078-2f09-35a1-3ba4-37aaa4631d01@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8c71f078-2f09-35a1-3ba4-37aaa4631d01@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 19/12/2022 17:33, Andrew Cooper wrote:
> On 19/12/2022 4:57 pm, Julien Grall wrote:
>> Hi Sergey,
>>
>> On 19/12/2022 14:45, Sergey Dyasli wrote:
>>> Call early_microcode_init() straight after multiboot modules become
>>> accessible. Modify it to load the ucode directly from the blob bypassing
>>> populating microcode_cache because xmalloc is still not available at
>>> that point during Xen boot.
>>>
>>> Introduce early_microcode_init_cache() for populating microcode_cache.
>>> It needs to rescan the modules in order to find the new virtual address
>>> of the ucode blob because it changes during the boot process, e.g.
>>> from 0x00000000010802fc to 0xffff83204dac52fc.
>>>
>>> While at it, drop alternative_vcall() from early_microcode_init() since
>>> it's not useful in an __init fuction.
>>
>> Can you explain in the commit message why you need to load the
>> microcode early? E.g. is it a nice feature to have or a real issue?
>>
>> If the latter, then I think we will need to consider the patches for
>> backport.
> 
> Microcode loading should be as early as possible.  Linux does it even
> before setting up the console (which is a bit too early IMO).
> 
> Xen currently loads microcode half way through BSP boot, because there's
> a inappropriate dependency on needing xmalloc().  This is what Sergey is
> addressing with this series.
> 
> I'm working on addressing the TODO in the penultimate hunk of this patch
> (resolving some major abuse with with the multiboot module structures),
> which will let us load microcode even earlier.
> 
> A consequence of this (relatively) late loading is that we've got a
> tangle of feature enumeration logic where cpu_has_* doesn't fully work
> before ucode load, and we've got a lot of ad-hoc logic which is fragile.
> 
> 
> So no - there's not a specific bug driving this, but a lot of cleanup
> that I've been wanting to do since before speculation came along.

Thanks for the clarification!

Cheers,

-- 
Julien Grall

