Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B79C960B40
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 15:05:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783979.1193328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sivsZ-0002vg-Tx; Tue, 27 Aug 2024 13:04:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783979.1193328; Tue, 27 Aug 2024 13:04:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sivsZ-0002tq-RN; Tue, 27 Aug 2024 13:04:59 +0000
Received: by outflank-mailman (input) for mailman id 783979;
 Tue, 27 Aug 2024 13:04:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tHc6=P2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sivsY-0002tk-8c
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 13:04:58 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5143e4a-6474-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 15:04:56 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a86883231b4so712123466b.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 06:04:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e582d664sm107939666b.137.2024.08.27.06.04.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 06:04:55 -0700 (PDT)
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
X-Inumbo-ID: f5143e4a-6474-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724763896; x=1725368696; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2cJyZ6jcBQ7XZe4IFkWICAiqGmBRi+aikbjmzxCnGvE=;
        b=WmC6JoSW239/78Uzw+dm03tWYTWWPuafQ23S7JhBcKJyIchDFRntAfjF1Y35ZjKZNG
         2efVq/BJxgsWRtmp7pKciatdduGc9KK+r0jBYtARiRDquVYFilypyo+GSRl3QM3uzcr4
         EYnbNNsHb/3m4CCe+UzcraBd4zG0c/BmDR8AQVHw3rqwdGyZRNyzVjEZxQFl08gRvw3m
         OzrsP2VsaZfXEYatjnd3S61EhbVWw8TbmdAIaEVXjXVTWZdM0yPBYN0acxicKBCE3Ah3
         2X2MrxRY28EjVWZNAYl9omYLJO/JbTESvCO90GXGy7V4WxOTFXzXodWJsK0HQqj2w6nq
         MRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724763896; x=1725368696;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2cJyZ6jcBQ7XZe4IFkWICAiqGmBRi+aikbjmzxCnGvE=;
        b=ZzSlZ4+piOoGEuWqz3i67Kj9mcch59yOKaSdY4UZuZH5PsGPTMfOlJqLoVRMy+YD6l
         fQK/d0sILwPAzymY/ThCgSV5GcpRxnm0KzkkaEmtEy1wrKFA67nT19Oh2yl0LNd6/iBD
         ofgj0I/RbEA16kIV9brP+CkwspNpFNihQDOFh2JMHCdlCLwp28/c4Liu+nw05xx+8hPH
         OyjSLJdzRW5saD+mvT4O5wzAGq1fwpgcCNi+a9m6s949irn3yCfZMi0rTO0bNOjPqLJa
         CCeq6Ztqi2BJ8GcGLB4cmelESuwUQwRvU/mQdLJgDYk4h5+gPtjeIDaTrdaF8dbCLTUE
         KaSg==
X-Forwarded-Encrypted: i=1; AJvYcCWs/9lCZUetp3N/hlxCbML2WstHGm1Oc5YdBQbv6LUr7SwSztrxtbODg+GrZhpyhn4AXd0vbGWr+W8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzN6N0BZnS0XZt2ORd6rDgSuTeceVFtpRm0lT+nSFARdKF2KVL2
	DV3nOkBP/Y6M3C99C00L+1x+8czrcouSfqLQi+3WTengd3cj3aNq/qCU3yzNOA==
X-Google-Smtp-Source: AGHT+IHQtvh1kil61sGnP0e97pCeSuWqcGQ2w4z8axtA0qL8fzmlHvZZJurVnP2C4ltTqXOCxKc0EQ==
X-Received: by 2002:a17:906:6a14:b0:a86:6a26:fec7 with SMTP id a640c23a62f3a-a86a52c70ecmr1011399366b.30.1724763895555;
        Tue, 27 Aug 2024 06:04:55 -0700 (PDT)
Message-ID: <d939dffc-e8e3-40cf-8494-c03ae6978c90@suse.com>
Date: Tue, 27 Aug 2024 15:04:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] x86/dom0: disable SMAP for PV domain building only
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240827123949.24400-1-roger.pau@citrix.com>
 <734d41c3-709c-4286-8353-f5483b0987cb@citrix.com>
Content-Language: en-US
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
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
In-Reply-To: <734d41c3-709c-4286-8353-f5483b0987cb@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.08.2024 14:59, Andrew Cooper wrote:
> On 27/08/2024 1:39 pm, Roger Pau Monne wrote:
>> --- a/xen/arch/x86/dom0_build.c
>> +++ b/xen/arch/x86/dom0_build.c
>> @@ -612,7 +612,24 @@ int __init construct_dom0(struct domain *d, const module_t *image,
>>      if ( is_hvm_domain(d) )
>>          rc = dom0_construct_pvh(d, image, image_headroom, initrd, cmdline);
>>      else if ( is_pv_domain(d) )
>> +    {
>> +        /*
>> +         * Temporarily clear SMAP in CR4 to allow user-accesses in
>> +         * construct_dom0().  This saves a large number of corner cases
>> +         * interactions with copy_from_user().
>> +         */
>> +        if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
>> +        {
>> +            cr4_pv32_mask &= ~X86_CR4_SMAP;
>> +            write_cr4(read_cr4() & ~X86_CR4_SMAP);
>> +        }
>>          rc = dom0_construct_pv(d, image, image_headroom, initrd, cmdline);
>> +        if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
>> +        {
>> +            write_cr4(read_cr4() | X86_CR4_SMAP);
>> +            cr4_pv32_mask |= X86_CR4_SMAP;
>> +        }
>> +    }
> 
> I hate to drag this on further still, but can this logic be move it into
> dom0_construct_pv() itself, rather than here?

Just to mention it: I'm fine with this in principle, as long as this won't
mean a pile of new goto-s in dom0_construct_pv(). If a new wrapper was
introduced (with the present function becoming static), I'd be okay.

Jan

> That way, it won't need moving again to make cr4_pv32_mask exist only in
> PV32 builds.  (This step is somewhat tricky, so I'm not suggesting doing
> it in this patch.)
> 
> ~Andrew


