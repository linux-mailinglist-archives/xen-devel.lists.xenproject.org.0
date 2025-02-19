Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FD6A3BC92
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 12:18:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892700.1301657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tki5S-0008EN-Ed; Wed, 19 Feb 2025 11:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892700.1301657; Wed, 19 Feb 2025 11:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tki5S-0008Bc-BP; Wed, 19 Feb 2025 11:17:54 +0000
Received: by outflank-mailman (input) for mailman id 892700;
 Wed, 19 Feb 2025 11:17:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tki5R-0008BW-4W
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 11:17:53 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27802f1c-eeb3-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 12:17:50 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-abba1b74586so478984866b.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 03:17:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb843451b1sm748733066b.42.2025.02.19.03.17.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 03:17:49 -0800 (PST)
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
X-Inumbo-ID: 27802f1c-eeb3-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739963870; x=1740568670; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5G/mC2mJ9O+DySl+rziuVu2I5cEReSUvAyTLyavlfDU=;
        b=QjbPMmMFIkJl4G/a2s9uZrbwLcHgI5xtfbaMMTLQuqDMdlozqHb6Wp7iP92uLi8Prc
         9rYBuB++ue1TKNam0ZdVbXUPlCAp8Rr1LwBgp68fMaHFTmPJcZ9HJuM9vlXtFhYSZtmn
         CYZw07WI21gU8ik+8bCierWeTUS5+TpWUR7qNSi4aHwZPQ+B1VQcLT52G4WSyLW1KoqO
         IT2rcE0mK8ELqdO2UhVZQCyZ6w6MYW+CnGbPboSWB1q0mSGjCtbdlHG11K1cza4dMBGZ
         qhS0OHTRMJ8jInFe6GLIJESMqFZQv5uvznxceUFEObAoWv9PlwpCxBhC5gR8JaYazMPv
         QUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739963870; x=1740568670;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5G/mC2mJ9O+DySl+rziuVu2I5cEReSUvAyTLyavlfDU=;
        b=kx7zPhOZkQcf5KpdVpyLcvvLcwub2elvbKaTkXE1En5DmYU2q11S5ctsxPEyj5DA3R
         Ixo9m5dQGojdhRW5DI+WoNFzOzMt9fu03xOOe8jjmCH21dKNpvKeESnLkhMv0eyJlyfN
         Ya0kYS4zo/x9CFGvntN8/I/jQS5/9Okv8wAq7WADKswMVIZEi46SZrbKvOAm8uBZUr/v
         95+oaUKiOtsXBZQitTbn2byMdh2iIctvLxiz9FlM+/xb8doP+NL/dzL0+TjKnUyKMw97
         iJNXIzrO/z0ybKSolnvH4bFxtN5W1mYWLifY8JpB0GzXV2kJ5fVbVd3Wq2EsLv+y81nu
         Vo2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXiYDb1aAR2EqinllZTET5RJ2kVUe84buyA7anMuwPouuJytTYuIN/Mv54RcxitVur3jHYa5qvNd3U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCsUfUludSaQBurw/VPo34cDrztnaoUf6IV3WLPDTbkC2UMq6y
	q7GmqUJm0XFHUuP2cuKir9wA9B90QSRiuuViGCrmhNrZkr+HXSKkoBDFzLu3Fg==
X-Gm-Gg: ASbGncsazyBoQ1WV7fCepRNYYCAdcndI0S1Bpgq6Rg0ljIQXGoAqqTDOxY3qarCx3qn
	1mx3Eng0/goJeHxTglZCY1/Fjzrv6W30fkTahmBoiRIrW+9gzQJ1IGKzymMeEW1WpbRJcksUqu6
	Uv9pJ7cXzxkTy2DTf1aP+AQIYlgO/N5d9Hue2WH6WuJcfpNEXvhpJuC6aQG+ec7bKaYacc7CQig
	vBBxSkAaIQ5fIrQ+OoP5At0Kpk1QAXo2GUFqkzBqXsEoZsuKgWffLuoe3DFmRq2Ue6Bo+bQYy6m
	1xP2pv7FrrBjrO1VQm5s4Q8CcV+TgJvbYzEIyEyM6JsbOCcPoZQnwksbVGO6S25wRr/rUDWOkoX
	L
X-Google-Smtp-Source: AGHT+IEHDiSvM1n1GJOaNjrOTttCkvsO4O+Qld8uDT6JbuyU/SSzpJFvxkkDTG12UNJIaQOyHAqgNg==
X-Received: by 2002:a17:907:7b8b:b0:aa6:8d51:8fdb with SMTP id a640c23a62f3a-abb70b22decmr1678746266b.19.1739963869744;
        Wed, 19 Feb 2025 03:17:49 -0800 (PST)
Message-ID: <0b90485c-6a4e-411a-9190-56a444754d2e@suse.com>
Date: Wed, 19 Feb 2025 12:17:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.20? v4 2/3] xen/riscv: update defintion of
 vmap_to_mfn()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1739363240.git.oleksii.kurochko@gmail.com>
 <aba5cd4c47cc7d9be55fd255b5b60664b6a0ddf6.1739363240.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <aba5cd4c47cc7d9be55fd255b5b60664b6a0ddf6.1739363240.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.02.2025 17:50, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/page.h
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -210,6 +210,13 @@ static inline pte_t pte_from_mfn(mfn_t mfn, unsigned int flags)
>  
>  pte_t pt_walk(vaddr_t va, unsigned int *pte_level);
>  
> +static inline mfn_t _vmap_to_mfn(vaddr_t va)
> +{
> +    pte_t entry = pt_walk(va, NULL);
> +    BUG_ON(!pte_is_mapping(entry));
> +    return mfn_from_pte(entry);
> +}

Nit: Blank line between declaration(s) and statement(s) please. Blank line
ahead of the main return statement of a function please. With that (happy
to adjust while committing):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

