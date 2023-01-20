Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 846ED6752A9
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 11:40:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481661.746710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIoo0-0005ci-Lg; Fri, 20 Jan 2023 10:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481661.746710; Fri, 20 Jan 2023 10:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIoo0-0005ZN-Hy; Fri, 20 Jan 2023 10:39:32 +0000
Received: by outflank-mailman (input) for mailman id 481661;
 Fri, 20 Jan 2023 10:39:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pIonz-0005ZH-7s
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 10:39:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIony-00024Q-RM; Fri, 20 Jan 2023 10:39:30 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[10.95.149.154]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIony-0007Xj-LY; Fri, 20 Jan 2023 10:39:30 +0000
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
	bh=WsIAY1z2gmgVMlNi6lVg1yNFcFBcKw8eZFIw0xMu4Aw=; b=aYSs4wpyODB17ql1LWmfs3xKJ3
	IBdepRPqLelTaVRdc3GOZkU/u+o5ayc35ZqR1I4bWelgV8GT7T3/hNMUjpj3hZYBg8YYApgIY6yzU
	Crl+ymGBnWwEcObv5kJGffd1jxH4NF5k+hVTsLtf+fSsePIyuK9rZZAJsNqYksbHih9Q=;
Message-ID: <8b4ded2d-ddce-c53a-4c43-4c82900169b6@xen.org>
Date: Fri, 20 Jan 2023 10:39:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v2 08/11] xen/arm: guest_walk: LPAE specific bits should be
 enclosed within "ifndef CONFIG_ARM_PA_32"
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-9-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2301191541460.731018@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2301191541460.731018@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 19/01/2023 23:43, Stefano Stabellini wrote:
> On Tue, 17 Jan 2023, Ayan Kumar Halder wrote:
>> In the subsequent patch, we introduce "CONFIG_ARM_PA_32" to support
>> 32 bit physical addresses. Thus, the code specific to
>> "Large Page Address Extension" (ie LPAE) should be enclosed within
>> "ifndef CONFIG_ARM_PA_32".
>>
>> Refer xen/arch/arm/include/asm/short-desc.h, "short_desc_l1_supersec_t"
>> unsigned int extbase1:4;    /* Extended base address, PA[35:32] */
>> unsigned int extbase2:4;    /* Extended base address, PA[39:36] */
>>
>> Thus, extbase1 and extbase2 are not valid when 32 bit physical addresses
>> are supported.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> 
> This patch should be merged with patch 9: we shouldn't start to use a
> new kconfig symbol before it is defined.

I have asked the adaptation to be in a separate patch to avoid having a 
melting-pot patch.

So if you want the new Kconfig to be defined first, then we should 
reshuffle it.

BTW, the reshuffle will likely be necessary if you want to check for 
truncation in earlier patch.

Cheers,

-- 
Julien Grall

