Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iArZNTzIBmrynwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 09:16:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5150F54A6A1
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 09:16:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309662.1580711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNmls-0006j1-J3; Fri, 15 May 2026 07:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309662.1580711; Fri, 15 May 2026 07:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNmls-0006g7-G6; Fri, 15 May 2026 07:15:44 +0000
Received: by outflank-mailman (input) for mailman id 1309662;
 Fri, 15 May 2026 07:15:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNmlq-0006g1-IZ
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 07:15:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNmlp-005RNb-Ux
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 09:15:41 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a06c7fd-5cb7-0a2a0a5109dd-0a2a4502a79c-28
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 09:15:41 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a06c81d-af86-0a2a45020019-d1558032d4af-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 09:15:41 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-48e6db3ff7eso37932165e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 00:15:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48feab290e1sm14113145e9.2.2026.05.15.00.15.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 00:15:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1778829341; x=1779434141; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VOs+Kg0UNc09Wh2/h4eiQrPl4SGLhZXxpuowRQyrkiU=;
        b=HYqtw0iq5JMYyHuV12/SQcGyLjepnIk3y6j6CUEhRd8Xr2Z39P4v97pqs20v8W1AFx
         vepUICMRLkbyamet+8UJW/GhsksEX44dNyKrvqGDFUFLw2wwgoU7+9XbcheOHsrfi63i
         hjcRlPac5QWRh7+jpikafa6NQGOg8eL1PYmqvLPyHizub9AstlFk70nYNtDnGlxFp6jh
         c8e0Gpl2OUpZ+hiw/k77TeIjDnI2Ietvya9Mefuu/MzC4/4Qeg0Kmmrh1tqIWh5IIh6+
         F/d03CkBXnoQhxbvgZn/Q3t62WQcZusntYp9qzOd2RO4Dd9Zbi6YVDeQH+akkKtQcEVJ
         Z4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778829341; x=1779434141;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOs+Kg0UNc09Wh2/h4eiQrPl4SGLhZXxpuowRQyrkiU=;
        b=abqxiJPeYBkdzi4fTRUTnjSp6IDaQP0PqWjR53fbhUlJTRBMnPptbDyxBZ2DkGo06R
         pgI2Vd4BTLT6MmxhGAwq6ct6mxtbmdF7nnYlGtUY9siyIBMpy7zzLr2li0BNpvmQjmP3
         Vu3tQcfWCMDPR+lKU/KyEpoH7wCzLLnTpnfhGfS2Jx1tCZoReipwpm5MbB5LsvAREobr
         I7QmULo7NOT9iwEveXdfHII34ntzdcEGB3pSXQ9/Z16a325s2VAgCOio6gGv9JzfACIt
         c9Le1z7r6sMDOy/5N4IBbcq0Mgrm8F2AmCMF48kWqwhcm6N7+jbnM1YqprBlX6d1uYMA
         c3IQ==
X-Gm-Message-State: AOJu0YxrGnETnu10bOKO1OgbkuvmrPxKsdel7yPTSsh0fv01LbaszX1v
	E3ZHu1nv1llWsaORPPxZ3K1rbXKXSK0stNogvHC+SNzwLuMgwMlHrKj3t67nOb5Uhw==
X-Gm-Gg: Acq92OHenjPeIufk+WzNXKQ1KYDJFifE4ll9TpNMzJJS1ZnUuALfQWJ6hprWfeUFnh/
	HRpP1+x8ZfcAaYu8T1e1CPO954NSj/yEIsNCUs8S9se7glmOU0rJgB846vLcyuG147UsALoswOr
	zQaaj7wBw+JHs55mRXno5FnLxqEpsh5IVuKVtAd0NB26vxq9GeGO241dF3Bw5lT8SPM/fN5scIL
	Euch3wL0KGXAwW8hLGSej/Mhrs/vDSUU7m+gwxTVqyIlMj2PqrWB7VOSyg8ylgqTOa0B9wiTFG8
	vuzOtRVvfzf4N/SGY6yHo1UNgMfRDicmRhECFWO/Gnl/cfb1v6IZXeBLkH1Afq+ag8CCPsGcrV1
	PVkEvJtGg7r3YFVDaC4hhAj9Oto98SB/qOSQl3rEbpPWpH2LW8o4opiecM/fVnBvx6ipsVrZJh/
	uQumLFhoH0T0dGpM7MtYGNm0vz66B1w5vnGtqcLgv0m0CuvPxshUf9LEJk1sqLMKmzUFEaW7iKt
	1yuqmpJQb2O0p4=
