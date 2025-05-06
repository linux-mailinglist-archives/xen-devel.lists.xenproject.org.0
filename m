Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A41AACB23
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 18:37:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977590.1364556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLID-0001Bi-Kk; Tue, 06 May 2025 16:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977590.1364556; Tue, 06 May 2025 16:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLID-0001A2-H7; Tue, 06 May 2025 16:37:17 +0000
Received: by outflank-mailman (input) for mailman id 977590;
 Tue, 06 May 2025 16:37:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cniF=XW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uCLIC-00019w-92
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:37:16 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d9b5395-2a98-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 18:37:14 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-39c266c1389so4435241f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 09:37:14 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a0b1ff8453sm1822959f8f.34.2025.05.06.09.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 May 2025 09:37:13 -0700 (PDT)
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
X-Inumbo-ID: 5d9b5395-2a98-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746549434; x=1747154234; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iBQnOG6o2JoKa54f3witE8SkuGiquIWiHkM+EA3gCYM=;
        b=mQ/dM4As+ZkYLjsSiGzp4exvUcth7x76d98pPEtYRTjVUhXaleT+srnRop4AuhGenw
         eSPLJx6QFC51rT4DhYhD3S7+TD7jmr7oz4kr964/586WFha3+cYjG83ZySQHPkAFOS/j
         Nrsod1jlCJ+EVnUOa9jDdJeiN+IwRgsZ+VeUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746549434; x=1747154234;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBQnOG6o2JoKa54f3witE8SkuGiquIWiHkM+EA3gCYM=;
        b=wWqssgEdztaWfp91ElXbNyZzHwgvHWZswZUmHg9y7lNk3Kg0i7NkOwLHd9SF8EtUVS
         CXmkhFnQ1TShjEuGg5qHLOX10ZoF8jdZWGM9iKhTwsvYen922tyE6YF5xqbdGPZER5Sg
         GHzq6yrFhwLWDcVLFT6wBFrqSTX27RF1fLlSwr4HL5InUNoohSQVqQAtHWCCMFTW3YQw
         omwXmN3MaaMzA7MqfE+U81NhPlV/xBK7D6zcko06BI6s4lOMnwwv/YOu1qART2XmUwi5
         zU3hnykq7CErbPTfWxGBIXwQVcb2YFhV+vUOII1AExUjyfDWDUDSWiznKjYkP23vg5WQ
         l1nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVShdBTjk2p98R8k50hZtrmf0IBF/V4Z1oliwwPhhLlE0u2TyZzeCqP6PqDXBc6UIT4XKG6rwiuH4c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx63oPDwSSZRonkRAlKEFEyMLcq1H2AxArDAghH7jzTKC+xLfcn
	ma6Aj03CfhZRL/PJVxjqr58Di4rfOwtPM0QzmY/QK20JWdy40TtznrlKUFAlxKw=
X-Gm-Gg: ASbGncstBHJRSTPceLyg2SsWNzI2gSygbl42mXwPlq9wlDsVTVSU3flD0UFZb1Wx26k
	ws09KXVfoT29IliduFpZIx722kLUF5ihVfBw5z4nMLClGLn/KnrfOci6R2FnRyzyCxjA28d4J4K
	OUGVFIKZulGpMtyF1/zWLbntU1JQGw0Nk0ExP2q3q6vcdP35+Roedp4RbOErFf8S3kN236Ucl5F
	oC6axft2hcSrgLU6+aAXZnkVP1+yr3tCSL5JF2kzjK9YIp+rnfTUAZ5VNPor+GOgVpK8hWk85hf
	eMq3Ue6SKFFzRRPEI8WypnWkckZ+L3ZcOAQT8mR2OdpLGgoo3+xnpfO78iBLYyVTTXMRNfBOSjW
	bmu4WHg==
X-Google-Smtp-Source: AGHT+IHBU7Q+8gbjZ4t/VsXPP1b4iP8uzN6tgSvEXW8vdfXiJTdtRcE011KxXw5yYmUF4x159MxtiA==
X-Received: by 2002:a05:6000:401f:b0:3a0:88b0:b81e with SMTP id ffacd0b85a97d-3a0b4a1917fmr117675f8f.36.1746549433782;
        Tue, 06 May 2025 09:37:13 -0700 (PDT)
Message-ID: <50a2737a-611a-4d83-aee6-de23619b0b6b@citrix.com>
Date: Tue, 6 May 2025 17:37:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] lib: Add strcspn function
To: Kevin Lampis <kevin.lampis@cloud.com>, xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20250506162420.1676377-1-kevin.lampis@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250506162420.1676377-1-kevin.lampis@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/05/2025 5:24 pm, Kevin Lampis wrote:
> diff --git a/xen/include/xen/string.h b/xen/include/xen/string.h
> index bd4a8f48e9..70c231b690 100644
> --- a/xen/include/xen/string.h
> +++ b/xen/include/xen/string.h
> @@ -26,6 +26,7 @@ size_t strnlen(const char *s, size_t count);
>  char *strpbrk(const char *cs,const char *ct);
>  char *strsep(char **s, const char *ct);
>  size_t strspn(const char *s, const char *accept);
> +size_t strcspn(const char *s, const char *reject);
>  
>  void *memset(void *s, int c, size_t n);
>  void *memcpy(void *dest, const void *src, size_t n);

Lower down in this file, you also want a define aliasing to
__builtin_strcspn() in the style of the others you'll see.  In turn,
you'll need to...

> diff --git a/xen/lib/strcspn.c b/xen/lib/strcspn.c
> new file mode 100644
> index 0000000000..42e3308dac
> --- /dev/null
> +++ b/xen/lib/strcspn.c
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + *  Copyright (C) 1991, 1992  Linus Torvalds
> + */
> +
> +#include <xen/string.h>
> +
> +/**
> + * strcspn - Calculate the length of the initial substring of @s which does not contain letters in @reject
> + * @s: The string to be searched
> + * @reject: The string to avoid
> + */
> +size_t strcspn(const char *s, const char *reject)

... write this as "size_t (strcspn)(const ..."

to avoid the macro expansion in this one place.

~Andrew

