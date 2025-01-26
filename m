Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63678A1CEBB
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jan 2025 22:14:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877319.1287464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc9x6-0004SA-7y; Sun, 26 Jan 2025 21:13:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877319.1287464; Sun, 26 Jan 2025 21:13:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc9x6-0004PB-4V; Sun, 26 Jan 2025 21:13:56 +0000
Received: by outflank-mailman (input) for mailman id 877319;
 Sun, 26 Jan 2025 21:13:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl/L=US=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tc9x4-0004P5-Tj
 for xen-devel@lists.xenproject.org; Sun, 26 Jan 2025 21:13:55 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7167d662-dc2a-11ef-a0e6-8be0dac302b0;
 Sun, 26 Jan 2025 22:13:53 +0100 (CET)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-216401de828so65928465ad.3
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jan 2025 13:13:52 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da3ea3bb9sm50157355ad.92.2025.01.26.13.13.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 13:13:51 -0800 (PST)
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
X-Inumbo-ID: 7167d662-dc2a-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737926031; x=1738530831; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M9kpcRwj4XMG8ftG4wmZyZnxF1iU/ErySCW5MvOqlTU=;
        b=EGTumM4lFSgptzooojyXm6sP3Q7FcEfHf7uBAufhk7wZwliYq/oXTh3498BUSMsAUT
         eHko89OUQzkNWIPSNDBJhKXdtl7r/5KMEMtv3iYGdx3CtoE0TsMflssLY8y7LSJuJrlN
         8i5ai2QVM9gUvjmmCEM5iFyfNlqo4wilNbNT33PzoLSKvrwR/LLMBGY3eM/iStz8kCoP
         Tmu94v4BBZvzvr8bfPYM1WWtuj310te8Cp4vvpR+vNH603+ElCr4joJvgyqL7yOoWF9g
         szMEOevyySdO8yWMFAy4AQpOE568iI4V32exExLUfC8AnqhRy7Z5Tjz9YU2LpryQQhZ0
         7QCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737926031; x=1738530831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M9kpcRwj4XMG8ftG4wmZyZnxF1iU/ErySCW5MvOqlTU=;
        b=Krvo8uQSQVLQli4PEtaEkQii7TKI0IIEeN4zZQ09rOZiY5XdvgSnQuzilkbumjrEkZ
         EWZ73iCt1FN+1AyqeRhqg+KdK0VqSVIpehXRbInSZWg2OaVClrt13r91IzuHcPHJL0f3
         e2MSNbactogall1+CXxYoIyO014UZT0LoF2UFI4LsJXIUMvJUQ9VIwhqB/e26DsgMDx6
         ZvLkzlK9fhrNe8+2l48dDK9fo7p3o3Wyz+MouhVcDPjJ4yJCiEnOJpCg0RgQK8pTIepu
         vIzi8srLyJLl5YPfv2RSrJGGs0+GudDHCbJ43idI8CiBoNFHXiNNZTRNrKsA5dQMgNt/
         TT+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAPvUQp1s+2QRIceki+0bbyYX45ukFsyyDKyl8H1gQ2isGBSEBqX9biFXGMuot3HQ3fqkm5kl2igc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKBplBqj7E+Me9Kr4yS3uc1u994Kc9M5sgOhq5tvoj6oBLfdmV
	RZgeGJ5or11S1Gckj2cVyEkYo1rq9ymAbO8PdBdVyDXYBy0Q3kajDkgAVzEJD/c=
X-Gm-Gg: ASbGncuagRKCtG3iPQN23E+Q3LUOho6A6RnX2YL7ztZFGSBCQlv0bHbefDP9Z/YodLv
	bDk9fkivIbN81u1V9jwkTULxlm+c4P+gdQCTDBeQ2MC9JJ8Cn1VoYEX3dOzWvZUt3jv/nze3e8s
	0aOgB9987bs1HSS4rE1uGn5g9yO1GV6QOJ89v7TelBFvzZIEecBjPyxtPFjCYzPYtE9DGvcBJUS
	yTvcnlzJazo6dNkg7VQR2zAkmnUs6Tdopk1FpgsmNR1SYj9Kng38Y0m+eeodHTIv/syFW84FhEu
	Hcy1vrs0MlkLS8QpUL/Z/tZDhELfWcIWtIafflJsNl9q26Q=
X-Google-Smtp-Source: AGHT+IEZs0zeKB5IzyrVqsgjZQ8Qgr6yuUndfoZR9xIIrSSkISsRSLWzsvON9msLe4CFxT+Ly8wqnw==
X-Received: by 2002:a17:902:f551:b0:215:431f:268a with SMTP id d9443c01a7336-21c3556016amr565306785ad.31.1737926031507;
        Sun, 26 Jan 2025 13:13:51 -0800 (PST)
Message-ID: <c844b086-b3fd-438d-a4ce-6571094e5e14@linaro.org>
Date: Sun, 26 Jan 2025 13:13:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/20] accel/tcg: Move cpu_memory_rw_debug() user
 implementation to user-exec.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-15-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-15-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> cpu_memory_rw_debug() system implementation is defined in
> system/physmem.c. Move the user one to accel/tcg/user-exec.c
> to simplify cpu-target.c maintenance.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/tcg/user-exec.c |  92 +++++++++++++++++++++++++++++++++++++
>   cpu-target.c          | 102 +-----------------------------------------
>   2 files changed, 94 insertions(+), 100 deletions(-)
> 
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index c4454100ad7..e7e99a46087 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -19,6 +19,8 @@
>   #include "qemu/osdep.h"
>   #include "accel/tcg/cpu-ops.h"
>   #include "disas/disas.h"
> +#include "exec/vaddr.h"
> +#include "exec/tswap.h"
>   #include "exec/exec-all.h"
>   #include "tcg/tcg.h"
>   #include "qemu/bitops.h"
> @@ -35,6 +37,7 @@
>   #include "internal-common.h"
>   #include "internal-target.h"
>   #include "tb-internal.h"
> +#include "qemu.h"

What is required from *-user/qemu.h?
We really should not be including that in accel/tcg/.

> +            if (flags & PAGE_WRITE) {
> +                /* XXX: this code should not depend on lock_user */
> +                p = lock_user(VERIFY_WRITE, addr, l, 0);

Ah, here it is, complete with comment.

Indeed, I don't think lock_user is required at all.  page_get_flags() and g2h() are 
sufficient.

> +                mmap_lock();
> +                tb_invalidate_phys_range(addr, addr + l - 1);
> +                written = pwrite(fd, buf, l,
> +                                 (off_t)(uintptr_t)g2h_untagged(addr));
> +                mmap_unlock();

We probably want to own mmap_lock for the entire function.


r~

