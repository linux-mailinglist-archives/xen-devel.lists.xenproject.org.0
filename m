Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPa2MGHICmod8QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 10:05:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3774D5685FF
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 10:05:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311658.1581761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOsyt-0000ZC-Po; Mon, 18 May 2026 08:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311658.1581761; Mon, 18 May 2026 08:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOsyt-0000XS-Mg; Mon, 18 May 2026 08:05:43 +0000
Received: by outflank-mailman (input) for mailman id 1311658;
 Mon, 18 May 2026 08:05:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wOsys-0000XI-5B
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 08:05:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOsyr-004sNf-HO
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 10:05:41 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ac852-2eae-0a2a0a5409dd-0a2a450499ae-16
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 10:05:41 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ac855-1dec-0a2a45040019-d155802ee9f0-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 10:05:41 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4891d7164ddso10249095e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 01:05:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febc56f89sm96702065e9.3.2026.05.18.01.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 01:05:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1779091541; x=1779696341; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TzwPEvFpM8drB6aUU3B67KRTBYy2TQaMptcymy+e2WM=;
        b=WBlwxCgIgEL1/XwLz+Yd7bMKcmsat/BRoHVeKfocUpyz5fu9xXrWVdQQqS8fqUBZL8
         z7yZHbQJV5jwMQvrUoPcd7xEvmCETadZujpdwTwJzeK0Ani8bsHCKnXUfyF7fY8nzIWU
         QKaGg6UeORybfDvfF0/3PaykJDYZxIq1F4eNXAmubSD5VyXtTlOzzLCzAgXPo7Jkjp5O
         DRtRkZyoGoFmqBqJb0HBgHW+8KFBMoZLox0LFXynuI2MBSb03mgNbpy/qi2EMb9zL2OF
         +CgMkwjwQpoJSDQxMMZeG/7J+5h0HT+lpw+7NIdYujRpo5VZuYivWWAr3Jo/dp202Xza
         KJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779091541; x=1779696341;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzwPEvFpM8drB6aUU3B67KRTBYy2TQaMptcymy+e2WM=;
        b=A4RQ8EyS9kbU0TqD7ms66ANUmGWvK+8m/mnVbwFgohSy8nOV+FdABzRq9eK4LDvUJc
         NKTGtjOkyTjywqDhBNg+dnIZth7MUONJM6loDldnU8WDK/s/CBQeypaohjYp5K6lEKI/
         mvFMTO3PJixM2kykmFtLWUKXwLVurBZIuOZHtnFWg41/pArjGO9O6B1Wi364JlOkz7uY
         EhRXPTZazbhlgGFq5sVYzo6zNwAet8e+5mYDweWweAf25imTnOP5ZiD4daMET7qZEPMf
         cisJN9WHOI8+Cgihdt2cT0KWwMIWmbLeH7Eik9dyqHsq26WFGcR00gDsC89TmogmepMz
         AsAA==
X-Gm-Message-State: AOJu0YwviiX2llSjoKU1Dw9L5jCv2eV6ZFPJr3czsL0y8ot6j+nbX31i
	7v6ZoHaIwmg7yQpD1QuUZ+TeU1HkV0q4FN8bt2T5zYGLNNovAs6bnZMUQgfkpYf1TQ==
X-Gm-Gg: Acq92OGJlLl2za5Bevg9BzW9jvFuqQx4l+K3a3qBk8ej7vw7I94UnG1oY/sw85kjcE3
	/RDLVOfYB8L3DNU8nrRLs1zoeP6tPcRcmrKpsFfq2HTNC9DkW1z7Iu8innKOMtHcRK7pYtC7vb3
	NffnYSnyyecTTlDIae9IKDPYMDhFalSn8c/1eJnen6UX1p0gjXlhzpfaCJS4nUGrkFSXrf5HRZi
	kI2Lpj+tZKSHH2JIUcZcWibcrn1Ss2wNBAh+OSUITbxPl0EHNiNQOAn5WNCqQj3DT17KgrxUJBu
	1mtt1mgtO+sf/vLQbOTLKETFqRvtSfMFwxDUVuqGyjn1rm6OYsZ0hWn9Mi6cqbXYonH2AMBS5iC
	uX4MZWYF5V0blxgxQP7Kh11VXvF6l2TzQO0r+vcKUMhRETsBRNQHwcQeVlu41xUlohTcl5h8U79
	KAOwpWgQuGnh6RiWf1iuRggQ65tiwpg6t9vsvLG5uQYDVDkcOZseT+qkDl6Pqt8kTYw12uJVkey
	LcjcD/1a7KxplE=
