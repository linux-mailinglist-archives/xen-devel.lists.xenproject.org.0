Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 386452690C0
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 17:56:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHqqJ-0004kh-4N; Mon, 14 Sep 2020 15:56:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kHqqI-0004kc-0C
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 15:56:34 +0000
X-Inumbo-ID: 9ad677a8-1fa0-4a62-abca-2fe5b58f25b7
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ad677a8-1fa0-4a62-abca-2fe5b58f25b7;
 Mon, 14 Sep 2020 15:56:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D85EBAF80;
 Mon, 14 Sep 2020 15:56:47 +0000 (UTC)
Subject: Re: [PATCH V1 07/16] xen/dm: Make x86's DM feature common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-8-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <70919183-5215-2efb-d399-2b2d5dd8b5ed@suse.com>
Date: Mon, 14 Sep 2020 17:56:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1599769330-17656-8-git-send-email-olekstysh@gmail.com>
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
> --- a/xen/include/xen/hypercall.h
> +++ b/xen/include/xen/hypercall.h
> @@ -150,6 +150,18 @@ do_dm_op(
>      unsigned int nr_bufs,
>      XEN_GUEST_HANDLE_PARAM(xen_dm_op_buf_t) bufs);
>  
> +struct dmop_args {
> +    domid_t domid;
> +    unsigned int nr_bufs;
> +    /* Reserve enough buf elements for all current hypercalls. */
> +    struct xen_dm_op_buf buf[2];
> +};
> +
> +int arch_dm_op(struct xen_dm_op *op,
> +               struct domain *d,
> +               const struct dmop_args *op_args,
> +               bool *const_op);
> +
>  #ifdef CONFIG_HYPFS
>  extern long
>  do_hypfs_op(

There are exactly two CUs which need to see these two declarations.
Personally I think they should go into a new header, or at least
into one that half-way fits (from the pov of its other contents)
and doesn't get included by half the code base. But maybe it's
just me ...

Jan

