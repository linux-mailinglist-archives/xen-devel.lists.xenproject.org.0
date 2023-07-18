Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 697D9758129
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 17:41:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565386.883507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLmob-00033y-1C; Tue, 18 Jul 2023 15:40:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565386.883507; Tue, 18 Jul 2023 15:40:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLmoa-00031n-UZ; Tue, 18 Jul 2023 15:40:40 +0000
Received: by outflank-mailman (input) for mailman id 565386;
 Tue, 18 Jul 2023 15:40:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CPt9=DE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qLmoY-00031C-Qz
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 15:40:38 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 712d46c0-2581-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 17:40:37 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso9519516e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jul 2023 08:40:37 -0700 (PDT)
Received: from [192.168.201.189] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 g21-20020a19ee15000000b004fb76abbc7asm484936lfb.89.2023.07.18.08.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 08:40:36 -0700 (PDT)
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
X-Inumbo-ID: 712d46c0-2581-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689694837; x=1692286837;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZYh0LpM6k57E8n+GrF+g7r7p5SxsWbISKpzRToIME0k=;
        b=eBB5uTlLW/vR3KC4uV4Yc2z3oAF0RsCLHWHvQZ0CKs2ZDh8aSvM0r5QV5xWf7hc6y/
         1FAmwXtjbVJmyLCGSRpvyk333NmlqtRJYy9GP40XOcaK2hS9FaN7kgzk2NasmLdT1vNm
         lU3vKuUxVZKcbbpYrnB1D/q9Sppe2M489HU/MD5oCMpjohfhiyfR7us12ZqU4+vbUQti
         Y4U23+IsPJWF/k/9iB4x/9XtKo2t3jcoP0RkVbn/6SF2oMtY9u2J+pBbhe6o+v8XCh9p
         lYLwikX2RWY1hEj7xy8qQ1ZmeRTOoBlGFCp0WERaXfYPp9L23wcvko6FcJTOd1sxz9Qq
         F+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689694837; x=1692286837;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZYh0LpM6k57E8n+GrF+g7r7p5SxsWbISKpzRToIME0k=;
        b=QuXGHxqmdCp9tYEeqMhSJGxvW6julojItD76SmaNGBEwB33pxlaZH+H3A71M4UWD9J
         K1qOeP7ZQt1L/we560sy34GPPzCTCxRKn7KbZROQLRi40XlyJo2kPYjwQfDvLSdyuYZB
         n2vttdUh4uwQrrZ/UxVECX8S5VHbfLxGjJZ1m2jSaCo5ep9Hz5sv8H5ZN8EDEYJ/2UqP
         6GXJfYy18LQwG/2gi6iW3ODvmwvm+G12MeVjMwp4nFe03GoJWCVJ8F10aAgVOOV3Na8P
         ndy6xjREETEeqRjwDk6DwOve+SPGdZw5ufJDesdrESJgsoqTcjF7QpHUi1V/0sF0qmIz
         xnmQ==
X-Gm-Message-State: ABy/qLaUgCPKCv5VYc/Y/tYWjwvYWKr9mZ44CJG0sqKHFvUezAvt5598
	+dec0e1/2LgJHhujALsr44g=
X-Google-Smtp-Source: APBJJlHss70iLseUmqK9YV5hlJ3cDRE/Fnu0uk6LBRtfHkStHExaq4kPKPPeikfz3bFeQ/ecXXQ72A==
X-Received: by 2002:a05:6512:1103:b0:4fd:d004:2583 with SMTP id l3-20020a056512110300b004fdd0042583mr1692863lfg.19.1689694836934;
        Tue, 18 Jul 2023 08:40:36 -0700 (PDT)
Message-ID: <0525bc8f7028fe9fcad79aaa864025c1705b8026.camel@gmail.com>
Subject: Re: [PATCH v3 1/8] common: move a few macros out of xen/lib.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, George
 Dunlap <george.dunlap@citrix.com>
Date: Tue, 18 Jul 2023 18:40:35 +0300
In-Reply-To: <109efb43-a519-73f6-2a26-2b420090ab2b@suse.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
	 <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
	 <109efb43-a519-73f6-2a26-2b420090ab2b@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-07-10 at 10:51 +0200, Jan Beulich wrote:
> Introduce xen/macros.h for this purpose. For now xen/lib.h simply
> includes xen/macro.h, until consumers can be suitable cleaned up.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: New.
>=20
> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -1,26 +1,7 @@
> =C2=A0#ifndef __LIB_H__
> =C2=A0#define __LIB_H__
> =C2=A0
> -#define ROUNDUP(x, a) (((x) + (a) - 1) & ~((a) - 1))
> -
> -#define IS_ALIGNED(val, align) (!((val) & ((align) - 1)))
> -
> -#define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
> -#define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
> -
> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
> -
> -#define count_args_(dot, a1, a2, a3, a4, a5, a6, a7, a8, x, ...) x
> -#define count_args(args...) \
> -=C2=A0=C2=A0=C2=A0 count_args_(., ## args, 8, 7, 6, 5, 4, 3, 2, 1, 0)
> -
> -/* Indirect macros required for expanded argument pasting. */
> -#define PASTE_(a, b) a ## b
> -#define PASTE(a, b) PASTE_(a, b)
> -
> -#define __STR(...) #__VA_ARGS__
> -#define STR(...) __STR(__VA_ARGS__)
> +#include <xen/macros.h>
> =C2=A0
> =C2=A0#ifndef __ASSEMBLY__
> =C2=A0
> --- /dev/null
> +++ b/xen/include/xen/macros.h
> @@ -0,0 +1,34 @@
> +#ifndef __MACROS_H__
> +#define __MACROS_H__
> +
> +#define ROUNDUP(x, a) (((x) + (a) - 1) & ~((a) - 1))
> +
> +#define IS_ALIGNED(val, align) (!((val) & ((align) - 1)))
> +
> +#define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
> +#define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
> +
> +#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
> +#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
> +
> +#define count_args_(dot, a1, a2, a3, a4, a5, a6, a7, a8, x, ...) x
> +#define count_args(args...) \
> +=C2=A0=C2=A0=C2=A0 count_args_(., ## args, 8, 7, 6, 5, 4, 3, 2, 1, 0)
> +
> +/* Indirect macros required for expanded argument pasting. */
> +#define PASTE_(a, b) a ## b
> +#define PASTE(a, b) PASTE_(a, b)
> +
> +#define __STR(...) #__VA_ARGS__
> +#define STR(...) __STR(__VA_ARGS__)
> +
> +#endif /* __MACROS_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
>=20
Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii


