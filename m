Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA4A8AAC87
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 12:10:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708923.1108131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxlCZ-0006DJ-DV; Fri, 19 Apr 2024 10:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708923.1108131; Fri, 19 Apr 2024 10:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxlCZ-0006Ad-AM; Fri, 19 Apr 2024 10:10:39 +0000
Received: by outflank-mailman (input) for mailman id 708923;
 Fri, 19 Apr 2024 10:10:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/X0h=LY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rxlCY-0006AV-Ht
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 10:10:38 +0000
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [2607:f8b0:4864:20::112e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 107fa828-fe35-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 12:10:36 +0200 (CEST)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-614ec7ee902so19087677b3.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 03:10:36 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r15-20020ac85e8f000000b004359216e794sm1452069qtx.29.2024.04.19.03.10.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Apr 2024 03:10:35 -0700 (PDT)
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
X-Inumbo-ID: 107fa828-fe35-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713521435; x=1714126235; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yALHaaRhHmSCSbWr9Nij5VFHkklrkhbh+6p/p6Xc2b4=;
        b=usZERj/FxJVGeVJQrxQC+1Vc7xx6GAKvuqXGYlNZjbRnxsigE0glXkNpjUSyMv4BNZ
         NpT1uFGQGu1Qiq6d8FL2iEcX6AJh1T91saTiSryNqBcLizzQTJ0fFUZkOR8A4NS5JDSb
         YmTFIV6wcrCh89Qp1boAvt8jTowtcogsaGWU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713521435; x=1714126235;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yALHaaRhHmSCSbWr9Nij5VFHkklrkhbh+6p/p6Xc2b4=;
        b=iTR0Z2ylOfTY1UhBzyMd8cU0EHPUFkvKdwpIumPNaS34hk+AwUwfyl6szpixO3VO0s
         5L9jNddSkxBiMyJOJipZy3Z2weoswaybEzdGYZxttQ3PI+qEhmemPJoczK0edgj3nC1N
         HK7IsNcYy1DbeN3P8Ebi9y4qNbwfcotJgdaOrw3cBKUf1MYHeFtaUvTKM2Ao//EsWckh
         7kczX1X4wIfaiaY9pUD1wTtzQLeEh8niFZKWte4GsklqfyOcl/qq3k3GUa5L5v85SFD+
         cVvsrsbXZylikNc8jpmx3jnMFYTomamx1GPRBuMUW0C4V9pi7TAJZGvaNz4xCtpd9ruH
         rTJw==
X-Forwarded-Encrypted: i=1; AJvYcCWAyBte6HYTWI3ACHhzUk+R+B6DUi9UsMkVDbj3ZegJHd8bgQp36PM1mVC92hiC9Jl9ytAXvP9Z6XF5wpJg9VacXJvG8fpJlmDH1p9HrWg=
X-Gm-Message-State: AOJu0YzfqwrzOssPcpZND0oh+lV1Odj0t/TnFoz0oq6FO8ls0Vpbb5NA
	e2JDrDdAqgU32jJ0UvyJx7w+Pm7E+tm6NbFoUrgLjwyEA84lr6I8w51jpaZOi3Ia3hLn4GGguUK
	gKyM=
X-Google-Smtp-Source: AGHT+IHcX1wycOUvKG4lFSvc/+wVlfw3q7v/k9LjUMM3VPFipxofEinpz/Xjy7kml4FGIfr9tFZbhQ==
X-Received: by 2002:a05:690c:61c3:b0:61a:c2fc:1128 with SMTP id hk3-20020a05690c61c300b0061ac2fc1128mr1530521ywb.28.1713521435400;
        Fri, 19 Apr 2024 03:10:35 -0700 (PDT)
Message-ID: <96bb1fbb-0b4c-42ac-9c3b-16700a65130d@citrix.com>
Date: Fri, 19 Apr 2024 11:10:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] livepatch: refuse to resolve symbols that belong
 to init sections
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20240419100217.12072-1-roger.pau@citrix.com>
 <20240419100217.12072-3-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240419100217.12072-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/04/2024 11:02 am, Roger Pau Monne wrote:
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
> Do not allow to resolve symbols that point to __init_begin, as that address is
> also unmapped.  On the other hand, __init_end is not unmapped, and hence allow
> resolutions against it.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although ...

> ---
> Changes since v1:
>  - Fix off-by-one in range checking.
> ---
>  xen/common/livepatch_elf.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/xen/common/livepatch_elf.c b/xen/common/livepatch_elf.c
> index 45d73912a3cd..a67101eadc02 100644
> --- a/xen/common/livepatch_elf.c
> +++ b/xen/common/livepatch_elf.c
> @@ -4,6 +4,7 @@
>  
>  #include <xen/errno.h>
>  #include <xen/lib.h>
> +#include <xen/sections.h>
>  #include <xen/symbols.h>
>  #include <xen/livepatch_elf.h>
>  #include <xen/livepatch.h>
> @@ -310,6 +311,21 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
>                      break;
>                  }
>              }
> +
> +            /*
> +             * Ensure not an init symbol.  Only applicable to Xen symbols, as
> +             * livepatch payloads don't have init sections or equivalent.
> +             */
> +            else if ( st_value >= (uintptr_t)&__init_begin &&
> +                      st_value < (uintptr_t)&__init_end )

... I normally vertically the (casts) in cases like this for improved
legibility.  Happy to fold on commit.

~Andrew

