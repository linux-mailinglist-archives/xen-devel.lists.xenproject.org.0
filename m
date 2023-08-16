Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E7177E2BF
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 15:39:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584764.915576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWGjK-00077r-K4; Wed, 16 Aug 2023 13:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584764.915576; Wed, 16 Aug 2023 13:38:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWGjK-00075m-HU; Wed, 16 Aug 2023 13:38:34 +0000
Received: by outflank-mailman (input) for mailman id 584764;
 Wed, 16 Aug 2023 13:38:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWGjI-00075g-QK
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 13:38:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWGjD-0000Hg-Eq; Wed, 16 Aug 2023 13:38:27 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.5.61])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWGjD-0005He-5l; Wed, 16 Aug 2023 13:38:27 +0000
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
	bh=/3sD/xYGcKUg0nE14xd44/hpO6EuWQbjI1EKmV+lGmw=; b=MRE1jFe7vXYK3oPu0FOto7GKME
	cP/Ced7Og1DTphV4r+vcY7tcSm76Kn+a8LpwQuXnc8KVUZa6QQUpyj5osKscSaLF879DOvMLsgvgL
	e5Hk4EBStc3MHjEreHErzWS6YUA/zXQBhupPLIv+Jeu0odizsExQuQRchKZcTK5gx9KU=;
Message-ID: <2eabb0db-35e3-4809-8922-c8e8fca6f802@xen.org>
Date: Wed, 16 Aug 2023 14:38:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Make PDX compression optional
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <20230808130220.27891-1-alejandro.vallejo@cloud.com>
 <64dc988b.df0a0220.d6d82.abb3@mx.google.com>
 <f8d43f0e-bceb-674d-c3d9-ddca4fd491df@suse.com>
 <0912c8ed-f2a3-4fdd-a210-f015c0e3f48f@xen.org>
 <44d233c3-4b85-c70b-0ab1-a67452884025@suse.com>
 <d3777547-cc5b-409e-b236-d502f1133443@xen.org>
 <25f27f25-3b5a-691d-fd2c-682b7452a1bf@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <25f27f25-3b5a-691d-fd2c-682b7452a1bf@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 16/08/2023 14:14, Jan Beulich wrote:
> On 16.08.2023 15:06, Julien Grall wrote:
>> Hi,
>>
>> On 16/08/2023 12:27, Jan Beulich wrote:
>>> On 16.08.2023 13:12, Julien Grall wrote:
>>>> Hi Jan,
>>>>
>>>> On 16/08/2023 10:43, Jan Beulich wrote:
>>>>> On 16.08.2023 11:36, Alejandro Vallejo wrote:
>>>>>> On Tue, Aug 08, 2023 at 02:02:16PM +0100, Alejandro Vallejo wrote:
>>>>>>> Currently there's a CONFIG_HAS_PDX Kconfig option, but it's impossible to
>>>>>>> disable it because the whole codebase performs unconditional
>>>>>>> compression/decompression operations on addresses. This has the
>>>>>>> unfortunate side effect that systems without a need for compression still
>>>>>>> have to pay the performance impact of juggling bits on every pfn<->pdx
>>>>>>> conversion (this requires reading several global variables). This series
>>>>>>> attempts to:
>>>>>>>
>>>>>>>      * Leave the state of pdx and pdx compression documented
>>>>>>>      * Factor out compression so it _can_ be removed through Kconfig
>>>>>>>      * Make it so compression is disabled on x86 and enabled on both Aarch32
>>>>>>>        and Aarch64 by default.
>>>>>>>
>>>>>>> Series summary:
>>>>>>>
>>>>>>> Patch 1 Moves hard-coded compression-related logic to helper functions
>>>>>>> Patch 2 Refactors all instances of regions being validated for pdx
>>>>>>>            compression conformance so it's done through a helper
>>>>>>> Patch 3 Non-functional reorder in order to simplify the patch 8 diff
>>>>>>> Patch 4 Adds new Kconfig option to compile out PDX compression and removes
>>>>>>>            the old CONFIG_HAS_PDX, as it was non removable
>>>>>>>
>>>>>>> Already committed:
>>>>>>>
>>>>>>> v1/patch 1 documents the current general understanding of the pdx concept and
>>>>>>>               pdx compression in particular
>>>>>>> v1/patch 3 Marks the pdx compression globals as ro_after_init
>>>>>>> v2/patch 1 Documents the differences between arm32 and arm64 directmaps
>>>>>>>
>>>>>>> Alejandro Vallejo (4):
>>>>>>>      mm: Factor out the pdx compression logic in ma/va converters
>>>>>>>      mm/pdx: Standardize region validation wrt pdx compression
>>>>>>>      pdx: Reorder pdx.[ch]
>>>>>>>      pdx: Add CONFIG_PDX_COMPRESSION as a common Kconfig option
>>>>>>
>>>>>> @Jan: Just making sure, are you generally ok with this series as-is?
>>>>>
>>>>> Well, okay would be too strong; I still don't see why my runtime patching
>>>>> series isn't re-considered.
>>>>
>>>> Do you have a pointer to the series? I would be interested to have a look.
>>>
>>> Sure, I can dig it out a 2nd time:
>>> https://lists.xenproject.org/archives/html/xen-devel/2018-09/msg01616.html
>>
>> Thanks! AFAIU, the optimization would only happen after the alternative
>> has been patched. This is happening after initializing the heap. With
>> Alejandro series, you will have some performance gain for the boot which
>> I care about.
> 
> Fair aspect.
> 
>>>> That said... the problem with alt-patching is this is architectural
>>>> specific. Right now, this seems to be a bit unnecessary given that we
>>>> believe that virtually no-one will have a platform (I know we talked
>>>> about a potential one...) where PDX is compressing.
>>>
>>> But it defaults to enabled on other than x86 anyway. So it seems like
>>> it's generally wanted everywhere except on x86, and on x86 it can
>>> (could) be patched out.
>>
>> IIUC, you are saying that we would want both Alejandro series (to allow
>> an admin to disable PDX at boot) and your series (to fully optimize the
>> PDX at runtime). Is that correct?
> 
> Not really, no. I don't view a build-time decision as necessary; I favor
> runtime decisions whenever possible.

At least on Arm, we want to cater two different set of users. One set 
will want to tailor Xen to there platform and runtime decision may not 
be desirable. The other set (e.g. distros) will want to run Xen 
everywhere so runtime is preferable.

So I think we should be able to offer both build and runtime option when 
it makes sense. The PDX is one example where both could be interesting, 
yet at the moment there seem to be an appetite for build time only 
configuration.

> 
>> If so, it is unclear to me why you want your series to be re-considered
>> now. Can't this be done as a follow-up if there is a desire to further
>> optimize?
> 
> In principle it could be, yes, but I'm afraid I know that no follow-up
> is going to happen (and me trying to revive the earlier work would be
> yet another case of pointlessly invested time).

Right which is why I wrote "desire". But my point was that Alejandro 
work is not a one-way door. It would still possible to have runtime 
patching on top of it.

Cheers,

-- 
Julien Grall

