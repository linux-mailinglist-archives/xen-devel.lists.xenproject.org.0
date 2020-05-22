Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D23D1DE916
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 16:35:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc8ku-0004ae-Bo; Fri, 22 May 2020 14:34:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=knsM=7E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jc8ks-0004aZ-A0
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 14:34:34 +0000
X-Inumbo-ID: 5a491de6-9c39-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a491de6-9c39-11ea-b9cf-bc764e2007e4;
 Fri, 22 May 2020 14:34:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D72DBABB2;
 Fri, 22 May 2020 14:34:34 +0000 (UTC)
Subject: Re: [PATCH v5 4/5] common/domain: add a domain context record for
 shared_info...
To: Paul Durrant <paul@xen.org>
References: <20200521161939.4508-1-paul@xen.org>
 <20200521161939.4508-5-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6090d080-e771-81fe-0b64-e25c7a8c52eb@suse.com>
Date: Fri, 22 May 2020 16:34:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521161939.4508-5-paul@xen.org>
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

On 21.05.2020 18:19, Paul Durrant wrote:
> @@ -1649,6 +1650,70 @@ int continue_hypercall_on_cpu(
>      return 0;
>  }
>  
> +static int save_shared_info(const struct domain *d, struct domain_context *c,
> +                            bool dry_run)
> +{
> +    struct domain_shared_info_context ctxt = {
> +#ifdef CONFIG_COMPAT
> +        .flags = has_32bit_shinfo(d) ? DOMAIN_SAVE_32BIT_SHINFO : 0,
> +#endif
> +        .buffer_size = sizeof(shared_info_t),

But this size varies between native and compat.

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
> +    if ( ctxt.buffer_size != sizeof(shared_info_t) )
> +        return -EINVAL;

While on the save side things could be left as they are (yet
I'd prefer a change), this should be flexible enough to allow
at least the smaller compat size as well in the compat case.
I wonder whether any smaller sizes might be acceptable, once
again with the rest getting zero-padded.

> +    if ( ctxt.flags & DOMAIN_SAVE_32BIT_SHINFO )
> +#ifdef CONFIG_COMPAT
> +        has_32bit_shinfo(d) = true;
> +#else
> +        return -EINVAL;
> +#endif

Am I mis-remembering or was a check lost of the remaining
flags being zero? If I am, one needs adding in any case, imo.

Jan

