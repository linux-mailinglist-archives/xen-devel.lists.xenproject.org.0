Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E73B292A55
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 17:25:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8746.23476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUX2j-00081b-BN; Mon, 19 Oct 2020 15:25:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8746.23476; Mon, 19 Oct 2020 15:25:49 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUX2j-00081B-7q; Mon, 19 Oct 2020 15:25:49 +0000
Received: by outflank-mailman (input) for mailman id 8746;
 Mon, 19 Oct 2020 15:25:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUX2h-000816-6g
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 15:25:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 168b3bbc-b38d-4cb9-8b86-068a83c51cf2;
 Mon, 19 Oct 2020 15:25:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 94507AC8B;
 Mon, 19 Oct 2020 15:25:44 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUX2h-000816-6g
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 15:25:47 +0000
X-Inumbo-ID: 168b3bbc-b38d-4cb9-8b86-068a83c51cf2
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 168b3bbc-b38d-4cb9-8b86-068a83c51cf2;
	Mon, 19 Oct 2020 15:25:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603121144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gh2o7skQDVKv2Z2IafZlyzrok3EROZphdgRUYxxQBDE=;
	b=GiuaglY7qP0hNg1bL8JZAn7L8pW9TynUz3smaxMpYhX7oM+rbpkN9MBinTwwxk1hNqZW7z
	bCOwcQgr8d58SKMmbtm7THOBa3UxRtaxz9NCwLU5zT4pjg0xnCLYNH0aItowtCGdcdPjCx
	oP8HalWjXaiVUZnb0ilqNLW8WmonzPs=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 94507AC8B;
	Mon, 19 Oct 2020 15:25:44 +0000 (UTC)
Subject: Re: [PATCH v10 05/11] common/domain: add a domain context record for
 shared_info...
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20201008185735.29875-1-paul@xen.org>
 <20201008185735.29875-6-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <053295cf-9150-8ba4-0427-ba65b639f4ae@suse.com>
Date: Mon, 19 Oct 2020 17:25:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201008185735.29875-6-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.10.2020 20:57, Paul Durrant wrote:
> @@ -1671,6 +1672,118 @@ int continue_hypercall_on_cpu(
>      return 0;
>  }
>  
> +static int save_shared_info(struct domain *d, struct domain_ctxt_state *c,
> +                            bool dry_run)
> +{
> +#ifdef CONFIG_COMPAT
> +    struct domain_context_shared_info s = {
> +        .flags = has_32bit_shinfo(d) ? DOMAIN_CONTEXT_32BIT_SHARED_INFO : 0,
> +    };
> +    size_t size = has_32bit_shinfo(d) ?
> +        sizeof(struct compat_shared_info) :
> +        sizeof(struct shared_info);
> +#else
> +    struct domain_context_shared_info s = {};
> +    size_t size = sizeof(struct shared_info);

All of these would imo better be expressed in terms of d->shared_info.
While chances are zero that these types will change in any way, it
still sets a bad precedent for people seeing this and then introducing
similar disconnects elsewhere. (Same in the load handling then.)

> +static int load_shared_info(struct domain *d, struct domain_ctxt_state *c)
> +{
> +    struct domain_context_shared_info s = {};
> +    size_t size;
> +    unsigned int i;
> +    int rc;
> +
> +    rc = domain_load_ctxt_rec_begin(c, DOMAIN_CONTEXT_SHARED_INFO, &i);
> +    if ( rc )
> +        return rc;
> +
> +    if ( i ) /* expect only a single instance */
> +        return -ENXIO;
> +
> +    rc = domain_load_ctxt_rec_data(c, &s, offsetof(typeof(s), buffer));
> +    if ( rc )
> +        return rc;
> +
> +    if ( s.flags & ~DOMAIN_CONTEXT_32BIT_SHARED_INFO )
> +        return -EINVAL;
> +
> +    if ( s.flags & DOMAIN_CONTEXT_32BIT_SHARED_INFO )
> +    {
> +#ifdef CONFIG_COMPAT
> +        d->arch.has_32bit_shinfo = true;
> +        size = sizeof(struct compat_shared_info);

I realize this has been more or less this way already in prior
versions, but aren't you introducing a way to have a degenerate
64-bit PV guest with 32-bit shared info (or vice versa), in that
shared info bitness isn't strictly tied to guest bitness anymore?
Rejecting this case may not need to live here, but it needs to be
present / added somewhere.

> +#else
> +        return -EINVAL;
> +#endif
> +    }
> +    else
> +        size = sizeof(struct shared_info);
> +
> +    if ( is_pv_domain(d) )
> +    {
> +        shared_info_t *shinfo = xzalloc(shared_info_t);
> +
> +        if ( !shinfo )
> +            return -ENOMEM;
> +
> +        rc = domain_load_ctxt_rec_data(c, shinfo, size);
> +        if ( rc )
> +            goto out;
> +
> +        memcpy(&shared_info(d, vcpu_info), &__shared_info(d, shinfo, vcpu_info),
> +               sizeof(shared_info(d, vcpu_info)));
> +        memcpy(&shared_info(d, arch), &__shared_info(d, shinfo, arch),
> +               sizeof(shared_info(d, arch)));
> +
> +        memset(&shared_info(d, evtchn_pending), 0,
> +               sizeof(shared_info(d, evtchn_pending)));
> +        memset(&shared_info(d, evtchn_mask), 0xff,
> +               sizeof(shared_info(d, evtchn_mask)));
> +
> +#ifdef CONFIG_X86
> +        shared_info(d, arch.pfn_to_mfn_frame_list_list) = 0;
> +#endif
> +        for ( i = 0; i < XEN_LEGACY_MAX_VCPUS; i++ )
> +            shared_info(d, vcpu_info[i].evtchn_pending_sel) = 0;

Again I realize this has been this way in earlier versions, and
it was also me to ask for streamlining the code, but is this
actually correct? I ask in particular in light of this comment

/*
 * Compat field is never larger than native field, so cast to that as it
 * is the largest memory range it is safe for the caller to modify without
 * further discrimination between compat and native cases.
 */

in xen/shared.h, next to the __shared_info() #define. I can't
help thinking that you'll fill only half of some of the fields
in the 64-bit case.

> @@ -58,6 +59,16 @@ struct domain_context_start {
>      uint32_t xen_major, xen_minor;
>  };
>  
> +struct domain_context_shared_info {
> +    uint32_t flags;
> +
> +#define _DOMAIN_CONTEXT_32BIT_SHARED_INFO 0

Is this separate constant actually needed for anything?

Speaking of which - wouldn't all your additions to this header
better be proper name spacing citizens, by having xen_ / XEN_
prefixes?

Jan

