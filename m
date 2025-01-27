Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7851AA1D523
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 12:15:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877733.1287879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcN5B-0005kC-9Z; Mon, 27 Jan 2025 11:15:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877733.1287879; Mon, 27 Jan 2025 11:15:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcN5B-0005h2-6B; Mon, 27 Jan 2025 11:15:09 +0000
Received: by outflank-mailman (input) for mailman id 877733;
 Mon, 27 Jan 2025 11:15:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O4xJ=UT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcN59-0005gu-IZ
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 11:15:07 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f67523d5-dc9f-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 12:15:06 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5d9b6b034easo8520136a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 03:15:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc186183eesm5267645a12.10.2025.01.27.03.15.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 03:15:05 -0800 (PST)
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
X-Inumbo-ID: f67523d5-dc9f-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737976506; x=1738581306; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UCJ5XuZJ+PJiMDlji/FAG2eL5A9cqn6zQ2h8ERWqJN4=;
        b=dddSMqhFlv/KiQYb6gB63nWMiNZiybe1XcZ1fXKQ0Dw2QfyS6UjrJtt9LBJ9kjHLTF
         LxJHSk14NtXJQ3ckLTkqaLmVkD1TOXm+yZbS6wNZ4B/khUp1T8zlPwj3hm8IRgtM+Lkz
         7pLSRcwqaDSM8P9lvMs4nN8C/h7a8CokkFhSbCS2EsLTOhX2Br77//fU2nxyY84OrZQY
         Tny7MiSWCoBu0ddvB5I0kubGi6vsPNlqvTrUbNfc/hTdkKlBtEukBWpJdABP6xJsaUwE
         tmAwg0jS7jevXq3h98rRIiucpIuSW/9i3mEHY7W2ZA6H0CcjWKLx8gRuHrPTsYOuncgI
         qoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737976506; x=1738581306;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCJ5XuZJ+PJiMDlji/FAG2eL5A9cqn6zQ2h8ERWqJN4=;
        b=MSOFokS8cVd1UgpAhcN08U38DB0xZ8V5Hfk0CaZV7cDg+yDTFs57LOyCIB5wujZJ9U
         Bf+i111wFsFE48TA7Yvg/Bue7yJ3hXa40Z790tp1iteHB6KV7ZC6WsbulY9ssjLUvwqT
         DdKnAlFNfn5cMa2ZrSZFDKb38aF5VimId0R1uOLOTUXH07Afx4Od9i6/igdCUG2P1Yxj
         h7HC//Hh6e4GK0HXpm+5t8u86WJ4KRhsDMXJRDyOeNkl7S3I5XL7LQi888rzvZs5ogLB
         07T//8pE8Fq3QvTb01wD64pbiLAYnpgpLMp7RxyRh9r8h3ArOAc4tXW0r05vC2wCCHIH
         zkCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmE2ZwVzj0X0oXZ9JApg59DeRVMpH5wpKmQ7hQs4tB/ODdUedTeMa285yYfBqbOzS3RmrUgTvzMew=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4yPLgfxMEDX7yWT/fYpG3baC1YUWRDRmrW0Hy/8hpHFQnvqjp
	wHN5xAGkapqvF6vZLSI0/cN65Jg7ZvTBFNk6ZoIgbPZ9g7+2DE2Cv8vBhrFu2A==
X-Gm-Gg: ASbGnctHQt6kMQQZuzyUrd3XpdSHpMHyxm0dletP8iZPU+hyN+qsdSDDGMhZUBZp8sQ
	SeuC/gOLkPlNNqU4qSG/n5z0LjQcPxCl0/uShsNxSj7XQ98OcLasTAO4SpJDjnAhsS0AF6iVcWv
	0LHgAuklzaelgZ+0c73KGL0H3PztfKmJ8fVOuBXDQo3kWsD1aPoNxnC2dq0IaUKVqlKw5hUUzlj
	e/x6Lnngd2kgmeSyJ5zBl4ty678uSChB13Q7e8hQ4s1LeLiwju+O4zMCcIEh+5c6Jdfh1D5Wsha
	arBi89iook7I7/smWGgujds/1hyARQjhRfwGF3xdr3ltBELAppUGOyIu8TCta6OEwg==
X-Google-Smtp-Source: AGHT+IGHplv2Hzunxl8A4zXSTgfUnZjSWCkfgGRYjL009Q18yAu88aXaGHX5MYflHizB9bhR7AH4YA==
X-Received: by 2002:a05:6402:1d4e:b0:5db:fcb0:e52b with SMTP id 4fb4d7f45d1cf-5dbfcb0e88amr17490011a12.24.1737976506185;
        Mon, 27 Jan 2025 03:15:06 -0800 (PST)
Message-ID: <2f14762e-d302-483c-8adb-3223e6290de0@suse.com>
Date: Mon, 27 Jan 2025 12:15:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/9] asm-generic: move parts of Arm's asm/kernel.h to
 asm-generic
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1736334615.git.oleksii.kurochko@gmail.com>
 <6404cb5ae077909cbfdf3860d38c701c65547b56.1736334615.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <6404cb5ae077909cbfdf3860d38c701c65547b56.1736334615.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.01.2025 12:13, Oleksii Kurochko wrote:
> Move the following parts to asm-generic with the following changes:
> - struct kernel_info:
>   - Create arch_kernel_info for arch specific kernel information.
>     At the moment, it contains domain_type for Arm.
>   - Rename vpl011 to vuart to have more generic name suitable for other archs.
>   - s/phandle_gic/phandle_intc to have more generic name suitable for other
>     archs.
>   - Make text_offset of zimage structure available for RISCV_64.
> - Wrap by `#ifdef KERNEL_INFO_SHM_MEM_INIT` definition of KERNEL_SHM_MEM_INIT
>   and wrap by `#ifndef KERNEL_INFO_INIT` definition of KERNEL_INFO_INIT to have
>   ability to override KERNEL_INFO_SHM_MEM_INIT for arch in case it doesn't
>   want to use generic one.
> - All other parts are left as is from Arm's asm/kernel.h
> 
> Because of the changes in struct kernel_info the correspondent parts of Arm's
> code are updated.
> 
> As part of this patch the following clean up happens:
> - Drop asm/setup.h from asm/kernel.h as nothing depends from it.
>   Add inclusion of asm/setup.h for a code which uses device_tree_get_reg() to
>   avoid compilation issues for CONFIG_STATIC_MEMORY and CONFIG_STATIC_SHM.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

I question that what is being moved qualifies for asm-generic, an in particular
for a header named kernel.h. Some of what you move may make sense to move to
dom0less-build.h instead. But everything that doesn't fit there needs to find
a different home, imo.

Jan

