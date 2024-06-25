Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F0E916A2A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 16:22:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747837.1155338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM73s-0004zG-Om; Tue, 25 Jun 2024 14:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747837.1155338; Tue, 25 Jun 2024 14:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM73s-0004wq-M5; Tue, 25 Jun 2024 14:22:20 +0000
Received: by outflank-mailman (input) for mailman id 747837;
 Tue, 25 Jun 2024 14:22:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sC98=N3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sM73r-0004wk-8D
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 14:22:19 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53aab135-32fe-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 16:22:18 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ec6635aa43so17156061fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 07:22:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9ebbbddf4sm81311075ad.287.2024.06.25.07.22.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 07:22:16 -0700 (PDT)
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
X-Inumbo-ID: 53aab135-32fe-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719325337; x=1719930137; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JEk5GQDBybPW95QfbZsG5Sr675yryL5eUz4xP3Eyv6w=;
        b=Gnt3bkqxnP6bBB7ioGgXRndrWaB0y/ODP/OEM6J9ZzsP+ex4DTr3dwRrls0D6fciqk
         ghI3BxRNq6txhLlvSK6PpOXEMmUpL8C0voKiYC4GXdGjho83yvyGlo9ubFnhZvi16gBv
         L6ib6sZ0c+qWIav1HMkQPcdnHKP8N+TnDPseg4ZEdXBaEEcRZ7gU7JV2BLHPRn0OGFEu
         hXNRVZO7/ESRkXQ41oBLPWuYMQvOg/4Nap/qKcIbuBe2G/zoWbcsut5fr4WVgcKHujMl
         C8MNfD/Kriev+46C/detxi+wIdoAxOo0F8U8QSTlR8StaEC9aDOcJGLBkjNTDCtYNHMB
         gB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719325337; x=1719930137;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEk5GQDBybPW95QfbZsG5Sr675yryL5eUz4xP3Eyv6w=;
        b=B/Y9TrSTgbv3+d/zpsiu9XiZ1Az6z4i+02JmaO/WVz5l5UdGsuTUywWMpqBAg8X46P
         2yRins1JNwGcYxucBPt0G4C2YzPr+mECRVNCf7O7/NWAJH/z+1jFMrGkx0YQxMMPasIv
         vq+jL5UoD37dSOCvbbMBbli1XAwOZW2NIuohspUpSA7bNwcpM38+upEZ8o9fub6ZYD9F
         qwMg6pMWugiHqnmm5u7Yyk8yON0XtlK5RvViQxOTQ3MyeBvSw39tVB8yzzm3Q6oKeDmQ
         kNqY8oRGb7Satv+aATJlTJEyFh1BXikde8jqrld73rdgrRRzb4QVg9QpPCFoCiFXhn6q
         PXBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCKuwRsai9QEw4uZK9WZ+VsJB2Vsaya3vtWJux5wuVkR8pKtgtAiI+24H+HHkg47emuxxsip/f1g8HUouvDwqetiz5nBHN8c30HMt88kc=
X-Gm-Message-State: AOJu0YwBZOmORh3WYHarB1Qyyb0Tr95KQgWWjMWugFMrO59j6iEDRhMJ
	gb+J9HenLiAjngaZH8l0WStlBItLRzc6Bwr1cZSWolEDkofb8CPDnfQxxa7Few==
X-Google-Smtp-Source: AGHT+IEWDpuE6nW0G2AhHYR52UA/acDYoMNfuXTPyyMSDAv3IZh7dDxsWQ4yMNoTdP05K4BwR4eKpg==
X-Received: by 2002:a2e:b0f3:0:b0:2ec:5785:ee94 with SMTP id 38308e7fff4ca-2ec579fefd8mr51887661fa.52.1719325337334;
        Tue, 25 Jun 2024 07:22:17 -0700 (PDT)
Message-ID: <3cb055bc-f61d-4045-8529-5a15fd5a7e00@suse.com>
Date: Tue, 25 Jun 2024 16:22:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 03/10] xen/riscv: add minimal stuff to mm.h to build
 full Xen
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
 <3d44cf567f5c361cce2713808bcea1b1b6f4f032.1719319093.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3d44cf567f5c361cce2713808bcea1b1b6f4f032.1719319093.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2024 15:51, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changes in V13:
>  - redefine mfn_to_page() and mfn_to_page().

DYM page_to_mfn() here as one of the two?

> +/* Convert between machine frame numbers and page-info structures. */
> +#define mfn_to_page(mfn)    (frame_table + mfn_x(mfn))
> +#define page_to_mfn(pg)     _mfn((unsigned long)((pg) - frame_table))

Is the cast really needed here?

Jan

