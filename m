Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2CA94791E
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 12:12:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771977.1182410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1saugU-0000Sq-7x; Mon, 05 Aug 2024 10:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771977.1182410; Mon, 05 Aug 2024 10:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1saugU-0000Pk-53; Mon, 05 Aug 2024 10:11:22 +0000
Received: by outflank-mailman (input) for mailman id 771977;
 Mon, 05 Aug 2024 10:11:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1saugT-0000PL-H5
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 10:11:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1saugS-0005Dz-GL; Mon, 05 Aug 2024 10:11:20 +0000
Received: from [15.248.2.233] (helo=[10.24.67.21])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1saugS-0003YX-3m; Mon, 05 Aug 2024 10:11:20 +0000
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
	bh=raSY8yO7Vpumwv+IdAqNEvq7rYgNQoXS7S2GaDX7I+U=; b=fNFo9kSPwCrI/3k6MxZ9rFD2Ip
	xU44EnJT89Zj3HZNV1+NLGE7ZzLXAc6AKt3ZON/dkQcb1JakofmdjYmAQBOLxQhRJ4mP5K8ccUuw8
	ngWWOifiBlnmOEGu0DVocpFoEw66BtynWVMR0Hs1R8nESbsTKxihl42U7of6aLkvJMpk=;
Message-ID: <20ab6b79-3764-4af3-9631-942b90aa4695@xen.org>
Date: Mon, 5 Aug 2024 11:11:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/9] xen/device-tree: Move Arm's setup.c bootinfo
 functions to common
Content-Language: en-GB
To: oleksii.kurochko@gmail.com, xen-devel@lists.xenproject.org
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
 <102f8b60c55cdf2db5890b9fb1c2fb66e61c4a67.1721834549.git.oleksii.kurochko@gmail.com>
 <309d42dc-e540-4fbe-a69e-2be6414deb70@xen.org>
 <3c03ff921b8c1950eb8376e94cdfb490ea28bf4b.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3c03ff921b8c1950eb8376e94cdfb490ea28bf4b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/08/2024 10:44, oleksii.kurochko@gmail.com wrote:
>> [...]
>>
>>> --- /dev/null
>>> +++ b/xen/common/device-tree/bootinfo.c
>>> @@ -0,0 +1,459 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +/*
>>> + * Derived from $xen/arch/arm/setup.c.
>>
>> I would suggest to mention the version of Xen this is derived from.
> Will it be enough only Xen version without commit hash?

I think so, the code you moved has not changed recently since 4.19.

Cheers,

-- 
Julien Grall


