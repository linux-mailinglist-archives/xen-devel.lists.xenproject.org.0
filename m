Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D36A6191956
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 19:43:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGoTK-0006ey-11; Tue, 24 Mar 2020 18:40:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2LnZ=5J=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jGoTJ-0006er-60
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 18:40:17 +0000
X-Inumbo-ID: e77b34a6-6dfe-11ea-b34e-bc764e2007e4
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e77b34a6-6dfe-11ea-b34e-bc764e2007e4;
 Tue, 24 Mar 2020 18:40:16 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id a43so21935869edf.6
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2020 11:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ot8I8C+CGiq8HkxlN8VX77GsNEz723cUrOZxuVqK/D8=;
 b=IFGAJpguVcLknCnIzXmEFRDeBp4Hd7swFZFdI2ylgzhLgMCraBScgVIS2GKMNkeTkV
 8Y0ewPD6Itmy31xQQfyVc2LdKqvHEFbpOHkubFspD44vdPO4x2rMywcXxYV5H28K6GWX
 cS1Qxk3bJVftPRpWUOkeg0D4wxiyouwpFetunltM4Zl7Rej+1Xj0zPk5tLyneRnaOzwr
 v7++RGtWXSWA3PxZP4VoX/NOUn5P1EJWos477l00xtRO1foylS6t4F+YoHKC5L9t0iaQ
 TW8B68EBVcxQq5T8059755xNqyZfQ6uXlcV2uxUHTES6Dm/yhTQdZGRYg8FsO/eXJz6J
 jYDQ==
X-Gm-Message-State: ANhLgQ3bbXrho1II55e1xe/MVP2klr0z6T6rcdly4mc/1i5IH8u1IiK7
 26k3qYw7l6d4ncPbz3s2xe45g0hPJhI=
X-Google-Smtp-Source: ADFU+vt7GRQB3rq/PE6UjOKVHM0TBswk+wUejWd+OP7zH2Tv/7v7TJ8NEHFuywlttmXtHsKTDEV3MA==
X-Received: by 2002:a50:da49:: with SMTP id a9mr18705320edk.388.1585075215784; 
 Tue, 24 Mar 2020 11:40:15 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-224.amazon.com.
 [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id z23sm1423216edq.73.2020.03.24.11.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2020 11:40:15 -0700 (PDT)
To: Hongyan Xia <hx242@xen.org>, xen-devel@lists.xenproject.org
References: <de46590ad566d9be55b26eaca0bc4dc7fbbada59.1585063311.git.hongyxia@amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <bb0a51e4-2024-011b-39c3-23331df8f982@xen.org>
Date: Tue, 24 Mar 2020 18:40:14 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <de46590ad566d9be55b26eaca0bc4dc7fbbada59.1585063311.git.hongyxia@amazon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH] Revert "domctl: improve locking during
 domain destruction"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 24/03/2020 15:21, Hongyan Xia wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> Unfortunately, even though that commit dropped the domctl lock and
> allowed other domctl to continue, it created severe lock contention
> within domain destructions themselves. Multiple domain destructions in
> parallel now spin for the global heap lock when freeing memory and could
> spend a long time before the next hypercall continuation. In contrast,
> after dropping that commit, parallel domain destructions will just fail
> to take the domctl lock, creating a hypercall continuation and backing
> off immediately, allowing the thread that holds the lock to destroy a
> domain much more quickly and allowing backed-off threads to process
> events and irqs.
> 
> On a 144-core server with 4TiB of memory, destroying 32 guests (each
> with 4 vcpus and 122GiB memory) simultaneously takes:
> 
> before the revert: 29 minutes
> after the revert: 6 minutes
> 
> This is timed between the first page and the very last page of all 32
> guests is released back to the heap.
> 
> This reverts commit 228ab9992ffb1d8f9d2475f2581e68b2913acb88.
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>

Reviewed-by: Julien Grall <julien@xen.org>

> ---
>   xen/common/domain.c | 11 +----------
>   xen/common/domctl.c |  5 +----
>   2 files changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index b4eb476a9c..7b02f5ead7 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -698,20 +698,11 @@ int domain_kill(struct domain *d)
>       if ( d == current->domain )
>           return -EINVAL;
>   
> -    /* Protected by d->domain_lock. */
> +    /* Protected by domctl_lock. */
>       switch ( d->is_dying )
>       {
>       case DOMDYING_alive:
> -        domain_unlock(d);
>           domain_pause(d);
> -        domain_lock(d);
> -        /*
> -         * With the domain lock dropped, d->is_dying may have changed. Call
> -         * ourselves recursively if so, which is safe as then we won't come
> -         * back here.
> -         */
> -        if ( d->is_dying != DOMDYING_alive )
> -            return domain_kill(d);
>           d->is_dying = DOMDYING_dying;
>           argo_destroy(d);
>           evtchn_destroy(d);
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index a69b3b59a8..e010079203 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -571,14 +571,11 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>           break;
>   
>       case XEN_DOMCTL_destroydomain:
> -        domctl_lock_release();
> -        domain_lock(d);
>           ret = domain_kill(d);
> -        domain_unlock(d);
>           if ( ret == -ERESTART )
>               ret = hypercall_create_continuation(
>                   __HYPERVISOR_domctl, "h", u_domctl);
> -        goto domctl_out_unlock_domonly;
> +        break;
>   
>       case XEN_DOMCTL_setnodeaffinity:
>       {
> 

-- 
Julien Grall

