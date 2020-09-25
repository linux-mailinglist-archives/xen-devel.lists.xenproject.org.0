Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55504278D4E
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 17:56:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLq5O-0004rh-HV; Fri, 25 Sep 2020 15:56:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9v36=DC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kLq5N-0004ra-32
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 15:56:37 +0000
X-Inumbo-ID: a56ab29a-3b10-4dcf-9a07-92cca47a0c5b
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a56ab29a-3b10-4dcf-9a07-92cca47a0c5b;
 Fri, 25 Sep 2020 15:56:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601049395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=djxR/v+jm0pDSJC2595QYLw7wkuEE/y1wiDTkabBdpQ=;
 b=JwaosJUiVehkH0tfhoG2/S7FLfMF9eL5tCHeYdLxDIFQrBiPrcUd2Wgob4B8Jzg+pS1UvO
 QCJnIPRtmTJX3PvqyU9wsPP94AqlHenV1Wq/FFQsp5m/22RaIVJu5wl/1sa6Bv4X81L4Vo
 2Lk0MKUcrRQwof2U199tcfy36cWplvI=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3DBC7ACB5;
 Fri, 25 Sep 2020 15:56:35 +0000 (UTC)
Subject: Re: [PATCH v2 04/11] xen/memory: Fix acquire_resource size semantics
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
 <michal.leszczynski@cert.pl>, Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
 <20200922182444.12350-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1ba2a8dd-71b6-3c28-96d3-8bfa3a6816b4@suse.com>
Date: Fri, 25 Sep 2020 17:56:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200922182444.12350-5-andrew.cooper3@citrix.com>
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
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1007,6 +1007,26 @@ static long xatp_permission_check(struct domain *d, unsigned int space)
>      return xsm_add_to_physmap(XSM_TARGET, current->domain, d);
>  }
>  
> +/*
> + * Return 0 on any kind of error.  Caller converts to -EINVAL.
> + *
> + * All nonzero values should be repeatable (i.e. derived from some fixed
> + * property of the domain), and describe the full resource (i.e. mapping the
> + * result of this call will be the entire resource).
> + */
> +static unsigned int resource_max_frames(struct domain *d,

With the lockless intentions I think this could be const from
here on through all the descendants. With this
Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit I have one more minor remark:

> @@ -1058,6 +1066,27 @@ static int acquire_resource(
>      if ( rc )
>          goto out;
>  
> +    max_frames = resource_max_frames(d, xmar.type, xmar.id);
> +
> +    rc = -EINVAL;
> +    if ( !max_frames )
> +        goto out;
> +
> +    if ( guest_handle_is_null(xmar.frame_list) )
> +    {
> +        if ( xmar.nr_frames )
> +            goto out;
> +
> +        xmar.nr_frames = max_frames;
> +
> +        rc = -EFAULT;
> +        if ( __copy_field_to_guest(arg, &xmar, nr_frames) )
> +            goto out;
> +
> +        rc = 0;
> +        goto out;
> +    }

That's a lot of "goto out" here. I don't suppose I could talk you
into reducing their amount some, since at least the last two look
to be easy to fold?

Jan

