Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEE858EECC
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 16:52:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383683.618887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLn3J-0003df-Ei; Wed, 10 Aug 2022 14:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383683.618887; Wed, 10 Aug 2022 14:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLn3J-0003bs-C5; Wed, 10 Aug 2022 14:51:21 +0000
Received: by outflank-mailman (input) for mailman id 383683;
 Wed, 10 Aug 2022 14:51:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oLn3I-0003bm-06
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 14:51:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oLn3H-0002sW-Ig; Wed, 10 Aug 2022 14:51:19 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.4.36])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oLn3H-0008G3-Bq; Wed, 10 Aug 2022 14:51:19 +0000
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
	bh=e9QsneBUnLAQW6zomqTk7AC2tJQoftZpmuTfa1unkmQ=; b=iM+aVzJTKS26pXsQbZi9u3nWS2
	Hs1s3Ewc5HCnrUW1AAqT/b4Abn6l2f2J3Uy16dPUfH7FoyjMWM7UmgSFSIOQ6QeOiPUD010xRJyTM
	3UVGwUxo5ndGrN9TeKieZKFQHogWOcK0QIVZd2jbrz6yHSiiZDU/GDQI4e1W22QBm4i0=;
Message-ID: <28d85fd0-0e61-7e45-34c5-91ba746561ce@xen.org>
Date: Wed, 10 Aug 2022 15:51:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [XEN v1] xen: arm: Check if timer is enabled for timer irq
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@amd.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20220810105822.18404-1-ayankuma@amd.com>
 <6cfcd4fa-3afd-1c70-6a70-9df557ee1811@xen.org>
 <f10e92ea-ac57-18a9-8843-781d3242f67d@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f10e92ea-ac57-18a9-8843-781d3242f67d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 10/08/2022 15:00, Ayan Kumar Halder wrote:
> On 10/08/2022 14:34, Julien Grall wrote:
>> On 10/08/2022 11:58, Ayan Kumar Halder wrote:
>>> Refer "Arm Architecture Registers DDI 0595", AArch32 system registers,
>> Checking the 'enable' is not going to add too much overhead. So I am 
>> fine if this is added. That said, would you be able to provide more 
>> details on how this was spotted?
> 
> This was spotted while debugging an unrelated problem while porting Xen 
> on R52. For a different reason, I was not able to get context switch to 
> work correctly.
> 
> When I was scrutinizing the timer_interrupt() with the documentation, I 
> found that we are not checking ENABLE.
> 
> Although the code works fine today (on aarch32 or aarch64), I thought it 
> is better to add the check for the sake of compliance with the 
> documentation.

Thanks for the clarification. I am quite curious to know why you think 
our code is not compliant.

As I wrote before, when ENABLE is cleared, you should never have an 
interrupt because the timer interrupt is level. So I believe our code is 
compliant with the Arm Arm.

The only reason I am OK with checking ENABLE is because the overhead is 
limited. If this wasn't the case, then I think I would have wanted clear 
justification in the commit message *why* this is not compliant.

FWIW, Linux seems to use the same approach as us (see [1]). So, if you 
think this is not compliant, then maybe this is something you also want 
to consider to fix there?

Cheers,

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clocksource/arm_arch_timer.c#n644

-- 
Julien Grall

