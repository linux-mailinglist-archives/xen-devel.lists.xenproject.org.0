Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1337C8099
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 10:48:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616311.958216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrDpW-0002GG-Je; Fri, 13 Oct 2023 08:47:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616311.958216; Fri, 13 Oct 2023 08:47:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrDpW-0002Cn-Fa; Fri, 13 Oct 2023 08:47:34 +0000
Received: by outflank-mailman (input) for mailman id 616311;
 Fri, 13 Oct 2023 08:47:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qrDpV-0002Cd-8a
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 08:47:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrDpU-0002gw-T8; Fri, 13 Oct 2023 08:47:32 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrDpU-0002qa-MW; Fri, 13 Oct 2023 08:47:32 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=UvX11YVf1pUlYkVl2Xg61NZ+dyMvLICUkMDJofb6RBE=; b=n46eLYjI26drwLj4NMQye8m/L9
	J2znjOyAz8epwoLVvWAPOwg9nu0Zoi5TkhY7mO0VOpPJANJa++KNR+wtMZ5COb/LPJ6Du+jESjNrw
	FURf/wFevsrGrq8ry201WoNjUEjkvftT7vC7Rg62KzJbNUsQvQikQVSQPNWD2vrD7KOY=;
Message-ID: <60510bb3-5eac-4944-9954-25f7296421f2@xen.org>
Date: Fri, 13 Oct 2023 09:47:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Validate generic timer frequency
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Henry Wang <Henry.Wang@arm.com>, Michal Orzel <michal.orzel@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230928123435.2802-1-michal.orzel@amd.com>
 <d406c4c6-07f7-442f-8bef-8ba42308ae93@xen.org>
 <4894d46e-97ab-434f-b637-d516db6564ea@xen.org>
 <75bb3d92-af1c-4165-8ebd-1c17590361cb@amd.com>
 <B95911BA-5965-4100-A1FD-0E687424020B@arm.com>
 <e42ffdda-5460-4692-abdd-20a61b984829@xen.org>
In-Reply-To: <e42ffdda-5460-4692-abdd-20a61b984829@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 11/10/2023 09:59, Julien Grall wrote:
> 
> 
> On 11/10/2023 08:01, Henry Wang wrote:
>> Hi Michal, Julien,
>>
>>> On Oct 11, 2023, at 14:54, Michal Orzel <michal.orzel@amd.com> wrote:
>>>
>>> Hi Julien, Henry,
>>>
>>> On 10/10/2023 16:48, Julien Grall wrote:
>>>>
>>>>
>>>> (+ Henry)
>>>>
>>>> Hi Michal,
>>>>
>>>> On 29/09/2023 08:38, Julien Grall wrote:
>>>>> Hi Michal,
>>>>>
>>>>> On 28/09/2023 13:34, Michal Orzel wrote:
>>>>>> Generic timer dt node property "clock-frequency" (refer Linux dt 
>>>>>> binding
>>>>>> Documentation/devicetree/bindings/timer/arm,arch_timer.yaml) is 
>>>>>> used to
>>>>>> override the incorrect value set by firmware in CNTFRQ_EL0. If the 
>>>>>> value
>>>>>> of this property is 0 (i.e. by mistake), Xen would continue to 
>>>>>> work and
>>>>>> use the value from the sysreg instead. The logic is thus incorrect 
>>>>>> and
>>>>>> results in inconsistency when creating timer node for domUs:
>>>>>>   - libxl domUs: clock_frequency member of struct 
>>>>>> xen_arch_domainconfig
>>>>>>     is set to 0 and libxl ignores setting the "clock-frequency" 
>>>>>> property,
>>>>>>   - dom0less domUs: "clock-frequency" property is taken from 
>>>>>> dt_host and
>>>>>>     thus set to 0.
>>>>>>
>>>>>> Property "clock-frequency" is used to override the value from sysreg,
>>>>>> so if it is also invalid, there is nothing we can do and we shall 
>>>>>> panic
>>>>>> to let user know about incorrect setting. Going even further, we 
>>>>>> operate
>>>>>> under assumption that the frequency must be at least 1KHz (i.e. 
>>>>>> cpu_khz
>>>>>> not 0) in order for Xen to boot. Therefore, introduce a new helper
>>>>>> validate_timer_frequency() to verify this assumption and use it to 
>>>>>> check
>>>>>> the frequency obtained either from dt property or from sysreg.
>>>>>>
>>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>>
>>>>> Acked-by: Julien Grall <jgrall@amazon.com>
>>>>
>>>> Going through the list of pending patches, I noticed Henry wasn't CCed.
>>>> Is this patch intended for Xen 4.18? If so, can you provide some
>>>> reasoning why would want it?
>>> Strictly speaking, lack of "for-4.18" prefix indicates that I did not 
>>> particularly aim for 4.18.
> 
> I have seen a mix. Hence why I asked in case this was expected. To avoid 
> confusion during the freeze period, I tend to also tag e-mail for the 
> next release (e.g. for-next/for-4.19). So the intention is clear.
> 
>>> Benefits:
>>> - fixes the invalid logic the consequence of which might result in 
>>> inconsistency when booting
>>>   the same OS as libxl domU and dom0less domU.
>>> - prevents spreading out the error condition (i.e. rate < 1KHZ) that 
>>> can lead to e.g. Xen inability to schedule,
>>>   by panicing with proper msg
>>> Risks:
>>> - early init code, no critical path, in case of an error, panic 
>>> returned with proper msg - no risks AFAICT
>>
>> Thanks for the explanation, this looks like an improvement for the
>> current code to me so I am fine with including it in 4.18
>>
>> Release-acked-by: Henry Wang <Henry.Wang@arm.com>
> 
> Thanks. I will commit the patch later today.

Now committed. Sorry for the delay.

Cheers,

-- 
Julien Grall

