Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1309DB1D4B6
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 11:31:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072718.1435691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujwxF-0001YP-4M; Thu, 07 Aug 2025 09:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072718.1435691; Thu, 07 Aug 2025 09:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujwxF-0001Vt-1V; Thu, 07 Aug 2025 09:30:33 +0000
Received: by outflank-mailman (input) for mailman id 1072718;
 Thu, 07 Aug 2025 09:30:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2Ad=2T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujwxE-0001Vn-1u
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 09:30:32 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2897524d-7371-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 11:30:30 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-615378b42ecso1527483a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 02:30:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21b115sm1249598366b.103.2025.08.07.02.30.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 02:30:29 -0700 (PDT)
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
X-Inumbo-ID: 2897524d-7371-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754559029; x=1755163829; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xdAAVmbz71axBgng6Y9RnWO3HAU8mTb3tpCpSMa+Ltg=;
        b=K8cxGTwhCX/wFn//qLPAv8S4vUZ3rWub5D2WA8bfWbzVZPpGVhxWuEEAe/jvF4fCJ8
         5ufttmBKIPvtmv0HUKcRfKieWoRkkWBMrxb4OYQxuL4pAQkgcupSoKVGsZnDSqzR1kJu
         UbtJwWCpeEq+LJPDZdPHco7XGRBBZjNEQLBR+aZHvWqg/o5gf+ePUpK0xV6ex0B7yVmJ
         78/cJdrhVdLc59DIqs6yVbboJPw9FfTt0yKlNLr4UTm3UoM6Pe5Dna2mI5NKAcYJfb1Y
         M4sz3XiaKccw0LZg4R9svXPOKGKRy0rYFO94k6csFm6hBjCqXdgEElpCazlX1d8FbFlN
         3AsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754559029; x=1755163829;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdAAVmbz71axBgng6Y9RnWO3HAU8mTb3tpCpSMa+Ltg=;
        b=Gm3KpGTAa6TytIf0CPdTe+0oCCIOFPendVdDlcrV1F/sdOorAN4Lr4N0cu/vPjY8EC
         gDyxBweFAB2PHBrsOAjE7g8ChiLEupoupG74xYYpSMc/93GvxCXqPIy91ufwhX5iH8qy
         MmN1eBh/7+T/UP0DAgeyYjdqBH7/ot9ETmDrHTKRMMKjDgfVrJvNweoyYPxibCG2oLss
         CtMSMl6q0/EArCKzjxOSJlNvaqVYxbb3fJ36Hot1Mcw23I2ocO7RHY9XaeUMM6xUcNif
         yrn23rwMclw2oFb6/rcJhSM1P97h2CiG/8qUAhlM0YkpmTXKFdF9dqaMKYD9HEAonyqt
         oggg==
X-Forwarded-Encrypted: i=1; AJvYcCW+DO5WjMO+wEzLVUG6/v5/4J1ibzpJxwu2jM5FHiYgoxWgQYgLwfbWGUojgeUwiLSqukQmwAuxX/c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yygo8EAgMOqgI90S54EqTbz5q1Zs0gIBztn5mN369xrujvaJAkP
	fVWXQim9N5CEx9b1Wnz4CWWXg3uWMUg4RN4XENjUnyRefol/cJ/BU4FpkEyjte5kpg==
X-Gm-Gg: ASbGncsJRyTjGi+pVkCJmRBoesMk9Ov797zMUuDctcX4gxm7VaFIDsPvYCTk8eJ5S3L
	zsGA1a7f1eCA3j6jIBgTsabxP2RxsvJb+4zytw9qWCR2sMTa0tF16YH6ITW2XOsc0R6TcjXvNoT
	0HzPISmxqgvP0U7Utra1GZlDxlES+TThD87bp0YkCboxhZS4Qni8ub/UiKJSewL5Q9pVaNAfsiq
	N5jieQo89bT6Rl7+QEp7sI5khEzA3LZIrp1a4q/pV567Z5Z883JxnyD00xQsKb7XSLP30ULqnLM
	nWg7fESovu42ZL9GGSKi31VL0/mwW0JrH0VoJOosLXHcY2p3tBS3baj8LEWTtydbW9F3DRMWjxL
	URy40uAD15i+nRa57jBM0Zf2MCFBZNuGXYKUoSzS60FKW+I9kCI+hklEoGWeDQuv1sci9GFYe4S
	VNUbbPEP9csMrytEDjgA==
X-Google-Smtp-Source: AGHT+IHVfkIPoVJLpo5TxRP04zTrgpVzxZtqpEyIxwBZdPkGmydufr3dcWJ8mjZDoInR+9IBt0iAlg==
X-Received: by 2002:a17:906:9f8c:b0:af9:3e23:831 with SMTP id a640c23a62f3a-af992ba5695mr518146266b.39.1754559029312;
        Thu, 07 Aug 2025 02:30:29 -0700 (PDT)
Message-ID: <a4a0d4ab-1fb5-4949-891f-318e3dfa22ac@suse.com>
Date: Thu, 7 Aug 2025 11:30:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/domctl: Reject XEN_DOMCTL_hypercall_init against
 oneself
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250806165543.169140-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250806165543.169140-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.08.2025 18:55, Andrew Cooper wrote:
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -372,6 +372,14 @@ long arch_do_domctl(
>          struct page_info *page;
>          void *hypercall_page;
>  
> +        /*
> +         * Kernels should use the MSR method to get a hypercall page.  The
> +         * toolstack should not be using the DOMCTL on itself.
> +         */
> +        ret = -EINVAL;
> +        if ( d == currd )
> +            break;

Isn't what the comment says more generally true? To act on themselves, most
domctl-s are inappropriate to use, I think. There are a few exceptions, where
alternatives simply don't exist (and where, if a kernel wanted to use a domctl
[or sysctl], it would need to go through hoops to deal with the interface
versioning). Yet there's still the question of whether we shouldn't apply this
restriction in a broader fashion.

Jan

