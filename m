Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E59808512
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 11:01:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649741.1014568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBBBT-00080O-R4; Thu, 07 Dec 2023 10:00:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649741.1014568; Thu, 07 Dec 2023 10:00:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBBBT-0007yY-OA; Thu, 07 Dec 2023 10:00:43 +0000
Received: by outflank-mailman (input) for mailman id 649741;
 Thu, 07 Dec 2023 10:00:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBBBS-0007yS-OW
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 10:00:42 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a1185e8-94e7-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 11:00:40 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40c0a11a914so7993175e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 02:00:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fa7-20020a05600c518700b0040648217f4fsm1394496wmb.39.2023.12.07.02.00.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 02:00:39 -0800 (PST)
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
X-Inumbo-ID: 7a1185e8-94e7-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701943240; x=1702548040; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oXOhIWCKEnB2duJ8PCYjvphliNfQP4zB5dsCyjESU/4=;
        b=MNt5OXN4Y/5ivgugePyl/hCDWrB9EqqXoxiP0GRjtrl1yY8qPxlnuqSOlHmTml9lsb
         QLV5j1hg+j9jH/UXZBV5wMun5U9k3qOecPWQ0qe/zR5eZCbFF9CO1Lu9RKFbmMb0yvrr
         z6hTc4UvMJg++5FlDhBM57FJJlGUpCQJWPslOwXphq6W0A2o+X424PMDkEr0qBAfQM4Q
         k8d8m4N/Wb+b7uZq47dDupu1xUsERUaSRtziEd/nClodEG+HD+BLRKNMx/wZKCikcKLA
         zuRSEuqARxfte/2FWlqugjdTBqRWYXZGc0o9CIc5/7FXBol/jK11nHSmUrlSgFX7S+bw
         wdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701943240; x=1702548040;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oXOhIWCKEnB2duJ8PCYjvphliNfQP4zB5dsCyjESU/4=;
        b=dKLGjWr9VMRAGWMNYLEMHd7+fSU21DHbdRiE59b8c2ynvsDRlNV97WBvJsV1qDK99/
         EE4Iw8IVJfKe31inGA37qf//u3FweesRUsxS4ozEbh0Pn6Lqx06uyjl0VgqCEQKtLOE4
         JsOsURgMaTSLpCww3MKamW6nRFeluRMQTkwX9JaInv5KLVzd8EhVN/JhFkyfm8OZ75dF
         iR9ht1QbFkRsQ5VcvwxJ9MHm4UkjPaVpmxNiZ0RKydkYVzgt7GhmLzN0yrTpZumdRtx+
         92BuJq2Zl4PtnO9fkXQ8q/QndhRWcoyOzMnCj1/QcQ2LGtQCuwSSw7CtNsqhLcQljcBP
         lQzQ==
X-Gm-Message-State: AOJu0Yx/LTbYoheuIAEzDDj05/5Pyy3Ky8LKJAvB2qjKLmBehS7OwvxE
	Dr88i5ISM9SuwHJg6ubo23oS
X-Google-Smtp-Source: AGHT+IGJi/eCBxm350s8xlgFKfRmnCWGcTaWkZ7jFawqI5v9szX4/JIR1fFl7PkOkwXjmDLZ5pE1mQ==
X-Received: by 2002:a05:600c:22d9:b0:40c:1e66:4dc6 with SMTP id 25-20020a05600c22d900b0040c1e664dc6mr1224191wmg.106.1701943239648;
        Thu, 07 Dec 2023 02:00:39 -0800 (PST)
Message-ID: <008d0c66-6816-4d12-9e1f-1878e982f9fc@suse.com>
Date: Thu, 7 Dec 2023 11:00:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/39] xen/riscv: disable unnecessary configs
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <b4e85f8f58787b4d179022973ce25673d6b56e36.1700761381.git.oleksii.kurochko@gmail.com>
 <fdfda320-b73b-4830-8f1b-d261b02bcdde@suse.com>
 <22fa451f7b165a00082443a35077e98e101c22e4.camel@gmail.com>
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
In-Reply-To: <22fa451f7b165a00082443a35077e98e101c22e4.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.12.2023 10:22, Oleksii wrote:
> On Tue, 2023-12-05 at 16:38 +0100, Jan Beulich wrote:
>>> On 24.11.2023 11:30, Oleksii Kurochko wrote:
>>>>> The patch also fixes the build script as conf util expects
>>>>> to have each config on separate line.
>>>
>>> The approach doesn't really scale (it's already odd that you add
>>> the
>>> (apparently) same set four times. There's also zero justification
>>> for
>>> this kind of an adjustment (as per discussion elsewhere I don't
>>> think
>>> we should go this route, and hence arguments towards convincing me
>>> [and
>>> perhaps others] would be needed here).
> I agree that this may not be the best approach, but it seems like we
> don't have too many options to turn off a config for randconfig.
> 
> To be honest, in my opinion (IMO), randconfig should either be removed
> or allowed to fail until most of the functionality is ready. Otherwise,
> there should be a need to introduce HAS_* or depend on
> 'SUPPORTED_ARCHS' for each config, or introduce a lot of stubs.
> 
> Could you please suggest a better option?

