Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F6AA1A0C0
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2025 10:20:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876105.1286463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tatNr-0005wv-57; Thu, 23 Jan 2025 09:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876105.1286463; Thu, 23 Jan 2025 09:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tatNr-0005uP-1m; Thu, 23 Jan 2025 09:20:19 +0000
Received: by outflank-mailman (input) for mailman id 876105;
 Thu, 23 Jan 2025 09:20:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhpA=UP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tatNp-0005uH-HJ
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 09:20:17 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 412af8c0-d96b-11ef-99a4-01e77a169b0f;
 Thu, 23 Jan 2025 10:20:15 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3863494591bso288800f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 01:20:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf322a414sm18564375f8f.47.2025.01.23.01.20.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 01:20:14 -0800 (PST)
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
X-Inumbo-ID: 412af8c0-d96b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737624014; x=1738228814; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7Jr2azDodMzgBejAO0xKx87ZKSMbgFNXoTP8dfxn3n0=;
        b=MEBLdM1Eu/vpy/uZAujmarhnSuiOOX0g3pkT79KasqRNJkEqPFE6zg57Nb+lP7QXer
         8nDaYhCbg7a8PqhZcP8vZf1KK2D0dTh06PsEjtw7qKHUriy5ujg3DunhznF+oVwzMpQg
         jYty7PfADsZjBj7ywGqUP8hPrhOPyiMBtKG5SxSKL6UZaY6aEM5Dm6E2SMoKHBRdrTSw
         bTiGj8gyEZdtqtZEgGpHyA6+GrXMzmjYqZ6ig5e9FdUDH3x3ileiTd4iZexbLc+k51ns
         87FCsaGlYAjxoVEyuxCUU1RfoCOUH/ARCM/i536fOMpjgP70XxYXjyPI458YY0yYNHYg
         do3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737624014; x=1738228814;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Jr2azDodMzgBejAO0xKx87ZKSMbgFNXoTP8dfxn3n0=;
        b=swABlaFoqfJUIIMauyr3YQtlPGWJYqRQuPMO+fXuaWzIO97CUl74CvoV/SlOx9Cw5e
         HX37dpu/J+ybD229QLtwwZLXdYa+UF/M3fUJFOTLI/WzWbYJa/HrDsi5YYKlKSUGZ0aE
         EQ6u4GY1qZNJoFkrbbcGkifwmxkhqz6L48vS5ZTxyloV/c4DwE+wUy7iHlVUarYCVOwN
         9E1VHYMiixKvI83kHh+NBrVSIiV9FY2HZ9hYx9w7W+s1vxP6TY1k5WvoAUEhgimp6WzJ
         PCjklXGp6XBtsUiWc5rHeFvHspS5qb8CcF90sUmUiRFfZP7gn8miNPfeYYKlnRFufRf3
         Huxg==
X-Gm-Message-State: AOJu0YxzwF4RboMuyub6Pkqp5MQCwOH4ya2/DrYpul6mjSbArQOczkIk
	lCD0fJY5XS2wSAs9USjF3WG4JwtrTTUurZ409X3KJPXSGQUNMlkkCf3HqLqbn7rCYWA5pnnDSzQ
	=
X-Gm-Gg: ASbGncupF3qYHSofgAXKc0ojO+TOgr8j08SQOXts/zQs94yBtbgK6uxg2eCSI0Hsvvx
	dFKWc2Dr+yfQr1pMhcik/vC0EAmbvDUKvSlTqjYu9u/92CDfhwWmUlG2U13X3xSMiqLKOaUoBmP
	TCIpH+DQMRVVXb0415ZPD38VYEbYsgCl8ptqiSj/PdEXmbGFpMWCHm3WPm6jHbEEbLgqr19pCaC
	UPc8Bp7PkGAnz7YEnDPoyL0z4ENX8Z3uYnKhNd+4y00BYXisp/UcDNYh/Oug4sDOymjQqYXY9X5
	kYE9v2w3HPPNpQeXgs+pe/mVQ/V+URtgp5R9PmTg7UeabSW+pAIqmf9Xm01+QBZtVg==
X-Google-Smtp-Source: AGHT+IHFvdM5nj6TnqemPiCW+JaNkfkCElKyd/v0ROFo6tSquTBY0tdUFw1lERpTZz+oBR4qByaQbA==
X-Received: by 2002:a5d:59ad:0:b0:38b:ed7b:f78c with SMTP id ffacd0b85a97d-38bf566f41cmr21752445f8f.6.1737624014507;
        Thu, 23 Jan 2025 01:20:14 -0800 (PST)
Message-ID: <600c8bee-a6fd-41df-82bf-60ec15fec42c@suse.com>
Date: Thu, 23 Jan 2025 10:20:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] x86/HVM: drop redundant access splitting
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <3294f629-f91f-4b5d-9eb0-40a34aa2ec3e@suse.com>
 <7d73f0c5-3d16-4cf3-b8de-e45f539e8916@suse.com>
 <Z5IFWQLbhCBk4XxY@macbook.local>
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
In-Reply-To: <Z5IFWQLbhCBk4XxY@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.01.2025 10:01, Roger Pau Monné wrote:
> On Tue, Oct 01, 2024 at 10:50:25AM +0200, Jan Beulich wrote:
>> --- a/xen/arch/x86/hvm/emulate.c
>> +++ b/xen/arch/x86/hvm/emulate.c
>> @@ -1084,7 +1084,7 @@ static int hvmemul_linear_mmio_access(
>>  {
>>      struct hvm_vcpu_io *hvio = &current->arch.hvm.hvm_io;
>>      unsigned long offset = gla & ~PAGE_MASK;
>> -    unsigned int chunk, buffer_offset = gla - start;
>> +    unsigned int buffer_offset = gla - start;
>>      struct hvm_mmio_cache *cache = hvmemul_find_mmio_cache(hvio, start, dir,
>>                                                             buffer_offset);
>>      paddr_t gpa;
>> @@ -1094,13 +1094,17 @@ static int hvmemul_linear_mmio_access(
>>      if ( cache == NULL )
>>          return X86EMUL_UNHANDLEABLE;
>>  
>> -    chunk = min_t(unsigned int, size, PAGE_SIZE - offset);
>> +    if ( size > PAGE_SIZE - offset )
> 
> FWIW, I find this easier to read as `size + offset > PAGE_SIZE` (which
> is the same condition used in linear_{read,write}().

Hmm, yes, considering that "size" here is specifically what "bytes" is there,
doing the change is okay. However, in general I prefer the way it was written
above, for being more obviously safe against overflow (taking into account
how "offset" is calculated).

> Preferably with that adjusted:
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

Jan

