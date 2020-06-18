Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 532341FF2F6
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 15:25:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jluWw-0003Mk-7x; Thu, 18 Jun 2020 13:24:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jluWu-0003M1-QP
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 13:24:32 +0000
X-Inumbo-ID: 0b02b5f6-b167-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b02b5f6-b167-11ea-bca7-bc764e2007e4;
 Thu, 18 Jun 2020 13:24:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B954AAD2A;
 Thu, 18 Jun 2020 13:24:29 +0000 (UTC)
Subject: Re: [PATCH v1 4/7] x86/vmx: add do_vmtrace_op
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <34833328.8766172.1592320926648.JavaMail.zimbra@cert.pl>
 <20200616172352.GT735@Air-de-Roger>
 <998292451.9258672.1592421185726.JavaMail.zimbra@cert.pl>
 <CABfawhmxUtuyBUYjVf9iOMvJop-_7SfciRNQThZt0sAqPsVqrg@mail.gmail.com>
 <832789003.9534743.1592478099057.JavaMail.zimbra@cert.pl>
 <20200618115519.GL735@Air-de-Roger>
 <9924a5d9-b851-257a-9a6a-7a5712898a71@suse.com>
 <1226758073.9662727.1592485797234.JavaMail.zimbra@cert.pl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1b7f1eb3-5cf5-869c-d2bc-48e3e7a85e1c@suse.com>
Date: Thu, 18 Jun 2020 15:24:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1226758073.9662727.1592485797234.JavaMail.zimbra@cert.pl>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.06.2020 15:09, Michał Leszczyński wrote:
> ----- 18 cze 2020 o 14:51, Jan Beulich jbeulich@suse.com napisał(a):
> 
>> On 18.06.2020 13:55, Roger Pau Monné wrote:
>>> On Thu, Jun 18, 2020 at 01:01:39PM +0200, Michał Leszczyński wrote:
>>>> It was previously stated that:
>>>>
>>>>> PVH or HVM domain
>>>>> won't be able to use this interface since it has no way to request the
>>>>> mapping of a specific mfn into it's physmap.
>>>>
>>>> but however, taking LibVMI as an example:
>>>>
>>>> https://github.com/libvmi/libvmi/blob/c461e20ae88bc62c08c27f50fcead23c27a30f9e/libvmi/driver/xen/xen.c#L51
>>>>
>>>> An essential abstraction xen_get_memory() relies on xc_map_foreign_range().
>>>> Doesn't this mean that it's not usable from PVH or HVM domains, or did I got it
>>>> all wrong?
>>>
>>> That was my fault, so the buffer mfns are assigned to Xen, and then
>>> the Xen domain ID is used to map those, which should work on both PV
>>> and HVM (or PVH).
>>>
>>> I still think using XENMEM_acquire_resource might be better, but I
>>> would let others comment.
>>
>> +1
>>
>> Jan
> 
> 
> I'm trying to implement this right now. I've added some very simple code to mm.c just for testing:
> 
> ---
> 
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index e376fc7e8f..aaaefe6d23 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4624,6 +4624,26 @@ int arch_acquire_resource(struct domain *d, unsigned int type,
>          }
>          break;
>      }
> +
> +    case XENMEM_resource_vmtrace_buf:
> +    {
> +        uint64_t output_base;
> +        mfn_t mfn;
> +        unsigned int i;
> +
> +        printk("vmtrace buf acquire\n");
> +        output_base = d->vcpu[id]->arch.hvm.vmx.ipt_state->output_base;
> +        mfn = mfn_x(output_base >> PAGE_SHIFT);
> +
> +        rc = 0;
> +        for ( i = 0; i < nr_frames; i++ )
> +        {
> +            __map_domain_page_global(mfn_to_page(mfn + i));
> +            mfn_list[i] = mfn + i;
> +        }
> +
> +        break;
> +    }
>  #endif
> 
>      default:
> 
> ---
> 
> 
> and then in my "proctrace" tool I'm trying to acquire it like this:
> 
>     fres = xenforeignmemory_map_resource(
>         fmem, domid, XENMEM_resource_vmtrace_buf,
>         /* vcpu: */ 0, /* frame: */ 0, /* num_frames: */ 128, (void **)&buf,
>         PROT_READ, 0);
> 
> 
> ioctl fails with "Argument list too long". It works fine when I provide some small number of frames (e.g. num_frames: 1 or 32), but doesn't work for any larger quantity.

See xen/common/memory.c:acquire_resource(). So far larger quantities
weren't needed, so there's an implementation limit of 32 right now.
This can be lifted, but please not by growing the on-stack array (as
the comment there also suggests).

Jan

