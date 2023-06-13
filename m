Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A6872DA30
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 08:53:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547816.855419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8xtJ-0004nr-2O; Tue, 13 Jun 2023 06:52:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547816.855419; Tue, 13 Jun 2023 06:52:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8xtI-0004m7-Vq; Tue, 13 Jun 2023 06:52:32 +0000
Received: by outflank-mailman (input) for mailman id 547816;
 Tue, 13 Jun 2023 06:52:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SBPL=CB=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1q8xtH-0004m1-6U
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 06:52:31 +0000
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com
 [2607:f8b0:4864:20::a2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd24f5e1-09b6-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 08:52:30 +0200 (CEST)
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-461b408594fso3582671e0c.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 23:52:29 -0700 (PDT)
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
X-Inumbo-ID: dd24f5e1-09b6-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686639149; x=1689231149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUTI8ZA8f8N9IjETLd+NpC7RWhO4g/gz5kOSl8zdqnE=;
        b=MCzgLt5jGSnKDKfE3AgFxnvxl3xlBunouXJZLWuHMePJeXc8DnwDGXANNgylGMCKUi
         Al1jwgayeAGw7OMHmHXyBaHR2t4psiT/q87RykByU+D1hz8yO687Vn0tSdzs9yc60F3M
         81MQe1xVp79UW/L+HDvVSG0KTo/UIKhxPeW8EIlLPJOoSOtU24RznDncgC1ZxSVenQyJ
         Oe7dJiPp8bDdSLL2oSS3Ya3DDsfmp2d7npIPbku7GH1wRUxaj889ngMiaqgCBkO5pyA6
         gNxt6skHe3orRHCU7l1HBi6seEdYj4BWO0sXi3FwIY9Y44J8dzIYwuiRrrtQxrSdrpTW
         gr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686639149; x=1689231149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUTI8ZA8f8N9IjETLd+NpC7RWhO4g/gz5kOSl8zdqnE=;
        b=OVp3JmSl+d0JzXOnrur260U8/ubTGVrOO3gz4i1SCnftV9umMfy3fCojTw/tHvWotO
         idZbT6xqQ1/U7vK162v0SQt6bCUsy7SIqceZyRHMDT6vQl4rx/R+024zPbbz+Fu0lioK
         AlJKLXoAWvUXJNGqdD9WUOpdSquBz5vS3xZ1qCRn4UeMGGy00iwMbV9Qv5adA67LKlMV
         ast/eHQuLJKkfEYi+ZWIMILzwOOFRTfbscqHPYkT7m30l8/6b6T4HnZ0C2yb98LIpz+o
         yK49KUcB2PXxhPra8AzCHrYpXljyDzWDSvKDKHEdtL7N0uL8bpabOF3HSZtqiyGUnBVS
         tAVA==
X-Gm-Message-State: AC+VfDzhf/7jFQmDZpSypBYF99DOEJftYlSwQtcaqhvcCk8L3zMLCHiJ
	68KY4hmL8QS6lSDa5B4hPGpFV3jnqEbr7E3Ea0k=
X-Google-Smtp-Source: ACHHUZ6gYXccQDzWt2fkiBAfneNFBFmu5UKKQtAwgEqOqP7iG3A/NonNo5IQQgO9+dgx4+sHYDCwwJXJAkTNvhPu/ak=
X-Received: by 2002:a1f:df82:0:b0:46e:70bc:9a0f with SMTP id
 w124-20020a1fdf82000000b0046e70bc9a0fmr60423vkg.1.1686639148853; Mon, 12 Jun
 2023 23:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1686080337.git.oleksii.kurochko@gmail.com> <298e8876fca284eac7caf7e62339ead177da9609.1686080337.git.oleksii.kurochko@gmail.com>
In-Reply-To: <298e8876fca284eac7caf7e62339ead177da9609.1686080337.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 13 Jun 2023 16:52:02 +1000
Message-ID: <CAKmqyKOKR9VG_wgDd-wfrcjrQ4kwvyc50a_Nc_GbFe5Gi9zN-Q@mail.gmail.com>
Subject: Re: [PATCH v1 7/8] xen/riscv: add __ASSEMBLY__ guards
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 7, 2023 at 5:55=E2=80=AFAM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  xen/arch/riscv/include/asm/page.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/a=
sm/page.h
> index 8e8ec9ee36..1c6add70a5 100644
> --- a/xen/arch/riscv/include/asm/page.h
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -3,6 +3,8 @@
>  #ifndef _ASM_RISCV_PAGE_H
>  #define _ASM_RISCV_PAGE_H
>
> +#ifndef __ASSEMBLY__
> +
>  #include <xen/const.h>
>  #include <xen/types.h>
>
> @@ -60,4 +62,6 @@ static inline bool pte_is_valid(pte_t p)
>      return p.pte & PTE_VALID;
>  }
>
> +#endif /* __ASSEMBLY__ */
> +
>  #endif /* _ASM_RISCV_PAGE_H */
> --
> 2.40.1
>
>

