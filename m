Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F5C7320E8
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 22:27:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549822.858586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9tYW-00026T-G5; Thu, 15 Jun 2023 20:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549822.858586; Thu, 15 Jun 2023 20:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9tYW-00024q-D0; Thu, 15 Jun 2023 20:26:56 +0000
Received: by outflank-mailman (input) for mailman id 549822;
 Thu, 15 Jun 2023 20:26:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q9tYU-00024j-H0
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 20:26:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q9tYT-0006Xk-T7; Thu, 15 Jun 2023 20:26:53 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.16.225]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q9tYT-0001n3-Ma; Thu, 15 Jun 2023 20:26:53 +0000
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
	bh=YHgAoq3yzxiJgCE2iG3fF10p7NsdjvqOo19e4b7NnMk=; b=g3OzXfYvm82sVw9YrCkMucGxG+
	2MfolhLcFFUQtEYvc1eeEXyqFwR2gTaS64H+Thf6TuoazdU0iJGDkR4w0lrFRhlX55m4IHrMGSxM3
	JTJHaEYPoLDNNG/QM36Tk/GpOM3EgMOXSsOS5Z1oadKkW2ZnMpagde1U9F3dKzOTgFJ4=;
Message-ID: <9eecd70a-8027-a550-7f49-6a4fd3de1dfa@xen.org>
Date: Thu, 15 Jun 2023 21:26:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [XEN v8 2/5] xen/arm: Introduce choice to enable 64/32 bit
 physical addressing
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230602120754.23817-1-ayan.kumar.halder@amd.com>
 <20230602120754.23817-3-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230602120754.23817-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 02/06/2023 13:07, Ayan Kumar Halder wrote:
> Some Arm based hardware platforms which does not support LPAE
> (eg Cortex-R52), uses 32 bit physical addresses.
> Also, users may choose to use 32 bits to represent physical addresses
> for optimization.
> 
> To support the above use cases, we have introduced arch independent
> config to choose if the physical address can be represented using
> 32 bits (PHYS_ADDR_T_32) or 64 bits (!PHYS_ADDR_T_32).
> For now only ARM_32 provides support to enable 32 bit physical
> addressing.
> 
> When PHYS_ADDR_T_32 is defined, PADDR_BITS is set to 32. Note that we
> use "unsigned long" (not "uint32_t") to denote the datatype of physical
> address. This is done to avoid using a cast each time PAGE_* macros are
> used on paddr_t. For eg PAGE_SIZE is defined as unsigned long. Thus,
> each time PAGE_SIZE is used with paddr_t, the result will be
> "unsigned long".
> On 32-bit architecture, "unsigned long" is 32-bit wide. Thus, it can be
> used to denote physical address.
> 
> When PHYS_ADDR_T_32 is not defined for ARM_32, PADDR_BITS is set to 40.
> For ARM_64, PADDR_BITS is set to 48.
> The last two are same as the current configuration used today on Xen.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

