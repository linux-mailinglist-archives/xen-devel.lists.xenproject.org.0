Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CC391858D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 17:18:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749154.1157177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMUPQ-0003ix-26; Wed, 26 Jun 2024 15:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749154.1157177; Wed, 26 Jun 2024 15:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMUPP-0003gh-VS; Wed, 26 Jun 2024 15:18:07 +0000
Received: by outflank-mailman (input) for mailman id 749154;
 Wed, 26 Jun 2024 15:18:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMUPO-0003e5-OJ
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 15:18:06 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 489d0d36-33cf-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 17:18:04 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ec52fbb50bso47345001fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 08:18:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7068af60b61sm5250981b3a.134.2024.06.26.08.17.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 08:18:03 -0700 (PDT)
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
X-Inumbo-ID: 489d0d36-33cf-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719415084; x=1720019884; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C+nF/ZJHGXLxzlX1XdgvehvuY5qRS+/fgfLlBv5maYg=;
        b=OIRtNXp7atzAaXEs+gF4EelQ7SCNljyaCp0YkdCP9Pm72GkZVX6txLNkHrUGzH+Nwj
         4upXha7PUfJDFnI/SZnP6eHLltLxTsigmnV2Agmwuj2iayfUnu2mJTiNnMbY+HAugJL0
         UM0XTlwyWRXQ/PX/30AANFp79CQljDlA+cjVkuBVqlk3wRRH6EjGTK9BiPISdtuls0wt
         L//5Uknw7an4Wxqtn1nVxxEeHvoxbTbtlvhV0P/wKyk47htPwA0bHfJ0S4ZwlXpCRuCQ
         rjS2IeOSiQ+prO80qyIteAdS2Py7bkEFX2XrOvPWWLuU+lSg6cSe/Ehn/uSLp1mwelsl
         bRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719415084; x=1720019884;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+nF/ZJHGXLxzlX1XdgvehvuY5qRS+/fgfLlBv5maYg=;
        b=LbK63vSMYk0gDzjcNkMLSthJb5CUuvyFC+2VfKuUyGQfOUkgPJMHXRV0Fj/Xqu/xhX
         zy1kMbFylT6jsCV3bIEh5WzkPC/0zEQUfw/gbjhJ5GYyEjPodAiFSx4o9NrQD13sc85U
         YgKEfT8tcW1QPDQZkdG1LhbJ0ZrOSo5dEG/kYFq+1T1SH89JAiuYS32/nYm50EIiOHVW
         pLLvZXy7uX127+HhcluapHb0CAa3+QerVvbiVNLNA68+qcleHYiIg6rt8tbW+Q5CMbIQ
         TpQ1b/IDhjRAEj9ap8WGwNazX1VGWxoqpGzShuMgjX9YBJ7lOvYAFJxlxNMlUfcYKZpx
         LzlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHdYWdRWHo/cQV4w0uPdW7ZhGoagYZTez2vBVv26XoRe1ziYv2c5+cpiBcr7tqE1G6snRbamzmcjaYC370M+3un6fell6cmuWGbUL1wxQ=
X-Gm-Message-State: AOJu0YzuEa28mvDY+yR9RZBfSH5jHOTNa/6wSIv1G6/ziHiL/jIq150Q
	slX/dQTzQfAqS2Uwo0KuQdNfoTQjoYIQKZyH+2/3YsddqobPrDqFlpvJILV0Ig==
X-Google-Smtp-Source: AGHT+IGgFDCyfM2WwwjyEP3x8Bpuz3FPRNKSmeMZV4Yabd6o6lqlBqePlZ/CSbrNLLewjgk4HYezMQ==
X-Received: by 2002:a2e:a17a:0:b0:2ec:42db:96a2 with SMTP id 38308e7fff4ca-2ec5b38b432mr63409791fa.29.1719415083634;
        Wed, 26 Jun 2024 08:18:03 -0700 (PDT)
Message-ID: <55717cd6-4819-4935-82df-c04453b9676a@suse.com>
Date: Wed, 26 Jun 2024 17:17:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 (resend) 04/27] acpi: vmap pages in
 acpi_os_alloc_memory
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20240116192611.41112-1-eliasely@amazon.com>
 <20240116192611.41112-5-eliasely@amazon.com>
 <D29ZZSXN0QPV.2627WUC2J3NUK@cloud.com>
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
In-Reply-To: <D29ZZSXN0QPV.2627WUC2J3NUK@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2024 15:54, Alejandro Vallejo wrote:
> I'm late to the party but there's something bothering me a little.
> 
> On Tue Jan 16, 2024 at 7:25 PM GMT, Elias El Yandouzi wrote:
>> diff --git a/xen/common/vmap.c b/xen/common/vmap.c
>> index 171271fae3..966a7e763f 100644
>> --- a/xen/common/vmap.c
>> +++ b/xen/common/vmap.c
>> @@ -245,6 +245,11 @@ void *vmap(const mfn_t *mfn, unsigned int nr)
>>      return __vmap(mfn, 1, nr, 1, PAGE_HYPERVISOR, VMAP_DEFAULT);
>>  }
>>  
>> +void *vmap_contig(mfn_t mfn, unsigned int nr)
>> +{
>> +    return __vmap(&mfn, nr, 1, 1, PAGE_HYPERVISOR, VMAP_DEFAULT);
>> +}
>> +
>>  unsigned int vmap_size(const void *va)
>>  {
>>      unsigned int pages = vm_size(va, VMAP_DEFAULT);
> 
> How is vmap_contig() different from regular vmap()?
> 
> vmap() calls map_pages_to_xen() `nr` times, while vmap_contig() calls it just
> once. I'd expect both cases to work fine as they are. What am I missing? What
> would make...
> 
>> diff --git a/xen/drivers/acpi/osl.c b/xen/drivers/acpi/osl.c
>> index 389505f786..ab80d6b2a9 100644
>> --- a/xen/drivers/acpi/osl.c
>> +++ b/xen/drivers/acpi/osl.c
>> @@ -221,7 +221,11 @@ void *__init acpi_os_alloc_memory(size_t sz)
>>  	void *ptr;
>>  
>>  	if (system_state == SYS_STATE_early_boot)
>> -		return mfn_to_virt(mfn_x(alloc_boot_pages(PFN_UP(sz), 1)));
>> +	{
>> +		mfn_t mfn = alloc_boot_pages(PFN_UP(sz), 1);
>> +
>> +		return vmap_contig(mfn, PFN_UP(sz));
> ... this statement not operate identically with regular vmap()? Or
> probably more interestingly, what would preclude existing calls to vmap() not
> operate under vmap_contig() instead?

Note how vmap()'s first parameter is "const mfn_t *mfn". This needs to point
to an array of "nr" MFNs. In order to use plain vmap() here, you'd first need
to set up a suitably large array, populate if with increasing MFN values, and
then make the call. Possible, but more complicated.

Jan

