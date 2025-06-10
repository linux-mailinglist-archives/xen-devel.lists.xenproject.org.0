Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC74AD306C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 10:32:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010600.1388738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOuOv-0002GC-Rk; Tue, 10 Jun 2025 08:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010600.1388738; Tue, 10 Jun 2025 08:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOuOv-0002Di-Oq; Tue, 10 Jun 2025 08:32:09 +0000
Received: by outflank-mailman (input) for mailman id 1010600;
 Tue, 10 Jun 2025 08:32:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOuOu-0002Dc-10
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 08:32:08 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62b0d03b-45d5-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 10:32:03 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-442ea341570so33298545e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 01:32:03 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a532436555sm11796928f8f.61.2025.06.10.01.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 01:32:02 -0700 (PDT)
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
X-Inumbo-ID: 62b0d03b-45d5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749544323; x=1750149123; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=42DAYlwQ+tkYMtayZ9Mn7ArsepIwbn2TYcbLNZDnMhM=;
        b=Rqk0gO6UUaRScAY39f0bBZR0qr6IClmJ7M2azjDEIGAhRcwQgJZvPQAC5f7yrr15dK
         h6ZO6OtXMvEFZT5vOzg0PBTVwupEYHwQSQsBuD2jGiJLQIdBHmu7S9L8eud3cBnK9koj
         WCIf7BeCltB/lhvxR2tVI7W9KjhCcfNifEFptxetBhB97nMcTR+0bg6l3b33OmlC1OMY
         4Jb/mDqTspgLVUfbsMhQHke6X+o61lXfF7CcHYWLAlHnPmm/V1LK6cg9RV8QbsIL5Xli
         VaXKam9MDS6UHSrNcmzEUDer2F/qyVuOe3S9GS6y4ay9vx66A5VsJofPWf8pgzsPOzJU
         EbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749544323; x=1750149123;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42DAYlwQ+tkYMtayZ9Mn7ArsepIwbn2TYcbLNZDnMhM=;
        b=K478Z30CkijT+Zwis4AbkiiVEFvMpYthnRq1MbnyOPcVxET9890hCTrkTjL4hOs2eR
         t28eAlXPGZIYSWj5A9c0lGC08uITDZcD92grzy2Stwhf4TpnyVilEENgdoWw7+xPkbgA
         HJgbS7Owh75aGovFrjevvDnRUF5ocLKIWPKpCjYP2hbOWGr9KWECQSkw0I7gOqQm5xHN
         hZAPCuwgkem083IwPEQSZoGmWBbCo/W4R008Kpzrunhuc7hEHZ3x7eU8eFCOcVWV64Ey
         N1HXmY2Gj5HAOcXVoZ4isnALLkSPwsrDQC5TBZP0z3NJCVUNX31uDxeVQftfb360ynnI
         9XOg==
X-Forwarded-Encrypted: i=1; AJvYcCWf3k1wwZwByWyZ6q2TZe+ocBnObmdxFDFNWJvwQwOKJs7kRWtExzPVqeFI0Iq4dMGOHlcI+4X6dSw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyaQmxEXrcsPE5dHCrFnY/JjsH7epvX8GeeXG+PSZZ4kjOBtG/I
	jlLLiKboEmssUzFkv8BQ6XcR/VRUYOEy5gqtm36FGFlIvtqh1JnaLEKq7NgHs9jC1g==
X-Gm-Gg: ASbGncv1ymJFcoyrOWCc1OYFOsdc3QOJIIzqMQfixrxGYspPVftvgB+RRWc+9zT448b
	l1RlvXn19HYfje+Vrn4vXoB0KWqPewtxt7uD4sF8SMpb/IRlgPczqlx9WIXhe6Q2o8Sx3zR+f4M
	5CsdiuAeIPb94yxnrlrTccUNZCVafhsZaokxxEIfRpCGYUNkc7CaFiWJ/Tg8fn+N86gbi0hiya0
	KsSXzYNSfvIRo3MW/NaRfkrJGJLF++Ya9I6Bq+aGRXGUxK0QSeB6ymYbunVgiFc0GJBCptCeQkY
	5ejTCGIWHmZl7fYGw2Z0XvBDXW+QriF1inD/PzOqd5uhF4BoBP01XfrJMZy8bU3U4Y+wwbSLVHc
	zrbWNEdXxzQYiNIrbwPs/R10u8/iI0mIg8k4JuY3/kD5asFFkym+ZHT3ww6UDMAl/SI3vBDI8eD
	AK8p0587yS69l1RPji6viMHNdiCYEWUDM=
X-Google-Smtp-Source: AGHT+IFQYXvafICc4tU35a9BqF5V/cqDwFMrCpHjfchQ/XsSN3oLjx9PvVX4qPtTUAPxWvcQXeHu5Q==
X-Received: by 2002:a05:600c:5396:b0:441:b3eb:570a with SMTP id 5b1f17b1804b1-452013681efmr174664545e9.2.1749544323012;
        Tue, 10 Jun 2025 01:32:03 -0700 (PDT)
Message-ID: <fbcd83f4-8638-4da3-8555-36294a42c7d8@suse.com>
Date: Tue, 10 Jun 2025 10:32:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] automation/eclair: update configuration of D4.10
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>, michal.orzel@amd.com,
 julien@xen.org, roger.pau@citrix.com, bertrand.marquis@arm.com,
 federico.serafini@bugseng.com, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2506061403280.2495561@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2506061403280.2495561@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.06.2025 23:04, Stefano Stabellini wrote:
> --- a/xen/arch/x86/include/asm/cpufeatures.h
> +++ b/xen/arch/x86/include/asm/cpufeatures.h
> @@ -1,6 +1,6 @@
> -/*
> - * Explicitly intended for multiple inclusion.
> - */
> +/* This file is intended to be included multiple times. */

While I can see that this may indeed be needed, ...

> +/*#ifndef X86_CPUFEATURES_H */
> +/*#define X86_CPUFEATURES_H */

... I wonder what this is about. Sorry, I didn't spot this as a change
in v3. If it's needed, these comments want to be well formed (have a
space between * and #).

Beyond this - why is this header ending up different from e.g.
public/errno.h, where a SAF-8 comment is used?

Jan

