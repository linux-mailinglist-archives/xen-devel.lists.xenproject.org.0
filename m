Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9A857889D
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 19:39:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369990.601612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDUi5-0005yr-4Q; Mon, 18 Jul 2022 17:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369990.601612; Mon, 18 Jul 2022 17:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDUi5-0005wY-1e; Mon, 18 Jul 2022 17:39:09 +0000
Received: by outflank-mailman (input) for mailman id 369990;
 Mon, 18 Jul 2022 17:39:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oDUi4-0005wS-1z
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 17:39:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oDUi0-0004DQ-Dq; Mon, 18 Jul 2022 17:39:04 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=[10.7.237.21])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oDUi0-0002kq-7q; Mon, 18 Jul 2022 17:39:04 +0000
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
	bh=lJPhKBGAbseUHfu7daN4peHCxF/nHRM2kxGLurhaQsE=; b=OUumpu6AIW/5grr1tn4oKyCA2A
	ehUitDkgciaCSttx203kX0Y9fvum5NPFeruUdfGKUo8PrGHUV2OpqI93wul4lqujG1KK5h9L5Umxu
	OepcjXXRIUtLs9+UmYFYpjR16w5VG2vV51LSNS2kbSjExG+xLmvTIvdz6BqPt2Z/Tt4c=;
Message-ID: <a06eb29a-c5b3-3a97-7f39-ca25a051163d@xen.org>
Date: Mon, 18 Jul 2022 18:39:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/3] xen/heap: pass order to free_heap_pages() in heap
 init
To: Jan Beulich <jbeulich@suse.com>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20220715170312.13931-1-julien@xen.org>
 <20220715170312.13931-4-julien@xen.org>
 <0242a659-fcf9-74cc-102c-df775123b7ac@suse.com>
 <b8b84df4-4101-a78f-1cf1-1662500ee2c0@xen.org>
 <097e8634-0c5b-35ac-6ad6-5b83d9b29f64@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <097e8634-0c5b-35ac-6ad6-5b83d9b29f64@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 18/07/2022 12:02, Jan Beulich wrote:
> On 18.07.2022 12:24, Julien Grall wrote:
> 3)
>          unsigned int inc_order = min(MAX_ORDER, flsl(e - s) - 1);
> 
>          if ( s )
>              inc_order = min(inc_order, ffsl(s) - 1U);

I like this idea!

> 
> No compilation issues to expect here, afaict.

Correct, GCC is happy with this approach. Assuming there are no other 
comments, are you happy if I make the change on commit?

Cheers,


-- 
Julien Grall

