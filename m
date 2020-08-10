Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E3B240ABB
	for <lists+xen-devel@lfdr.de>; Mon, 10 Aug 2020 17:45:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k59ys-0006Hd-1i; Mon, 10 Aug 2020 15:44:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wyEj=BU=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k59yq-0006HX-4A
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 15:44:56 +0000
X-Inumbo-ID: ba908b98-eaf4-4893-82bf-1d1fa1e7e90f
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba908b98-eaf4-4893-82bf-1d1fa1e7e90f;
 Mon, 10 Aug 2020 15:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5QAXP4UYNN7yGkrkRUaK70/8Ehd9BsqTA/H5YBOiq60=; b=hJqT3eXqBfaHVbUSDfvmGz3hxr
 r4QQw8Iwg7/bEmIupAfLailzp5KIdBipzpL27h2ZGUfkxW0Y67oheAdlNx01CSO0MtLgN2ZhHNNch
 STCQnhl9CZAKbevJt7hPjvGlfF/L1y5InzfPN3Tg4pigDvJB8IC7ngtQDVuR5zP06IfU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k59yn-0001NL-1a; Mon, 10 Aug 2020 15:44:53 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k59ym-0007MT-Jq; Mon, 10 Aug 2020 15:44:52 +0000
Subject: Re: [PATCH v2 4/7] bitmap: move to/from xenctl_bitmap conversion
 helpers
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3a8356a9-313c-6de8-f409-977eae1fbfa5@suse.com>
 <677805f1-c44c-ef65-8190-c4de3bdb327d@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3163b048-921b-fa87-e372-46dd13deb0da@xen.org>
Date: Mon, 10 Aug 2020 16:44:50 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <677805f1-c44c-ef65-8190-c4de3bdb327d@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 07/08/2020 12:33, Jan Beulich wrote:
> A subsequent change will exclude domctl.c from getting built for a
> particular configuration, yet the two functions get used from elsewhere.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> v2: Move function decls to xen/bitmap.h.
> 
> --- a/xen/common/bitmap.c
> +++ b/xen/common/bitmap.c
> @@ -9,6 +9,8 @@
>   #include <xen/errno.h>
>   #include <xen/bitmap.h>
>   #include <xen/bitops.h>
> +#include <xen/cpumask.h>
> +#include <xen/guest_access.h>
>   #include <asm/byteorder.h>
>   
>   /*
> @@ -384,3 +386,87 @@ void bitmap_byte_to_long(unsigned long *
>   }
>   
>   #endif
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
> +        err = xenctl_bitmap_to_bitmap(cpumask_bits(*cpumask), xenctl_cpumap,
> +                                      nr_cpu_ids);
> +        /* In case of error, cleanup is up to us, as the caller won't care! */
> +        if ( err )
> +            free_cpumask_var(*cpumask);
> +    }
> +    else
> +        err = -ENOMEM;
> +
> +    return err;
> +}
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -34,91 +34,6 @@
>   
>   static DEFINE_SPINLOCK(domctl_lock);
>   
> -static int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
> -                                   const unsigned long *bitmap,
> -                                   unsigned int nbits)
> -{
> -    unsigned int guest_bytes, copy_bytes, i;
> -    uint8_t zero = 0;
> -    int err = 0;
> -    uint8_t *bytemap = xmalloc_array(uint8_t, (nbits + 7) / 8);
> -
> -    if ( !bytemap )
> -        return -ENOMEM;
> -
> -    guest_bytes = (xenctl_bitmap->nr_bits + 7) / 8;
> -    copy_bytes  = min_t(unsigned int, guest_bytes, (nbits + 7) / 8);
> -
> -    bitmap_long_to_byte(bytemap, bitmap, nbits);
> -
> -    if ( copy_bytes != 0 )
> -        if ( copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes) )
> -            err = -EFAULT;
> -
> -    for ( i = copy_bytes; !err && i < guest_bytes; i++ )
> -        if ( copy_to_guest_offset(xenctl_bitmap->bitmap, i, &zero, 1) )
> -            err = -EFAULT;
> -
> -    xfree(bytemap);
> -
> -    return err;
> -}
> -
> -int xenctl_bitmap_to_bitmap(unsigned long *bitmap,
> -                            const struct xenctl_bitmap *xenctl_bitmap,
> -                            unsigned int nbits)
> -{
> -    unsigned int guest_bytes, copy_bytes;
> -    int err = 0;
> -    uint8_t *bytemap = xzalloc_array(uint8_t, (nbits + 7) / 8);
> -
> -    if ( !bytemap )
> -        return -ENOMEM;
> -
> -    guest_bytes = (xenctl_bitmap->nr_bits + 7) / 8;
> -    copy_bytes  = min_t(unsigned int, guest_bytes, (nbits + 7) / 8);
> -
> -    if ( copy_bytes != 0 )
> -    {
> -        if ( copy_from_guest(bytemap, xenctl_bitmap->bitmap, copy_bytes) )
> -            err = -EFAULT;
> -        if ( (xenctl_bitmap->nr_bits & 7) && (guest_bytes == copy_bytes) )
> -            bytemap[guest_bytes-1] &= ~(0xff << (xenctl_bitmap->nr_bits & 7));
> -    }
> -
> -    if ( !err )
> -        bitmap_byte_to_long(bitmap, bytemap, nbits);
> -
> -    xfree(bytemap);
> -
> -    return err;
> -}
> -
> -int cpumask_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_cpumap,
> -                             const cpumask_t *cpumask)
> -{
> -    return bitmap_to_xenctl_bitmap(xenctl_cpumap, cpumask_bits(cpumask),
> -                                   nr_cpu_ids);
> -}
> -
> -int xenctl_bitmap_to_cpumask(cpumask_var_t *cpumask,
> -                             const struct xenctl_bitmap *xenctl_cpumap)
> -{
> -    int err = 0;
> -
> -    if ( alloc_cpumask_var(cpumask) ) {
> -        err = xenctl_bitmap_to_bitmap(cpumask_bits(*cpumask), xenctl_cpumap,
> -                                      nr_cpu_ids);
> -        /* In case of error, cleanup is up to us, as the caller won't care! */
> -        if ( err )
> -            free_cpumask_var(*cpumask);
> -    }
> -    else
> -        err = -ENOMEM;
> -
> -    return err;
> -}
> -
>   static int nodemask_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_nodemap,
>                                        const nodemask_t *nodemask)
>   {
> --- a/xen/include/xen/bitmap.h
> +++ b/xen/include/xen/bitmap.h
> @@ -273,6 +273,13 @@ static inline void bitmap_clear(unsigned
>   void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp, int nbits);
>   void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp, int nbits);
>   
> +struct xenctl_bitmap;
> +int xenctl_bitmap_to_bitmap(unsigned long *bitmap,
> +                            const struct xenctl_bitmap *xenctl_bitmap,
> +                            unsigned int nbits);
> +int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
> +                            const unsigned long *bitmap, unsigned int nbits);
> +
>   #endif /* __ASSEMBLY__ */
>   
>   #endif /* __XEN_BITMAP_H */
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -27,9 +27,6 @@ struct xen_domctl_getdomaininfo;
>   void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info);
>   void arch_get_domain_info(const struct domain *d,
>                             struct xen_domctl_getdomaininfo *info);
> -int xenctl_bitmap_to_bitmap(unsigned long *bitmap,
> -                            const struct xenctl_bitmap *xenctl_bitmap,
> -                            unsigned int nbits);
>   
>   /*
>    * Arch-specifics.
> 

-- 
Julien Grall

