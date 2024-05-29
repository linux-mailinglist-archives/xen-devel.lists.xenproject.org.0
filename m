Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 314058D2E42
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 09:31:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731540.1137111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDls-0001Pf-El; Wed, 29 May 2024 07:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731540.1137111; Wed, 29 May 2024 07:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDls-0001MT-Bm; Wed, 29 May 2024 07:30:52 +0000
Received: by outflank-mailman (input) for mailman id 731540;
 Wed, 29 May 2024 07:30:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DI5e=NA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sCDlr-0001LE-4Z
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 07:30:51 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dad0872-1d8d-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 09:30:47 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a5cec2c2981so80187566b.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 00:30:48 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57862f76dfdsm6624995a12.21.2024.05.29.00.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 00:30:47 -0700 (PDT)
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
X-Inumbo-ID: 5dad0872-1d8d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716967848; x=1717572648; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lMbV4F+yaD2jh4OuPFYX3Dr/e6XNzX4eo758/WuM2j4=;
        b=AQAeRIqjUeFjCCG2xBJ5VkEjYBBIqUfPr2BAq2caL0Ml14ABBKdeVAvXmdMK83rURc
         0vCRNm+JNwag6xsWt4Vlvpllxx2kK6/EYgwwGn1cxLhD3xPP26wTyNCrOTxWg3s6lf9s
         Dah22ZiHSBWtW/t/Ird2TMJEpO2DxD0ZXHnkRthkR9WrF0G9eWfCzQa5wxOWGHmchGWX
         TzdKDlgYF1ynmJ+b8c5GFpC5RclC54zSkY664zM3MFuD8MjOUYLZ/v+ljGrrARlRTYI+
         THQEnJABUqMfNEyxFQpwiLl6rJN6iY0IMBbsmUsz448lLbW8gnTQcYNB7RGExod/TqDl
         8BYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716967848; x=1717572648;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lMbV4F+yaD2jh4OuPFYX3Dr/e6XNzX4eo758/WuM2j4=;
        b=ooLocKVnbF8qXMB2102jamURNJ1wXkw1pUugI2/Yi4g+chWV2tw/I/2gpJy5tVwdqs
         WFEAQvRwyv4oZyUjnUWZSMr/Kuc72b/E2+hfAK6P+QiJRnUwoMrj/v34x0Vb+McmK2IH
         waBQcjVvPP7ALbNjjdKezkkZjiNIRIT7/3h41Tu1hOis2oo6Phl/dQTslAkgl2MuIywr
         FY2GoP2+/0jtJGo2SoL2yOqe9907CvMkPOZVkpCMMxUg117k0OCWYvHbuuWzRgn6czrX
         NQ09kBdAKuZ1qSM44QZnXq1JInAMUCDoeSJ1SW5v5NRnpMFe87/1QPg84i/zh1iprY4w
         ajQg==
X-Forwarded-Encrypted: i=1; AJvYcCVqooQDLPhMvQI5uRLnXZHWKrYOGbhsEmVm1t0UWdWqLrwT3BFKt4tJE4VQ7eV1nAANN5i0psqpjJZEyiwvjpjnL+fFtOQcls8wmCkFNVA=
X-Gm-Message-State: AOJu0YzanNB9V06WPWHxKvPq+NM+CNCfQRzkcJ4VP+icZMaIr5NXMv2f
	YaOTveC1DNN+gCCjqmGiXp5jdleyaOYhngzB0XIZfsTzRafZqeyq
X-Google-Smtp-Source: AGHT+IFHJTNxjC2De6aMZ5GYZZyz8tJ2WSpMlTQWFt9TPX6hbS7WBbMgkt3rHGNaYzAfla/LmQZGiQ==
X-Received: by 2002:a50:85ca:0:b0:574:eb0f:df9b with SMTP id 4fb4d7f45d1cf-5785195096dmr12414152a12.14.1716967847905;
        Wed, 29 May 2024 00:30:47 -0700 (PDT)
