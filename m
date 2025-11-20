Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A9AC72F55
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 09:50:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166590.1493078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM0My-0006Gg-FH; Thu, 20 Nov 2025 08:50:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166590.1493078; Thu, 20 Nov 2025 08:50:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM0My-0006Dc-CR; Thu, 20 Nov 2025 08:50:24 +0000
Received: by outflank-mailman (input) for mailman id 1166590;
 Thu, 20 Nov 2025 08:50:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nz19=54=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vM0Mw-0006DV-L4
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 08:50:22 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1db59ed-c5ed-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 09:50:20 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b472842981fso79516866b.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 00:50:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cdac18sm154380066b.11.2025.11.20.00.50.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 00:50:19 -0800 (PST)
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
X-Inumbo-ID: f1db59ed-c5ed-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763628620; x=1764233420; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1k4wVoeEQx/R0py45cUqXCaTXbqkMdqxj52pacX72q4=;
        b=LLbdI4sKFBMEUSptTB8J4vVbOeR8kVtUqKBGMWUfHywJKDAk4crpfH9cV64gDMCtKw
         ar12br4PuUTV2SSdBrG58FMi9i50gZiK213URKOizf7nxBfLxD4PwLVBPQq+wybvKR5y
         JkiwAMZU7Fp4hauCXG5ClOqAnhWQUUVgahcl0/70Ec2o+MiixwmJb/aot0RcicCr+/Je
         J6zv3KBVoq73eu0RZkPBwrIjBazS5VJhA88J0EC9HHARnzGW+kaQero1DkC2JCIebNTh
         xrEvzRENYuNV471rh6q5VK5yZoDrJVLs7F8HGX1eakKO0NRtoGUHw//xT4XpK28ocuzx
         +P6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763628620; x=1764233420;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1k4wVoeEQx/R0py45cUqXCaTXbqkMdqxj52pacX72q4=;
        b=nsVI7u3/U4jk1VvS+vSNqFSG0qNc/IL01QIyrIXp/uY9ytzsBLEllyF9Rw7bOnenXL
         ERLqMKaip7ji4N3BZWlRgKX1XuR1weuqCuTMiWueD+Xf3Rbqfhz0DA+PJ2FWQyBY4NdF
         UPsil0xNrbiR69KHvwv17TFWdeaoslZ1VVhsA2quNUx8BwnuWQNAXQ+Qv5+7KfBb+Uvd
         wn1+GijfTSoWd/9QQq73gScWG3tVEAb41HwKdOEPZSQdPMEKlqzay6sqctYvqw4/71VO
         DC5HcLBjSf6r67EveGpEjCwju/LsbUbeEcRyz7hEQQ/dMK8LJvS/hd3d/HGeFVJfQEM7
         V4ow==
X-Forwarded-Encrypted: i=1; AJvYcCUNq7yeRfnm3XP75SAT7f3A5YjHkYF3veKNjJDLAK8O82JgFH6HoK1ygCde8qoAmfCinx7Q7LmalHw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdfGT6suBMLWTqe4gaYHSwpan8OeCKTKGfAL4Y//3oXVSaB07v
	e0w63um69C5WWlpx8t+qSN9mAUJKkuyaiAUFkNrdVBSIHRIyQvPkqF8rKZx4GvUULJQiinZ91ec
	Dios=
X-Gm-Gg: ASbGnctSx13XPihUtRdZVvR+eHgSJDDvgGqLk5S7eoDu1IikWU0iA2I7MvZ3E7gIG1D
	vOB8gvbB26DeiOAGbiD4tIduDIT2vytP4fkA1Cwo99Blqhvn4TL0bLkSrm6x/29lSMcJneO5aoU
	b655cbn6EZK1mrvE9evLA/mbPNbFoHviHWnMmwGpXRa0FT1d8Kg6ccYvhSZ+dVbWXvrPWn3TINV
	rEwstdzelZXM4YJJKlPDc+SAUd/DsGyyM9S1TDNeVsd1irOPw2DPjvv1AzoU7v2I+fTUcvl2jcG
	MlyRQc4Jj+LbNuqkrY0ZCW3t4CxvZLvGNgfxeGP4dpPC7rtnFMiz/tuMxCb3dDrhjZTYXLfu+ki
	h8kc1FH/5qeFazEvP4wtr1ydICqW9ugbL83K66oMW6uC+7J1nj4VWMi8xMHms1VtZumMZL8CVEF
	FntUFWeN0PV0FvAgAZZiPc1Y/XM2VUNcZBBGjRlGKxnhwwvJCNJJhGjpN/hwy3mioHbPFiQYDtp
	QA=
X-Google-Smtp-Source: AGHT+IEIA+z1PhPd96CVhddUlzLKUtRykbwgYG+/6wZlKYIeW2UNhagerMSh7Xx8qnWS1AivJOimag==
X-Received: by 2002:a17:907:3f17:b0:b71:1164:6a7e with SMTP id a640c23a62f3a-b7654af8628mr217740866b.0.1763628620205;
        Thu, 20 Nov 2025 00:50:20 -0800 (PST)
Message-ID: <dc779808-a46d-4b71-8cde-6239b4a68819@suse.com>
Date: Thu, 20 Nov 2025 09:50:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v8] x86: make Viridian support optional
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 Jason Andryuk <jason.andryuk@amd.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251119193215.1012108-1-grygorii_strashko@epam.com>
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
In-Reply-To: <20251119193215.1012108-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

(adding v8 tag to subject)

On 19.11.2025 20:32, Grygorii Strashko wrote:
> From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> 
> Add config option VIRIDIAN that covers viridian code within HVM.
> Calls to viridian functions guarded by is_viridian_domain() and related macros.
> Having this option may be beneficial by reducing code footprint for systems
> that are not using Hyper-V.
> 
> [grygorii_strashko@epam.com: fixed NULL pointer deref in
> viridian_save_domain_ctxt(); stub viridian_vcpu/domain_init/deinit()]
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com> 

As before - this R-b likely would need dropping, ...

> ---
> changes in v8:
> - drop checks from viridian_load_vcpu/domain_ctxt()
> - drop check "value != 0" in HVM_PARAM_VIRIDIAN handler, laways return
>   -ENODEV for VIRIDIAN=n

... when more than just cosmetic changes are made. Jason, please can you
indicate whether it's fine to retain?

> --- a/xen/arch/x86/hvm/Makefile
> +++ b/xen/arch/x86/hvm/Makefile
> @@ -1,6 +1,6 @@
>  obj-$(CONFIG_AMD_SVM) += svm/
>  obj-$(CONFIG_INTEL_VMX) += vmx/
> -obj-y += viridian/
> +obj-$(CONFIG_VIRIDIAN) += viridian/

When committing, I'll likely take the liberty to also move the altered line
up, to restore proper alphabetical sorting here.

> --- a/xen/arch/x86/include/asm/hvm/viridian.h
> +++ b/xen/arch/x86/include/asm/hvm/viridian.h
> @@ -86,11 +86,26 @@ viridian_hypercall(struct cpu_user_regs *regs);
>  void viridian_time_domain_freeze(const struct domain *d);
>  void viridian_time_domain_thaw(const struct domain *d);
>  
> +#if defined(CONFIG_VIRIDIAN)

Similarly I'm likely going to take the liberty and change this to #ifdef,
just like you have it elsewhere.

Preferably with the adjustments:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

