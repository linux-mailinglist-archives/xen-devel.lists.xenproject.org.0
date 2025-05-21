Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AE9ABF913
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 17:20:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992074.1375861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlEf-0002Hu-J5; Wed, 21 May 2025 15:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992074.1375861; Wed, 21 May 2025 15:20:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlEf-0002Ct-FI; Wed, 21 May 2025 15:20:01 +0000
Received: by outflank-mailman (input) for mailman id 992074;
 Wed, 21 May 2025 15:20:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHlEe-0002Bn-St
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 15:20:00 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f756ceb-3657-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 17:20:00 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6020ff8d35dso757894a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 08:19:59 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005ae38870sm9134851a12.66.2025.05.21.08.19.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 08:19:58 -0700 (PDT)
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
X-Inumbo-ID: 0f756ceb-3657-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747840799; x=1748445599; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LBQolO/vz6Qh/YQxilMrAGEepxGKkYcAqOP86dFGug4=;
        b=FWMpNRbEGpjIo7xl3ofG0pZexNnepE1v1BDYxLyTJjLF7aHaXbKMNxdV3/T+vaLhfM
         weum8QZ+7J3ARI4FXaZnSGc73HzyMc9eG/7Td9wvwNOt/qdrkJ6k77ZoxaUn68rTTrBX
         LmaV8AJbejMKOHoX8mvsQqPknKc+CW6ZzXUCMXQ3Upy7/blGPCnjDjBKJ4k5Og6bxo7e
         qYVoWoQRff/b/xTNFWe+FqHZm/KqUR0DoItPKPIH6RNDcmKpaIgHkmCjFyLoEAwgBBSL
         J733DGQF/yCOzITR4WjMNZQFq9K+TBNePEf7NGlxkqRr18FxB4knS9LKYsORxBE48Ohw
         xK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747840799; x=1748445599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LBQolO/vz6Qh/YQxilMrAGEepxGKkYcAqOP86dFGug4=;
        b=mcfWE5BS6wPJ6N7CdbtjQ2cq94RE6LIaw+jV7jIkM7y4No1HFyjd150vC59yyoKFsy
         se0yBwqc9GWH446zO3L2v6KD5sa//2sNUvBaqiaBXL2NVE4nDzFfJwp3WdqEPjYtW/Io
         /z8NUQjhjBYL+7iAKA9m1ZO8JeYm5x/ROxw2wJP4zeTx6CGC4diAQHBaANr0OJ9leVvB
         xyH++1Zy2G4KPHZXA2bm/Lbr6d7aSeb8TwECisaEaEN/wfxhZVC2yVZW7Nq8WLwlX2WY
         f9EXNHNqmxUhp3chsmKqo5AhYNn+1F4yJLcOAIfhNYG9c1WZB4XvM0KVNyVg/Un2IoAa
         mY2g==
X-Forwarded-Encrypted: i=1; AJvYcCXIKI0eQwu3VxU6rTyqKcMyAHo8nVId4PZAEitrjXou/sqI4eU9Kxggav7iAffwTrjdrVRkP40nWng=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzK82fXb8tzOT5CIyQrssNw1gWXKUs1mLTcHfvFXKjpRNwotUck
	ZV9Y108t84sFlTPbyM9PpYPI834zhwf4diLy1g8i93bEwNjArh26Mm9xytmpHtB2Qg==
X-Gm-Gg: ASbGnctk4OjdSD1dvHqMd/ZoHT6QuVKY25X6sfQKvbFHBIdArrS7wH2lCIZHMUatCzZ
	O5yoXK+9DdnBDVP1qNk54PZDXoHsvYnaDggA8r2f0kvtbGYBouQBAhROkEJMaPnqmA+qn2UorOw
	bNuER/eZ0oMIZL1XqEfguG8KfChWtdSeXkDT9d6Z0q67AMFMPMa2avnA1uajmlDtqBguVqswVQQ
	S84TfFvYpoTizkSnN29AAGcTSV7TkmGP/W8jphYTTFwXP9VLPOiNbecVDpMmsv8bQNmFMWT5NCi
	HD78xNUrD1zZ5ig5F3M+DpsWUmBjVf7VknMUETrl/xs9hYU6G3Ltu5FFHpX/7Q==
X-Google-Smtp-Source: AGHT+IFg2Zmlam0zgMojQO1dsABATgDmftOoeSX7aL0z21wS9OtqdrC/SGY9WsCFlo3/4t9EpkCe2g==
X-Received: by 2002:a05:6402:3085:b0:600:a694:7a23 with SMTP id 4fb4d7f45d1cf-600a6947cecmr13850622a12.0.1747840799044;
        Wed, 21 May 2025 08:19:59 -0700 (PDT)
Message-ID: <bf892a80-fe3c-4163-b857-9d073a093451@suse.com>
Date: Wed, 21 May 2025 17:19:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/22] x86/include/asm/intel-txt.h: constants and
 accessors for TXT registers and heap
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>, =?UTF-8?Q?Mateusz_M=C3=B3wka?=
 <mateusz.mowka@intel.com>, trenchboot-devel@googlegroups.com,
 xen-devel@lists.xenproject.org
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
 <c049f4ced707769a630cbb8d38a617910279b404.1747155790.git.sergii.dmytruk@3mdeb.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c049f4ced707769a630cbb8d38a617910279b404.1747155790.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.05.2025 19:05, Sergii Dmytruk wrote:
