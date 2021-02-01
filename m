Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EE130A49B
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 10:47:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79635.145031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6VnI-0007d8-Nu; Mon, 01 Feb 2021 09:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79635.145031; Mon, 01 Feb 2021 09:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6VnI-0007cj-Km; Mon, 01 Feb 2021 09:46:52 +0000
Received: by outflank-mailman (input) for mailman id 79635;
 Mon, 01 Feb 2021 09:46:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6VnH-0007ce-DF
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 09:46:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 551bb446-24ad-4543-889a-2769eb0d55be;
 Mon, 01 Feb 2021 09:46:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 755E9AC9B;
 Mon,  1 Feb 2021 09:46:49 +0000 (UTC)
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
X-Inumbo-ID: 551bb446-24ad-4543-889a-2769eb0d55be
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612172809; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lTfjF2ZVLBDFFszI0T+/kJjmJ7xJKd47EbkHp3lLM9E=;
	b=AAiYwnlpviEzTVxmmn0Uv5+yj4sjugVPJRv5HaZ3v3XEmXcF3bELmmFMdUScYklTJGl6e5
	oQANKLEqegfkieQCDLxT9Oq8ZtuHlLj5UBvoKyYnCzErQVPTGZ3CvKFyCiJk2fFMH+8ALk
	Ti6OJITLQbGMl9So50XbvDl8ts9zEzE=
Subject: Re: [PATCH for-4.15] xen/mm: Fix build when CONFIG_HVM=n and
 CONFIG_COVERAGE=y
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210130152210.17503-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <174a18ba-25d5-a94c-a85d-4a81b837a936@suse.com>
Date: Mon, 1 Feb 2021 10:46:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210130152210.17503-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.01.2021 16:22, Julien Grall wrote:
> @@ -1442,13 +1447,6 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          if ( d == NULL )
>              return -ESRCH;
>  
> -        rc = xatp_permission_check(d, xatpb.space);
> -        if ( rc )
> -        {
> -            rcu_unlock_domain(d);
> -            return rc;
> -        }
> -
>          rc = xenmem_add_to_physmap_batch(d, &xatpb, start_extent);
>  
>          rcu_unlock_domain(d);

I'd be okay with the code movement if you did so consistently,
i.e. also for the other invocation. I realize this would have
an effect on the dm-op call of the function, but I wonder
whether this wouldn't even be a good thing. If not, I think
duplicating xenmem_add_to_physmap()'s early ASSERT() into
xenmem_add_to_physmap_batch() would be the better course of
action.

Jan

