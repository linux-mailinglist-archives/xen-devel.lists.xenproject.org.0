Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D17974C57D5
	for <lists+xen-devel@lfdr.de>; Sat, 26 Feb 2022 20:31:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279853.477657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nO2lt-0002lW-5A; Sat, 26 Feb 2022 19:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279853.477657; Sat, 26 Feb 2022 19:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nO2lt-0002io-2F; Sat, 26 Feb 2022 19:30:25 +0000
Received: by outflank-mailman (input) for mailman id 279853;
 Sat, 26 Feb 2022 19:30:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nO2lr-0002ii-Mp
 for xen-devel@lists.xenproject.org; Sat, 26 Feb 2022 19:30:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nO2lr-0003ze-AR; Sat, 26 Feb 2022 19:30:23 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nO2lr-0007Zh-4l; Sat, 26 Feb 2022 19:30:23 +0000
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
	bh=vy0KKzNV1cTLvO2UQfRSEyvB/FsMPs4v5L5ywHF+59w=; b=3a5jzQjQC6+wibDQg3P+J9WUZ+
	anHmwb5XCfAJNPlcGLbGL0g8YDaLNivAYVMnd+uISuGn8cGPfa1iO6R4aqOLxw4UCECmAewCfzKfh
	YK/34iwo/OK/SVYK0M0bje3qW8ukzDj4ACSao3lL+7dw+3ZeMU9FIV47F2DuBnRyBVNI=;
Message-ID: <e8382df1-eb0c-9571-873f-848e2d6cf8fa@xen.org>
Date: Sat, 26 Feb 2022 19:30:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3 05/19] xen/arm: mm: Add support for the contiguous bit
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-6-julien@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220221102218.33785-6-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21/02/2022 10:22, Julien Grall wrote:
> @@ -1333,21 +1386,34 @@ static int xen_pt_update(unsigned long virt,
>       while ( left )
>       {
>           unsigned int order, level;
> +        unsigned int nr_contig;
> +        unsigned int new_flags;
>   
>           level = xen_pt_mapping_level(vfn, mfn, left, flags);
>           order = XEN_PT_LEVEL_ORDER(level);
>   
>           ASSERT(left >= BIT(order, UL));
>   
> -        rc = xen_pt_update_entry(root, pfn_to_paddr(vfn), mfn, level, flags);
> -        if ( rc )
> -            break;
> +        /*
> +         * Check if we can set the contiguous mapping and update the
> +         * flags accordingly.
> +         */
> +        nr_contig = xen_pt_check_contig(vfn, mfn, level, left, flags);
> +        new_flags = flags | ((nr_contig > 1) ? _PAGE_CONTIG : 0);
>   
> -        vfn += 1U << order;
> -        if ( !mfn_eq(mfn, INVALID_MFN) )
> -            mfn = mfn_add(mfn, 1U << order);
> +        for ( ; nr_contig > 0; nr_contig-- )
> +        {
> +            rc = xen_pt_update_entry(root, pfn_to_paddr(vfn), mfn, level,
> +                                     new_flags);
> +            if ( rc )
> +                break;
>   
> -        left -= (1U << order);
> +            vfn += 1U << order;
> +            if ( !mfn_eq(mfn, INVALID_MFN) )
> +                mfn = mfn_add(mfn, 1U << order);
> +
> +            left -= (1U << order);
> +        }

I forgot to add:

if ( rc )
   break;

Without it, the outer loop will never exit in case of an error.

Cheers,

-- 
Julien Grall

