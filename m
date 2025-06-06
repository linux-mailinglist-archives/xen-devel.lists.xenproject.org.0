Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B48ACFD73
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 09:27:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008034.1387253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNRTn-0002fI-4r; Fri, 06 Jun 2025 07:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008034.1387253; Fri, 06 Jun 2025 07:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNRTn-0002cd-1a; Fri, 06 Jun 2025 07:27:07 +0000
Received: by outflank-mailman (input) for mailman id 1008034;
 Fri, 06 Jun 2025 07:27:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNRTk-0002cO-Vj
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 07:27:04 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3c58f25-42a7-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 09:27:02 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-450d668c2a1so20118905e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 00:27:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23603405e6esm6620405ad.170.2025.06.06.00.26.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jun 2025 00:27:01 -0700 (PDT)
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
X-Inumbo-ID: a3c58f25-42a7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749194822; x=1749799622; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F2PNFm1B6tEmudltOwJqkR8JnZtHtLpwvfP7Dqa3JbQ=;
        b=A9M9EEkMRCKg6RBCF1f+1Qh37ZN1rZtkf9FX/vEXf6cqSmwWVffzhueVuNB3tti9u+
         5biknl8+vfREJIKbwvTC/HzWY1vyLwwWQSnMOG1DzfqCvXc1oVwStW9sFPuL01fg2MvZ
         iWEFdD2a2DhEVxBn7iYttrmiHr51NrLaVpS1wzBjnpq3pmavvlpOVh+izkz2yPa7KPH9
         WDvgCHxbqc2txTf9gv6euipRTtlPy6qfBb4red7Wa0bnO4sSiUVuf5DA+WoqimTJDCjT
         dwGug5//CYPcPKXe3rSVzRwU9gLpG1OV9A7n3t5/vK13B2tF6GM2nsXX9A6NDWpwiZ4C
         I+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749194822; x=1749799622;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2PNFm1B6tEmudltOwJqkR8JnZtHtLpwvfP7Dqa3JbQ=;
        b=W0gSH3ukWxFA6sBxGndnEWc+HlWg915fKq+q9gqiZkOJlXhHeD+5aoHPjXBpCWjh3G
         QcAd5Eh5PTa5PJvFabCDE6HinmJsgpZAFI4ay3w9ejheO6txCdilZWrU0b2NoAM1FhvX
         SuXzA5gTPMvSmQIVh88gzXy3pDZ6OnyfYCOuziggYZOpg0N9FBMQE8AGh/XSr2e4EF0/
         wjKWH5iTeuX2L6ykiyaNfavWQO9ExldPhK1EZYOuIbZ2UGsPp2hlEa8ZcapW5FLlhXid
         +1oLyCSGARjxPZKt1D9hDcVQUf3EBKuxKAS9IOJ3VPfYKG1pLus5KFljSQNAXuiJJdF+
         5vhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOtL2VyLy8WTR1jBjBXzBaASczUa8AjA+DVOYRKJx4Lsfyj+e8MJSio3uEEyC4pVXiYthxPEExrqo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+BAp9fy+0UxAo3TmxvV/4oKpTh0RX+C4nhL84EziqVBNEtInH
	dok0rOEN9AesaC9XmF+25U+HfN9I95mQvBueCsyFuts+UfhZ5ryz0neEgfOoZ7pSWQ==
X-Gm-Gg: ASbGncsyljSb/hPdoITphWI7/h9K2qKWDzpFtn9JDnCmlhzJxeQGDQIVLoS1ZlwQvfX
	pN2/KVHzHaIGX7rUCIZmDD4HkCBS9WxeygMo34YZRbcID8g1R+pc8EhRX986Fpo2J+aIv/7h+o9
	xFiIzh78OsrvhmrtstnmCtSQm0pa8rdqpt7tRYPB5qpcdYsKSKMrHb9BwwVItKdFLpRNSONPr82
	nsjCNcjW+wpGeeVDPxEh5DdCkCRI6NeBSmubT0FvjtjkQUW16+8XKoTnLWwp8M4Hi4/7La4wBbI
	o4YBgKFusa0aASesfdkDH2D5XKwmINmSbHaDm5OIBRizy0KZTDfYsPzJMz4qyM/iRxes+BkuC+2
	TtZnw42JV92YKnP+i9T9wu8+bTKv3Xxk45MkM/QEr6RpjAGY=
X-Google-Smtp-Source: AGHT+IGWZUGUQBl9TiCWlpo0ejevE5OzoxR4HkvPBDqBzXJnXnVQqQYWZzno2z0BRQ7wC+hVSFdPiA==
X-Received: by 2002:a05:6000:240a:b0:3a5:1360:6b34 with SMTP id ffacd0b85a97d-3a526dc524cmr5756747f8f.2.1749194822160;
        Fri, 06 Jun 2025 00:27:02 -0700 (PDT)
Message-ID: <20badf36-f103-48af-ac9b-7e6f331cc0ac@suse.com>
Date: Fri, 6 Jun 2025 09:26:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: remove memcmp calls non-compliant with Rule 21.16.
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
 xen-devel@lists.xenproject.org, federico.serafini@bugseng.com
