Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0F0268C3C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 15:31:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHoZG-000744-ET; Mon, 14 Sep 2020 13:30:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kHoZE-00073z-U4
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 13:30:48 +0000
X-Inumbo-ID: 537b7657-853b-4d31-888a-53e51c8f7152
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 537b7657-853b-4d31-888a-53e51c8f7152;
 Mon, 14 Sep 2020 13:30:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B6990B071;
 Mon, 14 Sep 2020 13:31:02 +0000 (UTC)
Subject: Re: [PATCH v3] efi: Always map EfiRuntimeServicesCode and
 EfiRuntimeServicesData
To: Sergey Temerkhanov <s.temerkhanov@gmail.com>
References: <20200911144309.4559-1-s.temerkhanov@gmail.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0e6a7143-b456-ee30-eb25-e1b392a30a08@suse.com>
Date: Mon, 14 Sep 2020 15:30:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200911144309.4559-1-s.temerkhanov@gmail.com>
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

On 11.09.2020 16:43, Sergey Temerkhanov wrote:
> @@ -1510,6 +1517,24 @@ void __init efi_init_memory(void)
>                 desc->PhysicalStart, desc->PhysicalStart + len - 1,
>                 desc->Type, desc->Attribute);
>  
> +        /*
> +         * EfiRuntimeServicesCode and EfiRuntimeServicesData
> +         * memory ranges are adjusted here. Any changes
> +         * or adjustments must be kept in sync with efi_exit_boot()
> +         */
> +        if ( efi_enabled(EFI_RS) &&
> +             (!(desc->Attribute & EFI_MEMORY_RUNTIME) &&
> +               (desc->Attribute & EFI_MEMORY_CACHEABILITY_MASK) &&
> +               (desc->Type == EfiRuntimeServicesCode ||
> +                desc->Type == EfiRuntimeServicesData)) )
> +        {
> +            printk(XENLOG_WARNING
> +                   "Setting EFI_RUNTIME memory attribute for area %013"
> +                   PRIx64 "-%013" PRIx64 "\n",
> +                   desc->PhysicalStart, desc->PhysicalStart + len - 1);
> +            desc->Attribute |= EFI_MEMORY_RUNTIME;
> +        }

So you've moved from always checking for EFI_MEMORY_WP to not
checking it at all. Neither is the way to go imo. Similarly, ...

> --- a/xen/include/efi/efidef.h
> +++ b/xen/include/efi/efidef.h
> @@ -158,6 +158,12 @@ typedef enum {
>  #define EFI_MEMORY_UCE          0x0000000000000010  
>  #define EFI_MEMORY_WP           0x0000000000001000
>  
> +#define EFI_MEMORY_CACHEABILITY_MASK  ( EFI_MEMORY_UC | \
> +                                        EFI_MEMORY_WC | \
> +                                        EFI_MEMORY_WT | \
> +                                        EFI_MEMORY_WB | \
> +                                        EFI_MEMORY_UCE )

... this now doesn't really cover what its name suggests. As
indicated before, without such a (questionable) #define having
appeared in the gnu-efi tree, I don't think we want it, at the
very least not in this imported header. But given that it
doesn't express what you want anyway, I can only repeat my
suggestion to drop this #define altogether.

In order to save further rounds, I would offer to finish this
patch to a shape that I'd feel comfortable with - if that's
okay with you.

Jan

