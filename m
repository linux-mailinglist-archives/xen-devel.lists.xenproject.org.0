Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4452BB0D248
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 09:00:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051977.1420460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue6zG-0007Mu-Ti; Tue, 22 Jul 2025 07:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051977.1420460; Tue, 22 Jul 2025 07:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue6zG-0007Kd-Q9; Tue, 22 Jul 2025 07:00:30 +0000
Received: by outflank-mailman (input) for mailman id 1051977;
 Tue, 22 Jul 2025 07:00:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ue6zF-0007K2-CJ
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 07:00:29 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 876d023f-66c9-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 09:00:19 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a6d1369d4eso3023297f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 00:00:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6b4c76sm69133185ad.116.2025.07.22.00.00.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 00:00:18 -0700 (PDT)
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
X-Inumbo-ID: 876d023f-66c9-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753167619; x=1753772419; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Za1hrUrj51XniqSUM20yg60bJ3bl91NbLP4PCHAi/xE=;
        b=czVIuvdCN6yAKZYx7pQ6dBCXCevebhDoey/c8vexZVm6Cf/i0WPWG5U6wmFUmQA4ft
         TBJSxFdVVtmZ+r4WvrUSYLDrIwwHbzyqDgNFoN+944wyU47vmOCLBTitubBl9chYn6Kj
         ijYctJtJiNLnXubE+mjlQll4OKIk/FKfDOTnwRKSgPURKleCyWB7S0qaqT/PrUeZ8/fm
         BNSFdk8Uefvh6D+PwvR2a7ma4W+DkZ7gv8lfmvY1Rl9nYx7suw+pq4vWz0grp2M4CL/F
         q0Y5ij2ze1ozab+fzrWRT4Oc5xGwpsCDO8X9fYGa4d7J303+XgA2n0EXOtsC3PGKchYp
         QvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753167619; x=1753772419;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Za1hrUrj51XniqSUM20yg60bJ3bl91NbLP4PCHAi/xE=;
        b=EgYK9H1jRYqyClvSnnLbDl+6HWlbgAZt1gtKFyU4CGEQc+eTtfoOo7eUJ4fs1XnAdk
         0Uaol9w1gd9epCye9BYQajQnjyEGAk3Mx+34oi3/FuM2k3baTlxScVhp6uBDPNR6/8RU
         2wjEr2qciiYxVFzQ/H2l0DmmTWG6I0yoTeVL1F1MLXZGwLnG+9Zsx8y2AdWTlNzKdK6L
         KlA29DZ05vD5xcHiWPjDbr9olKa6SKzay/cuBnR+vcbJQGzhFpVJijliANSBXzahAfip
         eQcM/2FhnUtTCVwiaxd+PzPHdQX/tAJLNMl+3KfJevU/9prZlL2PUCxLPf5IpTUsfNnz
         Tdhg==
X-Forwarded-Encrypted: i=1; AJvYcCWNLBz//ULRXxPqBotO732IOyM/xhbVm0qnThEVNxTOOnc7Di05+NdDousn8fcw54uYGSgJONVhXuA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwRQGVxlggCxvGKygrwvBZelr11L+8zJFhoOsRdhpEuOLJJoPtI
	l9xd+2ZZBWr1jKdbOf+KSwWBr6oSSw61PZRKDk/d6cjxZrzM3IDFDpauvT9nyfHgNg==
X-Gm-Gg: ASbGnct1V2VUImbpyYU8tBc9gElY95Ymo3OzIKDfi4stPwwI9Jz7Z6vi9O1lSlPs4Mk
	7XA7DPXqXsLoEwfe2EJfX98BnmfSBK9ZjoqrwZGZYjiowd/0kllULi3HYCJ7qbaSzy+llOVSVpq
	wz8Vl/MwNeos2OcEjp2BAlBENRC1+nzsU1csG4AUHCnqAQSkreJtbseVoVu32fC2Ui2X2N9g6Kd
	vI456iFRFKA71XwbOFLf5RqhmPU/Huovc1E2O7pneu+V8wnxSQJ2zMrIsQINYM40nS3q2Ib87On
	vbFOx1vkqy4v3L/HQTO5B7A0TT7SSskaSkPxa9bsS+4tpMqbpgd9GQ4uLgfCWuPUdPrU6dnsW10
	VjrerFR9/dqzDWzM4zDTX57pcDyf4nqpUR4PdHE4uCNvhm+S41HcJhA18hiE0HN0k2q5bJW+0ku
	tj0Sh5iwnP33im6I8Jfw==
