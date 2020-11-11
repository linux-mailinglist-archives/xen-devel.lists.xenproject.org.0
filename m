Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6152AE9A7
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 08:21:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24254.51397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kckR7-0003pX-6r; Wed, 11 Nov 2020 07:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24254.51397; Wed, 11 Nov 2020 07:20:57 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kckR7-0003p8-3u; Wed, 11 Nov 2020 07:20:57 +0000
Received: by outflank-mailman (input) for mailman id 24254;
 Wed, 11 Nov 2020 07:20:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cwX6=ER=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kckR5-0003p1-Fs
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 07:20:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ecff3b3-488a-4d31-a58a-5cdedda3078b;
 Wed, 11 Nov 2020 07:20:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 70590AC82;
 Wed, 11 Nov 2020 07:20:53 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=cwX6=ER=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kckR5-0003p1-Fs
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 07:20:55 +0000
X-Inumbo-ID: 0ecff3b3-488a-4d31-a58a-5cdedda3078b
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0ecff3b3-488a-4d31-a58a-5cdedda3078b;
	Wed, 11 Nov 2020 07:20:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605079253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LQd77mdpS/ziSZ6ksGaT/WYsWU2bwhmwIchfymJzMg8=;
	b=lzUI1NRnUV/q3O1SxW1ftm/OyQBgyKQCIY+Jv8zgfHw6uNJGah4BlTe4cGMrfNdjKwSWcI
	1OWP240VxNoKVIpVFlWhhFlNEeYQymSvfjytb9ahI2gl1zignWnAJilNpE0FxXyOFWln7s
	g7H+BgPjs1top8oy5s60Lruou5kHcFM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 70590AC82;
	Wed, 11 Nov 2020 07:20:53 +0000 (UTC)
Subject: Re: [PATCH] xen/events: fix build
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201111054946.3229-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8feafd17-851f-9bb2-0fe0-2d6f8bed4d4c@suse.com>
Date: Wed, 11 Nov 2020 08:20:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201111054946.3229-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.11.2020 06:49, Juergen Gross wrote:
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -61,7 +61,9 @@ static inline void evtchn_write_lock(struct evtchn *evtchn)
>  {
>      write_lock(&evtchn->lock);
>  
> +#ifndef NDEBUG
>      evtchn->old_state = evtchn->state;
> +#endif
>  }
>  
>  static inline void evtchn_write_unlock(struct evtchn *evtchn)
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 7251b3ae3e..95f96e7a33 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -114,9 +114,7 @@ struct evtchn
>          u16 virq;      /* state == ECS_VIRQ */
>      } u;
>      u8 priority;
> -#ifndef NDEBUG
>      u8 old_state;      /* State when taking lock in write mode. */
> -#endif
>      u8 last_priority;
>      u16 last_vcpu_id;
>  #ifdef CONFIG_XSM

Did you mean just either of the two changes (and then the former),
not both? If so
Reviewed-by: Jan Beulich <jbeulich@suse.com>
and I'll be happy to drop the other half for committing.

Jan

