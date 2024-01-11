Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 031BF82AEAC
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 13:26:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666258.1036766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNu8E-00050s-Bh; Thu, 11 Jan 2024 12:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666258.1036766; Thu, 11 Jan 2024 12:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNu8E-0004yQ-8Y; Thu, 11 Jan 2024 12:25:58 +0000
Received: by outflank-mailman (input) for mailman id 666258;
 Thu, 11 Jan 2024 12:25:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rNu8C-0004yK-Pm
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 12:25:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rNu88-0004qD-Lu; Thu, 11 Jan 2024 12:25:52 +0000
Received: from [15.248.2.234] (helo=[10.24.67.34])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rNu88-0003Yv-Dc; Thu, 11 Jan 2024 12:25:52 +0000
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
	bh=rG+TBeviSM+aZkx6WVDR2RBN6aR5W+It+rirODfxg/4=; b=7G7YtFPmNcNnQxpH9xI8mshciW
	AwwtXLCoTHpSuuWI/3+hq2yW3pw7zB61g2cUPH9nsuxOqkmYOWE6w/0UT3aDlK3wfHFu27vfNbq53
	IbtV7qF/jqcsMUwNz/1p04uhKWKHyCpdtggT7pLzZfDYAs/bQI1OvEZZ5GfTa0wC/sI4=;
Message-ID: <4ab710c3-c628-4bbe-9533-88af75a9b9ec@xen.org>
Date: Thu, 11 Jan 2024 12:25:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/22] x86: add a boot option to enable and disable the
 direct map
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Elias El Yandouzi <eliasely@amazon.com>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-12-julien@xen.org>
 <fc70f967-34bb-9569-f514-7a3208e746c6@suse.com>
 <bc989828-69b9-4919-9ff3-fdd53fb2def1@amazon.com>
 <c736e4d9-5262-4adf-9e74-9b1be5ab13db@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c736e4d9-5262-4adf-9e74-9b1be5ab13db@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 11/01/2024 11:53, Jan Beulich wrote:
> On 11.01.2024 11:47, Elias El Yandouzi wrote:
>> On 22/12/2022 13:24, Jan Beulich wrote:
>>> That said, I think this change comes too early in the series, or there is
>>> something missing.
>>
>> At first, I had the same feeling but looking at the rest of the series,
>> I can see that the option is needed in follow-up patches.
>>
>>> As said in reply to patch 10, while there the mapcache
>>> is being initialized for the idle domain, I don't think it can be used
>>> just yet. Read through mapcache_current_vcpu() to understand why I think
>>> that way, paying particular attention to the ASSERT() near the end.
>>
>> Would be able to elaborate a bit more why you think that? I haven't been
>> able to get your point.
> 
> Why exactly I referred to the ASSERT() there I can't reconstruct. The
> function as a whole looks problematic though when suddenly the idle
> domain also gains a mapcache. I'm sorry, too much context was lost
> from over a year ago; all of this will need looking at from scratch
> again whenever a new version was posted.
> 
>>> In preparation of this patch here I think the mfn_to_virt() uses have to all
>>> disappear from map_domain_page(). Perhaps yet more strongly all
>>> ..._to_virt() (except fix_to_virt() and friends) and __va() have to
>>> disappear up front from x86 and any code path which can be taken on x86
>>> (which may simply mean purging all respective x86 #define-s, without
>>> breaking the build in any way).
>>
>> I agree with you on that one. I think it is what we're aiming for in the
>> long term. However, as mentioned by Julien in the cover letter, the
>> series's name is a misnomer and I am afraid we won't be able to remove
>> all of them with this series. These helpers would still be used for
>> xenheap pages or when the direct map is enabled.
> 
> Leaving a hazard of certain uses not having been converted, or even
> overlooked in patches going in at around the same time as this series?
> I view this as pretty "adventurous".

Until we get rid of the directmap completely (which is not the goal of 
this series), we will need to keep mfn_to_virt().

In fact the one you ask to remove in map_domain_page() will need to be 
replaced with function doing the same thing. The same for the code that 
will initially prepare the directmap. This to avoid impacting 
performance when the user still wants to use the directmap.

So are you just asking to remove most of the use and rename *_to_virt() 
to something that is more directmap specific (e.g. mfn_to_directmap_virt())?

Cheers,

-- 
Julien Grall

