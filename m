Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF1E68FC42
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 01:58:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492093.761502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPvG7-00088X-Ay; Thu, 09 Feb 2023 00:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492093.761502; Thu, 09 Feb 2023 00:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPvG7-000862-8I; Thu, 09 Feb 2023 00:57:55 +0000
Received: by outflank-mailman (input) for mailman id 492093;
 Thu, 09 Feb 2023 00:57:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UnIs=6F=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pPvG5-0007aN-Ma
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 00:57:53 +0000
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [2607:f8b0:4864:20::e29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c747e195-a814-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 01:57:52 +0100 (CET)
Received: by mail-vs1-xe29.google.com with SMTP id y8so569937vsq.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Feb 2023 16:57:52 -0800 (PST)
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
X-Inumbo-ID: c747e195-a814-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W/gygIBzeY+/Bn31eT4Up3+fgWIBvdQ6VPZ6/wo1O9w=;
        b=afCq2cQSmdJCiHa+vvT50HauHPEHVoR2+ifJvxgfcnRcBcxPkbXMQ405dvvkE0L9D0
         OA9/a9rq575u5VjXQ7eq+gQMZSxqoW+c4zLPPCqS7M8B7Ko2m9u0+7Q6T25O1QUEa5++
         T5G0cRyUwrYY2DlF5Adph8djeVmgZ2Z8nzixdghJ3tpE/147m4eJZItByhQBe66lfWhC
         ZkXvJr1pk27LwDBy5lyfvH21uv6Jv3iZzxVEIGPud6h/omEG+ZsPOEFgEaydUueLoB2G
         ZZlosxe3lSEXxMdiRiNmSTymSNgE7HTPxXHVXC7KZDb/vyL/vO2Z3wsGjy2a7yXXbO2t
         HagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/gygIBzeY+/Bn31eT4Up3+fgWIBvdQ6VPZ6/wo1O9w=;
        b=G+rWidm7a1C9CW0ar98PqCIfcT0edSium6V+NO+zsqyEZIYtW2SKdKiyc21cOXQNKd
         h8wBSFUJfXQg7YOOpSgELE/bJ+fpG4y/KX6qCh/QSgU8KUj/9elhYIUmuqmBGQrKEOOC
         SWQ8y9Wu3qvC9GdN3wbvFC4sxXiOVt0xuTeINesTqXMdFEl5nV0lsVa2eWMB5ZTS1pwA
         bas9R5+u5WbwGphe/bCUry47EvrwCKAhS0XOMuv9KyIk4DcVEJN1f/xAFuB9TBhAmtjM
         TQ4FE1R1Xegs9AhRo2VtYfH/6PvcfPmcyQH/Me+SZ8omDhhZZXr6R6W2JMttZyiunQZx
         5EXw==
X-Gm-Message-State: AO0yUKWM6ATF5sWHiuxfffs5gonZathvCth+70VcAaVsOU47Ujcytq1F
	F+VRs4qgrFRlEZRygLeKZGZkQfwdlul822Z5mtQ=
X-Google-Smtp-Source: AK7set/R5eS+UrVs3uDbV6ETd2cKP2RK5ZHS3nT7iIgPTs/QGGB6yDGspAceDaFLUae6DRxUo1EdY+7J7COv2bpf5Gw=
X-Received: by 2002:a67:c297:0:b0:3fe:5a64:f8ea with SMTP id
 k23-20020a67c297000000b003fe5a64f8eamr1954726vsj.54.1675904271066; Wed, 08
 Feb 2023 16:57:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675779308.git.oleksii.kurochko@gmail.com> <a3073af11e93a68a6c1767974140302ee6f5db42.1675779308.git.oleksii.kurochko@gmail.com>
In-Reply-To: <a3073af11e93a68a6c1767974140302ee6f5db42.1675779308.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Feb 2023 10:57:25 +1000
Message-ID: <CAKmqyKPf8PhFoGKtoA_XO4+_MS4Kk-Gg8MTmTHHz=hbVH=Ck6Q@mail.gmail.com>
Subject: Re: [PATCH v3 13/14] xen/riscv: test basic handling stuff
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 8, 2023 at 12:47 AM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changes in V3:
>   - Nothing changed
> ---
> Changes in V2:
>   - Nothing changed
> ---
>  xen/arch/riscv/setup.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index d502cf06b0..8d070244fd 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -9,12 +9,28 @@
>  unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
>      __aligned(STACK_SIZE);
>
> +static void test_run_in_exception(struct cpu_user_regs *regs)
> +{
> +    early_printk("If you see this message, ");
> +    early_printk("run_in_exception_handler is most likely working\n");
> +}
> +
> +static void test_macros_from_bug_h(void)
> +{
> +    run_in_exception_handler(test_run_in_exception);
> +    WARN();
> +    early_printk("If you see this message, ");
> +    early_printk("WARN is most likely working\n");
> +}
> +
>  void __init noreturn start_xen(void)
>  {
>      early_printk("Hello from C env\n");
>
>      trap_init();
>
> +    test_macros_from_bug_h();
> +
>      for ( ;; )
>          asm volatile ("wfi");
>
> --
> 2.39.0
>
>

