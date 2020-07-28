Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A032308DE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 13:38:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0Nvt-0006Qu-1y; Tue, 28 Jul 2020 11:38:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fsnm=BH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k0Nvr-0006QY-Vg
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 11:38:08 +0000
X-Inumbo-ID: ce06d022-d0c6-11ea-8b28-bc764e2007e4
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce06d022-d0c6-11ea-8b28-bc764e2007e4;
 Tue, 28 Jul 2020 11:38:07 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id t142so11486410wmt.4
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2020 04:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=GtCXrUyMcdfUK9u5L9780Nv/+GQh+rPlWS9tXEVEQ1E=;
 b=tM7aGjd0FQT3yaT7+031Tlnysibz7ocdgILc/qNcllesimpWOyi1Ny6a4L/hDJnr6K
 llwf0E9RA0hHT4WNR/XM88aVBh5S1/P8YX2Sm4gohXauAAR5fNremiNKDoN9a0RLMGvb
 hqMDnJaxM8MJ5kjXyaNPVZOZKVUJ2uNSPyGLUQBEVKBKzR14DtyKpOCWkEwOl9MtCmg6
 W6Hn/X7KlpZdQCj+hnM4LkQQkibiFPMM5SfTvW/u06BBR9GmLXgS+vWlr2M3o8dOMG3J
 30QOlaozpUpSqkYfZPsl7FiCN+4XiPh+pyBGxt9h/DC5penPyMY0RFiii1wAn3eGREBX
 zXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=GtCXrUyMcdfUK9u5L9780Nv/+GQh+rPlWS9tXEVEQ1E=;
 b=ky9wPg1pomZsADw07RhTwz8ZI9dvyew+HerZgd9aHB7rfnob3a9ApUelfgHOHvFkpl
 ejgLNZcAUrRuPaXzcMNBAhXjEe6q2jAHW3tCUGCyyk2pjtw+px3O0HS3j3pct90e4r17
 KU6QDzukmk8csinBwoiy0Y5CPcN0KJkPqqdI4bIUlUFzX/P0vcBR8pFj1MLugU0yTpPf
 7oGxfxbstz003hZJTeOBo6AyG58rVOL1+sZbuH13vgx5iTXGwJ0x1OJhXqo5lScAaIyn
 drc44epexao8pRarrgyaKZrxD50mI4vluQU5pdCV1PxiU8CKgyjC5jyel6udB3SZKt8q
 rksg==
X-Gm-Message-State: AOAM5304B5vPSV7UH3Mz/zAPNMrVPBlhnaU/MfuGSt68wyKaaDJVb3Dq
 mUfFsT7rxJ3CxxH2n80Nt0Y=
X-Google-Smtp-Source: ABdhPJz/rLdReHCjDfI4CPt0oZx4S9Edc53mF4qYVIcJnJHvTAYUGj9wZfJjhvhtT6hUxywQ/eS0bw==
X-Received: by 2002:a1c:a9c6:: with SMTP id s189mr3429083wme.166.1595936285688; 
 Tue, 28 Jul 2020 04:38:05 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-143-223-30.range86-143.btcentralplus.com.
 [86.143.223.30])
 by smtp.gmail.com with ESMTPSA id x11sm3521703wmc.33.2020.07.28.04.38.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Jul 2020 04:38:05 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20200728100925.10454-1-philmd@redhat.com>
In-Reply-To: <20200728100925.10454-1-philmd@redhat.com>
Subject: RE: [PATCH-for-5.1] accel/xen: Fix xen_enabled() behavior on
 target-agnostic objects
Date: Tue, 28 Jul 2020 12:37:42 +0100
Message-ID: <000501d664d3$8e72bed0$ab583c70$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQENRsOLIapjYfI4XdI3JVM2u0h2V6qvGVsw
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
 'Paul Durrant' <pdurrant@amazon.com>, xen-devel@lists.xenproject.org,
 'Anthony Perard' <anthony.perard@citrix.com>,
 'Paolo Bonzini' <pbonzini@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Sent: 28 July 2020 11:09
> To: qemu-devel@nongnu.org
> Cc: Paul Durrant <paul@xen.org>; Paolo Bonzini <pbonzini@redhat.com>; =
xen-devel@lists.xenproject.org;
> Stefano Stabellini <sstabellini@kernel.org>; Anthony Perard =
<anthony.perard@citrix.com>; Philippe
> Mathieu-Daud=C3=A9 <philmd@redhat.com>; Paul Durrant =
<pdurrant@amazon.com>; Peter Maydell
> <peter.maydell@linaro.org>
> Subject: [PATCH-for-5.1] accel/xen: Fix xen_enabled() behavior on =
target-agnostic objects
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

Tested-by: Paul Durrant <paul@xen.org>

> ---
>  include/sysemu/xen.h | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
> index 1ca292715e..385a1fa2bf 100644
> --- a/include/sysemu/xen.h
> +++ b/include/sysemu/xen.h
> @@ -8,7 +8,15 @@
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
> +
> +#ifdef CONFIG_XEN_IS_POSSIBLE
>=20
>  bool xen_enabled(void);
>=20
> @@ -18,7 +26,7 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t =
size,
>                     struct MemoryRegion *mr, Error **errp);
>  #endif
>=20
> -#else /* !CONFIG_XEN */
> +#else /* !CONFIG_XEN_IS_POSSIBLE */
>=20
>  #define xen_enabled() 0
>  #ifndef CONFIG_USER_ONLY
> @@ -33,6 +41,6 @@ static inline void xen_ram_alloc(ram_addr_t =
ram_addr, ram_addr_t size,
>  }
>  #endif
>=20
> -#endif /* CONFIG_XEN */
> +#endif /* CONFIG_XEN_IS_POSSIBLE */
>=20
>  #endif
> --
> 2.21.3



