Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EF4739559
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 04:14:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553240.863693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC9px-0001Um-K1; Thu, 22 Jun 2023 02:14:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553240.863693; Thu, 22 Jun 2023 02:14:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC9px-0001Sv-Gm; Thu, 22 Jun 2023 02:14:17 +0000
Received: by outflank-mailman (input) for mailman id 553240;
 Thu, 22 Jun 2023 02:14:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kw6x=CK=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1qC9pv-00014o-Pl
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 02:14:15 +0000
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com
 [2607:f8b0:4864:20::a2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b4d3305-10a2-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 04:14:14 +0200 (CEST)
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-47151ee3fe6so2138844e0c.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 19:14:14 -0700 (PDT)
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
X-Inumbo-ID: 7b4d3305-10a2-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687400053; x=1689992053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQMWQNruHZAOUS8HEG8TP+HDVfZ40G77B4tmeF/8WsQ=;
        b=aCPJ+QkB8iWvp92zHiEbi/SQvGLkc2txFujLe1VMY7EEjd3WNivFgTrYYoeM0xloPl
         6thKqTFqjOcBvyzLuyKoxFyEvKZMMRtpPnAp8sp4RzCVbFX/OW1ER+MjSrSubK+U41Ib
         TqdZ5Npwpj2Y7DEfhS9UmKPRrWYdQrldvYkirUZMzIce7/yA/3FtD7Gx5BtpJY6yQmkb
         Nr/3V8JRLkkGKloCE1prMpV/kfWRXU9aws06OU/Djwd0lXdqnKhYjkr8lNvrBdmzYlu5
         L4DHN9t03Du8JyooTrFLaeMElUHBJoEm2lZOXkoQzih3/ajG/zPosV7su+KBZ9DrW1W9
         mbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687400053; x=1689992053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQMWQNruHZAOUS8HEG8TP+HDVfZ40G77B4tmeF/8WsQ=;
        b=c41/ndFaJQd4UbnE2/t0QrJbJqMT6e/fT1TBDbAnDpV//NerelhWbEZyLZSpm4K/iu
         s7Rr+6JuNWRRZAI4B0l3ZntFnVrky5gVSMpgwEoONOe2cT5m0lyieCSQd7dZeaDlVpVU
         ZsrOZzZ96tOVf5Beo46NmYi7oLmf+2ybhZqLji5QA+DhrGSmiDGOobCDKjHR979otrSh
         Q9pmVcMNtFstecwCWEGdd0rmnMDKetlO7nDgpVu/AQJo8wy7CWX7JMfOYwLtEZ96npVy
         L+8LiunMj2RAgXBNr/i4WS4zszkvsXfQ8+NKTrNJLIZdGVRVhAsJlcgbFihTPzm7qTtq
         jFzA==
X-Gm-Message-State: AC+VfDyZ8wid/7XrMKu71Qjo8RYy+fHTsRXJFDM6My5UYCy4CYzOh+17
	AOvq4ldPCkiYVDcpJk5GnxsEllJAGkn9SMT8U6I=
X-Google-Smtp-Source: ACHHUZ41WxSh9xxXr2huA03Ro54viAYOh8qXB4Atjp2wuNCgK6SKE3nk1n3oGkgvwz1Gup+AdoJbvtY5JrG2/d80Vvs=
X-Received: by 2002:a1f:3d57:0:b0:471:5506:2d85 with SMTP id
 k84-20020a1f3d57000000b0047155062d85mr6766961vka.5.1687400052955; Wed, 21 Jun
 2023 19:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1687178053.git.oleksii.kurochko@gmail.com> <ce6fcda2899677cd241ff31cc4d915542475a05d.1687178053.git.oleksii.kurochko@gmail.com>
In-Reply-To: <ce6fcda2899677cd241ff31cc4d915542475a05d.1687178053.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 22 Jun 2023 12:13:47 +1000
Message-ID: <CAKmqyKM5mb4Wi4CNMLx-Zok-bDW_DCkwtdF7BDGUB+rMSx1iuQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] xen/riscv: move extern of cpu0_boot_stack to header
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 19, 2023 at 11:35=E2=80=AFPM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changes in V2:
>   - add Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>.
> ---
>  xen/arch/riscv/include/asm/mm.h | 2 ++
>  xen/arch/riscv/mm.c             | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm=
/mm.h
> index 3f694a43ef..085eaab7fb 100644
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -8,6 +8,8 @@
>  #define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
>  #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
>
> +extern unsigned char cpu0_boot_stack[];
> +
>  void setup_initial_pagetables(void);
>
>  void enable_mmu(void);
> diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> index 663048c783..602b89aeed 100644
> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -20,8 +20,6 @@ struct mmu_desc {
>      pte_t *pgtbl_base;
>  };
>
> -extern unsigned char cpu0_boot_stack[STACK_SIZE];
> -
>  unsigned long __ro_after_init phys_offset;
>
>  #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
> --
> 2.40.1
>
>

