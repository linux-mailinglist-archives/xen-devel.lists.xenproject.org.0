Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 545BF4C4309
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 12:04:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279025.476535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNYO8-0006Ez-03; Fri, 25 Feb 2022 11:03:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279025.476535; Fri, 25 Feb 2022 11:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNYO7-0006Ce-TA; Fri, 25 Feb 2022 11:03:51 +0000
Received: by outflank-mailman (input) for mailman id 279025;
 Fri, 25 Feb 2022 11:03:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nNYO6-0006CY-HC
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 11:03:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNYO6-000837-2F; Fri, 25 Feb 2022 11:03:50 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.31.13]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNYO5-0004Rf-SC; Fri, 25 Feb 2022 11:03:50 +0000
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
	bh=ktE0Dj4oZ1ofEtmAcjdTr2AUC6s3WDLEPv9T0wQd7tw=; b=VSm0qse2wCDHe9ASlQUeL6arQ6
	rcYPLbprTfBUVBT8To9n1ky/J2TMBal4PjJacco8JIGalKRzMFp2mvTuGZG7RaT330IgXSNPrL7n2
	bl2zoGIxh0MRPwvBferfOhgJeMPF9HBF5azfWK4z2QQeHux45F0K8vM66hbrHcULE+0M=;
Message-ID: <9afd3969-cd64-4729-b94a-e4400f2c1087@xen.org>
Date: Fri, 25 Feb 2022 11:03:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] xen/arm: Avoid integer overflow using
 MIDR_IMPLEMENTOR_MASK
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Michal Orzel <michal.orzel@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220225083854.6371-1-michal.orzel@arm.com>
 <dc161f7e-63c8-0e14-0c1f-51b1318aab2a@xen.org>
 <42974ed3-9075-a679-188e-1771f5e604b3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <42974ed3-9075-a679-188e-1771f5e604b3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 25/02/2022 10:59, Andrew Cooper wrote:
> On 25/02/2022 10:54, Julien Grall wrote:
>> Hi Michal,
>>
>> On 25/02/2022 08:38, Michal Orzel wrote:
>>> Value of macro MIDR_IMPLEMENTOR_MASK exceeds the range of integer
>>> and can lead to overflow. Currently there is no issue as it is used
>>> in an expression implicitly casted to u32 in MIDR_IS_CPU_MODEL_RANGE.
>>> To avoid possible problems, fix the macro.
>>
>> Correct me if I am wrong, it sounds like this is only for hardening
>> purpose at the moment.
>>
>> As this code is coming from Linux, I would prefer if we first upstream
>> to Linux and then port to Xen once merged.
> 
> Well.  The expression is undefined behaviour in C, because of shifting
> into the sign bit.
> 
> In principle, the compiler is free to optimise is_affected_midr_range()
> to "return true" as a consequence, even if compilers tend not to be that
> malicious.

Are you arguing against fixing Linux first and the backport it to Xen?

Cheers,

-- 
Julien Grall

