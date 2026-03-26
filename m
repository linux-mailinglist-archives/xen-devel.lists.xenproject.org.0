Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBGaJdToxGkz5AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 09:05:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3FD330D69
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 09:05:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263431.1555360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5fiX-0001Gl-3w; Thu, 26 Mar 2026 08:05:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263431.1555360; Thu, 26 Mar 2026 08:05:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5fiW-0001EE-Vz; Thu, 26 Mar 2026 08:05:24 +0000
Received: by outflank-mailman (input) for mailman id 1263431;
 Thu, 26 Mar 2026 08:05:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5fiV-0001E5-Pt
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 08:05:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5fiT-00FKMx-Jx
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 09:05:23 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c4e8c0-e002-0a2a0a5209dd-0a2a45018d70-8
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:05:23 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c4e8c2-6400-0a2a45010019-d155802facdc-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:05:23 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-486fb439299so5919385e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 01:05:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722c9f0afsm24052195e9.10.2026.03.26.01.05.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 01:05:22 -0700 (PDT)
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
        d=suse.com; s=google; t=1774512322; x=1775117122; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iAS/gZj5m/dVC0lNPyi3bdkO2korYQCsDdW/odNuq8s=;
        b=Hrndc9JoIDgCWrT/NpR9MuqtNjak3uHlp3/DLObPRyUPvnKWxATalEPVg3z7fBcCrY
         iXh8DB9GzFQR2gpTkMyRCRF+IA3OA3L3+7rAddJvE+0bOTPsK4tz7mRv/RW7MdU4kxJd
         K9tBAiUBXONidWRsUDIAPvhjcxdPfUxfq+HjCHhfNUNXtXKEl2Edkp2k4JYCHQAhqYVj
         nECmwFX7O0pxNpyZeBo3+abab2UBj89PRAKQ8dOKUcpkuQGZA1nob8n8DP9d8D31gTz1
         lN4neYaB/q4c4CG9RNpxj63EI7HJQANJ68MCok9PpWLehY8F83pxIW08AAFhMtf9w5HY
         q/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774512322; x=1775117122;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAS/gZj5m/dVC0lNPyi3bdkO2korYQCsDdW/odNuq8s=;
        b=NYCa3pwVCMj0jtDoH3FdqZxduwZTQZSP110vy1zmJV/0jdmCsS3bMawCN3LONlOhxo
         lPKOKb7eeCnrZNCYQcUL9ig1wu0gUe0hKkEBUWiTRR7tjoKr/zjTwIWvRy1P9Yeqxo2C
         ERMJucRNuVwy/VU15LPynWTpuS8ZpVqWT4IPHIfk9YDcw3SXFw6Gs1cTpyQU6FPlT/Fs
         Pg6WPTwvsmCBG1nMUgkagDycy0/1M/RaAUd17MQUarm6mGCDhyb9w/BLIechkg6NiwKQ
         Tsut8UJswUiyQ/gEO7ox1yP5aMH9yLOqEXGMqRx5L2XAO9zL6dg6WqDS0Fp30n+uEu5x
         eQbA==
X-Gm-Message-State: AOJu0YwvfDtwoz7pArqtuYffRkGrQjYghUQmRS/j4WOPYmMFGNENgI+b
	Cxxr+K5SoRdDDLiq5FGVM5UCTJxJtQaOoulTQnjL+dqxJJulBUpc7xoQj9lU1bZtPZBfm7khe+r
	2jAJ+Sw==
X-Gm-Gg: ATEYQzz4ddC0Of4GgogbsEJ3dL+shuxtULqMQwWZyrZKulVrZl69ztHO3gNnE3bTX6E
	LNYu+n+m5OHYPGu/mbYs0c22if1UyrdHi7eK/0PVEbjNDpOtyrcM8FRHHijJzOumzCJ8HPe5kyx
	D5lk5CCU26DmtJmBMexaduBs08SyxL9VOeogf0lgtfQpsTvLGdQtWKwmGZ6/qSHlnZnkR8+Fl0p
	RhRzfi7+p6qrBOeQNi6355a5kz3wesLDeXzD4ofCIU5CURDO4eJki3Ydy7pkwbj5YNcO3c4k3lr
	c5layBPxqSfmkYXriT4rKZdi2AFbpkM8wU0tHxqFGALMoKBwf1jyWtgl//BxvnkIH6R/Uf++L58
	k8EvN02MxvCLt8Rf7PuQo5xt97KQIUJ07HyM3w5h9ykLJucY0Cq8oyRfPe6gIGYtbhemencGHWM
	+aghKiLEARONxK36pVupa4LfEIZZAV3vYyu4/WK8vKOCKjWeAQa92a+8g79BXJqKW1txS6f5R9m
	lcRFxpLdHGZuGI=
X-Received: by 2002:a05:600c:5296:b0:486:ffa3:593 with SMTP id 5b1f17b1804b1-4871606730amr91463315e9.28.1774512322491;
        Thu, 26 Mar 2026 01:05:22 -0700 (PDT)
Message-ID: <ee37a19a-5978-4724-abd8-6855b425724a@suse.com>
Date: Thu, 26 Mar 2026 09:05:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/time: adjust handling of negative delta in
 stime2tsc()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <f97bbfb5-389c-4845-84fb-e6f07ba0ade8@suse.com>
 <acQh__WRAoav6IHN@macbook.local>
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
In-Reply-To: <acQh__WRAoav6IHN@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1774512323-48A14DF3-56307CAE/0/0
X-purgate-type: clean
X-purgate-size: 1168
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[192.237.175.120:query timed out];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1B3FD330D69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25.03.2026 18:57, Roger Pau Monné wrote:
> On Tue, Feb 10, 2026 at 11:04:59AM +0100, Jan Beulich wrote:
>> --- a/xen/arch/x86/time.c
>> +++ b/xen/arch/x86/time.c
>> @@ -1176,20 +1176,26 @@ uint64_t __init calibrate_apic_timer(voi
>>      return elapsed * CALIBRATE_FRAC;
>>  }
>>  
>> -u64 stime2tsc(s_time_t stime)
>> +uint64_t stime2tsc(s_time_t stime)
>>  {
>> -    struct cpu_time *t;
>> -    struct time_scale sys_to_tsc;
>> -    s_time_t stime_delta;
>> +    const struct cpu_time *t = &this_cpu(cpu_time);
>> +    s_time_t stime_delta = stime - t->stamp.local_stime;
>> +    int64_t delta = 0;
> 
> Why do you make delta a signed integer, the value returned by
> scale_delta() is unsigned.

I guess purely mechanically, as deltas usually want to be signed. Changed.

>> -    t = &this_cpu(cpu_time);
>> -    sys_to_tsc = scale_reciprocal(t->tsc_scale);
>> +    /*
>> +     * While for reprogram_timer() the capping at 0 isn't relevant (the returned
> 
> The capping might want mentioning in the function prototype, as maybe
> new users expect stime2tsc() to return TSC values from times in the
> past.

Can do, sure.

Jan