X-Google-Smtp-Source: AGHT+IH9toq9ZouoSE1bWCECdthog+vhHd7wklj3tGHhbEbpc1ObjAKo05GoLvt+KUmQKoVqiyb1rA==
X-Received: by 2002:a05:6000:4701:b0:3a6:d92f:b7a0 with SMTP id ffacd0b85a97d-3b60ddc8c3emr14285182f8f.58.1753167618926;
        Tue, 22 Jul 2025 00:00:18 -0700 (PDT)
Message-ID: <f179fb97-e6f8-4329-8d92-87f31b9b42d5@suse.com>
Date: Tue, 22 Jul 2025 09:00:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/11] Allow x86 to unflatten DTs
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20250722000525.7247-1-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20250722000525.7247-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2025 02:05, Alejandro Vallejo wrote:
> Hi,
> 
> Really minor changes wrt v7
> 
>   1. s/BOOTMOD_XSM/BOOTMOD_XSM_POLICY/
>   2. Remove stale obj-y statements in the last patch
> 
> pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/1940366600
> 
> v7: https://lore.kernel.org/xen-devel/20250715161108.141126-1-alejandro.garciavallejo@amd.com>
> v6: https://lore.kernel.org/xen-devel/20250708180721.2338036-1-alejandro.garciavallejo@amd.com/
> v5: https://lore.kernel.org/xen-devel/20250701105706.86133-1-agarciav@amd.com/
> v4: https://lore.kernel.org/xen-devel/20250620182859.23378-1-agarciav@amd.com/
> v3: https://lore.kernel.org/xen-devel/20250613151612.754222-1-agarciav@amd.com/
> v3: https://lore.kernel.org/xen-devel/20250613151612.754222-1-agarciav@amd.com/
> v2: https://lore.kernel.org/xen-devel/20250605194810.2782031-1-agarciav@amd.com/
> v1: https://lore.kernel.org/xen-devel/20250530120242.39398-1-agarciav@amd.com/
> 
> 
> Alejandro Vallejo (11):
>   x86: Replace arch-specific boot_module with common one
>   xen: Refactor kernel_info to have a header like boot_domain
>   x86: Replace arch-specific boot_domain with the common one
>   xen/dt: Move bootfdt functions to xen/bootfdt.h
>   xen/dt: Move bootinfo functions to a new bootinfo.h
>   xen/dt: Rename bootfdt.c -> bootinfo-fdt.c
>   xen/dt: Extract bootinfo-independent functions to bootfdt.c
>   xen/dt: Extract helper to map nodes to module kinds
>   xen: Split HAS_DEVICE_TREE in two
>   xen/dt: ifdef out DEV_DT-related bits from device_tree.{c,h}
>   xen/dt: Allow CONFIG_DEVICE_TREE_PARSE to include device-tree/

Pretty clearly, as per the build-each-commit job in CI, there must have been an
issue in the middle of the series:

In file included from ./arch/x86/include/asm/bootinfo.h:15,
                 from arch/x86/cpu/microcode/core.c:37:
./arch/x86/include/asm/boot-domain.h:13:8: error: redefinition of 'struct boot_domain'
   13 | struct boot_domain {
      |        ^~~~~~~~~~~
In file included from ./arch/x86/include/asm/bootinfo.h:11:
./include/xen/bootfdt.h:103:8: note: originally defined here
  103 | struct boot_domain {
      |        ^~~~~~~~~~~

and similarly

In file included from ./arch/x86/include/asm/bootinfo.h:15,
                 from arch/x86/pv/dom0_build.c:17:
./arch/x86/include/asm/boot-domain.h:13:8: error: redefinition of 'struct boot_domain'
   13 | struct boot_domain {
      |        ^~~~~~~~~~~
In file included from ./arch/x86/include/asm/bootinfo.h:11:
./include/xen/bootfdt.h:103:8: note: originally defined here
  103 | struct boot_domain {
      |        ^~~~~~~~~~~

Jan

