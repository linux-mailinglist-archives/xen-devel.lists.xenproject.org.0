Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHSxFAiUBGqrLgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 17:08:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEA5535C98
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 17:08:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308193.1579732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNBCM-0007gD-Vd; Wed, 13 May 2026 15:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308193.1579732; Wed, 13 May 2026 15:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNBCM-0007eC-Sc; Wed, 13 May 2026 15:08:34 +0000
Received: by outflank-mailman (input) for mailman id 1308193;
 Wed, 13 May 2026 15:08:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNBCL-0007e6-2g
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 15:08:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNBCK-00Dnl1-AV
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 17:08:32 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0493e7-bab6-0a2a0a5309dd-0a2a4502afcc-32
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 17:08:32 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0493ef-af86-0a2a45020019-d155dd2cc544-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 17:08:31 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-45562c41ec7so3356944f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 08:08:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8d1f6dbsm90898645e9.6.2026.05.13.08.08.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 08:08:30 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778684911; x=1779289711; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Clg5bc8c1og2WC5JQtDfjX0TaiURdMgt0rOVrfGQJ8g=;
        b=OUaRZ1PLPqfDKCyoHLQxr1I4aS4Bsb8+H9uce4FfEywQpMbb8aS/7MGz1OnO2zc1XQ
         voKMKNfWFndG4jpEyybcnFCpT54L3GFJWwSAY27wbedy9QKoIYS7nXLp46PM9f9SdEWP
         nTVmBtAdSjlu/ij6F7VpfXYYXK3XQNaJgQB5gJ6celKg5wwff6NG3mWJr0f2aAdiOVEV
         VBQj5pVnPeyx53JOI9haZFQ9HBS8M3XUa4ndT0NSzL1vUwgM8wmaf6UQnSAlMv0GkIyJ
         Kw6a5juzMhSE+wIu6Hcxz8LjY6l9h07qOWZtwHiktvwsQLIJTYtc8/+UO7PVsm5cAuY1
         GbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778684911; x=1779289711;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Clg5bc8c1og2WC5JQtDfjX0TaiURdMgt0rOVrfGQJ8g=;
        b=fslU3Je9lRpvpY8LsbxWuBZ2js/uG2uJuvic2ROb+NR0dzxeZVVRoDci8aUKBTgr0a
         8BfwuU/P3IDM6InAwngHCuB3Kd4Y0HR+qaV8gL8Yo3iNwK9/z23z6mkma3s1WbYkXhoc
         Acu24llFE4CdyU75fV5PjrcRtau7oZv+3akmmzYDqGFrSDHUblQGUucPCV/TZevFtebO
         AoRhiVZRoGpPu32omH8bWQ3XWXGphDLhJBaJarV+flAwAKJ6IM8JoC9r9B+uvTQszhUW
         VeQ7UxE9bVSCIEdZP4lQqVyQpuMoMZtZ6fgZK8JMVLOH+pHcwJKGvskjf12HU62X9xm0
         ySdg==
X-Gm-Message-State: AOJu0YyYw284xxALxU9qewSh84ZarLWBhAxDSQ347szAu8WwHBjji3Ua
	pCLYmseHzLss54sLKcuZ/2lDJ2+FXimkc1uO7C7QzkhFOgRvafYdOXdC0SU5bPd70g==
