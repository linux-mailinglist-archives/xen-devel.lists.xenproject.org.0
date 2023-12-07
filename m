Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F37848089F4
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 15:12:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649903.1014998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBF6b-0001th-M1; Thu, 07 Dec 2023 14:11:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649903.1014998; Thu, 07 Dec 2023 14:11:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBF6b-0001qf-IC; Thu, 07 Dec 2023 14:11:57 +0000
Received: by outflank-mailman (input) for mailman id 649903;
 Thu, 07 Dec 2023 14:11:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBF6Z-0001qP-B4
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 14:11:55 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 927d6100-950a-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 15:11:53 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3333fbbeab9so922699f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 06:11:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a5-20020a5d5085000000b00334b2272a7asm1556260wrt.2.2023.12.07.06.11.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 06:11:53 -0800 (PST)
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
X-Inumbo-ID: 927d6100-950a-11ee-98e7-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701958313; x=1702563113; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0bU+SP0ATcx/VErECdb/4iyc3s29aMlxA3/EhG1ByoA=;
        b=BJoMJJQo53/jqhfy722irMl/MHGLARKZhS4Yqx2mXGjywtfRv8rBUtcDaElDGP05ce
         WzYpS/iDXNfLFaG7lDrexD1TTOQ7E7whk6TybW6KHbY5GzFZVvRr4M+AF2pLU9aB4oXg
         vvxIMlpLjxWgCg2KM28tbh57/1AGuEWcrPKxNG3sS7S6Xvbq/4puMdevq6ZVgBWbUnCR
         zEPTgbJTJycPMR3WtSSlMQA02+kcCUnEZ7rtBFIJsnBYNUedi0VONJOreJC6wvVzkROa
         RLgjrMqXULWNzFgHzoMm2KxBzI04lutijiri9fpOtC6jcdfyh1JOyhg4+JNFueNlRDH5
         qEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701958313; x=1702563113;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0bU+SP0ATcx/VErECdb/4iyc3s29aMlxA3/EhG1ByoA=;
        b=cfEShupl4RJtAD97IaZ1yVlR7XtouGRtHa8+IizWt9HaOrWhKgC3J1zrSYn145yvip
         k6upjJbsFnT+nRwUK6ya1DgLTeqDhUzwZ1tsYTzV99wDxiXC8G5m2WulRIvzk+a6Fkcd
         bZutHCIArXR9ek1xsisZXYx3h9W6t5hngunUxtCfasIH94uM0YsM2t/CyeY69+GuJDv/
         NczEt47ObEP0gkJCIlKYxKj/8RHDmaVqXvV7TxqQtspM3ilCQkSpPECMlnpNpYP1cE3f
         Y+Y1NIzzvcAuTlgxEuNO5f2dpwmXwylWXFBFjkK33biZbyLFe7/STyC76ms8n9r+BFCu
         L8HQ==
X-Gm-Message-State: AOJu0YyE30moW08sfoncr6bAqUd7NIb34ulHeXBkOLd53061O2Oe9s7y
	WIMHNr65mPfjeCMLQHhgSR9r
X-Google-Smtp-Source: AGHT+IE4qDIEKVddQKi8kG2MvXjfnFIlJkRLKhoomv8Yp+JcZjy4/U3TUYdc1ees2mUrkPOS8ZHMkw==
X-Received: by 2002:a5d:66cc:0:b0:333:5e6f:7653 with SMTP id k12-20020a5d66cc000000b003335e6f7653mr1428783wrw.96.1701958313540;
        Thu, 07 Dec 2023 06:11:53 -0800 (PST)
