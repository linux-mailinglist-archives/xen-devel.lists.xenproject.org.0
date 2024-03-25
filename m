Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AA088980C
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 10:25:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697626.1088569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rogaI-00068J-N4; Mon, 25 Mar 2024 09:25:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697626.1088569; Mon, 25 Mar 2024 09:25:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rogaI-00066m-K6; Mon, 25 Mar 2024 09:25:38 +0000
Received: by outflank-mailman (input) for mailman id 697626;
 Mon, 25 Mar 2024 09:25:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x9L4=K7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rogaH-00066g-Cz
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 09:25:37 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3108187-ea89-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 10:25:36 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-513ccc70a6dso6983019e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 02:25:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 y4-20020a1709060a8400b00a46bec6da9fsm2829237ejf.203.2024.03.25.02.25.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 02:25:35 -0700 (PDT)
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
X-Inumbo-ID: a3108187-ea89-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711358736; x=1711963536; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kznjib0G8AwkMhdOq/UeLdrZcZUiMNdPT+KZdSJAyc8=;
        b=Tedbn79cWcUddWE6UjOXX3pZdbj7ppqDSszgFOeaebCsGrRDxVbWJdNpUgF+0jFB7w
         CZfABWKdK28DjTF6lA1sBVsnc8AfL1sJSL5if+xPi9ARU+hSesNlTJ4pFq3bPovCUEgO
         34b60PqG3pPYTYT17xnmKBhN2Ra2V7hrKUp/pCwwtolvouBzj5huaUi/3eNKyieD0R84
         IiOu56FE98WqULyymvXOmDKM80e87pI9UEM40YwhAsCzpccQ1DmkOnR+Gr4qIKz/hHJ8
         6m//TSkJsU+1Is5Pm3mQmjrrRgiP2rlvD5wloFUB3L096BtCRvkXFO4zvDW6VM7O+R2W
         Ml2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711358736; x=1711963536;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kznjib0G8AwkMhdOq/UeLdrZcZUiMNdPT+KZdSJAyc8=;
        b=mwUU4B2HGuIF80Z4G2okQSYaipbrVU8L9ukYSu+v9pDPsu2yMIqQ1QqC8DCXBoao/k
         LLthRNWQtLkxnJhEom5IAhdxyTHvZ2DX5JDbxQ0Gv8iY6qkQ4KGlcLc6SJ4Z3vs0LYls
         JYybd/vicn42fJotJ52UPmMWCWU+cOr6VVrPDIiLVHeatQthBSSySsKXXXerDZ9szE4Q
         OPIWN+1qVJHpnPMiza/YYk8Go1S5109uavz46OYCc1/xHbQqVItfKIe7CnMkFsHuMReF
         fqSCqrKFTXl5Hel3EJ7jJoChH59M051W8ocb1GzBct3pCT+RvFOBdch7Vkd3c+1m4oqr
         dv4A==
X-Forwarded-Encrypted: i=1; AJvYcCWbo8Ew+k5tgQFz5NTmPtA1b+avwwiMd3Yi1GlpkVY8okNfLINX8mD3hUqP/gyGJlWBf/pZrpy6p9Whk9GoQ2NftgZG2tKDBh8zXgWM3lA=
X-Gm-Message-State: AOJu0Yyu5Tn7snSz2f4vYNgc8qoQmg+RgnvRHGb6tIh7Y0pD1jLGWwjW
	z4TG4ZJArwaYb+875SXTSR7t3BsOlYWVirrgqyrR963ywZ//+ZcIoLIMt+26Ew==
X-Google-Smtp-Source: AGHT+IGYk8B2oGXMErBDFSXbGDMwMAbn3XVEL0PebZhGV8qHRxS6Nqu5tidnna3KjA1zWfpWZfel/A==
X-Received: by 2002:a19:3807:0:b0:513:e4e0:8e12 with SMTP id f7-20020a193807000000b00513e4e08e12mr5091797lfa.12.1711358735838;
        Mon, 25 Mar 2024 02:25:35 -0700 (PDT)
Message-ID: <afa5ab91-1ea2-4e5d-aada-7f6c64c142b1@suse.com>
Date: Mon, 25 Mar 2024 10:25:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 06/11] xen/efi: address violations of MISRA C Rule
 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, xen-devel@lists.xenproject.org
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
 <2d3842a990189c37fa12672994b779ad42975235.1711118582.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <2d3842a990189c37fa12672994b779ad42975235.1711118582.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.03.2024 17:01, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Seeing this is again touching an imported header, we finally need to settle
on where to draw the line. The way this is going is that you're proposing
many small changes which individually all look "small enough". Yet when
doing so for long enough, the entire header may end up different from its
original.

Jan

> --- a/xen/include/efi/efiapi.h
> +++ b/xen/include/efi/efiapi.h
> @@ -63,7 +63,8 @@ EFI_STATUS
>      OUT UINT32                      *DescriptorVersion
>      );
>  
> -#define NextMemoryDescriptor(Ptr,Size)  ((EFI_MEMORY_DESCRIPTOR *) (((UINT8 *) Ptr) + Size))
> +#define NextMemoryDescriptor(Ptr,Size)  ((EFI_MEMORY_DESCRIPTOR *) \
> +                                         ((UINT8 *)(Ptr) + (Size)))
>  
>  
>  typedef


