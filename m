Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B45E0B0FE9B
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 04:01:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055016.1423595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uelFe-00086Y-Nb; Thu, 24 Jul 2025 02:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055016.1423595; Thu, 24 Jul 2025 02:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uelFe-00085c-Ki; Thu, 24 Jul 2025 02:00:06 +0000
Received: by outflank-mailman (input) for mailman id 1055016;
 Thu, 24 Jul 2025 02:00:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BvLp=2F=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uelFc-0007hv-66
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 02:00:05 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e88ad3b5-6831-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 04:00:01 +0200 (CEST)
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
X-Inumbo-ID: e88ad3b5-6831-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=uskvpgmv2neczgowdbmxhfyjmm.protonmail; t=1753322399; x=1753581599;
	bh=h7IuTrUPE3KH89ZFuQiAs3/l3TPpMtIpRRTTwvGC+tY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=PSIYpGG7iwChTKrtulidBGcawhehQghWf3rMkDvgpOvtsR/uFVS1EgPmsBqmqwxGX
	 O+o/qkGKy6E3dOmGuukljssdQpZpYa2XfaZ9nZrhjItdVUQgIqXdzjg1sGkTTtl73u
	 NS63+AIHEttyqt7BvZ8A6Oud3YnU6e1U5JYZhIErrk4pwxGxOFFfIpEwO00e+fSHk7
	 6xtivn4LtPoG0177wrBSXLLQ8NCkgRqlrP+SmEb+AomVa7t3hz1KbGa4fmB3EQIhoX
	 4X/UtELHEhH4+6x2JA+so9H2cw1Q9JK//V6U5FzmWGNSaQrPrqBoFdlUDzTrd0FIZc
	 Y3AY5v7cuiJig==
Date: Thu, 24 Jul 2025 01:59:56 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3] EFI/runtime: switch to xv[mz]alloc_array()
Message-ID: <aIGTmFl6WB7e+fqx@kraken>
In-Reply-To: <41b7e14c-59ef-40f5-8c43-69bdc5fb4531@suse.com>
References: <41b7e14c-59ef-40f5-8c43-69bdc5fb4531@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: ec41dd8ef92e27773e63c63d2febbb91b3924448
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2025 at 03:39:11PM +0200, Jan Beulich wrote:
> Use the more "modern" form, thus doing away with effectively open-coding
> xmalloc_array() at the same time. While there is a difference in
> generated code, as xmalloc_bytes() forces SMP_CACHE_BYTES alignment, if
> code really cared about such higher than default alignment, it should
> request so explicitly.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com>=20

> ---
> v3: Use xv[mz]alloc_array().
>=20
> --- a/xen/common/efi/runtime.c
> +++ b/xen/common/efi/runtime.c
> @@ -6,6 +6,7 @@
>  #include <xen/irq.h>
>  #include <xen/sections.h>
>  #include <xen/time.h>
> +#include <xen/xvmalloc.h>
>=20
>  DEFINE_XEN_GUEST_HANDLE(CHAR16);
>=20
> @@ -500,23 +501,23 @@ int efi_runtime_call(struct xenpf_efi_ru
>          len =3D gwstrlen(guest_handle_cast(op->u.get_variable.name, CHAR=
16));
>          if ( len < 0 )
>              return len;
> -        name =3D xmalloc_array(CHAR16, ++len);
> +        name =3D xvmalloc_array(CHAR16, ++len);
>          if ( !name )
>             return -ENOMEM;
>          if ( __copy_from_guest(name, op->u.get_variable.name, len) ||
>               wmemchr(name, 0, len) !=3D name + len - 1 )
>          {
> -            xfree(name);
> +            xvfree(name);
>              return -EIO;
>          }
>=20
>          size =3D op->u.get_variable.size;
>          if ( size )
>          {
> -            data =3D xmalloc_bytes(size);
> +            data =3D xvmalloc_array(unsigned char, size);
>              if ( !data )
>              {
> -                xfree(name);
> +                xvfree(name);
>                  return -ENOMEM;
>              }
>          }
> @@ -539,8 +540,8 @@ int efi_runtime_call(struct xenpf_efi_ru
>          else
>              rc =3D -EOPNOTSUPP;
>=20
> -        xfree(data);
> -        xfree(name);
> +        xvfree(data);
> +        xvfree(name);
>      }
>      break;
>=20
> @@ -553,17 +554,17 @@ int efi_runtime_call(struct xenpf_efi_ru
>          len =3D gwstrlen(guest_handle_cast(op->u.set_variable.name, CHAR=
16));
>          if ( len < 0 )
>              return len;
> -        name =3D xmalloc_array(CHAR16, ++len);
> +        name =3D xvmalloc_array(CHAR16, ++len);
>          if ( !name )
>             return -ENOMEM;
>          if ( __copy_from_guest(name, op->u.set_variable.name, len) ||
>               wmemchr(name, 0, len) !=3D name + len - 1 )
>          {
> -            xfree(name);
> +            xvfree(name);
>              return -EIO;
>          }
>=20
> -        data =3D xmalloc_bytes(op->u.set_variable.size);
> +        data =3D xvmalloc_array(unsigned char, op->u.set_variable.size);
>          if ( !data )
>              rc =3D -ENOMEM;
>          else if ( copy_from_guest(data, op->u.set_variable.data,
> @@ -581,8 +582,8 @@ int efi_runtime_call(struct xenpf_efi_ru
>              efi_rs_leave(&state);
>          }
>=20
> -        xfree(data);
> -        xfree(name);
> +        xvfree(data);
> +        xvfree(name);
>      }
>      break;
>=20
> @@ -598,13 +599,13 @@ int efi_runtime_call(struct xenpf_efi_ru
>              return -EINVAL;
>=20
>          size =3D op->u.get_next_variable_name.size;
> -        name.raw =3D xzalloc_bytes(size);
> +        name.raw =3D xvzalloc_array(unsigned char, size);
>          if ( !name.raw )
>              return -ENOMEM;
>          if ( copy_from_guest(name.raw, op->u.get_next_variable_name.name=
,
>                               size) )
>          {
> -            xfree(name.raw);
> +            xvfree(name.raw);
>              return -EFAULT;
>          }
>=20
> @@ -629,7 +630,7 @@ int efi_runtime_call(struct xenpf_efi_ru
>          else
>              rc =3D -EOPNOTSUPP;
>=20
> -        xfree(name.raw);
> +        xvfree(name.raw);
>      }
>      break;
>=20
>=20


