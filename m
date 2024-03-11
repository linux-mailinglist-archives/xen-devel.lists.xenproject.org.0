Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D88BF877DB8
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 11:11:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691361.1077274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjccY-0003j0-8Q; Mon, 11 Mar 2024 10:11:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691361.1077274; Mon, 11 Mar 2024 10:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjccY-0003gI-5V; Mon, 11 Mar 2024 10:11:02 +0000
Received: by outflank-mailman (input) for mailman id 691361;
 Mon, 11 Mar 2024 10:11:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZVPQ=KR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjccX-0003g8-CM
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 10:11:01 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8656f59-df8f-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 11:10:59 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-568307fe62eso3567938a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 03:10:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h4-20020a170906260400b00a461e10094asm1366091ejc.95.2024.03.11.03.10.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 03:10:58 -0700 (PDT)
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
X-Inumbo-ID: a8656f59-df8f-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710151859; x=1710756659; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HY3G0C8ssgCw4IYQAmu5w9eJ4+9WJnmVFND2gySiPCQ=;
        b=SFHaIIFUVd90qkA2p9V2CLO2T5mHPd3imjXJPLuZtI4WQ+5bTmPZ5co1QBxpRH9VbI
         uxhkSUEGWqitbDDSXU2wCTiUYjYhw8gts9BjLlnQm7A5qbD2bbRBbWOP9nKs5I/9t4IF
         KKH2rxVoYPYQeiPlp15v04co+e7c+eMCsmRyQNWl8/XSmtFhWsSkHOcOoBGZ2Ku3hNma
         kr7jLl8pw8pH52RFjw3SIhjqkXympQzysnpfUzpeG9Ln5P15fkWeAt0SG9Oh2X6Wsaqc
         56y7nEU2KoJPBQUWRtM7NyeqKPFxYbWFdrw7W591+CCxyvyAIq0iePBMqyryxYEEDPgU
         y7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710151859; x=1710756659;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HY3G0C8ssgCw4IYQAmu5w9eJ4+9WJnmVFND2gySiPCQ=;
        b=EfuinjJtqNZCwMb4nR1IGgabC0+nZR/GsNbO9Yuz4pRG9+rInXyustlTieOA31qs2U
         ulw/lLJQBJHdCg8dqGz0eG0fYKXetYNLR2Jc0oshe5WtJfrPuNv0HrPUPUxT811L3lyu
         98D6hR1a6az94RojLdlkONvxZ/EYLTXN1oZixyXzYZVtVTkS/bAXmiig72FsPtW2zPzK
         ptLvksMJlBngJMljnX72IkPSbmb+EJRBfHQigTDul6lw2WxFtkzrykO883G71pBIeyIi
         FCJFHKLfToqROhfPO/+fZ1MQZyyPXYMk9CgvW6S+p59l0neyOFXNJFnIxE6IntBepjPq
         HBzg==
X-Forwarded-Encrypted: i=1; AJvYcCVLrsGZR7EwuRJV9Z+hQ4oIX+5bLMVU9RjtKJmRVr+alqOoQGDsVOPizjFscQXQQY4djZg+AX0kaoLC9B4LwrVnHZ6dogL2bGWWqao6aNQ=
X-Gm-Message-State: AOJu0YxswUxUxjbZeSuZ5SGncczBPf5HI+vDuPHwPye/LdnQp+a0twrD
	5GNJKL9Ddw21ydmbgG6taS3jrtHYj123Nfwoujhgvll4lVExz2htE8nNXPb1Dw==
X-Google-Smtp-Source: AGHT+IF2Dfh+ZcaReek5qofW2ooz5uwVemsb+ar5ciV8rJKsqGYCKF0taCd/dBbziYZ8NywZ1EuZdw==
X-Received: by 2002:a17:907:8b98:b0:a46:2643:845f with SMTP id tb24-20020a1709078b9800b00a462643845fmr2203254ejc.58.1710151858987;
        Mon, 11 Mar 2024 03:10:58 -0700 (PDT)
Message-ID: <332ebf49-9aa4-42fd-99be-bda16580c92f@suse.com>
Date: Mon, 11 Mar 2024 11:10:59 +0100
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
In-Reply-To: <868ede5a23489e018e272188edfbee572d1ad393.1710145041.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2024 09:59, Simone Ballarin wrote:
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -3,6 +3,10 @@
>   * is intended to be included by common/efi/boot.c _only_, and
>   * therefore can define arch specific global variables.
>   */
> +
> +#ifndef XEN_ARCH_ARM_EFI_EFI_BOOT_H
> +#define XEN_ARCH_ARM_EFI_EFI_BOOT_H

Related to my question raised against the cover letter, what does the
XEN_ prefix gain us here? All building of the hypervisor binaries
happens inside the xen/ subtree.

Jan

