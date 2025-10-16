Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8109DBE1C8C
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 08:41:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144107.1477575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9HfB-0007hg-MM; Thu, 16 Oct 2025 06:40:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144107.1477575; Thu, 16 Oct 2025 06:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9HfB-0007fs-I7; Thu, 16 Oct 2025 06:40:37 +0000
Received: by outflank-mailman (input) for mailman id 1144107;
 Thu, 16 Oct 2025 06:40:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CbFY=4Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9HfA-0007fm-Ru
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 06:40:36 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04764e61-aa5b-11f0-980a-7dc792cee155;
 Thu, 16 Oct 2025 08:40:34 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-426f1574a14so165148f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Oct 2025 23:40:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47114423862sm7277085e9.1.2025.10.15.23.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 23:40:32 -0700 (PDT)
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
X-Inumbo-ID: 04764e61-aa5b-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760596834; x=1761201634; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iW/qEpx6yh7S5wMwdqHfKgEyIDn2vFR8Zdt/L2ESZ5Q=;
        b=NMahAtGGRQix8ocScbKozexP+l8z7te8qvwNoxjVJdd5YJxzR9jCcz9AHcPpKj6UwC
         GxM7UktwMe6M2pSh3s/mCimg2w8v6qH7aet3KJ8wBrjKMZgxjrCirGWovvWBF8bo0xQX
         urHBnGz1khQZjJy2veusgm7CHpYMD+ahGh+KYByOSahN9eBUh8JK4Swd48VMYeavvYjl
         NucwTGxuqLVqwUEIOzY0hRG0F8G3vMpGtx/j/kDQw2Ahlhj8OD1S8GWdlJu/iIaI34JN
         tsqTkVwzxuIxJ+ZMDF8Z4CgaDWMWaC5+SPSkdig5/INJhoNRBMQT1iOOZVP555eovf/h
         guGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760596834; x=1761201634;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iW/qEpx6yh7S5wMwdqHfKgEyIDn2vFR8Zdt/L2ESZ5Q=;
        b=iTxSzW40x+lndVKZD+FEPBTGn9uoRveqoLK4i8MvzsxK3r6H3UX2T4RQrb631HXdKZ
         Ph8vE5yMgF80XNN3wfLSGDTX5xTcfO3iyHB0Yq0e70xefDUmyPdpstdv2minTGwfH3TD
         IER3RjxuBMBRaqWEFrpkTh9Wql36iii+cqvgqZmsNczsqTXCSRPG4/yoF/CfD1GO/uBg
         3GTTB/g0XrZc7A9V3s4BLIvCYUykBnmjGU31tXC5meofKgfHFJ5lo5fcOZMVFDV9YmbX
         XpWsdKAyXGLskyp2VfW/jwaIj5lqiecGCdHdbs5R2rwOkhbna3FMvw/Pu6FH2lUumejn
         DJEw==
X-Gm-Message-State: AOJu0YwIwN7KP+UR6RPZ5Bu8qLFf/aNIAeefd3OyhG28UxIMkAcMSIFc
	m6Z2eE3Wy/MA8oGf/LrbJNqDhebwi/rbyRS+yFaGBQL/cSVasxAoGvI0tVOz1t5JYA==
X-Gm-Gg: ASbGncslnrK3Q/detElnFtUdRdxbjemnz6OndNi72Q5LTdUwVtH5tsH680RQE39FSAe
	2mqmAO6haW3PXFSK0OQf4JTTANLlO0RxbeUd0EQlw/WoAa34/5Cs0edbGQ6JiNHyo6oEkRfmTjf
	+V7Shit/MBX9QqxCrLGvXgCzFUZkJGnNQZrqy3t2SQ1Apr91OpCfrqTUXrH7ZP2YoYXGNb2LkZa
	KxuXgSZ0+MRXMEWUywFXtIW/3DPUmYUZBcJpF6OnNzO1nTd8lxor9si0Q/WIN/1uivZRvPlHfz+
	tcNS6qOtWnUn4KEgA/BFJstUCXHpETvyzR6+jf0iaz/+O95BnXlPIMOIYacZ+sKepIf3k87P1Z5
	PY44986/CpdyOf/F0S/nkh+QpLSerbtlWuHiNxzFNdytWrvkQNtXg9J1Q8RagtDkjolOEWnJJJ6
	r3P/i+u3OFoOvbo1EW8gpQ1RY1O08iNQdLedi1uGYZBg4uflwaC08Oulb9NTXujXViSVYL/vDpf
	NSyy3xABw==
