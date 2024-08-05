Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D78947AC8
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 13:59:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772100.1182534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sawMG-00006S-LU; Mon, 05 Aug 2024 11:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772100.1182534; Mon, 05 Aug 2024 11:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sawMG-0008Vc-IE; Mon, 05 Aug 2024 11:58:36 +0000
Received: by outflank-mailman (input) for mailman id 772100;
 Mon, 05 Aug 2024 11:58:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I4ub=PE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sawME-0008VW-Cz
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 11:58:34 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0952be56-5322-11ef-8776-851b0ebba9a2;
 Mon, 05 Aug 2024 13:58:32 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a7a9185e1c0so958918266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Aug 2024 04:58:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9c0c557sm443978566b.53.2024.08.05.04.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Aug 2024 04:58:31 -0700 (PDT)
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
X-Inumbo-ID: 0952be56-5322-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722859112; x=1723463912; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E1KOzPMdnY/bhNr3czsLkBgmv07wzxPYhtsRSLD3708=;
        b=e3NjvPjYNehrjTRdP/bsN4bTMM+/ziO+eR+vC4sLGDrM2mmKxuUzo/C8z4RqtuvZWl
         jJNvdyvfuAmNpHRxQ1zY8DOCwgMhwvHabLwgaF8PONek9/DQEzLca3fBKcTHRzxKj3q0
         36SO85EHrGU5GYOLSbEZIe5egvcS5OwimTv0cy0MeKLyOPlFtT+hAlBt4Ju7HZnglBUH
         /U3uzyGMbpjuqlXZ3oVhmiX3xYYkLQhiednpqzd2+YEvkKsK9W/CJJVm5x4w4aSMm+8o
         30LwBnb1PU1yx5KN7Uj9YC4l8mCUCKcAXv1sbNLB78M2ioCIJ5TYcGPsUwvhy4fEHvls
         HwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722859112; x=1723463912;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1KOzPMdnY/bhNr3czsLkBgmv07wzxPYhtsRSLD3708=;
        b=Yi7yhDitv4shClolCoo3fb1sbl0dShlKkqRgnpqSiCjUDmsTVOaybpii6+1ri+OMPv
         D7hjR+mv8A+Q13T4/c8eZJJjhVxz98ApGLzOGl1dvzo8oipdHkzvDX4t45lWpJi6IR+d
         H0sctMTW1dBKEO+7HgtLyw7J7/TSaIbR7k8ZjPebPFd5ho1vqTQPbI0xABvVVijM2S7o
         E1Nn+lgotLb+vamCVFllRg1ZvJLsZd9fLkiFGBQzZsG2JHs5PKrO0dB4gu5M3NX5G4Xa
         akYV3fKRPX/VJ266jzbw+F8yS0+b0dr01ZVyZQKStRJM/Oax+bDGzNxx2cVSr09sEiyX
         6Eow==
X-Forwarded-Encrypted: i=1; AJvYcCWjAcVVotogZsVHPWK1OcpY96fW8+HpvS35rAi8DetYITe3q24N8E0SueLlGU7IHlAoOGfiUJzwd0t33W9k+/ARNQ4/dyrgg6g14nM27qo=
X-Gm-Message-State: AOJu0YzsaeeTtbEwWwW9XY1Sw5R8IIxC+Yz4xUHclpiYejGYfyRhadtt
	Pp+GQs/jdOVhPE4Z3ZthpAw+SVX3uVuGR3yuiDpFChxKedQgvbBUJcDeryCvvQ==
X-Google-Smtp-Source: AGHT+IGmDjaMCxV4T8cDlXffTzqKUS/nd2GDjVCRyV6JBDijempu5D7EQTuUquGx4i/Ow5fZOuzXeA==
X-Received: by 2002:a17:907:8692:b0:a7a:a33e:47b7 with SMTP id a640c23a62f3a-a7dc512ca02mr731263466b.69.1722859111579;
        Mon, 05 Aug 2024 04:58:31 -0700 (PDT)
Message-ID: <0fdfb454-62a4-4d68-9eaa-a5ce7b82f0a2@suse.com>
Date: Mon, 5 Aug 2024 13:58:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] xen/device-tree: Move Arm's setup.c bootinfo
 functions to common
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <cover.1722856894.git.oleksii.kurochko@gmail.com>
 <712aebb98a689b248f29e783eb8e72a5e7568e5b.1722856894.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <712aebb98a689b248f29e783eb8e72a5e7568e5b.1722856894.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.08.2024 13:33, Oleksii Kurochko wrote:
