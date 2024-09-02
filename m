Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1714A968B49
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 17:48:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788192.1197660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl9Hh-00032F-3n; Mon, 02 Sep 2024 15:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788192.1197660; Mon, 02 Sep 2024 15:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl9Hh-0002zA-0p; Mon, 02 Sep 2024 15:48:05 +0000
Received: by outflank-mailman (input) for mailman id 788192;
 Mon, 02 Sep 2024 15:48:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3FK6=QA=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sl9Hf-0002z4-Uc
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 15:48:03 +0000
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [2607:f8b0:4864:20::c31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bba4a3fa-6942-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 17:48:01 +0200 (CEST)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-5dd43ab0458so2572862eaf.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 08:48:01 -0700 (PDT)
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
X-Inumbo-ID: bba4a3fa-6942-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725292080; x=1725896880; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=huS+Rkh0gW605+IMQXvm88EHA0VUlS9iLwOmTOqFoVw=;
        b=hIpxa7gfB0sYBDOIYcSZvwBaLY755hR93r6jJo7fitbPp5SLIHvjwgnWVPJQtpXTSJ
         mUn8xDqst8q8o7E6n3SacQ+jidpV7OJwO+l7F0A7L07YZC0ZFt0XjaJ9Zuf/lJAeU9uI
         WopvL2hOGAamZ0UjgobDIc4lprsX8zUj0N0B8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725292080; x=1725896880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huS+Rkh0gW605+IMQXvm88EHA0VUlS9iLwOmTOqFoVw=;
        b=Mh4NNkjslTR2+yZxnLfUAbRmgqpG2x9ourzGetmu6xme2c3sN3HSBbAFMw9AjT7ysJ
         4WfCoSoCg3raBIN4hkl9wEc1MY/QQu9wsPuKgKz0rO/KqE5WJ6dTDcNkSjdjBuYVEv1D
         6XvlLACeeL+Jvdbv+5afbRBAxV5EOxvdD2l7HPGRnnr8DyLSNczou1kqYDSo6HmHE9Mj
         VASMYH3W3c/WjBOjBAnacUB7NiX6z4MMoBFI2r/kWFVvEvnZqpoT4KSL6XjuxhgSPA5J
         P8Hv0CUjwmdAAiucx4Cx+He0lWUHMXWyhnAmmINoXUPilFxCf3uqE/xc010L9MGRA3aP
         vPnA==
X-Gm-Message-State: AOJu0YzxIBxQrCVVkEbHWnf+1SIfMeU92hvIcFDwUK5d6okrk+/FyI1T
	5lwPEio6vwCr2sezPv9oP+ErdFfaKs0STzQgrmt7qbxe3JxNRJlKQMfHlNI32/b/+Cnsutn6a0E
	G5Cf7AxfQ25VhRDCijibwcutuX2RbSi8CEqadKw==
X-Google-Smtp-Source: AGHT+IH8+s2t761Beka/FBbfp9GZwNaB9kqTLAntgekV+3Wd9Rg7psPhdri58aQS3m2/4Xng3aMuOi+nTPfhVUzEhpY=
X-Received: by 2002:a05:6870:a714:b0:270:1295:af54 with SMTP id
 586e51a60fabf-277d0455946mr7763993fac.28.1725292080340; Mon, 02 Sep 2024
 08:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240902133232.3302839-1-andrew.cooper3@citrix.com> <20240902133232.3302839-3-andrew.cooper3@citrix.com>
In-Reply-To: <20240902133232.3302839-3-andrew.cooper3@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 2 Sep 2024 16:47:49 +0100
Message-ID: <CACHz=ZhSZHJqQRL0R3dr=7A3WuV55=p8qrkpfSPm-DjbVovHew@mail.gmail.com>
Subject: Re: [PATCH 2/4] x86/boot: Use <xen/macros.h>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 2:32=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> ... rather than opencoding locally.
>
> This involve collecting various macros scattered around Xen (min()/max()
> macros from kernel.h, and _p() from lib.h) and moving them into macros.h
>
> In reloc.c, replace ALIGN_UP() with ROUNDUP().
>
> No functional change.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/arch/x86/boot/cmdline.c |  4 ++++
>  xen/arch/x86/boot/defs.h    | 19 ----------------
>  xen/arch/x86/boot/reloc.c   | 11 +++++-----
>  xen/include/xen/kernel.h    | 36 +-----------------------------
>  xen/include/xen/lib.h       |  2 --
>  xen/include/xen/macros.h    | 44 +++++++++++++++++++++++++++++++++++++
>  6 files changed, 55 insertions(+), 61 deletions(-)
>
> diff --git a/xen/arch/x86/boot/cmdline.c b/xen/arch/x86/boot/cmdline.c
> index 28a47da7ab02..b7375d106678 100644
> --- a/xen/arch/x86/boot/cmdline.c
> +++ b/xen/arch/x86/boot/cmdline.c
> @@ -31,6 +31,7 @@ asm (
>      );
>
>  #include <xen/kconfig.h>
> +#include <xen/macros.h>
>  #include <xen/types.h>
>
>  #include "defs.h"
> @@ -50,6 +51,9 @@ typedef struct __packed {
>  #endif
>  } early_boot_opts_t;
>
> +/* Avoid pulling in all of ctypes.h for this. */
> +#define tolower(c)     ((c) | 0x20)
> +
>  /*
>   * Space and TAB are obvious delimiters. However, I am
>   * adding "\n" and "\r" here too. Just in case when
> diff --git a/xen/arch/x86/boot/defs.h b/xen/arch/x86/boot/defs.h
> index cf9a80d116f3..4d519ac4f5ea 100644
> --- a/xen/arch/x86/boot/defs.h
> +++ b/xen/arch/x86/boot/defs.h
> @@ -24,23 +24,4 @@
>  #define __packed       __attribute__((__packed__))
>  #define __stdcall      __attribute__((__stdcall__))
>
> -#define ALIGN_UP(arg, align) \
> -                (((arg) + (align) - 1) & ~((typeof(arg))(align) - 1))
> -
> -#define min(x,y) ({ \
> -        const typeof(x) _x =3D (x);       \
> -        const typeof(y) _y =3D (y);       \
> -        (void) (&_x =3D=3D &_y);            \
> -        _x < _y ? _x : _y; })
> -
> -#define max(x,y) ({ \
> -        const typeof(x) _x =3D (x);       \
> -        const typeof(y) _y =3D (y);       \
> -        (void) (&_x =3D=3D &_y);            \
> -        _x > _y ? _x : _y; })
> -
> -#define _p(val)                ((void *)(unsigned long)(val))
> -
> -#define tolower(c)     ((c) | 0x20)
> -
>  #endif /* __BOOT_DEFS_H__ */
> diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
> index ac8b58b69581..eb9902d73fd9 100644
> --- a/xen/arch/x86/boot/reloc.c
> +++ b/xen/arch/x86/boot/reloc.c
> @@ -26,6 +26,7 @@ asm (
>      "    jmp  reloc                    \n"
>      );
>
> +#include <xen/macros.h>
>  #include <xen/types.h>
>
>  #include "defs.h"
> @@ -76,7 +77,7 @@ static uint32_t alloc;
>
>  static uint32_t alloc_mem(uint32_t bytes)
>  {
> -    return alloc -=3D ALIGN_UP(bytes, 16);
> +    return alloc -=3D ROUNDUP(bytes, 16);
>  }
>
>  static void zero_mem(uint32_t s, uint32_t bytes)
> @@ -202,11 +203,11 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in=
, uint32_t video_out)
>      zero_mem(ptr, sizeof(*mbi_out));
>
>      /* Skip Multiboot2 information fixed part. */
> -    ptr =3D ALIGN_UP(mbi_in + sizeof(*mbi_fix), MULTIBOOT2_TAG_ALIGN);
> +    ptr =3D ROUNDUP(mbi_in + sizeof(*mbi_fix), MULTIBOOT2_TAG_ALIGN);
>
>      /* Get the number of modules. */
>      for ( tag =3D _p(ptr); (uint32_t)tag - mbi_in < mbi_fix->total_size;
> -          tag =3D _p(ALIGN_UP((uint32_t)tag + tag->size, MULTIBOOT2_TAG_=
ALIGN)) )
> +          tag =3D _p(ROUNDUP((uint32_t)tag + tag->size, MULTIBOOT2_TAG_A=
LIGN)) )
>      {
>          if ( tag->type =3D=3D MULTIBOOT2_TAG_TYPE_MODULE )
>              ++mbi_out->mods_count;
> @@ -227,11 +228,11 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in=
, uint32_t video_out)
>      }
>
>      /* Skip Multiboot2 information fixed part. */
> -    ptr =3D ALIGN_UP(mbi_in + sizeof(*mbi_fix), MULTIBOOT2_TAG_ALIGN);
> +    ptr =3D ROUNDUP(mbi_in + sizeof(*mbi_fix), MULTIBOOT2_TAG_ALIGN);
>
>      /* Put all needed data into mbi_out. */
>      for ( tag =3D _p(ptr); (uint32_t)tag - mbi_in < mbi_fix->total_size;
> -          tag =3D _p(ALIGN_UP((uint32_t)tag + tag->size, MULTIBOOT2_TAG_=
ALIGN)) )
> +          tag =3D _p(ROUNDUP((uint32_t)tag + tag->size, MULTIBOOT2_TAG_A=
LIGN)) )
>      {
>          switch ( tag->type )
>          {
> diff --git a/xen/include/xen/kernel.h b/xen/include/xen/kernel.h
> index bc2440b5f96e..c5b6cc977772 100644
> --- a/xen/include/xen/kernel.h
> +++ b/xen/include/xen/kernel.h
> @@ -5,43 +5,9 @@
>   * 'kernel.h' contains some often-used function prototypes etc
>   */
>
> +#include <xen/macros.h>
>  #include <xen/types.h>
>
> -/*
> - * min()/max() macros that also do
> - * strict type-checking.. See the
> - * "unnecessary" pointer comparison.
> - */
> -#define min(x,y) ({ \
> -        const typeof(x) _x =3D (x);       \
> -        const typeof(y) _y =3D (y);       \
> -        (void) (&_x =3D=3D &_y);            \
> -        _x < _y ? _x : _y; })
> -
> -#define max(x,y) ({ \
> -        const typeof(x) _x =3D (x);       \
> -        const typeof(y) _y =3D (y);       \
> -        (void) (&_x =3D=3D &_y);            \
> -        _x > _y ? _x : _y; })
> -
> -/*
> - * ..and if you can't take the strict
> - * types, you can specify one yourself.
> - *
> - * Or not use min/max at all, of course.
> - */
> -#define min_t(type,x,y) \
> -        ({ type __x =3D (x); type __y =3D (y); __x < __y ? __x: __y; })
> -#define max_t(type,x,y) \
> -        ({ type __x =3D (x); type __y =3D (y); __x > __y ? __x: __y; })
> -
> -/*
> - * pre-processor, array size, and bit field width suitable variants;
> - * please don't use in "normal" expressions.
> - */
> -#define MIN(x,y) ((x) < (y) ? (x) : (y))
> -#define MAX(x,y) ((x) > (y) ? (x) : (y))
> -
>  /**
>   * container_of - cast a member of a structure out to the containing str=
ucture
>   *
> diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
> index 394319c81863..e884a02ee8ce 100644
> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -57,8 +57,6 @@ static inline void
>  debugtrace_printk(const char *fmt, ...) {}
>  #endif
>
> -/* Allows us to use '%p' as general-purpose machine-word format char. */
> -#define _p(_x) ((void *)(unsigned long)(_x))
>  extern void printk(const char *fmt, ...)
>      __attribute__ ((format (printf, 1, 2), cold));
>
> diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
> index 44d723fd121a..19caaa8026ea 100644
> --- a/xen/include/xen/macros.h
> +++ b/xen/include/xen/macros.h
> @@ -101,6 +101,50 @@
>   */
>  #define sizeof_field(type, member) sizeof(((type *)NULL)->member)
>
> +/* Cast an arbitrary integer to a pointer. */
> +#define _p(x) ((void *)(unsigned long)(x))

