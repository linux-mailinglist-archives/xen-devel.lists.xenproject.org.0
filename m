Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KL0OkWF12mwPAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 12:53:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA193C94E4
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 12:53:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277002.1562291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAn0y-0006Mj-Ez; Thu, 09 Apr 2026 10:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277002.1562291; Thu, 09 Apr 2026 10:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAn0y-0006K6-Bh; Thu, 09 Apr 2026 10:53:36 +0000
Received: by outflank-mailman (input) for mailman id 1277002;
 Thu, 09 Apr 2026 10:53:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAn0x-0006K0-72
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 10:53:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAn0v-008sFH-18
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 12:53:34 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d78526-e002-0a2a0a5209dd-0a2a450c9576-18
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 12:53:34 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d7852e-f40c-0a2a450c0019-d1558034c8bc-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 12:53:34 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-48897fd88ebso7898155e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 03:53:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cd153d76sm68126145e9.0.2026.04.09.03.53.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 03:53:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1775732014; x=1776336814; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ltcKRhRbGayIkPWdDeFCuFZ46TC6MwpYh2LnyBISRvo=;
        b=Wxe3mZwHN2sDdQCM/FzUVg+zMweAK2JItAbQmzttMPFmm0WomwcBzCU0m8YO3bqRyZ
         Qj+sPOL1YnzAoCcLpMGcIYCkrI6xd/8lRT6CPi3KsnNlirsM1PWHfPT9cHsGiaOF35/6
         4oNY8OOZa59I4BAFewbnA1pk/AozR8AkN8swleETxjfUvKQ5+lvwf/blP9xh0KoKInnD
         U//x1LTLoM52UdG5Ef0FJbscTSVoeor/0q020IZQgHtVRBTQLeNBVUVsPbh3wNeYHA25
         GyPR330M3Xnl1QOjje5BG/8es8/6GXKG2EfpqQMTbP2+hSPC6z9ffTzp14aEoKP67LkX
         J32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775732014; x=1776336814;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltcKRhRbGayIkPWdDeFCuFZ46TC6MwpYh2LnyBISRvo=;
        b=Qn9ZsTlp9+4S4x+hRbxCgjmdintrAW3SPqiC2N4X3r5gbJNRCnu+y+Y3TAhpY4YtwT
         OC47+dEgW1udRwC9zKv03mKkKp/swbIv+lQwV0q1s05C4bLML2XOkwAKclHV73JU6paL
         7FL4PWcNddooMoJdI5ESO5ewpKuy6skXw38p1ul+PU8ZJ6RfRKLUS2zr7+owq7nhzg2i
         fOhWegu0JjOhNeZF8jIiFsYM93skjSSUmxiH0XgX0O3M4rDO65xLpJjnI5aUdyZ5PfhX
         RHZSZ6S8qwor2Svm5tfvOydixbGXxv1mcoXMBekoUXZ07WHcXOQWvx9d/97tFAuLJVnA
         Rzig==
X-Forwarded-Encrypted: i=1; AJvYcCUgxBujeI5+HeY9sKdTwhb6HfeE2w//AndGdwgPtxmInETunFZopVfe96I1hc6Mvb9DXwe3Gk40FN0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymyEGdl6nno+N3Q7ObbiwMgZsU7B/LwQa3qQZ2NEJLW3J0Nct8
	AAJXqBZkeVMuBdv9JRWAB2GfoDRRTXMfRxlqaPbTjlVNbaE5g1VSjOdmDpbTFy6wYw==
