Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 471BF2E08E0
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 11:35:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57732.101113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krf0a-00023n-DT; Tue, 22 Dec 2020 10:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57732.101113; Tue, 22 Dec 2020 10:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krf0a-00023R-AH; Tue, 22 Dec 2020 10:35:12 +0000
Received: by outflank-mailman (input) for mailman id 57732;
 Tue, 22 Dec 2020 10:35:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9/vU=F2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krf0Y-00023M-RU
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 10:35:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ffeb83d-79d2-4c38-afb3-9a8f41b07a7f;
 Tue, 22 Dec 2020 10:35:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B4240B293;
 Tue, 22 Dec 2020 10:35:08 +0000 (UTC)
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
X-Inumbo-ID: 0ffeb83d-79d2-4c38-afb3-9a8f41b07a7f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608633308; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AgGjLf2ZtUsAUXY1JeTK7FVgb00mtwMbM6yXJdcbchY=;
	b=tkUgu6grxpjftL1cONBOWJxl1hL54VT+n5Keiq8CpTkPomb+CfZxgSZJzv3KLfs82/JIhb
	EGAe+/ujGuPrw7u0jgKAVHc7JFYZVvd2uFreLFv9dcnH3A4JWRujLoFhcMWazjgO5yHgs9
	RhrO2Sv8xk+IlmG9fOkpQ4fsS3rFhCk=
Subject: Re: [PATCH 2/3] xen/domain: Introduce domain_teardown()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20201221181446.7791-1-andrew.cooper3@citrix.com>
 <20201221181446.7791-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b3d1cb55-2793-f37e-13d1-b9e8de2057da@suse.com>
Date: Tue, 22 Dec 2020 11:35:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201221181446.7791-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.12.2020 19:14, Andrew Cooper wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -273,6 +273,59 @@ static int __init parse_extra_guest_irqs(const char *s)
>  custom_param("extra_guest_irqs", parse_extra_guest_irqs);
>  
>  /*
> + * Release resources held by a domain.  There may or may not be live
> + * references to the domain, and it may or may not be fully constructed.
> + *
> + * d->is_dying differing between DOMDYING_dying and DOMDYING_dead can be used
> + * to determine if live references to the domain exist, and also whether
> + * continuations are permitted.
> + *
> + * If d->is_dying is DOMDYING_dead, this must not return non-zero.
> + */
> +static int domain_teardown(struct domain *d)
> +{
> +    BUG_ON(!d->is_dying);
> +
> +    /*
> +     * This hypercall can take minutes of wallclock time to complete.  This
> +     * logic implements a co-routine, stashing state in struct domain across
> +     * hypercall continuation boundaries.
> +     */
> +    switch ( d->teardown.val )
> +    {
> +        /*
> +         * Record the current progress.  Subsequent hypercall continuations
> +         * will logically restart work from this point.
> +         *
> +         * PROGRESS() markers must not be in the middle of loops.  The loop
> +         * variable isn't preserved across a continuation.
> +         *
> +         * To avoid redundant work, there should be a marker before each
> +         * function which may return -ERESTART.
> +         */
> +#define PROGRESS(x)                             \
> +        d->teardown.val = PROG_ ## x;           \
> +        /* Fallthrough */                       \
> +    case PROG_ ## x
> +
> +        enum {
> +            PROG_done = 1,
> +        };
> +
> +    case 0:
> +    PROGRESS(done):
> +        break;
> +
> +#undef PROGRESS
> +
> +    default:
> +        BUG();
> +    }
> +
> +    return 0;
> +}

While as an initial step this may be okay, I envision ordering issues
with domain_relinquish_resources() - there may be per-arch things that
want doing before certain common ones, and others which should only
be done when certain common teardown was already performed. Therefore
rather than this being a "common equivalent of
domain_relinquish_resources()", I'd rather see (and call) it a
(designated) replacement, where individual per-arch functions would
get called at appropriate times.

Jan

