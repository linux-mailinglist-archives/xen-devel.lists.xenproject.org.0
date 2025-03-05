Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A19A4FCCE
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 11:53:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902201.1310163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpmMu-0004Vh-Gc; Wed, 05 Mar 2025 10:52:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902201.1310163; Wed, 05 Mar 2025 10:52:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpmMu-0004Tu-Dq; Wed, 05 Mar 2025 10:52:52 +0000
Received: by outflank-mailman (input) for mailman id 902201;
 Wed, 05 Mar 2025 10:52:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tpmMs-0004To-SC
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 10:52:50 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa6a26f9-f9af-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 11:52:48 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-390eebcc331so396926f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 02:52:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e484452asm20826786f8f.61.2025.03.05.02.52.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 02:52:48 -0800 (PST)
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
X-Inumbo-ID: fa6a26f9-f9af-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741171968; x=1741776768; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RMok7cbR0K61PIx+N9lsP4PXqbzkRUAO8Y0fRA+vfY4=;
        b=Cunv0iRKYcJc3ioznMWm1jX8mCXtlesUcZn/7I25NKl0H7T5leKonXfTwHxUEEC0yk
         mOoCQNUSr1tBVrJxC5hl0JzFV+YNfAq9l8dNBi7KzmOWbFSkhfAs1DVIdlps2dU1EdWI
         SYip+IUP2w4PYmmPm+9TerkkD79eprcm3ylYauH1tKG7E1HpUo9d7NkKNAjRyxSu2/15
         sRLUz0sGDcbRpKHxH1RnTwYz7zLdpxyDtCHSRjC4Cgfk4zwlTVqGX4h6KGrFZ6EOv0pS
         GpawrqfVnQHYAQg/yoHwYr2HzvWyCV+4bVTtwVulfEN1mKmmQrh4OBNtuDWWZleVH6t0
         PZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741171968; x=1741776768;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMok7cbR0K61PIx+N9lsP4PXqbzkRUAO8Y0fRA+vfY4=;
        b=o4HPUEMLxjBDKxH3O2XKTCuFJ05tQfKp/PyKPdzWl22R9kDm1gbQZBXpi6vMnPCMWn
         C6wkfGxwd/aVea7vpAiON6byiFgYnakAXD8wvT6vZ4ZmZNd5Xh+2hcNBKIEAlKt1dHQs
         fHIZZ/1Nug46dGp+vBQWvOf6Skt0x8I6fihQ/905ionM45DYwIbo/OMITrdXmZ22u2si
         2lIZ6g26rOFOshGJHqdMK1jYa4PjC/gwNQA0qgw0e9mqEf2Lhfyx2QvBN71LbVpviadv
         cu1BfItH9N4eLXvX0+U/PmSYJuS4ZSJQff6hUEM0msp729aL2Q3PqtXH0/ni1XUaPl39
         Vfxg==
X-Forwarded-Encrypted: i=1; AJvYcCVlETAY7bBmL/7CxO93K7ZODltFOpcBVPqeM0FTref7+WIWJZ+yucUkTWNIIEd9bU+6bmUmFl6lgrE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzsoYWrrzzSdU+T2qRAqFomCYwylQrGPxKoYZ6KLqewS2fNVNX8
	mLLVzYOD4n1WY/SQPfmw7Ep9jbeOddnFDcP62Tgm14ZeZswpZS06ue5KxcFEfQ==
X-Gm-Gg: ASbGncteLTYJkZv1Ec32PPsXyKwA7yeJevDyyJUSJdQ5Lan9ECHkw2a8JMdALdfzOWP
	CKnJevRPYVzbVilB6myCStwWwXpZCtOjNiDZH3RgGaU4yqUfSiI2ac1Az7OimibfctzyoH/vFXv
	J7f07ZhA8goCckHEs4rLDOeJGDCGqJ5/S9j79nXrESahlXaXYEYQ4WBqUTlxmEu9N78CgojoZfX
	jBkiOGDFVBvOrdYYES9eoeQelrFCekQwewWwTirsjZmPNUxb9EUGJP6FvNMW36UkBO2si19XKNB
	TJ21fY/It87JX57FTv5PSeMUQqd4/P5537DiMYB0TRVZVGnwb1HTKeNaLmAOqfRn+SOrrsHjAe1
	DtEZZblcAW74hoT0LpXL6kAhJM9cq9A==
X-Google-Smtp-Source: AGHT+IHy3Mhy+MVlfS70FFSm37U+BR/OzNIt6egM9RIlIKxIRJO8MSNI7t5lvkyoWvwp32UNaLVhzQ==
X-Received: by 2002:a05:6000:2a8:b0:38a:4184:14ec with SMTP id ffacd0b85a97d-3911e9cbda1mr2166120f8f.1.1741171968330;
        Wed, 05 Mar 2025 02:52:48 -0800 (PST)
Message-ID: <efec544f-1904-472b-afef-291d25e939e3@suse.com>
Date: Wed, 5 Mar 2025 11:52:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/page_alloc: Simplify domain_adjust_tot_pages
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250224132724.9074-1-alejandro.vallejo@cloud.com>
 <fde4d70e-d7af-4e51-a871-d4ac19737064@suse.com>
 <D83BG5T2IRZW.2J68RYJ8CFPY6@cloud.com>
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
In-Reply-To: <D83BG5T2IRZW.2J68RYJ8CFPY6@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.02.2025 15:59, Alejandro Vallejo wrote:
> On Wed Feb 26, 2025 at 2:02 PM GMT, Jan Beulich wrote:
>> On 24.02.2025 14:27, Alejandro Vallejo wrote:
>>> @@ -504,17 +502,16 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
>>>          goto out;
>>>  
>>>      spin_lock(&heap_lock);
>>> -    /* adjust domain outstanding pages; may not go negative */
>>> -    dom_before = d->outstanding_pages;
>>> -    dom_after = dom_before - pages;
>>> -    BUG_ON(dom_before < 0);
>>> -    dom_claimed = dom_after < 0 ? 0 : dom_after;
>>> -    d->outstanding_pages = dom_claimed;
>>> -    /* flag accounting bug if system outstanding_claims would go negative */
>>> -    sys_before = outstanding_claims;
>>> -    sys_after = sys_before - (dom_before - dom_claimed);
>>> -    BUG_ON(sys_after < 0);
>>> -    outstanding_claims = sys_after;
>>> +    BUG_ON(outstanding_claims < d->outstanding_pages);
>>> +    if ( pages > 0 && d->outstanding_pages < pages )
>>
>> The lhs isn't needed, is it? d->outstanding_pages is an unsigned quantity,
>> after all. Else dropping the earlier of the two BUG_ON() wouldn't be quite
>> right.
> 
> d->outstanding pages is unsigned, but pages isn't.
> 
> It was originally like that, but I then got concerned about 32bit machines,
> where you'd be comparing a signed and an unsigned integer of the same
> not-very-large width. That seems like dangerous terrains if the unsigned number
> grows large enough.

Oh, indeed - I didn't take ILP32 arches into account.

Jan

