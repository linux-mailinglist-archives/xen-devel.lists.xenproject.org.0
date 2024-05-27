Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C518D0F45
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 23:16:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730936.1136224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBhgM-00062m-RV; Mon, 27 May 2024 21:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730936.1136224; Mon, 27 May 2024 21:15:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBhgM-00061G-OE; Mon, 27 May 2024 21:15:02 +0000
Received: by outflank-mailman (input) for mailman id 730936;
 Mon, 27 May 2024 21:15:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sBhgL-00061A-OR
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 21:15:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sBhgL-0004pk-EX; Mon, 27 May 2024 21:15:01 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sBhgL-0003MN-7i; Mon, 27 May 2024 21:15:01 +0000
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
	bh=Cb7GtgMHZEoaRf7aO+7KJNTqXiRe/k2oFZCQtLhQiB0=; b=k/SdWyGqU2DumVjimhwwmrOOw0
	EO65OAqrD4Clws6tbT6Nyg0yPPfakzIWwkmkfcV2hBBBlgDAk0mXjbW+gKTSXmf2dX/+WPjjkM2V3
	WnvD5JkfitH6lq9oOX76lMIF2M1hDxwmp1t+uuCAz8kHU/QCSMupfD8nX7a1D6QlJrr4=;
Message-ID: <3b3fd3a2-6b5c-41a2-a0b3-219a362f645f@xen.org>
Date: Mon, 27 May 2024 22:14:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/5] arm/vpci: honor access size when returning an
 error
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20240522225927.77398-1-stewart.hildebrand@amd.com>
 <20240522225927.77398-2-stewart.hildebrand@amd.com>
 <Zk72jPtd9iXhChbc@macbook>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <Zk72jPtd9iXhChbc@macbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 23/05/2024 08:55, Roger Pau Monné wrote:
> On Wed, May 22, 2024 at 06:59:20PM -0400, Stewart Hildebrand wrote:
>> From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>>
>> Guest can try to read config space using different access sizes: 8,
>> 16, 32, 64 bits. We need to take this into account when we are
>> returning an error back to MMIO handler, otherwise it is possible to
>> provide more data than requested: i.e. guest issues LDRB instruction
>> to read one byte, but we are writing 0xFFFFFFFFFFFFFFFF in the target
>> register.
> 
> Shouldn't this be taken care of in the trap handler subsystem, rather
> than forcing each handler to ensure the returned data matches the
> access size?

I understand how this can be useful when we return all 1s.

However, in most of the current cases, we already need to deal with the 
masking because the data is extracted from a wider field (for instance, 
see the vGIC emulation). For those handlers, I would argue it would be 
concerning/ a bug if the handler return bits above the access size. 
Although, this would only impact the guest itself.

So overall, this seems to be a matter of taste and I don't quite (yet) 
see the benefits to do it in io.c. Regardless that...

> 
> IOW, something like:
> 
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index 96c740d5636c..b7e12df85f87 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -37,6 +37,7 @@ static enum io_state handle_read(const struct mmio_handler *handler,
>           return IO_ABORT;
> 
>       r = sign_extend(dabt, r);
> +    r = r & GENMASK_ULL((1U << dabt.size) * 8 - 1, 0);

... in some case we need to sign extend up to the width of the register 
(even if the access is 8-byte). So we would need to do the masking 
*before* calling sign_extend().

Cheers,

-- 
Julien Grall

