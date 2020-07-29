Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C713F2325C5
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jul 2020 22:02:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0sHF-0000rB-H7; Wed, 29 Jul 2020 20:02:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TMQ+=BI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k0sHD-0000r6-M2
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2020 20:02:11 +0000
X-Inumbo-ID: 6261c439-d1d6-11ea-8cd8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6261c439-d1d6-11ea-8cd8-bc764e2007e4;
 Wed, 29 Jul 2020 20:02:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B6FBBAEB6;
 Wed, 29 Jul 2020 20:02:21 +0000 (UTC)
Subject: Re: [PATCH 2/5] xen/gnttab: Rework resource acquisition
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <784bf5c1-be13-2c09-5494-6eb64c400473@suse.com>
Date: Wed, 29 Jul 2020 22:02:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728113712.22966-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.07.2020 13:37, Andrew Cooper wrote:
> The existing logic doesn't function in the general case for mapping a guests
> grant table, due to arbitrary 32 frame limit, and the default grant table
> limit being 64.
> 
> In order to start addressing this, rework the existing grant table logic by
> implementing a single gnttab_acquire_resource().  This is far more efficient
> than the previous acquire_grant_table() in memory.c because it doesn't take
> the grant table write lock, and attempt to grow the table, for every single
> frame.

Among the code you replace there is a comment "Iterate backwards in case
table needs to grow" explaining why what you say about growing the grant
table didn't actually happen.

> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -4013,6 +4013,72 @@ static int gnttab_get_shared_frame_mfn(struct domain *d,
>       return 0;
>   }
>   
> +int gnttab_acquire_resource(
> +    struct domain *d, unsigned int id, unsigned long frame,
> +    unsigned int nr_frames, xen_pfn_t mfn_list[])
> +{
> +    struct grant_table *gt = d->grant_table;
> +    unsigned int i = nr_frames, tot_frames;
> +    void **vaddrs;
> +    int rc = 0;
> +
> +    /* Input sanity. */
> +    if ( !nr_frames )
> +        return -EINVAL;

I can't seem to be able to find an equivalent of this in the old logic,
and hence this looks like an unwarranted change in behavior to me. We
have quite a few hypercall ops where some count being zero is simply
a no-op, i.e. yielding success without doing anything.

> +    /* Overflow checks */
> +    if ( frame + nr_frames < frame )
> +        return -EINVAL;
> +
> +    tot_frames = frame + nr_frames;
> +    if ( tot_frames != frame + nr_frames )
> +        return -EINVAL;

I find the naming here quite confusing. I realize part of this stems
from the code you replace, but anyway: "unsigned long frame" typically
represents a memory frame number of some sort, making the calculation
look as if it was wrong. (Initially I merely meant to ask whether this
check isn't redundant with the prior one, or vice versa.)

> +    /* Grow table if necessary. */
> +    grant_write_lock(gt);
> +    switch ( id )
> +    {
> +        mfn_t tmp;
> +
> +    case XENMEM_resource_grant_table_id_shared:
> +        rc = gnttab_get_shared_frame_mfn(d, tot_frames - 1, &tmp);
> +        break;
> +
> +    case XENMEM_resource_grant_table_id_status:
> +        if ( gt->gt_version != 2 )
> +        {
> +    default:
> +            rc = -EINVAL;
> +            break;
> +        }
> +        rc = gnttab_get_status_frame_mfn(d, tot_frames - 1, &tmp);
> +        break;
> +    }
> +
> +    /* Any errors from growing the table? */
> +    if ( rc )
> +        goto out;
> +
> +    switch ( id )
> +    {
> +    case XENMEM_resource_grant_table_id_shared:
> +        vaddrs = gt->shared_raw;
> +        break;
> +
> +    case XENMEM_resource_grant_table_id_status:
> +        vaddrs = (void **)gt->status;

Now this is the kind of cast that I consider really dangerous, and hence
worth trying hard to avoid. With the code structure as is, I don't see
an immediate solution though.

> +        break;
> +    }

Worth having an ASSERT_UNREACHABLE() default case here?

Jan