X-Gm-Gg: Acq92OEe45Fx4RUxQx7mWJxqCGsoSESPtOtJJtea2e8p8NSZ1S+OsUu5T5oKmLfz1t0
	CLpD3KeNtD/vZX6g4mfpUBR6CPZpyIGyqS5J1BimKT0bR9bVRW4LGWcefYkPufa22/QbNO3aun1
	cz226YFei5LcHqgzFUm6KL1PYggc5jRx2yhD/A1ZEMB6DfJClsf5NLWClsednHgAfwvhLzS+4wL
	hqOb2yg16I83z4e18d8MAoZHz3lLKd0qeZ2oo6Uq3VO214fTy8cQZkz0eQJB9TUte/K6MtTt0dQ
	EXB6E/sjfRp2a/j2Ol3HPiY4RaxTUxaWYDEX//5JYTCoYnB1kumPAEZ0Z2AZ6BDT3NIRSFJAXpy
	Xazq/uE2ZqIh0lD561yDwVcN5Ro13Z4nwyGn1Csf0x+HUsfbRtg1WJ1xYQFH7kfQAsY6udcx3H0
	CXrDx67u4NNzZoPCGfpJZ1wGS6gxLni6s4R2Ub1G/Y++UwXLD/jt7o4FK0XCGgQ4WQibSYDOJ0C
	5L8v3SdsTza/8QS76XJ9woFBQ==
X-Received: by 2002:a05:600c:5397:b0:48a:7aad:4425 with SMTP id 5b1f17b1804b1-48fc9a089c8mr48636835e9.3.1778684911133;
        Wed, 13 May 2026 08:08:31 -0700 (PDT)
Message-ID: <b5601654-b1c9-4e79-aaaa-ae9a811211da@suse.com>
Date: Wed, 13 May 2026 17:08:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 1/5] x86/time: use RTC century byte when
 available
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <b36b6f2f-2b0e-462d-9846-4a1b4d7edef9@suse.com>
 <2723456f-5d8c-4a2a-9876-e65d35579936@suse.com>
 <agQ7B0JQqisZ55jp@macbook.local>
 <35e23e0f-5439-4516-906c-4310cd05a4a9@suse.com>
 <agSP8jYIylnPfl_H@macbook.local>
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
In-Reply-To: <agSP8jYIylnPfl_H@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1778684911-A9772161-CEC50CFB/0/0
X-purgate-type: clean
X-purgate-size: 1692
X-Rspamd-Queue-Id: AEEA5535C98
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 13.05.2026 16:51, Roger Pau Monné wrote:
> On Wed, May 13, 2026 at 12:36:26PM +0200, Jan Beulich wrote:
>> On 13.05.2026 10:49, Roger Pau Monné wrote:
>>> On Tue, May 12, 2026 at 04:58:43PM +0200, Jan Beulich wrote:
>>>> @@ -1280,6 +1281,8 @@ static bool __get_cmos_time(struct rtc_t
>>>>      rtc->day  = CMOS_READ(RTC_DAY_OF_MONTH);
>>>>      rtc->mon  = CMOS_READ(RTC_MONTH);
>>>>      rtc->year = CMOS_READ(RTC_YEAR);
>>>> +    if ( acpi_gbl_FADT.century && acpi_gbl_FADT.century < 0x80 )
>>>> +        century = CMOS_READ(acpi_gbl_FADT.century);
>>>>      
>>>>      if ( RTC_ALWAYS_BCD || !(CMOS_READ(RTC_CONTROL) & RTC_DM_BINARY) )
>>>>      {
>>>> @@ -1293,7 +1296,12 @@ static bool __get_cmos_time(struct rtc_t
>>>>  
>>>>      spin_unlock_irqrestore(&rtc_lock, flags);
>>>>  
>>>> -    if ( (rtc->year += 1900) < 1970 )
>>>> +    if ( century )
>>>> +    {
>>>> +        BCD_TO_BIN(century);
>>>
>>> Don't you need to move the BCD_TO_BIN() translation with the rest, so
>>> it's not done unconditionally?
>>
>> No, the century field is always BCD.
> 
> Hm, then I guess Linux needs adjusting, as mc146818_set_time() only
> converts the century to the BCD format conditionally on the control
> register or RTC_ALWAYS_BCD.

Hmm, indeed.

Btw, while looking there I also noticed this

#ifdef CONFIG_ACPI
	if (p.century > 19)
		time->tm_year += (p.century - 19) * 100;
#endif

(relevant to a remark you gave on a later patch in this series).

> I've found several sources only that as you mention also claim the
> century value is unconditionally in BCD format.
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

Jan

