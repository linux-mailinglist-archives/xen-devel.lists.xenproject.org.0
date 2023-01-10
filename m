Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E09663637
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 01:29:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474180.735185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF2WP-0007Kp-7l; Tue, 10 Jan 2023 00:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474180.735185; Tue, 10 Jan 2023 00:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF2WP-0007I8-4R; Tue, 10 Jan 2023 00:29:45 +0000
Received: by outflank-mailman (input) for mailman id 474180;
 Tue, 10 Jan 2023 00:29:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Esb2=5H=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pF2WN-0007Ck-Ev
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 00:29:43 +0000
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [2607:f8b0:4864:20::e2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfdf769c-907d-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 01:29:42 +0100 (CET)
Received: by mail-vs1-xe2d.google.com with SMTP id n190so6749524vsc.11
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 16:29:42 -0800 (PST)
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
X-Inumbo-ID: dfdf769c-907d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eilaCtkBAmz2kS2wmB1ZZ+vUiTwTrEsVsNPmPjJb+lw=;
        b=m8mPtcFkKDEZ7LNPyapf1VWpZVk5ILpNQQiBFgHcppCOVBUiCHtIuTpyskfeEMhf8d
         SjpYD9G3pgHuU7WYAok7IOehwBtfN/rDv6rchYZP0rE3l8MSpiy720x9+eg5IboIITSa
         Vz6jVR+7RY99OHdFm1yPBLJrccsT4eJ6HK6jEcurYHKzwT0B+KvUrn2suCP7DtLxtAKR
         4S42L2m7A0rzmFusMNeG+l2Y9j9DtnM/VKsSE/11TXOzeKFrB2LXydssx4jHh0uPBRHr
         YGdnm1k+Sv06cJTB5uLAa94mHGG6Jjmpero/Xbplzfi6jbPFuj26PSCuugNUAxmcP3AJ
         Zt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eilaCtkBAmz2kS2wmB1ZZ+vUiTwTrEsVsNPmPjJb+lw=;
        b=rUWVhjJlZ27sKZDgNoivjA634vvI/dobpBU+2i5+UGPoi4FNIkh0jxGUeR8hmWlKfW
         gW1yHGNvf+VtPTKpd9PrncN07FZOe9/5/gvJQSroiubltd3fP2GTWC3d9jX3ia5zBUCX
         m2I9KbTFCopIbXqzRa1g7Oj3RM8BxQ1ki9fRFgjDUegoqXbwmOajG4t/K5cSXLuV0s5i
         e8OLi4hSZwVI72bt5AUHcbtIPX8Pcv6E++Oe59X2d+KxwSfs0FLwuS3Y15Bz93fYO1H3
         x/JR3dwkNTgvv1BFnHWcxWJMr82bOQy5Xb3tZ+okbPPv0lBt23VKIVv9gSnid/dDHQQI
         1D0g==
X-Gm-Message-State: AFqh2krF1kJyJVrKE+2OLl/7sjM0252BarTOSc1f8s9QKBzE2EUqLtq5
	gCdFnR2oSehRGBViVHhMs39kGPtzyFojDBEFBp4=
X-Google-Smtp-Source: AMrXdXuulYEaUvGd4+oZ43DaWUmRvtWUb4V7wXrDOlcrTLfH4+TtNKibAwr17T9JXLOZ+Dov/cGG6ZMFGDkH8V/Qs50=
X-Received: by 2002:a05:6102:f8c:b0:3c9:8cc2:dd04 with SMTP id
 e12-20020a0561020f8c00b003c98cc2dd04mr7246662vsv.73.1673310581572; Mon, 09
 Jan 2023 16:29:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1673278109.git.oleksii.kurochko@gmail.com> <837bb553a539713d4aa15bb169142018bf508afe.1673278109.git.oleksii.kurochko@gmail.com>
In-Reply-To: <837bb553a539713d4aa15bb169142018bf508afe.1673278109.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 10 Jan 2023 10:29:15 +1000
Message-ID: <CAKmqyKMafDNg0oJ-rn43goagy6sppvgjgeSts_oCTKhTUJMubw@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] xen/riscv: print hello message from C env
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 10, 2023 at 1:47 AM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  xen/arch/riscv/riscv64/head.S |  4 +---
>  xen/arch/riscv/setup.c        | 12 ++++++++++++
>  2 files changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
> index c1f33a1934..d444dd8aad 100644
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -5,6 +5,4 @@ ENTRY(start)
>          li      t0, STACK_SIZE
>          add     sp, sp, t0
>
> -_start_hang:
> -        wfi
> -        j       _start_hang
> +        tail    start_xen
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index 41ef4912bd..586060c7e5 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -1,6 +1,18 @@
>  #include <xen/init.h>
>  #include <xen/compile.h>
>
> +#include <asm/early_printk.h>
> +
>  /* Xen stack for bringing up the first CPU. */
>  unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
>      __aligned(STACK_SIZE);
> +
> +void __init noreturn start_xen(void)
> +{
> +    early_printk("Hello from C env\n");
> +
> +    for ( ;; )
> +        asm volatile ("wfi");
> +
> +    unreachable();
> +}
> --
> 2.38.1
>
>

