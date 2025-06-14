Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79055AD9E58
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 18:41:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1015622.1393168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQTw3-0001Cf-Fz; Sat, 14 Jun 2025 16:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1015622.1393168; Sat, 14 Jun 2025 16:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQTw3-0001B1-Bf; Sat, 14 Jun 2025 16:40:51 +0000
Received: by outflank-mailman (input) for mailman id 1015622;
 Sat, 14 Jun 2025 16:40:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=duY6=Y5=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1uQTw1-0001Aq-Ni
 for xen-devel@lists.xenproject.org; Sat, 14 Jun 2025 16:40:49 +0000
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [2607:f8b0:4864:20::b2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51e5b372-493e-11f0-a309-13f23c93f187;
 Sat, 14 Jun 2025 18:40:48 +0200 (CEST)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e733a6ff491so2952728276.2; 
 Sat, 14 Jun 2025 09:40:46 -0700 (PDT)
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
X-Inumbo-ID: 51e5b372-493e-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749919245; x=1750524045; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyhGtYKM6CaMo7sZeOdWXFDLBzFhUdblvvIYybl912A=;
        b=JpuM6fVg/CgluctgalzPo55dKfiT90ZPEd2ZX1XQ9FOlw4xGLRVK8kARSOYgoAAwpA
         RgwoLKEYEH8eBa9wfoQltwTxtLV1neKZHiEfIHmPA6rEA9BUI9fbTus4sD0BJvCYbCxp
         rRWXBtEUXk4PslBidZIRtL3Nz/t8DNopCnM4nX1b8a+RgLn0KEUOfXvutRVxxNTN7YS0
         fH34lf7Nwf/eFq+ucT2ZSRoykMdm1O/VU/94EbK4SErwZ4Ab0YJrgdcz7ymIvENLVLl0
         949jiTsyh9I3u6VzT1ZzL93h+kvZYBrHKRui0EYIXfFCew921nX42apVhJPDyY/d61RN
         G4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749919245; x=1750524045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyhGtYKM6CaMo7sZeOdWXFDLBzFhUdblvvIYybl912A=;
        b=F+uKFwPWJ05WXuUNtyXEW+ES3NEs/giO17VccXjlI+WA/shEzHgIwJ+1zrdio9S+v1
         0FYLCQwYHDtDqaj7fvgtMvQPjO8BGNyHssQbkQVcS6oHSnUdrM63DNH90wB8JXRiK06P
         VRVWcF4PwEYNoUFHA1+mZfmliLL11QQuNWXBjnQnUX3fqOxdcr74L9zyjZsVh0RP9vfj
         OaiO3+aequMsPqyGuZ9Er6Pr9+y7b/bpjNGmTlU/ZeMdkgmhU8tXFrxYPgCzioMi0Bkt
         40C3U+Cg9NiZ0FzeP9xydx/9Uc3YBXtPWE5Zsofu178fVDD72feJN8u686v0v6Nq/RBK
         zGlw==
X-Forwarded-Encrypted: i=1; AJvYcCXB2Rh4S1KK0dvc+aLwac/Jch0pM0qd0lvM7oEkMsGZeBbArK6Ke88w44oaI57u4G4bf6STjZAG5xA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5jk+wuqHbSDTYDBiJbqAWgO670DY8fzY/ARZx1BcRY1bC1rLw
	WNgZ5Cyv5c0xaMHsMoiPzhqoKRjwwqJ4qHtT8JRtOWfAwC83P7gEeWO6d0bCqfCWzqeVckYmfZu
	+jQwACNTbdmxlpxMkhaffAm1qqhWXOR74fw==
X-Gm-Gg: ASbGnctmGQhecDbVLtb4HJDJ8v9tVsZsw+CqfSAi7/12N3cAPIeY9P/CGyTP98Quw1y
	Txa96NWLi6j1qDM3qx8oxrCDTBgFPx2lzgJ4B0JrdtMnMn+GKeBS6AssabpVk6XOriCqOrMK760
	8l4/T12Fvi7vIToQT2i/2MKOih3/ygQxPn5rUGEclu
X-Google-Smtp-Source: AGHT+IHXjOfj16s2KHf0PdH1p43swU4encjYeBVutq6Runhj97SwFXC6A3XMRCekZz++EQ+xq7Ob1fjJR5kLwcIbNVQ=
X-Received: by 2002:a05:690c:67c9:b0:70d:f673:141b with SMTP id
 00721157ae682-7117548a480mr49110147b3.13.1749919245231; Sat, 14 Jun 2025
 09:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250321092451.17309-1-jgross@suse.com> <20250321092451.17309-2-jgross@suse.com>
In-Reply-To: <20250321092451.17309-2-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sat, 14 Jun 2025 12:40:33 -0400
X-Gm-Features: AX0GCFto9IYCdtiXjfKnsdnT_mODOSsq1C0J0AMYEfT-wD-3cPSXfHy79Jr-Dlc
Message-ID: <CAKf6xptTLrEem1rvR+siM+-v-BqkAAs1A8jd-Ed7+NH6c61=Fw@mail.gmail.com>
Subject: Re: [MINI-OS PATCH 01/12] kexec: add kexec framework
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, 
	samuel.thibault@ens-lyon.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 5:25=E2=80=AFAM Juergen Gross <jgross@suse.com> wro=
te:
>
> Add a new config option CONFIG_KEXEC for support of kexec-ing into a
> new mini-os kernel. Add a related kexec.c source and a kexec.h header.
>
> For now allow CONFIG_KEXEC to be set only for PVH variant of mini-os.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---


> diff --git a/arch/x86/testbuild/all-yes b/arch/x86/testbuild/all-yes
> index 8ae489a4..99ba75dd 100644
> --- a/arch/x86/testbuild/all-yes
> +++ b/arch/x86/testbuild/all-yes
> @@ -19,3 +19,5 @@ CONFIG_BALLOON =3D y
>  CONFIG_USE_XEN_CONSOLE =3D y
>  # The following are special: they need support from outside
>  CONFIG_LWIP =3D n
> +# KEXEC only without PARAVIRT

Maybe: "KEXEC not implemented for PARAVIRT"?

> +CONFIG_KEXEC =3D n

> diff --git a/kexec.c b/kexec.c
> new file mode 100644
> index 00000000..53528169
> --- /dev/null
> +++ b/kexec.c
> @@ -0,0 +1,62 @@

> +
> +#include <errno.h>
> +#include <mini-os/os.h>
> +#include <mini-os/lib.h>
> +#include <mini-os/kexec.h>
> +
> +/*
> + * General approach for kexec support (PVH only) is as follows:
> + *
> + * - New kernel needs to be in memory in form of a ELF file in a virtual

"in the form of an ELF binary"

> + *   memory region.

Maybe just "The new kernel needs to be an ELF binary loaded into the
Mini-OS address space"?

> + * - A new start_info structure is constructed in memory with the final
> + *   memory locations included.
> + * - All memory areas needed for kexec execution are being finalized.
> + * - From here on a graceful failure is no longer possible.
> + * - Grants and event channels are torn down.
> + * - A temporary set of page tables is constructed at a location where i=
t
> + *   doesn't conflict with old and new kernel or start_info.
> + * - The final kexec execution stage is copied to a memory area below 4G=
 which
> + *   doesn't conflict with the target areas of kernel etc.
> + * - Cr3 is switched to the new set of page tables.
> + * - Execution continues in the final execution stage.
> + * - All data is copied to its final addresses.
> + * - Processing is switched to 32-bit mode without address translation.

Maybe "CPU is switched to 32-bit mode with paging disabled."?

Is the following memory layout correct?

[ 0 ... 8MB ] ... [ X ... X + Y ] ... [ Z ...      ]
 Old stubdom        New stubdom         kexec code

kexec code copies New stubdom to 0 and later jumps to New stubdom @ 0

The temporary page tables are to allow old stubdom and kexec code to
be called while overwriting the "Old stubdom" range which would
include the page tables originally used?  Or it can only run the kexec
code once old stubdom is overwritten, right?

I think some comments tweaks would be helpful, but code-wise
everything is okay, so:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Regards,
Jason

