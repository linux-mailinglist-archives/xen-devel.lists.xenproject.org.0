Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF64779354
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 17:38:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582593.912432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUUDa-0001T5-99; Fri, 11 Aug 2023 15:38:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582593.912432; Fri, 11 Aug 2023 15:38:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUUDa-0001RO-6L; Fri, 11 Aug 2023 15:38:26 +0000
Received: by outflank-mailman (input) for mailman id 582593;
 Fri, 11 Aug 2023 15:38:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uWpM=D4=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1qUUDY-0001RI-Lj
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 15:38:24 +0000
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com
 [2607:f8b0:4864:20::92d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 197f9380-385d-11ee-b284-6b7b168915f2;
 Fri, 11 Aug 2023 17:38:22 +0200 (CEST)
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-79a2216a2d1so671046241.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Aug 2023 08:38:21 -0700 (PDT)
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
X-Inumbo-ID: 197f9380-385d-11ee-b284-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691768300; x=1692373100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XGamp700wXZqjrGNGxGsuhukXPjOXx3yqeJ++UGSjs=;
        b=gV4ANlNq4ThfTY9nco4/TtowpxN6zn926/pMGu/SzLX4dc+Cd3k82JSntXrVPf+P4I
         eZrATFqQPkZl30q/iIfaiJjjw+kCz3HVpEdQL5F78NYEXR9p+ggc7Qhxq/TXVDyD4rHg
         N1+63ZO857GAaoHcT/uIYTsE6oLi5NvYPFwA40UdyCd5cyj7qhBM5glYuqNYs+oce+o6
         f5REzpO6BEboaePLwTukWkqJ1Chq9lk0BTuyhBriUBkbzGAOZ0Af+UUL0fZTwcM0o4PB
         uSVeBa/0JoKzGjzY+pkfIY8NklteQXSlkyCfLYexWgv3i418g+Qqa1JIa35tlZdX/Zsx
         mrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691768300; x=1692373100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9XGamp700wXZqjrGNGxGsuhukXPjOXx3yqeJ++UGSjs=;
        b=WagJTscjAxJ3BW/+xYP4UQWGpCPOLqHwvGOFphYn/3hn2EWHRazNWEAFTURKhr8CPh
         R1rLQ4ZJWauGOYwFA04TgZM/N7S/u3btJq2xAePDI+HnuMp9qMsWq+Aq9LftUSQJAtbL
         A6DgYETQQBoxF+6vzg5BuLhPZO1xBlCLhxzQtKPWHp2Jjm3sMBI/8Sl10uEZHU9tMNlm
         KdZScL8ni4jDT19Y23HcFmkJZsbgg9eR/h6EVWxDcAx1BeQYJ2tPj6LhviZ4IN2UX/LD
         0t/JWrEg0f5gi/Bravc6ejWAFRK+GZTyt0+8phk4N5bNq+OWiz/oADU595c8HxKQ2G4T
         jzAg==
X-Gm-Message-State: AOJu0YwgEmOuPEokHwLNvAvE8OqeFOv0OTZXaK/jFhRcF9kP2rZCH9f4
	px0j1hEDIVWLC8Jolz0Pe5Yqw/HWomM7y6ppKqU=
X-Google-Smtp-Source: AGHT+IGDkDmwvbrD5+ctQu7jfktng6tRxd7Nn40CNdO7YVLNpobIbaSHPQmFwe++AcR02VyIk2gu8P/+BkPSP4MBM2Q=
X-Received: by 2002:a05:6102:3014:b0:440:c4fb:f257 with SMTP id
 s20-20020a056102301400b00440c4fbf257mr1889703vsa.0.1691768300256; Fri, 11 Aug
 2023 08:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1691763757.git.oleksii.kurochko@gmail.com> <4d986a1083f35ab66eba6ffde964af3b4453b216.1691763757.git.oleksii.kurochko@gmail.com>
In-Reply-To: <4d986a1083f35ab66eba6ffde964af3b4453b216.1691763757.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Aug 2023 11:37:54 -0400
Message-ID: <CAKmqyKOOX2Yxj9pJabiZfQ9=FduuW9QWCOH0nwv00swyJO-UBQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/6] xen/riscv: introduce temporary printk stuff
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 11, 2023 at 10:33=E2=80=AFAM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> The patch introdcuces printk related stuff which should be deleted
> after Xen common code will be available.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changes in V8:
>  - only rebase was done.
> ---
> Changes in V7:
>  - only rebase was done.
> ---
> Changes in V6:
>  - the patch was introduced in the current patch series (V6)
> ---
>  xen/arch/riscv/early_printk.c | 168 ++++++++++++++++++++++++++++++++++
>  1 file changed, 168 insertions(+)
>
> diff --git a/xen/arch/riscv/early_printk.c b/xen/arch/riscv/early_printk.=
c
> index 610c814f54..60742a042d 100644
> --- a/xen/arch/riscv/early_printk.c
> +++ b/xen/arch/riscv/early_printk.c
> @@ -40,3 +40,171 @@ void early_printk(const char *str)
>          str++;
>      }
>  }
> +
> +/*
> + * The following #if 1 ... #endif should be removed after printk
> + * and related stuff are ready.
> + */
> +#if 1
> +
> +#include <xen/stdarg.h>
> +#include <xen/string.h>
> +
> +/**
> + * strlen - Find the length of a string
> + * @s: The string to be sized
> + */
> +size_t (strlen)(const char * s)
> +{
> +    const char *sc;
> +
> +    for (sc =3D s; *sc !=3D '\0'; ++sc)
> +        /* nothing */;
> +    return sc - s;
> +}
> +
> +/**
> + * memcpy - Copy one area of memory to another
> + * @dest: Where to copy to
> + * @src: Where to copy from
> + * @count: The size of the area.
> + *
> + * You should not use this function to access IO space, use memcpy_toio(=
)
> + * or memcpy_fromio() instead.
> + */
> +void *(memcpy)(void *dest, const void *src, size_t count)
> +{
> +    char *tmp =3D (char *) dest, *s =3D (char *) src;
> +
> +    while (count--)
> +        *tmp++ =3D *s++;
> +
> +    return dest;
> +}
> +
> +int vsnprintf(char* str, size_t size, const char* format, va_list args)
> +{
> +    size_t i =3D 0; /* Current position in the output string */
> +    size_t written =3D 0; /* Total number of characters written */
> +    char* dest =3D str;
> +
> +    while ( format[i] !=3D '\0' && written < size - 1 )
> +    {
> +        if ( format[i] =3D=3D '%' )
> +        {
> +            i++;
> +
> +            if ( format[i] =3D=3D '\0' )
> +                break;
> +
> +            if ( format[i] =3D=3D '%' )
> +            {
> +                if ( written < size - 1 )
> +                {
> +                    dest[written] =3D '%';
> +                    written++;
> +                }
> +                i++;
> +                continue;
> +            }
> +
> +            /*
> +             * Handle format specifiers.
> +             * For simplicity, only %s and %d are implemented here.
> +             */
> +
> +            if ( format[i] =3D=3D 's' )
> +            {
> +                char* arg =3D va_arg(args, char*);
> +                size_t arglen =3D strlen(arg);
> +
> +                size_t remaining =3D size - written - 1;
> +
> +                if ( arglen > remaining )
> +                    arglen =3D remaining;
> +
> +                memcpy(dest + written, arg, arglen);
> +
> +                written +=3D arglen;
> +                i++;
> +            }
> +            else if ( format[i] =3D=3D 'd' )
> +            {
> +                int arg =3D va_arg(args, int);
> +
> +                /* Convert the integer to string representation */
> +                char numstr[32]; /* Assumes a maximum of 32 digits */
> +                int numlen =3D 0;
> +                int num =3D arg;
> +                size_t remaining;
> +
> +                if ( arg < 0 )
> +                {
> +                    if ( written < size - 1 )
> +                    {
> +                        dest[written] =3D '-';
> +                        written++;
> +                    }
> +
> +                    num =3D -arg;
> +                }
> +
> +                do
> +                {
> +                    numstr[numlen] =3D '0' + num % 10;
> +                    num =3D num / 10;
> +                    numlen++;
> +                } while ( num > 0 );
> +
> +                /* Reverse the string */
> +                for (int j =3D 0; j < numlen / 2; j++)
> +                {
> +                    char tmp =3D numstr[j];
> +                    numstr[j] =3D numstr[numlen - 1 - j];
> +                    numstr[numlen - 1 - j] =3D tmp;
> +                }
> +
> +                remaining =3D size - written - 1;
> +
> +                if ( numlen > remaining )
> +                    numlen =3D remaining;
> +
> +                memcpy(dest + written, numstr, numlen);
> +
> +                written +=3D numlen;
> +                i++;
> +            }
> +        }
> +        else
> +        {
> +            if ( written < size - 1 )
> +            {
> +                dest[written] =3D format[i];
> +                written++;
> +            }
> +            i++;
> +        }
> +    }
> +
> +    if ( size > 0 )
> +        dest[written] =3D '\0';
> +
> +    return written;
> +}
> +
> +void printk(const char *format, ...)
> +{
> +    static char buf[1024];
> +
> +    va_list args;
> +    va_start(args, format);
> +
> +    (void)vsnprintf(buf, sizeof(buf), format, args);
> +
> +    early_printk(buf);
> +
> +    va_end(args);
> +}
> +
> +#endif
> +
> --
> 2.41.0
>
>

