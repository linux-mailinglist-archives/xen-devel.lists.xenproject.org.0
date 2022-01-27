Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A1049DFA8
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 11:46:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261409.452586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD2Hq-0002K5-IU; Thu, 27 Jan 2022 10:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261409.452586; Thu, 27 Jan 2022 10:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD2Hq-0002HT-FP; Thu, 27 Jan 2022 10:45:54 +0000
Received: by outflank-mailman (input) for mailman id 261409;
 Thu, 27 Jan 2022 10:45:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nD2Ho-0002HI-9Z
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 10:45:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nD2Hm-0005Yv-UK; Thu, 27 Jan 2022 10:45:50 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.9.172]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nD2Hm-0007w2-O9; Thu, 27 Jan 2022 10:45:50 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=ESbhOQ9xHoGuf//v0U2lPOIGPSUyBRH0cY6HbgzAEwo=; b=wnp3/banGfhWe9aIgBzAHawnt0
	ufWeTVeoiP6eEsRmDICMIoH59nrX/gmMAuUdPsfcm3CUPpC476RxWiSAqOWO0pNxeDd/hlgWimz0+
	ii5yDZLTvI3FPwSdXrehEtNpYhC9ZfsXbsBMf278UJdn3IOrtHfdNJuggWXLKe2D/Ax4=;
Message-ID: <f5e38653-aa2a-c843-39c8-f8c69fc9fbde@xen.org>
Date: Thu, 27 Jan 2022 10:45:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v4] EFI: always map EfiRuntimeServices{Code,Data}
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Sergey Temerkhanov <s.temerkhanov@gmail.com>
References: <89d182f6-95e8-674a-2297-6e98435385f8@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <89d182f6-95e8-674a-2297-6e98435385f8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 12/01/2022 08:45, Jan Beulich wrote:
> From: Sergey Temerkhanov <s.temerkhanov@gmail.com>
> 
> This helps overcome problems observed with some UEFI implementations

Would it be possible to provide some details about the platform? This is 
helpful to track why a workaround is present.

> which don't set the Attributes field in memery descriptors properly.

typo: s/memery/memory/

> 
> Signed-off-by: Sergey Temerkhanov <s.temerkhanov@gmail.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v4: Drop EFI_MEMORY_CACHEABILITY_MASK. Fold with pre-existing if() (into
>      switch()). Style.
> ---
> I guess "map_bs" would also want honoring in efi_exit_boot(), but that's
> yet another patch then I suppose.

IIUC, we would need to invalidate the mapping when map_bs was used. Is 
it correct? If so, then I agree this sounds separate to the issue you 
are describing here.

> 
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1094,7 +1094,13 @@ static void __init efi_exit_boot(EFI_HAN
>       {
>           EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
>   
> -        if ( desc->Attribute & EFI_MEMORY_RUNTIME )
> +        /*
> +         * Runtime services regions are always mapped here.
> +         * Attributes may be adjusted in efi_init_memory().
> +         */
> +        if ( (desc->Attribute & EFI_MEMORY_RUNTIME) ||
> +             desc->Type == EfiRuntimeServicesCode ||
> +             desc->Type == EfiRuntimeServicesData )

My knowledge with the stub is limited. Would you be able to explain why 
we need to map the runtime services even with !efi_enabled(EFI_RS)?

The reason I am asking is if we don't need it, then it would be 
sufficient to rely on desc->Attribute because you updated it in 
efi_init_memory().

>               desc->VirtualStart = desc->PhysicalStart;
>           else
>               desc->VirtualStart = INVALID_VIRTUAL_ADDRESS;
> @@ -1545,13 +1551,36 @@ void __init efi_init_memory(void)
>                       ROUNDUP(desc->PhysicalStart + len, PAGE_SIZE));
>           }
>   
> -        if ( !efi_enabled(EFI_RS) ||
> -             (!(desc->Attribute & EFI_MEMORY_RUNTIME) &&
> -              (!map_bs ||
> -               (desc->Type != EfiBootServicesCode &&
> -                desc->Type != EfiBootServicesData))) )
> +        if ( !efi_enabled(EFI_RS) )
>               continue;
>   
> +        if ( !(desc->Attribute & EFI_MEMORY_RUNTIME) )
> +        {
> +            switch ( desc->Type )
> +            {
> +            default:
> +                continue;
> +
> +            /*
> +             * Adjust runtime services regions. Keep in sync with
> +             * efi_exit_boot().
> +             */
> +            case EfiRuntimeServicesCode:
> +            case EfiRuntimeServicesData:
> +                printk(XENLOG_WARNING
> +                       "Setting RUNTIME attribute for %013" PRIx64 "-%013" PRIx64 "\n",
> +                       desc->PhysicalStart, desc->PhysicalStart + len - 1);
> +                desc->Attribute |= EFI_MEMORY_RUNTIME;
> +                break;
> +
> +            case EfiBootServicesCode:
> +            case EfiBootServicesData:
> +                if ( !map_bs )
> +                    continue;
> +                break;
> +            }
> +        }

The new code is much easier to read :).


> +
>           desc->VirtualStart = INVALID_VIRTUAL_ADDRESS;
>   
>           smfn = PFN_DOWN(desc->PhysicalStart);
> 

Cheers,

-- 
Julien Grall

