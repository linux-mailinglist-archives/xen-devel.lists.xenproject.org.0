Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB71924986A
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 10:45:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8Jim-0008Fk-O4; Wed, 19 Aug 2020 08:45:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b5Wx=B5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k8Jik-0008Ff-Gx
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 08:45:22 +0000
X-Inumbo-ID: b2eacc69-9a82-407c-a171-883a196f3a61
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2eacc69-9a82-407c-a171-883a196f3a61;
 Wed, 19 Aug 2020 08:45:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B7036B659;
 Wed, 19 Aug 2020 08:45:46 +0000 (UTC)
Subject: Re: [PATCH v2 4/7] bitmap: move to/from xenctl_bitmap conversion
 helpers
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <3a8356a9-313c-6de8-f409-977eae1fbfa5@suse.com>
 <677805f1-c44c-ef65-8190-c4de3bdb327d@suse.com>
 <d59cc97f-0896-f53c-8705-25f8bc9556d5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <21e7f46c-f74c-6475-b56c-fbff7156f1e0@suse.com>
Date: Wed, 19 Aug 2020 10:45:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <d59cc97f-0896-f53c-8705-25f8bc9556d5@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 07.08.2020 19:50, Andrew Cooper wrote:
> On 07/08/2020 12:33, Jan Beulich wrote:
>> --- a/xen/common/bitmap.c
>> +++ b/xen/common/bitmap.c
>> @@ -384,3 +386,87 @@ void bitmap_byte_to_long(unsigned long *
>>  }
>>  
>>  #endif
>> +
>> +int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
>> +                            const unsigned long *bitmap, unsigned int nbits)
>> +{
>> +    unsigned int guest_bytes, copy_bytes, i;
>> +    uint8_t zero = 0;
>> +    int err = 0;
>> +    uint8_t *bytemap = xmalloc_array(uint8_t, (nbits + 7) / 8);
>> +
>> +    if ( !bytemap )
>> +        return -ENOMEM;
>> +
>> +    guest_bytes = (xenctl_bitmap->nr_bits + 7) / 8;
>> +    copy_bytes  = min_t(unsigned int, guest_bytes, (nbits + 7) / 8);
>> +
>> +    bitmap_long_to_byte(bytemap, bitmap, nbits);
>> +
>> +    if ( copy_bytes != 0 )
>> +        if ( copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes) )
>> +            err = -EFAULT;
>> +
>> +    for ( i = copy_bytes; !err && i < guest_bytes; i++ )
>> +        if ( copy_to_guest_offset(xenctl_bitmap->bitmap, i, &zero, 1) )
>> +            err = -EFAULT;
>> +
>> +    xfree(bytemap);
>> +
>> +    return err;
>> +}
>> +
>> +int xenctl_bitmap_to_bitmap(unsigned long *bitmap,
>> +                            const struct xenctl_bitmap *xenctl_bitmap,
>> +                            unsigned int nbits)
>> +{
>> +    unsigned int guest_bytes, copy_bytes;
>> +    int err = 0;
>> +    uint8_t *bytemap = xzalloc_array(uint8_t, (nbits + 7) / 8);
>> +
>> +    if ( !bytemap )
>> +        return -ENOMEM;
>> +
>> +    guest_bytes = (xenctl_bitmap->nr_bits + 7) / 8;
>> +    copy_bytes  = min_t(unsigned int, guest_bytes, (nbits + 7) / 8);
>> +
>> +    if ( copy_bytes != 0 )
>> +    {
>> +        if ( copy_from_guest(bytemap, xenctl_bitmap->bitmap, copy_bytes) )
>> +            err = -EFAULT;
>> +        if ( (xenctl_bitmap->nr_bits & 7) && (guest_bytes == copy_bytes) )
>> +            bytemap[guest_bytes-1] &= ~(0xff << (xenctl_bitmap->nr_bits & 7));
>> +    }
>> +
>> +    if ( !err )
>> +        bitmap_byte_to_long(bitmap, bytemap, nbits);
>> +
>> +    xfree(bytemap);
>> +
>> +    return err;
>> +}
>> +
>> +int cpumask_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_cpumap,
>> +                             const cpumask_t *cpumask)
>> +{
>> +    return bitmap_to_xenctl_bitmap(xenctl_cpumap, cpumask_bits(cpumask),
>> +                                   nr_cpu_ids);
>> +}
>> +
>> +int xenctl_bitmap_to_cpumask(cpumask_var_t *cpumask,
>> +                             const struct xenctl_bitmap *xenctl_cpumap)
>> +{
>> +    int err = 0;
>> +
>> +    if ( alloc_cpumask_var(cpumask) ) {
> 
> At a minimum, please fix this style during the move.

Oh, I should have noticed this. I've also spotted a 2nd style issue.

> However, the more I look at this code, the more concerned I get.
> 
> There is absolutely no need to allocate(/doubly allocate) memory or
> double/triple bounce buffer the data.  All that is necessary is some
> careful handling of the copy length, and trailing zeroing.
> 
> The cpumask variants should be trivial static inline wrapper.  The fact
> that they're not suggests an API error.
> 
> In reality, these are just data-shuffling helpers, and would probably
> live better in a guest-access.c if we had a suitable one to hand, but I
> guess bitmap.c will have to do for now.

But changing the implementation is certainly way beyond the purpose
here. (I also can't spot any pointless double allocation - the one
in xenctl_bitmap_to_cpumask() allocates an output of the function.)

Jan

