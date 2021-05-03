Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E28371645
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 15:53:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121621.229380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldZ0i-0008Er-Tp; Mon, 03 May 2021 13:53:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121621.229380; Mon, 03 May 2021 13:53:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldZ0i-0008ES-QY; Mon, 03 May 2021 13:53:20 +0000
Received: by outflank-mailman (input) for mailman id 121621;
 Mon, 03 May 2021 13:53:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TA2L=J6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ldZ0h-0008EN-EJ
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 13:53:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0befd92a-be2d-4645-8de1-b1c785a63f61;
 Mon, 03 May 2021 13:53:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A90DFB036;
 Mon,  3 May 2021 13:53:17 +0000 (UTC)
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
X-Inumbo-ID: 0befd92a-be2d-4645-8de1-b1c785a63f61
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620049997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AtyNzJXblg1TorskkTaOxOcwAAm/1XOy6DtVGC3zw+M=;
	b=kNW/dfUPLuB+hCowpK85ovdD8oU89MLMZWn8xCh+NgfvM9M5h1wpCtJOTM5ppMAxVitx+9
	8DHYe73u2cMpHx53NL0h5Un0XrJLRpsYqDS5y+TY9Vq4kBuy755gtWpMZiq6O7LTPAU7MI
	D2xIKyEwJ8r+kleSZj7H/fkuu9JPf/U=
Subject: Ping: [PATCH v2 8/8] Arm/optee: don't open-code xzalloc_flex_struct()
From: Jan Beulich <jbeulich@suse.com>
To: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <091b4b91-712f-3526-78d1-80d31faf8e41@suse.com>
 <5fa042ac-9609-eab7-b14d-a59782ef4141@suse.com>
Message-ID: <d61a2123-b501-15d6-e2c1-f18aa4790b46@suse.com>
Date: Mon, 3 May 2021 15:53:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <5fa042ac-9609-eab7-b14d-a59782ef4141@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Volodymyr,

On 21.04.2021 16:59, Jan Beulich wrote:
> The current use of xzalloc_bytes() in optee is nearly an open-coded
> version  of xzalloc_flex_struct(), which was introduced after the driver
> was merged.
> 
> The main difference is xzalloc_bytes() will also force the allocation to
> be SMP_CACHE_BYTES aligned and therefore avoid sharing the cache line.
> While sharing the cache line can have an impact on the performance, this
> is also true for most of the other users of x*alloc(), x*alloc_array(),
> and x*alloc_flex_struct(). So if we want to prevent sharing cache lines,
> arranging for this should be done in the allocator itself.
> 
> In this case, we don't need stricter alignment than what the allocator 
> provides. Hence replace the call to xzalloc_bytes() with one of
> xzalloc_flex_struct().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Julien Grall <julien@xen.org>
> ---
> v2: Use commit message very close to what was suggested by Julien.

I realize I forgot to Cc you on the v2 submission, but I didn't hear
back on v1 from you either. May I ask for an ack or otherwise?

Thanks, Jan

> --- a/xen/arch/arm/tee/optee.c
> +++ b/xen/arch/arm/tee/optee.c
> @@ -529,8 +529,7 @@ static struct optee_shm_buf *allocate_op
>      while ( unlikely(old != atomic_cmpxchg(&ctx->optee_shm_buf_pages,
>                                             old, new)) );
>  
> -    optee_shm_buf = xzalloc_bytes(sizeof(struct optee_shm_buf) +
> -                                  pages_cnt * sizeof(struct page *));
> +    optee_shm_buf = xzalloc_flex_struct(struct optee_shm_buf, pages, pages_cnt);
>      if ( !optee_shm_buf )
>      {
>          err_code = -ENOMEM;
> 
> 


