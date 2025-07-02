Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61337AF0BEE
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 08:48:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030219.1403831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrFl-0002ek-OH; Wed, 02 Jul 2025 06:47:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030219.1403831; Wed, 02 Jul 2025 06:47:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrFl-0002ce-KR; Wed, 02 Jul 2025 06:47:33 +0000
Received: by outflank-mailman (input) for mailman id 1030219;
 Wed, 02 Jul 2025 06:47:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWrFk-0002cY-FZ
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 06:47:32 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d3ea983-5710-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 08:47:31 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a528243636so4022679f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 23:47:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-318c13a270csm13156553a91.16.2025.07.01.23.47.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 23:47:30 -0700 (PDT)
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
X-Inumbo-ID: 6d3ea983-5710-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751438851; x=1752043651; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vbYK7fi4JE+BIZ5V5n5+SNrpcmSi0dHmiv466IO3bLo=;
        b=IJK6FjmDwxHBkkmZVCJPUdj+Q7nBB1E+tS/I1ue+yjkTFtUsgEoP3T/LFl8BOw9gyX
         /XoQx4ME+9f1EZEBS4QxZlqBCuRf8R37TMdOHSRm1dzAswR7vcxtrWkQC0YwxNgohqZS
         yPUYWYV+9vy7C/FOhtSGAuA7V5AP1xh3yVr6po5UGUi2VhmY4FDYEZv0nTSqE5Ec8QPT
         BjhLZr5LEVqOsgL6vnFj86V0AtNKUfHRM2TIqAO60s7AWNkZycLpblOTR8rxG9ZWyktc
         aoY9W5be45c5U9wgHSF2iZbpb6e7y/1jj1zyYi6r+xXyoPghVWPVc9abXxJCfLvEizYD
         uFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751438851; x=1752043651;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbYK7fi4JE+BIZ5V5n5+SNrpcmSi0dHmiv466IO3bLo=;
        b=FHwN2elm+fXOc7ND7ueyomMkuZS7oB0ZiCPwzDq1IwcZXXZMZEeom3Nl1wno+J1xQh
         hRigXnqZad/J43HvLvixFlHtKovHD2Y0kIKidGzDFj33lSkqg8T9xxlS40LOQZxMbEkx
         dtiSdmecFzz80x3dduQrNoLs1N7JQrgWZUf89zqPCiegGoD81rQEA4ml+ilpd1UNlm9/
         fOMg/fyZ5MXREgi1bMz7+wMXmkjWwx0qxoWtNbfIasg4baVIIKjhyHI/UYWpN7EPY24N
         Q7dRBaWf7GpQZjMm0XoXV/PDmk4C3sCVQfs1BzHUCIGiRhi6S8EoSMhpQn6eH4PBR45b
         uknQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdbvW0Y3kU8zTcuLUXuMlU4ss3bBgfavl5UEhAU5myd6G8YqmBr4fCwD56+EK3W/dHNAl3ocyEQOM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPj5e3v3svDBvHttWdxgpIluZdIbpa0cZYGbyDAWLUfqrCZS5Q
	9azoc4fAlbCnptMuvQKyenH98uu2P2Uhxw3DLAV3fzE5H779ZbVMdNDEl64T9j57YQ==
X-Gm-Gg: ASbGncuqT6xk5vK8v8CQB32lWsEy51uzp5ppipoa0UUlIu8xvhpZnepbicF/j/MnyMB
	g3Lipxvc+vXbm3jcnqWliVxi4slPkoqRLIyPt/w78qkHJKztPqrQ3vti4Fhmfaz8V4d/3dqkaVW
	IP1BAYKA5X4qj/G8R5iaJU/dUiISYeMtSqDftDxlPWO9k1dYLAr7tjG1qPiZ3k99gYvylYf6yHz
	Xzc3vzkVRlWDQeKqntDcgDcyWOq4x0IoYxm4PrwRg54XOqu5vZFBkgWQglBVC+OwHW/mkbQkEE3
	9fCeoqh/5GaBXCkKwudtuEOeAbw+zWcAxZ8LOdQUdwJw0TFA8BP0k4m3tga9KvYJYATQ9cx8ZnF
	02zfNuTddISkUVt9+rs4oOBkMoqPDf3NAl+zhOlPpdlLrZPCetAXDqA3Xpw==
X-Google-Smtp-Source: AGHT+IFRZ5od3/Q8XAjXcBtfo0lKl+H1LIc6D54lwhlVYO1azB6i9f0i72zemOZwxuRt7EMIBUBngw==
X-Received: by 2002:a05:6000:188c:b0:3a4:f7ae:77cc with SMTP id ffacd0b85a97d-3b1fb0644femr1059090f8f.0.1751438850720;
        Tue, 01 Jul 2025 23:47:30 -0700 (PDT)
Message-ID: <694f7bc0-5846-49ae-946f-bfab47d2bd5a@suse.com>
Date: Wed, 2 Jul 2025 08:47:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] hvmloader: add new SMBIOS tables (7,8,9,26,27,28)
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1751412735.git.w1benny@gmail.com>
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
In-Reply-To: <cover.1751412735.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.07.2025 01:45, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> Resubmitting patch from Anton Belousov and addressing review comments
> from Jan: https://old-list-archives.xen.org/archives/html/xen-devel/2022-01/msg00725.html

In which case shouldn't this submission have a version number, explicitly
larger than 1?

Jan

> Original message:
>> SMBIOS tables like 7,8,9,26,27,28 are neccessary to prevent sandbox detection
>> by malware using WMI-queries. New tables can be mapped to memory from binary
>> file specified in "smbios_firmware" parameter of domain configuration.
>> If particular table is absent in binary file, then it will not be mapped to
>> memory. This method works for Windows domains as tables 7,8,9,26,27,28 are not
>> critical for OS boot and runtime. Also if "smbios_firmware" parameter is not
>> provided, these tables will be skipped in write_smbios_tables function.
> 
> Further explanation:
> Some malware samples are known to check presence of various hardware components
> (like CPU fan, CPU temperature sensor, etc.) by WMI queries. If these components
> are not present, then malware can assume that it is running in a sandbox and
> will not execute its payload.
> 
> This patch will allow security researchers to create a custom SMBIOS
> firmware binary file that contains these tables.
> 
> Petr Beneš (3):
>   hvmloader: fix code style violations
>   hvmloader: fix SMBIOS table length checks
>   hvmloader: add new SMBIOS tables (7,8,9,26,27,28)
> 
>  tools/firmware/hvmloader/smbios.c       | 204 ++++++++++++++++++++----
>  tools/firmware/hvmloader/smbios_types.h |  83 +++++++++-
>  2 files changed, 254 insertions(+), 33 deletions(-)
> 


