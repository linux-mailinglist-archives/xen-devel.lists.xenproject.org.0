Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4481927894A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 15:18:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLnbx-00067x-Tu; Fri, 25 Sep 2020 13:18:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9v36=DC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kLnbx-00067p-DJ
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 13:18:05 +0000
X-Inumbo-ID: 95fd6702-577b-4cfd-9cf5-1c879aa2aec4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95fd6702-577b-4cfd-9cf5-1c879aa2aec4;
 Fri, 25 Sep 2020 13:18:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601039879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xXgw2P+7vHee5I5lh4MmXDgQ4qN6DFXWEOcBuXtl3vU=;
 b=LghM2MAZiiPelR8KxrrppIqWHjs+0KBQCud6tP4aBYOh9MeR84I6qi6HV4VZnYdmKQ5ucq
 i5a/wyF2gdUhagpHnxvQ3BQhFEgwzWDs+XXNmldFzxYJpwHA5tJ6hQe2Sw/B33zGteZZtr
 Y+by5A/i114gm9C8gkxa96DiSW/JYiI=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A219FAF0E;
 Fri, 25 Sep 2020 13:17:59 +0000 (UTC)
Subject: Re: [PATCH v2 02/11] xen/gnttab: Rework resource acquisition
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
 <michal.leszczynski@cert.pl>, Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
 <20200922182444.12350-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <538236fd-af25-9e35-8f44-3125fe71e4bd@suse.com>
Date: Fri, 25 Sep 2020 15:17:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200922182444.12350-3-andrew.cooper3@citrix.com>
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
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -4013,6 +4013,81 @@ static int gnttab_get_shared_frame_mfn(struct domain *d,
>      return 0;
>  }
>  
> +int gnttab_acquire_resource(
> +    struct domain *d, unsigned int id, unsigned long frame,
> +    unsigned int nr_frames, xen_pfn_t mfn_list[])
> +{
> +    struct grant_table *gt = d->grant_table;
> +    unsigned int i = nr_frames, tot_frames;
> +    mfn_t tmp;
> +    void **vaddrs = NULL;
> +    int rc;
> +
> +    /* Input sanity. */
> +    if ( !nr_frames )
> +        return -EINVAL;

I continue to object to this becoming an error. It wasn't before,
and it wouldn't be in line with various other operations, not the
least XENMEM_resource_ioreq_server handling, but also various of
the other mem-op functions (just to give concrete examples) or
basically all of the grant-table ones.

And if it really was to be an error, it could be had by folding
into ...

> +    /* Overflow checks */
> +    if ( frame + nr_frames < frame )
> +        return -EINVAL;

this:

    if ( frame + nr_frames <= frame )
        return -EINVAL;

> +    tot_frames = frame + nr_frames;
> +    if ( tot_frames != frame + nr_frames )
> +        return -EINVAL;
> +
> +    /* Grow table if necessary. */
> +    grant_write_lock(gt);
> +    switch ( id )
> +    {
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
> +        /* Check that void ** is a suitable representation for gt->status. */
> +        BUILD_BUG_ON(!__builtin_types_compatible_p(
> +                         typeof(gt->status), grant_status_t **));
> +        vaddrs = (void **)gt->status;
> +        break;
> +    }

Why the 2nd switch()? As long as you don't de-reference vaddrs
prior to checking rc, I don't see anything that could go wrong.
And once both are folded, maybe vaddr's initializer could also
be dropped again?

Jan