> From: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> Arm's setup.c contains a collection of functions for parsing memory map
> and other boot information from a device tree. Since these routines are
> generally useful on any architecture that supports device tree booting,
> move them into xen/common/device-tree.
> 
> Also, common/device_tree.c has been moved to the device-tree folder with
> the corresponding updates to common/Makefile and common/device-tree/Makefile.
> 
> Mentioning of arm32 is changed to CONFIG_SEPARATE_XENHEAP in comparison with
> original ARM's code as now it is moved in common code.
> 
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Julien Grall <jgrall@amazon.com>
> ---
> Changes in V8:
>  - add the version of Xen from which bootinfo.c was derived from.
>  - update the commit message.
>  - add Acked-by: Julien Grall <jgrall@amazon.com>.
> ---
> Changes in V7:
>  - move obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/ to proper place in common/Makefile.
>  - rename macros __XEN_BOOTFDT_H__ to XEN_BOOTFDT_H to not violate MISRA rule 21.1.
>  - drop definition of "#define MAX_FDT_SIZE SZ_2M" in xen/bootfdt.h as it is expected to
>    be arch-specific. Back "#define MAX_FDT_SIZE SZ_2M" to arm/setup.h where it was before
>    these changes.
>  - git mv xen/common/device_tree.c xen/common/device-tree/ and update correspondingly
>    Makefiles of common/ and common/device-tree
>  - update the commit message
> ---
> Changes in V6:
>  - update the version of the patch to v6.   
> ---
> Changes in V5:
>  - After rebase the Shawn's patch v4 on top of current staging the following
>    was done:
>    - add xen/include/xen/bootfdt.h to MAINTAINERS file.
>    - drop message "Early device tree parsing and".
>    - After rebase on top of the current staging the following changes were done:
>      - init bootinfo variable in <common/device-tree/bootinfo.c> with BOOTINFO_INIT;
>      - update the code of dt_unreserved_regions():
>          CONFIG_STATIC_SHM related changes and getting of reserved_mem
>          bootinfo_get_shmem()
>      - update the code of meminfo_overlap_check():
>          add check ( INVALID_PADDR == bank_start ) to if case.
>      - update the code of check_reserved_regions_overlap():
>          CONFIG_STATIC_SHM related changes.
>      - struct bootinfo was updated ( CONFIG_STATIC_SHM changes )
>      - add shared_meminfo ( because of CONFIG_STATIC_SHM )
>      - struct struct membanks was update with __struct group so <xen/kernel> is
>        neeeded to be included in bootfdt.h
>      - move BOOTINFO_ACPI_INIT, BOOTINFO_SHMEM_INIT, BOOTINFO_INIT to generic bootfdt.h
>      - bootinfo_get_reserved_mem(), bootinfo_get_mem(), bootinfo_get_acpi(),
>        bootinfo_get_shmem() and bootinfo_get_shmem_extra() were moved to xen/bootfdt.h
>    - s/arm32/CONFIG_SEPARATE_XENHEAP/
>    - add inclusion of <xen/macros.h> because there are function in <xen/bootfdt.h> which
>      are using container_of().
>  ---
> Changes in v4:
>   - create new xen/include/bootinfo.h rather than relying on arch's
>     asm/setup.h to provide required definitions for bootinfo.c
>   - build bootinfo.c as .init.o
>   - clean up and sort bootinfo.c's #includes
>   - use CONFIG_SEPARATE_XENHEAP rather than CONFIG_ARM_32 to guard
>     xenheap-specific behavior of populate_boot_allocator
>   - (MAINTAINERS) include all of common/device-tree rather than just
>     bootinfo.c
> ---
>  MAINTAINERS                          |    2 +
>  xen/arch/arm/include/asm/setup.h     |  185 +--
>  xen/arch/arm/setup.c                 |  432 -----
>  xen/common/Makefile                  |    2 +-
>  xen/common/device-tree/Makefile      |    2 +
>  xen/common/device-tree/bootinfo.c    |  459 ++++++
>  xen/common/device-tree/device_tree.c | 2253 ++++++++++++++++++++++++++
>  xen/common/device_tree.c             | 2253 --------------------------
>  xen/include/xen/bootfdt.h            |  195 +++
>  9 files changed, 2913 insertions(+), 2870 deletions(-)
>  create mode 100644 xen/common/device-tree/Makefile
>  create mode 100644 xen/common/device-tree/bootinfo.c
>  create mode 100644 xen/common/device-tree/device_tree.c

Can the moved file please be in sync with its directory, naming (i.e. dash
vs underscore) wise? I also expect the diff would be quite a bit smaller
with git's rename detection properly enabled.

Jan

