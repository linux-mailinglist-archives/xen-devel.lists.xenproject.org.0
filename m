Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2997A461CC
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 15:08:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896669.1305428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnI5X-0005PE-Cb; Wed, 26 Feb 2025 14:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896669.1305428; Wed, 26 Feb 2025 14:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnI5X-0005Mh-9p; Wed, 26 Feb 2025 14:08:39 +0000
Received: by outflank-mailman (input) for mailman id 896669;
 Wed, 26 Feb 2025 14:08:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnI5V-0005Mb-DV
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 14:08:37 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b193357-f44b-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 15:08:35 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so45874345e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 06:08:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba52bc49sm23666515e9.1.2025.02.26.06.08.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 06:08:34 -0800 (PST)
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
X-Inumbo-ID: 2b193357-f44b-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740578915; x=1741183715; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JY9Q2qiCNU0++lw+DEhZjWW19giYkV04mI19EHh7Enw=;
        b=EeTAoT0OknMOZJcZVhHDvpK2GAH95TMNOlOJ+OJkXMI2Zme9BLox4PNFgeBDC9L5Aa
         6MBPnNxJxZyJpJmiG3/cx46fGAfpfQLoUMgWrqyx7/d2qEH3yOuvsR+ahbeRMSNJT7ce
         9zQEdLa63iDlvEMDXZ18Ka7hLn2AivwfUOWiEA1sqNp7Dojf/CkmGZY6nZXc5KU7doGq
         FKn7t6WWGIz0MDdjOJidp1NDGrCENj5gQtD72hi8e/KzOuaophdt5OBFZuv4Q0mgmktH
         lkuVqBeNKfte6iuM1Pfg0E/jZwXP/pyoYBJopdT5vT47b0qXBcBqgM5ey6mS8CYh/l6Y
         knsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740578915; x=1741183715;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JY9Q2qiCNU0++lw+DEhZjWW19giYkV04mI19EHh7Enw=;
        b=Y6+1MHDcAM+/9zOyWH7CprV2v/4ccjr+YhpWgfklaG3HfIJvnY4si4miPuEM61PB5y
         ShhDpNsTMm7dFxM4fNUfpQ2h3tfXFeP3wax4/okt6WBZ8E+VLa9SPZ/JVrJEfl7p11R2
         0K9CQ9rqmJYUboOlIqGIzQ+V4yMPPERMHmBlW3J9eA/r264PKZTn5u2AkEQYZLorqzDr
         Pcbma76MPC5sCcrsR99XKQuGLKmRnXZlLU6gjRQmoOc599z3ANTY9Im8AjCZK+HmiGjJ
         CO6L9ywHCjufDRLgJy9TE7oS6mSbKDTqAGEgiUqtOSj6Qvx2I5/VvTSSd7UcHNkNe13K
         HYNA==
X-Gm-Message-State: AOJu0YxvVe3SdMVHF0g/OQs/gj42HBlHA4VGeT86iF9RMJwkyc5lrC34
	VsqC2XTR2YOD582gpzyZw/nCPUicQwd9CzHmEeOyn6+qoKSwZSBWf4y4MT5nWg==
X-Gm-Gg: ASbGncu2pLc1x5U5Mz9MJ7mA5YaY19TsdJKrpYxyxnysrilJRyKdlj33gvRNimgnOr8
	voSlA+S0g3yg7+RKM3EfNHE2THbQ3eysnuq+iWZMaZoSEy6zHqvaQSE6yLDMm2PcUGClorvwNk7
	qA3Cveh2b6dvRVNrGAlReRJtw1qPxkblBE8VwW3HmB8/TX7Hs5Rjh5bovbkdXABQV9+peIT2pFY
	St306yEl+O5aohvtqOraCOyhsELbkk1PO+eKH9ejyEgOgci4hEbK+5o843XPZzE1q/PykNK13Dw
	B+TMzOCXn28bNofZHB4v/gXWLNMbLHMUhxClEM/ONJS5XW17AaBMGaOPuw0f+aHxsS6f8VWvvHj
	kENHH/V83Z9c=
X-Google-Smtp-Source: AGHT+IEfyb7DXSgbuRxD01GNaF1XoXZ5K6LJaRCx+2Eog01yh58MM32/c1il8D3WCeclGO7w9wLfTQ==
X-Received: by 2002:a05:600c:1d1a:b0:439:a4a5:b86d with SMTP id 5b1f17b1804b1-439aea9be73mr199961305e9.0.1740578914904;
        Wed, 26 Feb 2025 06:08:34 -0800 (PST)
Message-ID: <a9d4384c-770b-4947-b099-cf4bba1583a5@suse.com>
Date: Wed, 26 Feb 2025 15:08:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/page_alloc: Simplify domain_adjust_tot_pages
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <20250224132724.9074-1-alejandro.vallejo@cloud.com>
 <Z78djoAU7vjGepjr@macbook.local>
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
In-Reply-To: <Z78djoAU7vjGepjr@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.02.2025 14:56, Roger Pau Monné wrote:
> On Mon, Feb 24, 2025 at 01:27:24PM +0000, Alejandro Vallejo wrote:
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -490,13 +490,11 @@ static long outstanding_claims; /* total outstanding claims by all domains */
>>  
>>  unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
>>  {
>> -    long dom_before, dom_after, dom_claimed, sys_before, sys_after;
>> -
>>      ASSERT(rspin_is_locked(&d->page_alloc_lock));
>>      d->tot_pages += pages;
>>  
>>      /*
>> -     * can test d->claimed_pages race-free because it can only change
>> +     * can test d->outstanding_pages race-free because it can only change
>>       * if d->page_alloc_lock and heap_lock are both held, see also
>>       * domain_set_outstanding_pages below
>>       */
>> @@ -504,17 +502,16 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
>>          goto out;
> 
> I think you can probably short-circuit the logic below if pages == 0?
> (and avoid taking the heap_lock)

Are there callers passing in 0?

>>      spin_lock(&heap_lock);
>> -    /* adjust domain outstanding pages; may not go negative */
>> -    dom_before = d->outstanding_pages;
>> -    dom_after = dom_before - pages;
>> -    BUG_ON(dom_before < 0);
>> -    dom_claimed = dom_after < 0 ? 0 : dom_after;
>> -    d->outstanding_pages = dom_claimed;
>> -    /* flag accounting bug if system outstanding_claims would go negative */
>> -    sys_before = outstanding_claims;
>> -    sys_after = sys_before - (dom_before - dom_claimed);
>> -    BUG_ON(sys_after < 0);
>> -    outstanding_claims = sys_after;
>> +    BUG_ON(outstanding_claims < d->outstanding_pages);
>> +    if ( pages > 0 && d->outstanding_pages < pages )
>> +    {
>> +        /* `pages` exceeds the domain's outstanding count. Zero it out. */
>> +        outstanding_claims -= d->outstanding_pages;
>> +        d->outstanding_pages = 0;
>> +    } else {
>> +        outstanding_claims -= pages;
>> +        d->outstanding_pages -= pages;
> 
> I wonder if it's intentional for a pages < 0 value to modify
> outstanding_claims and d->outstanding_pages, I think those values
> should only be set from domain_set_outstanding_pages().
> domain_adjust_tot_pages() should only decrease the value, but never
> increase either outstanding_claims or d->outstanding_pages.
> 
> At best the behavior is inconsistent, because once
> d->outstanding_pages reaches 0 there will be no further modification
> from domain_adjust_tot_pages().

Right, at that point the claim has run out. While freeing pages with an
active claim means that the claim gets bigger (which naturally needs
reflecting in the global).

Jan

