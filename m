Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAC226BEC7
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 10:05:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kISQv-0006k2-Os; Wed, 16 Sep 2020 08:04:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kISQt-0006jx-Rp
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 08:04:51 +0000
X-Inumbo-ID: 7f0fe62e-f556-4818-a7e2-213c04a4e0ba
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f0fe62e-f556-4818-a7e2-213c04a4e0ba;
 Wed, 16 Sep 2020 08:04:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 54642AD0F;
 Wed, 16 Sep 2020 08:05:05 +0000 (UTC)
Subject: Re: [PATCH V1 11/16] xen/ioreq: Introduce
 hvm_domain_has_ioreq_server()
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-12-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <93cc6603-44f2-1ceb-997d-cbc51c3ba2c3@suse.com>
Date: Wed, 16 Sep 2020 10:04:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1599769330-17656-12-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch introduces a helper the main purpose of which is to check
> if a domain is using IOREQ server(s).
> 
> On Arm the benefit is to avoid calling handle_hvm_io_completion()
> (which implies iterating over all possible IOREQ servers anyway)
> on every return in leave_hypervisor_to_guest() if there is no active
> servers for the particular domain.
> 
> This involves adding an extra per-domain variable to store the count
> of servers in use.

Since only Arm needs the variable (and the helper), perhaps both should
be Arm-specific (which looks to be possible without overly much hassle)?

> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -38,9 +38,15 @@ static void set_ioreq_server(struct domain *d, unsigned int id,
>                               struct hvm_ioreq_server *s)
>  {
>      ASSERT(id < MAX_NR_IOREQ_SERVERS);
> -    ASSERT(!s || !d->arch.hvm.ioreq_server.server[id]);
> +    ASSERT((!s && d->arch.hvm.ioreq_server.server[id]) ||
> +           (s && !d->arch.hvm.ioreq_server.server[id]));

For one, this can be had with less redundancy (and imo even improved
clarity, but I guess this latter aspect my depend on personal
preferences):

    ASSERT(d->arch.hvm.ioreq_server.server[id] ? !s : !!s);

But then I wonder whether the original intention wasn't rather such
that replacing NULL by NULL is permissible. Paul?

>      d->arch.hvm.ioreq_server.server[id] = s;
> +
> +    if ( s )
> +        d->arch.hvm.ioreq_server.nr_servers ++;
> +    else
> +        d->arch.hvm.ioreq_server.nr_servers --;

Nit: Stray blanks (should be there only with binary operators).

> @@ -1395,6 +1401,7 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered)
>  void hvm_ioreq_init(struct domain *d)
>  {
>      spin_lock_init(&d->arch.hvm.ioreq_server.lock);
> +    d->arch.hvm.ioreq_server.nr_servers = 0;

There's no need for this - struct domain instances start out all
zero anyway.

> --- a/xen/include/xen/ioreq.h
> +++ b/xen/include/xen/ioreq.h
> @@ -57,6 +57,11 @@ struct hvm_ioreq_server {
>      uint8_t                bufioreq_handling;
>  };
>  
> +static inline bool hvm_domain_has_ioreq_server(const struct domain *d)
> +{
> +    return (d->arch.hvm.ioreq_server.nr_servers > 0);
> +}

This is safe only when d == current->domain and it's not paused,
or when they're distinct and d is paused. Otherwise the result is
stale before the caller can inspect it. This wants documenting by
at least a comment, but perhaps better by suitable ASSERT()s.

As in earlier patches I don't think a hvm_ prefix should be used
here.

Also as a nit: The parentheses here are unnecessary, and strictly
speaking the "> 0" is, too.

Jan

