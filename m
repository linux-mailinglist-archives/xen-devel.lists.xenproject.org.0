Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLLMLgkc+2nSWgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 12:46:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD3F4D9748
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 12:46:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301578.1575843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKZle-0007tx-Jc; Wed, 06 May 2026 10:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301578.1575843; Wed, 06 May 2026 10:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKZle-0007rY-Gy; Wed, 06 May 2026 10:46:14 +0000
Received: by outflank-mailman (input) for mailman id 1301578;
 Wed, 06 May 2026 10:46:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKZld-0007rS-1w
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 10:46:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKZlc-00FgK1-EW
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 12:46:12 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb1bf4-e002-0a2a0a5209dd-0a2a4507dd1c-0
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 12:46:12 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb1bf4-229c-0a2a45070019-d1558032bd46-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 12:46:12 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-488b0046078so54920595e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 03:46:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e53152acasm14670555e9.31.2026.05.06.03.46.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 03:46:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1778064372; x=1778669172; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mY/0Pabet0+jg1Czo0iZFQAzV9HXQBYAb9mr5pLUoog=;
        b=RUkEwEuH5auRiAURzGFqIMv1paPLUuqm3NHR1cFNjTCVQeZQZdsSmYUmbJmNaRMz02
         4IjlWOUTlevbOeciPHqU7cCK9oShVqSAvCRaoVRzERC7h+7uSlVGxWFCbFpsCbZGp4jV
         ltrsmAYKTPS3owEYkN1IlNogCFDF2jG+kAs3+vrlVSn9ObQGLeuJPmZ8hlPj07U6nNMS
         QtDZqkB0oWT82zbPEx9WECufwuAqPMxV73hKyInvOZH2cO5SgYuOrTw2hXsCx7yBoea1
         evEH+S2UxkXffOzo7TzSlHxgK41+kjUKdCvZaSQR7U/xhWfkZOMLogFeXX6hMSEd+Lm7
         aVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778064372; x=1778669172;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mY/0Pabet0+jg1Czo0iZFQAzV9HXQBYAb9mr5pLUoog=;
        b=iZCrWv6jd2SL2n35FUfJsfdX9UvX+Zw3HrdCSJWjItcOf5YaynEwZAPblYWneElhYv
         tHqnC5aL9Y3a4PJpk2Uq19HV3gCUJW8Bqpg2j9tiOQWCBWoJBMOKMdF2QotUiZRNEgzj
         o+1Om8Sh+Os2ofPW4XkgpLvYGMuDtQBcGW+N4x08BlAYySgzWvcyQ5cP6Lj5fUd5QP9K
         SE+gahHS5B8qDJU20F130fJkcGkwT/j+6r3+whxd56LNJ06V6/Rit75/xnnb2ohpmSy5
         wBcDv0DwNXGm68MIGd08XwDhPnEN04zOm80WlFB+klLTsdY+XGu50vR473hCo2/z9iFK
         dONA==
X-Gm-Message-State: AOJu0Yw1pFqoINzauJngkr4pirXBGojVcTT5O9eUmUSrlU25Awjc29XM
	tmEB/69s0LJCV/ysPaX/5zFO/VnH14YbhUcj6974rp0rarPRwV+r3z5YR620foZMWw==
X-Gm-Gg: AeBDiesE8/JrIWapylejdDtUWJKdptVSIXCWKsqguG9wFszZsyr4Gj/l8DVs1fSil+h
	+fVdZL8H1IDJac51ynBGhNBSFHh4pqnU4HUQhPkAlNlC8oD0Whjopx465IfNZc6xOvkwHgJoN5F
	wDvZ/7jtaH4+UlW3izKoIFVAXltsQt/GLRCFflFAsulYf9nIKNetlxQcd44Q79hv/WcEIA6aaSf
	RaSYJQgWrUrOfg9OVvYJZKqmpWQyf9xdeINfF1KmQ598rP0ghyTCEZ2IISuglwq/W3H5XFAi9EH
	2qBEXQuFMgl/g+phS36VbThQQPkegHwntY8DOeh+f9+GRVIYuKRGy1heLBI4DD7gMiRsRhdKalG
	lW9fr6FQ9J8xtqCOax7KQl4csp/5eKXMRnLXP8VOzxQVl+98uczQollaV26OXxdJDkTFTQurBz+
	awfVc4GsT0jcLntgJHayf02FEQGuHM7+YpEPM8QGe4ccLOX43Wui47Zt5UXml9rpv2nHcIoavw0
	+Fy8HoZOKrMocy9k8Y18lWBSA==
