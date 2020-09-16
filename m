Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7200C26C3D6
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 16:44:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIYeX-0004eT-5P; Wed, 16 Sep 2020 14:43:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kIYeV-0004eO-HI
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 14:43:19 +0000
X-Inumbo-ID: 51bca441-eff6-4cd3-8333-44d14b7eb0c1
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51bca441-eff6-4cd3-8333-44d14b7eb0c1;
 Wed, 16 Sep 2020 14:43:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=cantorsusede; t=1600267397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2HVHS8oF1KfpVXlkvdeNa9L/ObodYTU5oi46pA/YieU=;
 b=N04knDFeE/5FG6thdopCllcWuOh1Y8Lj5xLrIaFboUCT2Ao278uWe/PLTfEnfthFCfFXii
 A682d3DFqqmGW5nibw4lhfEEZ+mMx8aB6LIQUgGSAg7QXAkX27J9Nk5sQajxGwU6ycauhB
 m9BAWl3hfLM8DR5W3IajuBoeqF2SD7J5m3os5arUU3dqhZxa7RV4C69toBoJ7oiIZKuQEL
 6P2j5GKBW8kbhf//XRGHRw/d6fAwJ5DQ1aHJpejeRn+C65reb6rirDnNfuDZ61uYtf+2VD
 jCDcQKcQdLdAbpQFjh0O85dSifCYgjNaDb+8ydOcF+iUS961iqdR4tTATN92YQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1BCF9B3B6;
 Wed, 16 Sep 2020 14:43:33 +0000 (UTC)
Subject: Re: [PATCH v8 6/8] common/domain: add a domain context record for
 shared_info...
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20200915161800.1384-1-paul@xen.org>
 <20200915161800.1384-7-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <98b1a80c-ba59-5d91-657f-74aaab5dae1d@suse.com>
Date: Wed, 16 Sep 2020 16:43:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200915161800.1384-7-paul@xen.org>
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

On 15.09.2020 18:17, Paul Durrant wrote:
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

You need to check the allocation's success first. But of course the
question is why you don't read directly into d->shared_info. The
domain is paused at this point, isn't it?

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
> +            memset(&d->shared_info->compat.evtchn_pending,
> +                   0,
> +                   sizeof(d->shared_info->compat.evtchn_pending));
> +            memset(&d->shared_info->compat.evtchn_mask,
> +                   0xff,
> +                   sizeof(d->shared_info->compat.evtchn_mask));
> +
> +            d->shared_info->compat.arch.pfn_to_mfn_frame_list_list = 0;
> +            for ( i = 0; i < XEN_LEGACY_MAX_VCPUS; i++ )
> +                d->shared_info->compat.vcpu_info[i].evtchn_pending_sel = 0;
> +        }
> +        else
> +        {
> +            memcpy(&d->shared_info->native.vcpu_info,
> +                   &shinfo->native.vcpu_info,
> +                   sizeof(d->shared_info->native.vcpu_info));
> +            memcpy(&d->shared_info->native.arch,
> +                   &shinfo->native.arch,
> +                   sizeof(d->shared_info->native.arch));
> +            memset(&d->shared_info->native.evtchn_pending,
> +                   0,
> +                   sizeof(d->shared_info->compat.evtchn_pending));
> +            memset(&d->shared_info->native.evtchn_mask,
> +                   0xff,
> +                   sizeof(d->shared_info->native.evtchn_mask));
> +
> +            d->shared_info->native.arch.pfn_to_mfn_frame_list_list = 0;
> +            for ( i = 0; i < XEN_LEGACY_MAX_VCPUS; i++ )
> +                d->shared_info->native.vcpu_info[i].evtchn_pending_sel = 0;
> +        }
> +#else
> +        memcpy(&d->shared_info->vcpu_info,
> +               &shinfo->vcpu_info,
> +               sizeof(d->shared_info->vcpu_info));
> +        memcpy(&d->shared_info->arch,
> +               &shinfo->arch,
> +               sizeof(d->shared_info->shared));
> +        memset(&d->shared_info->evtchn_pending,
> +               0,
> +               sizeof(d->shared_info->evtchn_pending));
> +        memset(&d->shared_info->evtchn_mask,
> +               0xff,
> +               sizeof(d->shared_info->evtchn_mask));
> +
> +        d->shared_info.arch.pfn_to_mfn_frame_list_list = 0;
> +        for ( i = 0; i < XEN_LEGACY_MAX_VCPUS; i++ )
> +            d->shared_info.vcpu_info[i].evtchn_pending_sel = 0;
> +#endif

A lot of redundancy; maybe it gets better if indeed you stop reading
into an intermediate buffer.

> +        xfree(shinfo);
> +
> +        rc = domain_load_end(c, false);
> +    }
> +    else
> +        rc = domain_load_end(c, true);

Perhaps at least a brief comment here wouldn't hurt regarding the
needs (or lack thereof) for HVM / Arm?

Jan

