Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E82B3758AA2
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 03:09:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565547.883768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLvfn-0006iz-Kp; Wed, 19 Jul 2023 01:08:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565547.883768; Wed, 19 Jul 2023 01:08:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLvfn-0006fu-HW; Wed, 19 Jul 2023 01:08:11 +0000
Received: by outflank-mailman (input) for mailman id 565547;
 Wed, 19 Jul 2023 01:08:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xxcu=DF=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1qLvfl-0006fo-Vs
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 01:08:10 +0000
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [2607:f8b0:4864:20::92a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7cd713e-25d0-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 03:08:07 +0200 (CEST)
Received: by mail-ua1-x92a.google.com with SMTP id
 a1e0cc1a2514c-7943be26e84so1999175241.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jul 2023 18:08:07 -0700 (PDT)
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
X-Inumbo-ID: b7cd713e-25d0-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689728885; x=1692320885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6og/N58FRzuJTlGWa3AkEcxU2CWvIy+crK9VlyTw4o=;
        b=KwRoSLX5YtYMVzsbq40Eiyi5IbkjFDVe4xYO1BCeCohHVXJHTvzPD6KT2W1snVyIc7
         xFvOvhUCquS4UOwXqPj5VDM7Og7bIYPcjepnrFse06kOsnbSNK+zh0vJo9syAjhHuaje
         GUXrM0cnZYTvPHcllePzhr2f9Y7L49CHe2H8x5ks9HBPbWjM12egX7MGBOTohBoWDxUZ
         V3r/OkTUEHm5qLEDrl75T/HHcXSrkSRFcwTqpOJKWHkn7MUMtOz+lHBfopQMOA//iqg+
         X99DI9P7ttgy/f+9yoINtNwr+gh4P9930K3uXmsS52bFEfybiuLRrvKhfLV1u3J9UhTG
         cSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689728885; x=1692320885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6og/N58FRzuJTlGWa3AkEcxU2CWvIy+crK9VlyTw4o=;
        b=K9Mn0dHsxM8T31DBOEkK/ILRAIpUjE9QlC1AXeOPm4DK+OJ71SJxYORrP+wbNbb34w
         J9iqVXgd5dp78fEUU4cP1jONGoD40MYeRInf6zcUDqym4BQKDiuTIaCbYj3F9CMAaMIL
         xlaB1svFjrVawO4jZfRKagDe5AK+sw9jD9DP3PuxXX3Fw+29SfV5Lr6qQmDsEvWb4hXd
         i8qkdqDf39/Jzd58ahd4DBTeUTkiwHb/7kdARESA6VGeyleWKhN8j7bvTiIDw8jf2wtG
         KdCCWsziwwYoUgWf0LwgAJaSeLUikUaVZQhZ7sOjySRHYrYW0Z8G+GBRwLq+26CGzd5X
         qXyg==
X-Gm-Message-State: ABy/qLYpKIr5yoJFJPEMPZXJjgpYASRDQGOX6XtAjhRbyYjf/vVqzUEe
	ElJy4IFhAPACmvM16vz+Zmit/OjL3GStkyEEb+k=
X-Google-Smtp-Source: APBJJlH/FOnarvy82+U8DKgBgSXFiNj7rujNNHGZQmaDLJ5U0VuNuK+jjhdwWon6Yo6XXuCOx09wdV6X5p7blQB5PzU=
X-Received: by 2002:a67:fa86:0:b0:443:68f5:3c80 with SMTP id
 f6-20020a67fa86000000b0044368f53c80mr7584926vsq.5.1689728885732; Tue, 18 Jul
 2023 18:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689604562.git.oleksii.kurochko@gmail.com> <2e4580f06b0b9d3b98e70536e3b2b990ec4269a0.1689604562.git.oleksii.kurochko@gmail.com>
In-Reply-To: <2e4580f06b0b9d3b98e70536e3b2b990ec4269a0.1689604562.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jul 2023 11:07:39 +1000
Message-ID: <CAKmqyKP4nnSr6dM+nbktJBXWqbe_N5BftuS0N78pc40SQnubxQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] xen/riscv: add SPDX tag to config.h
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2023 at 12:41=E2=80=AFAM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changes in V3:
>  - new patch
> ---
>  xen/arch/riscv/include/asm/config.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include=
/asm/config.h
> index 38862df0b8..fa90ae0898 100644
> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -1,3 +1,5 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
>  #ifndef __RISCV_CONFIG_H__
>  #define __RISCV_CONFIG_H__
>
> --
> 2.41.0
>
>

