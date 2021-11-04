Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBCB44580F
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 18:11:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221801.383688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1migH1-0005eV-3X; Thu, 04 Nov 2021 17:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221801.383688; Thu, 04 Nov 2021 17:11:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1migH1-0005bW-0T; Thu, 04 Nov 2021 17:11:35 +0000
Received: by outflank-mailman (input) for mailman id 221801;
 Thu, 04 Nov 2021 17:11:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1migGz-0005bQ-70
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 17:11:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1migGw-0000eT-R0; Thu, 04 Nov 2021 17:11:30 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[10.95.146.237]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1migGw-0005ur-Kx; Thu, 04 Nov 2021 17:11:30 +0000
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
	bh=OAmyiZ0qzBRRYXBld9AroZiwwpPHFWtdzBbX+cGfx6U=; b=bVSdhBZTtsS2XKr+ekTzzvMmZ0
	mEJiVelYpqClsHPeIlsyFxxm+KtL8y8f16Ou56zwC8t4chxSKi8fwTYGfCZz8+y5MlaAOblQxH29K
	rgGXcbqw4XJToX1xDRfkb+Vk0ZaMFlEXRcW769mpLqhMpjjfW3gkuxCGMUYxjJCC63+Q=;
Message-ID: <8ff2dc1a-b640-ec2a-810a-c135f0399130@xen.org>
Date: Thu, 4 Nov 2021 17:11:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [patch-4.16] arm/smmuv1,v2: Protect smmu master list with a lock
To: Michal Orzel <michal.orzel@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <iwj@xenproject.org>
Cc: Julien Grall <julien.grall.oss@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20211026122903.15042-1-michal.orzel@arm.com>
 <e5632a4e-db98-41b4-1045-2b3532c098fa@xen.org>
 <70c30a6c-b779-805e-079a-41bb484894b9@xen.org>
 <cb452c0c-ccde-7798-c403-f972b48a2c46@arm.com>
 <01545115-e82e-2a9d-a8e4-da9676080c0f@xen.org>
 <alpine.DEB.2.21.2110271557570.20134@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2SSgG7a87_xTGT5LeNLgubOLQf1+dbnrsTsP8_p5ErJg@mail.gmail.com>
 <alpine.DEB.2.21.2110271658330.20134@sstabellini-ThinkPad-T480s>
 <4554621d-63da-ea3e-e56a-4e01d0cef347@xen.org>
 <alpine.DEB.2.21.2110281311030.20134@sstabellini-ThinkPad-T480s>
 <24959.49895.14808.77881@mariner.uk.xensource.com>
 <alpine.DEB.2.21.2111011341480.20134@sstabellini-ThinkPad-T480s>
 <9955c390-e5a4-0e58-f0db-b070249d3b16@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9955c390-e5a4-0e58-f0db-b070249d3b16@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/11/2021 09:18, Michal Orzel wrote:
> Hello,

Hi Michal,

> 
> On 01.11.2021 21:51, Stefano Stabellini wrote:
>> On Mon, 1 Nov 2021, Ian Jackson wrote:
>>> Stefano Stabellini writes ("Re: [patch-4.16] arm/smmuv1,v2: Protect smmu master list with a lock"):
>>>> In regards to this specific patch and also the conversation about 4.16
>>>> or 4.17: I think it would be fine to take this patch in 4.16 in its
>>>> current form. Although it is not required because PCI passthrough is
>>>> not going to be complete in 4.16 anyway, I like that this patch makes
>>>> the code consistent in terms of protection of rbtree accesses.  With
>>>> this patch the arm_smmu_master rbtree is consistently protected from
>>>> concurrent accesses. Without this patch, it is sometimes protected and
>>>> sometimes not, which is not great.
>>>
>>> It sounds like this is a possible latent bug, or at least a bad state
>>> of the code that might lead to the introduction of bad bugs later.
>>>
>>> So I think I understand the upside.
>>>
>>>> So I think that is something that could be good to have in 4.16. But
>>>> like you said, the patch is not strictly required so it is fine either
>>>> way.
>>>
>>> Can you set out the downside for me too ?  What are the risks ?  How
>>> are the affected code paths used in 4.16 ?
>>>
>>> A good way to think about this is: if taking this patch for 4.16
>>> causes problems, what would that look like ?
>>
>> The patch affects the SMMU code paths that are currently in-use for
>> non-PCI devices which are currently supported. A bug in this patch could
>> cause a failure to setup the SMMU for one or more devices. I would
>> imagine that it would manifest probably as either an error or an hang
>> (given that it is adding spin locks) early at boot when the SMMU is
>> configured.
>>
>> The validation of this patch would mostly happen by review: it is the
>> kind of patch that changes some "return -1" into "goto err".
>>
> 
> In order not to leave this patch high and dry:
> I can see that Stefano and Bertrand are in favor of this patch and
> Julien is rather against. Therefore I wanted to ask what are we doing with this patch.
My main objection is on the process. We should not merge patch that 
doesn't fix a real issue at this stage of this release.

That said, the patch is low risk and both Stefano/Bertrand are for it. So...

> Do we want it for 4.16?

... Ian can we get your release-acked-by?

Cheers,

-- 
Julien Grall

