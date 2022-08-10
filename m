Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2843F58ED69
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 15:35:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383631.618826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLlr9-0001xW-PC; Wed, 10 Aug 2022 13:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383631.618826; Wed, 10 Aug 2022 13:34:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLlr9-0001uc-Lk; Wed, 10 Aug 2022 13:34:43 +0000
Received: by outflank-mailman (input) for mailman id 383631;
 Wed, 10 Aug 2022 13:34:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oLlr8-0001uW-AD
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 13:34:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oLlr7-0001VP-T8; Wed, 10 Aug 2022 13:34:41 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.4.36])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oLlr7-0004Z2-L7; Wed, 10 Aug 2022 13:34:41 +0000
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
	bh=Vksvn6ecqNa+iu2ixH5zlgwVybEEnMGmGnvfNXOd/zA=; b=NvlmToctcAjghxPOOVIdvV3rU6
	1A4neEH5n2tBrUoI40fezyYqScifI4rkvHOUYZ4+2jFUYYnP7l1WdJsD1HXT/Xij3LZpoROGRU66e
	84gUvbuOOBiUtvQxa+DeEctOO/KDkShFYbQY1ITgR00U1yQe6BaXv9Kl17lPT+goMUaE=;
Message-ID: <6cfcd4fa-3afd-1c70-6a70-9df557ee1811@xen.org>
Date: Wed, 10 Aug 2022 14:34:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [XEN v1] xen: arm: Check if timer is enabled for timer irq
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@amd.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20220810105822.18404-1-ayankuma@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220810105822.18404-1-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

Bertrand already made some comments. I will try to avoid repeating the
same comments.

On 10/08/2022 11:58, Ayan Kumar Halder wrote:
> Refer "Arm Architecture Registers DDI 0595", AArch32 system registers,

You are modifying code that is common between AArch64 and AArch32. So I 
would mention this behavior is common. Also, please specify the version
of the spec. This helps in case the behavior has changed.

Also, NIT: I would prefer if you quote the Arm Arm rather than auxiliary
specifications.

> CNTHP_CTL :- "When the value of the ENABLE bit is 1, ISTATUS indicates
> whether the timer condition is met."

I think the key point here is the field ISTATUS is "unknown" when the 
ENABLE bit is 0.

> 
> Also similar description applies to CNTP_CTL as well.
> 
> One should always check that the timer is enabled and status is set, to
> determine if the timer interrupt has been generated.

I understand the theory. In practice, I am not sure this could ever 
happen because the timer interrupt is level and by clearing *_CTL you 
will lower the line and therefore you should not receive the interrupt 
again.

Checking the 'enable' is not going to add too much overhead. So I am 
fine if this is added. That said, would you be able to provide more 
details on how this was spotted?

Cheers,

-- 
Julien Grall

