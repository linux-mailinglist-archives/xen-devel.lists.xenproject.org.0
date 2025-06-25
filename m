Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75739AE7F39
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 12:27:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024658.1400490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUNLw-0005eo-Ap; Wed, 25 Jun 2025 10:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024658.1400490; Wed, 25 Jun 2025 10:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUNLw-0005dN-7y; Wed, 25 Jun 2025 10:27:40 +0000
Received: by outflank-mailman (input) for mailman id 1024658;
 Wed, 25 Jun 2025 10:27:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QoV+=ZI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUNLu-0005SS-CG
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 10:27:38 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03e7e08f-51af-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 12:27:37 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a4f72cba73so427613f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 03:27:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f542708esm1434165a91.30.2025.06.25.03.27.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 03:27:36 -0700 (PDT)
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
X-Inumbo-ID: 03e7e08f-51af-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750847257; x=1751452057; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SVwUm0TQgfV34+E1Tvun/X7VE2A8Ltp0UFTVKHj/Upc=;
        b=b52xIpLDemwdTXMxO59Ll7oVZQGb7hDLid5bJwicb3kAcXnQKgGPaWJ4ZD2iPsMD+F
         SOdW3UKMnqcWsAWk5KMWywZSRhIq6SnuWhNXC0v2dhz42PtFuqBd3H4pZem2zXO1//1w
         kPB9RUA1GELrZhYvf9+90Wb+cYxv0jgQnbZ2/N7BGUndtSSR0PvoxKoWfTuIsVIUomgr
         G1PaI2LZDJL/qAZWWjv8pYQ9nU5IB+iZ3e7LOsZmIx6xDG9qEK9/sRr/KIQ3o/GLc24O
         b6ZM6/KjLSBOYUzgCf5KiubWIbDTwQ21hVXt5LXmQSH/20eaNvWb6L5Ouohsd3zJyVic
         wFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847257; x=1751452057;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SVwUm0TQgfV34+E1Tvun/X7VE2A8Ltp0UFTVKHj/Upc=;
        b=d5F66QAaccLX5gLMrohrRIS5qMW3ljWtDyx+3EZJ/dHBrI5dlU8CW5ucqLG9WN6tfR
         JkSzpbHyUtp0t+OcKeCLyVwA262NLpUMapJJygpYlMBM+N6MV5oznxiFdTCShER8seMU
         8qOCifLjiA+hpCCbxKZZsqewYVuEx/mJzDtPK7N8gaAx5d3Cn3xPRgfJdSI23ymYmmKM
         /yy8xO+zqu0sQ7fqcNcFQYaF90rGRXPe6oB14WC+ZpcuqrxbUhGAkfTcRNGkzS3XGEg5
         lSLmguwqDpBkhUJ2heV6o9bBsLMBE/7vRV374T24N7xh5g1M8YiyZkBEpnT5QrtWip+0
         g9WA==
X-Gm-Message-State: AOJu0YyXMZ3H46PyKBR79+dchayj9J1ujxIl/c3mcawzuyx5/Ee9l3Jd
	77d3PHcJ+AYwUyud3tXPvf94SrkzjtlxqLxEUddfXFMmsFA4bxFWhT72nqNUai+oLKZ66HIUGRd
	xnms=
X-Gm-Gg: ASbGncu5WAmVbLyxdRX78CRrwAk39L5VDa/PokcppEnMZdHDVRyptK28i72lcEybYQK
	gL0ulr7zD4vl/sgn2djFZPTNRKluaDmtbiPEGlxAnXB+hf6w7Nzd54kq2Y/VNMK+MmVmHbzt6ir
	PyS4l15TfpTbwYHSyfweTJZ2JDWo3qhN/d2F3jQTp8cet2UucE998j7TtZWDwhIEg6XTJNcoZpu
	crYGTfDZge43dcek6dWzkmf8Mvf0E4AF4zQ5ZMqY6orJS/EPJ0JjeX/NHKCfkPVFcDoonOnuj23
	WAoB2zgB8EaynG/puuxHiUAaXUVsp7i3XWd/qfzx1VwiSaa4GGd8L81PbTxprHm9TvwnBQjMfhe
	DoO181HKYGNSz3C67cWPkC4VIEUExzRNPHaWVc5jerr1web8=
X-Google-Smtp-Source: AGHT+IGUm0pqrMFG//sqkL3OrHMzhilTOZ3RgTCCCbtYpqu+SR4fX3REJFHhLBSvLvVNoWVb4po9TQ==
X-Received: by 2002:a05:6000:2382:b0:3a6:e2d5:f12d with SMTP id ffacd0b85a97d-3a6e71c5c6bmr6011597f8f.11.1750847256991;
        Wed, 25 Jun 2025 03:27:36 -0700 (PDT)
Message-ID: <c36a3199-4094-4175-acdf-95da7e050268@suse.com>
Date: Wed, 25 Jun 2025 12:27:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] mm: allow page scrubbing routine(s) to be arch
 controlled
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <c5e1e7e0-a295-4028-b003-152b861ee14f@suse.com>
 <0d2b44e3-bf6c-40ae-be4f-d0ad2845e925@suse.com>
Content-Language: en-US
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
In-Reply-To: <0d2b44e3-bf6c-40ae-be4f-d0ad2845e925@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.06.2025 15:02, Jan Beulich wrote:
> --- /dev/null
> +++ b/xen/arch/x86/scrub_page.S
> @@ -0,0 +1,39 @@
> +        .file __FILE__
> +
> +#include <asm/asm_defns.h>
> +#include <xen/page-size.h>
> +#include <xen/scrub.h>
> +
> +FUNC(scrub_page_cold)
> +        mov     $PAGE_SIZE/32, %ecx
> +        mov     $SCRUB_PATTERN, %rax
> +
> +0:      movnti  %rax,   (%rdi)
> +        movnti  %rax,  8(%rdi)
> +        movnti  %rax, 16(%rdi)
> +        movnti  %rax, 24(%rdi)
> +        add     $32, %rdi
> +        sub     $1, %ecx
> +        jnz     0b
> +
> +        sfence
> +        ret
> +END(scrub_page_cold)
> +
> +        .macro scrub_page_stosb
> +        mov     $PAGE_SIZE, %ecx
> +        mov     $SCRUB_BYTE_PATTERN, %eax
> +        rep stosb
> +        ret
> +        .endm
> +
> +        .macro scrub_page_stosq
> +        mov     $PAGE_SIZE/8, %ecx
> +        mov     $SCRUB_PATTERN, %rax
> +        rep stosq
> +        ret
> +        .endm
> +
> +FUNC(scrub_page_hot)
> +        ALTERNATIVE scrub_page_stosq, scrub_page_stosb, X86_FEATURE_ERMS
> +END(scrub_page_hot)

Bah, I've noticed only now that I failed to do the ret -> RET conversion here
during the most recent re-basing.

Jan