Message-ID: <4064be07-747e-4b9c-b5da-9935aa13d91f@suse.com>
Date: Thu, 7 Dec 2023 15:11:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/39] xen/riscv: disable unnecessary configs
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <b4e85f8f58787b4d179022973ce25673d6b56e36.1700761381.git.oleksii.kurochko@gmail.com>
 <fdfda320-b73b-4830-8f1b-d261b02bcdde@suse.com>
 <22fa451f7b165a00082443a35077e98e101c22e4.camel@gmail.com>
 <008d0c66-6816-4d12-9e1f-1878e982f9fc@suse.com>
 <09d24b36380027df21d547de438da10e01eda0e0.camel@gmail.com>
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
In-Reply-To: <09d24b36380027df21d547de438da10e01eda0e0.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.12.2023 14:44, Oleksii wrote:
> On Thu, 2023-12-07 at 11:00 +0100, Jan Beulich wrote:
>> On 07.12.2023 10:22, Oleksii wrote:
>>> On Tue, 2023-12-05 at 16:38 +0100, Jan Beulich wrote:
>>>>> On 24.11.2023 11:30, Oleksii Kurochko wrote:
>>>>>>> The patch also fixes the build script as conf util expects
>>>>>>> to have each config on separate line.
>>>>>
>>>>> The approach doesn't really scale (it's already odd that you
>>>>> add
>>>>> the
>>>>> (apparently) same set four times. There's also zero
>>>>> justification
>>>>> for
>>>>> this kind of an adjustment (as per discussion elsewhere I don't
>>>>> think
>>>>> we should go this route, and hence arguments towards convincing
>>>>> me
>>>>> [and
>>>>> perhaps others] would be needed here).
>>> I agree that this may not be the best approach, but it seems like
>>> we
>>> don't have too many options to turn off a config for randconfig.
>>>
>>> To be honest, in my opinion (IMO), randconfig should either be
>>> removed
>>> or allowed to fail until most of the functionality is ready.
>>> Otherwise,
>>> there should be a need to introduce HAS_* or depend on
>>> 'SUPPORTED_ARCHS' for each config, or introduce a lot of stubs.
>>>
>>> Could you please suggest a better option?
>>
>> As to dropping randconfig tests, I'd like to refer you to Andrew, who
>> is of the opinion that it was wrong to drop them for ppc. (I'm
>> agreeing
>> with him when taking a theoretical perspective, but I'm not happy
>> with
>> the practical consequences.)
>>
>> As to a better approach: Instead of listing the same set of options
>> several times, can't there be a template config which is used to
>> force
>> randconfig to not touch certain settings? In fact at least for non-
>> randconfig purposes I thought tiny64_defconfig / riscv64_defconfig
>> already serve kind of a similar purpose. Imo the EXTRA_*CONFIG
>> overrides
>> are there for at most very few special case settings, not for
>> purposes
>> like you use them here.
> The template will be the really a good option.
> 
> What do you think about the following patch which introduces arch-
> specific allrandom.config?
> 
> diff --git a/xen/Makefile b/xen/Makefile
> index ca571103c8..cb1eca76c2 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -336,11 +336,14 @@ ifeq ($(config-build),y)
>  # *config targets only - make sure prerequisites are updated, and
> descend
>  # in tools/kconfig to make the *config target
>  
> +ARCH_ALLRANDOM_CONFIG :=
> $(srctree)/arch/$(SRCARCH)/configs/allrandom.config
> +
>  # Create a file for KCONFIG_ALLCONFIG which depends on the
> environment.
>  # This will be use by kconfig targets
> allyesconfig/allmodconfig/allnoconfig/randconfig
>  filechk_kconfig_allconfig = \
>      $(if $(findstring n,$(XEN_HAS_CHECKPOLICY)), echo
> 'CONFIG_XSM_FLASK_POLICY=n';) \
> -    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG);) \
> +    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG); \
> +    $(if $(wildcard $(ARCH_ALLRANDOM_CONFIG)), cat
> $(ARCH_ALLRANDOM_CONFIG);) ) \
>      :

Something along these lines may be okay, but why would the name be
"allrandom" when the config is used elsewhere as well? Further, besides
keeping randconfig and all*config from creating unusable configs, it
will at least want considering whether in other cases that set of fixed
values shouldn't be used as well then.

Jan

