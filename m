Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5EE4E3B8F
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 10:16:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293337.498299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWacc-0002so-1M; Tue, 22 Mar 2022 09:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293337.498299; Tue, 22 Mar 2022 09:16:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWacb-0002qz-UO; Tue, 22 Mar 2022 09:16:09 +0000
Received: by outflank-mailman (input) for mailman id 293337;
 Tue, 22 Mar 2022 09:16:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nWaca-0002qt-6e
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 09:16:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWacZ-00027X-Lv; Tue, 22 Mar 2022 09:16:07 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWacZ-00085T-GC; Tue, 22 Mar 2022 09:16:07 +0000
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
	bh=F58qaKg3RhlY7Un0SG4VictYgjEuSM4jQ0xld4U+W6Y=; b=x4vYNlq2+1717HwnHRgt+5LWfB
	9mwsA/Mh3pzGhXR8uBvocXbnxNFoa1QODU3P35IBBaMCaklqxUoJZyU+T9CBYnUzO4WvK7itfkcWf
	giFZJxpE0hMPVSJSnkLAVw2qs2lmJSCrHRwBDTCoNfQIuU34uTwkud6Exm675BmfsZk4=;
Message-ID: <d26ea92e-6d20-e487-87ea-249f698ca752@xen.org>
Date: Tue, 22 Mar 2022 09:16:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 4/6] xen/cpupool: Create different cpupools at boot
 time
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20220318152541.7460-1-luca.fancellu@arm.com>
 <20220318152541.7460-5-luca.fancellu@arm.com>
 <274f81b0-c164-4437-3d05-243e147330a9@xen.org>
 <0FA7F6D7-0B40-4B75-9752-7FE48D0FCA5C@arm.com>
 <9f3d7713-4e4b-58f8-d7a1-b42ef152a7ab@xen.org>
 <05E14D52-831A-438F-9F90-99F590A5A15F@arm.com>
 <108443e0-c7d7-af6d-2183-b1bd48b0f288@xen.org>
 <9ABBD292-A77F-4CDC-B096-546516114D42@arm.com>
 <1EAD6570-B893-4759-BA71-A1F9535E374F@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1EAD6570-B893-4759-BA71-A1F9535E374F@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 22/03/2022 08:47, Bertrand Marquis wrote:
> Hi Julien,
> 
>> On 22 Mar 2022, at 09:35, Bertrand Marquis <bertrand.marquis@arm.com> wrote:
>>
>> Hi Julien,
>>
>>> On 21 Mar 2022, at 18:44, Julien Grall <julien@xen.org> wrote:
>>>
>>> Hi Bertrand,
>>>
>>> On 21/03/2022 17:19, Bertrand Marquis wrote:
>>>>> On 21 Mar 2022, at 17:36, Julien Grall <julien@xen.org> wrote:
>>>>>> So I don’t know why on x86 we must have cpu0 in cpupool0, maybe x86 maintainer have more knowledge about that and
>>>>>> I can put a comment here.
>>>>>
>>>>> On Arm, we are not yet supporting all the CPU features that x86 supports (e.g. CPU hotplug, suspend/resume...). So I a am bit concerned that the restriction is just not there yet (or possibly hidden).
>>>>>
>>>>> Therefore, before lifting the restriction on Arm (and other arch), I would like us to understand why it is necessary on x86.
>>>>>
>>>>> We may not have the answer quickly, so is it going to be a problem to keep the restriction on Arm?
>>>> I am ok to keep the limitation to have dom0 always running on cpu0.
>>>> Only limitation I can see is that on a big little system, dom0 needs to stay on the type of core of the first booted core.
>>>
>>> Where does this limitation come from?
>>
>> If dom0 must run on core0 and core0 is Little then you cannot build a system where dom0 is running on big cores.
>> If the limitation is not there, you can build such a configuration without any dependency to the boot core type.
> 
> This might not be completely clear so let me rephrase:
> In the current system:
> - dom0 must run on cpupool-0

I don't think we need this restriction. In fact, with this series it 
will become more a problem because the cpupool ID will based on how we 
parse the Device-Tree.

So for dom0, we need to specify explicitely the cpupool to be used.

> - cpupool-0 must contain the boot core
> - consequence: dom0 must run on the boot core
> 
> If boot core is little, you cannot build as system where dom0 runs only on the big cores.
> Removing the second limitation (which is not required on arm) is making it possible.

IMHO removing the second restriction is a lot more risky than removing 
the first one.

Cheers,

-- 
Julien Grall

