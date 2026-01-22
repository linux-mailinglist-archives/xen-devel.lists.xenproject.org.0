Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DWnH8b8cWmvZwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 11:32:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E68D0654BD
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 11:32:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210741.1522361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viryo-0005U6-TC; Thu, 22 Jan 2026 10:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210741.1522361; Thu, 22 Jan 2026 10:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viryo-0005Rr-Q8; Thu, 22 Jan 2026 10:31:58 +0000
Received: by outflank-mailman (input) for mailman id 1210741;
 Thu, 22 Jan 2026 10:31:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1viryn-0005Rl-S5
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 10:31:57 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92752df8-f77d-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 11:31:55 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47d59da3d81so12720875e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 02:31:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48046fb7eaasm59070595e9.0.2026.01.22.02.31.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 02:31:54 -0800 (PST)
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
X-Inumbo-ID: 92752df8-f77d-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769077914; x=1769682714; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dtaKnWYlt8TU2qsWm/+dzT/V8/xGYzGeC9aAYJAeiwY=;
        b=e6EzjLlfFHnW7ow2CgtI8XVsgJcrXyuA3Tg/vWqMuGmx//06qqMHdKg6ePzLS/003T
         KJdR1xHxDhnnxSz/kKKIJ2iU3MnIqHtIbjAXZJu7afT0+7UuhOGSD6cVFXqJoP79rT4/
         I6xJb4qj81rQG+rLnllwbl2Lr/vDn5C65A3lYqJQmeDoze0xgNfsuGDNBgbsZlz0Bppp
         DQkBQ4BVY0w93S2rDBS8u3iMBWnZ+i4eS23Us22zaMYpHZcdZubO/5+tKJioHc8I/xr/
         8Phhta6LQ6gC+zOqM4Uxjxg/OREH0doA9qC2+Ey1aST0pOOZ5Sga8UeMbODWEWOLDcqc
         ZZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769077914; x=1769682714;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtaKnWYlt8TU2qsWm/+dzT/V8/xGYzGeC9aAYJAeiwY=;
        b=AOKjCPi5vsir5dECvThFBJOqDKm45PCW3zmhC3johmUYwis1rQ7453GPOJZlUuwbUu
         EOMWd4EmojhzYzmjffhqT5K+zZdi+gYbxLfRIzJqsflTzIbxRyvUdd2re6d5CJC1FvkI
         krSpHuSdkbC0EQVEafS4wNQMlox6dHh8MGkwaZm+diu/agjRkq0JFfxnyfVJ+mESIFFZ
         JZiGIfikiM00iG84kPVBSqPd1yAi7AMCcXNSaEMkegncjSpVI+VOAhWytPIfLQ0qVyUt
         4RLx1/AygQfBpr3lDfj61RBVXZCORlNVw0FWe0gQNsbZ4YQ5rhNS+5hxDldneWQcktAb
         8OaQ==
X-Gm-Message-State: AOJu0YyPUQeW5ZslkXFF24bTHLTNRkMqf9gnk62GZbqRhdDRZFkPp+9v
	PBrp6czbdCqcOpQiLwPrjMct7kUFOBYXCoFwUgC9uBb2uVzTf2K3uUGzqmpYQmBcng==
X-Gm-Gg: AZuq6aJblEm+h6A8p5N8Nxs580j1J6yabyeG1YZPmAuZFhBBTnlIxWFX8ucf+jbAICe
	GAdigDdRrGQpo1hFqUmZmZ58UkxhQWcUzZWQChlVLLIMVgVdbfVfPa1dnuJAoDD5s0zGgwQNZuA
	B0+2aGqLQ/xfh9vIUCW8Hk3iq5x/VFwgBlNuDZtfBIppQw/mQMrreAlAWzf8NznBQidmFgjEPiY
	fF6LP6O3/fSQzpUf2cvbQU0YpbepyNgB3Xl0bSbyXtjWimbmf/4HBGSYlrZyXHPrB6f5ZQ0+gGl
	DwwS1BegcfxL7xa686515EH+9Cd8zW6EVppHBPkvG1xx7d4m0bDjlXupzHwka8P6soIXiTisH/8
	GYi+2NubyAoiyk/yKhimmT6EVdkfT3o3s2+njyUUGAUZ/Tj7o4ojLbZpC3JYYnwyjd04p+o2qU9
	r2Cg7wsqoVphGOq1Wlcj7lFLcZrr6W//JcQq1b9sio7rmnyKKzZBcXsTW/2nBeENZRoVAxYmm60
	Rc=
X-Received: by 2002:a05:600c:1906:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-4804709ab9cmr42986685e9.15.1769077914398;
        Thu, 22 Jan 2026 02:31:54 -0800 (PST)
Message-ID: <cafc144d-5c75-49c1-9231-a854389382dc@suse.com>
Date: Thu, 22 Jan 2026 11:31:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] x86/HPET: move legacy tick IRQ count adjustment
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
 <f8ccb446-44e5-4939-91f7-ac17f660f56d@suse.com> <aXHkvZaxl5E0QL0F@Mac.lan>
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
In-Reply-To: <aXHkvZaxl5E0QL0F@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E68D0654BD
X-Rspamd-Action: no action

On 22.01.2026 09:50, Roger Pau Monné wrote:
> On Mon, Nov 17, 2025 at 03:37:45PM +0100, Jan Beulich wrote:
>> If already we play with the IRQ count, we should do so only if we actually
>> "consume" the interrupt; normal timer IRQs should not have any adjustment
>> done.
>>
>> Fixes: 353533232730 ("cpuidle: fix the menu governor to enhance IO performance")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> _Why_ we do these adjustments (also elsewhere) I don't really know.
> 
> I think I have an idea of what's going on here.  This accounting is
> used by the idle governor to decide when to go idle.  On Linux (where
> the code is imported from) the governor took into account the inflight
> IO request state.  However that's not available to Xen and instead
> they decided to mimic the tracking of the IO activity by counting
> interrupts.  I bet then realized the timer interrupt would "skew"
> those results and make it look like there's IO activity when the
> system is otherwise mostly idle.

Hmm, yes, that sounds pretty plausible. Except for one aspect: Why would
it be I/O that the governor would care about? It wants to judge by the
system being busy, and timer interrupts generally are an indication of
busyness. Just not broadcast ones. Hence ...

>> --- a/xen/arch/x86/hpet.c
>> +++ b/xen/arch/x86/hpet.c
>> @@ -808,13 +808,13 @@ int hpet_broadcast_is_available(void)
>>  
>>  int hpet_legacy_irq_tick(void)
>>  {
>> -    this_cpu(irq_count)--;
> 
> I think you want to pull this decrease into timer_interrupt() itself,
> so it does the decrease unconditionally of whether the interrupt is a
> legacy HPET one or from the PIT?

... I think moving to timer_interrupt() would actually be wrong.

> By gating the decrease on the interrupt having been originated from
> the HPET you completely avoid the decrease in the PIT case AFAICT.
> 
>> -
>>      if ( !hpet_events ||
>>           (hpet_events->flags & (HPET_EVT_DISABLE|HPET_EVT_LEGACY)) !=
>>           HPET_EVT_LEGACY )
>>          return 0;
>>  
>> +    this_cpu(irq_count)--;
> 
> Also in hpet_interrupt_handler() we might consider only doing the
> decrease after we ensure it's not a spurious interrupt?  We don't seem
> to decrease irq_count for spurious interrupts elsewhere.

Even a spurious interrupt is only an idle management auxiliary one (i.e.
really an artifact thereof). It doesn't hint at the system being busy.

Jan

