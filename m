Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 509236913B0
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 23:47:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492956.762735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQFfw-0000GT-5t; Thu, 09 Feb 2023 22:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492956.762735; Thu, 09 Feb 2023 22:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQFfw-0000Cw-2C; Thu, 09 Feb 2023 22:45:56 +0000
Received: by outflank-mailman (input) for mailman id 492956;
 Thu, 09 Feb 2023 22:45:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UnIs=6F=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pQFft-0000Cn-Ug
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 22:45:53 +0000
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [2607:f8b0:4864:20::e31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ffce9c8-a8cb-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 23:45:51 +0100 (CET)
Received: by mail-vs1-xe31.google.com with SMTP id l8so3769505vsm.11
 for <xen-devel@lists.xenproject.org>; Thu, 09 Feb 2023 14:45:50 -0800 (PST)
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
X-Inumbo-ID: 7ffce9c8-a8cb-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8kFwis3pzEZ5yShlWxbV4o74IEFVkY2Kbc/fc1drLg=;
        b=OtoiH4yr1E1UD0IDRsByA222jIV5cwfiknYtPetwtgrr2fzs3JplVE1qTrTgWLxC8s
         0w9qgIMApVrueQYH263P3680ikbO5WWuhCllcRJPPEiEZDs2rldm2JeNbtfkouZ/jrlT
         aEEqacx8V1Mvc8mxby9O5+meFI2cstNuRUoGpCmlFQqDFyKv/qFFL8R14/kf2W+iY78x
         MH6K1kLIB43E3EPF9Q6DUnNuv+NFJgrinXYkcYsL78w/2AUIPmyM9alBMLaoF/JyXo3J
         J10Z9tIQFmrKPebiXlTfD6SJWpMNuxkShsqlD8ET5HxJSt8kKDmw2sNGK4dF3zwaeFXo
         rBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y8kFwis3pzEZ5yShlWxbV4o74IEFVkY2Kbc/fc1drLg=;
        b=L0R7qdWSd3PJ7u52dZykqyhP+mD8XejTTPW1kBO9Ze1F3cs0vNUKm8tDTYtRWfVArP
         CSv252fJ/rFcCZTxqdgiMAiwECbxYmulBeHYklZTCR+NzEieu5zao2YOkv4UiMSoCQp4
         v9EOKTsZ4Mz4+rRG8sUJALMwcANtNr3IQ23F3tEOhgYJ2WDkLYjicY+B+xSbAgSpHE3D
         541L+DAXOYMsCDEjTqEK/6MuMvIs1P45JxSqxSPQsktAUXj79vlRBnrXzZpalBxfu/M0
         9lsuj2Z+xZKuXFx1zgxNnarFgUO6IAQ1pp2eeth8wRTzV4iCzgPeyg/rB9gpNO8MSm5v
         RXfA==
X-Gm-Message-State: AO0yUKXJ1+kzhn2+Wmy5jCSprw9E4zeDC4eUdurGsP49Obm5SLEa0tsE
	W+l1CHnTI0PgWy6uKwt/SK+n4HNcSHAENG4aUQI=
X-Google-Smtp-Source: AK7set+TDB/iSty1FOgMcwRZnU0o/YA3V6ejbyFonm3GmJ+O1pKlXwSYLXDLSUFqHw2fMNcOBSBimJxU6sXqiRw9mq4=
X-Received: by 2002:a67:a407:0:b0:3f0:89e1:7c80 with SMTP id
 n7-20020a67a407000000b003f089e17c80mr2444094vse.72.1675982749302; Thu, 09 Feb
 2023 14:45:49 -0800 (PST)
MIME-Version: 1.0
References: <15a27b40-54ab-6b7a-9702-f72cf870e6d1@suse.com>
In-Reply-To: <15a27b40-54ab-6b7a-9702-f72cf870e6d1@suse.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 Feb 2023 08:45:23 +1000
Message-ID: <CAKmqyKNUCPWieZxbzgwaH5KzZ=3propx-bVRGshkcXFmWt7Wmg@mail.gmail.com>
Subject: Re: [PATCH] riscv: add temporary riscv64_defconfig alias
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bobby Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 9, 2023 at 8:02 PM Jan Beulich <jbeulich@suse.com> wrote:
>
> This is to allow building of Xen without going through a separate
> tiny64_defconfig build step, just like is possible for all other
> architectures. Eventually the symlink will want replacing by,
> presumably, an empty file just like other arches have.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  xen/arch/riscv/configs/riscv64_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 120000 xen/arch/riscv/configs/riscv64_defconfig
>
> diff --git a/xen/arch/riscv/configs/riscv64_defconfig b/xen/arch/riscv/configs/riscv64_defconfig
> new file mode 120000
> index 000000000000..c3c97b4d109b
> --- /dev/null
> +++ b/xen/arch/riscv/configs/riscv64_defconfig
> @@ -0,0 +1 @@
> +tiny64_defconfig
> \ No newline at end of file
> --
> 2.37.1
>

