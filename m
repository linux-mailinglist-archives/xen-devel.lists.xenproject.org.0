Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BDA27AAEE
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 11:38:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMpbd-0004lF-IF; Mon, 28 Sep 2020 09:38:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMpbb-0004l2-SE
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 09:37:59 +0000
X-Inumbo-ID: 858679a5-6445-4d3c-90b0-0b1747c2a94f
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 858679a5-6445-4d3c-90b0-0b1747c2a94f;
 Mon, 28 Sep 2020 09:37:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601285875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w9dQUkERT1iNTaYRUQBUk+/jqzjM/Z8PmRYImsXG1lE=;
 b=T/74WF4W+A8HyQfgsjzBjDf1noWMdIETym02y3C3asTchxql1urvWftW+pHK+zjLX3XiFs
 NMsoso44iIHhIq4W7wUunqWMM3Jjqq7tONrx6CIMkQ5L8PK3F98MLQSkRTSrmfsp7t+jmu
 gu/qFAojTBe1G8kL94TQEITqZ1j1om4=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E27C1AC1D;
 Mon, 28 Sep 2020 09:37:54 +0000 (UTC)
Subject: Re: [PATCH v2 09/11] xen/memory: Fix mapping grant tables with
 XENMEM_acquire_resource
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
 <michal.leszczynski@cert.pl>, Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
 <20200922182444.12350-10-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eb9768ad-b6cd-b01e-d689-63775f6e5914@suse.com>
Date: Mon, 28 Sep 2020 11:37:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200922182444.12350-10-andrew.cooper3@citrix.com>
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