X-Google-Smtp-Source: AGHT+IGNrLKOXqVAgqtMJWG1EV2G9j6beQW1ac2XzsMSg8PsqmXCex8qi0qjf/xvusoiL3egPHwOTw==
X-Received: by 2002:a05:6000:25fc:b0:426:d301:a501 with SMTP id ffacd0b85a97d-426d301a83bmr13415583f8f.62.1760596833710;
        Wed, 15 Oct 2025 23:40:33 -0700 (PDT)
Message-ID: <84756684-6dbd-40cd-88fc-79cda7d83017@suse.com>
Date: Thu, 16 Oct 2025 08:40:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/apic: Avoid infinite loop in
 io_apic_level_ack_pending()
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20251013211106.8720-1-jason.andryuk@amd.com>
 <aO39pb3L42ktBol_@Mac.lan> <d8cb0b5b-fbf6-4db0-ba70-f5a612e63cb4@suse.com>
 <a4ee443a-cf65-420f-9508-d7f34393316b@amd.com>
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
In-Reply-To: <a4ee443a-cf65-420f-9508-d7f34393316b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.10.2025 19:14, Jason Andryuk wrote:
> On 2025-10-15 08:59, Jan Beulich wrote:
>> On 14.10.2025 09:37, Roger Pau Monné wrote:
>>> On Mon, Oct 13, 2025 at 05:11:06PM -0400, Jason Andryuk wrote:
>>>> io_apic_level_ack_pending() will end up in an infinite loop if
>>>> entry->pin == -1.  entry does not change, so it will keep reading -1.
>>>
>>> Do you know how you end up with an entry with pin == -1 on the
>>> irq_pin_list? Are there systems with gaps in the GSI space between
>>> IO-APICs?  So far everything I saw had the IO-APIC in contiguous GSI
>>> space.
>>>
>>>> Convert to a proper for loop so that continue works.  Add a new helper,
>>>> next_entry(), to handle advancing to the next irq_pin_list entry.
>>>>
>>>> Fixes: f821102450a1 ("x86: IRQ Migration logic enhancement.")
>>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>>> ---
>>>> v2:
>>>> continue (not break) for pin == -1.
>>>>
>>>> I added the next_entry() helper since putting the expression in the for
>>>> loop is a little cluttered.  The helper can also be re-used for other
>>>> instances within the file.
>>
>> Would this intention ...
>>
>>>> --- a/xen/arch/x86/io_apic.c
>>>> +++ b/xen/arch/x86/io_apic.c
>>>> @@ -1586,14 +1586,21 @@ static int __init cf_check setup_ioapic_ack(const char *s)
>>>>   }
>>>>   custom_param("ioapic_ack", setup_ioapic_ack);
>>>>   
>>>> +static struct irq_pin_list *next_entry(struct irq_pin_list *entry)
>>>
>>> I think you can make the entry parameter const?
>>
>> ... possibly conflict with such a change?
> 
> I changed only the parameter to const, and the return value is still 
> non-const.  So I think that will be re-usable.
> 
> I placed next_entry() immediately before its use in 
> io_apic_level_ack_pending().  It would need to be earlier in the file to 
> be used more.  Should I move its addition earlier?

I think so. One other thing which came to mind only after sending the earlier
reply: "next_entry()" is overly generic a name when it's to be moved away
from its only user. "next_pin_list_entry()" maybe? Or "pin_list_next()"?

> And another Minor question.  Roger asked for ~Linux style in the for 
> loop.  But in next_entry() I have Xen style:
>      if ( !entry->next )
> 
> Should I switch to:
>      if (!entry->next)
> 
> ?

I'd say no.

Jan

