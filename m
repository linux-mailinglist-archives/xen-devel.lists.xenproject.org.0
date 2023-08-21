Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 176677826E6
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 12:17:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587478.918864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY1xr-0004Qe-2l; Mon, 21 Aug 2023 10:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587478.918864; Mon, 21 Aug 2023 10:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY1xq-0004OA-Vj; Mon, 21 Aug 2023 10:16:50 +0000
Received: by outflank-mailman (input) for mailman id 587478;
 Mon, 21 Aug 2023 10:16:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qY1xp-0004O4-5A
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 10:16:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qY1xo-0002ju-Fh; Mon, 21 Aug 2023 10:16:48 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qY1xo-0007Uv-Ai; Mon, 21 Aug 2023 10:16:48 +0000
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
	bh=Jp2sqK7b41yw99NSeeg/Az1LcvQzHQ796aMizxulcRw=; b=CcphioY9+DRDchGko/BJ9dacO/
	JK3WDi+OeLHwBobmEIZfIg2rcSsRx82FJs2bfoPAmykBUB4xJ6Hz3EQr1+kR/NvMdCJIGKlGUISOU
	9HkSAraXCDYTxTLr//5UCNDIAczEfqCwJzGllmxZ2Kb0YfxBetdS9l3eKCR4NRi8/0UE=;
Message-ID: <e2bb3025-e1e7-451f-8cdd-5d7ca14a9886@xen.org>
Date: Mon, 21 Aug 2023 11:16:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] xen/arm64: Split and move MMU-specific head.S to
 mmu/head.S
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Penny Zheng <Penny.Zheng@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-5-Henry.Wang@arm.com>
 <bffdb783-fd63-4a93-b80b-42634643b2d3@xen.org>
 <5111F5D4-49E0-45B2-B58A-EE2F178E65AE@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5111F5D4-49E0-45B2-B58A-EE2F178E65AE@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 21/08/2023 10:29, Henry Wang wrote:
>> On Aug 21, 2023, at 17:18, Julien Grall <julien@xen.org> wrote:
>> On 14/08/2023 05:25, Henry Wang wrote:
>>> The MMU specific code in head.S will not be used on MPU systems.
>>> Instead of introducing more #ifdefs which will bring complexity
>>> to the code, move MMU related code to mmu/head.S and keep common
>>> code in head.S. Two notes while moving:
>>> - As "fail" in original head.S is very simple and this name is too
>>>    easy to be conflicted, duplicate it in mmu/head.S instead of
>>>    exporting it.
>>> - Use ENTRY() for enable_secondary_cpu_mm, enable_boot_cpu_mm and
>>>    setup_fixmap to please the compiler after the code movement.
>>
>> I am not sure I understand why you are saying "to please the compiler" here. Isn't it necessary for the linker (not the compiler) to find the function? And therefore there is no pleasing (as in this is not a bug in the toolchain).
> 
> Yes it meant to be linker, sorry for the confusion. What I want to express is
> without the ENTRY(), for example if we remove the ENTRY() around the
> setup_fixmap(), we will have:
> 
> ```
> aarch64-none-linux-gnu-ld: prelink.o: in function `primary_switched':
> /home/xinwan02/repos_for_development/xen_playground/xen/xen/arch/arm/arm64/head.S:278: undefined reference to `setup_fixmap'
> /home/xinwan02/repos_for_development/xen_playground/xen/xen/arch/arm/arm64/head.S:278:(.text.header+0x1a0): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `setup_fixmap'
> make[2]: *** [arch/arm/Makefile:95: xen-syms] Error 1
> make[1]: *** [build.mk:90: xen] Error 2
> make: *** [Makefile:598: xen] Error 2
> ```
> 
> I will use the word “linker” in v6 if you agree.

The sentence also need to be reworded. How about:

"Use ENTRY() for ... as they will be used externally."

> 
>>
>> Other than that, the split looks good to me.
> 
> May I please take this as a Reviewed-by tag? I will add the tag if you are
> happy with that.

Sure. Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

