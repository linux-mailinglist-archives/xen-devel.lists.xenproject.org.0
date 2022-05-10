Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ECE521B7F
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 16:12:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325701.548384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noQbX-0001PW-MV; Tue, 10 May 2022 14:12:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325701.548384; Tue, 10 May 2022 14:12:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noQbX-0001Mk-Jb; Tue, 10 May 2022 14:12:47 +0000
Received: by outflank-mailman (input) for mailman id 325701;
 Tue, 10 May 2022 14:12:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1noQbV-0001LY-II
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 14:12:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1noQbV-0007Cj-65; Tue, 10 May 2022 14:12:45 +0000
Received: from [54.239.6.189] (helo=[192.168.24.150])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1noQbU-0000Sr-VU; Tue, 10 May 2022 14:12:45 +0000
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
	bh=PF0BN+jzVmzYpLhdi5IOIUWNCs8skRYGLmpOpdJtS6M=; b=mER6+lrzvuWvE1nR1uW4qjPtdx
	wE8g3CQ3zdem2yRoBLTLg1YgSQEdTSUkLfKW/vMUTy5Fmg5qWE6jdrrfDenldXxRwQ0wveHTxvH6p
	pueXEg3mdL66t9e4pnwVrl4G/D+Z0PyqFW5h61+xywVydDMQ9x7NjWlKg3k/svz3FvHM=;
Message-ID: <191159cc-f26d-f161-3f44-431507a6c270@xen.org>
Date: Tue, 10 May 2022 15:12:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v2] xen/arm: p2m don't fall over on FEAT_LPA enabled hw
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: xen-devel@lists.xenproject.org, stratos-dev@op-lists.linaro.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20220428103410.2723837-1-alex.bennee@linaro.org>
 <64d47797-3789-694b-0eb5-08fc7527ff5b@xen.org> <8735hhtrfd.fsf@linaro.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8735hhtrfd.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Alex,

On 10/05/2022 15:03, Alex Bennée wrote:
> 
> Julien Grall <julien@xen.org> writes:
> 
>> Hi Alex,
>>
>> On 28/04/2022 11:34, Alex Bennée wrote:
>>> When we introduced FEAT_LPA to QEMU's -cpu max we discovered older
>>> kernels had a bug where the physical address was copied directly from
>>> ID_AA64MMFR0_EL1.PARange field. The early cpu_init code of Xen commits
>>> the same error by blindly copying across the max supported range.
>>> Unsurprisingly when the page tables aren't set up for these greater
>>> ranges hilarity ensues and the hypervisor crashes fairly early on in
>>> the boot-up sequence. This happens when we write to the control
>>> register in enable_mmu().
>>> Attempt to fix this the same way as the Linux kernel does by gating
>>> PARange to the maximum the hypervisor can handle. I also had to fix up
>>> code in p2m which panics when it sees an "invalid" entry in PARange.
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Cc: Richard Henderson <richard.henderson@linaro.org>
>>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>>> Cc: Julien Grall <julien@xen.org>
>>> Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>>> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
>>
>> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> Will you pick this up via your tree or do I need to do something else to
> get it upstreamed? I guess it needs to go on master and last stable?

We only have one tree in Xen where committers (such as Stefano and I) 
will commit patches regularly to staging. Osstest will then push to 
master once the testing passed.

I have done that now. Interestingly, git am wasn't able to apply this 
patch. I had to do with:

42sh> git am --show-current-patch=diff | patch -p1
patching file xen/arch/arm/arm64/head.S
Hunk #1 succeeded at 474 (offset 1 line).
patching file xen/arch/arm/p2m.c
Hunk #1 succeeded at 32 with fuzz 2.
Hunk #2 succeeded at 2023 (offset -7 lines).
Hunk #3 succeeded at 2031 (offset -7 lines).
Hunk #4 succeeded at 2062 (offset -7 lines).

Which branch did you use for sending the patch?

Regarding stable, I will add the patch in my backport candidate list and 
send a list to Stefano when we prepare the backports.

Cheers,

-- 
Julien Grall

