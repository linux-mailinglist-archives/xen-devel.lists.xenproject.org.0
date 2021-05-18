Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BD7387625
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 12:10:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129022.242191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liwfl-0003n8-Bj; Tue, 18 May 2021 10:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129022.242191; Tue, 18 May 2021 10:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liwfl-0003kb-8h; Tue, 18 May 2021 10:09:57 +0000
Received: by outflank-mailman (input) for mailman id 129022;
 Tue, 18 May 2021 10:09:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1liwfk-0003kV-OD
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 10:09:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1liwfk-0008T6-Il; Tue, 18 May 2021 10:09:56 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1liwfk-0008Nc-Cq; Tue, 18 May 2021 10:09:56 +0000
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
	bh=+WmblekLkivM2UjT70d4R92sZ3gx7s/ukyceI63fapA=; b=nGkc9rkqZriuRn6A93VKLLDWAc
	WmkeoiJQtBGeC+qTSUgPx1DnBwF8FBYm3zxyRFsgn0NH2/k9KmauMKFK3m7AzpOU20KyI2tVHVXlY
	PgDVcihPapKYuvI2Gkd87KBqHdWP9/FfLbeBrrxd4Un+7q8oSuguVv6tlxSqKUU4+R78=;
Subject: Re: [PATCH 05/10] xen/arm: introduce alloc_staticmem_pages
To: Jan Beulich <jbeulich@suse.com>, Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-6-penny.zheng@arm.com>
 <a890200d-b75b-dd59-5d13-b0b211a58da5@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7f36351e-fa08-ea74-cbc2-049ced7aac4e@xen.org>
Date: Tue, 18 May 2021 11:09:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a890200d-b75b-dd59-5d13-b0b211a58da5@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 18/05/2021 08:24, Jan Beulich wrote:
> On 18.05.2021 07:21, Penny Zheng wrote:
>> +         * to PGC_state_inuse.
>> +         */
>> +        pg[i].count_info = (pg[i].count_info & PGC_reserved) | PGC_state_inuse;
>> +        /* Initialise fields which have other uses for free pages. */
>> +        pg[i].u.inuse.type_info = 0;
>> +        page_set_owner(&pg[i], NULL);
>> +
>> +        /*
>> +         * Ensure cache and RAM are consistent for platforms where the
>> +         * guest can control its own visibility of/through the cache.
>> +         */
>> +        flush_page_to_ram(mfn_x(page_to_mfn(&pg[i])),
>> +                            !(memflags & MEMF_no_icache_flush));
>> +    }
>> +
>> +    if ( need_tlbflush )
>> +        filtered_flush_tlb_mask(tlbflush_timestamp);
> 
> With reserved pages dedicated to a specific domain, in how far is it
> possible that stale mappings from a prior use can still be around,
> making such TLB flushing necessary?

I would rather not make the assumption. I can see future where we just 
want to allocate memory from a static pool that may be shared with 
multiple domains.

Cheers,

-- 
Julien Grall

