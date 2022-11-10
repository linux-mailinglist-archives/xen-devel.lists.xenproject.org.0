Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E29624A3C
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 20:06:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442142.696175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otCs1-0005lT-6I; Thu, 10 Nov 2022 19:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442142.696175; Thu, 10 Nov 2022 19:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otCs1-0005ii-3G; Thu, 10 Nov 2022 19:05:49 +0000
Received: by outflank-mailman (input) for mailman id 442142;
 Thu, 10 Nov 2022 19:05:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1otCrz-0005iU-VJ
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 19:05:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1otCrz-0006rW-Ic; Thu, 10 Nov 2022 19:05:47 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.6.115]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1otCrz-0001t4-CB; Thu, 10 Nov 2022 19:05:47 +0000
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
	bh=T0QrY3FVUdYlbls3nIzMMlfO9sggwM+/nKfZzAPrt6A=; b=ZO6FeISZAZnPTYd86BumdqW8nx
	kXeWWZU1HQfNULjvLfJvCv9daEa1zlK3clmgPshhJiu3Pc1CS5UUsGKImPwmU0OTUuikUOpI87x8o
	N8xiboCJyBTkWM04vi/ZHOLPasq5EC27TA0zYMx9bVCUfqgjZFRepJUoHAkOGRtJjSDo=;
Message-ID: <0c1600b2-0c71-2a94-86c5-e0eec85ca502@xen.org>
Date: Thu, 10 Nov 2022 19:05:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH for 4.17] arm: fix Kconfig symbol dependency on arm
 features
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
 Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221109140420.31007-1-luca.fancellu@arm.com>
 <BCBB4207-0B16-4AFC-BA80-E601FC63DDA2@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <BCBB4207-0B16-4AFC-BA80-E601FC63DDA2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 10/11/2022 08:46, Bertrand Marquis wrote:
>> On 9 Nov 2022, at 14:04, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>
>> The commit 3c2a14ea81c7 is introducing some unsupported arm features
>> that by default are disabled and are used for the cpufeature.c code.
>>
>> As they are disabled by default, a typo in the Kconfig symbol they
>> depend on has landed in the codebase unnoticed, instead of depending
>> on ARM64 which does not exist, fix the code to depend on ARM_64 that
>> is the intended symbol.
>>
>> Fixes: 3c2a14ea81c7 ("arm: Define kconfig symbols used by arm64 cpufeatures")
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> I think this should go in 4.17 as it is fixing an invalid depends in Kconfig.
> The change cannot create any issue as those config options are hidden and default to n at the moment.

Committed.

Cheers,

-- 
Julien Grall

