Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EF1B42D2E
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 01:05:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109171.1458964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utwWU-0006bF-8z; Wed, 03 Sep 2025 23:04:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109171.1458964; Wed, 03 Sep 2025 23:04:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utwWU-0006Yr-65; Wed, 03 Sep 2025 23:04:14 +0000
Received: by outflank-mailman (input) for mailman id 1109171;
 Wed, 03 Sep 2025 23:04:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1utwWS-0006Yl-Sb
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 23:04:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1utwWR-004nWw-1O;
 Wed, 03 Sep 2025 23:04:11 +0000
Received: from [2a02:8012:3a1:0:2cb0:b4e5:ef93:763c]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1utwWR-00Ex9P-1A;
 Wed, 03 Sep 2025 23:04:11 +0000
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
	bh=RhhQYyZ5A3pujMZNcLTiHu3xupigp4QFFgdnGH0gUug=; b=bcdfrGjgNJEEnQxya0kSANhJ/M
	bbCwJogKGmAQp4oKpudL/lA4aMc+AHKkQemn9BbOznSi9/52QtIjUdeKMAsZQmtp7Fg+QKKAoxQjQ
	sTubUQvg7It/UZBevx9Ax00CHYRPrimch000pmF/ci7sndZ1fb04xH6t51HM2Eb2eZ3U=;
Message-ID: <13ed364c-bec3-4c3e-a451-7bc312b2db9d@xen.org>
Date: Thu, 4 Sep 2025 00:04:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1756908472.git.leonid_komarianskyi@epam.com>
 <345da260fcb3bb400834f8a59dacfda8b37440a1.1756908472.git.leonid_komarianskyi@epam.com>
 <cb34378c-95c7-4618-8aeb-a7b7c5c97f2d@gmail.com> <87plc7tdxx.fsf@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <87plc7tdxx.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 03/09/2025 22:37, Volodymyr Babchuk wrote:
> Hi Oleksandr,
> 
> Oleksandr Tyshchenko <olekstysh@gmail.com> writes:
> 
> 
> [...]
> 
>>> +static inline uint32_t vgic_get_reg_offset(uint32_t reg, uint32_t spi_base,
>>> +                                           uint32_t espi_base)
>>> +{
>>> +    if ( reg < espi_base )
>>> +        return reg - spi_base;
>>> +    else
>>> +        return reg - espi_base;
>>> +}
>>
>> I am wondering (I do not request a change) whether
>> vgic_get_reg_offset() is really helpfull,
>> e.g. is
>>   offset = vgic_get_reg_offset(reg, GICD_IPRIORITYR, GICD_IPRIORITYRnE);
>> much better than:
>>   offset = reg < GICD_IPRIORITYRnE ? reg - GICD_IPRIORITYR : reg -
>>   GICD_IPRIORITYRnE;
 >>>
> IMO, it is easy to make a mistake, because you need to write register
> name 3 times. Can cause errors during copy-pasting.

+1.

  But I saw clever
> trick by Mykola Kvach, something like this:
> 
> #define vgic_get_reg_offset(addr, reg_name) ( addr < reg_name##nE ? \
>   addr - reg_name : addr - reg_name##nE )
> 
> And then you can just use this as
> 
> offset = vgic_get_reg_offset(reg, GICD_IPRIORITYR)
> 
> I don't know what maintainers think about this type of preprocessor
> trickery, but in my opinion it is justified in this case, because it
> leaves less room for a mistake.

I don't have a strong opinion between the macro version or the static 
inline helper. However:
   * for the macro version, you want to store 'addr' in a local variable 
to ensure it is only evaluated once.
   * for both case, I would prefer if we assert (for the static inline 
helper) or use BUILD_BUG_ON() to confirm that spi_base < espi_base

Cheers,

-- 
Julien Grall


