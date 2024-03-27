Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4138B88D72A
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 08:23:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698315.1089859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpNcU-0004Z3-KS; Wed, 27 Mar 2024 07:22:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698315.1089859; Wed, 27 Mar 2024 07:22:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpNcU-0004Ws-Hh; Wed, 27 Mar 2024 07:22:46 +0000
Received: by outflank-mailman (input) for mailman id 698315;
 Wed, 27 Mar 2024 07:22:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cRKJ=LB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rpNcS-0004Wm-Mo
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 07:22:44 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd61d5dc-ec0a-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 08:22:43 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-565c6cf4819so879799a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 00:22:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 gu3-20020a170906f28300b00a44ef54b6b6sm5051758ejb.58.2024.03.27.00.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 00:22:42 -0700 (PDT)
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
X-Inumbo-ID: cd61d5dc-ec0a-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711524163; x=1712128963; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eLdo4Wz0xX2pl6liffVfYUwLzbfHut/9fMVcAutFxz4=;
        b=BVyM7TCJKZGvQhLJyAihhsJNfoker/LdDmjg3RA56x8A+czZxnuyCCRhiLMmQ52uG7
         V8PieurCpuI40PdofPKxzrUsaxsoorb4BM4uVZn0U+gh/OOsT7UECQX6r1HWxpW7RbQu
         orZtzMQ7lCT+wzFvJy7H212l+V0yRjOXqJTXmCljaQA6VYwIASYFKTUI9+M7XdDFbtWO
         l0Z1fhGjL/cSRDlXswGw+xj21nSOxRfM9BBUVrFwibVHhLR6UmkD6l/Alh+6QfBH2AWd
         6buqf1fA/3hTExLf3Z8WOhU4hXlJWKL5sHEhaKQhwcaFXesG+y+bigbGwMXc64Md+9VN
         +uyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711524163; x=1712128963;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eLdo4Wz0xX2pl6liffVfYUwLzbfHut/9fMVcAutFxz4=;
        b=SP9fWkb298s8jFlA3ky+XbNSeOvTA0agOjkG8l3aUImBg/lNiyvymo7ZS0u1l6L2DN
         ipSZfqt250YsZY6WKMN3UlswI6807ErRt56lGPU+WApyTSr0sLje2FqCvkvxXH59zVFI
         AZOV4ZLqoTpo9LxgoiCwxD0x6iu7ymZZ2hfv6YINcVmyG++q1WE71rIc0am8yFCf35ll
         IO36sBL9yJ0mjjVPPSlMDJOKxL5W6fVn4A3SQZRsEeDamv9QZ278L4XiY3KZKuyGCjbH
         XUK0lkxzDCM7JF77pdXXzKM1AKcv5IJy1ZxnH2XJsjWZWrzlydFjzUxUz/XC44U4Tu83
         DDHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4g2ZoEUWGBnAwUvLLhwESVV/wJkoTF+wsTN8h9WgwNsssrYwl/IZ5/4oKP6YSHsN4ppggzyYsUrIBefZIiia/tfsI1VRrC0yapwuNngI=
X-Gm-Message-State: AOJu0Yw/qNPiZQZxjev4w2oRVhpVRyxpJ5q9/UJi1m/88EgMwz44D9ic
	AGbWubnnim4P29FpALxQ2FBpOvsM0vDm7IloF5L4QkCSrzGNdeUB+1+/qTPoJpujJaCi23Z/VrQ
	=
X-Google-Smtp-Source: AGHT+IERnexuQrUL5gVTrlRV6mGWq4PryGqL7GfesAAWFqbCceAfz7el9vHcUYn+FSwNmEUnysHwug==
X-Received: by 2002:a17:906:1cd2:b0:a46:c11d:dd0a with SMTP id i18-20020a1709061cd200b00a46c11ddd0amr2865428ejh.31.1711524162881;
        Wed, 27 Mar 2024 00:22:42 -0700 (PDT)
Message-ID: <f1940242-0259-4b4c-baff-2fa73435d1b9@suse.com>
Date: Wed, 27 Mar 2024 08:22:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] Revert "xen/x86: bzImage parse kernel_alignment"
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240326213847.3944-1-jason.andryuk@amd.com>
 <20240326213847.3944-2-jason.andryuk@amd.com>
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
In-Reply-To: <20240326213847.3944-2-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2024 22:38, Jason Andryuk wrote:
> A new ELF note will specify the alignment for a relocatable PVH kernel.
> ELF notes are suitable for vmlinux and other ELF files, so this
> Linux-specific bzImage parsing in unnecessary.
> 
> This reverts commit c44cac229067faeec8f49247d1cf281723ac2d40.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Since you keep re-sending this: In private discussion Roger has indicated
that, like me, he too would prefer falling back to the ELF data, before
falling back to the arch default (Roger, please correct me if I got it
wrong). That would make it necessary that the change you're proposing to
revert here is actually kept.

Or wait - what you're reverting is taking the alignment out of the
bzImage header. I don't expect the BSDs to use that protocol; aiui that's
entirely Linux-specific.

I further meanwhile realized that consulting the ELF phdrs may also be
ambiguous, as there may be more than one. I guess it would need to be the
maximum of all of them then.

Jan

