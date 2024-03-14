Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD8887BD6F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 14:17:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693215.1081011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkkxA-0006T6-Ab; Thu, 14 Mar 2024 13:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693215.1081011; Thu, 14 Mar 2024 13:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkkxA-0006Q7-7w; Thu, 14 Mar 2024 13:17:00 +0000
Received: by outflank-mailman (input) for mailman id 693215;
 Thu, 14 Mar 2024 13:16:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkkx8-0006Q1-8L
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 13:16:58 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2169455b-e205-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 14:16:56 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5689f4d318fso1127033a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 06:16:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v23-20020a1709067d9700b00a461a7ba686sm709882ejo.75.2024.03.14.06.16.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 06:16:55 -0700 (PDT)
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
X-Inumbo-ID: 2169455b-e205-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710422215; x=1711027015; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6xDKgJDGSYr7k+8waxFdvg07emX4bhKkBKNzDxX580I=;
        b=g1jTntNmUaDxKoOQhaCVAacNzwHiVR/ZiGbv2vWxOQEyAJnDasZO016ZFZtj6D2ope
         94OimlClx0lqk2Sp3Kcr4Qufqnw0XGIhKw3eHXvLKndxLe7YBMrWF8XzIbxXsSiz202a
         l40hxCxWNsO88AFFQg6I10sWBfJP+gZm0QIxzJ+ggtNYSrwf5l/CoAxGlo6Hcb7cjtpb
         kkTDncoyYU/bzjTlvLPDKRAN2d1HnKAcTMyI3m1GvUl3n3u/FHbhcTOD+SCUN8e8GSTz
         iOGkIK49XpUC1cjocrcIqoNN5SNzw/oWey8080xltYxWzC/9dyqi7xRxR0W3hfR9aGOK
         1AmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710422215; x=1711027015;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6xDKgJDGSYr7k+8waxFdvg07emX4bhKkBKNzDxX580I=;
        b=XgLuFE/9hYrrtchw54GkIWPZUpa56jbVPWkZjxB7/vnxI59Z9S/aq0odAiDT168V+o
         wdT9EvwcDiTtCegthmefw69kppRY4ZTuNiMCtHSvvm94HrxrdrTsyZUXkC1NB8lrXU3f
         VzysRNPCU3rl/9m980EAc95nukLYeoUFih4BHgVl/oGsXWb6Rf5d/cBF3MRsBzO+bKwu
         8xx+7prfXL9F8y78aucUnhzi+CRAY/Ygf6l+3tKbRwIaOOK0lX2mkzxkXimsSRRRyh3u
         c/F7Iap3UvC4pM8lQVY88rCegkZXNBMJ4+qkC75xEtu/U64ScYrLBjtXvlYErk4OMny4
         NfvA==
X-Forwarded-Encrypted: i=1; AJvYcCUbTgLlxoAJj+kZEeAKrSZkp3przJ3hVHOr6yOwKg0g+RvFLgxCe6TaaR5FslHWbhOS7bdwigxpFyTRjvlP0QtCIhFlHrfYc8uUDEeC9is=
X-Gm-Message-State: AOJu0Yx9M7QHHnaCArQle0fmcMqzcCQOY+FAJP93HYUCEdgd3ysT1J+g
	9kWTMImU694R2n/nvM1kE62fMyvgT/Hx9dFtdNe5VgKiUM18+oqse2t+KjK/Fw==
X-Google-Smtp-Source: AGHT+IHCEWfphZRblLvqN52y2avWfZEd1GZr1Lb9E5Mj/eYmgAJ8xXO3+t9gwz+5Nm7G71sRmrfFhQ==
X-Received: by 2002:a17:906:6b12:b0:a45:ada9:4bf1 with SMTP id q18-20020a1709066b1200b00a45ada94bf1mr4980983ejr.12.1710422215363;
        Thu, 14 Mar 2024 06:16:55 -0700 (PDT)
Message-ID: <ab06fce5-eeba-4ab7-97ca-99d876406693@suse.com>
Date: Thu, 14 Mar 2024 14:16:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] libelf: Expand ELF note printing
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240313193021.241764-1-jason.andryuk@amd.com>
 <20240313193021.241764-3-jason.andryuk@amd.com>
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
In-Reply-To: <20240313193021.241764-3-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2024 20:30, Jason Andryuk wrote:
> @@ -217,6 +225,15 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
>      case XEN_ELFNOTE_PHYS32_ENTRY:
>          parms->phys_entry = val;
>          break;
> +
> +    case XEN_ELFNOTE_L1_MFN_VALID:
> +        if ( elf_uval(elf, note, descsz) != 2 * sizeof(uint64_t) )
> +            return -1;

elf_note_numeric() use sites don't have such a check. Why would we need
one here, and even more so causing a error to be raised when in reality
the supplied values (still) aren't consumed? Furthermore the documentation
says "pairs" (plural) for a reason. Finally maddr_t-sized only happens to
mean uint64_t on all architectures we presently support.

Jan

> +        elf_msg(elf, "mask: %#"PRIx64" val: %#"PRIx64"\n",
> +                elf_note_numeric_array(elf, note, 8, 0),
> +                elf_note_numeric_array(elf, note, 8, 1));
> +        break;
>      }
>      return 0;
>  }


