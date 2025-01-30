Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6442A22A22
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 10:18:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879413.1289620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdQfe-0003Oj-LO; Thu, 30 Jan 2025 09:17:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879413.1289620; Thu, 30 Jan 2025 09:17:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdQfe-0003Lb-Ib; Thu, 30 Jan 2025 09:17:10 +0000
Received: by outflank-mailman (input) for mailman id 879413;
 Thu, 30 Jan 2025 09:17:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdQfd-0003LV-4W
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 09:17:09 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa8d9ae5-deea-11ef-a0e6-8be0dac302b0;
 Thu, 30 Jan 2025 10:17:08 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aaee0b309adso106111166b.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 01:17:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47d10f6sm89464066b.53.2025.01.30.01.17.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 01:17:07 -0800 (PST)
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
X-Inumbo-ID: fa8d9ae5-deea-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738228627; x=1738833427; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N+g4gCTnbnhhfgvYhGTL+/Yp1nEM39RrsmrhZl/ykKs=;
        b=GA5+mADB0dp/80N9qHvx2amFwq257edlKM5legVfOAsGrrN5xaZVaWdXV2F0HJPDrV
         cJZZjx961sJ4KT1oz/tHZ7RWkhQoJ7OFA9FkS2vI7H4jvRcKpjNh5O1BMgXh02VX0dYI
         X/pFpyLBzazxQG4JQs0EIuNUEh20vYtoOTdz3wFwLF3BxK9uosE9cz0Wf3BgbznduHf2
         LWipqRuQRfSh9ogXeNa2D/bHWounpEk2cBZEta9Q4QKb0AiblGmx8ScQeAhKY4DmE8Ll
         IvKXWIFfB2m3iU8kZ7ccVoijxYmI73YdMOFd4WbnP13a4x7kzw59qf3GX4FKZ7ErOarQ
         3wMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738228627; x=1738833427;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+g4gCTnbnhhfgvYhGTL+/Yp1nEM39RrsmrhZl/ykKs=;
        b=jPm93NzwM4HAHx4E8fyVtUj0MQ7+TZRPZcwuoAGDDAOY2no+z4CJQaynY5jc1abovV
         yA6fQ9Hh1ZbS6OGyaySJJRO+JNfRn9zDTqlBLnCqftIt0Z0pVn4I5MOILGju8xs+2ljY
         INQBMeIT1fkIBo2Wx1hO+hxsoVtC/ZSvhgH7MgXVCP09HxqOqexdI4c/e2yDC/y9tRLb
         RNwQ7gEegrI81KU75/UhyvQVh1atnO9/K+u+SUGf5IV33mE5H5ZxF9Nn3z/7ScJgUtWP
         KhS6chCh6j4nBC/ZnVRDZ7FbXmepRRPSYgsTzqPhRs+SbVX1Bjc5G7XWAvNepMODcEyh
         PmIA==
X-Gm-Message-State: AOJu0YxuHlfTIP+RuvTwNmrocc6pWXOHE6dAJzaGs7VJQsQHSapZGNc5
	vR/KrMlja5AKp9I4KnRo++/f49vbEeAjx7uAW3IPuNP9Ze/PGqQ6kSltPf+8EQ==
X-Gm-Gg: ASbGncvzz8zUfJxNyc1k1EHbhQ77f63kGC1s750RzUmUM5UPm0Hg530GmwC+iJl8Zet
	jV1NV51kaUEwKGMBxotjIVoSCkl2SaZ2PGpLj8/i6varcCLaMoh4PgOAQmjTVYQMWVV68iZqxjZ
	P5aZCILAvueM2grmWKxrRdPlzcf4OWqKzTUvr2Ff6PwOq+aVuXCHROKBAnCWMss1yA3vLv+em5p
	bj0ka9uloRhUeSlu/z6HnjYdcu0UzR3b4ub8q7OMVPB8JicxXxkBF8p9T4guaubVxcZyBcAbr/1
	tSLnhstafKSlGTT5lBJP2KCEd4KcUxtZruS4+7VxvM5PSAiskGQFt+Evw5Cct3gaG/IY/H4DHMs
	i
