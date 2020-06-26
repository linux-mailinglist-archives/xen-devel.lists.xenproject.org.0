Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F95420AF23
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 11:38:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jokoN-0006r2-Hc; Fri, 26 Jun 2020 09:38:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FAa2=AH=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jokoM-0006qx-6z
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 09:38:18 +0000
X-Inumbo-ID: c3881574-b790-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3881574-b790-11ea-bb8b-bc764e2007e4;
 Fri, 26 Jun 2020 09:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DPK+LkiwuKek1QGGWTtwaOZJRuOtvbHMghsNq8TMJIE=; b=idhtSTKoCD4HMwVvmhJ0kQ8jgE
 Z/7b95zL3vNXgi0DtX2XcGipGdhn4BvleuQjO9BVKrhPS9JNpX33hIe6xCdPk7bVGD9Ksjemglw/K
 Tvy4CgpeXx92W0EpFO1XqLbC62BTx1Yb/wroLhc46BlHGLc0TPk2PAIyS5F5UDn6Jglg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jokoH-000059-PS; Fri, 26 Jun 2020 09:38:13 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jokoH-0005H1-Hw; Fri, 26 Jun 2020 09:38:13 +0000
Subject: Re: [PATCH for-4.14 v3] x86/tlb: fix assisted flush usage
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20200625113041.81507-1-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <551387c6-f45d-bf6c-a41e-b0920425db9f@xen.org>
Date: Fri, 26 Jun 2020 10:38:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200625113041.81507-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Roger,

Sorry I didn't manage to answer to your question before you sent v3.

On 25/06/2020 12:30, Roger Pau Monne wrote:
> diff --git a/xen/include/asm-arm/flushtlb.h b/xen/include/asm-arm/flushtlb.h
> index ab1aae5c90..7ae0543885 100644
> --- a/xen/include/asm-arm/flushtlb.h
> +++ b/xen/include/asm-arm/flushtlb.h
> @@ -27,6 +27,7 @@ static inline void page_set_tlbflush_timestamp(struct page_info *page)
>   
>   /* Flush specified CPUs' TLBs */
>   void flush_tlb_mask(const cpumask_t *mask);
> +#define flush_tlb_mask_sync flush_tlb_mask

Dropping the parameter 'sync' from filtered_flush_tlb_mask() is a nice 
improvement, but it unfortunately doesn't fully address my concern.

After this patch there is exactly one use of flush_tlb_mask() in common 
code (see grant_table.c). But without looking at the x86 code, it is not 
clear why this requires a different flush compare to the two other sites.

IOW, if I want to modify the common code in the future, how do I know 
which flush to call?

Cheers,

-- 
Julien Grall

