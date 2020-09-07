Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A9025F42E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 09:40:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFBl5-00039l-9h; Mon, 07 Sep 2020 07:40:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b7xj=CQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFBl4-00039g-EN
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 07:40:10 +0000
X-Inumbo-ID: 9be8e3e7-f84f-4097-892d-a495bb54c091
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9be8e3e7-f84f-4097-892d-a495bb54c091;
 Mon, 07 Sep 2020 07:40:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 91C9FAC6F;
 Mon,  7 Sep 2020 07:40:09 +0000 (UTC)
Subject: Re: [PATCH v2] efi: Always map EfiRuntimeServicesCode and
 EfiRuntimeServicesData
To: Sergey Temerkhanov <s.temerkhanov@gmail.com>
References: <20200904211140.9875-1-s.temerkhanov@gmail.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6f9d2c4a-3b1b-0faf-b57f-42cbe7f01be3@suse.com>
Date: Mon, 7 Sep 2020 09:40:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200904211140.9875-1-s.temerkhanov@gmail.com>
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

On 04.09.2020 23:11, Sergey Temerkhanov wrote:
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1100,7 +1100,9 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
>      {
>          EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
>  
> -        if ( desc->Attribute & EFI_MEMORY_RUNTIME )
> +        if ( (desc->Attribute & EFI_MEMORY_RUNTIME) ||
> +              desc->Type == EfiRuntimeServicesCode  ||

Nit: One too many blank at the start of the line and one too many
ahead of the ||. (Similar issues elsewhere.)

I think with the more involved logic this may also want a comment
indicating it needs keeping in sync with the other place (and a
similar comment should then go there as well).

> @@ -1510,6 +1512,21 @@ void __init efi_init_memory(void)
>                 desc->PhysicalStart, desc->PhysicalStart + len - 1,
>                 desc->Type, desc->Attribute);
>  
> +        if (efi_enabled(EFI_RS) &&
> +             (!(desc->Attribute & EFI_MEMORY_RUNTIME) &&
> +                (desc->Type == EfiRuntimeServicesCode ||
> +                 desc->Type == EfiRuntimeServicesData))) {
> +            printk(XENLOG_WARNING "Fixing memory attributes for area %013"
> +                                   PRIx64 "-%013" PRIx64 "\n",
> +                   desc->PhysicalStart, desc->PhysicalStart + len - 1);

Please be more specific with the wording, e.g. "Adding runtime attribute
for area ...". Also please wrap the statement such that the format string
ends up all on one line, even if the line then exceeds the 80 cols limit.
For this you'll want to split between XENLOG_WARNING and the opening
quote.

> +            desc->Attribute |= EFI_MEMORY_RUNTIME;
> +            if ( !(desc->Attribute & EFI_MEMORY_CACHEABILITY_MASK) ) {
> +                desc->Attribute |= (desc->Type == EfiRuntimeServicesCode) &&
> +                                   (efi_bs_revision >= EFI_REVISION(2, 5)) ?
> +                                        EFI_MEMORY_WP : EFI_MEMORY_UC;

As said elsewhere already, please don't do this as a "proactive"
workaround.

Also please note that opening braces go on their own lines in our
coding style and there ought to be blanks immediately inside if()
and alike. See the surrounding code for reference.

> --- a/xen/include/efi/efidef.h
> +++ b/xen/include/efi/efidef.h
> @@ -158,6 +158,9 @@ typedef enum {
>  #define EFI_MEMORY_UCE          0x0000000000000010  
>  #define EFI_MEMORY_WP           0x0000000000001000
>  
> +#define EFI_MEMORY_CACHEABILITY_MASK \
> +                                0x000000000000101F

Has such a #define appeared in the tree we've imported this from?
If not, it probably shouldn't go here. I'm also unconvinced
checking the bit EFI_MEMORY_WP occupies is, for the purpose here,
legitimate on versions prior to 2.5 - it's a reserved bit there,
and hence may have any [benign] meaning.

Finally, if this #define is to survive in the first place, please
don't use a literal number. Make its value an OR of the various
other constants instead, so it becomes self-documenting.

Jan

