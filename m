Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E71E677387
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 00:42:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482597.748190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJjyW-0004hF-CN; Sun, 22 Jan 2023 23:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482597.748190; Sun, 22 Jan 2023 23:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJjyW-0004eU-9c; Sun, 22 Jan 2023 23:42:12 +0000
Received: by outflank-mailman (input) for mailman id 482597;
 Sun, 22 Jan 2023 23:42:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zCZZ=5T=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pJjyU-0004eK-Bz
 for xen-devel@lists.xenproject.org; Sun, 22 Jan 2023 23:42:10 +0000
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [2607:f8b0:4864:20::e33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61f9df86-9aae-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 00:42:08 +0100 (CET)
Received: by mail-vs1-xe33.google.com with SMTP id d66so11208012vsd.9
 for <xen-devel@lists.xenproject.org>; Sun, 22 Jan 2023 15:42:08 -0800 (PST)
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
X-Inumbo-ID: 61f9df86-9aae-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wxnhviJXorDIRt5Tvphi2/dT3epwMfuEG68rwr+fGb0=;
        b=bTvzNuSmySDMktGnvytnSz+Q5tVq36rJklCDae8f5toHPvC3ubik8zDR9suP2zZ0Qd
         7XFHiF8yS+INbPxihBMADL56dXUy9YlYbT5jGWrlga7zgQQvWD38D7jL1sdZth9culkw
         Gh80QAuvvYi/w4ph1afh04v6Fk4icUo41+hiADnvEfkfVQbtQT1im7omhGqUtMP7Agoc
         0foZzC8Ze2UztczXmAdVIqqUcnIdTVgPnKDh94Ctq+/0dUKTG8AMdPovwgRrBCHg9ckK
         dV035oAUGHh+rFcQPcn3zz8RhIJ0+D4Sy/NeDaYB0D7SzJWQ9INIR2ByW0X7c+X5mY0t
         OSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wxnhviJXorDIRt5Tvphi2/dT3epwMfuEG68rwr+fGb0=;
        b=NwCpqLVKZPL8PycxIdFdeQdOOVWs+yC/2zSCfce3Aef1YgXtcD8gufafsI6WRLQrwb
         +NVDALYKREQl+O68PMTOLD8KGiQUvoACr6oLXrCkDYyAy4rbHxeuOzxVNj9FC4lIf8+t
         f12M3EjjFzNDtPXezafUhgj8X4nuhoj832Mpk38ywQWACGgHLvQNu31wb1vqvA2oMxUG
         ItowHNXsbF5TfKIN6ZESDFfwXtD0f1GEAd4s/8n9CefQz8eE5QCkBYPgxXTLeDXB1wFU
         0MRRaFl1Fj7D1jA3KGKqD8dSgYcq3nuaOiL6UutjdDbYeJKHcSg9f1InwqYzsnU3ujo4
         RExw==
X-Gm-Message-State: AFqh2kqR9ylURLWdDmLZ+EuwG1Teoe29pcwV7gvuCx5SFG7KL4F5Ea6N
	KxSxacCIWt8GXJmBeu0QIqLbEaWxkW5AkisDQihxauY/kpI=
X-Google-Smtp-Source: AMrXdXslDv4Snv+jtInDKOJQ1jaeIEb0uhiVcfYMa/+kcTwocpxmNMbjwuAzcUoBBCr1nK/36H/ofk2fR18KJj5x0x4=
X-Received: by 2002:a67:eb10:0:b0:3c9:8cc2:dd04 with SMTP id
 a16-20020a67eb10000000b003c98cc2dd04mr3180290vso.73.1674430927332; Sun, 22
 Jan 2023 15:42:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674226563.git.oleksii.kurochko@gmail.com> <b8d03f33aea498bb5fde4ccdc16f023bbe208e7f.1674226563.git.oleksii.kurochko@gmail.com>
In-Reply-To: <b8d03f33aea498bb5fde4ccdc16f023bbe208e7f.1674226563.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Jan 2023 09:41:41 +1000
Message-ID: <CAKmqyKNGEfzOnAfKNePro5MDG3i6x7ycNvE+DT-rUzEfXk+KdA@mail.gmail.com>
Subject: Re: [PATCH v1 11/14] xen/riscv: introduce setup_trap_handler()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 21, 2023 at 1:00 AM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  xen/arch/riscv/setup.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index d09ffe1454..174e134c93 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -1,16 +1,27 @@
>  #include <xen/compile.h>
>  #include <xen/init.h>
>
> +#include <asm/csr.h>
>  #include <asm/early_printk.h>
> +#include <asm/traps.h>
>
>  /* Xen stack for bringing up the first CPU. */
>  unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
>      __aligned(STACK_SIZE);
>
> +static void setup_trap_handler(void)
> +{
> +    unsigned long addr = (unsigned long)&handle_exception;
> +    csr_write(CSR_STVEC, addr);
> +}
> +
>  void __init noreturn start_xen(void)
>  {
>      early_printk("Hello from C env\n");
>
> +    setup_trap_handler();
> +    early_printk("exception handler has been setup\n");
> +
>      for ( ;; )
>          asm volatile ("wfi");
>
> --
> 2.39.0
>
>

