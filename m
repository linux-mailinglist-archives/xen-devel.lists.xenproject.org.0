Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8F34970EE
	for <lists+xen-devel@lfdr.de>; Sun, 23 Jan 2022 11:32:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259659.448100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBaA2-000175-NF; Sun, 23 Jan 2022 10:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259659.448100; Sun, 23 Jan 2022 10:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBaA2-00014y-Ie; Sun, 23 Jan 2022 10:31:50 +0000
Received: by outflank-mailman (input) for mailman id 259659;
 Sun, 23 Jan 2022 10:31:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nBaA1-00014r-9e
 for xen-devel@lists.xenproject.org; Sun, 23 Jan 2022 10:31:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nBa9x-000252-Iw; Sun, 23 Jan 2022 10:31:45 +0000
Received: from [54.239.6.188] (helo=[192.168.0.182])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nBa9x-0007sT-2d; Sun, 23 Jan 2022 10:31:45 +0000
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
	bh=w0XxSOGH+XvHAsTVZiGIs6orEU6a6R8p0FKJzzQLeX4=; b=mrZWqYFlx4EH8K44mX+bJhu54T
	DlL79+2MkfICkuISGgJVeOpNsknQhv1tUQb8w0A/jVN+Hx2MdAVBNDxJGOSiZVl0gaX4SmxPjhTXP
	pkZPig1ld1BWedYQ7B1x6SYTrJNW46j7NGAaouhFEtMkJwv0drKeOnJB3Wx9itJI8xV4=;
Message-ID: <0052921f-c582-a07f-748a-0520b6beeafd@xen.org>
Date: Sun, 23 Jan 2022 14:31:38 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v4] xen/arm: Allow QEMU platform to be built with GICv2
To: Dongjiu Geng <gengdongjiu1@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <20220117064003.3367188-1-gengdongjiu1@gmail.com>
 <2a1a0dd5-b8a7-8072-2961-b1fbe9ec746a@xen.org>
 <CABSBigSOjoXABoYoe+SahQyX0P045YjgK3A=7yyxw_aX8nzTqg@mail.gmail.com>
 <9A7FAD16-3D4A-4C22-8288-A4719A993CDD@arm.com>
 <CABSBigSba0ENZ-AvDN7bPGNqS5zQKceL901BxhjR8pkRntgnrw@mail.gmail.com>
 <A5AC5212-A9FD-4027-893D-24A5A8DFD825@arm.com>
 <CABSBigRR+QEbPcibGmHAi1egY1XegPDZ_n2zmJftG49+-dOk4w@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CABSBigRR+QEbPcibGmHAi1egY1XegPDZ_n2zmJftG49+-dOk4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 19/01/2022 15:30, Dongjiu Geng wrote:
> Bertrand Marquis <Bertrand.Marquis@arm.com> 于2022年1月18日周二 17:17写道：
>>
>> Hi Dongju,
>>
>>> On 18 Jan 2022, at 08:58, Dongjiu Geng <gengdongjiu1@gmail.com> wrote:
>>>
>>> Bertrand Marquis <Bertrand.Marquis@arm.com> 于2022年1月18日周二 16:48写道：
>>>>
>>>> Hi Dongju,
>>>>
>>>>> On 18 Jan 2022, at 08:45, Dongjiu Geng <gengdongjiu1@gmail.com> wrote:
>>>>>
>>>>> Julien Grall <julien@xen.org> 于2022年1月17日周一 22:16写道：
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On 17/01/2022 10:40, Dongjiu Geng wrote:
>>>>>>> It turns out that QEMU has been supporting GICv2 virtualization since
>>>>>>> v3.1.0. So remove the dependencies on GICv3.
>>>>>>
>>>>>>
>>>>>> Technically, the current form of CONFIG_QEMU allows the same binary to
>>>>>> boot on QEMU with GICv2 or GICv3.
>>>>>>
>>>>>>> If we want to use GICv3,
>>>>>>> we can select the QEMU_LEGACY configuration.
>>>>>>
>>>>>> AFAIK, GICv3 is not a legacy feature... So it feels a bit odd to name it
>>>>>> like that (see more below).
>>>>>
>>>>> Legacy means QEMU platform only supports GICV3, now it can support
>>>>> both GICv2 and GICv3. The scope of support has been expanded
>>>>> Not mean GICv3 is a legacy feature.
>>>>
>>>> You might be misleading a bit here.
>>>> In the current configuration, Xen support GICv2, GICv3 and vgic.
>>>> The only thing not supported is actually the new VGIC but this is an unsupported feature not fully functional which shall be used with caution.
>>>>
>>>> What issue exactly do you have in Qemu configured for gicv2 when you use the default configuration ?
>>>
>>> I want to use NEW_VGIC with GICv2, but QEMU only select GICV3,  when
>>> GICv3 is select, the NEW_VGIC can not be used.   I try the NEW_VGIC
>>> with GICv2, not found issue. so I want to remove this limitation.
>>> If  you think we should not support NEW_VGIC feature,  we can ignore
>>> this patch.  thanks!
>>
>> Supporting GICv2 makes sense but using NEW_VGIC in Xen might not as it is not security supported and does not support ITS and MSIs.
>     It is surely that NEW_VGIC not support ITS and MSI.  but I think
> QEMU platform should not limit user select it.

The goal of the option CONFIG_<platform> is to select the minimal set of 
CONFIG_* to allow booting on a given platform. Given that QEMU is 
supporting both GICv2 and GICv3, then I think it is correct to select 
both options.

>  Selecting GICv2、GICv3
> or NEW_VGIC may be chosen by users. But I find user can select it at
> all.
> 
>>
>> Do you have a reason to use the NEW_VGIC implementation instead of the standard one ?
> 
> I add some features which is ported from KVM,  NEW_VGIC is refereed to
> KVM，so it easily integrate

Ok. So why does this needs to be done with CONFIG_QEMU? Can't you use 
defconfig + select the NEW_VGIC by hand?

Cheers,

-- 
Julien Grall

