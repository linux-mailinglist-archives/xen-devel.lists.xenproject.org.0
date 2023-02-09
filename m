Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A101C68FC3B
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 01:54:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492077.761481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPvCk-0006oT-Gd; Thu, 09 Feb 2023 00:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492077.761481; Thu, 09 Feb 2023 00:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPvCk-0006lj-DP; Thu, 09 Feb 2023 00:54:26 +0000
Received: by outflank-mailman (input) for mailman id 492077;
 Thu, 09 Feb 2023 00:54:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UnIs=6F=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pPvCj-0006ld-FE
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 00:54:25 +0000
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [2607:f8b0:4864:20::e2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ae180d4-a814-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 01:54:23 +0100 (CET)
Received: by mail-vs1-xe2a.google.com with SMTP id g8so524075vso.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Feb 2023 16:54:23 -0800 (PST)
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
X-Inumbo-ID: 4ae180d4-a814-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsyKuqauJPKtpDsmsifibQRF8pa1HwPAIGcTuEkm8GM=;
        b=nGF9+JemXquELKcMWUSqEpfTQU/jEcZmRmmFHx3+io/OZRVeuQKJRBxODLZxIMRKiD
         FioY8VGcOHtfbFzNAOIYbur7vdWNqUTlVc0XscqyK/5BQMxU4RX88eZgPEayw52hn/Cs
         PRt7oUdJWbniE9PFG8T0LoQaUYGZkPSYrAaTs+Mh0Vtz2N3vHDJB2WtyapVLIeYoPSh5
         RtWTCWTN9yAMytR/76PwWCU20zThXWeJ6ddizIpPh3R172OZNp2sh77M1AeSaWPH9kti
         ayf9ZyiviPRnk9PqI8DZX9a6uw+lSgU1mwcyGtJGiTbijNZtSDw5KYdVsZJueub251LL
         JUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZsyKuqauJPKtpDsmsifibQRF8pa1HwPAIGcTuEkm8GM=;
        b=tC4reQYSb0klyU0H+mjG9Q0/GBKBBBVZ8kPmmmQ41OOWx9M/Y0I+n9dwJgRrCaQwAy
         6hkWOOAvQjQe3D2+axKVnkCi7jaHU3eXvVQ7V06HAx20xsUNhyVsKk/rr9f5N2x+t09m
         RMp0vJ0zz+4KECvg/QuuGk7tzIJpO1C6/KSBKXQhij0OOsHHfl9HQtZNhjq//YIuVBnj
         uKW3IojBqWdIEDez2iRmvqjFgl4nAVQS4svThiHIwxx3ehH+t7Pnzz7Z3JNlTG4fNQMB
         j3XZWeos7rxOEqihh0eDYzeUlA/FkfqndfmeHp4g4NNpKxCZAkbJnKUXTjycxqzNIzll
         cwSQ==
X-Gm-Message-State: AO0yUKXSXpNIjFeNuv34tOkiUdsIoGLgwmG8m+Jd0gZokuMbY7UZGXYb
	/5pLcjTrv0m59k8ZcRMPbAlz9nCzEKLfBQitMwU=
X-Google-Smtp-Source: AK7set/BPQ9bRHYqNJRo3P74L1kS/U7/nG7rAVvr5dWI5SX326PwpvVuaa0KDJ/Pzrn44BxoGddxxN2wz+Xc3RH6YnQ=
X-Received: by 2002:a67:a208:0:b0:3ee:4ef8:45d3 with SMTP id
 l8-20020a67a208000000b003ee4ef845d3mr1934042vse.64.1675904062319; Wed, 08 Feb
 2023 16:54:22 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675779308.git.oleksii.kurochko@gmail.com> <94a46f35bc9387c699d9d24b1c792b54ec290255.1675779308.git.oleksii.kurochko@gmail.com>
In-Reply-To: <94a46f35bc9387c699d9d24b1c792b54ec290255.1675779308.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Feb 2023 10:53:56 +1000
Message-ID: <CAKmqyKNH6K7Nh45Ad3AcBaYkg-H7OvsfOCE6nT5CixMvATpazA@mail.gmail.com>
Subject: Re: [PATCH v3 04/14] xen/riscv: add <asm/csr.h> header
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 8, 2023 at 12:47 AM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> The following changes were made in comparison with <asm/csr.h> from
> Linux:
>   * remove all defines as they are defined in riscv_encoding.h
>   * leave only csr_* macros
>
> Origin: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ d2d11f342b17
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changes in V3:
>   - Update origin to https://git.kernel.org/...
> ---
> Changes in V2:
>   - Minor refactoring mentioned in the commit message, switch tabs to
>     spaces and refactor things around __asm__ __volatile__.
>   - Update the commit message and add "Origin:" tag.
> ---
>  xen/arch/riscv/include/asm/csr.h | 84 ++++++++++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 xen/arch/riscv/include/asm/csr.h
>
> diff --git a/xen/arch/riscv/include/asm/csr.h b/xen/arch/riscv/include/asm/csr.h
> new file mode 100644
> index 0000000000..4275cf6515
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/csr.h
> @@ -0,0 +1,84 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright (C) 2015 Regents of the University of California
> + */
> +
> +#ifndef _ASM_RISCV_CSR_H
> +#define _ASM_RISCV_CSR_H
> +
> +#include <asm/asm.h>
> +#include <xen/const.h>
> +#include <asm/riscv_encoding.h>
> +
> +#ifndef __ASSEMBLY__
> +
> +#define csr_read(csr)                                           \
> +({                                                              \
> +    register unsigned long __v;                                 \
> +    __asm__ __volatile__ (  "csrr %0, " __ASM_STR(csr)          \
> +                            : "=r" (__v)                        \
> +                            : : "memory" );                     \
> +    __v;                                                        \
> +})
> +
> +#define csr_write(csr, val)                                     \
> +({                                                              \
> +    unsigned long __v = (unsigned long)(val);                   \
> +    __asm__ __volatile__ (  "csrw " __ASM_STR(csr) ", %0"       \
> +                            : /* no outputs */                  \
> +                            : "rK" (__v)                        \
> +                            : "memory" );                       \
> +})
> +
> +#define csr_swap(csr, val)                                      \
> +({                                                              \
> +    unsigned long __v = (unsigned long)(val);                   \
> +    __asm__ __volatile__ (  "csrrw %0, " __ASM_STR(csr) ", %1"  \
> +                            : "=r" (__v)                        \
> +                            : "rK" (__v)                        \
> +                            : "memory" );                       \
> +    __v;                                                        \
> +})
> +
> +#define csr_read_set(csr, val)                                  \
> +({                                                              \
> +    unsigned long __v = (unsigned long)(val);                   \
> +    __asm__ __volatile__ (  "csrrs %0, " __ASM_STR(csr) ", %1"  \
> +                            : "=r" (__v)                        \
> +                            : "rK" (__v)                        \
> +                            : "memory" );                       \
> +    __v;                                                        \
> +})
> +
> +#define csr_set(csr, val)                                       \
> +({                                                              \
> +    unsigned long __v = (unsigned long)(val);                   \
> +    __asm__ __volatile__ (  "csrs " __ASM_STR(csr) ", %0"       \
> +                            : /* no outputs */                  \
> +                            : "rK" (__v)                        \
> +                            : "memory" );                       \
> +})
> +
> +#define csr_read_clear(csr, val)                                \
> +({                                                              \
> +    unsigned long __v = (unsigned long)(val);                   \
> +    __asm__ __volatile__ (  "csrrc %0, " __ASM_STR(csr) ", %1"  \
> +                            : "=r" (__v)                        \
> +                            : "rK" (__v)                        \
> +                            : "memory" );                       \
> +    __v;                                                        \
> +})
> +
> +#define csr_clear(csr, val)                                     \
> +({                                                              \
> +    unsigned long __v = (unsigned long)(val);                   \
> +    __asm__ __volatile__ (  "csrc " __ASM_STR(csr) ", %0"       \
> +                            : /*no outputs */                   \
> +                            : "rK" (__v)                        \
> +                            : "memory" );                       \
> +})
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* _ASM_RISCV_CSR_H */
> --
> 2.39.0
>
>

