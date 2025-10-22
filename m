Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C59B8BFC631
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 16:07:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148225.1480369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZV7-00064h-66; Wed, 22 Oct 2025 14:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148225.1480369; Wed, 22 Oct 2025 14:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZV7-00062k-3P; Wed, 22 Oct 2025 14:07:41 +0000
Received: by outflank-mailman (input) for mailman id 1148225;
 Wed, 22 Oct 2025 14:07:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pHug=47=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBZV5-00062e-VC
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 14:07:40 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 774317d0-af50-11f0-9d15-b5c5bf9af7f9;
 Wed, 22 Oct 2025 16:07:38 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4710665e7deso27247495e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 07:07:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c4369b3esm44564565e9.13.2025.10.22.07.07.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 07:07:37 -0700 (PDT)
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
X-Inumbo-ID: 774317d0-af50-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761142057; x=1761746857; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Arp0s5Cl2gOBmoJutmdZpomDxecLvy3YN6J3GtqPhyc=;
        b=XBADqgfIbpZvhvLgPctRlp33RcIK5FvffiGFap+VQtmfOyi9yX7jYY/bmi3N+HNe6C
         r476uOjhguWVd0CtPVzzblfSidLDVQybQkZ7t7qen+COoV71KnK0YycJGTIaDGX3TqOE
         ZnSPgyekia4+ljeRBR8iXz8z062kSRuUCEfvX9xQ7NLQ1L1piRq0jKGg+rM7XGAAXoiP
         vrg0o2o+jGA6kF742ZB7+on2I1xH7Tia6gFtSBAmGbYK4dPkLE6arl/106Chs8V4LR9R
         o3+bm9glQggvXccK+vYSMeogckU+tvfWq+0kuVylL83qObr8CZWdRv2WhwR+YWxBvv6T
         GyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142057; x=1761746857;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Arp0s5Cl2gOBmoJutmdZpomDxecLvy3YN6J3GtqPhyc=;
        b=E2uTr0+WCwo0jkbJaZT4H/xho1iCXuqWoqfatTPgLEmXn1shjS0GkDgvfb2pphcGru
         pIaIVOmePSWF/Dh2kPjbDocY98pdCDUqgWpo0bIMN5DTac4gkSWfl1tYjHdQF2/vEfn5
         sBJjX75Ql81/vLhTwsoqPzAmXnUIMOLPLKZUT5190Idto1Sa7M34VdPrv0yx0xHlhDN4
         fM4JAoW7LFKs19TaTHsPWDUebJiKAoAFlS160XLJq1b62Zu8kmZ0rk46VGgrNzDak9/X
         yGPevttomjyidwf8fRUX2qrhMKfbaOXH/IF8GA4E5kSZR2nGRVsD7+dZVctcoMHVITy8
         xBkg==
X-Forwarded-Encrypted: i=1; AJvYcCVGGIzlcdNGGu9+jVQTeXkmLULjEejX5p6pRt+xwFpksiVOXJKnS0e3Hf1FyKs7Snt2wmimvx1SKb8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyU/lIkWoI/MRGzXLwmqg3lGpl4PVNy1cHJlhl5vv8lzaazwr6U
	gHxVNg1fhG+PcsGIINZqaUEIytkRnZ5F728yVhKTHpQrbb1fTGe/viFdjBuXZ6/hNw==
X-Gm-Gg: ASbGnctLDGx3UbVF/4+++myQFS4dXivv7QmwiRu56g5gDeeO+7NrXZ/U4n3nyOFSYCB
	g8daSpljYPImEqns+fLNLyfG7/TJN+IEbXAgVJVAc8NOweswWwrkOYiHRjorEHm4OO57yD//HlS
	mbZoBTqQqCl/vXgPvp925aXrSWEpLvcJdrC26DWoinUd9Y8v8pgACqnlYFLMVOul5QCKxsBL8cB
	zaDrz+9xNcJrqOBF1o4QgRf1SRbf8+y9KKYeC2n3Z0Wa6SmvQ5QpTbLvtnVAMKTfIq8mynPMg+Z
	5WqJGTPZbeNzVZI6jL4ubFOgWVF0CofIGOASPh7GZB1UiJ75a5QLBBrfIp0QCmrOE7RU/HZAICx
	1Ij9RR0rDxFPa6mM3RNiX8uS84fSO+yfKh/Cuai5qiaPvxAm28azK4t4QuadZ1rDsu97NQ+y461
	vRzabqufAdRiXTX1o46+aQWPanQWlyJ/idPNKrsQz5hBcpKNbJD+jGI+1CSRFC
