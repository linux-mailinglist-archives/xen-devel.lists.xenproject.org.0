Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66922CE6BD6
	for <lists+xen-devel@lfdr.de>; Mon, 29 Dec 2025 13:43:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194032.1512532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaCaY-0005ai-Eh; Mon, 29 Dec 2025 12:43:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194032.1512532; Mon, 29 Dec 2025 12:43:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaCaY-0005Xd-C7; Mon, 29 Dec 2025 12:43:06 +0000
Received: by outflank-mailman (input) for mailman id 1194032;
 Mon, 29 Dec 2025 12:43:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PeLl=7D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vaCaX-0005XV-1V
 for xen-devel@lists.xenproject.org; Mon, 29 Dec 2025 12:43:05 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea7c1980-e4b3-11f0-b15c-2bf370ae4941;
 Mon, 29 Dec 2025 13:43:03 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-477632d9326so55933955e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Dec 2025 04:43:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea227casm61921693f8f.15.2025.12.29.04.43.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Dec 2025 04:43:02 -0800 (PST)
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
X-Inumbo-ID: ea7c1980-e4b3-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767012183; x=1767616983; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Lmr7Q/HcT6fVIJ8ez55NnDaH+7UaV4yiXG3pMTu7JSc=;
        b=csqtyqRJZEqGyJ3/S96Ftb59l4BAByRYla4Fi29INQMdHesJ0xVOI0ZNGBpoTiJfFi
         Xf6SBR7kKzk9qnh6LkHYOr67LZqY+dgVQqoyB5j/EWZiqHYQm1x3bVH8SLhXokfORWWw
         /202xcPz5TqxomC44uDPiKvqUSnsyiC1/5iHpLx4iOhLP6/hgjMnOOmXgQPRBwPuMQVJ
         kfFLIm4YG+xmzLefCfbmOC6xfdwx6Iaqa+QzGTezNTUjapaA5QTpzcaFPuqN5Nnj2is9
         gFNNhJqOV7dNu6Yu9O452zMa2d28/um2yGl+JTf2a7TgiuBvyMambJdL9cLIKLv8K2+d
         mrtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767012183; x=1767616983;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lmr7Q/HcT6fVIJ8ez55NnDaH+7UaV4yiXG3pMTu7JSc=;
        b=II9O0weyuJyH08oWr13x28HKWjz27usn0FUrql40fYoJtlfLuDlg+FGga/YxpwUeU5
         vJIW9AS2Hikf+KotKpYpS/QitaKPTimNBWFYCQyX05TrbVEfhkFTpM1LMOxKXjmF3Zhc
         RKfSWo/re+eteIm3PsBxxW9Pdm7oYNruSxUV2BpNyzzc3XGlj820lEMEmHYgb8cbsEvK
         VpmxCfWGX+1EtxKxgfANB2kLyhdOXHv/QVFVdqquUmb+lw/Qn0ZJneHgL39CkpMXK6Re
         2eC2X7X70zhsp/DqXQbedZg1NtGfmaI/V2dH4gechuC36GniWq6zUmb4qCnwHUGW489m
         2yCA==
X-Forwarded-Encrypted: i=1; AJvYcCUHg+LgpPUobVvNUOho2u5tEBQcKK7pl6ega71JZh5lvbq+PaM+idvxWbEAXhb+TFknD0/nZwjHPnU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXDBaDVSdrIWQgpIPu5665ulFKWR3o5bvm3/PfIMz/Cc3JLPzs
	AAP/EpfxtEQhx5rMA2ahN1nzeL9liAUc5M7Sx/VBDbed7ZLMrd4G9UlhicbBYyvg/w==
X-Gm-Gg: AY/fxX7MMOo1liL5606Yg8Bq9hhIAq02Cu7Bz+LzJOesyU9gUv2MWodzb22k4qF8uRm
	ciSj6XaitBJ+uwM653YtPp90tbiCLsaqR6rUKhwnGKlBbtdtO/AZOUak6L8OlCPskWOTN7/DF43
	5BX7J/5ckae9hvBHUPdtsd8TxaYDKwXNEUrwFaaJ25oaaK8cBV8WJi3bHJfnmnBkZqiV/0hs1hi
	t1kG/KK8VpDCfF03zULSzbcAjYvCG1DcxcsD/fEC4geUggWjVm9Mat2iFL8DnltW75bqQekUWz0
	iC/CcEX9KxQCg/kGLk55IK4xw4Mu/fw814TmbTanr0ay1MfcgFsBgiEhjXgcVIFSgEA/6jv0e3+
	d7CiV3VSnJE5+PoHSbVU4V3xGiYKyxY6gmRZeVHPBxlehTDQ/8mK5vff2bLx2go+4y+6vFYr/mD
	3BdVW3JANuBzvHp7d+kIzq8aEeYUj+zyR6gArJTmlUk+5S14zPxsoePGpukvXQvVIEXBRqUzy1p
	RY=
