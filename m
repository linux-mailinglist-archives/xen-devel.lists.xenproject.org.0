Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 638B7876D21
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 23:31:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690408.1076346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riij9-0004yS-4k; Fri, 08 Mar 2024 22:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690408.1076346; Fri, 08 Mar 2024 22:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riij9-0004wY-1p; Fri, 08 Mar 2024 22:30:07 +0000
Received: by outflank-mailman (input) for mailman id 690408;
 Fri, 08 Mar 2024 22:30:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1riij7-0004qW-JQ
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 22:30:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1riij7-0003WK-4X; Fri, 08 Mar 2024 22:30:05 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1riij6-0008NY-QY; Fri, 08 Mar 2024 22:30:04 +0000
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
	bh=ut4po0fGiouZP8lbowdSquir9Zb3msRU+4o4fMADWTc=; b=hZCavOFpNCmHyWd8bZDiBBydUg
	JutA5eAViYfrWVjw2KI5R2Wdodx5CEuRZy8aO39+Ze6QN00ecNLqy0Yh/bbc+Lt6UdoVMZZ7SOs8X
	pa4uGiPu2CrGd2mh9BAT9bkDdRdloufSpiFyuFMI3N6DxW3F9JYljqXLKC3jKQeZ9BPk=;
Message-ID: <1439263a-c96d-48bb-bd3c-1427071ecd17@xen.org>
Date: Fri, 8 Mar 2024 22:30:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/15] xen/arm: make consider_modules() available for
 xen relocation
Content-Language: en-GB
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-14-carlo.nonato@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240129171811.21382-14-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+ Ayan + Henry)

Hi Carlo,

On 29/01/2024 17:18, Carlo Nonato wrote:
> Cache coloring must physically relocate Xen in order to color the hypervisor
> and consider_modules() is a key function that is needed to find a new
> available physical address.
> 
> 672d67f339c0 ("xen/arm: Split MMU-specific setup_mm() and related code out")
> moved consider_modules() under arm32. Move it back to setup.c and make it
> non-static so that it can be used outside.
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> ---
> v6:
> - new patch
> ---
>   xen/arch/arm/arm32/mmu/mm.c      | 93 +-------------------------------
>   xen/arch/arm/include/asm/setup.h |  3 ++
>   xen/arch/arm/setup.c             | 92 +++++++++++++++++++++++++++++++

Ayan, Henry, will the function consider_modules() be used for the MPU 
code? If not, then I think the function should live in arm/mmu/setup.c.

Cheers,

-- 
Julien Grall

