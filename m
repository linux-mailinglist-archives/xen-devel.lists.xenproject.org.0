Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A96528C1A
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 19:37:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330224.553582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqee6-0000tR-NY; Mon, 16 May 2022 17:36:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330224.553582; Mon, 16 May 2022 17:36:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqee6-0000qT-K1; Mon, 16 May 2022 17:36:38 +0000
Received: by outflank-mailman (input) for mailman id 330224;
 Mon, 16 May 2022 17:36:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nqee5-0000qK-7z
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 17:36:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqee4-0007Yt-Nf; Mon, 16 May 2022 17:36:36 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.22.38]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqee4-0007qa-Gs; Mon, 16 May 2022 17:36:36 +0000
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
	bh=Xa010WFhC/qkh4UR99SDa7p8TEt9jZCsyEm2xJiim1M=; b=P9c2Fbzu8UZA40i4KCQSm/LImp
	eSxHOiVYyNTl+BGuPh0zJbdR9+Pyq8IMijQtY2AYpMYT2LKrgl35MTx1K27he6ERBragsVIkepKtF
	8MSGLO2lU3ZEJyuDA+gjUz+/23jEFU2x8+GxoWx5X4io42qcLIM7MDmpUf+Cx8/yAnc4=;
Message-ID: <19de9898-59ca-5ccc-42cb-ae6f355ae24e@xen.org>
Date: Mon, 16 May 2022 18:36:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v4 2/6] xen: do not merge reserved pages in
 free_heap_pages()
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>
References: <20220510022733.2422581-1-Penny.Zheng@arm.com>
 <20220510022733.2422581-3-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220510022733.2422581-3-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 10/05/2022 03:27, Penny Zheng wrote:
> The code in free_heap_pages() will try to merge pages with the
> successor/predecessor if pages are suitably aligned. So if the pages
> reserved are right next to the pages given to the heap allocator,
> free_heap_pages() will merge them, and give the reserved pages to heap
> allocator accidently as a result.
> 
> So in order to avoid the above scenario, this commit updates free_heap_pages()
> to check whether the predecessor and/or successor has PGC_reserved set,
> when trying to merge the about-to-be-freed chunk with the predecessor
> and/or successor.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Suggested-by: Julien Grall <jgrall@amazon.com>

NIT: In general, the tags are historically ordered. I.e I first sugested 
and then you wrote the patch. So the two tags should be inverted.

This can be done on commit:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