As to dropping randconfig tests, I'd like to refer you to Andrew, who
is of the opinion that it was wrong to drop them for ppc. (I'm agreeing
with him when taking a theoretical perspective, but I'm not happy with
the practical consequences.)

As to a better approach: Instead of listing the same set of options
several times, can't there be a template config which is used to force
randconfig to not touch certain settings? In fact at least for non-
randconfig purposes I thought tiny64_defconfig / riscv64_defconfig
already serve kind of a similar purpose. Imo the EXTRA_*CONFIG overrides
are there for at most very few special case settings, not for purposes
like you use them here.

>>>>> --- a/automation/gitlab-ci/build.yaml
>>>>> +++ b/automation/gitlab-ci/build.yaml
>>>>> @@ -522,6 +522,38 @@ archlinux-current-gcc-riscv64:
>>>>>      CONTAINER: archlinux:current-riscv64
>>>>>      KBUILD_DEFCONFIG: tiny64_defconfig
>>>>>      HYPERVISOR_ONLY: y
>>>>> +    EXTRA_XEN_CONFIG:
>>>>> +      CONFIG_COVERAGE=n
>>>>> +      CONFIG_GRANT_TABLE=n
>>>>> +      CONFIG_SCHED_CREDIT=n
>>>>> +      CONFIG_SCHED_CREDIT2=n
>>>>> +      CONFIG_SCHED_RTDS=n
>>>>> +      CONFIG_SCHED_NULL=n
>>>>> +      CONFIG_SCHED_ARINC653=n
>>>>> +      CONFIG_TRACEBUFFER=n
>>>>> +      CONFIG_HYPFS=n
>>>>> +      CONFIG_GRANT_TABLE=n
>>>>> +      CONFIG_SPECULATIVE_HARDEN_ARRAY=n
>>>>> +      CONFIG_ARGO=n
>>>>> +      CONFIG_HYPFS_CONFIG=n
>>>>> +      CONFIG_CORE_PARKING=n
>>>>> +      CONFIG_DEBUG_TRACE=n
>>>>> +      CONFIG_IOREQ_SERVER=n
>>>>> +      CONFIG_CRASH_DEBUG=n
>>>>> +      CONFIG_KEXEC=n
>>>>> +      CONFIG_LIVEPATCH=n
>>>>> +      CONFIG_MEM_ACCESS=n
>>>>> +      CONFIG_NUMA=n
>>>>> +      CONFIG_PERF_COUNTERS=n
>>>>> +      CONFIG_HAS_PMAP=n
>>>>> +      CONFIG_TRACEBUFFER=n
>>>>> +      CONFIG_XENOPROF=n
>>>>> +      CONFIG_COMPAT=n
>>>>> +      CONFIG_COVERAGE=n
>>>>> +      CONFIG_UBSAN=n
>>>>> +      CONFIG_NEEDS_LIBELF=n
>>>>> +      CONFIG_XSM=n
>>>>> +
>>>>>  
>>>>>  archlinux-current-gcc-riscv64-debug:
>>>>>    extends: .gcc-riscv64-cross-build-debug
>>>
>>> I think I've said so elsewhere before: Please avoid introducing
>>> double
>>> blank lines, unless entirely unavoidable (for reasons I cannot
>>> think
>>> of).
> Sorry for that; I am not doing that on purpose. It's just a big patch
> series, and I missed that double blank. I will try to be more
> attentive.
> 
> Do you think it makes sense to add a script to perform basic code style
> checks, similar to what Linux has?

Such a script would be nice, but it doesn't exist and re-using existing
checkers has also proven controversial. There's actually an ongoing
discussion on this topic which you may want to follow.

Jan

