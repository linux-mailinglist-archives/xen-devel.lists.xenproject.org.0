Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 995301BF73F
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 13:56:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU7nT-0005yO-0j; Thu, 30 Apr 2020 11:56:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jU7nR-0005yJ-O6
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 11:56:05 +0000
X-Inumbo-ID: 915e6a3c-8ad9-11ea-9a2f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 915e6a3c-8ad9-11ea-9a2f-12813bfff9fa;
 Thu, 30 Apr 2020 11:56:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3D31BAC7F;
 Thu, 30 Apr 2020 11:56:02 +0000 (UTC)
Subject: Re: [PATCH v2 4/5] common/domain: add a domain context record for
 shared_info...
To: Paul Durrant <paul@xen.org>
References: <20200407173847.1595-1-paul@xen.org>
 <20200407173847.1595-5-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4f1f401e-2382-1929-407b-37d5a2b64013@suse.com>
Date: Thu, 30 Apr 2020 13:56:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200407173847.1595-5-paul@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.04.2020 19:38, Paul Durrant wrote:
> --- a/tools/misc/xen-domctx.c
> +++ b/tools/misc/xen-domctx.c
> @@ -59,6 +59,16 @@ static void dump_header(struct domain_save_descriptor *desc)
>      off += desc->length;
>  }
>  
> +static void dump_shared_info(struct domain_save_descriptor *desc)
> +{
> +    DOMAIN_SAVE_TYPE(SHARED_INFO) s;
> +    READ(s);
> +    printf("    SHARED_INFO: field_width %u buffer size: %lu\n",
> +           s.field_width, desc->length - sizeof(s));
> +
> +    off += desc->length;
> +}

And nothing about the actual contents of the shared info struct?

> @@ -1646,6 +1647,86 @@ int continue_hypercall_on_cpu(
>      return 0;
>  }
>  
> +static int save_shared_info(const struct vcpu *v, struct domain_context *c,
> +                            bool dry_run)
> +{
> +    struct domain *d = v->domain;

const?

> +    struct domain_shared_info_context ctxt = {};
> +    size_t hdr_size = offsetof(typeof(ctxt), buffer);
> +    size_t size = hdr_size + PAGE_SIZE;
> +    int rc;
> +
> +    rc = DOMAIN_SAVE_BEGIN(SHARED_INFO, c, v, size);
> +    if ( rc )
> +        return rc;
> +
> +    if ( !dry_run )
> +        ctxt.field_width =
> +#ifdef CONFIG_COMPAT
> +            has_32bit_shinfo(d) ? 4 :
> +#endif
> +            8;

What are 4 and 8 to represent here? Taking Arm32 into account, the
only things I could think of are sizeof(xen_ulong_t) or
sizeof(guest_handle). I'd prefer if literal numbers could be avoided
here, such that it would become clear what property is really meant.

> +    rc = domain_save_data(c, &ctxt, hdr_size);
> +    if ( rc )
> +        return rc;
> +
> +    rc = domain_save_data(c, d->shared_info, PAGE_SIZE);
> +    if ( rc )
> +        return rc;
> +
> +    return domain_save_end(c);
> +}
> +
> +static int load_shared_info(struct vcpu *v, struct domain_context *c)
> +{
> +    struct domain *d = v->domain;
> +    struct domain_shared_info_context ctxt = {};
> +    size_t hdr_size = offsetof(typeof(ctxt), buffer);
> +    size_t size = hdr_size + PAGE_SIZE;
> +    unsigned int i;
> +    int rc;
> +
> +    rc = DOMAIN_LOAD_BEGIN(SHARED_INFO, c, v, size, true);
> +    if ( rc )
> +        return rc;
> +
> +    rc = domain_load_data(c, &ctxt, hdr_size);
> +    if ( rc )
> +        return rc;
> +
> +    for ( i = 0; i < ARRAY_SIZE(ctxt.pad); i++ )
> +        if ( ctxt.pad[i] )
> +            return -EINVAL;
> +
> +    switch ( ctxt.field_width )
> +    {
> +#ifdef CONFIG_COMPAT
> +    case 4:
> +        d->arch.has_32bit_shinfo = 1;

true and ...

> +        break;
> +#endif
> +    case 8:
> +#ifdef CONFIG_COMPAT
> +        d->arch.has_32bit_shinfo = 0;

... false respectively, please.

> +#endif
> +        break;
> +
> +    default:
> +        rc = -EINVAL;
> +        break;
> +    }
> +
> +    rc = domain_load_data(c, d->shared_info, PAGE_SIZE);
> +    if ( rc )
> +        return rc;
> +
> +    return domain_load_end(c);
> +}

While you check the padding fields of the header above, what about
currently unused fields of the shared_info struct itself?

There's a connection between shared_info and vcpu_info - this way
you may or may not restore vcpu_info - depending on guest behavior.
There not being a patch in the series to deal with vcpu_info, the
description here should imo at least outline the intended
interaction (including e.g. ordering between the [supposed] records).

Jan

