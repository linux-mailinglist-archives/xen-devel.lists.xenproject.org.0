Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3632AFEBC7
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 16:24:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038284.1410779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZVib-0004X1-F6; Wed, 09 Jul 2025 14:24:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038284.1410779; Wed, 09 Jul 2025 14:24:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZVib-0004Uq-CS; Wed, 09 Jul 2025 14:24:17 +0000
Received: by outflank-mailman (input) for mailman id 1038284;
 Wed, 09 Jul 2025 14:24:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZViZ-0004Uk-Tn
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 14:24:15 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6360e052-5cd0-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 16:24:14 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so3053f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jul 2025 07:24:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce35cc72dsm14682131b3a.42.2025.07.09.07.24.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jul 2025 07:24:12 -0700 (PDT)
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
X-Inumbo-ID: 6360e052-5cd0-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752071053; x=1752675853; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LXQEomijV9ka4FO31ID8UZD5QJbegsVoJbHeg4Muc9s=;
        b=ZeRFNXBrxlBgWibI5G4VqHc7Xs2XP80/RPjQOPuVqt1aWrod/0y/EDdIWSays75W1/
         00PKJXwXuX3a4AkfF+fq4QH8FVl6Zsw+wseV5s06ZRxuNJlw6TsvJxm+ASPG9jILiQxX
         2P6QERH6gaoAJLHm4pAPT+w2OFTiYCVpQtbUqHD1bpaBfOMt8ctov1rFU4LFX80gWmlv
         SibgEfpXWftFvBK06mWLCCREMgY5QUYy5fhAs5YNKoa3rKef9bK0cUXYYhotbiU0nmv7
         8Olu2Ns8R+4aPcEU4VhTt9A6FWpEcWT2Ef+tZTq/I+Gbo0kMBkIN5YyHRsdusmR2txY1
         BjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071053; x=1752675853;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXQEomijV9ka4FO31ID8UZD5QJbegsVoJbHeg4Muc9s=;
        b=RIaBCKOPkbyjvsXXkRqFTrF4W3NcMZkNXyDAMG8E3zTmUZDLZVZzlhpDE4WmTuor4Z
         fO9fEVFcJFts4vKgrykzAxGCcWupcQnNwUSLeYJ6QEbPJnAouOamS7lrsH+ABJ4YYQVA
         +unFNuZ1+Jm4hVQi5j5tA5IWBPM/yrsfcULdkIl2rpn7IfbugrPUPrzTglT2bacWGshl
         9CHeL0kxzGg5F/+5GYmEujupfBvNC2V0i6YyDOY4N86iBhl5vFeud0EBb6Hnwvs/THT9
         9h7GUIltegNfE4pcmn7dGF9PtVQ4DsgSBVDf8GjpAxiMbDRr9r8DWht3vytuZvXzmX4S
         W1vA==
X-Forwarded-Encrypted: i=1; AJvYcCXYiOcfvZ/PqNjiKjnL+3z4qjDf06hGK5CkXWrdQAI27JbsZiqHKIQ+xYGv9cikVQgsylFYE792HF4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyp8jt3N2LllQgtdgBdtY+zFI/S5lVxG1yROl2RciIHwaQK0EWA
	gIy2J1EjzFfonmrzzYjmKDthNYA8RS3pskpxpHByvCN707Gq6eL8NJ/QBursICznrw==
X-Gm-Gg: ASbGncss+u8W0YZIPzAbXZbFrb5FWGzTP3ctuYOSCxXroIQ6M+E9yiNxx711hXhbA3+
	v2UTI/KTf588TWfzej9rt3VwE4xB+sbXHNANFUJ7wMJbedYQrxv1ssA0oQElEgHMdFFPtXsHLM2
	a31ta4v7p9cXyzT6NcmDlv/IX4rHlBDYoYJW87z1VvCR2f9ajvTs70h52RtSHz9jIVt9dqJOhUT
	Zeirtc8eXzsB4rq2TT0JrxEZIu8cy+w4dpTrpbbepEn53oIJ7up8XEgzk00u6V0VBz2qiYXEtC1
	kkXj3cdTGGu60gn3G+8+TLxuHSHvEaCcVnsAMnoiLVnRD0tYEENsofkDeA3Mw/Aq4UVGibccmlT
	YxYvsoDcokEeQLtUFAInvsgFrmmTteEoaSgAYaa1zrX9Iqfd9ZFO6/3/cvg==
X-Google-Smtp-Source: AGHT+IFjYzHHcnnEZCkOLplZqJDoKQlVJZ3itZufWohbtGkIumDECgC6O+llsQ9i3gjUbxyUP6caLg==
X-Received: by 2002:a5d:64e8:0:b0:3a4:d722:5278 with SMTP id ffacd0b85a97d-3b5e452a147mr2468193f8f.39.1752071053370;
        Wed, 09 Jul 2025 07:24:13 -0700 (PDT)
Message-ID: <c3fb542a-1585-4eed-aea5-99e9e0a30fd5@suse.com>
Date: Wed, 9 Jul 2025 16:24:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/11] x86: Replace arch-specific boot_domain with the
 common one
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Alejandro Vallejo <agarciav@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250708180721.2338036-1-alejandro.garciavallejo@amd.com>
 <20250708180721.2338036-5-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20250708180721.2338036-5-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.07.2025 20:07, Alejandro Vallejo wrote:
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -107,6 +107,10 @@ struct boot_domain {
>      struct boot_module *initrd;
>  
>      const char *cmdline;
> +
> +#if __has_include(<asm/bootfdt.h>)
> +    struct arch_boot_domain arch;
> +#endif
>  };

I fear I still don't follow this. In patch 1 you made domU a common-but-not-
x86 field. Why can't domid, which is entirely generic, not similarly be a
common-but-only-x86-for-now field? What is put in arch-specific structures
should, in the common case at least, be truly (i.e. conceptually) be arch-
specific imo.

Jan

