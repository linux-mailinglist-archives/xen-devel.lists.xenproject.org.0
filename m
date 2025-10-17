Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F642BE6893
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 08:09:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144918.1478115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9ddq-0001dA-4B; Fri, 17 Oct 2025 06:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144918.1478115; Fri, 17 Oct 2025 06:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9ddq-0001ao-1X; Fri, 17 Oct 2025 06:08:42 +0000
Received: by outflank-mailman (input) for mailman id 1144918;
 Fri, 17 Oct 2025 06:08:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9ddo-0001ai-5q
 for xen-devel@lists.xenproject.org; Fri, 17 Oct 2025 06:08:40 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b893e3c3-ab1f-11f0-980a-7dc792cee155;
 Fri, 17 Oct 2025 08:08:37 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-46e542196c7so17223055e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 23:08:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e1284sm38322048f8f.45.2025.10.16.23.08.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 23:08:36 -0700 (PDT)
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
X-Inumbo-ID: b893e3c3-ab1f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760681317; x=1761286117; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DwIs3EJvRN2hDOHlhRIiZA6PhdJS+cxJ6LIJDnb5MUs=;
        b=BXtIsUcs+zMksSIhS/a96Qqf2kTvOuGBoWy00RsRmaGPIpUXFfgWmGqGylV+0OyBjW
         hoJb8rCMMotULOkLqDisFlXTG6WtBh8YrRkmjPFSQu0jUJgQLwkpYn6nJcx5XUDST/LJ
         beYlcf62acCAgNTi1U4joGiMYMEGhXAqGouV0/hgIsTa5L9EfFIE0FGT/BP3C5gHcG6c
         iwb8yggrnSzoyeI5XbkbPXuUs4FwJkrIZfU+fwANCFq6M7xbhDBLf6rj1D9u8HgM3b0c
         cdyMzCjelNFJpT96E5EVlNNQmoF+W1Wg9bA8IyxgwVY3sZSWt1j2vec4QxQFkxlkiruV
         S9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760681317; x=1761286117;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwIs3EJvRN2hDOHlhRIiZA6PhdJS+cxJ6LIJDnb5MUs=;
        b=kJWA9EO36okfj1BnPI3aLUT12IG0iFWYEupJpYYPtQ3SXMwA02SiBDfpc1/BDLhw7T
         SZwpgXO/28YiNFn9TgG/wI81Ngs02m5DZBwd6sbRRc+nIrA16W/GnRK9HErCJsPXRMCG
         bZG/ynzJFi/yd3T1p8zxoS3kyskAl/3zPSIEGMl3uKT6lj5L4DPijLrcDYh82sBKWJWe
         ffO2hnIz03JQjuBFq1e2qSscoWP93Gij2MzrM3JfiKoj9ZQuWUgFrOU2P03DFcU5hOGm
         1myjrEyBpq5D5/Ur5Eoc2maA2wg8JA90oKbg6VF8ugl9ds+HhccOpdaloMESgBMfjAl8
         ZSOw==
X-Gm-Message-State: AOJu0YyHf/YmAn+S2Jbq5fCuPwx+mDPLN1Mlrz57nyn87kGAM9dyEhaC
	fonjV1cFjH+0saPBj7LHPg1n7tiK0Gda+fTk9YERdqBXluJUKx6ANVyOXMd91dpqLQ==
X-Gm-Gg: ASbGncvc8p51ra47rP7dekTOge8bQ8gMrsmFynw/m/4d5gMQFX5q98uqn3oIuixNb6k
	zzzX/lKB5ovbGXZ7tQoFN7FbvkbI861jTN8FNtAMs8p2zINyautExUoyfXd9HFHJbA/N2SuBlWo
	OTJPgrHJsY58/DgTz3+JJpIT4mtp06JkGJR8EdFAXmGYdrPSk4634ItAxOHzjvbJ1VXSyWE6uBw
	DOiXatFlFIrnTd/6uj4QCNaGE6DbbsyYUr2yHlyOGMK08hUqIXr8lGpquym6ATEj8105Sck7X+1
	djC6YNsw38HTwK08I1MT02RKzRlMguN7qGsPfWwDj9LU/qrVyMiiNCYgmm7xUI5YsoVE9Hv+eER
	ESwE37vSw9zZTRok3JVZlXbhB3c5tUPqz/DJVyNN1WN49yG5gExbZQOOF1qHmnWuNBsWbbKzZDK
	v4Nn+nSKAlcdXi7hPrnJZo4jlw2K7vO+vpksZq3vtWyo+ENvI0qb+2m1yM0gbLLRNL+QK/IsL0r
	n5CppklIA==
X-Google-Smtp-Source: AGHT+IE7T2aJ8un7c+YR6gubAFyTmLVMF7ogZlsoLBL0g/Wrejn6G3C/c8EPB22RYzZPzB8hKymS5A==
X-Received: by 2002:a05:6000:2308:b0:426:da92:d39d with SMTP id ffacd0b85a97d-42704beea3fmr1808078f8f.24.1760681317219;
        Thu, 16 Oct 2025 23:08:37 -0700 (PDT)
Message-ID: <d06d997e-78c0-4735-b1af-7a0a04badbd2@suse.com>
Date: Fri, 17 Oct 2025 08:08:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 02/10] x86/HPET: disable unused channels
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
 <8913e64b-d172-43f9-9c4d-447ba4984c9a@suse.com> <aPEd00xPCAc0hsr1@Mac.lan>
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
In-Reply-To: <aPEd00xPCAc0hsr1@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.10.2025 18:31, Roger Pau Monné wrote:
> On Thu, Oct 16, 2025 at 09:31:42AM +0200, Jan Beulich wrote:
>> Keeping channels enabled when they're unused is only causing problems:
>> Extra interrupts harm performance, and extra nested interrupts could even
>> have caused worse problems.
>>
>> Note that no explicit "enable" is necessary - that's implicitly done by
>> set_channel_irq_affinity() once the channel goes into use again.
>>
>> Along with disabling the counter, also "clear" the channel's "next event",
>> for it to be properly written by whatever the next user is going to want
>> (possibly avoiding too early an IRQ).
>>
>> Further, along the same lines, don't enable channels early when starting
>> up an IRQ. This similarly should happen no earlier than from
>> set_channel_irq_affinity() (here: once a channel goes into use the very
>> first time). This eliminates a single instance of
>>
>> (XEN) [VT-D]INTR-REMAP: Request device [0000:00:1f.0] fault index 0
>> (XEN) [VT-D]INTR-REMAP: reason 25 - Blocked a compatibility format interrupt request
>>
>> during boot. (Why exactly there's only one instance, when we use multiple
>> counters and hence multiple IRQs, I can't tell. My understanding would be
>> that this was due to __hpet_setup_msi_irq() being called only after
>> request_irq() [and hence the .startup handler], yet that should have
>> affected all channels.)
>>
>> Fixes: 3ba523ff957c ("CPUIDLE: enable MSI capable HPET for timer broadcast")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, but I realized I want to make one further change here: I want to clear
the pointer when handing off the channel to another CPU while detaching. That
is the one point where we clearly know the affinity moves off of the CPU that
is recording the channel as least recently used one. Are you happy for me to
keep the R-b with that extra change?

>> ---
>> A window still remains for IRQs to be caused by stale comparator values:
>> hpet_attach_channel() is called ahead of reprogram_hpet_evt_channel().
>> Should we also write the comparator to "far into the future"?
> 
> I think we can possibly live with this to avoid doing an extra MMIO
> access?

I think we can; which one's more beneficial I simply don't know.

Jan

