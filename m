Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BBB375432
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 14:55:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123485.232950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ledWJ-0005C1-1O; Thu, 06 May 2021 12:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123485.232950; Thu, 06 May 2021 12:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ledWI-00058d-Ts; Thu, 06 May 2021 12:54:22 +0000
Received: by outflank-mailman (input) for mailman id 123485;
 Thu, 06 May 2021 12:54:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ledWG-00058U-Rl
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 12:54:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ledWG-0008MU-0S; Thu, 06 May 2021 12:54:20 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ledWF-0004ra-QI; Thu, 06 May 2021 12:54:19 +0000
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
	bh=1f8VE+gKWT1fXlZMtDLksPX2illJCsUSfiLEZL/+XNE=; b=wURuQ3NztQECS5UDV9e2mllNeF
	2o8abmnlOReTAwkpDzcZy4fgKuQp8us6SL/j1dEiX0Aq6isGH32Bs5POAu6UxguqNGo990RjWhKNm
	f8LBk3VaWbRSQmb0K8mTtxVKPCvhkvlh4Wc5bxXzd/GePqr75A9qFqoV9cefINJoxL8g=;
Subject: Re: [PATCH v4 3/3] unzstd: make helper symbols static
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <12054cba-4386-0dbf-46fd-41ace0344f8e@suse.com>
 <759c8524-cc01-fac8-bc62-0ba6558477bd@suse.com>
 <cb8fa703-f421-ce55-811a-d4a649bc201a@xen.org>
 <1696e5f2-481a-5a7f-258d-b2a0679b041f@suse.com>
 <f6e00fd9-a207-858e-37e8-fb25427cf8de@xen.org>
 <cb4ee5ef-fba8-e70d-79ae-c640ed853d53@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a03685fe-191b-07e5-78af-eccc9bb4ff05@xen.org>
Date: Thu, 6 May 2021 13:54:16 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <cb4ee5ef-fba8-e70d-79ae-c640ed853d53@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 06/05/2021 07:21, Jan Beulich wrote:
> On 05.05.2021 19:35, Julien Grall wrote:
>>
>>
>> On 29/04/2021 14:26, Jan Beulich wrote:
>>> On 29.04.2021 13:27, Julien Grall wrote:
>>>> On 21/04/2021 11:22, Jan Beulich wrote:
>>>>> While for the original library's purposes these functions of course want
>>>>> to be externally exposed, we don't need this, and we also don't want
>>>>> this both to prevent unintended use and to keep the name space tidy.
>>>>> (When functions have no callers at all, wrap them with a suitable
>>>>> #ifdef.) This has the added benefit of reducing the resulting binary
>>>>> size - while this is all .init code, it's still desirable to not carry
>>>>> dead code.
>>>>
>>>> So I understand the desire to keep the code close to Linux and removing
>>>> the dead code. However I am still not convinced that the approach taken
>>>> is actually worth the amount of memory saved.
>>>>
>>>> How much memory are we talking about here?
>>>
>>> There are no (runtime) memory savings, as is being said by the
>>> description. There are savings on the image and symbol table sizes
>>> (see below - .*.0/ holding files as produced without the patch
>>> applied, while .*.1/ holding output with it in place), the image
>>> size reduction part of which is - as also expressed by the
>>> description - a nice side effect, but not the main motivation for
>>> the change.
>>
>> Thanks for the providing the information. I have misunderstood your
>> original intention.
>>
>> Reading them again, I have to admit this doesn't really change my view
>> here. You are trading a smaller name space or prevent unintended use
>> (not clear what would be wrong to call them) to code
>> maintenability/readability.
> 
> Well, I mean mainly the usual issue of us, short of having Linux-like
> section reference checking, being at risk of calling __init functions
> from non-__init code.

Right, we are rely on the review to not mix the tow. In the past, I have 
successfully used the Linux script on Xen binary. It might be a good 
idea to import a cut-down version in Xen.

Cheers,

-- 
Julien Grall