X-Google-Smtp-Source: AGHT+IFapaUvMXR8MmQeJG006G48MOPuma+mappyfMRkLgTghNLs2cmyAW0wXt3rMDasi3jsgrcaRA==
X-Received: by 2002:a17:907:7f0b:b0:aae:eb0b:f39a with SMTP id a640c23a62f3a-ab6cfdbe551mr629529366b.42.1738228627394;
        Thu, 30 Jan 2025 01:17:07 -0800 (PST)
Message-ID: <cb108460-b3df-4d59-8cad-696981660bc2@suse.com>
Date: Thu, 30 Jan 2025 10:17:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] tools/hvmloader: Decouple APIC IDs from vCPU IDs
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250128163342.1491-1-alejandro.vallejo@cloud.com>
 <Z5kXq2RehzyFEYqA@macbook.local> <D7DXEC0N45CT.2JHUHP1XAVB5F@cloud.com>
 <Z5pWiYWGv66uXpAm@macbook.local>
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
In-Reply-To: <Z5pWiYWGv66uXpAm@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.01.2025 17:25, Roger Pau Monné wrote:
> On Tue, Jan 28, 2025 at 06:42:38PM +0000, Alejandro Vallejo wrote:
>> On Tue Jan 28, 2025 at 5:45 PM GMT, Roger Pau Monné wrote:
>>> On Tue, Jan 28, 2025 at 04:33:39PM +0000, Alejandro Vallejo wrote:
>>>> The hypervisor, hvmloader and the toolstack currently engage in a shared
>>>> assumption that for every vCPU apicid == 2 * vcpuid. This series removes such
>>>> assumption from hvmloader, by making it read the APIC ID of each vCPU and
>>>> storing it for later use.
>>>>
>>>> The last patch prevents writing an MP Tables should we have vCPUs that can not
>>>> be represented there. That's at the moment dead code because all vCPUs are
>>>> currently representable in 8 bits. This will inavitably stop being true in the
>>>> future after we increase the maximum number of guest vCPUs.
>>>
>>> While I'm fine with the MP Table change, should it also come together
>>> with a patch that introduces the code to create x2APIC entries in
>>> libacpi construct_madt() helper? (and bumping the MADT revision, as
>>> I'm quite sure version 2 didn't have x2APIC entries in the
>>> specification).
>>
>> That's a lot more involved though. Matt started something in that direction
>> last year, but testing it was (and still is) effectively impossible until
>> HVM_MAX_VCPUS increases.
>>
>>   https://lore.kernel.org/xen-devel/cd1a3ce14790af8c1bb4372ef0be5a6cbbb50b1c.1710338145.git.matthew.barnes@cloud.com/
>>
>> The rest of the topo series can be used to test that (with a hack to
>> artificially bump the width of thread_id space), I'd rather not test a patch
>> with a long and still uncommitted series.
>>
>>>
>>> Otherwise the MP Table change seems like a red herring, because the
>>> MADT created by libacpi will also be incorrect and APIC IDs will wrap in
>>> local APIC entries, just like it would on MP Tables.
>>>
>>> Thanks, Roger.
>>
>> My take is that this is strictly better than what we have today by virtue of
>> going down from 2 latent bugs to just 1. That said, I don't strictly need it
>> for the topo series to advance, so it is (in a sense) optional.
> 
> I'm fine with the patch, but it probably wants to mention in the
> commit message that MADT tables will still wrap when using APIC IDs >
> 255, as otherwise it seems MADT is not taken into consideration.

I think we simply should not add MADT entries with wrapped (truncated)
APIC IDs. Which can be done when they truly are at risk of wrapping, or
right here.

Jan

