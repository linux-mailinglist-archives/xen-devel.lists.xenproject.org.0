Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 964D675920F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 11:50:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565723.884147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM3pE-00062W-GB; Wed, 19 Jul 2023 09:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565723.884147; Wed, 19 Jul 2023 09:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM3pE-00060b-Cp; Wed, 19 Jul 2023 09:50:28 +0000
Received: by outflank-mailman (input) for mailman id 565723;
 Wed, 19 Jul 2023 09:50:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qM3pD-00060U-Ab
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 09:50:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qM3pC-0006Yq-9Y; Wed, 19 Jul 2023 09:50:26 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.5.130]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qM3pC-00041w-2l; Wed, 19 Jul 2023 09:50:26 +0000
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
	bh=0wXBCIXZjnVGIQv6/az3CVLZz5KL5jlhAYynZtTHwzQ=; b=G8f53cZlEsOM4U+A17WSA/P/cY
	UyBGmX+uRlTbqC+Zfa/n6Y/84gj4yYGEAJrX/LfGQ1GcQb69aMbW4rV5/3YqMPgcwpoNkaW047zpE
	+oFFDXE9Qk5sVbIyawEqPxS4MrI/DWoRTcKCkKtHUC+IGUcUsrs699Qmq/GDm+X30LGc=;
Message-ID: <4dd81092-af9e-016b-9d28-440d39a02723@xen.org>
Date: Wed, 19 Jul 2023 10:50:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [RFC PATCH 2/4] xen/arm64: bitops: justify uninitialized variable
 inside a macro
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1689329728.git.nicola.vetrini@bugseng.com>
 <d06a312944bee7457fa2ac75e0cfef20f0ec430f.1689329728.git.nicola.vetrini@bugseng.com>
 <76cb0f23-ebcb-2c51-2312-c926b0d6d570@xen.org>
 <8617ddae-02f6-981f-73fc-50be2e24ea64@xen.org>
 <4748db4d-d0d7-142c-b547-c285ceb1357c@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4748db4d-d0d7-142c-b547-c285ceb1357c@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/07/2023 09:54, Nicola Vetrini wrote:
> 
> 
> On 17/07/23 22:45, Julien Grall wrote:
>>
>>
>> On 17/07/2023 21:40, Julien Grall wrote:
>>> On 14/07/2023 12:49, Nicola Vetrini wrote:
>>>> The macro 'testop' expands to a function that declares the local
>>>> variable 'oldbit', which is written before being set, but is such a
>>>> way that is not amenable to automatic checking.
>>>>
>>>> Therefore, a deviation comment, is introduced to document this 
>>>> situation.
>>>>
>>>> A similar reasoning applies to macro 'guest_testop'.
>>>
>>> Would you be able to check if the code below (only compile tested so 
>>> far) would silence Eclair?
>>
>> Hmmm.. I think my e-mail client mangled the diff. Here an unmangled 
>> version if needed:
>>
>> http://paste.debian.net/1286154/
>>
>> Cheers,
>>
> 
> I have a question: wouldn't this patch also imply an update of 
> xen/arch/arm/include/asm/guest_atomics.h ?
> 
> This in particular is the bit of code that needs to be reworked to use 
> the newer *_timeout definition.

My patch is not changing the exported *_timeout. It is only changing the 
definition of int_##name which is not exported.

But I have realized that one chunk were missing. Here the new version:

https://paste.debian.net/1286311/

Cheers,

-- 
Julien Grall