X-Google-Smtp-Source: AGHT+IFN69cLXP9YTn0LHyQLRk88mBMJ47wXU/+Zdx+weLlASGQLTiBpeKLAF1+BQ9nX+q+CXAfrDg==
X-Received: by 2002:a05:600d:4390:b0:471:b5d:2db9 with SMTP id 5b1f17b1804b1-471179119ccmr97133205e9.21.1761142057427;
        Wed, 22 Oct 2025 07:07:37 -0700 (PDT)
Message-ID: <45ad9ee7-e4a4-4f31-b8d0-723a97d7f45b@suse.com>
Date: Wed, 22 Oct 2025 16:07:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/22] x86/tpm.c: code for early hashing and extending
 PCRs (for TPM1.2)
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <0c249037eeda4809b565a55c6473bb21cdd0304e.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <0c249037eeda4809b565a55c6473bb21cdd0304e.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.2025 15:17, Sergii Dmytruk wrote:
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/tpm.h
> @@ -0,0 +1,19 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Copyright (c) 2022-2025 3mdeb Sp. z o.o. All rights reserved.
> + */
> +
> +#ifndef X86_TPM_H
> +#define X86_TPM_H
> +
> +#include <xen/types.h>
> +
> +#define TPM_TIS_BASE  0xfed40000U
> +#define TPM_TIS_SIZE  0x00010000U
> +
> +void tpm_hash_extend(unsigned loc, unsigned pcr, const uint8_t *buf,
> +                     unsigned size, uint32_t type, const uint8_t *log_data,
> +                     unsigned log_data_size);

Here and elsewhere: We prefer "unsigned int" over just "unsigned".

