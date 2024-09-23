Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2390997EA3E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 12:57:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801904.1211960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgjx-0002w1-SZ; Mon, 23 Sep 2024 10:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801904.1211960; Mon, 23 Sep 2024 10:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgjx-0002sq-PV; Mon, 23 Sep 2024 10:56:25 +0000
Received: by outflank-mailman (input) for mailman id 801904;
 Mon, 23 Sep 2024 10:56:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ssgjv-0002sg-Io
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 10:56:23 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78477c29-799a-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 12:56:22 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8d13b83511so512376866b.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 03:56:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f43bbsm1203071566b.77.2024.09.23.03.56.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 03:56:21 -0700 (PDT)
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
X-Inumbo-ID: 78477c29-799a-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727088982; x=1727693782; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JoPeDylnCxxUD9jyXpqaZHj+BQmUiziF0zmtORFy+O4=;
        b=dW4JBnbFUuNWndrr/08OcwPRC3cnjlJhUvenvcR3H22/0U+ZrpHCKzOZctTmHhgXUG
         PUj9SNxKuw8Hwvw+/AG6NgbKlm4+EMQaIr3dg7Fn3Ooe9gqmypiZvANoo+lKs7/SbJJC
         riYqpRWzCtLYtLv313kBo6NmBixK/027mB2wSDAB7djdpygnfSmlx6Neu0f+F49tqyNf
         khYpbV5HbvOg7UOC0vWf46QN+cTKl942PCGsJi0H542mW5AGcvh7j1uSmnU00q++pbD7
         ir3A+T4SiFzRtYoFRVppGiNIyJgLFe9IJAlWX68+9rzlYRAde20P878uG9HVig4pDRlD
         S67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727088982; x=1727693782;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JoPeDylnCxxUD9jyXpqaZHj+BQmUiziF0zmtORFy+O4=;
        b=O2H7z6a2+DIKSz9D/h4O4y2BcyxDObiSJBMhh3Fzyr/nZK8VBMlPzlHi/0Dd2p4BTA
         Ww3Z9zR4M8RFM98xQvrJnjEu665kkfqWA+DbSb40oLWzVNOQXX+pipia+DrtNnNxMCjb
         aZb5rAx6cWUDhrIX5YXqq/aaiWAM753sRDwJVGdF5Dg5/9J/chLHZjfwgeFYQGDKtztv
         ijpBoKvds0Ys8gPCt5ql0UTL6pflwBXsYCvyM51EqNPo/KKZU/u4+7iNNgBhSbmNoG+j
         ChNbIv4rzx5r0il/ygTPIWZUIC3sLGaJhLNTDVD5CCZll5F/g9xGAaQxe9VrHYOrhrge
         WS/g==
X-Forwarded-Encrypted: i=1; AJvYcCUZerR0+2jBiStZLhIop7p9WFoAkOX0xlqHQ5dSUNM7bmzKotsSvLtRtNsBLYM36EYmjiYhIcQXdj4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzG2hotsDIJx4FIaSt7iv7GSN8eOZyaqP7Z1AOiLikLfarcSD8t
	QmNO3IovxfMYy7i0cUt/B33wslnxRVmZ+pjr8iasP6Xjlxb/RuOb+MS6PlgdFA==
X-Google-Smtp-Source: AGHT+IGX+GmRuurrYdc9qpJXitYSoSORJrcjGdQRZYNqcq3q8XStNMf0jctM66XuQo4zTOJ3PuZiJw==
X-Received: by 2002:a17:907:3f26:b0:a8a:445f:ac4d with SMTP id a640c23a62f3a-a90d56dad1bmr1244055466b.18.1727088981782;
        Mon, 23 Sep 2024 03:56:21 -0700 (PDT)
Message-ID: <a4e3de2c-2316-435e-b22f-e6efb3aa4216@suse.com>
Date: Mon, 23 Sep 2024 12:56:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] xen: introduce common macros for per-CPU sections
 defintion
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1726746877.git.oleksii.kurochko@gmail.com>
 <ed94ad588dd91733178cf505a49b82f4cf031268.1726746877.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ed94ad588dd91733178cf505a49b82f4cf031268.1726746877.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.09.2024 17:59, Oleksii Kurochko wrote:
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -321,14 +321,7 @@ SECTIONS
>    DECL_SECTION(.bss) {
>         __bss_start = .;
>         *(.bss.page_aligned*)
> -       . = ALIGN(PAGE_SIZE);
> -       __per_cpu_start = .;
> -       *(.bss.percpu.page_aligned)
> -       *(.bss.percpu)
> -       . = ALIGN(SMP_CACHE_BYTES);
> -       *(.bss.percpu.read_mostly)
> -       . = ALIGN(SMP_CACHE_BYTES);
> -       __per_cpu_data_end = .;
> +       PERCPU_SECTION
>         *(.bss .bss.*)
>         . = ALIGN(POINTER_ALIGN);
>         __bss_end = .;

Like the _SEC in the other patch I question _SECTION here, albeit for a different
reason: This is no separate output section, and it's more than one kind of input
ones. Perhaps PERCPU_DATA? With that
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