References: <20250604233537.2892206-1-stefano.stabellini@amd.com>
 <c252a43a-4e00-4584-bbb1-05347aa9b49f@suse.com>
 <alpine.DEB.2.22.394.2506051624050.2495561@ubuntu-linux-20-04-desktop>
 <13ad335c1868bcc02e2dc0a8da521f6d@bugseng.com>
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
In-Reply-To: <13ad335c1868bcc02e2dc0a8da521f6d@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.06.2025 09:12, Nicola Vetrini wrote:
> On 2025-06-06 01:39, Stefano Stabellini wrote:
>> On Thu, 5 Jun 2025, Jan Beulich wrote:
>>> On 05.06.2025 01:35, Stefano Stabellini wrote:
>>>> From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
>>>>
>>>> MISRA C Rule 21.16 states the following: "The pointer arguments to
>>>> the Standard Library function `memcmp' shall point to either a pointer
>>>> type, an essentially signed type, an essentially unsigned type, an
>>>> essentially Boolean type or an essentially enum type".
>>>>
>>>> Comparing string literals with char arrays is more appropriately
>>>> done via strncmp.
>>>
>>> More appropriately - maybe. Yet less efficiently. IOW I view ...
>>>
>>>> No functional change.
>>>
>>> ... this as at the edge of not being true.
>>>
> 
> Then our views of what constitutes a functional change clearly differ. 
> If you are concerned about performance the patch may be dropped, but 
> then does it make sense to apply the rule at all? An alternative 
> suggestion might be that of deviating the rule for memcmp applied to 
> string literals in either the first or second argument, or both).

FTAOD (since Stefano also said it like this) - it's not just "string
literal". The additional requirement is that the last argument passed
must equal sizeof(<string literal>) for the comparison to work
correctly.

Jan

>>>> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
>>>
>>> Missing your own S-o-b.
>>>
>>> Also (nit) may I ask that you drop the full stop from the patch 
>>> subject?
>>
>> I'll add the S-o-B and fix the subject
>>
>>
>>>> --- a/xen/arch/x86/dmi_scan.c
>>>> +++ b/xen/arch/x86/dmi_scan.c
>>>> @@ -233,7 +233,7 @@ void __init dmi_efi_get_table(const void *smbios, const void *smbios3)
>>>>  	const struct smbios_eps *eps = smbios;
>>>>  	const struct smbios3_eps *eps3 = smbios3;
>>>>
>>>> -	if (eps3 && memcmp(eps3->anchor, "_SM3_", 5) == 0 &&
>>>> +	if (eps3 && strncmp(eps3->anchor, "_SM3_", 5) == 0 &&
>>>
>>> Unlike the last example given in the doc, this does not pose the risk 
>>> of
>>> false "not equal" returns. Considering there's no example there 
>>> exactly
>>> matching this situation, I'm not convinced a change is actually 
>>> needed.
>>> (Applies to all other changes here, too.)
>>
>> If we consider string literals "pointer types", then I think you are
>> right that this would fall under what is permitted by 21.16. Nicola,
>> what do you think?
>>
> 
> While I agree that the result of the comparison is correct either way in 
> these cases, the rule is written to be simple to apply (i.e., not 
> limited only to those cases that may differ), and in particular in the 
> rationale it is indicated that using memcmp to compare string *may* 
> indicate a mistake. As written above, deviating the string literal 
> comparisons is an option, which can be justified with efficiency 
> concerns, but it goes a bit against the rationale of the rule itself.
> 
>>
>>>> @@ -302,7 +302,7 @@ const char *__init dmi_get_table(paddr_t *base, u32 *len)
>>>>  				continue;
>>>>  			memcpy_fromio(&eps.dmi + 1, q + sizeof(eps.dmi),
>>>>  			              sizeof(eps.smbios3) - sizeof(eps.dmi));
>>>> -			if (!memcmp(eps.smbios3.anchor, "_SM3_", 5) &&
>>>> +			if (strncmp(eps.smbios3.anchor, "_SM3_", 5) == 0 &&
>>>
>>> Here and below there's a further (style) change, moving from ! to "== 
>>> 0"
>>> (or from implicit boolean to "!= 0"). As we use the original style in 
>>> many
>>> other places, some justification for this extra change would be needed 
>>> in
>>> the description (or these extra adjustments be dropped).
>>
>> The adjustments can be dropped
>>
>>
>>>> @@ -720,10 +720,10 @@ static void __init efi_check_config(void)
>>>>  	__set_fixmap(FIX_EFI_MPF, PFN_DOWN(efi.mps), __PAGE_HYPERVISOR);
>>>>  	mpf = fix_to_virt(FIX_EFI_MPF) + ((long)efi.mps & (PAGE_SIZE-1));
>>>>
>>>> -	if (memcmp(mpf->mpf_signature, "_MP_", 4) == 0 &&
>>>> -	    mpf->mpf_length == 1 &&
>>>> -	    mpf_checksum((void *)mpf, 16) &&
>>>> -	    (mpf->mpf_specification == 1 || mpf->mpf_specification == 4)) {
>>>> +	if (strncmp(mpf->mpf_signature, "_MP_", 4) == 0 &&
>>>> +            mpf->mpf_length == 1 &&
>>>> +            mpf_checksum((void *)mpf, 16) &&
>>>> +            (mpf->mpf_specification == 1 || mpf->mpf_specification == 4)) {
>>>>  		smp_found_config = true;
>>>>  		printk(KERN_INFO "SMP MP-table at %08lx\n", efi.mps);
>>>>  		mpf_found = mpf;
>>>
>>> There are extra (indentation) changes here which ought to be dropped.
>>
>> Yes
> 


