Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 680028A1FA3
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 21:43:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704183.1100406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv0KF-0003xs-BZ; Thu, 11 Apr 2024 19:43:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704183.1100406; Thu, 11 Apr 2024 19:43:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv0KF-0003vN-8u; Thu, 11 Apr 2024 19:43:11 +0000
Received: by outflank-mailman (input) for mailman id 704183;
 Thu, 11 Apr 2024 19:43:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eZ5N=LQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rv0KE-0003vH-5M
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 19:43:10 +0000
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [2607:f8b0:4864:20::1133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b834613f-f83b-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 21:43:07 +0200 (CEST)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-617d4797d9bso1114437b3.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 12:43:07 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 g15-20020ad4514f000000b00698e1f25f22sm1333374qvq.4.2024.04.11.12.43.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 12:43:05 -0700 (PDT)
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
X-Inumbo-ID: b834613f-f83b-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712864587; x=1713469387; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bY4XxOzhSi91sU/Vk+DSl17mowpzSK61nxOVFzKzo2Y=;
        b=vUQ565R1JaStXValEeWdnPmLe4ZceoNlAPPVnjMbTgxBA9u+8YZgP7RhqfmvGZogMG
         Wix4gBXw/4sCu17HyP6pbromvjq4O4gxKOVuhjvuqTuhhqG4t077ilFEKGdvPOzRg2Ng
         97GXG4JjkCS8GFDs3Wz/8id+QYW1MiXTo0tus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712864587; x=1713469387;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bY4XxOzhSi91sU/Vk+DSl17mowpzSK61nxOVFzKzo2Y=;
        b=Ug4KwYUU1OX1L5nHzhjGYM1j6oc+Hc432FwLsr7GPDHGLsKA8I5BhhaflZiTG/nZpK
         4vGhEVTP3Zc3g6tWAWqI5C0WZad50VgxkINY5jnUJ+lT14sK9jH02n87dlLecCW6cbej
         GVvOE0gcTVO+L/o+4cS3QChIx0PBpajGjJFBFSbhKskNZxTZbFT6lwdqHkxApndjLo1f
         sgMqOyYDQIzCLro3pRiD45Sgb+E2H4NuHydNqdC0CZ+OSkXVeVEpOYwM7yYi6xVDPs0n
         vVaZTFqfOONR6E38SDrnafwayKgI21Yz/W4moiVLsJmO6TgGa4ak2DeuaZvD69WiL/Hy
         bRaw==
X-Forwarded-Encrypted: i=1; AJvYcCWwpzOsgFvafr4DXZ9cnk3PlscTE51WcweXJDvw6fu/D49m6CN60mvHwNPh4tIAhQqSL/b+YpO7a5GRZmFPn6H7icyV1dSOEvrfm1Mh/yI=
X-Gm-Message-State: AOJu0YwxNmHSVulSuOIEUbTxJ+k5yO5ZrYSM7PeaOK74iS9IUnmUMNVl
	yeK5F0fVYd5ie71sQ/9crDzbhVbybqTUdwUR8f36+0i+ymhG8wtDd1m657t+Z48=
X-Google-Smtp-Source: AGHT+IERe82NeCCgjFDwCX3B1OxR44nKCbrloVdHahYlRmUrXoPrwyVK13nuZwKqIKx51Plvm7vreg==
X-Received: by 2002:a0d:d816:0:b0:615:35e1:e512 with SMTP id a22-20020a0dd816000000b0061535e1e512mr579589ywe.0.1712864586717;
        Thu, 11 Apr 2024 12:43:06 -0700 (PDT)
Message-ID: <10931f84-3c83-4efd-9a78-933f3e9de3f2@citrix.com>
Date: Thu, 11 Apr 2024 20:43:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] gzip: move crc state into consilidated gzip state
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240411152518.2995-1-dpsmith@apertussolutions.com>
 <20240411152518.2995-5-dpsmith@apertussolutions.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240411152518.2995-5-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/04/2024 4:25 pm, Daniel P. Smith wrote:
> diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
> index c8dd35962abb..6c8c7452a31f 100644
> --- a/xen/common/gzip/inflate.c
> +++ b/xen/common/gzip/inflate.c
> @@ -1125,16 +1125,14 @@ static int __init inflate(struct gzip_data *gd)
>   *
>   **********************************************************************/
>  
> -static ulg __initdata crc_32_tab[256];
> -static ulg __initdata crc;  /* initialized in makecrc() so it'll reside in bss */
> -#define CRC_VALUE (crc ^ 0xffffffffUL)
> +#define CRC_VALUE (gd->crc ^ 0xffffffffUL)
>  
>  /*
>   * Code to compute the CRC-32 table. Borrowed from
>   * gzip-1.0.3/makecrc.c.
>   */
>  
> -static void __init makecrc(void)
> +static void __init makecrc(struct gzip_data *gd)
>  {
>  /* Not copyrighted 1990 Mark Adler */
>  
> @@ -1151,7 +1149,7 @@ static void __init makecrc(void)
>      for (i = 0; i < sizeof(p)/sizeof(int); i++)
>          e |= 1L << (31 - p[i]);
>  
> -    crc_32_tab[0] = 0;
> +    gd->crc_32_tab[0] = 0;
>  
>      for (i = 1; i < 256; i++)
>      {
> @@ -1162,11 +1160,11 @@ static void __init makecrc(void)
>              if (k & 1)
>                  c ^= e;
>          }
> -        crc_32_tab[i] = c;
> +        gd->crc_32_tab[i] = c;
>      }
>  
>      /* this is initialized here so this code could reside in ROM */
> -    crc = (ulg)0xffffffffUL; /* shift register contents */
> +    gd->crc = (ulg)0xffffffffUL; /* shift register contents */
>  }
>  
>  /* gzip flag byte */

I can't see any way that a non-32bit value ever gets stored, because 'e'
doesn't ever have bit 32 set in it.  I have a sneaking suspicion that
this is code written in the 32bit days, where sizeof(long) was still 4.

This change, if correct, halves the size of gzip_state.

~Andrew

