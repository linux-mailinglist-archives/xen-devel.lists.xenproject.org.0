Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20673BE4293
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 17:16:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144571.1477935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9PiD-0001Bo-9y; Thu, 16 Oct 2025 15:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144571.1477935; Thu, 16 Oct 2025 15:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9PiD-0001AN-78; Thu, 16 Oct 2025 15:16:17 +0000
Received: by outflank-mailman (input) for mailman id 1144571;
 Thu, 16 Oct 2025 15:16:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CbFY=4Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9PiC-0001AB-4O
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 15:16:16 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b63a9c4-aaa3-11f0-980a-7dc792cee155;
 Thu, 16 Oct 2025 17:16:09 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3ee13baf2e1so715779f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 08:16:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426f2f72e18sm14085266f8f.0.2025.10.16.08.16.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 08:16:08 -0700 (PDT)
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
X-Inumbo-ID: 0b63a9c4-aaa3-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760627769; x=1761232569; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1vArv6wo5tBwa6fvWasx1D/iEMI37bxKNAeFjIYCxfw=;
        b=BSgG57t2Vzr/zLNKZCoMlDMmGrWKsrUZc7ke3lKid8Oz9moDq9Zq+d+dGf9G1R35Cf
         d2PltZJqdfULHY20EKk95Ib1ozMjoPlzWZiqNbnfzm+U8Mcugco0VY7wqX5bthW5pAkE
         heoqzT0J5/xIlYIZdqjnoOTHzc+Gg6vYtGcyEV79XWCi458FZmygrIJC6YbA73oCEh34
         4B8WKFIwITtmk6K375Ef82202ZtdNzvrh8uRL5fI/JMCjA1RZGIuYHIbAr5LCsN3x6BI
         vy4FpNfwfXUH1555MzxuZ0X2qriam5DNWlTTR1jYvqRmYWm87ge24AsrFgcl192UiWW6
         kGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760627769; x=1761232569;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vArv6wo5tBwa6fvWasx1D/iEMI37bxKNAeFjIYCxfw=;
        b=n4cP7nINwvThBQXw4hRJzw7G9mjac8DGd031u0HBBeNQUV3OMAljxaKUpKNn02TCtA
         lTUjFavvFHsODt4XYWiARZNBTSc4whgvOlK+uPbr6X2TBOjTFYCeFZR7Iq5nS7phDDPg
         hJqYkBa4o9/LZPmJk3wnrMDbdX8GDLWGDUHDQIpcpulEhiiqNWR196AWEAcPRxwi3nBn
         bDG8VUCV+bA/vc28gnyt9JUarsgDb3gPMWpjFy7HI/Hr2tMzFQrLejlDv0TwJEujWPJ+
         NNbEsmajnzmW6E0E+6EYE0ItagOkwbCpoD5nx/tbe7qxQp00Lh/98bBXUtpdcw7ISdd1
         ZUow==
X-Gm-Message-State: AOJu0YzZ08vsd1M414TTcru0o1bm/xkWfsuVGdNmfRYWgvp82Nv333tW
	ir/6rT/UH+dX9Yp1sC6Vym1UOqN/CJxHY+iXS3Lg3DQI6d6V33hVsU7jCzv7b1Zh+g==
X-Gm-Gg: ASbGnctJTvjxoWllDYYaHeKbnHoIp3M6qlAg0lkBCxqZ8TaVHura+8pchCX0/R6FDgb
	MwQK0uiedw3+QYliPdfYSCVlnpFnmTxNNaxho7+B3w34Qeytl0XdgenQZWhUb/TRWAapEC8CYcE
	dyHdRsYCibEzERcT+7gEQJ0H8Vcq0YmI9LXSQwoJ1thdeq1zMzreJSkVr5AmzV7PebzfMGr2ld9
	OAy4nhjGKGiNrDHK+Z1uZxgRlCccO2pfmd8gw+uNcsjD90IxdPC4+bdQEJurE7piYlQtaWFfrjP
	OfhBLsd7tyL2gh5JIDHI7+/FtNVx6p9oPGehdy6aeZq9PA8HN89TjY4x7KHCTWVOQFcLENUDOQF
	smRg39EKDU++kDld5IUQVLJGtC7jN/E4qAuMGB34IGocxiz9h/1XtG63Epn7CINm8seC23kFXQ1
	LQsspJibKN/jzJQuZVkhbu+S6pusPMdGKpjmNDGg8BOhqmw4jXo42NCgMnoBj+qhVBc2TVY5dzj
	HyQXtxt7A==
