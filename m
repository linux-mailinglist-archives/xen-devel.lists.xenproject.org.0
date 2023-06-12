Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 772F672B730
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 07:10:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546822.853873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8ZoH-0006nA-Mn; Mon, 12 Jun 2023 05:09:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546822.853873; Mon, 12 Jun 2023 05:09:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8ZoH-0006kD-Jr; Mon, 12 Jun 2023 05:09:45 +0000
Received: by outflank-mailman (input) for mailman id 546822;
 Mon, 12 Jun 2023 05:09:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lerX=CA=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1q8ZoF-0006Go-Ng
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 05:09:43 +0000
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [2607:f8b0:4864:20::a2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 570f4991-08df-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 07:09:43 +0200 (CEST)
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-46288dcacb5so1152265e0c.3
 for <xen-devel@lists.xenproject.org>; Sun, 11 Jun 2023 22:09:43 -0700 (PDT)
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
X-Inumbo-ID: 570f4991-08df-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686546582; x=1689138582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3wBvLmfF0q6hDuJYQPi1PApNKVHc8G+vpArL126YKI=;
        b=QQzcKNzgynBJoW9HIlpzyfWYSLtMbm0EZ4S9Dbi9z8NeecuPV9qtySpnnSBT0pNWEY
         fMxn+B2iM5fprxPVFMf6hXDnj/amTPRKLKyuIy+mi+eEbbIULPyxYpvNvheutg732dXG
         dIQlc0JoHx/sycxPPuNkEUeNRweO91oO2WggNrKajFl/UFW/j3qMLiXKqwnU2ae79CTg
         VwTOr9Kk3kM503mRLYzsiyl1twh0ToI74lwtv/OQPcL59dBhwLDTRPJ1j8ZRIkWxcLUX
         KPBDckUVxI/7N4+a4WVpHMTl50emikiKk4LVJCvkDRr4ixDCzs/G8E/5gZfYc8Gcwx6p
         cM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686546582; x=1689138582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3wBvLmfF0q6hDuJYQPi1PApNKVHc8G+vpArL126YKI=;
        b=OXEILottPIlkZ6pJU+7Vpg5PzMyjnX6Dewnx3+niXtw1/ifcqUiBvKDi/PWHrbnJ+P
         pYTZgY40TzZgf+8c53ex3EKX6fmzp/p7C/5jBvESrul9GWVmElcpc0evdN6xEBPdwGLP
         fJWRXdNUBVwpflZgWQASfcJQD2ja2yAsNjS9HEmtu8DSqgo5D1AUOw4YGcl2JWv23CZ1
         V4IJ9CuA0yjp6BT2Qw0HuKIUVmJceuLH3ozirmSWo12fpRQbK6tLXsJpF6FoJ4vZTzoP
         eUdtyE5lHxkFiwq/iyMlLRK3ytqo5YPp9fqu1eyfswmFqkMNoPLEFWvbkMH3SeYO4ktb
         Pbzw==
X-Gm-Message-State: AC+VfDxCqExZQjejYHrRt+VbklQ+9loUWg2hrEdwgENkEfibe3RYrisR
	57ncZwUwBpnaDs9k+WTCHROvImqMXfh5kHmFos8=
X-Google-Smtp-Source: ACHHUZ7qmL7IKC0Yhg2xV/J4WBFw4eQee+yWxIaLMVRv8kwAZqsCCYaxPuCR1rSMFA4kATxeSGqnWxFBpRvahesZTDU=
X-Received: by 2002:a1f:5c43:0:b0:45f:ed55:4cca with SMTP id
 q64-20020a1f5c43000000b0045fed554ccamr3516696vkb.6.1686546582168; Sun, 11 Jun
 2023 22:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1686080337.git.oleksii.kurochko@gmail.com> <6a0f3171323f0092b8374f2244182c7e7ca850c0.1686080337.git.oleksii.kurochko@gmail.com>
In-Reply-To: <6a0f3171323f0092b8374f2244182c7e7ca850c0.1686080337.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jun 2023 15:09:16 +1000
Message-ID: <CAKmqyKNiw9641zs9-MBdUg48+izvCwqif=V=CvLCXn8jCLp_fw@mail.gmail.com>
Subject: Re: [PATCH v1 2/8] xen/riscv: add .sbss section to .bss
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 7, 2023 at 5:55=E2=80=AFAM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> Sometimes variables are located in .sbss section but it won't
> be mapped after MMU will be enabled.
> To avoid MMU failures .sbss should be mapped
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  xen/arch/riscv/xen.lds.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
> index 74afbaab9b..9a2799bab5 100644
> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -151,7 +151,7 @@ SECTIONS
>          *(.bss.percpu.read_mostly)
>          . =3D ALIGN(SMP_CACHE_BYTES);
>          __per_cpu_data_end =3D .;
> -        *(.bss .bss.*)
> +        *(.bss .bss.* .sbss)
>          . =3D ALIGN(POINTER_ALIGN);
>          __bss_end =3D .;
>      } :text
> --
> 2.40.1
>
>

