Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1111872B72F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 07:10:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546820.853864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8Znp-0006JV-BU; Mon, 12 Jun 2023 05:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546820.853864; Mon, 12 Jun 2023 05:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8Znp-0006Gu-76; Mon, 12 Jun 2023 05:09:17 +0000
Received: by outflank-mailman (input) for mailman id 546820;
 Mon, 12 Jun 2023 05:09:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lerX=CA=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1q8Zno-0006Go-0y
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 05:09:16 +0000
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [2607:f8b0:4864:20::931])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 457373b9-08df-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 07:09:14 +0200 (CEST)
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-784205f0058so1371329241.1
 for <xen-devel@lists.xenproject.org>; Sun, 11 Jun 2023 22:09:13 -0700 (PDT)
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
X-Inumbo-ID: 457373b9-08df-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686546552; x=1689138552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0x3KhOr+yc6kG50ecMt1zrzXqM3qDJzmbWg6PazmtvE=;
        b=NebBeLAFc7NKiGSo2OLiaezIPD9sAV1TkdfjNpfpp33a2Q7XViST56PjddsU4v6IM7
         VyRg9JrtRwoEflZefIiI/z9D0xR53ZQnf0k6a5JK3QMvBy9L2ivuVGT/6quI7dHGWQ7l
         /YcskSZTdmi5XJo4yawWAWx9NQB1jjrwssgLPGlcu3LB8MwCetsa4GiI6ZiSOj1cIFcs
         VizgS3qJzMqKDME397JagWRlAFVQ1LHbxPZq+zAaUWU0s1L/D2DI3FXU0SEV3Xq+WDxD
         2BF+oh3J4baiAXaBELwnCdfVopMEA/UYUJ4sULRS3PaHJBJpmoMT04qyUIfovY5cJmFR
         YDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686546552; x=1689138552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0x3KhOr+yc6kG50ecMt1zrzXqM3qDJzmbWg6PazmtvE=;
        b=ICwu/tXxuVgbU/pvKjfqfje6j1E5CX0DIbtxMznEz7JgVR8SN8T6jMYV4GB1LITxVF
         tRrWhhDEBDi2h+WYQc+0dCvuKW5tEGtGrlfb26oKWHIN5IC8rY0BDJ+ynRCH18UpwOzK
         8Wxs8nATDDIH84oNdU2xBObDFfD9g/rKzbzm6RxS4xxEqXtD3VcJqJb4eAyI32hZU3Yf
         gK3ISfK36YpaLRhdn7JGARbjBo3hIKoOT2zYRoba04LMoNzKYJjXh+3pGS7B7BQ8b9M0
         m0PVQPRozwbdbdU/nnMXaUxFJNovjE6FeYaQScy+Wl38Tq281PA+J6ep9TSPPn80Dmh7
         aT6A==
X-Gm-Message-State: AC+VfDz/QXBnQ0q/Kp4/ZAJBoa/8f6QhIRR2EixsKbMjhPAYDPXRg3S9
	C4uEbni6Y5cx6l9sp6ZUIuL8Lh5D531bBujT64M=
X-Google-Smtp-Source: ACHHUZ7V/jQjOwSBe0/meTvxkKQ0HiiB8xEEM+06KoPVK8/oLbQtTeLOBH/IsdGBuXeI2dpZEmVoQCCiFLkB2ggrM68=
X-Received: by 2002:a05:6102:ca:b0:43d:54e9:35fb with SMTP id
 u10-20020a05610200ca00b0043d54e935fbmr2999738vsp.14.1686546552581; Sun, 11
 Jun 2023 22:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1686080337.git.oleksii.kurochko@gmail.com> <4ad639bed6b8aa6cee34288a7ce154db21d761b5.1686080337.git.oleksii.kurochko@gmail.com>
In-Reply-To: <4ad639bed6b8aa6cee34288a7ce154db21d761b5.1686080337.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jun 2023 15:08:46 +1000
Message-ID: <CAKmqyKMSf0ZEQbhsDrKN4_6iPf7ZmjiW3cUAwUErbnUN=Wak5w@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] xen/riscv: make sure that identity mapping isn't
 bigger then page size
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
>  xen/arch/riscv/xen.lds.S | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
> index 878130f313..74afbaab9b 100644
> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -20,6 +20,7 @@ SECTIONS
>      . =3D XEN_VIRT_START;
>      _start =3D .;
>      .text : {
> +        _idmap_start =3D .;
>          _stext =3D .;            /* Text section */
>          *(.text.header)
>
> @@ -35,6 +36,7 @@ SECTIONS
>          *(.gnu.warning)
>          . =3D ALIGN(POINTER_ALIGN);
>          _etext =3D .;             /* End of text section */
> +        _idmap_end =3D .;
>      } :text
>
>      . =3D ALIGN(PAGE_SIZE);
> @@ -174,3 +176,10 @@ ASSERT(!SIZEOF(.got),      ".got non-empty")
>  ASSERT(!SIZEOF(.got.plt),  ".got.plt non-empty")
>
>  ASSERT(_end - _start <=3D MB(2), "Xen too large for early-boot assumptio=
ns")
> +
> +/*
> + * We require that Xen is loaded at a page boundary, so this ensures tha=
t any
> + * code running on the identity map cannot cross a page boundary.
> + */
> +ASSERT(IS_ALIGNED(_idmap_start, PAGE_SIZE), "_idmap_start should be page=
-aligned")
> +ASSERT(_idmap_end - _idmap_start <=3D PAGE_SIZE, "Identity mapped code i=
s larger than a page size")
> --
> 2.40.1
>
>

