Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD14C92CEF4
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 12:24:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756763.1165496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRUUN-00032K-A8; Wed, 10 Jul 2024 10:23:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756763.1165496; Wed, 10 Jul 2024 10:23:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRUUN-00030p-7P; Wed, 10 Jul 2024 10:23:55 +0000
Received: by outflank-mailman (input) for mailman id 756763;
 Wed, 10 Jul 2024 10:23:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spoc=OK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sRUUL-00030d-Uz
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 10:23:53 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80b7f31b-3ea6-11ef-8776-851b0ebba9a2;
 Wed, 10 Jul 2024 12:23:51 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2eea7e2b0e6so40257621fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jul 2024 03:23:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c9e2be5056sm7679191a91.0.2024.07.10.03.23.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 03:23:50 -0700 (PDT)
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
X-Inumbo-ID: 80b7f31b-3ea6-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720607031; x=1721211831; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fshi/ErnAGLqRELV2vAiVMdugCAU72VzaI1Wr1q7viA=;
        b=ZBzgKh8itpGo7/ipAii+fPp/aS9iwDQNuQ8bgAXcAqKE1l8i50DzV83m1EEOb+PCxA
         FTf83RzZpHrnYprTsieWCNWt1i1plkqnmktg/zOn7m7wkOEmHyu2Um5e5orWkCglVz/p
         CrKoQXfRUa713Rjdjog++813DlLTNZkj1IZnE9Ihd4KvKjtCbirnTD6IqOBmEQ/yoBFd
         dqvMeDoC2EvUu396zNzCkjXMskVe/O6DV8sa7gtHgsO3lnRSFBdu8rZyz7Zn3IOhUF83
         CiAF1R2AUkMJ6UbAWbKYK/OWzHmxF6eIjl0pCJ+GClr78y4HFNS6xFfGvF9/erGp4z/1
         hF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720607031; x=1721211831;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fshi/ErnAGLqRELV2vAiVMdugCAU72VzaI1Wr1q7viA=;
        b=qUhYJMab43mcAvAdPwY7YeK0CzjQqDHUrhsPzBaVUjkJo6ujA7ZYHZVIda16dNeD+k
         Wgqx4R0Q6OnIlXvFm+f5S5kV12bHiTldyW8kgv6zuC6figVHZq4OPX8zQc8T73HnvXWx
         zArx7/ZmpHzlOI3ZK15EHPL4P+xxrUCJrE0/2lUVZM5qHu+uPApBlVy7wlSBsYoSfSmo
         bbltpen/NorGzm4nLnGTd5RVYwq8mJn8ByvO3U4I/95Ixh7IhKz9YkoCKxmr6MsmE/z8
         C/Io6+Tfmx9Rwn46sEowEkz/Fil9crPSukukjPPaOcS7kYdfSCMAwCEox2jzuvUzOpRC
         gFQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe8uqF2kepssOt31hSlKiOfO6STUKnRYS+WDOxV3UjXUKNjaHSSK6soRMZAzvevIGqqg5OsDQd1Pj4XNaRbFxH16Ka0RNLuPlOGknLLJk=
X-Gm-Message-State: AOJu0YxcsrQVwdWSwefgUsHNLbzex657h10G8Oczye+sg1ePKfsNBTBE
	ZJV+jMBEMZd9lmaRZ4PKnir1w21L/w2m9RLsMXQZ2+Mte510wg86sJt1S0OdKg==
X-Google-Smtp-Source: AGHT+IERCTCy9H8RzimGfMnhht+kZeYkyNPkqKrRiGFFxvNF/aLyidBzUuTreZlEZ8ykx6GUvIjpRQ==
X-Received: by 2002:a2e:9786:0:b0:2ec:56ce:d51f with SMTP id 38308e7fff4ca-2eeb30db364mr29328351fa.20.1720607031252;
        Wed, 10 Jul 2024 03:23:51 -0700 (PDT)
Message-ID: <b3c5b6d3-561d-46d0-bc1b-1b2e3cbeeba2@suse.com>
Date: Wed, 10 Jul 2024 12:23:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] xen/device-tree: Move Arm's setup.c bootinfo
 functions to common
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1720002425.git.oleksii.kurochko@gmail.com>
 <c656f0d08d4c4b515c99848b84db4171ab132f19.1720002425.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c656f0d08d4c4b515c99848b84db4171ab132f19.1720002425.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.07.2024 12:42, Oleksii Kurochko wrote:
> From: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> Arm's setup.c contains a collection of functions for parsing memory map
> and other boot information from a device tree. Since these routines are
> generally useful on any architecture that supports device tree booting,
> move them into xen/common/device-tree.
> 
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V5:
>  - add xen/include/xen/bootfdt.h to MAINTAINERS file.
>  - drop message "Early device tree parsing and".
>  - After rebase on top of the current staging the following changes were done:
>    - init bootinfo variable in <common/device-tree/bootinfo.c> with BOOTINFO_INIT;
>    - update the code of dt_unreserved_regions():
>        CONFIG_STATIC_SHM related changes and getting of reserved_mem
>        bootinfo_get_shmem() ??
>    - update the code of meminfo_overlap_check():
>        add check ( INVALID_PADDR == bank_start ) to if case.
>    - update the code of check_reserved_regions_overlap():
>        CONFIG_STATIC_SHM related changes.
>    - struct bootinfo was updated ( CONFIG_STATIC_SHM changes )
>    - add shared_meminfo ( because of CONFIG_STATIC_SHM )
>    - struct struct membanks was update with __struct group so <xen/kernel> is
>      neeeded to be included in bootfdt.h
>    - move BOOTINFO_ACPI_INIT, BOOTINFO_SHMEM_INIT, BOOTINFO_INIT to generic bootfdt.h
>    - bootinfo_get_reserved_mem(), bootinfo_get_mem(), bootinfo_get_acpi(),
>      bootinfo_get_shmem() and bootinfo_get_shmem_extra() were moved to xen/bootfdt.h
>  - s/arm32/CONFIG_SEPARATE_XENHEAP/
>  - add inclusion of <xen/macros.h> because there are function in <xen/bootfdt.h> which
>    are using container_of().

Just to mention it: This is confusing. The series is tagged "v1". I understand
you took Shawn's work, which had already undergone revisions. But then imo you
want to at least clarify how your v1 relates to his v4 or v5, i.e. then making
clear to the reader whether all of the changes above were actually done by you
on top of an earlier v4, or whether you took the earlier v5 verbatim.

But anyway, this will need looking at by Arm folks.

Jan

