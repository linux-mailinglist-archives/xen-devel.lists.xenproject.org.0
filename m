Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F476D737F
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 06:47:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518211.804494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjv2Z-0003xz-2K; Wed, 05 Apr 2023 04:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518211.804494; Wed, 05 Apr 2023 04:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjv2Y-0003vQ-Vp; Wed, 05 Apr 2023 04:46:34 +0000
Received: by outflank-mailman (input) for mailman id 518211;
 Wed, 05 Apr 2023 04:46:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WpID=74=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pjv2W-0003vK-SQ
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 04:46:33 +0000
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [2607:f8b0:4864:20::92f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d45cb58b-d36c-11ed-85db-49a42c6b2330;
 Wed, 05 Apr 2023 06:46:30 +0200 (CEST)
Received: by mail-ua1-x92f.google.com with SMTP id i22so24745423uat.8
 for <xen-devel@lists.xenproject.org>; Tue, 04 Apr 2023 21:46:29 -0700 (PDT)
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
X-Inumbo-ID: d45cb58b-d36c-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680669988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mHfEQJVJxa7vmszfTcCwqaAU9CfuBGkxiTaGBwcxQI=;
        b=pHPuOmM0hqQsCVM5oqdsVCnq3cSErus6CZp0nlP2tSmPudXWNmJYrcuslv5bpRnY1S
         ckmspC8qR/oeJoQJe1O3CwIlQXciszzKY25cTaftbrf+Syk988VYnWgIl6c4Trk8Aqlf
         +dE74/BHzzcT433EpKmBWnsex5YSQrAq/bgExJvfKEnAa2UmiRd4Qg3fguvVa9qlmzSM
         k1UArUywPOjKy5YM88rjCAPsMY+SuBa2dDUl4nodcv16OwVw6O+OWen4Ro/6jYxIzkft
         WndR0bqRj7ECxGx6lU7MWBa5mUKbn8IcKDJ/wvNlDJQoo2d/rbEHxiy0VrpYrrWsiCJh
         PlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680669988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1mHfEQJVJxa7vmszfTcCwqaAU9CfuBGkxiTaGBwcxQI=;
        b=VViNmlLci6wAIqJLohkMEOu87FeIp9qb1Tw3jYIb/zxJkb6Z3VTbICHABCNcAy/fEj
         nMJy46I8n/PW+Ghlk5Nt+yF+eICiM/iKPE9x3E8GfuNzNckqWIjckrkXLDqO/3T0zMxI
         dDjuP3++EXyMhXLsYHcFXPw1M02/4EqfD22LskYvZ9MHQQ83JVUmZ8N+sxunX2Q9wvD5
         kcVoHVI0Ixl0XNOhxo5ibFd2IXnDbC1gJ2wUqzofCddZqc985B0hMwYowYCOK0M8BuD7
         fEgxX7E2kXOkMXszY5KvBAWIc465rKCUCY00IJMrosAsKp/KtN4Z02JvUm3sTW6tmXkm
         nkiA==
X-Gm-Message-State: AAQBX9f+4QWdUaD6ebMjHX1ePeQQBEV+Fr2KK1gL6iG3HmEMyNhG4zf7
	NJkHwyEkhMQ94O+99EB7Mk37iCi9tRjht44iOo4=
X-Google-Smtp-Source: AKy350akIvZyr5+Ra8ZTKGtad0acZ4zqrDFkn2DwRV4Aaw/MuEbufeHM0ZDMDtFHbQ1E1lUoQ7I8bv21YCVj7QVKxkE=
X-Received: by 2002:a9f:37cd:0:b0:764:64c1:9142 with SMTP id
 q71-20020a9f37cd000000b0076464c19142mr1418967uaq.0.1680669988687; Tue, 04 Apr
 2023 21:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230324222451.3295023-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230324222451.3295023-1-andrew.cooper3@citrix.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 14:46:02 +1000
Message-ID: <CAKmqyKPDef0BdO0iK5Vx4-fycG3e7k0_oP_tFXDqRF5vUDXwDw@mail.gmail.com>
Subject: Re: [PATCH] ARM+RISC-V: BSS handling improvements
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 25, 2023 at 8:25=E2=80=AFAM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
>  * Correct comments in arm{32,64}/head.S
>  * Provide Linker assertions to check the safety of the zeroing loops
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Bob Eshleman <bobbyeshleman@gmail.com>
> CC: Alistair Francis <alistair.francis@wdc.com>
> CC: Connor Davis <connojdavis@gmail.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> Pulled out of the very start of my work to try and unify the handling of
> xen_phys_addr across architectures.
> ---
>  xen/arch/arm/arm32/head.S | 2 +-
>  xen/arch/arm/arm64/head.S | 2 +-
>  xen/arch/arm/xen.lds.S    | 2 ++
>  xen/arch/riscv/xen.lds.S  | 4 ++++
>  4 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index df51550baa8a..f9f7be9588b1 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -301,7 +301,7 @@ ENDPROC(check_cpu_mode)
>  zero_bss:
>          PRINT("- Zero BSS -\r\n")
>          mov_w r0, __bss_start        /* r0 :=3D vaddr(__bss_start) */
> -        mov_w r1, __bss_end          /* r1 :=3D vaddr(__bss_start) */
> +        mov_w r1, __bss_end          /* r1 :=3D vaddr(__bss_end)   */
>
>          mov   r2, #0
>  1:      str   r2, [r0], #4
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 4a3f87117c83..8a4dd64c99ad 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -437,7 +437,7 @@ zero_bss:
>
>          PRINT("- Zero BSS -\r\n")
>          ldr   x0, =3D__bss_start       /* x0 :=3D vaddr(__bss_start) */
> -        ldr   x1, =3D__bss_end         /* x1 :=3D vaddr(__bss_start) */
> +        ldr   x1, =3D__bss_end         /* x1 :=3D vaddr(__bss_end)   */
>
>  1:      str   xzr, [x0], #8
>          cmp   x0, x1
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index 1b392345bc3b..6ca3caefe607 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -240,3 +240,5 @@ ASSERT(_idmap_end - _idmap_start <=3D PAGE_SIZE, "Ide=
ntity mapped code is larger t
>   */
>  ASSERT(IS_ALIGNED(__init_begin,     4), "__init_begin is misaligned")
>  ASSERT(IS_ALIGNED(__init_end,       4), "__init_end is misaligned")
> +ASSERT(IS_ALIGNED(__bss_start,      POINTER_ALIGN), "__bss_start is misa=
ligned")
> +ASSERT(IS_ALIGNED(__bss_end,        POINTER_ALIGN), "__bss_end is misali=
gned")
> diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
> index ca57cce75cba..2ed70eccc62a 100644
> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -1,3 +1,4 @@
> +#include <xen/lib.h>
>  #include <xen/xen.lds.h>
>
>  #undef ENTRY
> @@ -156,3 +157,6 @@ SECTIONS
>
>      ELF_DETAILS_SECTIONS
>  }
> +
> +ASSERT(IS_ALIGNED(__bss_start,      POINTER_ALIGN), "__bss_start is misa=
ligned")
> +ASSERT(IS_ALIGNED(__bss_end,        POINTER_ALIGN), "__bss_end is misali=
gned")
> --
> 2.30.2
>
>