X-Received: by 2002:a05:600c:49a2:b0:48f:e6de:1cbb with SMTP id 5b1f17b1804b1-48fe6de1de1mr19425805e9.28.1778829341252;
        Fri, 15 May 2026 00:15:41 -0700 (PDT)
Message-ID: <8fbab1f4-3078-4ac3-b147-84d1b5f5abd1@suse.com>
Date: Fri, 15 May 2026 09:15:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RFC] x86/time: avoid early uses of NOW() to return zero
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <68b1607a-f2a1-4f53-84c5-43c61eeb1869@suse.com>
 <agXwsshLlV50dcnV@macbook.local>
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
In-Reply-To: <agXwsshLlV50dcnV@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1778829341-81F76161-44E4E2E4/0/0
X-purgate-type: clean
X-purgate-size: 3446
X-Rspamd-Queue-Id: 5150F54A6A1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 14.05.2026 17:56, Roger Pau Monné wrote:
> On Wed, May 13, 2026 at 08:44:46AM +0200, Jan Beulich wrote:
>> Waiting loops like the one in flush_command_buffer() will degenerate to
>> infinite ones when used early enough for NOW() to still return constant
>> zero. Make sure the returned value at least monotonically increases. When
>> available, use nominal frequency values as initial approximation.
>>
>> Do this only in get_s_time(), as producing a sane value in
>> get_s_time_fixed() for non-zero inputs won't be reasonably possible.
>> Put an assertion there.
>>
>> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> RFC: This breaks at least the TSM_BOOT case printk_start_of_line(), which
>>      checks for NOW() returning 0 (falling back to TSM_RAW in this case).
>>      For now I have no idea how to avoid this; perhaps that's tolerable at
>>      least in the case where we put in place an early estimate? Should we
>>      maybe weaken the fallback condition to take effect for any value
>>      below 1μs?
> 
> Maybe it's fine to print cycles unconditionally until we reach
> SYS_STATE_smp_boot when we know the per-cpu scale is correctly set?

I remain of the opinion (as said in reply to your similar v1 comment) that
this isn't very desirable. Tying to SYS_STATE_smp_boot also would feel
pretty arbitrary. Other ports may have NOW() properly working much earlier.
If anything we may want to add a global indicator of NOW() properly working.

>> RFC: While generally the mentioned waiting loops will take longer to time
>>      out, on a very fast CPU tight loops may time out too early.
>>
>> RFC: For the AMD/Hygon case, if the "nominal" value isn't available, we
>>      could use the "high" one. That would cause NOW() to run too slowly
>>      (until the scale is properly set), but maybe that's still better than
>>      it returning 0? (As it stands, I can't really test the new code
>>      there, as my Rome system only supplies the lo/hi pair of values.)
> 
> Using the "high" frequency would seem fine to me.

Okay, will do then for v3.

Related aspect: With these family/model specific additions for AMD, we could
also separate out intel_log_freq()'s model specific part, to leverage from
here as well.

>> @@ -2623,6 +2640,21 @@ int __init init_xen_time(void)
>>      return 0;
>>  }
>>  
>> +/* BSP-only function to pre-set an approximate TSC scale. */
>> +void __init preset_tsc_scale(unsigned long freq)
>> +{
>> +    struct cpu_time *t = &this_cpu(cpu_time);
>> +
>> +    /*
>> +     * The incoming frequency is only approximate (nominal).  Increase it by
>> +     * 1% to make NOW() output rather a little too slow than too fast, thus
>> +     * avoiding a possible backwards jump once the final scale is set.
>> +     */
>> +    freq += DIV_ROUND_UP(freq, 100);
> 
> To avoid such possible jump backwards, won't it safer to also update
> the ->local_stime and ->local_tsc fields at the time the new scale is
> set?  Updatign those ahead of setting the new scale should avoid any
> backward jumps.

->stamp.local_tsc does get updated; you merely dropped that line from reply
context. As to local_stime - how could we possibly set that, when we didn't
get through init_platform_timer() yet? Leaving it at 0 is the correct
match for setting local_tsc to boot_tsc_stamp.

Jan

