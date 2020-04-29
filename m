Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1D61BE1A5
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 16:51:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTo2v-0001OO-UU; Wed, 29 Apr 2020 14:50:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yqvu=6N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jTo2u-0001OJ-A9
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 14:50:44 +0000
X-Inumbo-ID: cc7124cc-8a28-11ea-9953-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc7124cc-8a28-11ea-9953-12813bfff9fa;
 Wed, 29 Apr 2020 14:50:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7E2C9AF7F;
 Wed, 29 Apr 2020 14:50:40 +0000 (UTC)
Subject: Re: [PATCH v2 2/5] xen/common/domctl: introduce
 XEN_DOMCTL_get/setdomaincontext
To: Paul Durrant <paul@xen.org>
References: <20200407173847.1595-1-paul@xen.org>
 <20200407173847.1595-3-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <70d94284-264b-b03d-1577-fafcf125a9b1@suse.com>
Date: Wed, 29 Apr 2020 16:50:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200407173847.1595-3-paul@xen.org>
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
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.04.2020 19:38, Paul Durrant wrote:
> @@ -358,6 +359,113 @@ static struct vnuma_info *vnuma_init(const struct xen_domctl_vnuma *uinfo,
>      return ERR_PTR(ret);
>  }
>  
> +struct domctl_context
> +{
> +    void *buffer;
> +    size_t len;
> +    size_t cur;
> +};
> +
> +static int accumulate_size(void *priv, const void *data, size_t len)
> +{
> +    struct domctl_context *c = priv;
> +
> +    if ( c->len + len < c->len )
> +        return -EOVERFLOW;
> +
> +    c->len += len;
> +
> +    return 0;
> +}
> +
> +static int save_data(void *priv, const void *data, size_t len)
> +{
> +    struct domctl_context *c = priv;
> +
> +    if ( c->len - c->cur < len )
> +        return -ENOSPC;
> +
> +    memcpy(c->buffer + c->cur, data, len);
> +    c->cur += len;
> +
> +    return 0;
> +}
> +
> +static int getdomaincontext(struct domain *d,
> +                            struct xen_domctl_getdomaincontext *gdc)
> +{
> +    struct domctl_context c = { };

Please can you use ZERO_BLOCK_PTR or some such for the buffer
field, such that errnoeous use of the field would not end up
as a (PV-controllable) NULL deref. (Yes, it's a domctl, but
still.) This being common code you also want to get things
right for Arm, irrespective of whether the code will be dead
there for now.

> +    int rc;
> +
> +    if ( d == current->domain )
> +        return -EPERM;
> +
> +    if ( guest_handle_is_null(gdc->buffer) ) /* query for buffer size */
> +    {
> +        if ( gdc->size )
> +            return -EINVAL;
> +
> +        /* dry run to acquire buffer size */
> +        rc = domain_save(d, accumulate_size, &c, true);
> +        if ( rc )
> +            return rc;
> +
> +        gdc->size = c.len;
> +        return 0;
> +    }
> +
> +    c.len = gdc->size;
> +    c.buffer = xmalloc_bytes(c.len);

What sizes are we looking at here? It may be better to use vmalloc()
right from the start. If not, I'd like to advocate for using
xmalloc_array() instead of xmalloc_bytes() - see the almost-XSA
commit cf38b4926e2b.

> +    if ( !c.buffer )
> +        return -ENOMEM;
> +
> +    rc = domain_save(d, save_data, &c, false);
> +
> +    gdc->size = c.cur;
> +    if ( !rc && copy_to_guest(gdc->buffer, c.buffer, gdc->size) )

As to my remark in patch 1 on the size field, applying to this size
field too - copy_to_user{,_hvm}() don't support a 64-bit value (on
y86 at least).

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -38,7 +38,7 @@
>  #include "hvm/save.h"
>  #include "memory.h"
>  
> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000012
> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000013

I don't see you making any change making the interface backwards
incompatible, hence no need for the bump.

> @@ -1129,6 +1129,44 @@ struct xen_domctl_vuart_op {
>                                   */
>  };
>  
> +/*
> + * Get/Set domain PV context. The same struct xen_domctl_domaincontext
> + * is used for both commands but with slightly different field semantics
> + * as follows:
> + *
> + * XEN_DOMCTL_getdomaincontext
> + * ---------------------------
> + *
> + * buffer (IN):   The buffer into which the context data should be
> + *                copied, or NULL to query the buffer size that should
> + *                be allocated.
> + * size (IN/OUT): If 'buffer' is NULL then the value passed in must be
> + *                zero, and the value passed out will be the size of the
> + *                buffer to allocate.
> + *                If 'buffer' is non-NULL then the value passed in must
> + *                be the size of the buffer into which data may be copied.

This leaves open whether the size also gets updated in this latter
case.

> + */
> +struct xen_domctl_getdomaincontext {
> +    uint64_t size;

If this is to remain 64-bits (with too large values suitably taken
care of for all cases - see above), uint64_aligned_t please for
consistency, if nothing else.

Jan

