Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DF6B1745E
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 17:56:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065849.1431166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVdP-0008Qa-Pa; Thu, 31 Jul 2025 15:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065849.1431166; Thu, 31 Jul 2025 15:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVdP-0008NT-Ml; Thu, 31 Jul 2025 15:55:59 +0000
Received: by outflank-mailman (input) for mailman id 1065849;
 Thu, 31 Jul 2025 15:55:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhVdN-0008NN-KM
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:55:57 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7a79977-6e26-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 17:55:55 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b77b8750acso659529f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:55:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce8fa1bsm1999531b3a.48.2025.07.31.08.55.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 08:55:54 -0700 (PDT)
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
X-Inumbo-ID: d7a79977-6e26-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753977355; x=1754582155; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kGzszXsh7snFFhXE7ZJJUGnP0Ah4AsJQI5n73R7e0ww=;
        b=aVrFeowfPqMskZEorrivWAs2+0U8xRbs9nyTVxPKfY51Cs0Yh6iaKpumu0b3tdptOh
         IPXnof32nH22e4Qe76W8cbOqSrFm/VF0ngBXpcf/l+lNgoIJQ1nmDiA3HABrf+LFk3S/
         q2nSYlvbWFrFBL0mv3SgymG6cRrtG3xH4ddMbjKMXFempt5MmEsVJdt2YVW1E9YzzMRc
         z6NthXfLajwziRuRmQvpXV3i9DSkvFJHjB+SBmSmcnXHw1EQdBqKfD5CIVm2gm/8AyAQ
         3t5niITazZWct1+2duxFSotAEhRH6slt/2QN5jZTxAA5ABsxpag+4DwsCu3T9dREtiCE
         e0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977355; x=1754582155;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGzszXsh7snFFhXE7ZJJUGnP0Ah4AsJQI5n73R7e0ww=;
        b=M0yrpGL6IfpqodK8W5IssoQ30xVd7CU0e8HQhbH+FBVRyURk613kfr/3SnCcL4P++x
         4ozQu7gMZFS+VwfPC66guXAH+IhrNUzwgSit20bCF05UoqOl/VCCs7ddZys9JdVw+hWZ
         3PfKgAUab8iwbu0nPu3XUStgO+ub7Gen4QufdrYoJwCFlwYZ6JZwRvb0CMX+P3v5rtKK
         larQ8ZQYJjFO3neyoFsVr/UmJDph+74PKjxgs2WYmeKbol4zUgJmioIEklrJ7nb46TEL
         BOAni/aEuU/9phBbxCJCNIUH9jAzmh74lFV66Finhpo9mNpuitsFPk7SokyKPoq7Jsly
         OG8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWikXfLIMtSYIR/0JrtsVmZGBrADSF7JJRol35+YTuK4G+hKXnoZ87lJ0eG5ehOWOeUPt0pH0P9qoQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyTqrNQ4Lotuqz+9JgeTUa6eLvnqS3FuHnBzGN1GXiwqW7iIzgn
	/Em+j/ASotY8rbrETACMvrsRDCsmwqd/rHnr34kRqCvi7XiIg2ZhQfFkAQH2cf49Ng==
X-Gm-Gg: ASbGncvHUlhkf9DgTwVOmOkHnDkpqvM5/JYZ6TyWOoG1kXVJhym5ohWHj7nd3JB4N2z
	ZmB6oIt2rpW2SpabkAK38d2PnETfP7fGSe0Q4qwLLe8+D0htC9QcCdrgqPH/vAveN4j9EoYgbfJ
	1Zw4P8vwyTXx3skcvJxfujUwAY9+AWHf35uEMwBUG/lg5H+GqJJtQNmeDl+00ddG+V4NEMrokuY
	rkpjgyJXiRKz9DNu809b4eWQnAYIbSXUSzKw6925lRDICZXhb1ZO4dLZfT3ZdwJ0NpkCp3TIETL
	89HAhiFtdD4hZu175ftdp6K+Gd+Lwq4vVU0DmaU8B6iNyCRl6Go+Ms7XLechzBuqvqsO+HTSPcH
	VniWPX7ZW0g+s0Rj9aOd5UUta2An8WpVhgujnKC5kRrviVxbUY4xiqwgcW+LOutPfGmWri2WSNv
	l4AjfDUAk=
X-Google-Smtp-Source: AGHT+IEcfPXN5fBzeP5u042HgS+PRKKytZXiVRP0HtgRSquDcXPINLzYM53c1HxUhBkRowDT/SOrCQ==
X-Received: by 2002:a05:6000:2dc2:b0:3b7:908e:e4ac with SMTP id ffacd0b85a97d-3b79d42097dmr2247216f8f.2.1753977354956;
        Thu, 31 Jul 2025 08:55:54 -0700 (PDT)
Message-ID: <18da4fc5-88a8-4f45-a9f7-68354e0185e4@suse.com>
Date: Thu, 31 Jul 2025 17:55:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 2/3] vmx: Introduce vcpu single context VPID
 invalidation
To: Teddy Astie <teddy.astie@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1750770621.git.teddy.astie@vates.tech>
 <5aa649e122401c627d4560f68d156ead470ef6d6.1750770621.git.teddy.astie@vates.tech>
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
In-Reply-To: <5aa649e122401c627d4560f68d156ead470ef6d6.1750770621.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2025 16:01, Teddy Astie wrote:
> Introduce vpid_sync_vcpu_context to do a single-context invalidation
> on the vpid attached to the vcpu as a alternative to per-gva and all-context
> invlidations.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Looks okay to me, but I'm not convinced we want to put it in possibly long
before a first user appears.

> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> @@ -452,6 +452,19 @@ static inline void ept_sync_all(void)
>  
>  void ept_sync_domain(struct p2m_domain *p2m);
>  
> +static inline void vpid_sync_vcpu_context(struct vcpu *v)

Andrew - is this again a case where you would object to me asking for the
pointer to be pointer-to-const?

Jan

> +{
> +    unsigned long type;
> +
> +    /* Use the most precise invalidation type available. */
> +    if ( likely(cpu_has_vmx_vpid_invvpid_single_context) )
> +        type = INVVPID_SINGLE_CONTEXT;
> +    else
> +        type = INVVPID_ALL_CONTEXT;
> +
> +    __invvpid(type, v->arch.hvm.n1asid.asid, 0);
> +}
> +
>  static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
>  {
>      unsigned long type;


