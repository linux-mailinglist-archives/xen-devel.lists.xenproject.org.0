Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6AA8BA9FE
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 11:40:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716307.1118408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2pOF-0007JW-Uy; Fri, 03 May 2024 09:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716307.1118408; Fri, 03 May 2024 09:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2pOF-0007HH-Ri; Fri, 03 May 2024 09:39:39 +0000
Received: by outflank-mailman (input) for mailman id 716307;
 Fri, 03 May 2024 09:39:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s2pOD-0007HB-Um
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 09:39:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s2pO9-00018K-TT; Fri, 03 May 2024 09:39:33 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s2pO9-0004KX-Lt; Fri, 03 May 2024 09:39:33 +0000
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
	bh=zA9LaweF8nQdsYtFBtByudj/2+oq7tg35tHYk5ib3dI=; b=PnG7FLtCpBt+yKNjjYmyartmfl
	IkBEF8+6z75z4eEED/w5M67kiDhMeAp5l/nb7Wr7BxeQe9QCyxFScvKn570FSJOiqMz3CdqJuOCQj
	WpmFMZtcYaT79qRL5qeMwVy9jgs+7Zx8tJObzcajfVI/QfUnlm3Wz6HoL2Zctfzq27ZY=;
Message-ID: <b3299df2-e726-49eb-a893-cbc547b2419c@xen.org>
Date: Fri, 3 May 2024 10:39:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/8] xen: allow up to 16383 cpus
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20240327152229.25847-1-jgross@suse.com>
 <20240327152229.25847-9-jgross@suse.com>
 <da1662ac-70f1-4ae4-9737-e10e617c8036@suse.com>
 <637c755a-9f24-4b86-af12-7c7d50bf40c8@suse.com>
 <d0714064-c544-47d3-84c0-a19391ccf496@xen.org>
 <29296e11-8d21-4867-9d31-fc94af828214@suse.com>
 <146fbd43-d8b8-4d73-8650-c60024498324@xen.org>
 <alpine.DEB.2.22.394.2405021111540.624854@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2405021111540.624854@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefano,

On 02/05/2024 19:13, Stefano Stabellini wrote:
> On Mon, 29 Apr 2024, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 29/04/2024 12:28, Jürgen Groß wrote:
>>> On 29.04.24 13:04, Julien Grall wrote:
>>>> Hi Juergen,
>>>>
>>>> Sorry for the late reply.
>>>>
>>>> On 29/04/2024 11:33, Juergen Gross wrote:
>>>>> On 08.04.24 09:10, Jan Beulich wrote:
>>>>>> On 27.03.2024 16:22, Juergen Gross wrote:
>>>>>>> With lock handling now allowing up to 16384 cpus (spinlocks can
>>>>>>> handle
>>>>>>> 65535 cpus, rwlocks can handle 16384 cpus), raise the allowed limit
>>>>>>> for
>>>>>>> the number of cpus to be configured to 16383.
>>>>>>>
>>>>>>> The new limit is imposed by IOMMU_CMD_BUFFER_MAX_ENTRIES and
>>>>>>> QINVAL_MAX_ENTRY_NR required to be larger than 2 * CONFIG_NR_CPUS.
>>>>>>>
>>>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>>>
>>>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>>>>
>>>>>> I'd prefer this to also gain an Arm ack, though.
>>>>>
>>>>> Any comment from Arm side?
>>>>
>>>> Can you clarify what the new limits mean in term of (security) support?
>>>> Are we now claiming that Xen will work perfectly fine on platforms with up
>>>> to 16383?
>>>>
>>>> If so, I can't comment for x86, but for Arm, I am doubtful that it would
>>>> work without any (at least performance) issues. AFAIK, this is also an
>>>> untested configuration. In fact I would be surprised if Xen on Arm was
>>>> tested with more than a couple of hundreds cores (AFAICT the Ampere CPUs
>>>> has 192 CPUs).
>>>
>>> I think we should add a security support limit for the number of physical
>>> cpus similar to the memory support limit we already have in place.
>>>
>>> For x86 I'd suggest 4096 cpus for security support (basically the limit we
>>> have with this patch), but I'm open for other suggestions, too.
>>>
>>> I have no idea about any sensible limits for Arm32/Arm64.
>>
>> I am not entirely. Bertrand, Michal, Stefano, should we use 192 (the number of
>> CPUs from Ampere)?
> 
> I am OK with that. If we want to be a bit more future proof we could say
> 256 or 512.

Sorry, I don't follow your argument. A limit can be raised at time point 
in the future. The question is more whether we are confident that Xen on 
Arm will run well if a user has a platform with 256/512 pCPUs.

So are you saying that from Xen point of view, you are expecting no 
difference between 256 and 512. And therefore you would be happy if to 
backport patches if someone find differences (or even security issues) 
when using > 256 pCPUs?

Cheers,

-- 
Julien Grall

