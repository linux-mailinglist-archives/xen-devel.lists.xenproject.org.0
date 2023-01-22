Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E596A67737F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 00:40:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482583.748171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJjwL-0002hI-MB; Sun, 22 Jan 2023 23:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482583.748171; Sun, 22 Jan 2023 23:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJjwL-0002eu-IS; Sun, 22 Jan 2023 23:39:57 +0000
Received: by outflank-mailman (input) for mailman id 482583;
 Sun, 22 Jan 2023 23:39:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zCZZ=5T=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pJjwK-0002bM-No
 for xen-devel@lists.xenproject.org; Sun, 22 Jan 2023 23:39:56 +0000
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [2607:f8b0:4864:20::e29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12ff10b7-9aae-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 00:39:55 +0100 (CET)
Received: by mail-vs1-xe29.google.com with SMTP id 3so11207273vsq.7
 for <xen-devel@lists.xenproject.org>; Sun, 22 Jan 2023 15:39:55 -0800 (PST)
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
X-Inumbo-ID: 12ff10b7-9aae-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RrJxyIdy8E/D+xdXhTJ6aTZ6a+zBBaY8zNu/H+dVl1U=;
        b=DjJoXfNInkFEp9AU60cxQvh2JQrYn0isdSP4tVoduMh2BUza2TMp/NBhsvFkkBM7l3
         aNmcukBKT0chYErJU/WIZGddzg87Mupb4Rz5az/7iChDV0vu8C+j6wR65zPAB7R96wPP
         EG4deprNmEztPsqib1e/UCdoZIzJgSYfnBMHzGzieWA9K16snULoaYblfHLz2QDghi/d
         niv7CayXNSQvICND0gaQhZALoqV2kEhBgzoIhq4fV714OgjE+LD20H2v+5kjHCajB3pC
         Qbw/2RfcpM4e8chzpiSEP9hugffv1bXKqVqDovr6oBwaltpMWWkl6IhAN7GMn/odfm6b
         L3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RrJxyIdy8E/D+xdXhTJ6aTZ6a+zBBaY8zNu/H+dVl1U=;
        b=Pm2Hs+r8GvoL/lPMQTTpC5U26gyDNOcchkupY8T4j32cynkjb0EloyjT1WU/paDGKM
         d7Fll2cR6gXu6u9TFCrP8nKT+cC+6XWe55bGgn8/FGihGzHbNhFxAvlg7txoDy+VQnyK
         PaQUpWrGSsOJYFzdL6qEF2++Wm6rpme9TTHmqfOeernABV6t3rhh+fmriJ7UvUVdrLsZ
         G4Sm8fynJayxJvlzCLYOMPwCm0dIXjY9y/1YBXY5PgoOMPWClzjuMeuD1SPJDjxH63GJ
         hzzGx624q1Vx3at0em8nBBgbkn502UwXE3/53IPfKqEXIC6Vv4Kk6NlG1AA12qCci8Yw
         zVVA==
X-Gm-Message-State: AFqh2ko2qVk4NYysos201VpGbhP9X7Rl089Qr5+iiHU7rdXBGLUcdQxt
	S9dqJGi+dNh/sE2ER6NI9ZMdhpcZJLO25zNWMmU=
X-Google-Smtp-Source: AMrXdXv+jqrCspiXw0fAxxHEwFCQVciXJ5J+bPSHUXaJBmW0q2PoUhbhMqy26DBiiiJy95yxsXtyOBSdTkx79mq0OrY=
X-Received: by 2002:a05:6102:f98:b0:3d3:c7d9:7b62 with SMTP id
 e24-20020a0561020f9800b003d3c7d97b62mr2711641vsv.72.1674430794833; Sun, 22
 Jan 2023 15:39:54 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674226563.git.oleksii.kurochko@gmail.com> <74ca10d9be1dfc3aed4b3b21a79eae88c9df26a4.1674226563.git.oleksii.kurochko@gmail.com>
In-Reply-To: <74ca10d9be1dfc3aed4b3b21a79eae88c9df26a4.1674226563.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Jan 2023 09:39:28 +1000
Message-ID: <CAKmqyKNtFGoXmF1SJWO+JBJQvPSyDYEfpaYn2YBMQ=BsCk6VPQ@mail.gmail.com>
Subject: Re: [PATCH v1 09/14] xen/riscv: introduce do_unexpected_trap()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 21, 2023 at 1:00 AM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> The patch introduces the function the purpose of which is to print
> a cause of an exception and call "wfi" instruction.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/riscv/traps.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
> index dd64f053a5..fc25138a4b 100644
> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -95,7 +95,19 @@ const char *decode_cause(unsigned long cause)
>      return decode_trap_cause(cause);
>  }
>
> -void __handle_exception(struct cpu_user_regs *cpu_regs)
> +static void do_unexpected_trap(const struct cpu_user_regs *regs)
>  {
> +    unsigned long cause = csr_read(CSR_SCAUSE);
> +
> +    early_printk("Unhandled exception: ");
> +    early_printk(decode_cause(cause));
> +    early_printk("\n");
> +
> +    // kind of die...
>      wait_for_interrupt();

We could put this in a loop, to ensure we never progress

Alistair

>  }
> +
> +void __handle_exception(struct cpu_user_regs *cpu_regs)
> +{
> +    do_unexpected_trap(cpu_regs);
> +}
> --
> 2.39.0
>
>

