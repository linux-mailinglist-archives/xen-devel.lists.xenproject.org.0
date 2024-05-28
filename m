Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D72738D1716
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 11:18:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731052.1136368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBsyD-0005tK-W5; Tue, 28 May 2024 09:18:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731052.1136368; Tue, 28 May 2024 09:18:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBsyD-0005qZ-TJ; Tue, 28 May 2024 09:18:13 +0000
Received: by outflank-mailman (input) for mailman id 731052;
 Tue, 28 May 2024 09:18:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sBsyC-0005qT-Ud
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 09:18:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sBsyC-0001a8-IJ; Tue, 28 May 2024 09:18:12 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sBsyC-0004sA-8b; Tue, 28 May 2024 09:18:12 +0000
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
	bh=YJ93bg5WbEIzO+FmzdVwg7AAzvKyktDzrPdI/cCDzWY=; b=lfko9Eo4lImfUs1mFLkCvIJR6R
	W4HH1PeFMpUo8GymZq1k3My4uC/T1KqjXSbDZ1taqemZHq+KWRrmvDRB5cc3AvA8Bhy7XwuslQ36q
	Y3/O4D33snPKMRtqyDFL9z1JDuadcKuM8g66R9NbSJRzQrpu3MQZN7ldckGlPtil9WFQ=;
Message-ID: <bc6660ef-59f1-4514-9792-067d987e3fbc@xen.org>
Date: Tue, 28 May 2024 10:18:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/5] arm/vpci: honor access size when returning an
 error
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20240522225927.77398-1-stewart.hildebrand@amd.com>
 <20240522225927.77398-2-stewart.hildebrand@amd.com>
 <Zk72jPtd9iXhChbc@macbook> <3b3fd3a2-6b5c-41a2-a0b3-219a362f645f@xen.org>
 <ZlWDvJ9_Om_3gX3b@macbook>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ZlWDvJ9_Om_3gX3b@macbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 28/05/2024 08:11, Roger Pau Monné wrote:
> On Mon, May 27, 2024 at 10:14:59PM +0100, Julien Grall wrote:
>> Hi Roger,
>>
>> On 23/05/2024 08:55, Roger Pau Monné wrote:
>>> On Wed, May 22, 2024 at 06:59:20PM -0400, Stewart Hildebrand wrote:
>>>> From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>>>>
>>>> Guest can try to read config space using different access sizes: 8,
>>>> 16, 32, 64 bits. We need to take this into account when we are
>>>> returning an error back to MMIO handler, otherwise it is possible to
>>>> provide more data than requested: i.e. guest issues LDRB instruction
>>>> to read one byte, but we are writing 0xFFFFFFFFFFFFFFFF in the target
>>>> register.
>>>
>>> Shouldn't this be taken care of in the trap handler subsystem, rather
>>> than forcing each handler to ensure the returned data matches the
>>> access size?
>>
>> I understand how this can be useful when we return all 1s.
>>
>> However, in most of the current cases, we already need to deal with the
>> masking because the data is extracted from a wider field (for instance, see
>> the vGIC emulation). For those handlers, I would argue it would be
>> concerning/ a bug if the handler return bits above the access size.
>> Although, this would only impact the guest itself.
> 
> Even if there was a bug in the handler, it would be mitigated by the
> truncation done in io.c.
> 
>> So overall, this seems to be a matter of taste and I don't quite (yet) see
>> the benefits to do it in io.c. Regardless that...
> 
> It's up to you really, it's all ARM code so I don't really have a
> stake.  IMO it makes the handlers more complicated and fragile.

I will let the other Arm folks commenting on it.

> 
> If nothing else I would at least add an ASSERT() in io.c to ensure
> that the data returned from the handler matches the size constrains
> you expect.
That would be a good idea.

> 
>>>
>>> IOW, something like:
>>>
>>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>>> index 96c740d5636c..b7e12df85f87 100644
>>> --- a/xen/arch/arm/io.c
>>> +++ b/xen/arch/arm/io.c
>>> @@ -37,6 +37,7 @@ static enum io_state handle_read(const struct mmio_handler *handler,
>>>            return IO_ABORT;
>>>
>>>        r = sign_extend(dabt, r);
>>> +    r = r & GENMASK_ULL((1U << dabt.size) * 8 - 1, 0);
>>
>> ... in some case we need to sign extend up to the width of the register
>> (even if the access is 8-byte). So we would need to do the masking *before*
>> calling sign_extend().
> 
> I would consider doing the truncation in sign_extend() if suitable,
> even if that's doing more than what the function name implies.

If we decide to do a general truncation, then I would rather prefer if 
it happens outside of sign_extend(). Or the function needs to be renamed 
(I can't find a good name so far).

Cheers,

-- 
Julien Grall

