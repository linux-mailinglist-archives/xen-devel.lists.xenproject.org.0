Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 916B1902507
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 17:10:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737364.1143633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGgf1-0004y5-LT; Mon, 10 Jun 2024 15:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737364.1143633; Mon, 10 Jun 2024 15:10:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGgf1-0004vZ-Hp; Mon, 10 Jun 2024 15:10:15 +0000
Received: by outflank-mailman (input) for mailman id 737364;
 Mon, 10 Jun 2024 15:10:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGgf0-0004vT-9P
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 15:10:14 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88700d4f-273b-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 17:10:11 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a6f1cf00b3aso204387466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 08:10:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6ef61aa6afsm428291066b.101.2024.06.10.08.10.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 08:10:10 -0700 (PDT)
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
X-Inumbo-ID: 88700d4f-273b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718032211; x=1718637011; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aCva5wXetFBP2BAPl883qTT/FreXl4XL7F5vVY8dcxI=;
        b=eTW2ao4Yx4xqwCtMZ75oDIV3RKHP1o+zFksdDkaUOkHHZ9oYNPw8q706AvquOiA+Qy
         BYtVGOgsWvtAiA7yPmH450oNx7UiQtITgXJ3KUV8gCR3ku3+QC+7iWNuNhi8VB8wjnII
         SyEa+Tg8Avvi4ouo9z+HJf3rojPFntzD3kgT59X/SlXT7+H/Lcyf4rI+8S4+MrZLq330
         KgyCczTYMDb7ZdusmhDdcSSWWM5zNk+jxm7kdsANV5PFpS5wpCmKDqc+iOVD27YL1j9P
         1BhmUj6GcvS0QJm5jx6C9hGs1FK2S+BdLuROGkhRalvzKIM6iBiFNyPIyCMlxXaHQnUR
         wwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718032211; x=1718637011;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCva5wXetFBP2BAPl883qTT/FreXl4XL7F5vVY8dcxI=;
        b=r+5iDnLB2BWtHU8nb87ipg9RDxMxtrMH7D832pCYJ4BhRJDX4nGyphFa68G/NbS38f
         oTh+vNt7le06y+GWv3TyVDP82m0/taOiAihsw9YBCR8QHXZusxt/TXNo9NHctGqj6u7h
         kbfohYFEn5jUILVHsreV0ymCBpYoeqxkX0jtuOF5mMN/PRjf/qmQm1NcG8uALT+5rJF+
         e+zt0lqkEcYIKeFMydveLt853g3jLpm9BpLWCuvink+ACjRQSXNybfFsuCjwhwTw8imW
         LsFAUpKomG5O8T49dTugb+QtphkMWjG21GyQLw7rtJt8drCKsiHe7TeWXeAw5otA/95g
         v3RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRZGzJ9sNT9jdrR92ZgwQq0f/fIhrlimHs8XyiyXse/hMhgUYBNW0xnbBWikxerdn1Sk+BY1cXtYshyjAr7wqLTSo6HbPXTtZcuKe1PiM=
X-Gm-Message-State: AOJu0Yxr5ZZVIUZ4f2q+B+awxlafQUkIRsnnC+kuoq7ueXi+gkKj/RGW
	K/ZaJoUS1fRacZDBG1CisNgUGZsP4poLKwR4Zw/rk2V3zpBY+GgiO1J6NCyYcg==
X-Google-Smtp-Source: AGHT+IHDs3sBs1VsKohIlv1RvlAqOR3U00lAv+fAH5wa1BnaLFDstKjRwsAk90j60Q8dco4N46fwhA==
X-Received: by 2002:a17:907:6d24:b0:a6f:2002:5bc4 with SMTP id a640c23a62f3a-a6f20025c37mr195339166b.15.1718032211274;
        Mon, 10 Jun 2024 08:10:11 -0700 (PDT)
Message-ID: <1bf03bd6-0f30-4a57-b597-bb59dcf800fa@suse.com>
Date: Mon, 10 Jun 2024 17:10:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 10/16] x86/domain: guard svm specific functions
 with usinc_svm macro
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
 <e03693d1daa386a31e09794b0167d282df5a8bfe.1717410850.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <e03693d1daa386a31e09794b0167d282df5a8bfe.1717410850.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.06.2024 13:26, Sergiy Kibrik wrote:
> From: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> Replace cpu_has_svm check with using_svm, so that not only SVM support in CPU
> gets checked, but also presence of functions svm_load_segs() and
> svm_load_segs_prefetch() in the build checked as well.
> 
> Since SVM depends on HVM, it can be used alone.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

The code you're touching is solely for PV, even if it's interacting with HVM
code. Therefore "x86/PV:" may be the better subject prefix.

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1731,11 +1731,9 @@ static void load_segments(struct vcpu *n)
>          if ( !(n->arch.flags & TF_kernel_mode) )
>              SWAP(gsb, gss);
>  
> -#ifdef CONFIG_HVM
> -        if ( cpu_has_svm && (uregs->fs | uregs->gs) <= 3 )
> +        if ( using_svm && (uregs->fs | uregs->gs) <= 3 )
>              fs_gs_done = svm_load_segs(n->arch.pv.ldt_ents, LDT_VIRT_START(n),
>                                         n->arch.pv.fs_base, gsb, gss);
> -#endif
>      }
>  
>      if ( !fs_gs_done )
> @@ -2048,9 +2046,9 @@ static void __context_switch(void)
>  
>      write_ptbase(n);
>  
> -#if defined(CONFIG_PV) && defined(CONFIG_HVM)
> +#if defined(CONFIG_PV)

In such a case, would you mind switching (back) to the shorter "#ifdef" form?
Then
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

>      /* Prefetch the VMCB if we expect to use it later in the context switch */
> -    if ( cpu_has_svm && is_pv_64bit_domain(nd) && !is_idle_domain(nd) )
> +    if ( using_svm && is_pv_64bit_domain(nd) && !is_idle_domain(nd) )
>          svm_load_segs_prefetch();
>  #endif
>  


