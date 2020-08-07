Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E08423F24D
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 19:52:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k46Vs-0000l5-85; Fri, 07 Aug 2020 17:50:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1r1P=BR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k46Vq-0000l0-Nn
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 17:50:38 +0000
X-Inumbo-ID: d5ad2b37-00c7-46cf-940e-f048e993cece
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5ad2b37-00c7-46cf-940e-f048e993cece;
 Fri, 07 Aug 2020 17:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596822636;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=wwCZLKDhb5/YHhej40g9Rn2xcYtbyTNw7MdBP6jan68=;
 b=ihfffQgDex21wl4lLunsxYKBS0kNghNDffsk7YBiBV9L4LC/YleBzxKQ
 w/Iuu8WPZmSQT2TVubXnBoBD2zrsyNZkvxYLFQvDuuwez+og8P1QJmj+1
 ipPyQX+XpTnpxxrFFZ7AJDz6lXBVhZbXdKcOMHBY3jKkEsP7KeyqeX0SG M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 95vaTNz1rDw8oL3yK908yQAuC+KF38oWZ9SCRarG7Ppc57YIt+MjzVY6128t47a/nJt1VcyH5I
 WkMdJKbXOOns/87G16HF2FQnx1d0CK1/7MgRkM68/cqkBbNSIud8nFkh20wKUMl4YR4kzGav/Z
 Yy0mLqgiq+6N3ppxYFKJiAu84HRVamHvYT1ocNfQr3HJcEVH0xcdexQANKw+8RY03qhpsvcInq
 sCOdWqe8Io5Mtr9AhFTuzlQ2Vv9wmwu37BEqjrmbtvQDH4I1EYpJE7KCLXVjTmnZTuGyHQBzgP
 /jU=
X-SBRS: 2.7
X-MesageID: 24071940
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,446,1589256000"; d="scan'208";a="24071940"
Subject: Re: [PATCH v2 4/7] bitmap: move to/from xenctl_bitmap conversion
 helpers
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <3a8356a9-313c-6de8-f409-977eae1fbfa5@suse.com>
 <677805f1-c44c-ef65-8190-c4de3bdb327d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d59cc97f-0896-f53c-8705-25f8bc9556d5@citrix.com>
Date: Fri, 7 Aug 2020 18:50:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <677805f1-c44c-ef65-8190-c4de3bdb327d@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07/08/2020 12:33, Jan Beulich wrote:
> --- a/xen/common/bitmap.c
> +++ b/xen/common/bitmap.c
> @@ -384,3 +386,87 @@ void bitmap_byte_to_long(unsigned long *
>  }
>  
>  #endif
> +
> +int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
> +                            const unsigned long *bitmap, unsigned int nbits)
> +{
> +    unsigned int guest_bytes, copy_bytes, i;
> +    uint8_t zero = 0;
> +    int err = 0;
> +    uint8_t *bytemap = xmalloc_array(uint8_t, (nbits + 7) / 8);
> +
> +    if ( !bytemap )
> +        return -ENOMEM;
> +
> +    guest_bytes = (xenctl_bitmap->nr_bits + 7) / 8;
> +    copy_bytes  = min_t(unsigned int, guest_bytes, (nbits + 7) / 8);
> +
> +    bitmap_long_to_byte(bytemap, bitmap, nbits);
> +
> +    if ( copy_bytes != 0 )
> +        if ( copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes) )
> +            err = -EFAULT;
> +
> +    for ( i = copy_bytes; !err && i < guest_bytes; i++ )
> +        if ( copy_to_guest_offset(xenctl_bitmap->bitmap, i, &zero, 1) )
> +            err = -EFAULT;
> +
> +    xfree(bytemap);
> +
> +    return err;
> +}
> +
> +int xenctl_bitmap_to_bitmap(unsigned long *bitmap,
> +                            const struct xenctl_bitmap *xenctl_bitmap,
> +                            unsigned int nbits)
> +{
> +    unsigned int guest_bytes, copy_bytes;
> +    int err = 0;
> +    uint8_t *bytemap = xzalloc_array(uint8_t, (nbits + 7) / 8);
> +
> +    if ( !bytemap )
> +        return -ENOMEM;
> +
> +    guest_bytes = (xenctl_bitmap->nr_bits + 7) / 8;
> +    copy_bytes  = min_t(unsigned int, guest_bytes, (nbits + 7) / 8);
> +
> +    if ( copy_bytes != 0 )
> +    {
> +        if ( copy_from_guest(bytemap, xenctl_bitmap->bitmap, copy_bytes) )
> +            err = -EFAULT;
> +        if ( (xenctl_bitmap->nr_bits & 7) && (guest_bytes == copy_bytes) )
> +            bytemap[guest_bytes-1] &= ~(0xff << (xenctl_bitmap->nr_bits & 7));
> +    }
> +
> +    if ( !err )
> +        bitmap_byte_to_long(bitmap, bytemap, nbits);
> +
> +    xfree(bytemap);
> +
> +    return err;
> +}
> +
> +int cpumask_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_cpumap,
> +                             const cpumask_t *cpumask)
> +{
> +    return bitmap_to_xenctl_bitmap(xenctl_cpumap, cpumask_bits(cpumask),
> +                                   nr_cpu_ids);
> +}
> +
> +int xenctl_bitmap_to_cpumask(cpumask_var_t *cpumask,
> +                             const struct xenctl_bitmap *xenctl_cpumap)
> +{
> +    int err = 0;
> +
> +    if ( alloc_cpumask_var(cpumask) ) {

At a minimum, please fix this style during the move.

However, the more I look at this code, the more concerned I get.

There is absolutely no need to allocate(/doubly allocate) memory or
double/triple bounce buffer the data.  All that is necessary is some
careful handling of the copy length, and trailing zeroing.

The cpumask variants should be trivial static inline wrapper.  The fact
that they're not suggests an API error.

In reality, these are just data-shuffling helpers, and would probably
live better in a guest-access.c if we had a suitable one to hand, but I
guess bitmap.c will have to do for now.

~Andrew