Message-ID: <be825b761563b0f427c9c7167e13ce0195e8fb3c.camel@gmail.com>
Subject: Re: [PATCH v2 for-4.19 0.5/13] xen: Introduce CONFIG_SELF_TESTS
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
 Michal Orzel <michal.orzel@amd.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>, "consulting @ bugseng . com"
 <consulting@bugseng.com>, Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>, Nicola Vetrini
 <nicola.vetrini@bugseng.com>
Date: Wed, 29 May 2024 09:30:46 +0200
In-Reply-To: <20240528142238.1340228-1-andrew.cooper3@citrix.com>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
	 <20240528142238.1340228-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Tue, 2024-05-28 at 15:22 +0100, Andrew Cooper wrote:
> ... and move x86's stub_selftest() under this new option.
>=20
> There is value in having these tests included in release builds too.
>=20
> It will shortly be used to gate the bitops unit tests on all
> architectures.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Looks good to me.
We can consider it to be merged to 4.19:
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> CC: consulting@bugseng.com=C2=A0<consulting@bugseng.com>
> CC: Simone Ballarin <simone.ballarin@bugseng.com>
> CC: Federico Serafini <federico.serafini@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
>=20
> v2.5:
> =C2=A0* As suggested in "[PATCH v2 05/13] xen/bitops: Implement
> generic_f?sl() in
> =C2=A0lib/"
>=20
> I've gone with SELF_TESTS rather than BOOT_TESTS, because already in
> bitops
> we've got compile time tests (which aren't strictly boot time), and
> the
> livepatching testing wants to be included here and is definitely not
> boot
> time.
> ---
> =C2=A0xen/Kconfig.debug=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6 ++++++
> =C2=A0xen/arch/x86/extable.c | 4 ++--
> =C2=A0xen/arch/x86/setup.c=C2=A0=C2=A0 | 2 +-
> =C2=A03 files changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> index 61b24ac552cd..07ff7eb7ba83 100644
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -29,6 +29,12 @@ config FRAME_POINTER
> =C2=A0	=C2=A0 maybe slower, but it gives very useful debugging
> information
> =C2=A0	=C2=A0 in case of any Xen bugs.
> =C2=A0
> +config SELF_TESTS
> +	bool "Extra self-testing"
> +	default DEBUG
> +	help
> +	=C2=A0 Enable extra unit and functional testing.
> +
> =C2=A0config COVERAGE
> =C2=A0	bool "Code coverage support"
> =C2=A0	depends on !LIVEPATCH
> diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
> index 8415cd1fa249..705cf9eb94ca 100644
> --- a/xen/arch/x86/extable.c
> +++ b/xen/arch/x86/extable.c
> @@ -144,7 +144,7 @@ search_exception_table(const struct cpu_user_regs
> *regs, unsigned long *stub_ra)
> =C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> =C2=A0}
> =C2=A0
> -#ifdef CONFIG_DEBUG
> +#ifdef CONFIG_SELF_TESTS
> =C2=A0#include <asm/setup.h>
> =C2=A0#include <asm/traps.h>
> =C2=A0
> @@ -214,7 +214,7 @@ int __init cf_check stub_selftest(void)
> =C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> =C2=A0}
> =C2=A0__initcall(stub_selftest);
> -#endif
> +#endif /* CONFIG_SELF_TESTS */
> =C2=A0
> =C2=A0unsigned long asmlinkage search_pre_exception_table(struct
> cpu_user_regs *regs)
> =C2=A0{
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index b50c9c84af6d..dd51e68dbe5b 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -742,7 +742,7 @@ static void noreturn init_done(void)
> =C2=A0=C2=A0=C2=A0=C2=A0 system_state =3D SYS_STATE_active;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 /* Re-run stub recovery self-tests with CET-SS a=
ctive. */
> -=C2=A0=C2=A0=C2=A0 if ( IS_ENABLED(CONFIG_DEBUG) && cpu_has_xen_shstk )
> +=C2=A0=C2=A0=C2=A0 if ( IS_ENABLED(CONFIG_SELF_TESTS) && cpu_has_xen_shs=
tk )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stub_selftest();
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 domain_unpause_by_systemcontroller(dom0);
>=20
> base-commit: 2d93f78bfe25f695d8ffb61d110da9df293ed71b


