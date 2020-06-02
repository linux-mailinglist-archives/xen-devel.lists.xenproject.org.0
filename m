Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7468D1EB845
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 11:22:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg37B-0005WY-LK; Tue, 02 Jun 2020 09:21:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJcj=7P=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jg379-0005WT-Io
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 09:21:43 +0000
X-Inumbo-ID: 78a2c1d0-a4b2-11ea-81bc-bc764e2007e4
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78a2c1d0-a4b2-11ea-81bc-bc764e2007e4;
 Tue, 02 Jun 2020 09:21:42 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id l26so2169331wme.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 02:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=c6EcvBNdTMkEI0s+7ft7aSZ+qJqaRGOF9ngjNVb0KdE=;
 b=RK20Jdfk+zV6ObNkKkEO63thZSCN0TAcpbUtRqJGUDacKbe/+ecNqV9RQUVI6gthg1
 dkgfralWgK1xwQFg7xX29VE+08KfEFyD4RIHDACG+RQJnkIIFyV6T/WaA5Ma8Yaf8MdF
 5HxUXaKAQKqw21xYW/TldnxrIL8XawKIcS/bWoC+pLQKHsbLryNy88bp7gIinaQZIJlH
 N0gK+nhmiT/XiMZF60LxQ++1DsIxhlrRaVUmzlQB1utweibYXXX0QvPwGYgDbe5fWDSI
 cN+pn3zFX+mOfkscz5dqHtp0qjk4oPaK7E+8Xa3a/iRiV7obb0/3axyvDAyEvNuAgdgX
 mUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=c6EcvBNdTMkEI0s+7ft7aSZ+qJqaRGOF9ngjNVb0KdE=;
 b=Xi5SlBkFsu22yN5YbuHwemnV1jKxxS9nhnP0jzW8MtgVl4mKG3AOPZVJ1fdmYxBb9/
 T6tXfjEmsjPkeYmA+r7Lfi64Zz8IcBYUwFuu+KRjCRhSJDDYHgNVe6FxpGm5Q/v0CoxC
 xaXow5n43NZWihYIjUpHurIJnEgj85Mzjk/BPMd3jJ4wp4/N1G3I2+uAebFO6817WKFL
 5tcFfqTcbhj2k/oI9KDO3NNnRc+tLKQbmTQcLHQYHbJXvM0ulOQL+m8kiIM8jKSfpSUg
 ek3VKU9tBH3bcNRnQAtN1m+N8H53inapNemRYO9DwXZ8F/+T/h73qvQzzQEyVDK1WsYk
 k7vA==
X-Gm-Message-State: AOAM5304uwWXoc3V5bW6VdIvVbC/+1l2DKc1uAWXgIgZ/JVF1YI+v4L9
 LWbDuZ9daeTfdVr3XUBTCmc=
X-Google-Smtp-Source: ABdhPJy+cZqs+S7/mA+P71md4/F1u+nFxcQJXOk/ZB/EQzUfAS/99KrYUT4lAxt3HxigFAgeOE/TZA==
X-Received: by 2002:a1c:22c1:: with SMTP id i184mr3153312wmi.187.1591089702021; 
 Tue, 02 Jun 2020 02:21:42 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id o15sm2710585wmm.31.2020.06.02.02.21.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jun 2020 02:21:41 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Roger Pau Monne'" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20200602090536.38064-1-roger.pau@citrix.com>
