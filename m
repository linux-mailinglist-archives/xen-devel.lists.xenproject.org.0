Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93358770213
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 15:43:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577152.904065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRv4n-0002nG-Qy; Fri, 04 Aug 2023 13:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577152.904065; Fri, 04 Aug 2023 13:42:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRv4n-0002k4-Nn; Fri, 04 Aug 2023 13:42:45 +0000
Received: by outflank-mailman (input) for mailman id 577152;
 Fri, 04 Aug 2023 13:42:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8k3D=DV=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1qRv4m-0002jy-Cq
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 13:42:44 +0000
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [2607:f8b0:4864:20::92f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8055340-32cc-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 15:42:41 +0200 (CEST)
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-78a5384a5daso651984241.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Aug 2023 06:42:41 -0700 (PDT)
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
X-Inumbo-ID: c8055340-32cc-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691156560; x=1691761360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwEj/mlrbmIXZppAE8WYSFPJa4shWw2a/7DL7GnW/jA=;
        b=JJQEtocgJB0UjcEAvLjOvw/6ayaB65lksDrJX5a8cw6fhpIyW/Gp6O5QuQhkNZMO4n
         OLowa7V/Yn0p/hASs9aHqNPrPIKqOnb0XdXrLno8pK8tdahtCMrlaUQLvZiKsVM953RI
         ycB2OAEdpv4WX1+fbMNI22X7GUBcwuJea26v6huFhPxXepgrjCuSSQZ+e9MZgXUf70DM
         q3ffGLL5S/VRw8zsJzsn4WpbnioMBNqdDVSj90zJMUBevOeBFI28tYVIYGxE4MG5CHIz
         6hDNyUArMrph/ABRlqILVgYuOPIbIN1B7EchwPY/N5RgfVF9ivCw4JafPhpF5FlBSRJ3
         TY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691156560; x=1691761360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DwEj/mlrbmIXZppAE8WYSFPJa4shWw2a/7DL7GnW/jA=;
        b=K7e7nA76KbRNrOdGlz5VCs0IgOROI+xRak1LwJdIu/Fw1zVXiqc7zxLUeWcM7HjOuF
         L58hJYkX/RaNGkxmqRmCX+0BBAWpKUshZCAkO6gg7IVCqtK3anjAHBQBPRbRcibdkphQ
         UoFerPQZTys5nm+2CmszqPXr/Tl6S08n/Ip77ehM5h7aJvV6j6UMBkbCxWzcQDGSPSHC
         uVcVG/PTXKUjhVkNxCYuuXqQMIiJRNTUTVq5WROlBGzf8z1DDJsV1L6J34TcaY1iIcz+
         oxsSFDkFh1Z+qpn9lsxiPTXxDe/B78LDdAS/VLZ95YIp8nU4HGONReM410nMXb39u96l
         9IzA==
X-Gm-Message-State: AOJu0YxsWz4Hoqiubwiij33eI2LlrZyZmbPkIsctjXT19Eb6Ura5Dgtw
	TBIHrv9Nzzngl8mLRjwtr2mkHLoYqclMFJ6sW9I=
X-Google-Smtp-Source: AGHT+IFWpdx3bBRjAQUXw1az+MdUxSqeOAujvWGIHD88avtlgkc6Emn9SaqoputYXvBRK23oTtlr58ccajred7O0K5A=
X-Received: by 2002:a1f:bdd1:0:b0:471:8787:2c6c with SMTP id
 n200-20020a1fbdd1000000b0047187872c6cmr660867vkf.6.1691156560039; Fri, 04 Aug
 2023 06:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1691063432.git.oleksii.kurochko@gmail.com> <dfb1c50881a7bb21a1b32083f447e31995004f35.1691063432.git.oleksii.kurochko@gmail.com>
In-Reply-To: <dfb1c50881a7bb21a1b32083f447e31995004f35.1691063432.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 4 Aug 2023 09:42:13 -0400
Message-ID: <CAKmqyKNxq=S4W=LpEdLaf1P1thwzoTmwn7GV_4G3GvTaBApoaw@mail.gmail.com>
Subject: Re: [PATCH v7 2/6] xen/riscv: introduce dummy <asm/bug.h>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 3, 2023 at 8:05=E2=80=AFAM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> <xen/lib.h> will be used in the patch "xen/riscv: introduce
> decode_cause() stuff" and requires <asm/bug.h>
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changes in V7:
>  - Nothing changed. Only rebase.
> ---
> Changes in V6:
>  - Nothing changed. Only rebase.
> ---
> Changes in V5:
>  * the patch was introduced in the current patch series (V5)
> ---
>  xen/arch/riscv/include/asm/bug.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 xen/arch/riscv/include/asm/bug.h
>
> diff --git a/xen/arch/riscv/include/asm/bug.h b/xen/arch/riscv/include/as=
m/bug.h
> new file mode 100644
> index 0000000000..e8b1e40823
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/bug.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2012 Regents of the University of California
> + * Copyright (C) 2021-2023 Vates
> + *
> + */
> +#ifndef _ASM_RISCV_BUG_H
> +#define _ASM_RISCV_BUG_H
> +
> +#endif /* _ASM_RISCV_BUG_H */
> --
> 2.41.0
>
>

