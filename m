Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1450080D02C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 16:57:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652345.1018128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCieC-0003nU-GB; Mon, 11 Dec 2023 15:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652345.1018128; Mon, 11 Dec 2023 15:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCieC-0003kC-Cs; Mon, 11 Dec 2023 15:56:44 +0000
Received: by outflank-mailman (input) for mailman id 652345;
 Mon, 11 Dec 2023 15:56:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mRXB=HW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rCieA-0003k6-Sj
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 15:56:42 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df939bf6-983d-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 16:56:40 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3333fbbeab9so4177201f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 07:56:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c1-20020a5d4cc1000000b0033350f5f94dsm8825192wrt.101.2023.12.11.07.56.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 07:56:39 -0800 (PST)
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
X-Inumbo-ID: df939bf6-983d-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702310200; x=1702915000; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r13stXC5ji4vxBAunrYXWNMq3hdqlLaSIgVzS5N+Ytw=;
        b=OsZUmXIaqHxzbNTZpxp+xMQua6IvKc+m2ZkSWUTwZ5WZooczgsxf7hwT1O4K023iWt
         UFVvyJkuxwIU9PQKhoDZA7uI7Hz1u9Pb9KszbEp8sMvSkVv+RDsKCtS+oS55PY0GLM1M
         RzGCzNVDGbcP3FeNtr4dOEnky8Z11UtkjdWs8cqyVRPjna9QlGo7Kh+6k4M0/9lcULTx
         /DZwkSA4N1D3YGCOxmD1456LM1LMX2KULpK/6qiLJupkk7Uww9IXEchhNwCSBOPLARAS
         h7SHh25/5jROZLKhY+4MZPWntAYnxfclHKOb0vazBktEVERKWDNjSq8UUmUgPI77Kbw9
         8tEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702310200; x=1702915000;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r13stXC5ji4vxBAunrYXWNMq3hdqlLaSIgVzS5N+Ytw=;
        b=k+D0k55ko2MxrDr66v2na3xDldHjIKW+RXVVrCLnerTyDMQ2pRdf+UshA3MsrmVUdM
         ZnGCUt6aKBSxMASwjKISYUwXAyBaOk9qOGYmuPviZ20W+S0nM5bLPOAXoZuHlE37+Yfq
         PUeVuQmCzp8Fd9hAlSPBIsMCu3T3UuwTw4kbxx5gc6kFEZA0pUYScGj8tq5ANANkyPvz
         f4yyYwdUXKgGoi3L+cKzCB0NwofGxwD79bWmCTixZL0t+G8slRROxVq25IWdp8YqIIcL
         3YpCp2bikfr+ADnu+12RmT9eOWMAW/c0wW3+30Dmh8RCLXNdA9Rj+URHY1tL3ymEwr8m
         DlcA==
X-Gm-Message-State: AOJu0YwSm8AVftBZPTdJLRUXDYued5nD4wRY+m8ouY2JJ5QjvW6Tvgx0
	9KCOt9hRgdsxeXBMNtrOxzzLS+quiwmSq2YC2AjR
X-Google-Smtp-Source: AGHT+IHPzIZKitIoWtUeVWhtomZ672RChyyT0VvhwEKtimmfUu+G4yFm1EZODhVluW9QKRERX5dj7A==
X-Received: by 2002:adf:ebd0:0:b0:333:4fd1:1c6d with SMTP id v16-20020adfebd0000000b003334fd11c6dmr2290216wrn.31.1702310199647;
        Mon, 11 Dec 2023 07:56:39 -0800 (PST)
