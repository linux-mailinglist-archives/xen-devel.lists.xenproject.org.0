Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D73D2205587
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 17:08:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnkX0-0004S1-8o; Tue, 23 Jun 2020 15:08:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EaA/=AE=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jnkWy-0004Rw-SD
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 15:08:12 +0000
X-Inumbo-ID: 5af3ab38-b563-11ea-bf99-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5af3ab38-b563-11ea-bf99-12813bfff9fa;
 Tue, 23 Jun 2020 15:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cPRmo1mTHJPuZL4boLttyAweNL6Vi593iEEQKc6eKl8=; b=A0yfbHsiogNj34NjOZdhmoILT1
 tATf4CGtF2H85a+Z9bal3AGY0RCcKuKFZT2fw9ZFW6ZpKj3HEgfbVP76e2yORdz1o+HOtqiI82h8H
 Ll7VWsY5674ybwrE+XQnUoGYTjbPF357b9cV00NfMFZSeTc/VQSJjnpqD35pKfvTyU0k=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jnkWv-0006s2-6m; Tue, 23 Jun 2020 15:08:09 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jnkWu-0004nd-W9; Tue, 23 Jun 2020 15:08:09 +0000
Subject: Re: [PATCH for-4.14 v2] x86/tlb: fix assisted flush usage
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20200623145006.66723-1-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <741ff589-4366-1430-6639-13dc5f02fdfa@xen.org>
Date: Tue, 23 Jun 2020 16:08:06 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200623145006.66723-1-roger.pau@citrix.com>
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

On 23/06/2020 15:50, Roger Pau Monne wrote:
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index 9b62087be1..f360166f00 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -639,7 +639,8 @@ static inline void accumulate_tlbflush(bool *need_tlbflush,
>       }
>   }
>   
> -static inline void filtered_flush_tlb_mask(uint32_t tlbflush_timestamp)
> +static inline void filtered_flush_tlb_mask(uint32_t tlbflush_timestamp,
> +                                           bool sync)

I read the commit message and went through the code, but it is still not 
clear what "sync" means in a non-architectural way.

As an Arm developper, I would assume this means we don't wait for the 
TLB flush to complete. But I am sure this would result to some 
unexpected behavior.

So can you explain on non-x86 words what this really mean?

Cheers,

-- 
Julien Grall