X-Gm-Gg: AeBDieslRYjdVOqG64nSrWSCe94fFh+EDgYsepngEc8LUZFjuhX9cQto6gPFpzPbJDc
	XCShGQleDr/77pIhsiBsGDcM11+sMtpsHwXTHBbnW/J7dv1/FwEvcJu+d+v8qIHr+pAvo4QvHWH
	QcC2rAQPps5yJRsutFhxF4FR76tRV8r+XI+hJ9E2GxV5kcLzar0IzHpMEGjDTJ7KVglrZev9/7d
	4tSN3W9sWHXHfXOsTcNsZWVcPmgS0C+1pqctIntrBykoiSwYxNkAprXfS8CzIgrvDARAx9emm9d
	IuBfRM98qfgOtQl+RQyjHCGrCrkVdBssG21jCdOTmY8Hv/65/RJoTMaRJkyChkf0VEK8t6M5SHE
	GPNWDXsVRaOP65V3ZWkI4IUg9v2MUqHV/1cpbPqpVXFYm/pbls2naPT6IHm734ureChrtjGbErI
	L0ipEUlR81mksYr67BylHskqdLehna1U8AsSSLLDcopcRpMv4PAW7i2BwTsrw/ys6T6vgyGUfs5
	ubbb0kdgvqNFq0=
X-Received: by 2002:a05:600c:35c7:b0:488:7ebd:78 with SMTP id 5b1f17b1804b1-488ccfd91fbmr50042885e9.14.1775732013752;
        Thu, 09 Apr 2026 03:53:33 -0700 (PDT)
Message-ID: <08bf201f-7bfa-45bf-a35a-7d31963e1179@suse.com>
Date: Thu, 9 Apr 2026 12:53:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/APIC: handle overflow in TMICT calculation
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2fa2fb41-cb62-4a1b-84cf-822b2f97bc2b@suse.com>
 <35802158-a43e-438d-b20a-8c748819a1f6@citrix.com>
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
In-Reply-To: <35802158-a43e-438d-b20a-8c748819a1f6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1775732014-FE94DA3D-866B9868/0/0
X-purgate-type: clean
X-purgate-size: 2236
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,suse.com:dkim,suse.com:email,suse.com:mid,amd.com:email];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4FA193C94E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.04.2026 11:39, Andrew Cooper wrote:
> On 09/04/2026 10:21 am, Jan Beulich wrote:
>> With an expiry value on the order of 20 hours, and with a bus scale value
>> of 256k (as supplied by qemu), the (signed) multiplication will be UB. As
>> we've checked that the value is positive, we mean unsigned multiplication
>> anyway. Yet let's play safe against even larger expiry and bus scale
>> values, leveraging the compiler builtin that there is for this purpose.
>>
>> While there also drop the stray cast from the actual TMICT write.
>>
>> Fixes: 9062553a0dc1 ("added time and accurate timer support")
>> Fixes: b95beb185810 ("x86: Clean up APIC local timer handling")
>> Reported-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

>> --- a/xen/arch/x86/apic.c
>> +++ b/xen/arch/x86/apic.c
>> @@ -1224,10 +1224,16 @@ int reprogram_timer(s_time_t timeout)
>>      }
>>  
>>      if ( timeout && ((expire = timeout - NOW()) > 0) )
>> -        apic_tmict = min_t(uint64_t, (bus_scale * expire) >> BUS_SCALE_SHIFT,
>> -                           UINT32_MAX);
>> +    {
>> +        unsigned long product;
>>  
>> -    apic_write(APIC_TMICT, (unsigned long)apic_tmict);
>> +        apic_tmict = UINT32_MAX;
>> +        if ( !__builtin_umull_overflow(bus_scale, expire, &product) &&
>> +             (product >>= BUS_SCALE_SHIFT) < apic_tmict )
>> +            apic_tmict = product;
>> +    }
>> +
>> +    apic_write(APIC_TMICT, apic_tmict);
>>  
>>      return apic_tmict || !timeout;
>>  }
> 
> This is fine for staging, but be aware it cannot be backported before
> 4.21 due to the toolchain baseline (and nothing in CI will notice, I
> don't think.)

I'm debating with myself whether to replace by an asm() there. (If we expected
further uses of those overflow built-ins, we could consider adding non-built-
in fallbacks in those older branches. Yet unless something like this was needed
in an XSA, it would be solely 4.20 to gain such.)

Luckily in this case I think I would notice myself, as by default I'm building
the older trees with gcc 4.8.5 and 7.4.

Jan