Message-ID: <7ec81395-298d-4d50-89af-d54f756ef657@suse.com>
Date: Mon, 11 Dec 2023 16:56:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 1/1] xen/Makefile: introduce ARCH_FIXED_CONFIG for
 randconfig
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1701966261.git.oleksii.kurochko@gmail.com>
 <c95959adca794a90465abd10f579dc9159a7697f.1701966261.git.oleksii.kurochko@gmail.com>
 <f9ceb8f7-a664-452b-8b38-f74b36386e33@citrix.com>
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
In-Reply-To: <f9ceb8f7-a664-452b-8b38-f74b36386e33@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.12.2023 21:17, Andrew Cooper wrote:
> On 07/12/2023 5:03 pm, Oleksii Kurochko wrote:
>> ARCH_FIXED_CONFIG is required in the case of randconfig
>> and CI for configs that aren't ready or are not
>> supposed to be implemented for specific architecture.
>> These configs should always be disabled to prevent randconfig
>> related tests from failing.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>>  xen/Makefile | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/Makefile b/xen/Makefile
>> index ca571103c8..8ae8fe1480 100644
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -336,11 +336,14 @@ ifeq ($(config-build),y)
>>  # *config targets only - make sure prerequisites are updated, and descend
>>  # in tools/kconfig to make the *config target
>>  
>> +ARCH_FORCED_CONFIG := $(srctree)/arch/$(SRCARCH)/configs/randomforced.config
>> +
>>  # Create a file for KCONFIG_ALLCONFIG which depends on the environment.
>>  # This will be use by kconfig targets allyesconfig/allmodconfig/allnoconfig/randconfig
>>  filechk_kconfig_allconfig = \
>>      $(if $(findstring n,$(XEN_HAS_CHECKPOLICY)), echo 'CONFIG_XSM_FLASK_POLICY=n';) \
>> -    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG);) \
>> +    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG); \
>> +    $(if $(wildcard $(ARCH_FORCED_CONFIG)), cat $(ARCH_FORCED_CONFIG);) ) \
>>      :
>>  
>>  .allconfig.tmp: FORCE
> 
> We already have infrastructure for this.  What's wrong with
> EXTRA_FIXED_RANDCONFIG?

What I don't understand here is why dealing with the issue would want
limiting to gitlab-CI. Anyone could run randconfig on their own, and
imo it would be helpful if the same issue(s) could be prevented there,
too. Hence my earlier suggestion to have a snippet which can be used
by "interested" parties. And once dealt with in e.g. the makefile
there should not be a need for any overrides in the CI config anymore.

Jan

> ---8<---
> 
> CI: Revert "automation: Drop ppc64le-*randconfig jobs", fix Randconfig
> with existing infrastructure
>     
> This reverts commit cbb71b95dd708b1e26899bbe1e7bf9a85081fd60.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> diff --git a/automation/gitlab-ci/build.yaml
> b/automation/gitlab-ci/build.yaml
> index 32af30ccedc9..346d0400ed09 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -538,6 +538,7 @@ archlinux-current-gcc-riscv64-randconfig:
>      RANDCONFIG: y
>      EXTRA_FIXED_RANDCONFIG:
>        CONFIG_COVERAGE=n
> +      CONFIG_GRANT_TABLE=n
>  
>  archlinux-current-gcc-riscv64-debug-randconfig:
>    extends: .gcc-riscv64-cross-build-debug
> @@ -547,6 +548,7 @@ archlinux-current-gcc-riscv64-debug-randconfig:
>      RANDCONFIG: y
>      EXTRA_FIXED_RANDCONFIG:
>        CONFIG_COVERAGE=n
> +      CONFIG_GRANT_TABLE=n
>  
>  # Power cross-build
>  debian-bullseye-gcc-ppc64le:
> @@ -563,6 +565,26 @@ debian-bullseye-gcc-ppc64le-debug:
>      KBUILD_DEFCONFIG: ppc64_defconfig
>      HYPERVISOR_ONLY: y
>  
> +debian-bullseye-gcc-ppc64le-randconfig:
> +  extends: .gcc-ppc64le-cross-build
> +  variables:
> +    CONTAINER: debian:bullseye-ppc64le
> +    KBUILD_DEFCONFIG: ppc64_defconfig
> +    RANDCONFIG: y
> +    EXTRA_FIXED_RANDCONFIG:
> +      CONFIG_COVERAGE=n
> +      CONFIG_GRANT_TABLE=n
> +
> +debian-bullseye-gcc-ppc64le-debug-randconfig:
> +  extends: .gcc-ppc64le-cross-build-debug
> +  variables:
> +    CONTAINER: debian:bullseye-ppc64le
> +    KBUILD_DEFCONFIG: ppc64_defconfig
> +    RANDCONFIG: y
> +    EXTRA_FIXED_RANDCONFIG:
> +      CONFIG_COVERAGE=n
> +      CONFIG_GRANT_TABLE=n
> +
>  # Yocto test jobs
>  yocto-qemuarm64:
>    extends: .yocto-test-arm64
> 


