Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEC123B62D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 09:57:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2rpI-0001sQ-3b; Tue, 04 Aug 2020 07:57:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PUrY=BO=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k2rpG-0001sL-Ge
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 07:57:34 +0000
X-Inumbo-ID: 270839d4-d628-11ea-9134-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 270839d4-d628-11ea-9134-bc764e2007e4;
 Tue, 04 Aug 2020 07:57:33 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a14so36482280wra.5
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2020 00:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=vvQsoFHR2+DeaNoRp6DMvUWjuYGvhITErRMiUFGaDog=;
 b=dRYw/T0yqo5tl0bDOFShRYSS6Qf3gjZEgMUmriHTzgnKjgLlSGhSdbJ5egLrYzbEpW
 kyJfO+uq4G3gnyQ0qxGkaHHZD0BfRoVzpJ7EamxfRuroAnSCec7bGONhnWOzQ0xGxrtG
 KFt4qpRaYMjrGRLyY+mNMBaD6JZjHiAcpOeCZ3HbBPrnaEfz+lKfxI/bxdJirJW2Mzs2
 NFsKPMrLeT1vF5+ocVSwE2mCzRbLmZSK3iJboY+lEDqGYM/jFVi6CKGTDs0vUxnkWaHT
 pPtVo7tkVeJxSSFk9mTnY5wDIgIkouKaTx/GM7CMggRADoOZ7inEVmtPXlii3Hmplx16
 Vm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=vvQsoFHR2+DeaNoRp6DMvUWjuYGvhITErRMiUFGaDog=;
 b=P9Ovm3Bf65/rsPIyRtbyjxf+GbfFVvwuBqpF/KdaZZOpGu/gI2esGVeMdJjo3Lm3C0
 EHg9WJ/NaCzviq68jbPuUaQAQK/+43Whdu6WH8pIziHXhBJo0t+gHG/WnFl3oJ7TRqfa
 yiv8JuUe/HqvVhmwFwpZsWmszmb4eAYqE0xPYsDuaoQnufzMr2kNxU64zm8m+COA33Aj
 H4eM3Tz5wumTb3TA/TXP4FQ0oJG/qTtgW2ZhK/SeIKJRWlabHp4afUaEaZgsELi+a1tA
 2zDD8pUda82F7uWo4w1HuYLXr666LyNOpKFHlsncPGU0dG1by0y+BKmCqLbrS4+BxN5Q
 bNWg==
X-Gm-Message-State: AOAM5319qZlz9+IFQu1FRkAtUQl0asaC9MxM/LnScqICNtnP2BGz6vw4
 VkSPMp8vBNjKmUs64NsEw/w=
X-Google-Smtp-Source: ABdhPJz5q55RXy9x8zNWsppP9ibasWEC4DANgO7R8btCtThODKtR27kGUGJdBZeIVcEjiBsemuaUpw==
X-Received: by 2002:adf:ef92:: with SMTP id d18mr19684984wro.71.1596527852677; 
 Tue, 04 Aug 2020 00:57:32 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:9005:cf07:3ece:ca77])
 by smtp.gmail.com with ESMTPSA id r3sm2114782wro.1.2020.08.04.00.57.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Aug 2020 00:57:32 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20200804074930.13104-1-philmd@redhat.com>
 <20200804074930.13104-2-philmd@redhat.com>
In-Reply-To: <20200804074930.13104-2-philmd@redhat.com>
Subject: RE: [PATCH-for-5.1 v2 1/1] accel/xen: Fix xen_enabled() behavior on
 target-agnostic objects
Date: Tue, 4 Aug 2020 08:57:31 +0100
Message-ID: <001201d66a34$e82ec070$b88c4150$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQM/xXTZtf+c9Zv1otz4aIX099Jj8gDx5jXApk1PJBA=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Peter Maydell' <peter.maydell@linaro.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Paul Durrant' <pdurrant@amazon.com>, 'Paolo Bonzini' <pbonzini@redhat.com>,
 'Anthony Perard' <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Sent: 04 August 2020 08:50
