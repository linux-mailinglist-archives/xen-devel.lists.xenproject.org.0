Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7656A8A8990
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 19:00:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707672.1105787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx8e8-0005K5-MO; Wed, 17 Apr 2024 17:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707672.1105787; Wed, 17 Apr 2024 17:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx8e8-0005HZ-JM; Wed, 17 Apr 2024 17:00:32 +0000
Received: by outflank-mailman (input) for mailman id 707672;
 Wed, 17 Apr 2024 17:00:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f8dp=LW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rx8e6-0005HT-L4
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 17:00:30 +0000
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [2607:f8b0:4864:20::f2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdbb0ed4-fcdb-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 19:00:28 +0200 (CEST)
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-6a04bae513cso5996d6.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 10:00:28 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 s9-20020ad45249000000b0069bd4f7cf64sm2658384qvq.3.2024.04.17.10.00.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 10:00:27 -0700 (PDT)
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
X-Inumbo-ID: fdbb0ed4-fcdb-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713373227; x=1713978027; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OVW7rJsR9ebhv5BmKAUybABfASgXNYaZtzEDTk3mgHE=;
        b=oIEDAIHuLieqXZSwu4p+aoh04NoLa8SgiDiIDWxMecAb8FgPtT11+2t9NhI5x97RXG
         rte/hytR8IxIFUSALwN2jktOY6AjRuvJEu7+S2SYSjrbKmcOr6Tq9osvR9NzaBBP5ZiU
         U6hTEwhqD9MhPR2+k6JRmlJHNXlFutFKDIA2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713373227; x=1713978027;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVW7rJsR9ebhv5BmKAUybABfASgXNYaZtzEDTk3mgHE=;
        b=ihPdOVj1QGpeQBKk2i38iYkxD+/Tjz+2NTiXaefbN+LJPydfPp+cJcW1pHUV93hOd1
         lLJ/qu2frq6tGjXTdUgbcihHzwU8Dj1rcVLtgo8sCqXGdAO5zjjuuJH+/enrMvjixhqT
         GhvDpXVutCUiZy4tVe4AW+cP/NCZo8jF57BlDKC9Eib+yOGlQt3C1Ov7Tjv1Nx1zXSZN
         F8nDC+mmFtz0Ok3PqDxqxYe/nQ1OY+A86o6kyrdX4svrYhXmI0FWzZPp0Y2ranJXaqwx
         x6JDb2El7doDTZ8gAQo5R2aXF7mNzrlP6dSvmuaZgbi93CY1Oxht3sOwDbndjDmQUn1V
         GeOw==
X-Forwarded-Encrypted: i=1; AJvYcCXvtkPDiwWUAFQ6GjecwNOFM5/g2SSmGDLiiynLcAPRSpK0PB+YvJQnmnsHNoWH/xAGhlvU6WGSI9PFGWe1xBEK8tpUdVkU8VfhPAXuZD0=
X-Gm-Message-State: AOJu0YzDn2cQLIDL61MVuH+oAnFgRMCIjgs+oDdS7qlJ3XWwYtFZZYjE
	ta8bpVJvDlPbWzwh07c3HQjiTCzlVX40wD0x8aJA9zA+L8NNEwvAb8vF461K6I4=
X-Google-Smtp-Source: AGHT+IF69HbNiAR9bK+jrtDArw/mGsjq23CYB/unqJUA4MhuM6GnynXvPJG+7gxTeLRhAlstQpKuxA==
X-Received: by 2002:a05:6214:15c7:b0:69b:2d2c:6988 with SMTP id p7-20020a05621415c700b0069b2d2c6988mr16317503qvz.0.1713373227572;
        Wed, 17 Apr 2024 10:00:27 -0700 (PDT)
Message-ID: <419522c1-ad14-4ff1-a689-1237646c0da4@citrix.com>
Date: Wed, 17 Apr 2024 18:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] gzip: move crc state into consilidated gzip state
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240417143716.27189-1-dpsmith@apertussolutions.com>
 <20240417143716.27189-6-dpsmith@apertussolutions.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240417143716.27189-6-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/04/2024 3:37 pm, Daniel P. Smith wrote:
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

The change in type is fine, but does need discussing.  Furthermore, ...

> diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
> index 8178a05a0190..bef324d3d166 100644
> --- a/xen/common/gzip/gunzip.c
> +++ b/xen/common/gzip/gunzip.c
> @@ -74,7 +77,7 @@ static __init void flush_window(struct gzip_state *s)
>       * The window is equal to the output buffer therefore only need to
>       * compute the crc.
>       */
> -    unsigned long c = crc;
> +    unsigned long c = s->crc;

... this wants to be unsigned int I think.

> diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
> index 5735bbcf7eb4..c18ce20210b0 100644
> --- a/xen/common/gzip/inflate.c
> +++ b/xen/common/gzip/inflate.c
> @@ -1063,16 +1063,14 @@ static int __init inflate(struct gzip_state *s)
>   *
>   **********************************************************************/
>  
> -static ulg __initdata crc_32_tab[256];
> -static ulg __initdata crc;  /* initialized in makecrc() so it'll reside in bss */
> -#define CRC_VALUE (crc ^ 0xffffffffUL)
> +#define CRC_VALUE (s->crc ^ 0xffffffffUL)

$ git grep CRC_VALUE
common/gzip/inflate.c:1052:#define CRC_VALUE (s->crc ^ 0xffffffffUL)
common/gzip/inflate.c:1207:    if (orig_crc != CRC_VALUE) {

I'd expand this in it's single user, but like ...

>  
>  /*
>   * Code to compute the CRC-32 table. Borrowed from
>   * gzip-1.0.3/makecrc.c.
>   */
>  
> -static void __init makecrc(void)
> +static void __init makecrc(struct gzip_state *s)
>  {
>  /* Not copyrighted 1990 Mark Adler */
>  
> @@ -1089,7 +1087,7 @@ static void __init makecrc(void)
>      for (i = 0; i < sizeof(p)/sizeof(int); i++)
>          e |= 1L << (31 - p[i]);
>  
> -    crc_32_tab[0] = 0;
> +    s->crc_32_tab[0] = 0;
>  
>      for (i = 1; i < 256; i++)
>      {
> @@ -1100,11 +1098,11 @@ static void __init makecrc(void)
>              if (k & 1)
>                  c ^= e;
>          }
> -        crc_32_tab[i] = c;
> +        s->crc_32_tab[i] = c;
>      }
>  
>      /* this is initialized here so this code could reside in ROM */
> -    crc = (ulg)0xffffffffUL; /* shift register contents */
> +    s->crc = (ulg)0xffffffffUL; /* shift register contents */

... this, the constant should become -1u or ~0u because of the type change.

I'm not sure what to make of the ROM comment, but I suspect it means the
XOR can be dropped with a bit of care too.

~Andrew

