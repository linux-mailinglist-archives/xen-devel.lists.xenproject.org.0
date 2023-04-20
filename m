Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B9C6E944C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 14:30:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524240.815021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppTQX-0004gt-FR; Thu, 20 Apr 2023 12:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524240.815021; Thu, 20 Apr 2023 12:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppTQX-0004fC-CT; Thu, 20 Apr 2023 12:30:17 +0000
Received: by outflank-mailman (input) for mailman id 524240;
 Thu, 20 Apr 2023 12:30:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ppTQW-0004f2-GJ
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 12:30:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ppTQT-00050M-Is; Thu, 20 Apr 2023 12:30:13 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.15.245]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ppTQT-0006jo-Bf; Thu, 20 Apr 2023 12:30:13 +0000
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
	bh=nSWYaANsJVA/M6A750YbBpgphrkLqfCBpbXVkB3eAN4=; b=6IMy7mSW79/H5jiqJ8gBO3t6pQ
	Pj4fhPXn6jMVm1Hd1nUO9IzQ1EjBWOOv0n9ixXt1JlIPQDZQdNrUJPjaE+OeyWVIosUKHG6HEXbmR
	oiJ1sXvKjCJJmRpKLKdXi34goY7JPD2JmadbG6i0oOnn1ogLJq35ptJ/UN4fjUMg0gs8=;
Message-ID: <8e3d2240-3741-497e-2318-5a4a4d7bfd7b@xen.org>
Date: Thu, 20 Apr 2023 13:30:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v5 00/12] SVE feature for arm guests
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Nick Rosbrook <rosbrookn@gmail.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <08BE4F94-C4B5-4B05-AD92-61C5C5D24F39@arm.com>
 <bdb1b5e3-c3d9-1c39-f7f7-8f48157ba7b3@xen.org>
 <4cbaaf12-bd11-ca04-eed1-f8848290a692@suse.com>
 <C21BD176-AD46-4379-947F-4271D3EE05A1@arm.com>
 <5f5b65eb-d1fc-271a-02db-aa347cc708e9@suse.com>
 <7614AE25-F59D-430A-9C3E-30B1CE0E1580@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7614AE25-F59D-430A-9C3E-30B1CE0E1580@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/04/2023 09:20, Bertrand Marquis wrote:
> Hi Jan,
> 
>> On 19 Apr 2023, at 09:52, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 19.04.2023 09:31, Bertrand Marquis wrote:
>>> Hi Jan,
>>>
>>>> On 19 Apr 2023, at 08:28, Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 18.04.2023 16:25, Julien Grall wrote:
>>>>> On 18/04/2023 14:13, Bertrand Marquis wrote:
>>>>>> On this serie I would like to open a discussion on how to handle the vector size
>>>>>> and the corresponding command line / configuration / device tree parameters.
>>>>>>
>>>>>> In general the user must either give a vector size it wants or has a solution to
>>>>>> just request the maximum supported size.
>>>>>>
>>>>>> In the current implementation if a size bigger than the supported one is provided:
>>>>>> - we silently disable SVE for dom0
>>>>>> - we silently disable SVE for dom0less
>>>>>> - we do not create a guest when done through tools
>>>>>>
>>>>>> This is not completely coherent and i think we should aim for a coherent behaviour
>>>>>> unless we have arguments for this status.
>>>>>
>>>>> +1.
>>>>>
>>>>>> Is there any good reason to silently disable for Dom0 and dom0less only ?
>>>>>>
>>>>>> I see some possible solutions here:
>>>>>>
>>>>>> - modify parameter behaviour to use the supported size if parameter is bigger than
>>>>>> it. This would at least keep SVE enabled if a VM depends on it and could simplify
>>>>>> some of the handling by using 2048 to use the maximum supported size.
>>>>>
>>>>> My concern with this approach and the third one is the user may take
>>>>> some time to realize the problem in the xl.cfg. So...
>>>>>
>>>>>>
>>>>>> - coherently stop if the parameter value is not supported (including if sve is
>>>>>> not supported)
>>>>>
>>>>> ... this is my preferred approach because it would be clear that the
>>>>> value passed to Xen is bogus.
>>>>
>>>> I did say earlier on that this comes with its own downside of preventing
>>>> boot to complete for no real reason. It's all Arm code, so you're fine
>>>> to ignore me, but in similar situations elsewhere (sorry, don't recall a
>>>> concrete example off the top of my head) we've aimed to allow the system
>>>> to boot, for the admin to then take corrective action if/as needed.
>>>
>>> But a guest depending on the feature will just crash later when booting.
>>> This is making the assumption that guests are all able to properly adapt
>>> to different hardware possibilities.
>>> This might be the case when you have a full Linux but if you consider an
>>> embedded use case, if something is activated due to command line parameters
>>> or configuration ones, it should not be expected that those are ignored I think.
>>>
>>> There are definitely 2 different needs here, maybe we need to have something
>>> like a "strict" switch to allow both use cases ?
>>
>> Possibly. Yet along what I've said before - would you then also mean that to
>> fail boot upon encountering entirely unknown command line options?
> 
> I think this should depend:
> - completely unknow: we can ignore
> - not supported (sve while sve is not supported by the platform or Xen): we should not ignore
> 
> I agree that one could use custom command line arguments for lots of reasons
> (in linux you can do that and get them back from /proc for example) but silently
> ignoring a parameter that is known to Xen i do not think we should do.
> 
> I think in most cases, one could think its system is correctly running but could get
> problems later (or in some cases even not have any) so having a clear error at the
> beginning is a lot more clear.

FWIW, I agree with Bertrand.

Cheers,

-- 
Julien Grall

