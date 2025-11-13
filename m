Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFB5C57233
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 12:19:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161037.1489053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJVMV-0001oH-AO; Thu, 13 Nov 2025 11:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161037.1489053; Thu, 13 Nov 2025 11:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJVMV-0001me-7d; Thu, 13 Nov 2025 11:19:35 +0000
Received: by outflank-mailman (input) for mailman id 1161037;
 Thu, 13 Nov 2025 11:19:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJVMT-0001mW-ML
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 11:19:33 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a05ef143-c082-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 12:19:31 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b728a43e410so103452266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 03:19:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fdac68dsm140830366b.62.2025.11.13.03.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 03:19:30 -0800 (PST)
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
X-Inumbo-ID: a05ef143-c082-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763032771; x=1763637571; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8njYjIYvFgpylsfnyCfrDOSlzIgDI8bELf737HJpN4w=;
        b=c1pBuJk4ejvSY8GCwz0hDhOyB74SZbL02egs6R6lqUCOf2dc0Ym2C9SSYhQ11Ez7nO
         yMzI0e3GcrVWtQh1tyNMx2+BRgCMKCN6V4D5Ohi6MR3udr2agBAnVAL9IXtu0cfeyjqw
         DQndSzlUSOSCgCqkWombZoa0ygiw4xkJQ0w6q05ij7gidPo8VdEu+KZuwB7SBSUV+t09
         P1KVUy230eNHw2XtGQxfsdQ6RT25rn9z59+TXO/NSH1cjGkp0d7nkAPeq47JQ63h9q1/
         8EyB0Ax5a37oGvqBzfOaDfclyB6Q7qB8AviBcb+NnSN4kaYNvdajoiNOy8/pRLGYDjcD
         Prxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763032771; x=1763637571;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8njYjIYvFgpylsfnyCfrDOSlzIgDI8bELf737HJpN4w=;
        b=oPgz9OgL5pDL3ojjmcErFAl2qex+qMA3lMfqOxNpRv0i/Ff8msdfNKkCLcxilsr52d
         QCyEw5c4kk/VzHQmPTJE3niI2JjpqNenTVWkw7hYou1vyLePkb2bsyIvQiSvWYDtITAg
         9aQ0blPicYJ66uL/8BpiE4zRk7vqb4JbTgoDnikRwdMJnUNu3BkSqzOWHNJ4X5GgmoxP
         jlP8hFaIOkfF2jG7TUHg0DdVgQ6lIhRA4cS6v0m5ydykAPEZUFVEOPLVyvWOuy60GQqi
         1phfGR6c2UXcAXAfpb5pKODk8k2R/IsbITmDWaAYOMjzcYZQTOLNhGO85QBMd/f/sD0q
         eQBA==
X-Forwarded-Encrypted: i=1; AJvYcCUu7wVif6EHoc/ZNCNU51qrSegsdd4inEdVLE+3zKnG5BXWkQcdXHXLJ50bxEb43oqsGTc1Azyqhi8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkfHQWZq34FNRxvkl79Dz4GiL4IlF7WzFsnRDpbYojLH1K6guO
	dvu22gTnl+gFCOucwDls+Wx7itxy0z/lhNWDdWeGQfjj6wkZMThjuv3KEYmRwtr6kQ==
X-Gm-Gg: ASbGncsJvq77pYx97cHh9osfmFW76C1Xs7HG0XgZrnNJgXyhqKKTPdsocFFpiYD01wO
	evEtYcF+ixbM1rLcDJMH4UiyEs1wV8ivx7/87vqUY9u1lsX7+JcaMi/BahBHwy39Lu3XoUiDUjA
	HEI6ndLL1RVytb4OyhMaTIhXLLA8OffimZ4+Dl4jCY4iWzZJLaI1jkZAwNkiACJj0NAUPrMLjRW
	BwbDgWeDkNMsazYYTSdWrG9Qk/3o5aEIqzLNsodkxwMw/US3/PgmZ3FCy5+s5FLbTHYwuoqh8qY
	o5vtzhPGqVJlKH9nqBuDGeCnmNB00GVEGxiE1jBd6IEi2MBvHaNkNCOEtsZdyHOCwA2rzQ7hQ7L
	1IUdy/+3CG27ZCOUJKQKaNq9640cRbHjMLtw9nCZMeClktqiHIdk7Bzd+FqcOJGLOYwz+t0xxC5
	bbIMnaLM79ot9+titP6Qs4kLM7D4IGcTPHf7XAbX4nA5QUjf6018pK/7NupxlrL1x+
X-Google-Smtp-Source: AGHT+IGJROyGvehnZgReKpD419h7VtPJXo8vCBPDHAqHOVZ7Va3xOa2DjRj68aUrFbjay77LTuXsrw==
X-Received: by 2002:a17:907:cd07:b0:b3d:73e1:d809 with SMTP id a640c23a62f3a-b7331abe7c3mr680629966b.48.1763032771238;
        Thu, 13 Nov 2025 03:19:31 -0800 (PST)
Message-ID: <f8dd8d55-8b5f-403a-9009-49d13112a774@suse.com>
Date: Thu, 13 Nov 2025 12:19:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v2 1/3] x86/hvm: move hvm_shadow_handle_cd() to vmx
 code
From: Jan Beulich <jbeulich@suse.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251111200958.3576341-1-grygorii_strashko@epam.com>
 <20251111200958.3576341-2-grygorii_strashko@epam.com>
 <25ec2731-e629-4cc7-b374-5e48fba4c814@suse.com>
Content-Language: en-US
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
In-Reply-To: <25ec2731-e629-4cc7-b374-5e48fba4c814@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2025 11:44, Jan Beulich wrote:
> On 11.11.2025 21:10, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Functions:
>>  hvm_shadow_handle_cd()
>>  hvm_set_uc_mode()
>>  domain_exit_uc_mode()
>> are used only by Intel VMX code, so move them to VMX code.
>>
>> While here:
>> - minor format change in domain_exit_uc_mode()
>> - s/(0/1)/(false/true) for bool types
>> - use "struct domain *" as parameter in hvm_set_uc_mode()
>> - use "struct domain *d" as local var in hvm_shadow_handle_cd()
> 
> One more please:
> 
>> @@ -1451,6 +1452,66 @@ static int cf_check vmx_get_guest_pat(struct vcpu *v, u64 *gpat)
>>      return 1;
>>  }
>>  
>> +/* Exit UC mode only if all VCPUs agree on MTRR/PAT and are not in no_fill. */
>> +static bool domain_exit_uc_mode(struct vcpu *v)
>> +{
>> +    struct domain *d = v->domain;
>> +    struct vcpu *vs;
> 
> const on all three pointer target types. Then, together with the function
> prefix adjustment discussed on the other sub-thread,
> Acked-by: Jan Beulich <jbeulich@suse.com>

Seeing that the other two patches are ready to go in (again, once the tree is
fully open again), I might as well do these edits while committing. So long as
you agree, of course.

Jan

