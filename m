Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4837E878120
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 15:00:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691511.1077538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjgCH-0001BV-6j; Mon, 11 Mar 2024 14:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691511.1077538; Mon, 11 Mar 2024 14:00:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjgCH-00019C-3v; Mon, 11 Mar 2024 14:00:09 +0000
Received: by outflank-mailman (input) for mailman id 691511;
 Mon, 11 Mar 2024 14:00:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZVPQ=KR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjgCF-000196-FO
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 14:00:07 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa3edf29-dfaf-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 15:00:06 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5654f700705so5538613a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 07:00:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o23-20020aa7c7d7000000b005686b5c3c1asm85188eds.22.2024.03.11.07.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 07:00:05 -0700 (PDT)
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
X-Inumbo-ID: aa3edf29-dfaf-11ee-afdc-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710165606; x=1710770406; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XpooZHg+CV2yNcshQoJ6X8E7wnLTEI5aoH7Wph+2j9M=;
        b=HgiZpdfBl3CRRNyXbVs/nURddAHqRJsYPfum7hfhHh+qsGBS4VB6P9fYY6QxDyfgnD
         QmhkqK1Y7/MkXVpZHgLFG0o45GduVzyW+Mbq6tqmdCS7MKduFFCW+ibewpnKIptkkXSh
         QsvKM8ueg5v+hfAyL1IL1V5087Z3mS7EnnUhh4+FjLiJHfZo7pV7mo+jS0k6b/Mf//wU
         xM2T5A9sQyai3O0Nkui872qzJoLpE/3CIueVGBb4qtjzxHXmPKsNsSjxy/pOPPBDWALG
         KB+qePDI2S18XtE4O6W0ZuNM3Gw9Sr8ddputF60cbY7mL8uLYQwR/7KZl8WHdTuDCshh
         GPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710165606; x=1710770406;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XpooZHg+CV2yNcshQoJ6X8E7wnLTEI5aoH7Wph+2j9M=;
        b=KHxPAc7PwLECyF6mfhP1znwtfdi/8ojsBH3I7zcRT3LZE/xAE9IPZNnOq2Q35y6s/h
         p7acQn9wCOCxl8zhOGGoUmJCkDjdWK4PtAWJ9OOC/88T+5uA04RpZycfXgpJYjPGHcfg
         XLkFX5oGN+W2uAP593GL4Hggqo0GrNKfbNRluie/++w1A4gskuhz9PTkg0qgXPrK5frs
         WaaoXIkNpazGHsdaeql+8sY2IEECSL15rqMje2yvXYFTK2BAVquvcMnxVrWaAI75jDB5
         tXmerZUr7a7GXGIJINPm5p1xlBpogV99FrZ4Lar/QsfE/H7R0qNRaovyOahTtTN9+aPm
         brOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvmDvq3rrpA8n4nROacxa5TcOLz2XpbXwPcaNcMymX/ipfjv9NT7+J4kLzKj9BFtpTlKdSUwBCRHZ66a4J0gHuc81wvTKEwmTcromVvQg=
X-Gm-Message-State: AOJu0Yy2QdZSij2UZTs1KrsC51aaDRzcWTtYrQd9FMvik4slxWNDmrKH
	rJeD+Roqfu7Vft7Q81C0sgiixjOChjl9f5XNlEbygeXaTzOcfkHoTXh0/2FeAQ==
X-Google-Smtp-Source: AGHT+IHjXTwhhguu9vFXH9+NGxITtnMVQkkWKdAVEdfoTN212VSGRh5dOsTazD8hQ6N0jEwmvBdn5A==
X-Received: by 2002:a50:9b15:0:b0:567:26ba:d207 with SMTP id o21-20020a509b15000000b0056726bad207mr303533edi.18.1710165606019;
        Mon, 11 Mar 2024 07:00:06 -0700 (PDT)
Message-ID: <f0ad2a72-662e-44c3-8354-dd39aa966ec6@suse.com>
Date: Mon, 11 Mar 2024 15:00:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 04/16] xen/arm: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
 <868ede5a23489e018e272188edfbee572d1ad393.1710145041.git.simone.ballarin@bugseng.com>
 <332ebf49-9aa4-42fd-99be-bda16580c92f@suse.com>
 <a8bb254d-c441-477e-902f-06e8327bf112@bugseng.com>
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
In-Reply-To: <a8bb254d-c441-477e-902f-06e8327bf112@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2024 13:07, Simone Ballarin wrote:
> On 11/03/24 11:10, Jan Beulich wrote:
>> On 11.03.2024 09:59, Simone Ballarin wrote:
>>> --- a/xen/arch/arm/efi/efi-boot.h
>>> +++ b/xen/arch/arm/efi/efi-boot.h
>>> @@ -3,6 +3,10 @@
>>>    * is intended to be included by common/efi/boot.c _only_, and
>>>    * therefore can define arch specific global variables.
>>>    */
>>> +
>>> +#ifndef XEN_ARCH_ARM_EFI_EFI_BOOT_H
>>> +#define XEN_ARCH_ARM_EFI_EFI_BOOT_H
>>
>> Related to my question raised against the cover letter, what does the
>> XEN_ prefix gain us here? All building of the hypervisor binaries
>> happens inside the xen/ subtree.
> 
> what do you thing about adding this rule:
> arch/<arch>/<subdir>/<filename> -> <ARCH>_<subdir>_<filename>_H
> ?

Yet better - even the ARCH_ is gone then. Of course we want to then be
reasonably sure no arch appears with a name matching some of the other
top-level (under xen/) subdirs.

Jan

