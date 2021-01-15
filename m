Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D68BA2F8051
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 17:12:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68412.122504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Ri4-0000Zn-C6; Fri, 15 Jan 2021 16:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68412.122504; Fri, 15 Jan 2021 16:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Ri4-0000ZO-8R; Fri, 15 Jan 2021 16:12:24 +0000
Received: by outflank-mailman (input) for mailman id 68412;
 Fri, 15 Jan 2021 16:12:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0Ri3-0000ZJ-AK
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 16:12:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 587dc7f5-e948-4b97-9952-0c29a549174a;
 Fri, 15 Jan 2021 16:12:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EFDEEB773;
 Fri, 15 Jan 2021 16:12:20 +0000 (UTC)
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
X-Inumbo-ID: 587dc7f5-e948-4b97-9952-0c29a549174a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610727141; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hNRo8P2mowXjv4E2CyKLuvROcOs4fbisHu3fek+nGaI=;
	b=KDGCfEBRTb79pVmitg51RfTWZeoK5r1dq7g71x3vPIcnDZW6Aj/O2B+up7JMGBgx2z9Bhd
	Sa7PnoRxynLArdN7l5b9nzaZDaf7Ha6XdbMwfrYEYSAV4R56kU8nWuQqNdGJI6tgYDgpR1
	5Yk/4W46Wvl6O1i3G0592OiUDXMJaQY=
Subject: Re: [PATCH v3 7/7] xen/memory: Fix mapping grant tables with
 XENMEM_acquire_resource
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210112194841.1537-1-andrew.cooper3@citrix.com>
 <20210112194841.1537-8-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <65d256c1-e9c0-3859-b6fc-d3b7a41ef964@suse.com>
Date: Fri, 15 Jan 2021 17:12:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210112194841.1537-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.01.2021 20:48, Andrew Cooper wrote:
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4628,7 +4628,6 @@ int arch_acquire_resource(struct domain *d, unsigned int type,
>          if ( id != (unsigned int)ioservid )
>              break;
>  
> -        rc = 0;
>          for ( i = 0; i < nr_frames; i++ )
>          {
>              mfn_t mfn;

How "good" are our chances that older gcc won't recognize that
without this initialization ...

> @@ -4639,6 +4638,9 @@ int arch_acquire_resource(struct domain *d, unsigned int type,
>  
>              mfn_list[i] = mfn_x(mfn);
>          }
> +        if ( i == nr_frames )
> +            /* Success.  Passed nr_frames back to the caller. */
> +            rc = nr_frames;

... rc will nevertheless not remain uninitialized when nr_frames
is zero?

> @@ -432,6 +419,28 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>  
>              if ( xen_frame_list && cmp.mar.nr_frames )
>              {
> +                unsigned int xlat_max_frames =
> +                    (COMPAT_ARG_XLAT_SIZE - sizeof(*nat.mar)) /
> +                    sizeof(*xen_frame_list);
> +
> +                if ( start_extent >= nat.mar->nr_frames )

Comparing with the enclosing if() I find it slightly confusing
that different instances of nr_frames get used. Perhaps best to
adjust the earlier patch to also use nat.mar->nr_frames? Or is
this perhaps on purpose?

> +                    return -EINVAL;
> +
> +                /*
> +                 * Adjust nat to account for work done on previous
> +                 * continuations, leaving cmp pristine.  Hide the continaution

Nit: continuation

> +                 * from the native code to prevent double accounting.
> +                 */
> +                nat.mar->nr_frames -= start_extent;
> +                nat.mar->frame += start_extent;
> +                cmd &= MEMOP_CMD_MASK;
> +
> +                /*
> +                 * If there are two many frames to fit within the xlat buffer,

s/two/too/

> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1072,17 +1072,31 @@ static unsigned int resource_max_frames(const struct domain *d,
>      }
>  }
>  
> +/*
> + * Returns -errno on error, or positive in the range [1, nr_frames] on
> + * success.  Returning less than nr_frames contitutes a request for a

Nit: constitutes

> @@ -1127,26 +1138,47 @@ static int acquire_resource(
>          goto out;
>      }
>  
> +    /*
> +     * Limiting nr_frames at (UINT_MAX >> MEMOP_EXTENT_SHIFT) isn't ideal.  If
> +     * it ever becomes a practical problem, we can switch to mutating
> +     * xmar.{frame,nr_frames,frame_list} in guest memory.
> +     */
> +    rc = -EINVAL;
> +    if ( start_extent >= xmar.nr_frames ||

At the very least start_extend == 0 and xmar.nr_frames == 0
ought to be "success" (with nothing done). Elsewhere I think
we generalize this and only reject start_extent > nr, which
to me suggests we also should do so here (and in the compat
handling) for consistency. Of course this then means ...

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
> +         * for continuation checks.
> +         */
> +        xen_pfn_t mfn_list[32];
> +        unsigned int todo = MIN(ARRAY_SIZE(mfn_list), xmar.nr_frames), done;
>  
> -        default:
> -            rc = arch_acquire_resource(d, xmar.type, xmar.id, xmar.frame,
> -                                       xmar.nr_frames, mfn_list);
> -            break;
> -        }
> +        rc = _acquire_resource(d, xmar.type, xmar.id, xmar.frame,
> +                               todo, mfn_list);
> +        if ( rc < 0 )
> +            goto out;
>  
> -        if ( rc )
> +        done = rc;
> +        rc = 0;
> +        if ( done == 0 || done > todo )

... to only retain the right side of the || here and ...

> @@ -1166,7 +1198,32 @@ static int acquire_resource(
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
> +         * Explicit continuation request from _acquire_resource(), or we've
> +         * still got more work to do.
> +         */
> +        if ( done < todo ||
> +             (xmar.nr_frames && hypercall_preempt_check()) )
> +        {
> +            rc = hypercall_create_continuation(
> +                __HYPERVISOR_memory_op, "lh",
> +                XENMEM_acquire_resource | (start_extent << MEMOP_EXTENT_SHIFT),
> +                arg);
> +            goto out;
> +        }
> +
> +    } while ( xmar.nr_frames );

... converting this loop from do-while to just while.

Jan

