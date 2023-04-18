Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 192FA6E576D
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 04:18:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522548.811999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poauy-0008Kf-0b; Tue, 18 Apr 2023 02:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522548.811999; Tue, 18 Apr 2023 02:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poaux-0008Hy-TZ; Tue, 18 Apr 2023 02:18:03 +0000
Received: by outflank-mailman (input) for mailman id 522548;
 Tue, 18 Apr 2023 02:18:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=woKg=AJ=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1poauw-0007m5-8L
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 02:18:02 +0000
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [2607:f8b0:4864:20::931])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d5b53b8-dd8f-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 04:18:00 +0200 (CEST)
Received: by mail-ua1-x931.google.com with SMTP id q10so4624902uas.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 19:18:00 -0700 (PDT)
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
X-Inumbo-ID: 3d5b53b8-dd8f-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681784279; x=1684376279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zb73uaT0Z+rRNam7JCgWVn/vfNombeY2fg/tQca0kHA=;
        b=YGTGUhCMLb6f95hUBLHzh/b1zU4cZtTuKZqItNcdB+001D6HNrlzjGqBOy9TRMLG4U
         AoV3MX87PfW40aSTgL1qNQhReTpn4ZstJz4u9mppNmPj6CYH7iSEg33oDuj0nuN3nCgK
         Oazx0Wq/KGbCQ28HuEbkEBY4/5AYHmdbggccmaZP3wbgsdqOkFl/AZgjizTfqpOSt32b
         Ll2hbTbUnruTDjZiBrFHX4bQiH2Hn6y3w+gM5cR5X/qdhxDiQz7YdDuDhUXo5MEp29mV
         eJFnuP/iwfcTpRmicuguBbJpuOLMGDyycbgoC//yXBc03nkrPG2zXNA9YoPpzf/HG0Ny
         J1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681784279; x=1684376279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zb73uaT0Z+rRNam7JCgWVn/vfNombeY2fg/tQca0kHA=;
        b=P2vSA5Ks9QC38xdPvhFft5pFjLgtDC8uXUQHPwClnMpo/9MYjq/orBUzbqoL+FJ+js
         doeL+2RbDETq46KuwKjaORtlNCEZJyIeKhOhrf86HRe+tPuwOZaQWYXECcW4FbN0HzBP
         rCSbNY7J95yLvGCiTpf8E0eyRNIV2TDej8I14LI2By+lEzH/n4PNqHp5yLx3vRsJj/9O
         PasIxY83m3b+0MXScY8r3jPDDd5Up3366qEOxIV6/Tj1zTKpbFTm7nZjxyiTb1e/x6k0
         eGT0RRd5jk1SNO778aeFwmT2+J17RNr9zP3MLKSNl/liIavNDjQeW/vjyQZp/smoMml8
         9aJw==
X-Gm-Message-State: AAQBX9dG1ORzScdcD5dz/lCnNlg/j/AGx6bEopWGAs07yHi7nJ0BmP+r
	LZhSp6cBnkg5Sc7B5Lu9Z0cEOJiE5tcDg6yQuq8=
X-Google-Smtp-Source: AKy350YkmJW7VmWXJK25j1G2LAtdUYtgU99d1RWAHaXOLLdf77ZwOucMlNkUhK1jLVZsSWmOs9ZkIOofbU1ZQmxOrrw=
X-Received: by 2002:a1f:bd4b:0:b0:439:bd5c:630 with SMTP id
 n72-20020a1fbd4b000000b00439bd5c0630mr4872877vkf.6.1681784279186; Mon, 17 Apr
 2023 19:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1678970065.git.oleksii.kurochko@gmail.com> <7c066d6dcc0618749df04785b34b93819148087d.1678970065.git.oleksii.kurochko@gmail.com>
In-Reply-To: <7c066d6dcc0618749df04785b34b93819148087d.1678970065.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Apr 2023 12:17:33 +1000
Message-ID: <CAKmqyKPj43hVKjUXyNSiy4Y+VeJAPTM_E7=DzAY8dp=wWETJ1A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] xen/riscv: add explicit check that .got{.plt} is empty
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 16, 2023 at 11:22=E2=80=AFPM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> The GOT sections usage should be avoided in the hypervisor
> so to catch such use cases earlier when GOT things are
> produced the patch introduces .got and .got.plt sections
> and adds asserts that they're empty.
>
> The sections won't be created until they remain
> empty otherwise the asserts would cause early failure.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changes in V2:
>  * the patch was introduced in patch series v2.
> ---
>  xen/arch/riscv/xen.lds.S | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
> index ca57cce75c..f299ea8422 100644
> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -1,3 +1,4 @@
> +#include <xen/lib.h>
>  #include <xen/xen.lds.h>
>
>  #undef ENTRY
> @@ -123,6 +124,15 @@ SECTIONS
>          *(SORT(.init_array.*))
>          __ctors_end =3D .;
>      } :text
> +
> +    .got : {
> +        *(.got)
> +    } : text
> +
> +    .got.plt : {
> +        *(.got.plt)
> +    } : text
> +
>      . =3D ALIGN(POINTER_ALIGN);
>      __init_end =3D .;
>
> @@ -156,3 +166,6 @@ SECTIONS
>
>      ELF_DETAILS_SECTIONS
>  }
> +
> +ASSERT(!SIZEOF(.got),      ".got non-empty")
> +ASSERT(!SIZEOF(.got.plt),  ".got.plt non-empty")
> --
> 2.39.2
>
>

