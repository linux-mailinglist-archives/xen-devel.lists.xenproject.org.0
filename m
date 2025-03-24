Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 876D1A6DA24
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 13:32:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925434.1328308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twgxW-0008RV-96; Mon, 24 Mar 2025 12:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925434.1328308; Mon, 24 Mar 2025 12:31:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twgxW-0008Ov-6A; Mon, 24 Mar 2025 12:31:14 +0000
Received: by outflank-mailman (input) for mailman id 925434;
 Mon, 24 Mar 2025 12:31:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twgxU-00089E-QL
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 12:31:12 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcb8da1e-08ab-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 13:31:08 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso43254015e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 05:31:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f556basm168839265e9.17.2025.03.24.05.31.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 05:31:02 -0700 (PDT)
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
X-Inumbo-ID: dcb8da1e-08ab-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742819468; x=1743424268; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MmRtv56kJhQ2WUp98xo/bq1KVgQgxz4c+qV8GZhf0c0=;
        b=QSUHLDVY1HDNPrge/JZbKPOrTbq6pDozgr30Bd52uy9yfIkLO5CYAB4AdyL0O9OPua
         nL0Em5XPjb7xtxy0PtGLMYWZBFhTVgV1UX7w47F2lPgb/S91QaTU650M+6uwluZr6+2Z
         TZlRFFy7yWC2SYNcq4OT92GZX9vQv992YJxKzxrQVX8297jIHdcHGDJu5g3X4rautxn2
         LA5JVu95XVPM4gGzDPptYmDxNvNswNGM9IB7A3DKO3CvMfh/Uh6mgLOncZ1R8FFOTvkT
         7fHNaf8Ch3B9MIpZpxjsUD0nqz9zJIO52rD1Z2TRV9wWb0W/tngO1CkW50XAVBN/KEtI
         qlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742819468; x=1743424268;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmRtv56kJhQ2WUp98xo/bq1KVgQgxz4c+qV8GZhf0c0=;
        b=mWsTCJntOfuKmS8rGNrZBiBMKgmsuLkw8RYsPRVkQpfsOTko2RpHYY+8JKQIwJbpD4
         YStABVsrql2GmxBoHSlk0+GKLTmxNMFRPIqxw3vS7eIJALNHdOHzaaq0fldVGxvEpxvL
         H+cJIACWJ6AtS0D1L0cytPgjjHL/6lPuM9tL4ldR4beBGQ0MM9/Rx7U5+xzyafAJm9y8
         mOOIuwR3cIgcTpm+EvyfVe/OM2wXy8+CX0NkI82LLaASJRD1MKuJyeAOCkmkfuDAFUo9
         fFHGLMv7uonHZVUyvxq74PiR5SfYcDBl2YIV5QMBtbRU1NYqZ8P0QVZwPPKdVm1Xbj93
         tE2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpiNATHbtkUD0vDoI75yK+kYxRbyVFi6WnQt9X/cj2bUMrURhDCnQfQmYVUsr1yhbiQH0KKXyjeTw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyal03gr3fFMXCu1vUpVaYjyDyou1fUGbI1aZxNaT7dN3gpvTVe
	BocoMRDPx2q//7XSnQRzcxYEhD1L14JURY45z9eWYAL3q/m3SU/lWxrWazTdWQ==
X-Gm-Gg: ASbGncsolKA7qVHs7210rUpZ107+7fZ7EM5LU/HGiwOpaYI5mzeC71nJV0hziMJ8Wd5
	j4AlFrAHZdZCKxKtS1eqru45BWRIxF1qd6Arn4zD+VL8zzyHiW7qf+8ghxUFM8zj8BsYFZlKna8
	Tc4RhwXfqZDN/oT1kYrBmT5m8HEETGbAHzDacFXwMiWPNcGdidUZAEPkkwubqWJ7O+0L6dVFkgq
	DYV7bEc1zo3N00xq+pXoLKUhi3H9TT7zRuw/1ij/I/VaeFWcNB5kQEWiQc7dA+fFljuwDyrK6mB
	F6zls7P+Vf0cuZ20EhVrClj6M5Hbzb2eZPxTrOCB3X4meCWHY2oDE9F2xBa+C0+qY+E82WpTOOn
	GBOjzy8knXVdZkd+yNb9bavo9eF21BqfO8y1gxAqX
X-Google-Smtp-Source: AGHT+IHOTfwfDTRkF9QMdqUL3RVYin4VlyrTOae9QT9KK8WX+P24OmHq52u7hr1UemNAOpncHKLAgg==
X-Received: by 2002:a05:600c:1548:b0:43c:fb5b:84d8 with SMTP id 5b1f17b1804b1-43d509f2ebemr125900505e9.16.1742819462804;
        Mon, 24 Mar 2025 05:31:02 -0700 (PDT)
Message-ID: <c9c7c8e2-d441-4a1a-a658-98dfe0a98ed8@suse.com>
Date: Mon, 24 Mar 2025 13:31:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/riscv: add H extenstion to -march
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Milan Djokic <milandjokic1995@gmail.com>,
 Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>, xen-devel@lists.xenproject.org
References: <0a072ab36b54ea7c4f9a6f94465fb7b79f9f49b2.1742573085.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <0a072ab36b54ea7c4f9a6f94465fb7b79f9f49b2.1742573085.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.03.2025 17:17, Oleksii Kurochko wrote:
> H provides additional instructions and CSRs that control the new stage of
> address translation and support hosting a guest OS in virtual S-mode
> (VS-mode).
> 
> According to the Unprivileged Architecture (version 20240411) specification:
> ```
> Table 74 summarizes the standardized extension names. The table also defines
> the canonical order in which extension names must appear in the name string,
> with top-to-bottom in table indicating first-to-last in the name string, e.g.,
> RV32IMACV is legal, whereas RV32IMAVC is not.
> ```
> According to Table 74, the h extension is placed last in the one-letter
> extensions name part of the ISA string.
> 
> `h` is a standalone extension based on the patch [1] but it wasn't so
> before.
> As the minimal supported GCC version to build Xen for RISC-V is 12.2.0,
> and for that version it will be needed to encode H extensions instructions
> explicitly by checking if __risv_h is defined.

Leaving aside the typo, what is this about? There's no use of __riscv_h in
the patch here, and ...

> @@ -25,10 +24,13 @@ $(eval $(1) := \
>  	$(call as-insn,$(CC) $(riscv-generic-flags)_$(1),$(value $(1)-insn),_$(1)))
>  endef
>  
> +h-insn := "hfence.gvma"
> +$(call check-extension,h)

... this, if it fails, will not have any effect on the build right now
afaics.

Jan

