Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7434557FF
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 10:28:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227249.392984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mndiX-0006GT-LQ; Thu, 18 Nov 2021 09:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227249.392984; Thu, 18 Nov 2021 09:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mndiX-0006Ee-I7; Thu, 18 Nov 2021 09:28:29 +0000
Received: by outflank-mailman (input) for mailman id 227249;
 Thu, 18 Nov 2021 09:28:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mndiW-0006EF-Bl
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 09:28:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mndiU-0008Li-WC; Thu, 18 Nov 2021 09:28:27 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mndiU-0004BM-PG; Thu, 18 Nov 2021 09:28:26 +0000
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
	bh=L3yxdPzhdNeeoGqr96qq/zmQrgZOuF25Y/ZOAg2pwO8=; b=zd+SrMl/4Nrg/YRy1H0rHR5kbU
	F2aO/89SOFlELdqwpaUSPdGFJ0iU16gf68VkzJdls3nGMWuOIeeIe4r3UBvjm/oxjA5AER9fjaQpN
	yxQzY8TzYQ1+OhV3DTC0i9HLG+2115o47UEDMcovTUdps6zb+sHto643sFf1xKkOVcxU=;
Message-ID: <f46d7a85-b323-1219-8409-b435720846a6@xen.org>
Date: Thu, 18 Nov 2021 09:28:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH 1/5] xen/domain: Remove function pointers from domain
 pause helpers
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
 <20211111175740.23480-2-andrew.cooper3@citrix.com>
 <dc639bdb-a025-4ddf-f328-8aca91bf9ea9@xen.org>
 <23b5c4ae-d4da-3d01-42f3-17f1504a0a6a@srcf.net>
From: Julien Grall <julien@xen.org>
In-Reply-To: <23b5c4ae-d4da-3d01-42f3-17f1504a0a6a@srcf.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 18/11/2021 01:47, Andrew Cooper wrote:
> On 12/11/2021 09:36, Julien Grall wrote:
>> On 11/11/2021 17:57, Andrew Cooper wrote:
>>> Retpolines are expensive, and all these do are select between the 
>>> sync and
>>> nosync helpers.  Pass a boolean instead, and use direct calls 
>>> everywhere.
>>
>> To be honest, I much prefer to read the old code. I am totally not 
>> against the change but I can see how I would be ready to introduce new 
>> function pointers use in the future.
> 
> Really?  The only reason there are function points to begin with was 
> because of a far more naive (and far pre-spectre) me fixing a reference 
> counting mess in 2014 by consolidating the logic.  My mistake was not 
> spotting that the function pointers weren't actually necessary in the 
> first place.
> 
>> So I think we need some guidelines on when to use function pointers in 
>> Xen.
> 
> It's easy.  If you are in any way unsure, they're probably the wrong 
> answer.  (Ok - I'm being a little facetious)
> 
> There are concrete security improvements from not using function 
> pointers, demonstrated by fact that JOP/COP attacks are so pervasive 
> that all major hardware and software vendors are working on techniques 
> (both hardware and software) to prevent forward-edge control flow 
> integrity violations.  (The mandate from the NSA to make this happen 
> certainly helped spur things on, too.)
> 
> There are also concrete performance improvements too.  All competitive 
> processors in the market today can cope with direct branches more 
> efficiently than indirect branches, and a key principle behind 
> profile-guided-optimsiation is to rearrange your `ptr()` function 
> pointer call into `if ( ptr == a ) a(); else if ( ptr == b ) b(); else 
> ptr()` based on the frequency of destinations, because this really does 
> make orders of magnitude improvements in some cases.
> 
> We have some shockingly inappropriate uses of function pointers in Xen 
> right now (patches 4 and 5 in particular, and "x86/hvm: Remove callback 
> from paging->flush_tlb() hook" posted today).  While this specific 
> example doesn't fall into shockingly inappropriate in my books, it is 
> firmly in the "not appropriate" category.

Thanks for the full explanation. What I am looking for is an update of 
CODING_STYLE to make clear the function pointers should be avoided in 
Xen and when we would accept them.

>>> This actually compiles smaller than before:
>>
>> ... the code doesn't really compile smaller on Arm:
>>
>> 42sh>  ../scripts/bloat-o-meter xen-syms-old xen-syms
>>
>> add/remove: 4/2 grow/shrink: 0/6 up/down: 272/-252 (20)
>> Function old     new   delta
>> _domain_pause                                  -     136    +136
>> _domain_pause_by_systemcontroller              -     120    +120
>> domain_pause_by_systemcontroller_nosync        -       8      +8
>> domain_pause_by_systemcontroller               -       8      +8
>> domain_resume                                136     132      -4
>> domain_pause_nosync                           12       8      -4
>> domain_pause                                  12       8      -4
>> domain_pause_except_self                     188     180      -8
>> do_domctl                                   5480    5472      -8
>> domain_kill                                  372     356     -16
>> do_domain_pause                               88       -     -88
>> __domain_pause_by_systemcontroller           120       -    -120
>> Total: Before=966919, After=966939, chg +0.00%
> 
> 
> ARM, like x86, compiles for speed, not size.  "it got a bit larger" is 
> generally not as interesting as "it got smaller, despite everything the 
> compiler would normally do in the opposite direction".

My point is you have a generic section "this compiles smaller" section 
in your commit message when in fact this was only tested with one x86 
compiler version.

So at the minimum you should specify the version/architecture because 
otherwise this sounds like you claim smaller Xen for everyone.

But to be honest, I don't really see the value to mention them as this 
is depending on your compiler (e.g. it may be bigger or smaller) and as 
you wrote it yourself "you're saying that for an removed 5 instructions".

Cheers,

-- 
Julien Grall