> From: Krystian Hebel <krystian.hebel@3mdeb.com>
> 
> The file contains TXT register spaces base address, registers offsets,
> error codes and inline functions for accessing structures stored on
> TXT heap.
> 
> Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
> Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
> ---
>  xen/arch/x86/include/asm/intel-txt.h | 277 +++++++++++++++++++++++++++
>  xen/arch/x86/tboot.c                 |  20 +-
>  2 files changed, 279 insertions(+), 18 deletions(-)
>  create mode 100644 xen/arch/x86/include/asm/intel-txt.h
> 
> diff --git a/xen/arch/x86/include/asm/intel-txt.h b/xen/arch/x86/include/asm/intel-txt.h
> new file mode 100644
> index 0000000000..07be43f557
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/intel-txt.h
> @@ -0,0 +1,277 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#ifndef ASM__X86__INTEL_TXT_H
> +#define ASM__X86__INTEL_TXT_H
> +
> +/*
> + * TXT configuration registers (offsets from TXT_{PUB, PRIV}_CONFIG_REGS_BASE)
> + */
> +#define TXT_PUB_CONFIG_REGS_BASE        0xfed30000U
> +#define TXT_PRIV_CONFIG_REGS_BASE       0xfed20000U
> +
> +/*
> + * The same set of registers is exposed twice (with different permissions) and
> + * they are allocated continuously with page alignment.
> + */
> +#define NR_TXT_CONFIG_SIZE \
> +    (TXT_PUB_CONFIG_REGS_BASE - TXT_PRIV_CONFIG_REGS_BASE)

What does the NR_ in the identifier try to express?

> +/*
> + * Secure Launch defined OS/MLE TXT Heap table
> + */
> +struct txt_os_mle_data {
> +    uint32_t version;
> +    uint32_t reserved;
> +    uint64_t slrt;
> +    uint64_t txt_info;
> +    uint32_t ap_wake_block;
> +    uint32_t ap_wake_block_size;
> +    uint8_t mle_scratch[64];
> +} __packed;

This being x86-specific, what's the __packed intended to achieve here?

> +/*
> + * TXT specification defined BIOS data TXT Heap table
> + */
> +struct txt_bios_data {
> +    uint32_t version; /* Currently 5 for TPM 1.2 and 6 for TPM 2.0 */
> +    uint32_t bios_sinit_size;
> +    uint64_t reserved1;
> +    uint64_t reserved2;
> +    uint32_t num_logical_procs;
> +    /* Versions >= 3 && < 5 */
> +    uint32_t sinit_flags;
> +    /* Versions >= 5 with updates in version 6 */
> +    uint32_t mle_flags;
> +    /* Versions >= 4 */
> +    /* Ext Data Elements */
> +} __packed;

It does affect sizeof() here, which I'm unsure is going to matter.

> +/*
> + * TXT specification defined OS/SINIT TXT Heap table
> + */
> +struct txt_os_sinit_data {
> +    uint32_t version;       /* Currently 6 for TPM 1.2 and 7 for TPM 2.0 */
> +    uint32_t flags;         /* Reserved in version 6 */
> +    uint64_t mle_ptab;
> +    uint64_t mle_size;
> +    uint64_t mle_hdr_base;
> +    uint64_t vtd_pmr_lo_base;
> +    uint64_t vtd_pmr_lo_size;
> +    uint64_t vtd_pmr_hi_base;
> +    uint64_t vtd_pmr_hi_size;
> +    uint64_t lcp_po_base;
> +    uint64_t lcp_po_size;
> +    uint32_t capabilities;
> +    /* Version = 5 */
> +    uint64_t efi_rsdt_ptr;  /* RSD*P* in versions >= 6 */
> +    /* Versions >= 6 */
> +    /* Ext Data Elements */
> +} __packed;

It does really affect the layout here, so can't be removed in this case.

> +/*
> + * Functions to extract data from the Intel TXT Heap Memory. The layout
> + * of the heap is as follows:
> + *  +------------------------------------+
> + *  | Size of Bios Data table (uint64_t) |
> + *  +------------------------------------+
> + *  | Bios Data table                    |
> + *  +------------------------------------+
> + *  | Size of OS MLE table (uint64_t)    |
> + *  +------------------------------------+
> + *  | OS MLE table                       |
> + *  +--------------------------------    +
> + *  | Size of OS SINIT table (uint64_t)  |
> + *  +------------------------------------+
> + *  | OS SINIT table                     |
> + *  +------------------------------------+
> + *  | Size of SINIT MLE table (uint64_t) |
> + *  +------------------------------------+
> + *  | SINIT MLE table                    |
> + *  +------------------------------------+
> + *
> + *  NOTE: the table size fields include the 8 byte size field itself.
> + */
> +static inline uint64_t txt_bios_data_size(void *heap)

Here, below, and in general: Please try to have code be const-correct, i.e.
use pointers-to-const wherever applicable.

> +{
> +    return *((uint64_t *)heap) - sizeof(uint64_t);

For readability it generally helps if excess parentheses like the ones here
are omitted.

> +}
> +
> +static inline void *txt_bios_data_start(void *heap)
> +{
> +    return heap + sizeof(uint64_t);
> +}
> +
> +static inline uint64_t txt_os_mle_data_size(void *heap)
> +{
> +    return *((uint64_t *)(txt_bios_data_start(heap) +
> +                          txt_bios_data_size(heap))) -
> +        sizeof(uint64_t);

This line wants indenting a little further, such that the"sizeof" aligns
with the start of the expression. (Same elsewhere below.)

Jan

