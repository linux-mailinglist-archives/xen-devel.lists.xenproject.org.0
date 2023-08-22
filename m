Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D45447849D0
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 20:59:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588663.920224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYWay-0000ov-VK; Tue, 22 Aug 2023 18:59:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588663.920224; Tue, 22 Aug 2023 18:59:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYWay-0000me-SE; Tue, 22 Aug 2023 18:59:16 +0000
Received: by outflank-mailman (input) for mailman id 588663;
 Tue, 22 Aug 2023 18:59:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYWax-0000mY-W3
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 18:59:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYWax-0003uG-EW; Tue, 22 Aug 2023 18:59:15 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYWax-0002KS-9H; Tue, 22 Aug 2023 18:59:15 +0000
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
	bh=zdH57o07CaOqHZk1+ry8ha+NYkUxYsEBmwsrr7TqcKs=; b=gc2SSA0+VPYoDavaK/6Tj596/e
	o88b+a7wUD+W9aNVGFmp49cNw6LyzrIe4/I5k2N+x2u6QxXDu/fJQz8Oekl9fc61flR4i2pR+c0fa
	RDPW2lhWM2ZOl1VwjqAvbfM2nFCZWcY/rcOMYMImZJGl4Biv/Y0a2+uvCz+EV1Pe567A=;
Message-ID: <734587ea-4066-4f60-8903-7f43a10bb1b6@xen.org>
Date: Tue, 22 Aug 2023 19:59:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v9 03/19] xen/arm/device: Remove __init from function
 type
Content-Language: en-GB
To: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, jbeulich@suse.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
 <20230819002850.32349-4-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230819002850.32349-4-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vikram,

On 19/08/2023 01:28, Vikram Garhwal wrote:
> Remove __init from following function to access during runtime:
>      1. map_irq_to_domain()
>      2. handle_device_interrupts()
>      3. map_range_to_domain()
>      4. unflatten_dt_node()

We are at v9 now, so this is more a remark for the future. In general we 
are trying to avoid modifying the same code multiple time within the 
series because this makes it more difficult to review. In this case, you 
could have removed the __init in patch #4 where you also export it.

> 
> Move map_irq_to_domain() prototype from domain_build.h to setup.h.
> 
> To avoid breaking the build, following changes are also done:

I am guessing by "breaking the build", you mean that you will get an 
error because an non-init function is implemented in domain_build.c. 
Right? If so, I think this should be spelled out.

> 1. Move map_irq_to_domain(), handle_device_interrupts() and map_range_to_domain()
>      to device.c. After removing __init type,  these functions are not specific
>      to domain building, so moving them out of domain_build.c to device.c.
> 2. Remove static type from handle_device_interrupt().

Typo: s/interrupt/interrupts/ to match the function name. But I don't 
link the name when it is exported as it leads to think this is dealing 
with real interrupt.

Looking at the overlay code, the caller (i.e. add_resources()) is very 
similar to handle_device(). AFAICT the only differences are:
    1/ add_resources() doesn't deal with mapping (you said it will in 
the future)
    2/ You need to update some rangeset

For 1/ it means this is a superset. For 2/, I think this could be 
abstracted by adding a pointer to the rangesets in map_range_data. They 
could be NULL for the domain build case.

So can you look at abstracting? This will make easier to maintain a 
single place to parse a device node and map it.

A possible name for the function would be dt_map_resources_to_domain().

Cheers,

-- 
Julien Grall

