Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B8D8B949B
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 08:20:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715535.1117232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2PnD-0003mM-B3; Thu, 02 May 2024 06:19:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715535.1117232; Thu, 02 May 2024 06:19:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2PnD-0003jy-7v; Thu, 02 May 2024 06:19:43 +0000
Received: by outflank-mailman (input) for mailman id 715535;
 Thu, 02 May 2024 06:19:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s2PnB-0003js-NU
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 06:19:41 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4639b44-084b-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 08:19:38 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41bab13ca81so57574815e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2024 23:19:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q8-20020a05600c46c800b0041ac4aafd3dsm731893wmo.12.2024.05.01.23.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 23:19:38 -0700 (PDT)
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
X-Inumbo-ID: f4639b44-084b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714630779; x=1715235579; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PkggZ4OXXNUCn2qbM23wSBqc8fUtkVETEdYNVwITcrU=;
        b=KzBWwEcfH6PHqNkFXOUdhROd4TyjnjQqIvH1F0tkoWblABk5MDtoJ8YgYth6e7WjHR
         kZCxtgyzo2JCip7AP3bKV3qDIxFInRAdmNxmDzlR8gSmKOqtxY38zuPA/i4MFhHSl8Qq
         sfV9hPG6soChcl6aNSUpLxUrbk5kS62FAolTkyXS9u/keGNPansPmY3b50xE0eNG2v/C
         JKdyxsHaUaL2/1iI1ynbbp+cb7yrjoPIrUCPqvy1Rcj9YY+DHJXaz+zpSU4+xxm7C0Db
         2dUbEDI0qB/sNhP1pTXcKElHLKidXx0d5mDon4Qi7v1pu+azSjpO4yirvVHONHYrB0HE
         /LJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714630779; x=1715235579;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PkggZ4OXXNUCn2qbM23wSBqc8fUtkVETEdYNVwITcrU=;
        b=uXtAS91Zz444KtgWWe12EP/g9AQrbS1VFxBJ34YHyt6aw/Jq5fzv5c0Y/15v7lK677
         y95cG5z10LC5KPRXh3II0jCzYsr/+E3hy9QvkL3sDsOMVhncuO5C9o9R2iQSEUyI5CWu
         W1YnvQdgibr3GFG44aOCuq0ECLd4O0ddlpxWWHJKOapFfNdOFFSY+bD4ttbhwallahlW
         nHFm82NTRWJ3zMPnLjH7pPNepyxecXbWEbtpLXCW39YYQpTPM1huwGw205Vbe7xf2sfE
         0xN2Z4UUtmJK5a6APlq6x7kLSSb4GCFhgsnuxYDU1MmPTK56dgcxjkn1vVyULVFyzrT2
         l+wA==
X-Forwarded-Encrypted: i=1; AJvYcCViBIRR+kUHVTfgXm2via4dGEbvqoRsiDHXI+0NIq5pC5JfhjGuWcqRmTU+fxd7NpUn+W1j/3VdB47D2ZlBWtwB1QiY1ygFcnSkG5IKriA=
X-Gm-Message-State: AOJu0YyEKPT/SxlrGhzTV5xJC0a7wJ/E+QgNxY0O/HfybTI36aM0xrEW
	m44k8ktRgX2PQbXVcTWfz3Myk64Ti12Gndtn1EZSizJpAN7cFtO9mHRQFp61YQ==
X-Google-Smtp-Source: AGHT+IFh3nBzt9EpmT6izizC73WBCENrf8v1TcXH+lNctNZZvVpwF9f9t36cfYlp/yIwhXsUQyJb+A==
X-Received: by 2002:a05:600c:4587:b0:41b:d85c:d3e2 with SMTP id r7-20020a05600c458700b0041bd85cd3e2mr4215450wmo.38.1714630779142;
        Wed, 01 May 2024 23:19:39 -0700 (PDT)
Message-ID: <b6460ffc-9308-4acf-8894-259a9cdd0ee2@suse.com>
Date: Thu, 2 May 2024 08:19:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] x86: Make the maximum number of altp2m views
 configurable
Content-Language: en-US
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1714322424.git.w1benny@gmail.com>
 <0041438ff7a5d5b2fad59b676f4ece80470bf3b3.1714322424.git.w1benny@gmail.com>
 <5600e97e-5d44-4901-a867-b48192e9525f@suse.com>
 <CAKBKdXjsz_By_nZHDBpzTASSwMQUw61-7UA0YYrSTN+YDivqWQ@mail.gmail.com>
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
In-Reply-To: <CAKBKdXjsz_By_nZHDBpzTASSwMQUw61-7UA0YYrSTN+YDivqWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.04.2024 18:00, Petr Beneš wrote:
> On Tue, Apr 30, 2024 at 4:27 PM Jan Beulich <jbeulich@suse.com> wrote:
>>> --- a/xen/arch/x86/domain.c
>>> +++ b/xen/arch/x86/domain.c
>>> @@ -685,6 +685,12 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>>          return -EINVAL;
>>>      }
>>>
>>> +    if ( config->max_altp2m > MAX_EPTP )
>>> +    {
>>> +        dprintk(XENLOG_INFO, "max_altp2m must be <= %u\n", MAX_EPTP);
>>> +        return -EINVAL;
>>> +    }
>>
>> ... using MAX_EPTP here feels like a layering violation to me. Imo there want
>> to be separate constants, tied together with a suitably placed BUILD_BUG_ON().
>>
>> Furthermore comparisons like this (there are further ones elsewhere) suggest
>> there is a (continued) naming issue: A max_ or MAX_ prefix ought to name a
>> "maximum valid value", not "number of permitted values". This is not a
>> request to alter MAX_EPTP, but one to make sure the new struct fields really
>> have matching names and purposes.
> 
> Do you have any proposals? I was considering nr_altp2m. Another
> question is what it should be named in xl.cfg - also nr_altp2m? I was
> too hesitant to name it like that, since there aren't any nr_* fields
> currently.

Internally nr_ or num_ are going to be fine. For xl whether either of
those would be, or maybe altp2ms= (along the lines of e.g. vcpus=), or
altp2m_count, or yet something else I simply don't know. That'll be
the maintainers there to help with.

Jan