X-Google-Smtp-Source: AGHT+IFaVj/38g1E0VfHlSKU6YGecsW21efGK1p6pjlzWrqALiEm/1dV68lCKDbTzFVY9u+G9ChqOA==
X-Received: by 2002:a05:600c:198d:b0:46e:35a0:3587 with SMTP id 5b1f17b1804b1-47d195a06a0mr362164075e9.27.1767012182715;
        Mon, 29 Dec 2025 04:43:02 -0800 (PST)
Message-ID: <ca0bc5bb-ba16-474c-86a6-350cbf7e8f18@suse.com>
Date: Mon, 29 Dec 2025 13:43:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/cpu-policy: move copy-in/-out functions to arch
 library
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD
 <anthony.perard@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4a8f06b9-8210-487f-9dd7-e0221e2df9db@suse.com>
 <41447fdb-bc9a-4b1a-afd0-9d878ab21301@suse.com>
 <ec5ecc50-d8e4-4385-9dd2-d20441d079da@citrix.com>
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
In-Reply-To: <ec5ecc50-d8e4-4385-9dd2-d20441d079da@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.12.2025 12:22, Andrew Cooper wrote:
> On 22/12/2025 4:54 pm, Jan Beulich wrote:
>> --- a/tools/tests/cpu-policy/Makefile
>> +++ b/tools/tests/cpu-policy/Makefile
>> @@ -42,11 +42,15 @@ CFLAGS += $(APPEND_CFLAGS)
>>  
>>  LDFLAGS += $(APPEND_LDFLAGS)
>>  
>> -vpath %.c ../../../xen/lib/x86
>> +vpath %.c $(XEN_ROOT)/xen/lib/x86
>> +vpath %.c $(XEN_ROOT)/xen/arch/x86/lib
>> +
>> +lib-y :=
>> +include $(XEN_ROOT)/xen/arch/x86/lib/Makefile.cpu-policy
>>  
>>  %.o: Makefile
>>  
>> -test-cpu-policy: test-cpu-policy.o msr.o cpuid.o policy.o
>> +test-cpu-policy: test-cpu-policy.o cpuid.o policy.o $(lib-y)
>>  	$(CC) $^ -o $@ $(LDFLAGS)
>>  
>>  -include $(DEPS_INCLUDE)
>> --- a/xen/arch/x86/lib/Makefile
>> +++ b/xen/arch/x86/lib/Makefile
>> @@ -6,3 +6,5 @@ lib-y += generic-hweightl.o
>>  lib-y += memcpy.o
>>  lib-y += memset.o
>>  lib-y += scrub-page.o
>> +
>> +include $(srcdir)/Makefile.cpu-policy
>> --- /dev/null
>> +++ b/xen/arch/x86/lib/Makefile.cpu-policy
>> @@ -0,0 +1,2 @@
>> +lib-y += cp-copy-from-buffer.o
>> +lib-y += cp-copy-to-buffer.o
> 
> cp works as a name in source code because it's used by a type called
> cpu_policy.
> 
> In this case, cp with it's UNIX association makes the file name very weird.
> 
> 
> If we're going to be properly lib-ing the whole thing, then we're going
> to have enough TUs for a directory anyway.
> 
> So, I think we want xen/arch/x86/lib/cpu-policy/copy-{to,from}-buffer.o
> right from the outset.

I did consider this, but didn't like it very much because of this implication:
Either I need to touch arch.mk again to specify yet another archive to the
linker (not very scalable). Or I need to teach the build system to know to
combine archives from sub-directories into the parent directory's (i.e. follow
how built_in.o are being treated).

As you ask for it, I'll use the former of the two approaches (for likely
being simpler). Let me know if you disagree, or if you know of another good
approach.

> Also, I'd really prefer not to have things split between the old and new
> locations.  Everything wants to move in one go.
> 
> I'd suggest having one patch doing a wholesale move of xen/lib/x86 into
> xen/arch/x86/lib/cpu-policy and fixing up the vpath's, then a subsequent
> patch splitting copy-{to,from}-buffer.o out.

Can do; I would have thought that doing the move piecemeal ought to be okay.

Jan

