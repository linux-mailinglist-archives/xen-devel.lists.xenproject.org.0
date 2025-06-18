Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4E9ADF10E
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 17:20:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019282.1396102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRuao-0002Hc-G4; Wed, 18 Jun 2025 15:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019282.1396102; Wed, 18 Jun 2025 15:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRuao-0002Em-CP; Wed, 18 Jun 2025 15:20:50 +0000
Received: by outflank-mailman (input) for mailman id 1019282;
 Wed, 18 Jun 2025 15:20:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBi2=ZB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRuam-0002Ec-R5
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 15:20:48 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cef8921c-4c57-11f0-b894-0df219b8e170;
 Wed, 18 Jun 2025 17:20:46 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4531e146a24so43827105e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 08:20:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365d8a1924sm101425425ad.68.2025.06.18.08.20.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 08:20:45 -0700 (PDT)
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
X-Inumbo-ID: cef8921c-4c57-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750260046; x=1750864846; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U9aQHwv7GQGiYyFRiLwD6wo2qIajZjWB85X+deMNlDE=;
        b=TVhp61Jg+Vv2XN82sld7StmSM7BlbNVKpt92Bqgn0m8lPSiynYKlUD8NKpbkmi1XfM
         hPYxCzI8SNV3Z8AL4+3oassZwxwlcLVoTe//1GoMAHy520YM7w9L0sQd8ljyQKJQ1APH
         Vc/1ZnBVA6JaCPVgLZE5JLjca7a9IylXxkXCpf7mG34iJcwcPGMe/keId4s29ax/2HAW
         aoZFmZF70+JsGw2gR4c5B0BAoOJx/v6nmgUItP1sUk6XWJRKEnJyCs3mKJEbvWlq7/kT
         YHHT+1flyoEonGwcm2pw27Nt3IdJVaRlBU7Nr4SJxQ8mYRdbZQN0E72r++lHNt6G75Z4
         uxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750260046; x=1750864846;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9aQHwv7GQGiYyFRiLwD6wo2qIajZjWB85X+deMNlDE=;
        b=jb4+sJz7tvLd1hP9T3za77erreGdcxWvO+ZqCbbTLQALQSk7q5m2sG+H5XPhVYTM/1
         VpMnu946J5DAl+E4/FzGpBcy33jTjhLNiiMpqpttI9yYXmG2b6VBofWXfWjqbRjxs3lo
         kcIz34OJ/4rzeK1Pwwz4QRFH1SER2vPkOebt5U8AuL728j28AiUINNDPnzxmUZsK6mr0
         FHYnHKS/Bb2gkkzwLNs+glKof0vyu/r9/Ot6NrZGcket4Xns17ypHosy0O27wejtEBYh
         FwmdfPFWKXv39YWl2JSMZ/Fccwl+otBGB1Urh8g5svojdYlWvAdk2QRuIT30SgXWAZGs
         /vBA==
X-Forwarded-Encrypted: i=1; AJvYcCWye60kIBXULV9DFGd4fxu5+7OiJ41NpevgwlPZVC3SbWysT5NE5hnQJH+H5/UskxsVoPSqlh+n0P0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykkVCCNaAl2vhATLvcTu9PX2hN26eUQBbC4KQ7ZK70tpsCQ47g
	d22CXZBgiZAcQ+a+gRJDXndC2LhDH4VykFvRvwt5Qq9P9lY7zlZ6SAhnmcqvXeROsg==
X-Gm-Gg: ASbGncvKyxx+jmfRfVOHFfIY+3mMngV4k96KHoc5fBtThkfnnp8ZARMWogCu6q9heuR
	1c+WOuLIO4vjrTTDSXMuEEsMf0h2XIaqfHtDkuQjEc9gzA2pO6wHCcA2wUB5z3PQLnzg6fyL6p8
	7hZb5wRBB3nYSnTm7otdAOpOY1QNgxMHn6YTVDLOgmxaCp3pBGjpdB0iBWoxEMI4XYAm6phwDuP
	ZGtDncdRSZFw2v6TI4ie14T26UUNOrS/0Ge8xEiHsPOdaZSTiesDO+ebeHaTf77hPQCHp97Ty/q
	XqX0atBB6yVN4OXimiwBLQ7tNlcbfGLgCYpww6WP34f/e5ISWW2KZmLx+XCaOFX75M+jZBFwAJA
	rDTTBcIFJALa0jGNpX9dGsQvXfAG6pQadkD7fuX0G8Qe5SkI=
X-Google-Smtp-Source: AGHT+IHhU75T7QHJ8zenbPXyxhwTzQZeO8sLkuhI8xA2YO5bM4f8xzf50Aq1rdM3PHENaQVacMCkHQ==
X-Received: by 2002:a05:6000:178a:b0:3a5:2cb5:63fa with SMTP id ffacd0b85a97d-3a57236654amr16217050f8f.2.1750260046167;
        Wed, 18 Jun 2025 08:20:46 -0700 (PDT)
Message-ID: <542a4f54-705d-4f4e-b155-13375561baac@suse.com>
Date: Wed, 18 Jun 2025 17:20:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/17] xen/riscv: introduce
 sbi_remote_hfence_gvma_vmid()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <5c614593a1710c737f5509ebb165efd8f857df30.1749555949.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <5c614593a1710c737f5509ebb165efd8f857df30.1749555949.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2025 15:05, Oleksii Kurochko wrote:
> It instructs the remote harts to execute one or more HFENCE.GVMA instructions
> by making an SBI call, covering the range of guest physical addresses between
> start_addr and start_addr + size only for the given VMID.
> 
> This function call is only valid for harts implementing hypervisor extension.

We require H now, don't we? It's also odd to have this here, but not in patch 1.

> --- a/xen/arch/riscv/sbi.c
> +++ b/xen/arch/riscv/sbi.c
> @@ -267,6 +267,15 @@ int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
>                        cpu_mask, start, size, 0, 0);
>  }
>  
> +int sbi_remote_hfence_gvma_vmid(const cpumask_t *cpu_mask, vaddr_t start,
> +                           size_t size, unsigned long vmid)
> +{
> +    ASSERT(sbi_rfence);
> +
> +    return sbi_rfence(SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA,
> +                      cpu_mask, start, size, vmid, 0);
> +}

sbi_remote_hfence_gvma() may want implementing in terms of this new function,
requiring the patches to be swapped. Provided (see comment there) that helper
is actually needed.

Jan

