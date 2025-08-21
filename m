Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C5FB2EF1C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 09:11:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087834.1445633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uozRd-0004nU-Jc; Thu, 21 Aug 2025 07:10:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087834.1445633; Thu, 21 Aug 2025 07:10:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uozRd-0004ls-Gn; Thu, 21 Aug 2025 07:10:45 +0000
Received: by outflank-mailman (input) for mailman id 1087834;
 Thu, 21 Aug 2025 07:10:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Hha=3B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uozRb-0004lm-SZ
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 07:10:43 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2c03dee-7e5d-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 09:10:42 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-61a2a5b06cdso1259483a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 00:10:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded3070b1sm336466366b.36.2025.08.21.00.10.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 00:10:40 -0700 (PDT)
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
X-Inumbo-ID: f2c03dee-7e5d-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755760241; x=1756365041; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N3h1AZ2T7CvyVmoojp7c8OtaEqzloYDb19z392xoYJg=;
        b=QsOb63muJSL+fGqwujKRyGCYSXFCcq+qXM4WR2FXQ4Q2ahmtX7ntSEKtjSab1JE4dL
         6DY9n2AlvKTU1o71ucSl5zhadTw791t5h6Bdq+V795Aaitw2gKzwr0HrPsDl8ppN+g8P
         lwrk/9Y/pzM0pb+Gm0i4TuA25ZypAezCcXvOyceSs5WdngxfWN0fpFETi+nOqNe24k+/
         U2v+SRmSRKmZxbGbCNzyp7alKTOsPK3Y84PySLzvvxik+k6GJLpZxqwTsvMrAhE+THZG
         qGjJro7iDpCLcmEuLNFRYM7seCOTOrNawvKxHaZTZtbLIm1r3epT52vw4HEHVxfNJUjJ
         1gXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755760241; x=1756365041;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3h1AZ2T7CvyVmoojp7c8OtaEqzloYDb19z392xoYJg=;
        b=u5w771kyvqGbOE/Mc2YIjCgZWR4AQUwrxjLJLRE9zwEiIXOfBZ9mRSl03HbEUXYmuS
         E0Mg0CM18Qc+9/XnCVZyzZ0xaydcJmYn4glCZS2hEwoVQW/xDHCT0dsDwoEvJwM43g38
         B7twf3OqT3JGrqOK2goc8IP7HHRcvm4DjqvK7RJaLZT14NJLw7yLJVhPZAxs3yDsg6mI
         9E3PeuoGvyxfOhDfdKrOgKBdER9YwJ/dKLWoygMd49GZLCnwGtV7B/jgz/MCG+ldkBtI
         PPs7WuOmJ6CR0624MMW/XoYJBd7+4WzirMk12zEIKeHCWOWnpNfFJg3vQQ3VULJMk5WG
         SwvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSX7SIvFlSvyVF5oci659wd0k+gjU8Eic/Qs5gN+5XTL3Yf+tvq2cTdHdgnre5+vGU8Tcj2tPrbGs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRGBWggtWa/1Ggk5PUhfFLREOupE3BJ9VZ6YVu7BbL1ZPRW3Pk
	SPrJpBQC5kdfmou9ghXd+zeALUyr0Wb/+Tfi5ZCNQV3sjt12Q5clTKSq382FZHBzEQ==
X-Gm-Gg: ASbGncsT4DX+GbcnxQe/vvATyZlTJWxJlXeQUBGguyAq1cZDaZo+keAsWNjxUJnZQwF
	J/WYfN1guVRk+XCyyY4Xlhe9VZ4ZYqP+kPz0PGusU+uyTlRn5iHF1cOnaOUY4WTuB5wKuu+icK1
	yETVWvOnJ8OgYsqCgQ4NQ1Joq2PGEL9xKWoA1z5map02u2LxLRihK/Fdy0IQM/QXOvPBO9BO2+V
	Vl6WfpFrKzT3o725p+UDiObWKPBRDDSQ2WUg/Xb+iP1xmMLjakWJfN0BsBZ/1FSEtXD9rXp3Ms/
	5b16WhTutAn2dxD7/1e09p1Z33Lk6+fDpp4Xn0AK4HsJWsPBgqxB4iy4y5Y0Z3H4CwnP7hI6TVc
	0WXZ9/2ZG68eAa5w+sH0VIW7wkIPHzWjWbHSs3DAkMJchspicsLxw32RDqUx9A79qNUKWYjbH76
	5aFtgt2FQ=
X-Google-Smtp-Source: AGHT+IG4Fc2ZXR/KiKevfPs3BwFnWjxF2BkRls4mMBlasPhEoy4cXdcweVZO2TmV5q4ZOJ4Lr+4+9g==
X-Received: by 2002:a17:907:d8f:b0:afd:eb4f:d5ce with SMTP id a640c23a62f3a-afe07d4c7b9mr137499566b.62.1755760241178;
        Thu, 21 Aug 2025 00:10:41 -0700 (PDT)
Message-ID: <608e90a8-e022-4f2c-909f-316b15379fd8@suse.com>
Date: Thu, 21 Aug 2025 09:10:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] common: make page_{is,get}_ram_type() x86-only
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a2dc40a8-908a-44a7-b443-90f492a775cc@suse.com>
 <4a568ff4-2cfd-40ec-b249-217fab34f4ec@suse.com>
 <8b852798-83ec-4f10-99c2-ae5f0bca7038@citrix.com>
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
In-Reply-To: <8b852798-83ec-4f10-99c2-ae5f0bca7038@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.08.2025 20:45, Andrew Cooper wrote:
> On 18/08/2025 8:57 am, Jan Beulich wrote:
>> --- a/xen/arch/x86/include/asm/mm.h
>> +++ b/xen/arch/x86/include/asm/mm.h
>> @@ -464,6 +464,16 @@ extern bool opt_pv_linear_pt;
>>      ASSERT(((_p)->count_info & PGC_count_mask) != 0);          \
>>      ASSERT(page_get_owner(_p) == (_d))
>>  
>> +#define RAM_TYPE_CONVENTIONAL 0x00000001
>> +#define RAM_TYPE_RESERVED     0x00000002
>> +#define RAM_TYPE_UNUSABLE     0x00000004
>> +#define RAM_TYPE_ACPI         0x00000008
>> +#define RAM_TYPE_UNKNOWN      0x00000010
>> +/* TRUE if the whole page at @mfn is of the requested RAM type(s) above. */
>> +bool page_is_ram_type(unsigned long mfn, unsigned long mem_type);
> 
> Making it x86-only is fine, but if you're changing the return type,
> mem_type can become shorter too.

Oh, indeed - done. Won't re-post just for this, though.

> Also, I'm struggling to convince myself that page_is_ram_type() is
> correct.  Even if it is correct, it is horribly inefficient, and we run
> this algorithm lots on boot.
> 
> Checking the type before the range is the backwards way of doing this,
> and it can be a binary search because we go out of our way to fix
> unsorted e820 maps.
> 
> Finally, acpi_memory_banned() shows that this really isn't the greatest
> API in the first place.  It's explicitly designed to take multiple
> inputs, but does the wrong thing for its' single caller wanting that
> behaviour.  I can't help but feel we'd be in a better position by
> removing this entirely and using plain E820 queries.

All valid remarks, but all to be taken care of separately imo.

Jan

