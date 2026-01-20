Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGDjI0W0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 496A9482D3
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208927.1521058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viBnM-0006sD-Au; Tue, 20 Jan 2026 13:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208927.1521058; Tue, 20 Jan 2026 13:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viBnM-0006po-6Q; Tue, 20 Jan 2026 13:29:20 +0000
Received: by outflank-mailman (input) for mailman id 1208927;
 Tue, 20 Jan 2026 13:29:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EVnc=7Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1viBnK-0006pi-M8
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 13:29:18 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 045a74aa-f604-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 14:29:16 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47d6a1f08bbso19136125e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jan 2026 05:29:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f4289b7aasm309353185e9.2.2026.01.20.05.29.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 05:29:15 -0800 (PST)
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
X-Inumbo-ID: 045a74aa-f604-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768915756; x=1769520556; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T0/E/8/PFiDDA3wDagPkrKF0rtZHrQpHDuwXfKVvmKE=;
        b=XVTD0cSrMfZQc02xbBTaROejPv5zaildzGkbh6g51sCeLNwhMV0S8r5yanpMtHQdKC
         hRFax9oAnPKZ2gtQDyKUr/HNvYCVQh6b76KezeDM14SvxJ4FNTSvJr2zKBFfQXnH1aDT
         HcqsX8ETtgHXPphpQXP6fiHimYvbbbZnXgjYLKlkz6vqi6UYaXL2YArKXrLyDB6FHrkS
         d+vqfiW/0TFnk7gqh/fFzxSugSx/rBnyitaXzkZ40N0IZCDVqV0i/RXP8+01SMHc9oCz
         Y+h9Og8P3BOKEvQFF8SK/T/gPCuYF6k4/BJEh5obHJlkVQh/Ruf82dXyf0xFIbYLmgBb
         G9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768915756; x=1769520556;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0/E/8/PFiDDA3wDagPkrKF0rtZHrQpHDuwXfKVvmKE=;
        b=AiT3DZFZaI1GRE/1AGRaRBN6M0/aW7ziPsDSlbsfo0A+nAiWHN7O4LL7yOW4ecyhh1
         lsAEFwsG7/XdYPM5k6HYcNtV+njc+coC+SY9EI1BYRAQGLmcFYGRQUAtD7BA0Pkw6UXv
         pgcQeUMhCabvw5N5w/bM5ORHmqmXy/lX+u7IAoTv7V8j9wLBZzMhGKRz6ghSobLgoo/d
         tMOlIHAevTgo6DU12dpN7+rq9aQmw5BsWMWh195R3klPa8UbccWQfjqYB8chDkVWKoiI
         +E/bzNX3lAeOdOpK6q+nXosWud5h+lmSpOfxs9bf8Kxzmv7MU/FpMQgAFDCYuNzun5AO
         sHig==
X-Forwarded-Encrypted: i=1; AJvYcCV8JZxbPFIAn1mOOVk6I9+G6zH/nBBlCo0Q+nudJ6WqH9u1m6U6/rjE+/K124cJASNpeXQGbXrHZZE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2Ku0+ZiXqvQ6iYvMNdFqIW5qxUMr0Pn1oDkWy5QDyWEUX6cwb
	wXlemO6C4fXhBA7Fbqzl2xGfjHUqSnkvjCTwO8QjIhJchCN8g0cDkpS9cCHBfj4Esg==
X-Gm-Gg: AY/fxX6sObP5ZFprF6cYEg4QCuzSgBdfnecHCEi7y9lp9uZ+KpYmjH7yhsZO3inipqH
	BORrFBwmKJEUmNa57jgQXNoA+YjcKtneKKK6wOaz17/p1Jd+3CqVn2T4/jhRsg4mSKLaoZmTnJP
	MAVlSl3AejI9va8sCAbB05wrB/ZxuGV0C0zgTMJSPVj5djRWCeatHSdbJSR9Ik1Y/+sNtUf/eXV
	2/Z9eUw6DhnxRVlWtGRUfPkZXM7EpLhEBWAgrFxaOG9knYdpW6lEDC6R+rFmYLTsUzNI8zJYHWv
	WxOqCM3cYCcdurW4EoZHsbp/WXpfGGtJulD8/SHndfwwHqYpzlrxltPuTirzdcUdb4KkWUe749W
	PX7riGZ013C843jbSBQnxVgn+erN+cVXvfyuVumrZsIwpnpks82RA0GyUAJwYfUmwFUCvMW6F0T
	pxkhKA+dhrnY26x8V7qUrKL+S7MDsz5u5HGDT/PW2Ruc18w8L9BdY8fw4HMYr72BOYXcB3ZrNoA
	J0=
X-Received: by 2002:a05:600c:35c3:b0:47a:81b7:9a20 with SMTP id 5b1f17b1804b1-4801eac0617mr193173915e9.9.1768915755735;
        Tue, 20 Jan 2026 05:29:15 -0800 (PST)
Message-ID: <fb53b679-701f-4028-a75c-c4d153b80619@suse.com>
Date: Tue, 20 Jan 2026 14:29:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/svm: Intercept Bus Locks for HVM guests
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260120095353.2778-1-alejandro.garciavallejo@amd.com>
 <20260120095353.2778-3-alejandro.garciavallejo@amd.com>
 <5c554703-f7e6-4625-be07-4fc607b2c4b5@vates.tech>
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
In-Reply-To: <5c554703-f7e6-4625-be07-4fc607b2c4b5@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:sstabellini@kernel.org,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 496A9482D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.01.2026 14:11, Teddy Astie wrote:
> Le 20/01/2026 à 10:56, Alejandro Vallejo a écrit :
>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>> @@ -66,6 +66,12 @@ static int construct_vmcb(struct vcpu *v)
>>           GENERAL2_INTERCEPT_XSETBV      | GENERAL2_INTERCEPT_ICEBP       |
>>           GENERAL2_INTERCEPT_RDPRU;
>>   
>> +    if ( cpu_has_bus_lock_thresh )
>> +    {
>> +        vmcb->_general3_intercepts = GENERAL3_INTERCEPT_BUS_LOCK_THRESH;
>> +        vmcb->bus_lock_thresh = 1; /* trigger immediately */
>> +    }
>> +
>>       /* Intercept all debug-register writes. */
>>       vmcb->_dr_intercepts = ~0u;
>>   
> 
> According to APM,
> 
> INTERCEPT_BUS_LOCK_THRESH does
>  > Intercept bus lock operations when Bus Lock Threshold Counter is 0
> 
> I assume that when set to 0, we intercept all bus locks, so if set to 1, 
> every 2 bus lock (since we first go from 1 to 0, then at 0 we intercept 
> the next one) ?
> 
> I think we want that to be tunable, as intercepting all bus locks may be 
> too extreme we probably want to intercept every few ones instead.

Otoh bus locks (as opposed to cache locks) would better be rare, or else
perhaps such a guest deserves some extra slowing down?

Jan

