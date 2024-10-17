Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF569A2F21
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 23:03:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821321.1235085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Xdm-0001HP-OU; Thu, 17 Oct 2024 21:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821321.1235085; Thu, 17 Oct 2024 21:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Xdm-0001Fg-Li; Thu, 17 Oct 2024 21:02:38 +0000
Received: by outflank-mailman (input) for mailman id 821321;
 Thu, 17 Oct 2024 21:02:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2/Py=RN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t1Xdm-0001Fa-6n
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 21:02:38 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 229e4ddd-8ccb-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 23:02:36 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2fb584a8f81so17154821fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 14:02:36 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ca0b0e897fsm7947a12.68.2024.10.17.14.02.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2024 14:02:34 -0700 (PDT)
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
X-Inumbo-ID: 229e4ddd-8ccb-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729198955; x=1729803755; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IniFf35UezkvSvEGewqh6lr5mUJCyLnyObFDqnAgdgk=;
        b=oSPG1ymCBQlweTbkykUz+zc6hSEZI6GXVMr3I5hAo87XVG89QEb58MrGaEtmxzesVb
         nXEDB5MMWt4JiJ7cWXXFQnwCrCN0tLSjPfiwoA55XCtlYz6GzVvGUt7fOjAmLHiq+mVO
         WTQ+Qq5KMKk2bjb0NffGLvc2oKzTSYPwePO+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729198955; x=1729803755;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IniFf35UezkvSvEGewqh6lr5mUJCyLnyObFDqnAgdgk=;
        b=itr6Ii+8540mjkderHGm06Xix08SNW5WIHP+mvS2HjD1BzP8S17SVD2bkTp9U5OWov
         atIMslFxQMeMqx7SHMFVmFEFUNqF7hXpyhuOosS/5EtUuKq2qv3lGxKx7IbItsOE6Kcu
         F4I5icUALHCRIva98b5fFBT058aXt53t8lGtS5Ze7QO8TrVkk1cHDAVCTrV9QrGewWSR
         mjNPF65drxsH5vyHOznAWb4ERtzKKC5brQEKnajDX7hJsKoiu2wBOLnxmVMf0sD32LWf
         W44uebXVhkyWMsFIw3WTBEDDGuLjM080N7TbuvPYcGiUcNtYAR8ZXTJc2nhACYiEwmfm
         mDTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj68HGbQ2UHYFnkZ6K9liqX7VeAA6GTlbxzpx38HM7y/8K8IIZQrc6eG10lh28I0g6p0m+SbqPe38=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwlRZnhRMl8Ktlb/LcN16aNc9uk5YzGvERJfuPSsQALxzVtgUc/
	gft93GgBM8NHOzfmsFj8zATqgOrf/criY94FROsNDO4WiJPQnftTQuk1GNzO6rI=
X-Google-Smtp-Source: AGHT+IE2WdIVzJuaqz+AmwhdpTm1gEFkWP3WFhaRkzcff8kaiY+H+9NciT9oTZXcH/Xyrc70ofG/Uw==
X-Received: by 2002:a2e:be9d:0:b0:2fb:587d:2ee with SMTP id 38308e7fff4ca-2fb61b46312mr64047521fa.12.1729198955272;
        Thu, 17 Oct 2024 14:02:35 -0700 (PDT)
Message-ID: <766eaa46-fc8c-4069-a3bc-116dac23ca53@citrix.com>
Date: Thu, 17 Oct 2024 22:02:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/44] x86/boot: introduce struct boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
 <20241017170325.3842-6-dpsmith@apertussolutions.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241017170325.3842-6-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/10/2024 6:02 pm, Daniel P. Smith wrote:
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index f7ea482920ef..d8ee5741740a 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -284,6 +284,8 @@ static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
>  {
>      struct boot_info *bi = &xen_boot_info;
>      const multiboot_info_t *mbi = __va(mbi_p);
> +    module_t *mods = __va(mbi->mods_addr);
> +    unsigned int i;
>  
>      bi->nr_modules = (mbi->flags & MBI_MODULES) ? mbi->mods_count : 0;
>  
> @@ -302,6 +304,13 @@ static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
>          bi->memmap_length = mbi->mmap_length;
>      }
>  
> +    /*
> +     * Iterate over all modules, including the extra one which should have been
> +     * reserved for Xen itself
> +     */
> +    for ( i = 0; i <= bi->nr_modules; i++ )
> +        bi->mods[i].mod = &mods[i];

I'm afraid you've got a bug here.  bi->nr_modules is unsanitised from
firmware at this point.

It's checked/clamped later in __start_xen(), but not before you've
potentially scribbled past the end of bi->mod[] in this loop.

I think we want to retain the warning from clamping (which needs to be
after printk() is set up, so after parsing the cmdline), so to
compensate I think you want:

    i < ARRAY_SIZE(bi->mods) && i <= bi->nr_modules

as the loop condition here, and a note to this effect.  I'm not sure
what I think about passing exactly 64 modules, and this interacting with
the Xen slot.


However, you also want to move part of "x86/boot: convert create_dom0 to
use boot info" into this patch.

Specifically, the conversion from sizeof(module_map)*8 to
MAX_NR_BOOTMODS, or there's also a latent bug that depends Xen being
compiled as 64bit (unsigned long vs MAX_NR_BOOTMODS).

~Andrew