X-Received: by 2002:a05:600c:4455:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-48fe60ea92dmr193574465e9.8.1779091540744;
        Mon, 18 May 2026 01:05:40 -0700 (PDT)
Message-ID: <547161b2-2fea-4576-a635-62838ffa2d33@suse.com>
Date: Mon, 18 May 2026 10:05:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RFC] x86/time: avoid early uses of NOW() to return zero
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <68b1607a-f2a1-4f53-84c5-43c61eeb1869@suse.com>
 <agXwsshLlV50dcnV@macbook.local>
 <8fbab1f4-3078-4ac3-b147-84d1b5f5abd1@suse.com>
 <agcb1WAGLWDRYZ06@macbook.local>
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
In-Reply-To: <agcb1WAGLWDRYZ06@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1779091541-433673FF-707F29AB/0/0
X-purgate-type: clean
X-purgate-size: 2424
X-Rspamd-Queue-Id: 3774D5685FF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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

On 15.05.2026 15:12, Roger Pau Monné wrote:
> On Fri, May 15, 2026 at 09:15:40AM +0200, Jan Beulich wrote:
>> On 14.05.2026 17:56, Roger Pau Monné wrote:
>>> On Wed, May 13, 2026 at 08:44:46AM +0200, Jan Beulich wrote:
>>>> @@ -2623,6 +2640,21 @@ int __init init_xen_time(void)
>>>>      return 0;
>>>>  }
>>>>  
>>>> +/* BSP-only function to pre-set an approximate TSC scale. */
>>>> +void __init preset_tsc_scale(unsigned long freq)
>>>> +{
>>>> +    struct cpu_time *t = &this_cpu(cpu_time);
>>>> +
>>>> +    /*
>>>> +     * The incoming frequency is only approximate (nominal).  Increase it by
>>>> +     * 1% to make NOW() output rather a little too slow than too fast, thus
>>>> +     * avoiding a possible backwards jump once the final scale is set.
>>>> +     */
>>>> +    freq += DIV_ROUND_UP(freq, 100);
>>>
>>> To avoid such possible jump backwards, won't it safer to also update
>>> the ->local_stime and ->local_tsc fields at the time the new scale is
>>> set?  Updatign those ahead of setting the new scale should avoid any
>>> backward jumps.
>>
>> ->stamp.local_tsc does get updated; you merely dropped that line from reply
>> context. As to local_stime - how could we possibly set that, when we didn't
>> get through init_platform_timer() yet? Leaving it at 0 is the correct
>> match for setting local_tsc to boot_tsc_stamp.
> 
> Please bear with me, maybe I'm not understanding exactly to what the
> code comment refers to as "possible backwards jump once the final
> scale is set".  I assume you refer to the setting of scale
> early_time_init()?  The ->stamp.local_tsc value also gets updated at
> that point, so it's not possible for the timer going backwards?

It is updated there, but only to boot_tsc_stamp. I.e. no change at all
if preset_tsc_scale() set the field already.

> This changed with the addition of the init_percpu_time() call in
> early_time_init(), and makes the setting of "t->stamp.local_tsc =
> boot_tsc_stamp" pointless, as it will get overwritten by the logic in
> init_percpu_time() a couple of lines after?

When making these changes, I first thought so too. But no, that write
isn't pointless: In case preset_tsc_scale() wasn't called, leaving the
field at 0 would break the use of get_s_time_fixed() out of
init_percpu_time(). (Iirc I only noticed this because of having put
debug printk()s there for other purposes.)

Jan

