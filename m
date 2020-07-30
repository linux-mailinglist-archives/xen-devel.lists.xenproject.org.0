Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6569232D3C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 10:08:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k13bV-0006AM-Vs; Thu, 30 Jul 2020 08:07:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gz/s=BJ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k13bU-0006AH-Uq
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 08:07:53 +0000
X-Inumbo-ID: c35a98c2-d23b-11ea-8d1a-bc764e2007e4
Received: from mail-wm1-x32f.google.com (unknown [2a00:1450:4864:20::32f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c35a98c2-d23b-11ea-8d1a-bc764e2007e4;
 Thu, 30 Jul 2020 08:07:51 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id q76so4122711wme.4
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2020 01:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=djLqMmxDwR/RXrWm+o7+6bPfbtjq4nhOVRdani7IgtY=;
 b=bayaqW4vEnlo8RE0g507oIcfbLr+HepdiTbrh3dr8k5XN+Kkpyu7kAq5Iw7hlahCiK
 N2F02VRixxPXA/wpAnvK+QSW5X7C0wanr7x5JL7aKDgC7tGL+PGs4WEO90zwRThqA5jD
 uIfhQ4oCMwUFpEX3cVetk9qcDDbe8X6mPFCcSNoiy0ST2im6JdPLjH99ZGtqkqu7VU8z
 QvC6uxfv5nWWlutM3Nxe1bsaNCZLT8UyDhS9bXG31rLKy/WTnRkFfpHqzysT7Kcd9CrU
 /+yjUE35F4c9nwmVE39JpfMkLOJFuHrMX86RHIlUjXxNexF3IiKKVmeeIDheR2LRsP5R
 ZQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=djLqMmxDwR/RXrWm+o7+6bPfbtjq4nhOVRdani7IgtY=;
 b=Zhxz+RWeczQvRmKg20+Fxne1cJ8ObeCADaRBC37ufqDDGYLaMt0mVD2aSagQvFtUms
 EkoNfT1FjjNxBCMkvR51whCEORyTYnz9ZPE8XPi0ASg/h0buyzqRXVeFsGu81I0SHaCL
 fk1MJbKL3bTnziUHSmYVmCCiP7eLQurqHhEPIW+S/WLQTzIBAuXYqJdy2qZdu3PafoXZ
 v/8SiI9ardcKCTaaKdtGlAlIAaLaI+jdF8R4MfuGIRqbDUzhdTPATN2GT2Q9rPz2E2fL
 jmIcZYeFF/7R3ITyU2RdQGwm0gB553WGDHX3XB6fu4qmxosPu56ftoJYQpZz6OutMYns
 jaWg==
X-Gm-Message-State: AOAM532P3IilJ80wdbgnXqZUI1KSiFULaGC1jM4cbVl7pgRts2Efd5U8
 uc/JJGX3b5Dt/UBugQsQI+4=
X-Google-Smtp-Source: ABdhPJz/4FeUSr9s0fhPxd49EFFihOdxcEv79My23egivHLllJ3Rrv30e9ObXctY7n0ycetcMbyAaQ==
X-Received: by 2002:a05:600c:2209:: with SMTP id
 z9mr12012195wml.70.1596096470656; 
 Thu, 30 Jul 2020 01:07:50 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id k1sm8982272wrw.91.2020.07.30.01.07.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jul 2020 01:07:50 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-2-andrew.cooper3@citrix.com>
In-Reply-To: <20200728113712.22966-2-andrew.cooper3@citrix.com>
Subject: RE: [PATCH 1/5] xen/memory: Introduce CONFIG_ARCH_ACQUIRE_RESOURCE
Date: Thu, 30 Jul 2020 09:02:37 +0100
Message-ID: <002601d66647$ca8567e0$5f9037a0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQF6ExwjYkgZ+OK4ROtT1vtJIEnjiAIw/yGXqcbg+tA=
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 =?utf-8?Q?'Micha=C5=82_Leszczy=C5=84ski'?= <michal.leszczynski@cert.pl>,
 'Jan Beulich' <JBeulich@suse.com>,
 'Hubert Jasudowicz' <hubert.jasudowicz@cert.pl>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 28 July 2020 12:37
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Jan Beulich =
<JBeulich@suse.com>; Wei Liu <wl@xen.org>;
> Roger Pau Monn=C3=A9 <roger.pau@citrix.com>; Stefano Stabellini =
<sstabellini@kernel.org>; Julien Grall
> <julien@xen.org>; Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Paul =
Durrant <paul@xen.org>; Micha=C5=82
> Leszczy=C5=84ski <michal.leszczynski@cert.pl>; Hubert Jasudowicz =
<hubert.jasudowicz@cert.pl>
> Subject: [PATCH 1/5] xen/memory: Introduce =
CONFIG_ARCH_ACQUIRE_RESOURCE
>=20
> New architectures shouldn't be forced to implement no-op stubs for =
unused
> functionality.
>=20
> Introduce CONFIG_ARCH_ACQUIRE_RESOURCE which can be opted in to, and =
provide
> compatibility logic in xen/mm.h
>=20
> No functional change.

Code-wise, it looks fine, so...

Reviewed-by: Paul Durrant <paul@xen.org>

...but ...

>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Paul Durrant <paul@xen.org>
> CC: Micha=C5=82 Leszczy=C5=84ski <michal.leszczynski@cert.pl>
> CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
> ---
>  xen/arch/x86/Kconfig     | 1 +
>  xen/common/Kconfig       | 3 +++
>  xen/include/asm-arm/mm.h | 8 --------
>  xen/include/xen/mm.h     | 9 +++++++++
>  4 files changed, 13 insertions(+), 8 deletions(-)
>=20
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index a636a4bb1e..e7644a0a9d 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -6,6 +6,7 @@ config X86
>  	select ACPI
>  	select ACPI_LEGACY_TABLES_LOOKUP
>  	select ARCH_SUPPORTS_INT128
> +	select ARCH_ACQUIRE_RESOURCE

... I do wonder whether 'HAS_ACQUIRE_RESOURCE' is a better and more =
descriptive name.

>  	select COMPAT
>  	select CORE_PARKING
>  	select HAS_ALTERNATIVE
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 15e3b79ff5..593459ea6e 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -22,6 +22,9 @@ config GRANT_TABLE
>=20
>  	  If unsure, say Y.
>=20
> +config ARCH_ACQUIRE_RESOURCE
> +	bool
> +
>  config HAS_ALTERNATIVE
>  	bool
>=20
> diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
> index f8ba49b118..0b7de3102e 100644
> --- a/xen/include/asm-arm/mm.h
> +++ b/xen/include/asm-arm/mm.h
> @@ -358,14 +358,6 @@ static inline void put_page_and_type(struct =
page_info *page)
>=20
>  void clear_and_clean_page(struct page_info *page);
>=20
> -static inline
> -int arch_acquire_resource(struct domain *d, unsigned int type, =
unsigned int id,
> -                          unsigned long frame, unsigned int =
nr_frames,
> -                          xen_pfn_t mfn_list[])
> -{
> -    return -EOPNOTSUPP;
> -}
> -
>  unsigned int arch_get_dma_bitsize(void);
>=20
>  #endif /*  __ARCH_ARM_MM__ */
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index 1061765bcd..1b2c1f6b32 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -685,4 +685,13 @@ static inline void put_page_alloc_ref(struct =
page_info *page)
>      }
>  }
>=20
> +#ifndef CONFIG_ARCH_ACQUIRE_RESOURCE
> +static inline int arch_acquire_resource(
> +    struct domain *d, unsigned int type, unsigned int id, unsigned =
long frame,
> +    unsigned int nr_frames, xen_pfn_t mfn_list[])
> +{
> +    return -EOPNOTSUPP;
> +}
> +#endif /* !CONFIG_ARCH_ACQUIRE_RESOURCE */
> +
>  #endif /* __XEN_MM_H__ */
> --
> 2.11.0



