Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70880978E57
	for <lists+xen-devel@lfdr.de>; Sat, 14 Sep 2024 08:17:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798570.1208782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spM5d-0008HR-3G; Sat, 14 Sep 2024 06:17:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798570.1208782; Sat, 14 Sep 2024 06:17:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spM5c-0008Fh-Vb; Sat, 14 Sep 2024 06:17:00 +0000
Received: by outflank-mailman (input) for mailman id 798570;
 Sat, 14 Sep 2024 06:17:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tSsM=QM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1spM5c-0008Fb-3g
 for xen-devel@lists.xenproject.org; Sat, 14 Sep 2024 06:17:00 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2aa7672-7260-11ef-a0b5-8be0dac302b0;
 Sat, 14 Sep 2024 08:16:58 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c24ebaa427so5783824a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 23:16:58 -0700 (PDT)
Received: from [172.31.47.100] ([193.118.249.27])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90613338f4sm37604766b.216.2024.09.13.23.16.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 23:16:57 -0700 (PDT)
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
X-Inumbo-ID: f2aa7672-7260-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726294618; x=1726899418; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pQBxitKYLnKEEnSEqhk+u9QNUGzBONdJpcfD4QftNFc=;
        b=YgxLX2yO4Gp5G0NiqtVNR+zvvjynyOSSXzH3zHr5MNrwQD7FRplWPs27qMCHyS4hmk
         e6cUk670p/4pehdNzoYyY3hD5/y6Yz7Vkb27JOV5INtbdO4AaQrIeJ6tPH/W0MYGh4I2
         mpFJ1XHrt83WuCWV3iMt+U6sNzgdm1mbJMkfAiTucPgpVNCazxqjmUlCxkIEUsj3EGoS
         NzgYFqNtvghIo049TJcaWIrvcs5Vkegr6arQFxTUDXXnCQusQ6VnLu5tM4fRKcVV3Bq2
         TQw+SVH3s66kyBnVNMO0ei76QFSzaMM8ojHRB4Qs/cG9cvtumpxLCauG/o3pM5ATZSgC
         wpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726294618; x=1726899418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pQBxitKYLnKEEnSEqhk+u9QNUGzBONdJpcfD4QftNFc=;
        b=Lrk99ltGI/+TDjNyPen/fCXEXPm1M+KNfENW+RJKmzYX+8+w2xqyVH1J6MaTFgI0tB
         3/PXTAWOYEIiDhgwRJR4l7AiJJPSJOFCqZnXTVXBX0QzsOlBwUeUdVp4kWzZOMYCw6Cg
         BYnRcNhcOnNYpWcupAB9JKglG43zSCm/skQ6ar1Hrro8eEDRlMTllO9Pe8IvEO+mA8Ys
         5th75EvO7KkgmAlSTDIxzl7zvexN/E4tapy5DRSaNWhxg00xK5EptZWBALynCU2LCLtI
         XjV1MoU1jkPx5fn8uVeMQNbcOsOV8999yLrspEeEj85XaT0bILUDgaT+ijqhQZYKs4M6
         zUpw==
X-Forwarded-Encrypted: i=1; AJvYcCWZX3PocEJjxeUO/wl+/DxbMXUFbGFxe/yJG8F8fI71yZ3Ngbdo3ztSOow/b9PoN4IqFIA4KY5QwRM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAFezipS5PZNNXrkUML/Qoa52hMqGJvJvPB/tVpXbqyjMM+irI
	KaB1WLkoggU89A49qQ9z3HwnZwJrhcxbtzXXJYksWIMTe55fRO7MlNJzSEKB0g==
X-Google-Smtp-Source: AGHT+IE/VRgpT+Ii43pjsfluqSJoKUR25gsCq/NuMH0I83cW/vKjYpNHdvpOKHMGSUEvQLlDJ3BMTw==
X-Received: by 2002:a17:907:3d8a:b0:a8b:58e3:ac1f with SMTP id a640c23a62f3a-a902a435374mr908810766b.12.1726294617923;
        Fri, 13 Sep 2024 23:16:57 -0700 (PDT)
Message-ID: <d8627af4-5149-48ed-b107-f2401e6dddd3@suse.com>
Date: Sat, 14 Sep 2024 08:16:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86: Put trampoline in separate .init.trampoline
 section
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240911095550.31139-1-frediano.ziglio@cloud.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20240911095550.31139-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.09.2024 11:55, Frediano Ziglio wrote:
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -882,8 +882,9 @@ cmdline_parse_early:
>  reloc:
>          .incbin "reloc.bin"
>  
> +#include "x86_64.S"
> +
> +        .section .init.trampoline, "aw", @progbits
>  ENTRY(trampoline_start)
>  #include "trampoline.S"
>  ENTRY(trampoline_end)

Hmm, nice - this turns out rather easier than I first thought.

> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -269,6 +269,11 @@ SECTIONS
>         __ctors_end = .;
>    } PHDR(text)
>  
> +  . = ALIGN(PAGE_SIZE);

Why? There's no special alignment right now.

> +  DECL_SECTION(.init.trampoline) {
> +       *(.init.trampoline)
> +  } PHDR(text)
> +
>  #ifndef EFI

If this is to be a separate section also for ELF, I think that
wants mentioning explicitly. "Easily disassemble" is too vague
a reason for my taste.

Jan