In-Reply-To: <20200602090536.38064-1-roger.pau@citrix.com>
Subject: RE: [PATCH for-4.14] x86/cpu: fix build with clang 3.5
Date: Tue, 2 Jun 2020 10:21:40 +0100
Message-ID: <003801d638bf$39e50e30$adaf2a90$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJon9qKp2HjrlA96kxsuOa/M+4KF6egPp8A
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
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Roger Pau Monne <roger.pau@citrix.com>
> Sent: 02 June 2020 10:06
> To: xen-devel@lists.xenproject.org
> Cc: paul@xen.org; Roger Pau Monne <roger.pau@citrix.com>; Jan Beulich =
<jbeulich@suse.com>; Andrew
> Cooper <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>
> Subject: [PATCH for-4.14] x86/cpu: fix build with clang 3.5
>=20
> Clang 3.5 complains with:
>=20
> common.c:794:24: error: statement expression not allowed at file scope
>                       i < ARRAY_SIZE(this_cpu(tss_page).ist_ssp); ++i =
)
>                                      ^
> /build/xen/include/asm/percpu.h:14:7: note: expanded from macro =
'this_cpu'
>     (*RELOC_HIDE(&per_cpu__##var, get_cpu_info()->per_cpu_offset))
>       ^
> /build/xen/include/xen/compiler.h:104:3: note: expanded from macro =
'RELOC_HIDE'
>   ({ unsigned long __ptr;                       \
>   ^
> /build/xen/include/xen/lib.h:68:69: note: expanded from macro =
'ARRAY_SIZE'
> #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]) + =
__must_be_array(x))
>                                                                     ^
> /build/xen/include/xen/compiler.h:85:57: note: expanded from macro =
'__must_be_array'
>   BUILD_BUG_ON_ZERO(__builtin_types_compatible_p(typeof(a), =
typeof(&a[0])))
>                                                         ^
> /build/xen/include/xen/lib.h:39:57: note: expanded from macro =
'BUILD_BUG_ON_ZERO'
> #define BUILD_BUG_ON_ZERO(cond) sizeof(struct { int:-!!(cond); })
>                                                         ^
>=20
> Workaround this by defining the tss_page as a local variable. Adjust
> other users of the per-cpu tss_page to also use the newly introduced
> local variable.
>=20
> No functional change expected.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Release-acked-by: Paul Durrant <paul@xen.org>

> ---
>  xen/arch/x86/cpu/common.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
> index 58f0876180..da74172776 100644
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -738,9 +738,14 @@ void load_system_tables(void)
>  	unsigned int i, cpu =3D smp_processor_id();
>  	unsigned long stack_bottom =3D get_stack_bottom(),
>  		stack_top =3D stack_bottom & ~(STACK_SIZE - 1);
> +	/*
> +	 * NB: define tss_page as a local variable because clang 3.5 doesn't
> +	 * support using ARRAY_SIZE against per-cpu variables.
> +	 */
> +	struct tss_page *tss_page =3D &this_cpu(tss_page);
>=20
>  	/* The TSS may be live.	 Disuade any clever optimisations. */
> -	volatile struct tss64 *tss =3D &this_cpu(tss_page).tss;
> +	volatile struct tss64 *tss =3D &tss_page->tss;
>  	seg_desc_t *gdt =3D
>  		this_cpu(gdt) - FIRST_RESERVED_GDT_ENTRY;
>=20
> @@ -783,15 +788,14 @@ void load_system_tables(void)
>  	 * volatile qualifier.
>  	 */
>  	if (cpu_has_xen_shstk) {
> -		volatile uint64_t *ist_ssp =3D this_cpu(tss_page).ist_ssp;
> +		volatile uint64_t *ist_ssp =3D tss_page->ist_ssp;
>=20
>  		ist_ssp[0] =3D 0x8600111111111111ul;
>  		ist_ssp[IST_MCE] =3D stack_top + (IST_MCE * IST_SHSTK_SIZE) - 8;
>  		ist_ssp[IST_NMI] =3D stack_top + (IST_NMI * IST_SHSTK_SIZE) - 8;
>  		ist_ssp[IST_DB]	 =3D stack_top + (IST_DB	* IST_SHSTK_SIZE) - 8;
>  		ist_ssp[IST_DF]	 =3D stack_top + (IST_DF	* IST_SHSTK_SIZE) - 8;
> -		for ( i =3D IST_DF + 1;
> -		      i < ARRAY_SIZE(this_cpu(tss_page).ist_ssp); ++i )
> +		for ( i =3D IST_DF + 1; i < ARRAY_SIZE(tss_page->ist_ssp); ++i )
>  			ist_ssp[i] =3D 0x8600111111111111ul;
>=20
>  		wrmsrl(MSR_INTERRUPT_SSP_TABLE, (unsigned long)ist_ssp);
> --
> 2.26.2



