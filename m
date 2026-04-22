Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GUHCsaE6GkNLQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 10:20:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC3B4435EB
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 10:20:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289971.1569628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFSoe-0002Hp-Bx; Wed, 22 Apr 2026 08:20:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289971.1569628; Wed, 22 Apr 2026 08:20:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFSoe-0002FX-95; Wed, 22 Apr 2026 08:20:12 +0000
Received: by outflank-mailman (input) for mailman id 1289971;
 Wed, 22 Apr 2026 08:20:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wFSoc-0002Ex-K1
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 08:20:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFSoc-00HGtm-0d
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 10:20:10 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e884b6-bab6-0a2a0a5309dd-0a2a4508c246-20
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 10:20:09 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e884b9-63b5-0a2a45080019-d1558032bdd4-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 10:20:09 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-488b0046078so46782445e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 01:20:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7bf7besm151891595e9.34.2026.04.22.01.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 01:20:08 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776846009; x=1777450809; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DzN7vi5GkKbehVfZjnq77eBktSneKx24xQ4r8v+j2N0=;
        b=QyHU8rkL3qLpkTYcmWJagDfROsbjfa3IDeeB912yuVuXYoK/14TyuEAJnvFyBXY314
         iCYQ5vsQKIt96j5ugP8rn6r+ey56oK0APmBxJO5quthIjkaNVA9AXC9qOnsJj7P8sBRm
         LB/MrnC7dT+qypHJmFT2XZsTMuMjXzjZ3eT0T7kxK/IViRlqt/rzPsm55XPm0ibJEKP8
         AbKrVkYLHkzQjpRUJM1yHEqESKGB3RrMPtNbEsdXRe1SLLnpj/XYlNG10zHeOBkOAtWw
         hQEwQxfNIxNa7AKOUNM4dYH26F2UFW8fsl6BZqyrwfs/F8o7+fEhHnl9z+a/R1fXaNfi
         Pyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776846009; x=1777450809;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzN7vi5GkKbehVfZjnq77eBktSneKx24xQ4r8v+j2N0=;
        b=H/09hfRx2lMaiVWL/FPqBVfLODih+MSokIt88okMwlmH6VGNCANFgZ9qgMW0Tv6iyw
         icwr5UfVqVq+xSmzjL3/y/9SrLE/M8GELAR8wSYWabjThflEpQ/EZQJVDUEQECCOuOlV
         23ISeWCEPZoy1Mn3v4w0b9JQjQ9yo9ECOwrTn4OV7GrlyAKesd51gMURUAZXPn617mdR
         z0v1X/uKIVnni5Ay4JON/2QbmCRQEiCJlt7oPAInw8b8kA0KqvgliWPXi3mFBW8KxZOK
         R4zFU7/sy7kZkkKZBcx8DMoeNTUXjTnsZsG+9Ek1BrawKImus+UUfUKmsWmwff4H/aYA
         a6mA==
X-Forwarded-Encrypted: i=1; AFNElJ9cvgYWw4jvfw/VK1rzGu0dYRKcjSf+GKG5Rt0r8CyDVt33LdQu5Ah4r/fj8cjnJgq23REwU/wBpfk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxw+lx0VtQFd1LWry6hQDzU/21wBSTUTGq+s/n5O38VakKijfJG
	8TpJnzt5sLll92DCZfCElJ9q0E5myutYG7LDqvFLoxfALmP828yap2N5Mb8f1gf0Hw==
X-Gm-Gg: AeBDietYwU4qGnYqsuhGa1V4AuwvE0TIIi8cpgolv8I4UEc9aPPzAg2jUABEC5S24+w
	emGw8bBPLQc7TORmHIN/yLYwzxWTi0pDH4u+4qZ7PKEdMuaQG9/FOx6uBHu9x79O0VCJ7bmqXwm
	zOv5sp73thFLdUmeP9R+bsTQD0Bc9ry5biwCXXm9t/PGdnVpGPRFykpPswZQOFQuTpCKaokH0eg
	ObYP1zLSOvJgrXtWkpe+fYnoNL9BmYuEIAQpZ+fHr5StmuKDPWseHBFOhq8ouzie/Ok1oXIpzJ4
	vQ1Zlei54XD/Qypf7gmIYUfyX2sUjFzKhb3n1B+RM2YKB1W3UYSpKjezl1pzz2GTpIl9U2o2LDF
	OsGdpG8FdJZ5u7ZQ17uX9KCnPWfb4EnkYI3P/tZERgX1/BO0GiTOUFJhDv1H7hRp+9EjUtD+OeV
	A3EMiyw4QUsWSRGvPe1ZkIQDdiue9ZpaqY1ne9KplAZF/mr21Fg13/2HXLpPFz5pJ5umnlF4NF5
	KpxnW60uyaqe3Y4Zpo2ZiH1Ow==
