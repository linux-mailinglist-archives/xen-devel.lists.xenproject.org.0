Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B652A80728
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 14:35:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941900.1341282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u28AH-0003kT-2u; Tue, 08 Apr 2025 12:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941900.1341282; Tue, 08 Apr 2025 12:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u28AG-0003hj-Vo; Tue, 08 Apr 2025 12:34:52 +0000
Received: by outflank-mailman (input) for mailman id 941900;
 Tue, 08 Apr 2025 12:34:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u28AG-0003hd-50
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 12:34:52 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcf23cba-1475-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 14:34:50 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-39c1efbefc6so3208077f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 05:34:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301b69fdsm14637771f8f.48.2025.04.08.05.34.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 05:34:49 -0700 (PDT)
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
X-Inumbo-ID: dcf23cba-1475-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744115689; x=1744720489; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ermBY3TVvJy03erDuqqORv1m+3hsWOgq7sPw4FotG/Y=;
        b=HVO/ITUgR/l5bXiRpIyPB1zqsFqsid3voKccxpd2LToWgoTt8daJ21IDoXOKUDptkY
         Tb0JuWwre6Zmi+2RLRNZoUcAiiAmssPbuUaxjnlg8yWy+pOYBtTvcV8qIcDKYfEeXCYq
         mU6P8YqKvRazOE3CUQ68PIvYPj6XVbUEGUjhfjP461B4vfaXZ/ViceQHSPuw/sXqqO8y
         kgCq0T86QdXiGU6snLU1SH8oW45wu4A6pLxrln09xXEYi6x7J4Twp8g77rzPEj7Xr6Ke
         JzZ+lO0grrwEv8OrHkHk/bb0jgcUR/4SkAecLENz10KSsmIi4rNnhtEh72eKD7/8bfyE
         I/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744115689; x=1744720489;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ermBY3TVvJy03erDuqqORv1m+3hsWOgq7sPw4FotG/Y=;
        b=fK2Qb81aXS2YADrMYZ14auXqMQaWhAiraf1DkRcAi7q9QMlYYqAW3EMA7myDkAbGyA
         dWp8JLqn6Fdbz58i2Ei3UDx/y4hrWtd7FVSkibfsMnLbrC02CcTA2tH5tmTNk9Ukvh+A
         f+/KCIBw35oql12S4Oj2VRjhfyKOxg/Txci82bj4E+gbETnBZtlbNDbUMvT68eyFDkKz
         8J+leDehh5jWdjaDpwYplgSAHufN1xQqWyYbfDRAKLswvLQwKA+DDAlgZxoAW6pojwvY
         hOGI9ThVA3jxCFdczcXj7XydmfHzXzl/tm8f0NInNhhaB9yb8yiLTUKPCr+afIwRIkut
         rACQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+BgsEVtgLg3eNo4Z3aZ+GGTiNqtIsDd3ejy+Pnd6p/aHCGZkuEn/h5vmhhp8oyNYlyJYgilWEr7g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQlARKlbrJR9O8m7huUKtSxLQe9Pyvgt2242bE7LsV9ZNu5KPY
	RBPnzLSM2hyrpFTWne5HBc9UwPrk9BgV4khtwJoTVITLh1J2qofurfWFx/ujQA==
X-Gm-Gg: ASbGncuduhNU4AY6NyuHX7CUAJpJ1jmL2tyzsTYG1vloeXi0X+utGwFUlHXY8HXZdck
	DM6KLZoP9cbz0l+PfRn46Ed6d7NYqXZAMWEW+whdmp4yz/p9cRGWg49vgvA1FzntK2b2BZLERWH
	OwLQbBWM2vPVJTDazWuQTep44oVTOc/5CWK8JKilYANDZVJJbAUDBngb8nLJkP267hlxkLLXp6R
	9cK3XnqZqTV4kXvOfeiLtNry0JFj1m5KGUQmVIgWHTu4at56rorEN626QEDC/0bsAB3iRzrZxpm
	3ICAiPml/M3S/K9/TWCQERrR5AI5VsoOMok2w1nl3Xgai8r+NOIIdeo90LFRmW1ytCwYiYpELkc
	t7aKtnHy8TPn9TnLLlzY/bHNoF4tAyA==
X-Google-Smtp-Source: AGHT+IEeCXVdEWheqdxXqqME0AZH0c1zgZ7oaW8crR0spp0xTFbjbmNovOUo0ZDsOFTQSA1BsRG+Vw==
X-Received: by 2002:a5d:59ad:0:b0:391:1139:2653 with SMTP id ffacd0b85a97d-39d6fd06913mr8733424f8f.52.1744115689381;
        Tue, 08 Apr 2025 05:34:49 -0700 (PDT)
