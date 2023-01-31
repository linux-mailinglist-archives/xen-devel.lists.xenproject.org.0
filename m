Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1B0682111
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 01:51:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487307.754927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMerR-0004ge-3M; Tue, 31 Jan 2023 00:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487307.754927; Tue, 31 Jan 2023 00:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMerR-0004e2-0c; Tue, 31 Jan 2023 00:50:57 +0000
Received: by outflank-mailman (input) for mailman id 487307;
 Tue, 31 Jan 2023 00:50:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+DaM=54=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pMerQ-0003t5-9S
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 00:50:56 +0000
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [2607:f8b0:4864:20::e2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5165e774-a101-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 01:50:55 +0100 (CET)
Received: by mail-vs1-xe2b.google.com with SMTP id e9so6651364vsj.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jan 2023 16:50:55 -0800 (PST)
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
X-Inumbo-ID: 5165e774-a101-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gck6xgng8kFOr9KO6xp8nFknGs/yyh8Xj+812scWE+E=;
        b=O2FdhqiuG8n7TYa8O/JNOIsMWUJczqWtdPvY+8FLD/PTCrCvb/q2kQv06uEsUGWC8k
         qBaMzuUiPbCM21y3lpbDZaLVhQwMjj+yDfc5dNUH68BaybASwAUKvJiiEiFifpJBHu3s
         zO4uzvQ78MYavjQnzLHRJlGFJIMImlXGyydssvkr588O2j6zuMMnz3y3swCnqBfykt0J
         F4smr4FJ/LgAw3HvSJSn/JQCAvq5no3QI6Ns5OS20JyX41rwcd8QXVILUgR4U0JATCsA
         qP6yNxr4Uw+Pk792p7nYJz3FXHKDOlrNsmpiom4y/1Y4JmHctqwIPSnbaqOr2N+yOyJG
         6F0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gck6xgng8kFOr9KO6xp8nFknGs/yyh8Xj+812scWE+E=;
        b=dxuzpdtcedB1RUgIDQffaQojlG1TuGlaPugEoo3OX0AVeugZZiWvz6yNTp3K0gtpDq
         xtpEzkVZR7EmZfBH152V5WX7LPECqO7Z1hBAKySGmPUBaivHyST5yp6TKgKPkCeBleJs
         QHm9SucM2YT8QN+g4lPc9ph4zZY0gDEDfaKES168uH4HVHvy8LhCzJ7EHugGTswi9tzS
         5YN/38xR9hutaEkUUM/Lg2vgv7gAFcqannrxLvlYNjwoTf+eU86/MmS3A5HsM9qj9j1g
         XNg6v4+1Cvw+aMM/vMARsBwf2wqyXsXkQCx2XR/j1oloaSKDZfeHfgM+Xm2VNpudEkgL
         XhnA==
X-Gm-Message-State: AO0yUKU6lY6ovFgvptdl1Gq2WZc5HBe8yjMSnA4pBorOHS3HmRZHXdKH
	LuzNH2m9dtFwf0jivr3Px7yD2EBLdPOTXEKX4/FL0bjowAOsiw==
X-Google-Smtp-Source: AK7set9D+ULchibZ29kfKVEfwGXbpK6kpig/xpI8jL+GMAt7BMa8ad7eT4EZW4+Au8BTb8M0Ky0MbriXZMINpLqyC9M=
X-Received: by 2002:a67:e184:0:b0:3eb:f205:2c08 with SMTP id
 e4-20020a67e184000000b003ebf2052c08mr2226792vsl.10.1675126254693; Mon, 30 Jan
 2023 16:50:54 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674818705.git.oleksii.kurochko@gmail.com> <1c53e9784707482edf96d144d9ce36a4fc9d7ed5.1674818705.git.oleksii.kurochko@gmail.com>
In-Reply-To: <1c53e9784707482edf96d144d9ce36a4fc9d7ed5.1674818705.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 31 Jan 2023 10:50:28 +1000
Message-ID: <CAKmqyKMQ8_jzGviQ-sx+=L38ECfCkXbwqW6Vb04yY3GmGaVTWg@mail.gmail.com>
Subject: Re: [PATCH v2 06/14] xen/riscv: introduce empty <asm/cache.h>
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
> To include <xen/lib.h> <asm/cache.h> is required
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changes in V2:
>   - <asm/cache.h> is a new empty header which is required to include
>     <xen/lib.h>
> ---
>  xen/arch/riscv/include/asm/cache.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>  create mode 100644 xen/arch/riscv/include/asm/cache.h
>
> diff --git a/xen/arch/riscv/include/asm/cache.h b/xen/arch/riscv/include/asm/cache.h
> new file mode 100644
> index 0000000000..69573eb051
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/cache.h
> @@ -0,0 +1,6 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _ASM_RISCV_CACHE_H
> +#define _ASM_RISCV_CACHE_H
> +
> +#endif /* _ASM_RISCV_CACHE_H */
> --
> 2.39.0
>
>

