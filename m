Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 310998058EA
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 16:39:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648052.1011982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXVj-0004mO-VB; Tue, 05 Dec 2023 15:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648052.1011982; Tue, 05 Dec 2023 15:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXVj-0004k1-Sb; Tue, 05 Dec 2023 15:38:59 +0000
Received: by outflank-mailman (input) for mailman id 648052;
 Tue, 05 Dec 2023 15:38:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAXVi-0004jv-Ns
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 15:38:58 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66c26d0a-9384-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 16:38:56 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40838915cecso59881805e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 07:38:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c444b00b003fefaf299b6sm19006941wmn.38.2023.12.05.07.38.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 07:38:55 -0800 (PST)
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
X-Inumbo-ID: 66c26d0a-9384-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701790736; x=1702395536; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QAX7ETSjirtUSC9PqhCtV6ZQHcW5zmlxA1Ng496P9Rs=;
        b=Bx7QiG/CAxqZk5Gs8k/Ew8Nz1bLtR2+Q3Xawp88Xk8hTnCqo4yHRlgvPNSj6FZkMAI
         1wVJtujLmmQVlpo+BubJDvs1VMZYEtqdgBxRw5OQLah9YxY4TcooiEmShjFz8LKzI2Dr
         iDRjH3tD+Qe1iSb2cQ0P5mgzdUTu21YV44CgGABbaXHg9DwaPTc7Ab7ufdSe79XUuorp
         hn5npu4j+WkuzxbAT/Jr8WPvSo5Ro6fsNPGeHoN2967kCE+ZYY+uPZy26PigJOdgfDLj
         WauFu46rRknJJmR/NGMbEWJkbrE9oJIxlEKw905FDiy/WCyW3oVCbfwQilK/hwD9xG8x
         G72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701790736; x=1702395536;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QAX7ETSjirtUSC9PqhCtV6ZQHcW5zmlxA1Ng496P9Rs=;
        b=gXDnEK2GRh5eBjKTi+j56a0xW6E37kXT3QCEZulpyDfseAVjFIWbKhSyTs4tnlbL23
         +Wue7UZw+XYr/iTp4yWxV0IpgdBNt8a9Ysa4J6OQeLBbR+sj5tZPq/MA0C0GYC7/nfEG
         zTk0UJywVws0KGPGDELL5ZiVpXX6wKOz3weXLiawM9/pk3iRU1L8JmhXpgXZ63IC/hY5
         2jhlnlj7u3YWoB9mKG7Pti/zVVWYBm1PoChRsN0Tm6C6makCc0PN3whLaAUrpadjZyOD
         H8cvIFeqSTnqpTuOKCCz6jD9V0vumAutu4QMP6g8vVzTFo9bqKEEZE5xcQq0a+xLOhwR
         bfLA==
X-Gm-Message-State: AOJu0Yz5zFmaITLb6RwE2iEMiupfyHOwJrkaZTVcA7RVZJ9IKygxtgmO
	/Ofz5dq1ekL7yo0EkmBCX16q
X-Google-Smtp-Source: AGHT+IFvnyulpSObkRIXdLFgT75T1A07sOn7NFYVDKdqlE3g+XpStu6g+/ZxYgPKApBaQJpXKgpf+A==
X-Received: by 2002:a05:600c:4515:b0:40b:5e1c:af2b with SMTP id t21-20020a05600c451500b0040b5e1caf2bmr626444wmo.49.1701790736006;
        Tue, 05 Dec 2023 07:38:56 -0800 (PST)
Message-ID: <fdfda320-b73b-4830-8f1b-d261b02bcdde@suse.com>
Date: Tue, 5 Dec 2023 16:38:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/39] xen/riscv: disable unnecessary configs
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <b4e85f8f58787b4d179022973ce25673d6b56e36.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <b4e85f8f58787b4d179022973ce25673d6b56e36.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> The patch also fixes the build script as conf util expects
> to have each config on separate line.

The approach doesn't really scale (it's already odd that you add the
(apparently) same set four times. There's also zero justification for
this kind of an adjustment (as per discussion elsewhere I don't think
we should go this route, and hence arguments towards convincing me [and
perhaps others] would be needed here).

> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -522,6 +522,38 @@ archlinux-current-gcc-riscv64:
>      CONTAINER: archlinux:current-riscv64
>      KBUILD_DEFCONFIG: tiny64_defconfig
>      HYPERVISOR_ONLY: y
> +    EXTRA_XEN_CONFIG:
> +      CONFIG_COVERAGE=n
> +      CONFIG_GRANT_TABLE=n
> +      CONFIG_SCHED_CREDIT=n
> +      CONFIG_SCHED_CREDIT2=n
> +      CONFIG_SCHED_RTDS=n
> +      CONFIG_SCHED_NULL=n
> +      CONFIG_SCHED_ARINC653=n
> +      CONFIG_TRACEBUFFER=n
> +      CONFIG_HYPFS=n
> +      CONFIG_GRANT_TABLE=n
> +      CONFIG_SPECULATIVE_HARDEN_ARRAY=n
> +      CONFIG_ARGO=n
> +      CONFIG_HYPFS_CONFIG=n
> +      CONFIG_CORE_PARKING=n
> +      CONFIG_DEBUG_TRACE=n
> +      CONFIG_IOREQ_SERVER=n
> +      CONFIG_CRASH_DEBUG=n
> +      CONFIG_KEXEC=n
> +      CONFIG_LIVEPATCH=n
> +      CONFIG_MEM_ACCESS=n
> +      CONFIG_NUMA=n
> +      CONFIG_PERF_COUNTERS=n
> +      CONFIG_HAS_PMAP=n
> +      CONFIG_TRACEBUFFER=n
> +      CONFIG_XENOPROF=n
> +      CONFIG_COMPAT=n
> +      CONFIG_COVERAGE=n
> +      CONFIG_UBSAN=n
> +      CONFIG_NEEDS_LIBELF=n
> +      CONFIG_XSM=n
> +
>  
>  archlinux-current-gcc-riscv64-debug:
>    extends: .gcc-riscv64-cross-build-debug

I think I've said so elsewhere before: Please avoid introducing double
blank lines, unless entirely unavoidable (for reasons I cannot think of).

Jan