> To: qemu-devel@nongnu.org
> Cc: Peter Maydell <peter.maydell@linaro.org>; Anthony Perard =
<anthony.perard@citrix.com>; Paolo
> Bonzini <pbonzini@redhat.com>; Stefano Stabellini =
<sstabellini@kernel.org>; xen-
> devel@lists.xenproject.org; Paul Durrant <paul@xen.org>; Philippe =
Mathieu-Daud=C3=A9 <philmd@redhat.com>;
> Paul Durrant <pdurrant@amazon.com>
> Subject: [PATCH-for-5.1 v2 1/1] accel/xen: Fix xen_enabled() behavior =
on target-agnostic objects
>=20
> CONFIG_XEN is generated by configure and stored in "config-target.h",
> which is (obviously) only include for target-specific objects.
> This is a problem for target-agnostic objects as CONFIG_XEN is never
> defined and xen_enabled() is always inlined as 'false'.
>=20
> Fix by following the KVM schema, defining CONFIG_XEN_IS_POSSIBLE
> when we don't know to force the call of the non-inlined function,
> returning the xen_allowed boolean.
>=20
> Fixes: da278d58a092 ("accel: Move Xen accelerator code under =
accel/xen/")
> Reported-by: Paul Durrant <pdurrant@amazon.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/sysemu/xen.h   | 18 ++++++++++++++----
>  accel/stubs/xen-stub.c |  2 ++
>  accel/xen/xen-all.c    |  7 +------
>  3 files changed, 17 insertions(+), 10 deletions(-)
>=20
> diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
> index 1ca292715e..2c2c429ea8 100644
> --- a/include/sysemu/xen.h
> +++ b/include/sysemu/xen.h
> @@ -8,9 +8,19 @@
>  #ifndef SYSEMU_XEN_H
>  #define SYSEMU_XEN_H
>=20
> -#ifdef CONFIG_XEN
> +#ifdef NEED_CPU_H
> +# ifdef CONFIG_XEN
> +#  define CONFIG_XEN_IS_POSSIBLE
> +# endif
> +#else
> +# define CONFIG_XEN_IS_POSSIBLE
> +#endif
>=20
> -bool xen_enabled(void);
> +#ifdef CONFIG_XEN_IS_POSSIBLE
> +
> +extern bool xen_allowed;
> +
> +#define xen_enabled()           (xen_allowed)

Can this not move ahead of the #ifdef now (since xen_allowed is present =
in both xen-stub and xen-all)? I think this is what Peter was saying in =
his option '(2)'.

  Paul

>=20
>  #ifndef CONFIG_USER_ONLY
>  void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
> @@ -18,7 +28,7 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t =
size,
>                     struct MemoryRegion *mr, Error **errp);
>  #endif
>=20
> -#else /* !CONFIG_XEN */
> +#else /* !CONFIG_XEN_IS_POSSIBLE */
>=20
>  #define xen_enabled() 0
>  #ifndef CONFIG_USER_ONLY
> @@ -33,6 +43,6 @@ static inline void xen_ram_alloc(ram_addr_t =
ram_addr, ram_addr_t size,
>  }
>  #endif
>=20
> -#endif /* CONFIG_XEN */
> +#endif /* CONFIG_XEN_IS_POSSIBLE */
>=20
>  #endif
> diff --git a/accel/stubs/xen-stub.c b/accel/stubs/xen-stub.c
> index dcca4e678a..8ae658acff 100644
> --- a/accel/stubs/xen-stub.c
> +++ b/accel/stubs/xen-stub.c
> @@ -9,6 +9,8 @@
>  #include "hw/xen/xen.h"
>  #include "qapi/qapi-commands-misc.h"
>=20
> +bool xen_allowed;
> +
>  void xenstore_store_pv_console_info(int i, Chardev *chr)
>  {
>  }
> diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
> index 0c24d4b191..60b971d0a8 100644
> --- a/accel/xen/xen-all.c
> +++ b/accel/xen/xen-all.c
> @@ -32,12 +32,7 @@
>      do { } while (0)
>  #endif
>=20
> -static bool xen_allowed;
> -
> -bool xen_enabled(void)
> -{
> -    return xen_allowed;
> -}
> +bool xen_allowed;
>=20
>  xc_interface *xen_xc;
>  xenforeignmemory_handle *xen_fmem;
> --
> 2.21.3



