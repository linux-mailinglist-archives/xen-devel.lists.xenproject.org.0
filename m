Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E225AFFB5
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 10:56:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401022.642680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVqqr-0001Lf-6K; Wed, 07 Sep 2022 08:56:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401022.642680; Wed, 07 Sep 2022 08:56:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVqqr-0001Iw-3W; Wed, 07 Sep 2022 08:56:05 +0000
Received: by outflank-mailman (input) for mailman id 401022;
 Wed, 07 Sep 2022 08:56:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVqqp-0001IY-14
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 08:56:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVqql-00010v-QQ; Wed, 07 Sep 2022 08:55:59 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVqql-0006Zo-KB; Wed, 07 Sep 2022 08:55:59 +0000
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
	bh=B01d5A5UZeg1R63qNolkraTFRmwchaF2vHwBf30UH0Q=; b=bMf9iEH583uIfInoRLNhQnE/mH
	/O8o6m1EAthB/zaQ5xOobD9lerwjxvTiD47ZgvFq18Lox2S+UtFJTFehY59t+oqRrhyEcLTIMrZNH
	M+CVT8Cob3A0oXIFB0s+fElt0RuFcuTvkrbrXBZ2nSTRLBP+k/zMd5gqEdBMrFi7R7ho=;
Message-ID: <57d2eb45-bdbe-02b3-4ada-10ff278d699b@xen.org>
Date: Wed, 7 Sep 2022 09:55:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH] xen/arm: acpi: Include header file for version number
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "leo.yan@linaro.org" <leo.yan@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220906113112.106995-1-leo.yan@linaro.org>
 <d8ae8cce-0b05-a920-7439-3a6f5c3520f3@xen.org>
 <DFE32545-1B8A-4121-9D34-FE121CF4D3A7@arm.com>
 <79fa1351-18e5-0a54-c50d-c9b09a6b3d9e@xen.org>
 <5C05BF68-C788-47AF-A967-338875740D49@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5C05BF68-C788-47AF-A967-338875740D49@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 07/09/2022 09:53, Bertrand Marquis wrote:
>>> Otherwise if we start adding those kinds of checks, we will have to add them in at least 3 places in xen code.
>>
>> The solution I proposed above is easy to implement right now. My gut feeling is tweaking __stringify (or else) will take a bit more time.
>>
>> If you (or Leo) can come up with a solution quickly then fine. Otherwise, I think we still want some hardening for backporting purpose.
> 
> I think a define in compile.h using stringify is the easiest solution:

Ah! I thought you were suggesting to tweak __stringify. This is ...
> 
> #define XEN_STR_VERSION "__stringify(XEN_VERSION)"."__stringify(XEN_SUBVERSION)”
> 
> And then change the code in the following source code to use it:
> arch/arm/domain_build.c
> arch/arm/acpi/domain_build.c
> common/efi/boot.c

... much better.

Cheers,

-- 
Julien Grall

