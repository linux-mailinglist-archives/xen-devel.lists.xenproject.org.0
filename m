Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BB968210D
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 01:50:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487302.754917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMeqy-00048t-RU; Tue, 31 Jan 2023 00:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487302.754917; Tue, 31 Jan 2023 00:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMeqy-00046D-Nt; Tue, 31 Jan 2023 00:50:28 +0000
Received: by outflank-mailman (input) for mailman id 487302;
 Tue, 31 Jan 2023 00:50:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+DaM=54=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pMeqx-0003t5-GH
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 00:50:27 +0000
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [2607:f8b0:4864:20::e2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4044423b-a101-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 01:50:27 +0100 (CET)
Received: by mail-vs1-xe2c.google.com with SMTP id i188so14459545vsi.8
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jan 2023 16:50:27 -0800 (PST)
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
X-Inumbo-ID: 4044423b-a101-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oqC5k7Jxr08rLQX92K857Nue+507+QiY0epeO96EDeE=;
        b=Lv4uCyXBAGLzNjcgXuiCZNMBefr+ZyaWl4vZf/+IEH4erdAiFpwwkFmAOk1XIdZ1jr
         rtGZjHwG/4tmF7Ko8XNiO83wdyw2CaBZmaqSa3jHZ628jp+2FulcG5G/zdBXvW5CUY2f
         BOOQGDegstWBrXBNTlRZUroddL/kSsTWjuIkIv1PSykto+rGt/fbVeuNAFBoe784MWkQ
         SankiPq+3hcKMc4a/DpG2rIIbEZPnJXQKQ6ZWX3bVyH8AWLTMsLzXTv96s7BFTD240Iy
         Z7oVauc4aVNGJI9k+Xg8FJp1pwwhryHcraxPGfgf2F7NZN24IknASs6s1idOI16dc8f7
         b5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqC5k7Jxr08rLQX92K857Nue+507+QiY0epeO96EDeE=;
        b=UoNTi0fGUgq74qmPuzJfrLuk9/5bUQ1uMY0kXBk2fFKx6fZYskyaweJBoBLZorLkEs
         O6R5r0SoGRnugv3+ugzEGGRfJMm9yqbanOPmHtruFmwp9HdDx5kgvxwBXmtuekLxXbBj
         VNSb8olsa/jR2m1dytLo4PF/LZYkO3hlufV6unOjvcTk9YxyEIUAPQjqZJQh1PItK8wd
         yV/MCmV8pEtHYfFUv5nBDY6ucKlKIEQrgF5FkML7yOIVobn1ocpeednxd/kAnKNmOAw1
         ph6pemeX1ESlxLwrhi2xfnaOAMygX/cPxWh9rgN7s4ZX+NamMj7mrQcye9BVgaNJPKWE
         HkKA==
X-Gm-Message-State: AFqh2kp1wbyd72oXwuXGSPL7uv6a/dtv7bfu5BLQXh3VCGAKOgahKwoX
	iLUWVDhNUryjSVBOjsi3A0g2mSMqct4r717jOUs=
X-Google-Smtp-Source: AMrXdXtiTycoBa9qjmM1hpjye+pvUmKMTgvUuORYzVixHDZ7qfRXSQZE0ukaEYDmEuc7JVEvOD+HvHekaNjazyQd3xQ=
X-Received: by 2002:a05:6102:cd4:b0:3d0:c2e9:cb77 with SMTP id
 g20-20020a0561020cd400b003d0c2e9cb77mr6959006vst.54.1675126225968; Mon, 30
 Jan 2023 16:50:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674818705.git.oleksii.kurochko@gmail.com> <19c64efc3c05f64de97cdc4a96919ee28844440b.1674818705.git.oleksii.kurochko@gmail.com>
In-Reply-To: <19c64efc3c05f64de97cdc4a96919ee28844440b.1674818705.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 31 Jan 2023 10:49:59 +1000
Message-ID: <CAKmqyKPpfGBJ+nLQrqras1DtPLxELQOyiKiFJq2JP63LjiEdow@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] xen/riscv: introduce empty <asm/string.h>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 28, 2023 at 12:00 AM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> To include <xen/lib.h> <asm/string.h> is required
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changes in V2:
>   - <asm/string.h> is a new empty header which is required to include
>     <xen/lib.h>
> ---
>  xen/arch/riscv/include/asm/string.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>  create mode 100644 xen/arch/riscv/include/asm/string.h
>
> diff --git a/xen/arch/riscv/include/asm/string.h b/xen/arch/riscv/include/asm/string.h
> new file mode 100644
> index 0000000000..a26ba8f5c6
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/string.h
> @@ -0,0 +1,6 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _ASM_RISCV_STRING_H
> +#define _ASM_RISCV_STRING_H
> +
> +#endif /* _ASM_RISCV_STRING_H */
> --
> 2.39.0
>
>