X-Received: by 2002:a05:600c:1d86:b0:48a:53ea:1405 with SMTP id 5b1f17b1804b1-48a53ea14f5mr110606135e9.12.1776846009175;
        Wed, 22 Apr 2026 01:20:09 -0700 (PDT)
Message-ID: <52c21d8a-f2ba-42e4-aa63-ddf65d460401@suse.com>
Date: Wed, 22 Apr 2026 10:20:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] xen/efi: Config parsing: Free the same page count as
 allocated.
From: Jan Beulich <jbeulich@suse.com>
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <127e7a4e0bf360d7ffe8be94022840a353a307b2.1776787216.git.bernhard.kaindl@citrix.com>
 <170028cb-ce5c-4677-88e4-32f57f372fea@suse.com>
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
In-Reply-To: <170028cb-ce5c-4677-88e4-32f57f372fea@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1776846009-3A169DB1-E8F34408/0/0
X-purgate-type: clean
X-purgate-size: 4296
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,citrix.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6EC3B4435EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22.04.2026 08:48, Jan Beulich wrote:
> On 21.04.2026 18:13, Bernhard Kaindl wrote:
>> When reading the config file or the config section, we may need to append
>> a terminating NUL byte to the config buffer if the last byte is not a
>> control character.
>>
>> This may cause an additional page to be allocated by efi_bs->AllocatePages()
>> if the config file or config section size is a multiple of the page size.
>>
>> For this case, increment file->size by one so the number of pages to be
>> freed by efi_bs->FreePages() is the same as the number of pages allocated
>> by efi_bs->AllocatePages() when the additional byte is allocated.
>>
>> I moved the dcache flush after the NUL termination so the flushed range
>> covers the final buffer contents.
>>
>> I didn't add a dcache flush for the copied cfg buffer in read_section():
>> that buffer is created by memcpy() and then consumed only by normal CPU
>> reads in the EFI loader, so there is no non-coherent producer or other
>> observer that would require cache maintenance.
>>
>> Fixes: df75f77092c1 ("EFI: avoid OOB config file reads")
>> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
>>
>> ----
>> PS: The same fix applies to its backport to 4.21 and other branches,
>> for example:
>>
>> stable-4.21:
>> Fixes: feb99494bf59 ("EFI: avoid OOB config file reads")
>>
>> stable-4.20:
>> Fixes: 05b8f716aa32 ("EFI: avoid OOB config file reads")
>>
>> PPS: A review using GPT-5.4 (just a data point for review) confirms what
>> I've found by manual code inspection:
>>
>>> The fix in boot.c:882-886 and boot.c:913-928 is consistent with the existing
>>> free sites at boot.c:790-797, boot.c:1564-1567, and boot.c:1638-1641: Once the
>>> config buffer gets an extra terminating byte, using the incremented size for
>>> PFN_UP during FreePages is the right fix.
>>>
>>> I also checked the parser helpers at boot.c:584-641; they already operate on
>>> a bounded buffer and treat NUL/control bytes as terminators, so the synthetic
>>> extra byte does not create an obvious parsing regression.
> 
> To avoid something non-obvious was why I deliberately left file->size
> un-incremented. But yes, I failed to recall that ->FreePages() takes a
> size.
> 
>> --- a/xen/common/efi/boot.c
>> +++ b/xen/common/efi/boot.c
>> @@ -858,7 +858,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>>      what = L"Allocation";
>>      file->addr = min(1UL << (32 + PAGE_SHIFT),
>>                       HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
>> -    /* For config files allocate an extra byte to put a NUL there. */
>> +
>> +    /* For config file buffers, allocate space for the terminating NUL byte */
>>      ret = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
>>                                  PFN_UP(size + (file == &cfg)), &file->addr);
>>      if ( EFI_ERROR(ret) )
> 
> I don't really see why this or the other comment you alter would need
> touching. But of course it'll be the EFI maintainers to judge.
> 
>> @@ -877,10 +878,12 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>>  
>>      FileHandle->Close(FileHandle);
>>  
>> -    efi_arch_flush_dcache_area(file->ptr, file->size);
>> -
>>      if ( file == &cfg )
>> -        file->str[file->size] = 0;
>> +    {
>> +        file->str[file->size] = 0; /* NUL-terminate the config data buffer. */
>> +        file->size += 1;           /* Free the same page count as allocated. */
> 
> _If_ we want to go with incrementing file->size, then I don't see why
> it can't be done using the increment operator. That specifically exists
> as a shorthand for "+= 1".
> 
> As indicated above, I'm not convinced though that we really want to
> alter file->size. I'd instead add 1 in the few instances of
> "efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size))". Sadly the adding of 1
> is conditional in read_section(), so maybe a "need_to_increment"
> boolean wants adding next to the need_to_free one? Then a small helper
> function may be warranted for those few instances of freeing cfg.addr.

Actually, no separate flag looks to be needed. If for the cfg file we set
->need_to_free, we know we allocated the one extra byte.

Jan