Really minor, and not a regression, I personally prefer uintptr_t
instead of "unsigned long", beside portability (which is not an issue
in Xen) is more clear we are dealing with a number representing a
pointer.

> +
> +/*
> + * min()/max() macros that also do strict type-checking..
> + */
> +#define min(x, y)                               \
> +    ({                                          \
> +        const typeof(x) _x =3D (x);               \
> +        const typeof(y) _y =3D (y);               \
> +        (void)(&_x =3D=3D &_y); /* typecheck */     \
> +        _x < _y ? _x : _y;                      \
> +    })
> +#define max(x, y)                               \
> +    ({                                          \
> +        const typeof(x) _x =3D (x);               \
> +        const typeof(y) _y =3D (y);               \
> +        (void)(&_x =3D=3D &_y); /* typecheck */     \
> +        _x > _y ? _x : _y;                      \
> +    })
> +
> +/*
> + * ..and if you can't take the strict types, you can specify one yoursel=
f.
> + */
> +#define min_t(type, x, y)                       \
> +    ({                                          \
> +        type __x =3D (x);                         \
> +        type __y =3D (y);                         \
> +        __x < __y ? __x: __y;                   \
> +    })
> +#define max_t(type, x, y)                       \
> +    ({                                          \
> +        type __x =3D (x);                         \
> +        type __y =3D (y);                         \
> +        __x > __y ? __x: __y;                   \
> +    })
> +
> +/*
> + * pre-processor, array size, and bit field width suitable variants;
> + * please don't use in "normal" expressions.
> + */
> +#define MIN(x, y) ((x) < (y) ? (x) : (y))
> +#define MAX(x, y) ((x) > (y) ? (x) : (y))
> +
>  #endif /* __ASSEMBLY__ */
>
>  #endif /* __MACROS_H__ */

Beside the silly comment, I'm fine with the series.

Frediano