X-Google-Smtp-Source: AGHT+IGW6bxihta4Xn05sIHJOShGJt82MyWwltOnd31OLW58dilHl4OAi41TYoHoN7euV65Ky0tNQQ==
X-Received: by 2002:a05:6000:4313:b0:3d7:2284:b20 with SMTP id ffacd0b85a97d-42704d9cf76mr373294f8f.3.1760627768992;
        Thu, 16 Oct 2025 08:16:08 -0700 (PDT)
Message-ID: <264d1497-7155-4fac-a98a-fc1d587e2889@suse.com>
Date: Thu, 16 Oct 2025 17:16:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 01/10] x86/HPET: limit channel changes
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
 <494c897c-a138-4d16-93b2-67e3aa8d41e7@suse.com> <aPDH4-ZEfJ9LGc9J@Mac.lan>
 <14bb12b2-1a01-49a8-be9a-6a32c3729e9e@suse.com> <aPEKFwPe-PiHh-Ay@Mac.lan>
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
In-Reply-To: <aPEKFwPe-PiHh-Ay@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.10.2025 17:07, Roger Pau Monné wrote:
> On Thu, Oct 16, 2025 at 01:47:38PM +0200, Jan Beulich wrote:
>> On 16.10.2025 12:24, Roger Pau Monné wrote:
>>> On Thu, Oct 16, 2025 at 09:31:21AM +0200, Jan Beulich wrote:
>>>> @@ -454,9 +456,21 @@ static struct hpet_event_channel *hpet_g
>>>>      if ( num_hpets_used >= nr_cpu_ids )
>>>>          return &hpet_events[cpu];
>>>>  
>>>> +    /*
>>>> +     * Try the least recently used channel first.  It may still have its IRQ's
>>>> +     * affinity set to the desired CPU.  This way we also limit having multiple
>>>> +     * of our IRQs raised on the same CPU, in possibly a nested manner.
>>>> +     */
>>>> +    ch = per_cpu(lru_channel, cpu);
>>>> +    if ( ch && !test_and_set_bit(HPET_EVT_USED_BIT, &ch->flags) )
>>>> +    {
>>>> +        ch->cpu = cpu;
>>>> +        return ch;
>>>> +    }
>>>> +
>>>> +    /* Then look for an unused channel. */
>>>>      next = arch_fetch_and_add(&next_channel, 1) % num_hpets_used;
>>>>  
>>>> -    /* try unused channel first */
>>>>      for ( i = next; i < next + num_hpets_used; i++ )
>>>>      {
>>>>          ch = &hpet_events[i % num_hpets_used];
>>>> @@ -479,6 +493,8 @@ static void set_channel_irq_affinity(str
>>>>  {
>>>>      struct irq_desc *desc = irq_to_desc(ch->msi.irq);
>>>>  
>>>> +    per_cpu(lru_channel, ch->cpu) = ch;
>>>> +
>>>>      ASSERT(!local_irq_is_enabled());
>>>>      spin_lock(&desc->lock);
>>>>      hpet_msi_mask(desc);
>>>
>>> Maybe I'm missing the point here, but you are resetting the MSI
>>> affinity anyway here, so there isn't much point in attempting to
>>> re-use the same channel when Xen still unconditionally goes through the
>>> process of setting the affinity anyway?
>>
>> While still using normal IRQs, there's still a benefit: We can re-use the
>> same vector (as staying on the same CPU), and hence we save an IRQ
>> migration (being the main source of nested IRQs according to my
>> observations).
> 
> Hm, I see.  You short-circuit all the logic in _assign_irq_vector().
> 
>> We could actually do even better, by avoiding the mask/unmask pair there,
>> which would avoid triggering the "immediate" IRQ that I (for now) see as
>> the only explanation of the large amount of "early" IRQs that I observe
>> on (at least) Intel hardware. That would require doing the msg.dest32
>> check earlier, but otherwise looks feasible. (Actually, the unmask would
>> still be necessary, in case we're called with the channel already masked.)
> 
> Checking with .dest32 seems a bit crude, I would possibly prefer to
> slightly modify hpet_attach_channel() to notice when ch->cpu == cpu
> and avoid the call to set_channel_irq_affinity()?

That would be an always-false condition, wouldn't it? "attach" and "detach"
are used strictly in pairs, and after "detach" ch->cpu != cpu.

Jan

