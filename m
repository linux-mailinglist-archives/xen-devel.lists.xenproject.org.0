Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D7A9F2EDE
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 12:10:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857761.1269975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN8z0-0006gw-Nw; Mon, 16 Dec 2024 11:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857761.1269975; Mon, 16 Dec 2024 11:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN8z0-0006eK-Kf; Mon, 16 Dec 2024 11:09:50 +0000
Received: by outflank-mailman (input) for mailman id 857761;
 Mon, 16 Dec 2024 11:09:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tN8yz-0006eE-9V
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 11:09:49 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42def42a-bb9e-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 12:09:47 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4362bae4d7dso19520095e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 03:09:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4363602cd11sm81395475e9.14.2024.12.16.03.09.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 03:09:46 -0800 (PST)
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
X-Inumbo-ID: 42def42a-bb9e-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734347387; x=1734952187; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iu+Yz6AeBKGdmKyzFjaCAIEYrTKlB4phgetCKsAvp/U=;
        b=N93RRYgZpk8SAZh/3e1q8ue0ehSqQFqvz1GrChc+5EIoaoCWRiH658m1NFWpYUs0Ji
         z2B3waE9ZeASJtkKk6mVeEQCgzopwWEFc7EtGH8cUrnuyiJq2jBUg/lEkjSwyOzJ8mrf
         hwDOnrRh/5fOUEM6476+TlgWGKFVtLvnrrYFQn+9tHBZ3dpmiEteaBjRZ1JQ/0ydJW33
         i+FdrrQpje3N1WZS0kmBTyv2x29zmwKkVlNY6UEFX9w/yAxxaA7VrPLMMwyFBwon86Tz
         evzxS0xjPlO4gvSdwVSnncAA2ItFpWj5rPq1CkRqVCBZdQrYfv4owPhjeLqyhgIMQDKb
         DrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734347387; x=1734952187;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iu+Yz6AeBKGdmKyzFjaCAIEYrTKlB4phgetCKsAvp/U=;
        b=JQzeq3rhmUGDNkf6sxkuurelJP7yvbnjOpUq380X9BPgGlp3DxSgtfpk1cy4JIsxz2
         hqFe3ZoiA0vD9EbJX34YD9yZdvDVTIXZVYoIjlLApMnZKBtL43VbIgSG+EBtqk4qGNLd
         25ZJxEuLA4jQg8dJXGA+sTjsuF6mIrxowRdXTqSh0HLMK4u1xanNhL1WhXaXffqJugqn
         Oi0RaluD/pDj2KuliRF903QFwi1oJvxHITIz6/QZPdi0IzHVdR4925trWD9FuCi2gCuk
         lo/CdBUWXFcBgapC0srWqZ0VPN5NdpmrBcQIQsWaz/a0nY06CpxBRbN3IXxWSIs/IPGS
         4iEg==
X-Forwarded-Encrypted: i=1; AJvYcCXs7DkTpAfsDoY9uRaxPK7KBQOPwphpL2GvhCI3ZLB3EChtWckQzrVqE0+6729y0sf/NaS+7eHI4OA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGyy0ZzuTIgesdkiN9q8np09J9wFKNiizatoJbIj1DN8ozFssH
	4+da/Tj7v68llXIzGZ95eYlHVM2tM90zvHTAioXyEuLgE5J2GmJirILNAR1zhQ==
X-Gm-Gg: ASbGncskvxAGlB+SfXhjBAz1uULc9ZbznkcthylPJn3veb3buzI2O9bmVqlRjDseAa/
	vU+MPvb4NwVs5AEtITOFxENmcI0BtsvbU3hggR+kP5/JTVU4jL7bRba6P1Z3+b3IhVqWCnCuCoY
	18mp45kHSrYp4Ibv4FCjb77h0ipXh0zaX25TjGYEuciowxlbZYddWMS5jcJ8q8f7oud6mgWe+QP
	MF9uhj76jUzS6G806jJy1n+Hg0CpUbYDmsTtP/zYtcha6Ltgm/Zor9lT7MDKMm4G7fNHbxCqhQ1
	rfkfcWHGef3bCDXfCPKvMRRQwqSWQKN47nUJAjZlKw==
X-Google-Smtp-Source: AGHT+IG2HE+WPCzsN35+35T7xKqfqTosReJP49eIYdEhlTjBMlUabIlrkv5sKcbfoaU+Osi+LcBQGQ==
X-Received: by 2002:a05:600c:5025:b0:436:1c0c:bfb6 with SMTP id 5b1f17b1804b1-4362aab0763mr107185205e9.27.1734347386823;
        Mon, 16 Dec 2024 03:09:46 -0800 (PST)
Message-ID: <943d356f-e1cc-4e42-94c5-fa6d7fc157a3@suse.com>
Date: Mon, 16 Dec 2024 12:09:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] xen/riscv: update layout table in config.h
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1733937787.git.oleksii.kurochko@gmail.com>
 <c305ae5003da25d7ea4d4aa5602c4b22f83df4a8.1733937787.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c305ae5003da25d7ea4d4aa5602c4b22f83df4a8.1733937787.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2024 18:27, Oleksii Kurochko wrote:
> Make all upper bounds (end addresses) for areas inclusive to align
> with the corresponding definitions.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

I expected this would be straightforward to ack, but ...

> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -41,17 +41,17 @@
>   * Start addr          | End addr         | Slot       | area description
>   * ============================================================================
>   *                   .....                 L2 511          Unused
> - *  0xffffffffc0a00000  0xffffffffc0c00000 L2 511          Fixmap
> + *  0xffffffffc0a00000  0xffffffffc0bfffff L2 511          Fixmap
>   *                   ..... ( 2 MB gap )
> - *  0xffffffffc0400000  0xffffffffc0800000 L2 511          FDT
> + *  0xffffffffc0400000  0xffffffffc07fffff L2 511          FDT
>   *                   ..... ( 2 MB gap )
> - *  0xffffffffc0000000  0xffffffffc0200000 L2 511          Xen
> + *  0xffffffffc0000000  0xffffffffc01fffff L2 511          Xen
>   *                   .....                 L2 510          Unused
> - *  0x3200000000        0x7f40000000       L2 200-509      Direct map
> + *  0x3200000000        0x7f7fffffff       L2 200-509      Direct map

... this isn't just an adjustment by -1. If the old table entry was wrong,
the description wants to say so. Else an adjustment to the number is needed
here.

Jan

