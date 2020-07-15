Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E19FC220CE7
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 14:29:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvgWx-0003ye-FD; Wed, 15 Jul 2020 12:28:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvgWv-0003yZ-KT
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 12:28:57 +0000
X-Inumbo-ID: bfe0b038-c696-11ea-93d4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bfe0b038-c696-11ea-93d4-12813bfff9fa;
 Wed, 15 Jul 2020 12:28:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 513C2AC83;
 Wed, 15 Jul 2020 12:28:58 +0000 (UTC)
Subject: Re: [PATCH v6 01/11] memory: batch processing in acquire_resource()
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
 <02415890e4e8211513b495228c790e1d16de767f.1594150543.git.michal.leszczynski@cert.pl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <83100b6c-3a06-e379-bef0-fcbd8fdcce98@suse.com>
Date: Wed, 15 Jul 2020 14:28:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <02415890e4e8211513b495228c790e1d16de767f.1594150543.git.michal.leszczynski@cert.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 tamas.lengyel@intel.com, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei.kang@intel.com,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.07.2020 21:39, Michał Leszczyński wrote:
> From: Michal Leszczynski <michal.leszczynski@cert.pl>
> 
> Allow to acquire large resources by allowing acquire_resource()
> to process items in batches, using hypercall continuation.
> 
> Be aware that this modifies the behavior of acquire_resource
> call with frame_list=NULL. While previously it would return
> the size of internal array (32), with this patch it returns
> the maximal quantity of frames that could be requested at once,
> i.e. UINT_MAX >> MEMOP_EXTENT_SHIFT.

This isn't really a behavioral change, and hence I'd prefer this
to be re-worded: It was and is the upper bound on request sizes
that gets reported here. It's just that this upper bound now
changes.

> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1046,10 +1046,12 @@ static int acquire_grant_table(struct domain *d, unsigned int id,
>  }
>  
>  static int acquire_resource(
> -    XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg)
> +    XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg,
> +    unsigned long *start_extent)
>  {
>      struct domain *d, *currd = current->domain;
>      xen_mem_acquire_resource_t xmar;
> +    uint32_t total_frames;

Please don't use fixed width types when plain C types will do
(unsigned int here).

> @@ -1069,7 +1071,7 @@ static int acquire_resource(
>          if ( xmar.nr_frames )
>              return -EINVAL;
>  
> -        xmar.nr_frames = ARRAY_SIZE(mfn_list);
> +        xmar.nr_frames = UINT_MAX >> MEMOP_EXTENT_SHIFT;
>  
>          if ( __copy_field_to_guest(arg, &xmar, nr_frames) )
>              return -EFAULT;
> @@ -1077,8 +1079,28 @@ static int acquire_resource(
>          return 0;
>      }
>  
> +    total_frames = xmar.nr_frames;
> +
> +    /* Is the size too large for us to encode a continuation? */
> +    if ( unlikely(xmar.nr_frames > (UINT_MAX >> MEMOP_EXTENT_SHIFT)) )
> +        return -EINVAL;
> +
> +    if ( *start_extent )
> +    {
> +        /*
> +         * Check whether start_extent is in bounds, as this
> +         * value if visible to the calling domain.
> +         */
> +        if ( *start_extent > xmar.nr_frames )
> +            return -EINVAL;
> +
> +        xmar.frame += *start_extent;
> +        xmar.nr_frames -= *start_extent;
> +        guest_handle_add_offset(xmar.frame_list, *start_extent);
> +    }

May I ask that you drop the if() around this block of code?

Also, looking at this, I wonder whether it's a good idea to use the
"start extent" model here anyway: You could as well update the
struct (saying that it may be clobbered in the public header) and
copy the whole thing back to the original guest struct. This would
then remove the pretty arbitrary "UINT_MAX >> MEMOP_EXTENT_SHIFT"
limit you currently need to enforce. The main question is whether
we'd consider such an adjustment to an existing interface
acceptable; there's an at least theoretical risk that it may break
existing callers. Then again no existing caller can sensibly have
specified a count above 32, and when the copying back would be
limited to just the continuation case, no such caller would be
affected in any way afaict.

Jan

