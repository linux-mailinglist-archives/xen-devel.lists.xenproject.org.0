Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1879A2530C5
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 15:58:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAvw6-0005KV-W7; Wed, 26 Aug 2020 13:57:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vb2W=CE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kAvw5-0005KQ-3P
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 13:57:57 +0000
X-Inumbo-ID: e410aba1-9b7a-4a8f-a857-a52baf04d1c9
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e410aba1-9b7a-4a8f-a857-a52baf04d1c9;
 Wed, 26 Aug 2020 13:57:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E4934AD4A;
 Wed, 26 Aug 2020 13:58:26 +0000 (UTC)
Subject: Re: [PATCH v7 7/9] common/domain: add a domain context record for
 shared_info...
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20200818103032.3050-1-paul@xen.org>
 <20200818103032.3050-8-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cd33c5ce-ea85-6576-b9f2-b4dec90d5025@suse.com>
Date: Wed, 26 Aug 2020 15:57:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200818103032.3050-8-paul@xen.org>
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

On 18.08.2020 12:30, Paul Durrant wrote:
> v7:
>  - Only restore vcpu_info and arch sub-structures for PV domains, to match
>    processing of SHARED_INFO in xc_sr_restore_x86_pv.c

Since you point out this original logic, ...

> +static int load_shared_info(struct domain *d, struct domain_context *c)
> +{
> +    struct domain_shared_info_context ctxt;
> +    size_t hdr_size = offsetof(typeof(ctxt), buffer);
> +    unsigned int i;
> +    int rc;
> +
> +    rc = DOMAIN_LOAD_BEGIN(SHARED_INFO, c, &i);
> +    if ( rc )
> +        return rc;
> +
> +    if ( i ) /* expect only a single instance */
> +        return -ENXIO;
> +
> +    rc = domain_load_data(c, &ctxt, hdr_size);
> +    if ( rc )
> +        return rc;
> +
> +    if ( ctxt.buffer_size > sizeof(shared_info_t) ||
> +         (ctxt.flags & ~DOMAIN_SAVE_32BIT_SHINFO) )
> +        return -EINVAL;
> +
> +    if ( ctxt.flags & DOMAIN_SAVE_32BIT_SHINFO )
> +    {
> +#ifdef CONFIG_COMPAT
> +        has_32bit_shinfo(d) = true;
> +#else
> +        return -EINVAL;
> +#endif
> +    }
> +
> +    if ( is_pv_domain(d) )
> +    {
> +        shared_info_t *shinfo = xmalloc(shared_info_t);
> +
> +        rc = domain_load_data(c, shinfo, sizeof(*shinfo));
> +        if ( rc )
> +        {
> +            xfree(shinfo);
> +            return rc;
> +        }
> +
> +#ifdef CONFIG_COMPAT
> +        if ( has_32bit_shinfo(d) )
> +        {
> +            memcpy(&d->shared_info->compat.vcpu_info,
> +                   &shinfo->compat.vcpu_info,
> +                   sizeof(d->shared_info->compat.vcpu_info));
> +            memcpy(&d->shared_info->compat.arch,
> +                   &shinfo->compat.arch,
> +                   sizeof(d->shared_info->compat.vcpu_info));
> +        }
> +        else
> +        {
> +            memcpy(&d->shared_info->native.vcpu_info,
> +                   &shinfo->native.vcpu_info,
> +                   sizeof(d->shared_info->native.vcpu_info));
> +            memcpy(&d->shared_info->native.arch,
> +                   &shinfo->native.arch,
> +                   sizeof(d->shared_info->native.arch));
> +        }
> +#else
> +        memcpy(&d->shared_info->vcpu_info,
> +               &shinfo->vcpu_info,
> +               sizeof(d->shared_info->vcpu_info));
> +        memcpy(&d->shared_info->arch,
> +               &shinfo->arch,
> +               sizeof(d->shared_info->shared));
> +#endif

... where does the rest of that logic (resetting of
arch.pfn_to_mfn_frame_list_list, evtchn_pending, evtchn_mask, and
evtchn_pending_sel) get done? Or why is it not needed anymore?

Jan

