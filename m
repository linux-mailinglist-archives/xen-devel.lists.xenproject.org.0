Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8979A31A7
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 02:24:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821468.1235300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1amV-0004aB-RM; Fri, 18 Oct 2024 00:23:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821468.1235300; Fri, 18 Oct 2024 00:23:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1amV-0004XT-Ns; Fri, 18 Oct 2024 00:23:51 +0000
Received: by outflank-mailman (input) for mailman id 821468;
 Fri, 18 Oct 2024 00:23:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/epI=RO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t1amU-0004XN-0O
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 00:23:50 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e90f69d-8ce7-11ef-a0be-8be0dac302b0;
 Fri, 18 Oct 2024 02:23:48 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c9a664e65fso1775255a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 17:23:48 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ca0b0e87c7sm105363a12.61.2024.10.17.17.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2024 17:23:47 -0700 (PDT)
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
X-Inumbo-ID: 3e90f69d-8ce7-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729211028; x=1729815828; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YAzNaxrZSFDaNAQts78PeAV0Zfl1z9WxXLmkRbuw5/g=;
        b=JqMH3+pWiGQvdcFTZt454y6BTk0voEgatzNbjznXZ6qx1GUuIRNV3i7QaQFrHoqoNK
         eK9cogPIBu0chGeL8R9pEuSUS8qbmjuiUIHk+5ZPmNxGRxWYdoDlCkU7IX9Zsco04bFU
         D7CxGaxT2BEZ1k+E0FbpxnuKCCPoJvTCyYFiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729211028; x=1729815828;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAzNaxrZSFDaNAQts78PeAV0Zfl1z9WxXLmkRbuw5/g=;
        b=TvAjqud8S40CGaCYN383lFMohs+aNOjQE6DFeFZP7VOoROFvvEqSH+C96ZBsbQ4Fi9
         AV/HTZvjVyG4YWxttka1FLZBiuU8EVvxj0ZhaibUKbXB5w+2ZBrK6ZjpiR5oV2a5Pxu/
         108ffcxeahQrwa4/+e7UjRLamQgQfMAileHQeaupSOnYfTFUchQfEg5kdcxYgTnh47ev
         W8T9/bLZ+PVqSBZfMUhbGWOowjwex0BYyoDCWCcfs+nR9DnL6dWI7cn2QxoksnzjGaYe
         tb3J0n1AeZwU1O89J+cZk+zFjpyajnRWHHfq8T+bP9Z390OPq4B1RfMFLuVlunFf5vNH
         Mcyw==
X-Forwarded-Encrypted: i=1; AJvYcCWMQzyOAsEEJ8HVmpgHAQjyxUZHCM7CrcUoMjiVTtEFhiP/3v6PPXc1OTug1kOGdiHtZSKW8FIsvvs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7H3eSRE4Q+5n/oSlYDLrXMGNJbcgu5iIF7zn0TjaV+L5aCAQK
	lEa16PQSD7JyTryBne0mTDk4L7nikXo5Ii28l/oa/FdP5tPKBOMldhXqiKdvmEc=
X-Google-Smtp-Source: AGHT+IGGo5VFHVwpXxIrTKi1xcwpYPtL3Uu8ONHuPjsGrWASvL1RdgfOmN/l5gU4CGj8u64dDqtNHQ==
X-Received: by 2002:a05:6402:2711:b0:5c9:6bd9:68d9 with SMTP id 4fb4d7f45d1cf-5ca0afaa1ebmr341384a12.32.1729211028171;
        Thu, 17 Oct 2024 17:23:48 -0700 (PDT)
Message-ID: <0c342b3a-f66e-44a6-a87a-5553f4f7ba7d@citrix.com>
Date: Fri, 18 Oct 2024 01:23:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/44] x86/boot: add start and size fields to struct
 boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
 <20241017170325.3842-12-dpsmith@apertussolutions.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241017170325.3842-12-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/10/2024 6:02 pm, Daniel P. Smith wrote:
> This commit introduces the start and size fields to struct boot_module and
> assigns their value during boot_info construction.
>
> The EFI entry point special cased itself, and pre-converted mod_start and
> mod_end to mfn and size respectively. This required an additional test
> in the coversion loop to not convert mod_start and mod_end when the conversion
> was done for both the multiboot and PVH boot entry points. To simplify the
> logic populating the start and size fields, the EFI module population logic
> was coverted to using start and end addresses.
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
> Changes since v5:
> - switched EFI population of mod_start/mod_end to addresses
> ---
>  xen/arch/x86/efi/efi-boot.h         | 4 ++--
>  xen/arch/x86/include/asm/bootinfo.h | 3 +++
>  xen/arch/x86/setup.c                | 7 ++++++-
>  3 files changed, 11 insertions(+), 3 deletions(-)

Despite being small already, I'd still prefer to split this into two
patches.

One changing the EFI path, and a separate one adding in the new (real)
start/size fields.

Sods law would says that if we don't, bisection is going to end up here,
except it doesn't need to...

> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index 94f34433640f..779f101c3de7 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -732,8 +732,8 @@ static void __init efi_arch_handle_module(const struct file *file,
>      if ( options )
>          place_string(&mb_modules[mbi.mods_count].string, options);
>      place_string(&mb_modules[mbi.mods_count].string, local_name.s);
> -    mb_modules[mbi.mods_count].mod_start = file->addr >> PAGE_SHIFT;
> -    mb_modules[mbi.mods_count].mod_end = file->size;
> +    mb_modules[mbi.mods_count].mod_start = file->addr;
> +    mb_modules[mbi.mods_count].mod_end = file->addr + file->size;

... because you can't drop this shift until you have a full-width start
field to use.   file->addr might exceed 4G, and truncate with this patch
in place.

You're going to need to keep the old semantics here, fill in all 4
fields, and keep the EFI special case in the final hunk until you can
remove the ->mod_{start,end} narrow fields.

> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index f87faa31a2cf..6ee352fc0cde 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -309,8 +309,13 @@ static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
>       * reserved for Xen itself
>       */
>      for ( i = 0; i <= bi->nr_modules; i++ )
> +    {
>          bi->mods[i].mod = &mods[i];
>  
> +        bi->mods[i].start = (paddr_t)mods[i].mod_start;

This cast isn't needed, but don't we need a shift in here?

~Andrew

