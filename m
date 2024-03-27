Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7CC88D89D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 09:19:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698337.1089898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpOUe-0005uQ-1N; Wed, 27 Mar 2024 08:18:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698337.1089898; Wed, 27 Mar 2024 08:18:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpOUd-0005s9-UW; Wed, 27 Mar 2024 08:18:43 +0000
Received: by outflank-mailman (input) for mailman id 698337;
 Wed, 27 Mar 2024 08:18:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cRKJ=LB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rpOUc-0005s3-ST
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 08:18:42 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9efb5206-ec12-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 09:18:41 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a46a7208eedso870773866b.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 01:18:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m5-20020a170906720500b00a4df01f4232sm1851904ejk.189.2024.03.27.01.18.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 01:18:40 -0700 (PDT)
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
X-Inumbo-ID: 9efb5206-ec12-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711527521; x=1712132321; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g92gV5bK1TC6T/7m7x8stFN6RuCEj8I9N4+i0a1FKXw=;
        b=PYpu4l48c4NvrcYmZMwgQ4+li820a5P2BliutezOVQKnU6bXcaa4U1FOmlVwMU7WOT
         bz4RoKVo/iYrb1eFyChREo+rVCcuNd3J0CBWPS8sUOACUamd+wWrr4YV1V8SHuZDb+9k
         zNLj64RmNt9LzdL+5LTS//Bwgqtxb3QGmsF7b6G+5c1gffkds+MwvJrObXGiULtH4TGJ
         6hObtNFXj0FKtBsPnc8aZdZL78QL3V3gToD2LNT/6mqJ7Ju1WlBmFaEH+NOJOE+JdohU
         P2gJGCCT+QZjzj32LB9KHDFVpH4Lh5KmvjvMhi2SnQ2DDQlvbOs+Mvcepe/334WOjpSJ
         8afw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711527521; x=1712132321;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g92gV5bK1TC6T/7m7x8stFN6RuCEj8I9N4+i0a1FKXw=;
        b=VgJ5ULTiQWPOw+6RcDyUWnREeC/daJdSbF6hSSI/PQISYuf8ovDxxYup9QIVmArssD
         ohHCZ8qA5WMKYTkPufIjE4R4vdVP2JyqhZ6gJcno+4/gCZm+gMsEItbbcCkecKvB3rWT
         hhGdJjUtBHpww/f17QFLQ8K0B05KsgCjpnMROiOJV7mxAu9Mvxe529/Tu9V5cyTK0lqa
         rH0aVDF1pWz9MxJNHBNAedjyYORunfLFm5G/LUOrW19+0lNHwWuLPt75/gYL7yYYlMvU
         T1YWQLYljGlgewsveXvZqqrVMgARFg9PZN/fAh3n9UX4Vb9vbdsxA3culqLEyGbQWPCo
         vbxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkMf2v82/E3kjzEWfWh+1TVmPrP42adcMAqWglvFU352TUuh7lHagJHN6n5kOO4BUFvbmSzliUk0xWAsQ2LeHyvxRYo9mzMA86P7wutmo=
X-Gm-Message-State: AOJu0YyIV/HkJyEFIYyER6a/VJ5YXqtjjbArZZqM8D6/MqatT2E51M4s
	qMb4f5+iiRy3hsAa5xAsG5Jz/9p9q3QUE5gUIp6DLIi2tOpd1gjy3lef2hD1Ew==
X-Google-Smtp-Source: AGHT+IHgeDP+HST5ioVm6VVAw+gxTJtMu96D/2cEFCBVpKdL0S30qLeBouBUW4miFov93Vyf7pyBag==
X-Received: by 2002:a17:906:8c3:b0:a47:3312:b32a with SMTP id o3-20020a17090608c300b00a473312b32amr2458089eje.58.1711527521160;
        Wed, 27 Mar 2024 01:18:41 -0700 (PDT)
Message-ID: <81af5825-cb82-4f91-b7ba-0fba995d24d1@suse.com>
Date: Wed, 27 Mar 2024 09:18:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 11/11] x86/public: hvm: address violations of MISRA C
 Rule 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, xen-devel@lists.xenproject.org
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
 <d9342b2a0390cf3128487cfe885940682bf9442e.1711118582.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <d9342b2a0390cf3128487cfe885940682bf9442e.1711118582.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.03.2024 17:02, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Btw, I've taken the liberty to drop the (secondary) hvm: prefix from the
subject; I can't ...

> --- a/xen/include/public/arch-x86/xen.h
> +++ b/xen/include/public/arch-x86/xen.h
> @@ -36,7 +36,7 @@
>  #define __XEN_GUEST_HANDLE(name)        __guest_handle_ ## name
>  #define XEN_GUEST_HANDLE(name)          __XEN_GUEST_HANDLE(name)
>  #define XEN_GUEST_HANDLE_PARAM(name)    XEN_GUEST_HANDLE(name)
> -#define set_xen_guest_handle_raw(hnd, val)  do { (hnd).p = val; } while (0)
> +#define set_xen_guest_handle_raw(hnd, val)  do { (hnd).p = (val); } while (0)
>  #define set_xen_guest_handle(hnd, val) set_xen_guest_handle_raw(hnd, val)

... spot anything HVM-specific in this change.

Jan

