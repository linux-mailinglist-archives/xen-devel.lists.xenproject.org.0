Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CE78A9CD3
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 16:22:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708414.1107320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxSeQ-0008Vk-FM; Thu, 18 Apr 2024 14:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708414.1107320; Thu, 18 Apr 2024 14:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxSeQ-0008UA-C0; Thu, 18 Apr 2024 14:22:10 +0000
Received: by outflank-mailman (input) for mailman id 708414;
 Thu, 18 Apr 2024 14:22:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxSeP-0008U2-CU
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 14:22:09 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09a98965-fd8f-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 16:22:08 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-343b7c015a8so689618f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 07:22:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r30-20020adfb1de000000b00343e392829dsm1966911wra.97.2024.04.18.07.22.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 07:22:07 -0700 (PDT)
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
X-Inumbo-ID: 09a98965-fd8f-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713450127; x=1714054927; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aINRXMRj4xG3RA3OEa+fog3TbrXg18yZcSw1HMDxdUs=;
        b=dDl+iHISFvDY25fE3vG6BCnV3wKZVLqwbbAJzvL9G4cuvL2RoKH9iL4wikycyjjjJ3
         j+WxihjTUIbeKIP2aoVG7ZxtvJ7jL29YQS9liTdAIBZQYFIR2dIMGmOJ1zNuOQ6D+m94
         KU+aMHVgkdd/lUTheyM8o3TBb1mzepxV0E2ogzEfskzesAFoO//kqxS0S7/s2W+cE8IE
         IjGWaSERe8fLMv86zY/MJtrM90pxrJNt4uGy0nRZWtx223vN+OtyVg5fmfRIJV68PSzY
         nCWrh8zuiPEvLTxAa0KjSgATe5K/5ixmCM2X4YFwtUJtmQmpQA7xIr9uVuFe675fvmo8
         B5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713450127; x=1714054927;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aINRXMRj4xG3RA3OEa+fog3TbrXg18yZcSw1HMDxdUs=;
        b=OQE+CArISoLDVXdaZ18GlGZ0eAN1E4FeTjlNqnyjbrBKVCFhomvsbUofbwElS8ZJks
         K05JX8hNhe7CtQryLv67ATx8RGSl6ycHDX6Ygy/HrkcJvBvDjCFIvq+ozgkDaWvuybnv
         tZMBvoDImGSr7bWp95RdhWUmuUsY8dh1KKipYGSaxXiXtLwYnmBvZz8sMfR1R8LjGQv4
         ErWJIGbs8czi9hCTwGj8S8/c+ZFZYy/c3EQ3u/lo+hbX+/LXW7RGYgp7A2EMJX8X9a02
         X1LquwvDk1oMo7JMejDz895dI59lrUtUlF53mnPSeuLoG/x8r2/goMbICxMC2DlLDR5a
         MZbQ==
X-Gm-Message-State: AOJu0YyqScjWdcoKDP4xxFQcTl44EmuynxN8novka1i5ZFu+1ixuoTG6
	HrdOpFAc35m/8cHVVA09Oa85WhK9qBKzRkP+hnovrjrJqPGiRxJZ1RRJe6s6zSLpG0RpHJc9eZ4
	=
X-Google-Smtp-Source: AGHT+IHiHeYjr8826pAgG/idaZhCiqtXgqbvoP5xpM6TFZtDpzPlzvcvE7w2opT8C+01DgskyrVyxQ==
X-Received: by 2002:a5d:444d:0:b0:349:8a7e:e0af with SMTP id x13-20020a5d444d000000b003498a7ee0afmr2072123wrr.11.1713450127414;
        Thu, 18 Apr 2024 07:22:07 -0700 (PDT)
Message-ID: <58d46183-97c8-4134-9d8d-086e08665846@suse.com>
Date: Thu, 18 Apr 2024 16:22:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] MSI-X support with qemu in stubdomain, and other
 related changes
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
References: <cover.afa2d89161590f5193dd6bfd340c5e9347877aae.1710342968.git-series.marmarek@invisiblethingslab.com>
 <ZiErrOBth4rGDnsp@mail-itl>
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <ZiErrOBth4rGDnsp@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.04.2024 16:18, Marek Marczykowski-Górecki wrote:
> On Wed, Mar 13, 2024 at 04:16:05PM +0100, Marek Marczykowski-Górecki wrote:
>> This series includes changes to make MSI-X working with Linux stubdomain and
>> especially Intel Wifi 6 AX210 card. This takes care of remaining reasons for
>> QEMU to access /dev/mem, but also the Intel Wifi card violating spec by putting
>> some registers on the same page as the MSI-X table.
>> Besides the stubdomain case (of which I care more), this is also necessary for
>> PCI-passthrough to work with lockdown enabled in dom0 (when QEMU runs in dom0).
>>
>> See individual patches for details.
>>
>> This series include also tests for MSI-X using new approach (by preventing QEMU
>> access to /dev/mem). But for it to work, it needs QEMU change that
>> makes use of the changes introduced here. It can be seen at
>> https://github.com/marmarek/qemu/commits/msix
>>
>> Here is the pipeline that used the QEMU fork above:
>> https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1211237368
>>
>> Marek Marczykowski-Górecki (7):
>>   x86/msi: passthrough all MSI-X vector ctrl writes to device model
>>   x86/msi: Extend per-domain/device warning mechanism
>>   x86/hvm: Allow access to registers on the same page as MSI-X table
>>   automation: prevent QEMU access to /dev/mem in PCI passthrough tests
>>   automation: switch to a wifi card on ADL system
>>   [DO NOT APPLY] switch to qemu fork
>>   [DO NOT APPLY] switch to alternative artifact repo
>>
>>  Config.mk                                           |   4 +-
>>  automation/gitlab-ci/build.yaml                     |   4 +-
>>  automation/gitlab-ci/test.yaml                      |   4 +-
>>  automation/scripts/qubes-x86-64.sh                  |   9 +-
>>  automation/tests-artifacts/alpine/3.18.dockerfile   |   7 +-
>>  automation/tests-artifacts/kernel/6.1.19.dockerfile |   2 +-
>>  xen/arch/x86/hvm/vmsi.c                             | 224 ++++++++++++-
>>  xen/arch/x86/include/asm/msi.h                      |  15 +-
>>  xen/arch/x86/msi.c                                  |  50 ++-
>>  xen/common/kernel.c                                 |   1 +-
>>  xen/include/public/features.h                       |   8 +-
>>  11 files changed, 308 insertions(+), 20 deletions(-)
>>
>> base-commit: 03cf7ca23e0e876075954c558485b267b7d02406
>> -- 
>> git-series 0.9.1
> 
> Ping, can I ask for a review?

Sure, in due course. The series was not lost.

Jan