Message-ID: <3364268c-41c9-47ed-a6d1-b8ee04118a46@suse.com>
Date: Tue, 8 Apr 2025 14:34:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] x86/mkreloc: fix obtaining PE image base address
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250401130840.72119-1-roger.pau@citrix.com>
 <20250401130840.72119-3-roger.pau@citrix.com>
 <6c37ad18-a830-453e-a7ff-fb4978e3f0df@suse.com>
 <a14a7a42-cf7e-463b-a87d-e302ce32371b@suse.com>
 <Z_UGr0A8LetHDJvB@macbook.lan>
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
In-Reply-To: <Z_UGr0A8LetHDJvB@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.04.2025 13:21, Roger Pau Monné wrote:
> On Wed, Apr 02, 2025 at 09:46:53AM +0200, Jan Beulich wrote:
>> x86/EFI: correct mkreloc header (field) reading
>>
>> With us now reading the full combined optional and NT headers, the
>> subsequent reading of (and seeking to) NT header fields is wrong. Since
>> PE32 and PE32+ NT headers are different anyway (beyond the image base
>> oddity extending across both headers), switch to using a union. This
>> allows to fetch the image base more directly then.
>>
>> Additionally add checking to map_section(), which would have caught at
>> least the wrong (zero) image size that we previously used.
>>
>> Fixes: f7f42accbbbb ("x86/efi: Use generic PE/COFF structures")
>> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Of the two checks added to map_section(), the 1st ends up being largely
>> redundant with the 2nd one. Should we use just the latter?
>>
>> Also sanity checking the image base would be possible, but more
>> cumbersome if we wanted to check moret than just "is in high half of
>> address space). Therefore I've left out doing so.
> 
> We could likely check that image_base >= XEN_VIRT_START?  However I'm
> not sure how easy it is to make XEN_VIRT_START available to mkreloc.

This is precisely why I said "more cumbersome".

>> @@ -54,31 +56,40 @@ static unsigned int load(const char *nam
>>  
>>      if ( lseek(in, mz_hdr.peaddr, SEEK_SET) < 0 ||
>>           read(in, &pe_hdr, sizeof(pe_hdr)) != sizeof(pe_hdr) ||
>> -         read(in, &pe32_opt_hdr, sizeof(pe32_opt_hdr)) != sizeof(pe32_opt_hdr) ||
>> -         read(in, &base, sizeof(base)) != sizeof(base) ||
>> -         /*
>> -          * Luckily the image size field lives at the
>> -          * same offset for both formats.
>> -          */
>> -         lseek(in, 24, SEEK_CUR) < 0 ||
>> -         read(in, image_size, sizeof(*image_size)) != sizeof(*image_size) )
>> +         (read(in, &pe32_opt_hdr.pe, sizeof(pe32_opt_hdr.pe)) !=
>> +          sizeof(pe32_opt_hdr.pe)) )
>>      {
>>          perror(name);
>>          exit(3);
>>      }
>>  
>>      switch ( (pe_hdr.magic == PE_MAGIC &&
>> -              pe_hdr.opt_hdr_size > sizeof(pe32_opt_hdr)) *
>> -              pe32_opt_hdr.magic )
>> +              pe_hdr.opt_hdr_size > sizeof(pe32_opt_hdr.pe)) *
>> +              pe32_opt_hdr.pe.magic )
>>      {
>>      case PE_OPT_MAGIC_PE32:
>>          *width = 32;
>> -        *image_base = base;
>> +        *image_base = pe32_opt_hdr.pe.image_base;
>> +        *image_size = pe32_opt_hdr.pe.image_size;
>>          break;
>>      case PE_OPT_MAGIC_PE32PLUS:
>> -        *width = 64;
>> -        *image_base = ((uint64_t)base << 32) | pe32_opt_hdr.data_base;
>> -        break;
>> +        if ( pe_hdr.opt_hdr_size > sizeof(pe32_opt_hdr.pep) )
>> +        {
>> +            if ( read(in,
>> +                      &pe32_opt_hdr.pe + 1,
>> +                      sizeof(pe32_opt_hdr.pep) - sizeof(pe32_opt_hdr.pe)) !=
>> +                 sizeof(pe32_opt_hdr.pep) - sizeof(pe32_opt_hdr.pe) )
>> +            {
>> +                perror(name);
>> +                exit(3);
>> +            }
>> +
>> +            *width = 64;
>> +            *image_base = pe32_opt_hdr.pep.image_base;
>> +            *image_size = pe32_opt_hdr.pep.image_size;
>> +            break;
>> +        }
> 
> Since you are already refactoring much of this code, won't it be
> clearer to fetch the header inside of the switch cases.  So that
> there's a single read call for each header type?

Except that the switch() itself uses not only pe_hdr, but also
pe32_opt_hdr. That could be re-arranged, but I'm a little reluctant to
do so.

>> @@ -108,11 +119,28 @@ static unsigned int load(const char *nam
>>  static long page_size;
>>  
>>  static const void *map_section(const struct section_header *sec, int in,
>> -                               const char *name)
>> +                               const char *name, uint_fast32_t image_size)
>>  {
>>      const char *ptr;
>>      unsigned long offs;
>>  
>> +    if ( sec->rva > image_size )
> 
> Strictly, should this be >=, as rva is a position, and image_size is a
> size, so the last allowed bit would be image_size - 1?

Yes and no. No in so far as this would be wrong for zero-size sections.
Yet see also the first of the two post-commit-message remarks.

Jan