> --- /dev/null
> +++ b/xen/arch/x86/tpm.c
> @@ -0,0 +1,437 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Copyright (c) 2022-2025 3mdeb Sp. z o.o. All rights reserved.
> + */
> +
> +#include <xen/sha1.h>
> +#include <xen/string.h>
> +#include <xen/types.h>
> +#include <asm/intel-txt.h>
> +#include <asm/slaunch.h>
> +#include <asm/tpm.h>
> +
> +#ifdef __EARLY_SLAUNCH__
> +
> +#ifdef __va
> +#error "__va defined in non-paged mode!"
> +#endif
> +
> +#define __va(x)     _p(x)
> +
> +/* Implementation of slaunch_get_slrt() for early TPM code. */
> +static uint32_t slrt_location;
> +struct slr_table *slaunch_get_slrt(void)
> +{
> +    return __va(slrt_location);
> +}
> +
> +/*
> + * The code is being compiled as a standalone binary without linking to any
> + * other part of Xen.  Providing implementation of builtin functions in this
> + * case is necessary if compiler chooses to not use an inline builtin.
> + */
> +void *(memcpy)(void *dest, const void *src, size_t n)
> +{
> +    const uint8_t *s = src;
> +    uint8_t *d = dest;
> +
> +    while ( n-- )
> +        *d++ = *s++;
> +
> +    return dest;
> +}
> +
> +#else   /* __EARLY_SLAUNCH__ */
> +
> +#include <xen/mm.h>
> +#include <xen/pfn.h>
> +
> +#endif  /* __EARLY_SLAUNCH__ */
> +
> +#define TPM_LOC_REG(loc, reg)   (0x1000 * (loc) + (reg))
> +
> +#define TPM_ACCESS_(x)          TPM_LOC_REG(x, 0x00)
> +#define ACCESS_REQUEST_USE       (1 << 1)
> +#define ACCESS_ACTIVE_LOCALITY   (1 << 5)
> +#define TPM_INTF_CAPABILITY_(x) TPM_LOC_REG(x, 0x14)
> +#define INTF_VERSION_MASK        0x70000000
> +#define TPM_STS_(x)             TPM_LOC_REG(x, 0x18)
> +#define TPM_FAMILY_MASK          0x0C000000
> +#define STS_DATA_AVAIL           (1 << 4)
> +#define STS_TPM_GO               (1 << 5)
> +#define STS_COMMAND_READY        (1 << 6)
> +#define STS_VALID                (1 << 7)
> +#define TPM_DATA_FIFO_(x)       TPM_LOC_REG(x, 0x24)
> +
> +#define swap16(x)       __builtin_bswap16(x)
> +#define swap32(x)       __builtin_bswap32(x)
> +
> +static inline volatile uint32_t tis_read32(unsigned reg)
> +{
> +    return *(volatile uint32_t *)__va(TPM_TIS_BASE + reg);
> +}
> +
> +static inline volatile uint8_t tis_read8(unsigned reg)
> +{
> +    return *(volatile uint8_t *)__va(TPM_TIS_BASE + reg);
> +}
> +
> +static inline void tis_write8(unsigned reg, uint8_t val)
> +{
> +    *(volatile uint8_t *)__va(TPM_TIS_BASE + reg) = val;
> +}
> +
> +static inline void request_locality(unsigned loc)
> +{
> +    tis_write8(TPM_ACCESS_(loc), ACCESS_REQUEST_USE);
> +    /* Check that locality was actually activated. */
> +    while ( (tis_read8(TPM_ACCESS_(loc)) & ACCESS_ACTIVE_LOCALITY) == 0 );

Here and below - please put such semicolons on a separate line, to make more
recognizable that no loop body follows. Also generally we prefer ! over == 0
for such checks.

> +}
> +
> +static inline void relinquish_locality(unsigned loc)
> +{
> +    tis_write8(TPM_ACCESS_(loc), ACCESS_ACTIVE_LOCALITY);
> +}
> +
> +static void send_cmd(unsigned loc, uint8_t *buf, unsigned i_size,
> +                     unsigned *o_size)
> +{
> +    /*
> +     * Value of "data available" bit counts only when "valid" field is set as
> +     * well.
> +     */
> +    const unsigned data_avail = STS_VALID | STS_DATA_AVAIL;
> +
> +    unsigned i;
> +
> +    /* Make sure TPM can accept a command. */
> +    if ( (tis_read8(TPM_STS_(loc)) & STS_COMMAND_READY) == 0 )
> +    {
> +        /* Abort current command. */
> +        tis_write8(TPM_STS_(loc), STS_COMMAND_READY);
> +        /* Wait until TPM is ready for a new one. */
> +        while ( (tis_read8(TPM_STS_(loc)) & STS_COMMAND_READY) == 0 );
> +    }
> +
> +    for ( i = 0; i < i_size; i++ )
> +        tis_write8(TPM_DATA_FIFO_(loc), buf[i]);
> +
> +    tis_write8(TPM_STS_(loc), STS_TPM_GO);
> +
> +    /* Wait for the first byte of response. */
> +    while ( (tis_read8(TPM_STS_(loc)) & data_avail) != data_avail);

Here you properly follow the comment at the top of the function, while ...

> +    for ( i = 0; i < *o_size && tis_read8(TPM_STS_(loc)) & data_avail; i++ )

... here you don't. Why?

> +        buf[i] = tis_read8(TPM_DATA_FIFO_(loc));
> +
> +    if ( i < *o_size )
> +        *o_size = i;

Is there any real need for this assignment to be conditional?

> +    tis_write8(TPM_STS_(loc), STS_COMMAND_READY);
> +}
> +
> +static inline bool is_tpm12(void)
> +{
> +    /*
> +     * If one of these conditions is true:
> +     *  - INTF_CAPABILITY_x.interfaceVersion is 0 (TIS <= 1.21)
> +     *  - INTF_CAPABILITY_x.interfaceVersion is 2 (TIS == 1.3)
> +     *  - STS_x.tpmFamily is 0
> +     * we're dealing with TPM1.2.
> +     */
> +    uint32_t intf_version = tis_read32(TPM_INTF_CAPABILITY_(0))
> +                          & INTF_VERSION_MASK;

Nit: The & wants to move to the previous line and indentation of the
continuation line wants to increase by 2.

> +    return (intf_version == 0x00000000 || intf_version == 0x20000000 ||
> +            (tis_read32(TPM_STS_(0)) & TPM_FAMILY_MASK) == 0);
> +}
> +
> +/****************************** TPM1.2 specific *******************************/
> +#define TPM_ORD_Extend              0x00000014
> +#define TPM_ORD_SHA1Start           0x000000A0
> +#define TPM_ORD_SHA1Update          0x000000A1
> +#define TPM_ORD_SHA1CompleteExtend  0x000000A3
> +
> +#define TPM_TAG_RQU_COMMAND         0x00C1
> +#define TPM_TAG_RSP_COMMAND         0x00C4
> +
> +/* All fields of following structs are big endian. */
> +struct tpm_cmd_hdr {
> +    uint16_t    tag;
> +    uint32_t    paramSize;
> +    uint32_t    ordinal;
> +} __packed;
> +
> +struct tpm_rsp_hdr {
> +    uint16_t    tag;
> +    uint32_t    paramSize;
> +    uint32_t    returnCode;
> +} __packed;
> +
> +struct extend_cmd {
> +    struct tpm_cmd_hdr h;
> +    uint32_t pcrNum;
> +    uint8_t inDigest[SHA1_DIGEST_SIZE];
> +} __packed;
> +
> +struct extend_rsp {
> +    struct tpm_rsp_hdr h;
> +    uint8_t outDigest[SHA1_DIGEST_SIZE];
> +} __packed;
> +
> +struct sha1_start_cmd {
> +    struct tpm_cmd_hdr h;
> +} __packed;
> +
> +struct sha1_start_rsp {
> +    struct tpm_rsp_hdr h;
> +    uint32_t maxNumBytes;
> +} __packed;
> +
> +struct sha1_update_cmd {
> +    struct tpm_cmd_hdr h;
> +    uint32_t numBytes;          /* Must be a multiple of 64 */
> +    uint8_t hashData[];
> +} __packed;
> +
> +struct sha1_update_rsp {
> +    struct tpm_rsp_hdr h;
> +} __packed;
> +
> +struct sha1_complete_extend_cmd {
> +    struct tpm_cmd_hdr h;
> +    uint32_t pcrNum;
> +    uint32_t hashDataSize;      /* 0-64, inclusive */
> +    uint8_t hashData[];
> +} __packed;
> +
> +struct sha1_complete_extend_rsp {
> +    struct tpm_rsp_hdr h;
> +    uint8_t hashValue[SHA1_DIGEST_SIZE];
> +    uint8_t outDigest[SHA1_DIGEST_SIZE];
> +} __packed;
> +
> +struct TPM12_PCREvent {
> +    uint32_t PCRIndex;
> +    uint32_t Type;
> +    uint8_t Digest[SHA1_DIGEST_SIZE];
> +    uint32_t Size;
> +    uint8_t Data[];
> +};
> +
> +struct txt_ev_log_container_12 {
> +    char        Signature[20];      /* "TXT Event Container", null-terminated */
> +    uint8_t     Reserved[12];
> +    uint8_t     ContainerVerMajor;
> +    uint8_t     ContainerVerMinor;
> +    uint8_t     PCREventVerMajor;
> +    uint8_t     PCREventVerMinor;
> +    uint32_t    ContainerSize;      /* Allocated size */
> +    uint32_t    PCREventsOffset;
> +    uint32_t    NextEventOffset;
> +    struct TPM12_PCREvent   PCREvents[];
> +};
> +
> +#ifdef __EARLY_SLAUNCH__
> +/*
> + * TPM1.2 is required to support commands of up to 1101 bytes, vendors rarely
> + * go above that. Limit maximum size of block of data to be hashed to 1024.
> + */
> +#define MAX_HASH_BLOCK      1024
> +#define CMD_RSP_BUF_SIZE    (sizeof(struct sha1_update_cmd) + MAX_HASH_BLOCK)
> +
> +union cmd_rsp {
> +    struct sha1_start_cmd start_c;
> +    struct sha1_start_rsp start_r;
> +    struct sha1_update_cmd update_c;
> +    struct sha1_update_rsp update_r;
> +    struct sha1_complete_extend_cmd finish_c;
> +    struct sha1_complete_extend_rsp finish_r;
> +    uint8_t buf[CMD_RSP_BUF_SIZE];
> +};
> +
> +/* Returns true on success. */
> +static bool tpm12_hash_extend(unsigned loc, const uint8_t *buf, unsigned size,
> +                              unsigned pcr, uint8_t *out_digest)
> +{
> +    union cmd_rsp cmd_rsp;
> +    unsigned max_bytes = MAX_HASH_BLOCK;
> +    unsigned o_size = sizeof(cmd_rsp);
> +    bool success = false;
> +
> +    request_locality(loc);
> +
> +    cmd_rsp.start_c = (struct sha1_start_cmd) {
> +        .h.tag = swap16(TPM_TAG_RQU_COMMAND),
> +        .h.paramSize = swap32(sizeof(struct sha1_start_cmd)),

While here it may be viewed as on the edge, ...

> +        .h.ordinal = swap32(TPM_ORD_SHA1Start),
> +    };
> +
> +    send_cmd(loc, cmd_rsp.buf, sizeof(struct sha1_start_cmd), &o_size);

... here and ...

> +    if ( o_size < sizeof(struct sha1_start_rsp) )

... here (and elsewhere) you would better use sizeof(<expression>), to make
the connection there more clear.

> +        goto error;
> +
> +    if ( max_bytes > swap32(cmd_rsp.start_r.maxNumBytes) )
> +        max_bytes = swap32(cmd_rsp.start_r.maxNumBytes);
> +
> +    while ( size > 64 )
> +    {
> +        if ( size < max_bytes )
> +            max_bytes = size & ~(64 - 1);

ROUNDDOWN(size, 64)

> +        o_size = sizeof(cmd_rsp);
> +
> +        cmd_rsp.update_c = (struct sha1_update_cmd){

Please, at least within a single patch, be consistent about whether there is
a blank between ) and {.

> +            .h.tag = swap16(TPM_TAG_RQU_COMMAND),
> +            .h.paramSize = swap32(sizeof(struct sha1_update_cmd) + max_bytes),
> +            .h.ordinal = swap32(TPM_ORD_SHA1Update),
> +            .numBytes = swap32(max_bytes),
> +        };
> +        memcpy(cmd_rsp.update_c.hashData, buf, max_bytes);
> +
> +        send_cmd(loc, cmd_rsp.buf, sizeof(struct sha1_update_cmd) + max_bytes,
> +                 &o_size);
> +        if ( o_size < sizeof(struct sha1_update_rsp) )
> +            goto error;
> +
> +        size -= max_bytes;
> +        buf += max_bytes;
> +    }
> +
> +    o_size = sizeof(cmd_rsp);
> +
> +    cmd_rsp.finish_c = (struct sha1_complete_extend_cmd) {
> +        .h.tag = swap16(TPM_TAG_RQU_COMMAND),
> +        .h.paramSize = swap32(sizeof(struct sha1_complete_extend_cmd) + size),
> +        .h.ordinal = swap32(TPM_ORD_SHA1CompleteExtend),
> +        .pcrNum = swap32(pcr),
> +        .hashDataSize = swap32(size),
> +    };
> +    memcpy(cmd_rsp.finish_c.hashData, buf, size);
> +
> +    send_cmd(loc, cmd_rsp.buf, sizeof(struct sha1_complete_extend_cmd) + size,
> +             &o_size);
> +    if ( o_size < sizeof(struct sha1_complete_extend_rsp) )
> +        goto error;
> +
> +    if ( out_digest != NULL )
> +        memcpy(out_digest, cmd_rsp.finish_r.hashValue, SHA1_DIGEST_SIZE);
> +
> +    success = true;
> +
> +error:

Nit: Labels indented by at least one blank please.

> +    relinquish_locality(loc);
> +    return success;
> +}
> +
> +#else
> +
> +union cmd_rsp {
> +    struct extend_cmd extend_c;
> +    struct extend_rsp extend_r;
> +};
> +
> +/* Returns true on success. */
> +static bool tpm12_hash_extend(unsigned loc, const uint8_t *buf, unsigned size,
> +                              unsigned pcr, uint8_t *out_digest)
> +{
> +    union cmd_rsp cmd_rsp;
> +    unsigned o_size = sizeof(cmd_rsp);
> +
> +    sha1_hash(out_digest, buf, size);
> +
> +    request_locality(loc);
> +
> +    cmd_rsp.extend_c = (struct extend_cmd) {
> +        .h.tag = swap16(TPM_TAG_RQU_COMMAND),
> +        .h.paramSize = swap32(sizeof(struct extend_cmd)),
> +        .h.ordinal = swap32(TPM_ORD_Extend),
> +        .pcrNum = swap32(pcr),
> +    };
> +
> +    memcpy(cmd_rsp.extend_c.inDigest, out_digest, SHA1_DIGEST_SIZE);
> +
> +    send_cmd(loc, (uint8_t *)&cmd_rsp, sizeof(struct extend_cmd), &o_size);
> +
> +    relinquish_locality(loc);
> +
> +    return (o_size >= sizeof(struct extend_rsp));
> +}
> +
> +#endif /* __EARLY_SLAUNCH__ */
> +
> +static void *create_log_event12(struct txt_ev_log_container_12 *evt_log,
> +                                uint32_t evt_log_size, uint32_t pcr,
> +                                uint32_t type, const uint8_t *data,
> +                                unsigned data_size)
> +{
> +    struct TPM12_PCREvent *new_entry;
> +
> +    new_entry = (void *)(((uint8_t *)evt_log) + evt_log->NextEventOffset);

   new_entry = (void *)evt_log + evt_log->NextEventOffset;

> +    /*
> +     * Check if there is enough space left for new entry.
> +     * Note: it is possible to introduce a gap in event log if entry with big
> +     * data_size is followed by another entry with smaller data. Maybe we should
> +     * cap the event log size in such case?
> +     */
> +    if ( evt_log->NextEventOffset + sizeof(struct TPM12_PCREvent) + data_size
> +         > evt_log_size )

Nit: Operator placement again.

> +        return NULL;
> +
> +    evt_log->NextEventOffset += sizeof(struct TPM12_PCREvent) + data_size;
> +
> +    new_entry->PCRIndex = pcr;
> +    new_entry->Type = type;
> +    new_entry->Size = data_size;
> +
> +    if ( data && data_size > 0 )
> +        memcpy(new_entry->Data, data, data_size);

What about "data && !data_size" or "!data && data_size"? Are these legal
inputs that are fine to ignore? Otherwise - why the if()?

> +    return new_entry->Digest;
> +}
> +
> +/************************** end of TPM1.2 specific ****************************/
> +
> +void tpm_hash_extend(unsigned loc, unsigned pcr, const uint8_t *buf,
> +                     unsigned size, uint32_t type, const uint8_t *log_data,
> +                     unsigned log_data_size)
> +{
> +    void *evt_log_addr;
> +    uint32_t evt_log_size;
> +
> +    find_evt_log(slaunch_get_slrt(), &evt_log_addr, &evt_log_size);
> +    evt_log_addr = __va((uintptr_t)evt_log_addr);
> +
> +    if ( is_tpm12() )
> +    {
> +        uint8_t sha1_digest[SHA1_DIGEST_SIZE];
> +
> +        struct txt_ev_log_container_12 *evt_log = evt_log_addr;
> +        void *entry_digest = create_log_event12(evt_log, evt_log_size, pcr,
> +                                                type, log_data, log_data_size);
> +
> +        /* We still need to write computed hash somewhere. */
> +        if ( entry_digest == NULL )
> +            entry_digest = sha1_digest;
> +
> +        if ( !tpm12_hash_extend(loc, buf, size, pcr, entry_digest) )
> +        {
> +#ifndef __EARLY_SLAUNCH__
> +            printk(XENLOG_ERR "Extending PCR%u failed\n", pcr);
> +#endif
> +        }
> +    }

And implicitly "else { ignore everything }"?

> +}
> +
> +#ifdef __EARLY_SLAUNCH__
> +void asmlinkage tpm_extend_mbi(uint32_t *mbi, uint32_t slrt_pa)

Pointer to const please, and then make sure ...

> +{
> +    /* Need this to implement slaunch_get_slrt() for early TPM code. */
> +    slrt_location = slrt_pa;
> +
> +    /* MBI starts with uint32_t total_size. */
> +    tpm_hash_extend(DRTM_LOC, DRTM_DATA_PCR, (uint8_t *)mbi, *mbi,

... not to cast away const-ness here.

Jan