X-Received: by 2002:a05:600c:354b:b0:48a:554d:b9a2 with SMTP id 5b1f17b1804b1-48e51e0c7c9mr48692515e9.6.1778064371612;
        Wed, 06 May 2026 03:46:11 -0700 (PDT)
Message-ID: <ccbd251d-357c-4c5c-8c4e-f9f64c3e266f@suse.com>
Date: Wed, 6 May 2026 12:46:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] x86/time: set AP's TSC scale estimate earlier
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <1e23dd78-b246-4fc7-9e18-de8b0cd57721@suse.com>
 <afsY7KqNIyrhW0s4@macbook.local>
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
In-Reply-To: <afsY7KqNIyrhW0s4@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1778064372-23F7EC48-12E38768/0/0
X-purgate-type: clean
X-purgate-size: 2332
X-Rspamd-Queue-Id: 2DD3F4D9748
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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

On 06.05.2026 12:33, Roger Pau Monné wrote:
> On Wed, May 06, 2026 at 11:39:14AM +0200, Jan Beulich wrote:
>> NOW() (in particular) can be used ahead of init_percpu_time(). As the
>> initial scale value set is merely the BSP's, we can as well set it before
>> actually launching the AP. Don't introduce yet another notifier function
>> though; do this from smpboot.c's.
>>
>> Setting the scale alone, however, doesn't work, so the entire struct
>> cpu_time is copied.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> RFC: Copying the entire struct won't work very well when tsc_adjust[] is
>>      in use (and values there differ between sockets).
>>
>> This in particular eliminates an anomaly with log messages issued early
>> while APs are coming up, when "boot" console timestamps are in use.
> 
> Could we consider moving init_percpu_time() earlier in
> start_secondary()?  I think it's main dependency is on
> set_cpu_sibling_map(), which we could also move earlier?
> 
> Looking further, seems like it depends on smp_callin() having parsed
> the CPUID features, plus the socket_cpumask[] also being set.

Right, and CPUID retrieving in turn wants to be after ucode loading. Ucode
loading, however, is the primary source of AP boot log messages that I'm
aware of.

>> --- a/xen/arch/x86/time.c
>> +++ b/xen/arch/x86/time.c
>> @@ -2346,6 +2346,12 @@ void time_latch_stamps(void)
>>      ap_bringup_ref.local_stime = get_s_time_fixed(ap_bringup_ref.local_tsc);
>>  }
>>  
>> +void preinit_percpu_time(unsigned int cpu)
>> +{
>> +    /* Initial estimate for TSC rate etc. */
>> +    per_cpu(cpu_time, cpu) = this_cpu(cpu_time);
>> +}
>> +
>>  void init_percpu_time(void)
>>  {
>>      struct cpu_time *t = &this_cpu(cpu_time);
>> @@ -2353,9 +2359,6 @@ void init_percpu_time(void)
>>      u64 tsc;
>>      s_time_t now;
>>  
>> -    /* Initial estimate for TSC rate. */
>> -    t->tsc_scale = per_cpu(cpu_time, 0).tsc_scale;
> 
> Wouldn't it be simpler to pull this out of init_percpu_time() and do
> it at the start of start_secondary()?

As long as it's only copying memory, that may work fine. Plus, yes, it
would allow accessing actual registers of the CPU being brought up, if
need be. I'm slightly wary, but I guess I'll follow this suggestion.

Jan