On 22.09.2020 20:24, Andrew Cooper wrote:
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4632,7 +4632,6 @@ int arch_acquire_resource(struct domain *d, unsigned int type,
>          if ( id != (unsigned int)ioservid )
>              break;
>  
> -        rc = 0;
>          for ( i = 0; i < nr_frames; i++ )
>          {
>              mfn_t mfn;
> @@ -4643,6 +4642,9 @@ int arch_acquire_resource(struct domain *d, unsigned int type,
>  
>              mfn_list[i] = mfn_x(mfn);
>          }
> +        if ( i == nr_frames )
> +            /* Success.  Passed nr_frames back to the caller. */
> +            rc = nr_frames;

With this, shouldn't the return type of the function be changed to
"long"? I realize that's no an issue with XENMEM_resource_ioreq_server
specifically, but I mean the general case.

> --- a/xen/common/compat/memory.c
> +++ b/xen/common/compat/memory.c
> @@ -402,23 +402,10 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>          case XENMEM_acquire_resource:
>          {
>              xen_pfn_t *xen_frame_list = NULL;
> -            unsigned int max_nr_frames;
>  
>              if ( copy_from_guest(&cmp.mar, compat, 1) )
>                  return -EFAULT;
>  
> -            /*
> -             * The number of frames handled is currently limited to a
> -             * small number by the underlying implementation, so the
> -             * scratch space should be sufficient for bouncing the
> -             * frame addresses.
> -             */
> -            max_nr_frames = (COMPAT_ARG_XLAT_SIZE - sizeof(*nat.mar)) /
> -                sizeof(*xen_frame_list);
> -
> -            if ( cmp.mar.nr_frames > max_nr_frames )
> -                return -E2BIG;
> -
>              /* Marshal the frame list in the remainder of the xlat space. */
>              if ( !compat_handle_is_null(cmp.mar.frame_list) )
>                  xen_frame_list = (xen_pfn_t *)(nat.mar + 1);
> @@ -432,6 +419,28 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>  
>              if ( xen_frame_list && cmp.mar.nr_frames )
>              {
> +                unsigned int xlat_max_frames =
> +                    (COMPAT_ARG_XLAT_SIZE - sizeof(*nat.mar)) /
> +                    sizeof(*xen_frame_list);
> +
> +                if ( start_extent >= nat.mar->nr_frames )
> +                    return -EINVAL;

Like for patch 2, I don't see why the == case should result in an
error, at the very least when start_extent is zero.

> @@ -611,6 +622,21 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>                  break;
>              }
>  
> +            if ( split < 0 )
> +            {
> +                /* Contintuation occured. */

Nit: Stray 't'. And missing 'r'?

> @@ -636,15 +662,45 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>                      compat_frame_list[i] = frame;
>                  }
>  
> -                if ( __copy_to_compat_offset(cmp.mar.frame_list, 0,
> -                                             compat_frame_list,
> -                                             cmp.mar.nr_frames) )
> +                if ( __copy_to_compat_offset(
> +                         cmp.mar.frame_list, start_extent,
> +                         compat_frame_list, done) )
>                      return -EFAULT;
>              }
> -            break;
> +
> +            start_extent += done;
> +
> +            /* Completely done. */
> +            if ( start_extent == cmp.mar.nr_frames )
> +                break;
> +
> +            /*
> +             * Done a "full" batch, but we were limited by space in the xlat
> +             * area.  Go around the loop again without necesserily returning
> +             * to guest context.
> +             */
> +            if ( done == nat.mar->nr_frames )
> +            {
> +                split = 1;
> +                break;
> +            }
> +
> +            /* Explicit continuation request from a higher level. */
> +            if ( done < nat.mar->nr_frames )
> +                return hypercall_create_continuation(
> +                    __HYPERVISOR_memory_op, "ih",
> +                    op | (start_extent << MEMOP_EXTENT_SHIFT), compat);
> +
> +            /*
> +             * Well... Somethings gone wrong with the two levels of chunking.
> +             * My condolences to whomever next has to debug this mess.
> +             */

Any suggestion how to overcome this "mess"?

> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -4105,6 +4105,9 @@ int gnttab_acquire_resource(
>      for ( i = 0; i < nr_frames; ++i )
>          mfn_list[i] = virt_to_mfn(vaddrs[frame + i]);
>  
> +    /* Success.  Passed nr_frames back to the caller. */

Nit: "Pass"?

> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1027,17 +1027,31 @@ static unsigned int resource_max_frames(struct domain *d,
>      }
>  }
>  
> +/*
> + * Returns -errno on error, or positive in the range [1, nr_frames] on
> + * success.  Returning less than nr_frames contitutes a request for a
> + * continuation.
> + */
> +static int _acquire_resource(
> +    struct domain *d, unsigned int type, unsigned int id, unsigned long frame,
> +    unsigned int nr_frames, xen_pfn_t mfn_list[])

As per the comment the return type may again want to be "long" here.
Albeit I realize the restriction to (UINT_MAX >> MEMOP_EXTENT_SHIFT)
makes this (and the other place above) only a latent issue for now,
so it may well be fine to be left as is.

> @@ -1087,26 +1098,47 @@ static int acquire_resource(
>          goto out;
>      }
>  
> +    /*
> +     * Limiting nr_frames at (UINT_MAX >> MEMOP_EXTENT_SHIFT) isn't ideal.  If
> +     * it ever becomes a practical problem, we can switch to mutating
> +     * xmar.{frame,nr_frames,frame_list} in guest memory.
> +     */

For 64-bit, extending the limit to ULONG_MAX >> MEMOP_EXTENT_SHIFT
may also be an option.

> +    rc = -EINVAL;
> +    if ( start_extent >= xmar.nr_frames ||

Again, at least when start_extent is zero, == should not result in an
error.

> +         xmar.nr_frames > (UINT_MAX >> MEMOP_EXTENT_SHIFT) )
> +        goto out;
> +
> +    /* Adjust for work done on previous continuations. */
> +    xmar.nr_frames -= start_extent;
> +    xmar.frame += start_extent;
> +    guest_handle_add_offset(xmar.frame_list, start_extent);
> +
>      do {
> -        switch ( xmar.type )
> -        {
> -        case XENMEM_resource_grant_table:
> -            rc = gnttab_acquire_resource(d, xmar.id, xmar.frame, xmar.nr_frames,
> -                                         mfn_list);
> -            break;
> +        /*
> +         * Arbitrary size.  Not too much stack space, and a reasonable stride
> +         * for continutation checks.

Nit: Stray 't' again.

> @@ -1126,7 +1158,32 @@ static int acquire_resource(
>                      rc = -EIO;
>              }
>          }
> -    } while ( 0 );
> +
> +        if ( rc )
> +            goto out;
> +
> +        xmar.nr_frames -= done;
> +        xmar.frame += done;
> +        guest_handle_add_offset(xmar.frame_list, done);
> +        start_extent += done;
> +
> +        /*
> +         * Explicit contination request from _acquire_resource(), or we've

Nit: Missing 'u' this time round.

Jan

