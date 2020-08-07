Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6795D23ED9D
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 15:00:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k41yJ-0006d5-Lg; Fri, 07 Aug 2020 12:59:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERlR=BR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k41yI-0006d0-Nw
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 12:59:42 +0000
X-Inumbo-ID: b413e6f2-d939-491b-a821-c5c4a87d2aca
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b413e6f2-d939-491b-a821-c5c4a87d2aca;
 Fri, 07 Aug 2020 12:59:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E31FCAC1C;
 Fri,  7 Aug 2020 12:59:58 +0000 (UTC)
Subject: Re: [PATCH 06/14] kernel-doc: public/grant_table.h
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
 <20200806234933.16448-6-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5a4d6a81-bc8f-3d00-f760-d39023711dbc@suse.com>
Date: Fri, 7 Aug 2020 14:59:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200806234933.16448-6-sstabellini@kernel.org>
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
Cc: julien@xen.org, wl@xen.org, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.08.2020 01:49, Stefano Stabellini wrote:
> @@ -108,56 +107,66 @@
>   *  Use SMP-safe bit-setting instruction.
>   */
>  
> -/*
> +/**
> + * typedef
>   * Reference to a grant entry in a specified domain's grant table.
>   */
>  typedef uint32_t grant_ref_t;

In the comment, did you mean grant_ref_t?

> -/*
> +/**
> + * DOC: grant table
> + *
>   * A grant table comprises a packed array of grant entries in one or more
>   * page frames shared between Xen and a guest.
>   * [XEN]: This field is written by Xen and read by the sharing guest.
>   * [GST]: This field is written by the guest and read by Xen.
>   */
>  
> -/*
> - * Version 1 of the grant table entry structure is maintained purely
> - * for backwards compatibility.  New guests should use version 2.
> - */
>  #if __XEN_INTERFACE_VERSION__ < 0x0003020a
>  #define grant_entry_v1 grant_entry
>  #define grant_entry_v1_t grant_entry_t
>  #endif
> +/**
> + * struct grant_entry_v1
> + *
> + * Version 1 of the grant table entry structure is maintained purely
> + * for backwards compatibility.  New guests should use version 2.
> + */

I realize content changes aren't intended, but here I can't resist
recommending to drop the second sentence at this occasion.

> +/**
> + * DOC: Values for error status returns. All errors are -ve.
> + *
> + *
> + * - GNTST_okay: Normal return.

Nit: Why two blank comment lines above?

Jan

