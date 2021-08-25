Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF5C3F7B3F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 19:10:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172556.314873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIwPc-0000c0-3g; Wed, 25 Aug 2021 17:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172556.314873; Wed, 25 Aug 2021 17:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIwPc-0000Z1-05; Wed, 25 Aug 2021 17:10:04 +0000
Received: by outflank-mailman (input) for mailman id 172556;
 Wed, 25 Aug 2021 17:10:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mIwPa-0000P4-QG
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 17:10:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIwPZ-00025S-0g; Wed, 25 Aug 2021 17:10:01 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIwPY-0003Vs-RA; Wed, 25 Aug 2021 17:10:00 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=IrR16HI/M/JChzTcBxJye1fMvJZ7GR2f0Us/WtaPTxo=; b=sv6ZLshs7mMlq3pQGAeJkhb7co
	lHyeMpEKGlthnMoJqwi/6bYHeX4AzbwFBDbCe2n++0+GX+uPsjLEZGHmCyyfgI32FJTJUHLL2n6hd
	s1vURu0KJ3t4ez2GJbWaaXFsZZape5hOk84JAUhhQaeGBCGvWc8S1U/K1jt+4F56zLAM=;
Subject: Re: [XEN RFC PATCH 29/40] xen/arm: implement Arm arch helpers Arm to
 get memory map info
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-30-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <05ca94ef-900f-49fa-1e78-daabcf6fa729@xen.org>
Date: Wed, 25 Aug 2021 18:09:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-30-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 11/08/2021 11:24, Wei Chen wrote:
> These two helpers are architecture APIs that are required by
> nodes_cover_memory.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/numa.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
> index f61a8df645..6eebf8e8bc 100644
> --- a/xen/arch/arm/numa.c
> +++ b/xen/arch/arm/numa.c
> @@ -126,3 +126,17 @@ void __init numa_init(bool acpi_off)
>       numa_initmem_init(PFN_UP(ram_start), PFN_DOWN(ram_end));
>       return;
>   }
> +
> +uint32_t __init arch_meminfo_get_nr_bank(void)
> +{
> +	return bootinfo.mem.nr_banks;
> +}
> +
> +int __init arch_meminfo_get_ram_bank_range(int bank,
> +	unsigned long long *start, unsigned long long *end)

They are physical address, so we should use "paddr_t" as on system such 
as 32-bit Arm, "unsigned long" is not enough to cover all the physical 
address.

As you change the type, I would also suggest to change the bank from an 
int to an unsigned int.

> +{
> +	*start = bootinfo.mem.bank[bank].start;
> +	*end = bootinfo.mem.bank[bank].start + bootinfo.mem.bank[bank].size;
> +
> +	return 0;
> +}
> 

Cheers,

-- 
Julien Grall

