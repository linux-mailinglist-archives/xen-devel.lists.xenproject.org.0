Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2694C8A2CFA
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 13:00:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704541.1100975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvEcs-00051I-NS; Fri, 12 Apr 2024 10:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704541.1100975; Fri, 12 Apr 2024 10:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvEcs-0004zW-KY; Fri, 12 Apr 2024 10:59:22 +0000
Received: by outflank-mailman (input) for mailman id 704541;
 Fri, 12 Apr 2024 10:59:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yOJy=LR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rvEcq-0004zQ-Ss
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 10:59:20 +0000
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6000b5a-f8bb-11ee-b908-491648fe20b8;
 Fri, 12 Apr 2024 12:59:19 +0200 (CEST)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-78d7558bf10so48100885a.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2024 03:59:19 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l20-20020ae9f014000000b0078ec5e88805sm1633336qkg.54.2024.04.12.03.59.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Apr 2024 03:59:18 -0700 (PDT)
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
X-Inumbo-ID: b6000b5a-f8bb-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712919558; x=1713524358; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/X6mskL8qMeU/S03D5XxolTz6ver5EACj57rm06MCHw=;
        b=k38EGfpm5X9rskv8kUv2NTPuVro0WXrScQIQDR95bod/m3FmMyRdQiwrTBjN328wRQ
         ifucB8/WjjUqw1h4kwQgt/MZBLtN3azySX5d1McWSpl2BllVCsXaLQtkjE8ubmP7i+2O
         mS7TX9TlxqByjENamrL3aGtMPzaKPVQdKa+iU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712919558; x=1713524358;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/X6mskL8qMeU/S03D5XxolTz6ver5EACj57rm06MCHw=;
        b=d4/qfhx2XSYFWwTGdN6LN5x9NBjnYQh3IIPQDmcjzA1Sr31n7VXN4eYV/Wiz+SgUL7
         Z9S11nZzuBIo9a3qO9hUbRPn74AxvI1anzuZU9z1Fx93SYCiKkp9F73P52vY7TImxt1N
         37jUx+ct0LoTmv6qJ/lmgP9cEqEWB42aZe32exSgT+KDUJyOfLRhp67sptlYFZFdE9iI
         RkTDL1LzXPbb21d50lwRzuJviIskygXZZcwagfGZT+qOi2nfDizllv9KjZcGEaD24VTU
         SE0nLa/5ggajqc8bfMI/Tc/xk+MH9RuQlYIeTUv/nzZbBYoD4yOP/uB1ai80pz7+7WzR
         O41Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8JVmrztioaIv4dZgD3Byz5Nvz6Xn7WFls8edwpJnqtjVOt/n+5MWlMd4eIak/Yyb9Pm4ck6BQezq1nbhKT+5dW5RHxMrOcPjTlga9ANY=
X-Gm-Message-State: AOJu0YyNKZo0jiwvK1kMyk5wAVhNgnvIeJmIQrLWYGtSPt1sssck5rZR
	pg19YCxBJU+kDuxuUewgwNfPy1jImRSlq/thw1l+OVWZ55WMxf/yFWSB4kWkQ/8=
X-Google-Smtp-Source: AGHT+IGjh/TjmquJSHtLTAjGcugctJzLOQDUOaxo2KA8EK7P+hZRG83oO+wcYpcS8vm7uZZOyDNjfw==
X-Received: by 2002:a05:620a:4ac5:b0:78e:c62e:1bf4 with SMTP id sq5-20020a05620a4ac500b0078ec62e1bf4mr2049727qkn.54.1712919558573;
        Fri, 12 Apr 2024 03:59:18 -0700 (PDT)
Message-ID: <a1444b09-ed0e-47d0-ad21-2b91077abbc8@citrix.com>
Date: Fri, 12 Apr 2024 11:59:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] livepatch: refuse to resolve symbols that belong to init
 sections
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20240412080722.75971-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240412080722.75971-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/04/2024 9:07 am, Roger Pau Monne wrote:
> Livepatch payloads containing symbols that belong to init sections can only
> lead to page faults later on, as by the time the livepatch is loaded init
> sections have already been freed.
>
> Refuse to resolve such symbols and return an error instead.
>
> Note such resolutions are only relevant for symbols that point to undefined
> sections (SHN_UNDEF), as that implies the symbol is not in the current payload
> and hence must either be a Xen or a different livepatch payload symbol.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/common/livepatch_elf.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/xen/common/livepatch_elf.c b/xen/common/livepatch_elf.c
> index 45d73912a3cd..25b81189c590 100644
> --- a/xen/common/livepatch_elf.c
> +++ b/xen/common/livepatch_elf.c
> @@ -8,6 +8,9 @@
>  #include <xen/livepatch_elf.h>
>  #include <xen/livepatch.h>
>  
> +/* Needed to check we don't resolve against init section symbols. */
> +extern char __init_begin[], __init_end[];
> +

The livepatching side of this is fine, and definitely an improvement.

However, this is the 3rd set of externs for these symbols.  Could I talk
you into doing a prerequisite patch which introduces <xen/sections.h>
and moves the externs out of {arm,x86}/setup.c ?

This will (subsequently - not to interfere with this change) allow us to
clean up kernel.h, and fix the nonsense that currently is __read_mostly
being in cache.h (which is causing problems for RISCV/PPC).

Also judging by kernel.h, they want a /* SAF-0-safe */ tag too for MISRA.


>  const struct livepatch_elf_sec *
>  livepatch_elf_sec_by_name(const struct livepatch_elf *elf,
>                            const char *name)
> @@ -310,6 +313,20 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
>                      break;
>                  }
>              }
> +            /*
> +             * Ensure not an init symbol.  Only applicable to Xen symbols, as
> +             * livepatch payloads don't have init sections or equivalent.
> +             */
> +            else if ( st_value >= (uintptr_t)&__init_begin &&
> +                      st_value <= (uintptr_t)&__init_end )

I think you want just < here.  A label at __init_end is the start of the
next section.

~Andrew

