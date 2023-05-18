Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7D37087E9
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 20:39:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536509.834901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pziWx-0002em-Ev; Thu, 18 May 2023 18:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536509.834901; Thu, 18 May 2023 18:39:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pziWx-0002bV-CA; Thu, 18 May 2023 18:39:15 +0000
Received: by outflank-mailman (input) for mailman id 536509;
 Thu, 18 May 2023 18:39:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pziWv-0002bP-Ao
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 18:39:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pziWr-0001nb-2B; Thu, 18 May 2023 18:39:09 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.26.27]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pziWq-0008FY-S2; Thu, 18 May 2023 18:39:08 +0000
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
	bh=BcYQED4F2cqPOXbxdtEQiFqYi1G038BgSr3Wel6ihBY=; b=vAdSuWg3p8DwIA8T4usdohmXMv
	776EPTI+m7bGGgaBoVM9oInuC5XQwTTdwwZ4wmPhi+9AiC3OUDRCCcEuKnvlCfKqcgsdduvsVnCie
	Pn/csV0sQXlSSOJuvcrG6Q+2VsAb3AvJl1xHZ5rIGqhHlsPs32rIMoTUpgPgVixcD+PE=;
Message-ID: <ccbb32bb-56cc-11c0-b3d6-f4506dadc541@xen.org>
Date: Thu, 18 May 2023 19:39:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v6 07/12] xen: enable Dom0 to use SVE feature
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>, Jan Beulich <jbeulich@suse.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-8-luca.fancellu@arm.com>
 <589fdeec-a0cf-1dc0-18b2-bd20c76832d2@suse.com>
 <7064B21E-414F-4FB5-BCC9-349388B32EA5@arm.com>
 <11e92082-6603-7180-f405-b96a14d430dd@suse.com>
 <37C35493-D5DA-4102-9B93-0045732E6F94@arm.com>
 <d49f1df6-ac49-27ef-d55f-b6284c76b055@suse.com>
 <5535FDB0-989E-4536-AF7B-8F0BB561667A@arm.com>
 <bd064b44-3531-a1b0-a7a8-1ad7ae434394@suse.com>
 <300BE89F-CA37-4A28-9CC5-5875E10D4A0C@arm.com>
 <a268313d-03be-9281-3627-c38115d3e5de@suse.com>
 <B534E482-71BF-4C5F-B9A8-3D567367F7AA@arm.com>
 <f9e631e1-02bb-a565-4df4-ccbb66fbaf49@suse.com>
 <C1815EB3-E875-4D49-831A-56E152BF4B61@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <C1815EB3-E875-4D49-831A-56E152BF4B61@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

Sorry for the late reply.

On 25/04/2023 07:04, Luca Fancellu wrote:
> 
> 
>> On 24 Apr 2023, at 17:10, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 24.04.2023 17:43, Luca Fancellu wrote:
>>>> On 24 Apr 2023, at 16:41, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 24.04.2023 17:34, Luca Fancellu wrote:
>>>>>> On 24 Apr 2023, at 16:25, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 24.04.2023 17:18, Luca Fancellu wrote:
>>>>>>> Oh ok, I don’t know, here what I get if for example I build arm32:
>>>>>>>
>>>>>>> arm-linux-gnueabihf-ld -EL -T arch/arm/xen.lds -N prelink.o \
>>>>>>> ./common/symbols-dummy.o -o ./.xen-syms.0
>>>>>>> arm-linux-gnueabihf-ld: prelink.o: in function `create_domUs':
>>>>>>> (.init.text+0x13464): undefined reference to `sve_domctl_vl_param'
>>>>>>
>>>>>> In particular with seeing this: What you copied here is a build with the
>>>>>> series applied only up to this patch? I ask because the patch here adds a
>>>>>> call only out of create_dom0().
>>>>>
>>>>> No I’ve do the changes on top of the serie, I’ve tried it now, only to this patch and it builds correctly,
>>>>> It was my mistake to don’t read carefully the error output.
>>>>>
>>>>> Anyway I guess this change is not applicable because we don’t have a symbol that is plain 0 for domUs
>>>>> to be placed inside create_domUs.
>>>>
>>>> Possible, but would you mind first telling me in which other patch(es) the
>>>> further reference(s) are being introduced, so I could take a look without
>>>> (again) digging through the entire series?
>>>
>>> Sure, the other references to the function are introduced in "xen/arm: add sve property for dom0less domUs” patch 11
>>
>> Personally I'm inclined to suggest adding "#ifdef CONFIG_ARM64_SVE" there.
>> But I guess that may again go against your desire to not ignore inapplicable
>> options. Still I can't resist to at least ask how an "sve" node on Arm32 is
>> different from an entirely unknown one.
> 
> It would be ok for me to use #ifdef CONFIG_ARM64_SVE and fail in the #else branch,
> but I had the feeling in the past that Arm maintainers are not very happy with #ifdefs, I might
> be wrong so I’ll wait for them to give an opinion and then I will be happy to follow.

IIRC, your suggestion is for patch #11. In this case, my preference is 
the #ifdef + throwing an error in the #else branch. This would avoid to 
silently ignore the property if SVE is not enabled (both Bertrand and I 
agreed this should not be ignored, see [1]).

Cheers,

[1] 
https://lore.kernel.org/all/7614AE25-F59D-430A-9C3E-30B1CE0E1580@arm.com/

-- 
Julien Grall

