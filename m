Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C823F9AC5
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 16:19:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173723.316945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJchd-0004kl-Cl; Fri, 27 Aug 2021 14:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173723.316945; Fri, 27 Aug 2021 14:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJchd-0004i8-9o; Fri, 27 Aug 2021 14:19:29 +0000
Received: by outflank-mailman (input) for mailman id 173723;
 Fri, 27 Aug 2021 14:19:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mJchb-0004i2-QZ
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 14:19:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJcha-00072U-RJ; Fri, 27 Aug 2021 14:19:26 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJcha-0002Fp-Ky; Fri, 27 Aug 2021 14:19:26 +0000
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
	bh=4X2bVPqVehZpS8u/zrL3MLUyZNLJ6FKiwq56IC+Phhc=; b=vxxLH4iVAyjG7k5XK/zRBJk7Z/
	qgE4N4zIeH04id33BGgcDG6f5NTlzAAbs9pGhuz4LBZDh6QywSUdmp8apfzp4EalwuQ1nPCa6HOBE
	I3LOrarnaDDi1110/G1MtP/qhLrgaXnKIT+ewj9PWtmgVZayrfyVT1ehl874LQfi5cKo=;
Subject: Re: [XEN RFC PATCH 35/40] xen: enable numa_scan_nodes for device tree
 based NUMA
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-36-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <596df817-fc54-dd7d-8951-8a006d984e01@xen.org>
Date: Fri, 27 Aug 2021 15:19:24 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-36-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 11/08/2021 11:24, Wei Chen wrote:
> Now, we can use the same function for ACPI and device tree based
> NUMA to scan memory nodes.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/common/numa.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/common/numa.c b/xen/common/numa.c
> index 8ca13e27d1..d15c2fc311 100644
> --- a/xen/common/numa.c
> +++ b/xen/common/numa.c
> @@ -381,7 +381,7 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
>           return;
>   #endif
>   
> -#ifdef CONFIG_ACPI_NUMA
> +#if defined(CONFIG_ACPI_NUMA) || defined(CONFIG_DEVICE_TREE_NUMA)

numa.c is only built when CONFIG_NUMA is set. I don't think CONFIG_NUMA 
will ever set if neither CONFIG_ACPI_NUMA or CONFIG_DEVICE_TREE_NUMA is 
set. So do we actually need this #ifdef?

>       if ( !numa_off && !numa_scan_nodes((u64)start_pfn << PAGE_SHIFT,
>            (u64)end_pfn << PAGE_SHIFT) )
>           return;
> 

Cheers,

-- 
Julien Grall

