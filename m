Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C83B599C759
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 12:44:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818613.1231926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0IYO-0003yu-R8; Mon, 14 Oct 2024 10:43:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818613.1231926; Mon, 14 Oct 2024 10:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0IYO-0003we-OY; Mon, 14 Oct 2024 10:43:56 +0000
Received: by outflank-mailman (input) for mailman id 818613;
 Mon, 14 Oct 2024 10:43:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t0IYN-0003wY-Ro
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 10:43:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t0IYM-0000lC-GG; Mon, 14 Oct 2024 10:43:54 +0000
Received: from [2a02:8012:3a1:0:750a:af63:2306:b870]
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t0IYM-0006eA-8o; Mon, 14 Oct 2024 10:43:54 +0000
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
	bh=Rcq25qMf6VcWGLVIAkD/jsIbSk/4UiwG2uuQj7u3AZg=; b=jboBqeOLE0DT9U7rD9kgwB+YV/
	Vu9oTrYxQFBJ3ZJ86YakEd9V1imZFAYkjhWUUgy8POeozi5rXIG+OcpA8iMy9wi59arkRZCx4KQbK
	NGFY+1E/I3Dh97uiUpY/RMP89acbjhvq1HjU/+W0OF8FND4D9EiWu/cexKb2XsuVbaKs=;
Message-ID: <d3ecb5c5-1439-4073-a630-8c5cc69239f3@xen.org>
Date: Mon, 14 Oct 2024 11:43:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/public: increment domctl interface version
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241014070650.14296-1-jgross@suse.com>
 <c7ea754e-e250-4431-b698-a10c2299ce75@suse.com>
 <79dca12b-6f16-4008-99cd-d0c3c1e7509c@suse.com>
 <2082c6ea-c778-444f-ad5f-15f25b87ba10@suse.com>
 <ea126b93-add2-415a-8a51-5b55ffcdd21e@suse.com>
 <8cb656c9-937e-4ffa-b5fd-a49f7a341c26@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8cb656c9-937e-4ffa-b5fd-a49f7a341c26@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan,

On 14/10/2024 11:19, Jan Beulich wrote:
> On 14.10.2024 10:00, Jürgen Groß wrote:
>> On 14.10.24 09:46, Jan Beulich wrote:
>>> On 14.10.2024 09:36, Jürgen Groß wrote:
>>>> On 14.10.24 09:14, Jan Beulich wrote:
>>>>> On 14.10.2024 09:06, Juergen Gross wrote:
>>>>>> The recent addition of the XEN_DOMCTL_dt_overlay function was missing
>>>>>> the related update of XEN_DOMCTL_INTERFACE_VERSION, as it has been the
>>>>>> first interface change of the 4.20 release cycle.
>>>>>>
>>>>>> Fixes: 4c733873b5c2 ("xen/arm: Add XEN_DOMCTL_dt_overlay and device attachment to domains")
>>>>>
>>>>> I'm confused: That change (a) pre-dates the branching of 4.20 and (b)
>>>>> bumped the version ...
>>>>>
>>>>>> --- a/xen/include/public/domctl.h
>>>>>> +++ b/xen/include/public/domctl.h
>>>>>> @@ -21,7 +21,7 @@
>>>>>>     #include "hvm/save.h"
>>>>>>     #include "memory.h"
>>>>>>     
>>>>>> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
>>>>>> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000018
>>>>>
>>>>> ... from 0x16 to 0x17. And for no apparent reason, as plain additions don't
>>>>> require a bump. Did you maybe mean to reference a different commit?
>>>>
>>>> Oh, indeed. I wanted to reference d6e9a2aab39e.
>>>>
>>>> And regarding to "plain additions don't require a bump": 4c733873b5c2 did
>>>> a plain addition and bumped the version.
>>>
>>> Right, hence why I said "for no apparent reason".
>>
>> There seems to be a lack of documentation in this regard.
>>
>> Julien explicitly asked for the bump for that addition.
> 
> Julien - why was that? 

I can't exactly remember why... I possibly just assumed that we updated 
the version every release...

Cheers,

-- 
Julien Grall


