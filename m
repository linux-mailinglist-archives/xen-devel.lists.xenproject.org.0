Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D2DAB9DB6
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 15:42:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987191.1372611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFvJq-000226-Uo; Fri, 16 May 2025 13:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987191.1372611; Fri, 16 May 2025 13:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFvJq-000200-S9; Fri, 16 May 2025 13:41:46 +0000
Received: by outflank-mailman (input) for mailman id 987191;
 Fri, 16 May 2025 13:41:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFvJp-0001zu-Cj
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 13:41:45 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80ba7fb6-325b-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 15:41:43 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ad23db02350so397456066b.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 06:41:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4383d6sm162906866b.102.2025.05.16.06.41.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 06:41:42 -0700 (PDT)
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
X-Inumbo-ID: 80ba7fb6-325b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747402903; x=1748007703; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UnyRK+x/RwRHJkGLjqyRDTT8t9f+YF4lAou/GdChwkk=;
        b=E/4yEfNVpEy7oyZaOF9guHERhPGJWgElizkz8658C30LeNeR2Zu2nRuO3dfappJV+L
         VrmvZFSvvdrfT5KChUvKifFvVnQEYse3hAgX60XJBryiZA5MA199PVOHgLii8K/Ub1pJ
         NKViCrhXIVyFsINY/MmYrSnk7kGb39YbUqLqE2LlKnYMJm2pRog/xg6YPW1nKlnOO/I0
         y4oO8cuqZaP49FVb72jEP6vTBUpPIXppwxf2TZR2gnMNmLKO+KVDm5lwD8sTD3d7yI+f
         9TpR63PEfiokBOpx/PWKf2g3bTUrIVLooHyCViWCkIEYke4Hd6PuCv8NkAqKeXe1Psk+
         OEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747402903; x=1748007703;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnyRK+x/RwRHJkGLjqyRDTT8t9f+YF4lAou/GdChwkk=;
        b=LD20Vd3AyQFI/fkqO4jv/KItGei2nv4FA0Q76fseN0HymuWuKUfLmqLfIQ6Fktda+u
         g6AQZjE7pvmncnq3JDnjtiTCUPrCPY+O3kJefxphGs9knIz9gtOKB4ZUjbrVCmvNZxtg
         j1g3Y/SFeQ/fTvd/snnt40x9kV7UZtxrgWjlKQ3YpD9coHjPRl3/+Iv34GHrLbQw0l1s
         eZLnquKSBUvv9fLGISKU+9OGFmvnIndCQ5Wrd6Kfra9CEQRk8meU7fsiLB/eRauOUfnL
         8YO4iZO3rHaw26VopMvo9XHjnIJmv9mbbfOUnEF3yrdV77kVv9pKKdnA9464bmIVRYwW
         HQ3A==
X-Forwarded-Encrypted: i=1; AJvYcCXT+gSSb8OdlhOJwcYGFORG39HlYCu3536NlqH55tnlmN77e3kcdP4Zo04VJ1T618oq/SAQzP3RbY0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YywLTv33v6C3GmPOqhKghOcuBthzVXmQ/ZEBGaCx3os3D1nx9RE
	LVibdVLUsdjtefwNAumXvGfN8BKFeuVMR5+Sqr+0di238FY/Ky4bklvooNBDouBvBw==
X-Gm-Gg: ASbGncsmv4x2BtVpMWwRh4JxKW/w8z3f2wpkzZuaEr16hSWw9af0Xx1eLyOb9NTndFx
	5hA6sN4za3WI67tihA6NzfuIh6ZgeXZ4m9n3BaEKe13Z4+iRYOl2nSdBzW0Io+1lzuqg3z/ut50
	+Fe0H22KD+sQ7DPHWY9rzQILxnF5o4IWOQvq64BVXkFMDkI7rzzO/a8fXU171TIZXlOjDnlmQSO
	OPsu7v8JQrvC7CjoVYtWll9mFQmOkE3xgEvCxf14E50q5VdqGRa6iezxfKks1nwQVq3J3kOmlIb
	HP7Id2qtVI/4j6Y86XHWz1pjEtnW/LNTgvoS9ywNZTAYncZqPutMXlpNBRvX40mZAIMJHE8BEYP
	o3mPfool3BGnGScUTdBwBLzyUiPYCsWObeDIN
X-Google-Smtp-Source: AGHT+IEXt2YdpqC5ftOjRKkCsumatiQ9yXVtJB/QhphRcRCMt7BXgcTPCN8hqWN5YzhqFe+Mjv1u0g==
X-Received: by 2002:a17:906:f29a:b0:ad5:3139:f41c with SMTP id a640c23a62f3a-ad5313a00b7mr244820666b.53.1747402902708;
        Fri, 16 May 2025 06:41:42 -0700 (PDT)
Message-ID: <4a1a8582-7503-49ca-8d34-bce3e101734a@suse.com>
Date: Fri, 16 May 2025 15:41:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/stubs: Consolidate the stubs infrastructure in
 asm/stubs.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250516133326.49587-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250516133326.49587-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2025 15:33, Andrew Cooper wrote:
> Very few files need the stubs.  Move the infrastructure out of
> processor.h and config.h into a new stubs.h, and adjust the includes
> accordingly.
> 
> Make the per-cpu struct stubs be read mostly; they're unmodified
> during the uptime of the CPU, and move them into smpboot.c seeing as
> that's where they're allocated and freed.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with one possible suggestion:

> --- /dev/null
> +++ b/xen/arch/x86/include/asm/stubs.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef X86_ASM_STUBS_H
> +#define X86_ASM_STUBS_H
> +
> +/*
> + * Xen has several per-cpu executable stubs which are written dynamically.

This puts it pretty well. Yet in principle there may be further, perhaps
entirely different stubs in the future. Hence stubs.h feels a little
generic. What about exec-stubs.h?

Jan

