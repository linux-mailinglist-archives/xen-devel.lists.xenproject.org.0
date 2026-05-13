Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOYFBqyVBGqrLgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 17:15:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D38B535E4C
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 17:15:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308214.1579750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNBJI-0001ZZ-V1; Wed, 13 May 2026 15:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308214.1579750; Wed, 13 May 2026 15:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNBJI-0001Y2-SD; Wed, 13 May 2026 15:15:44 +0000
Received: by outflank-mailman (input) for mailman id 1308214;
 Wed, 13 May 2026 15:15:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNBJH-0001Xq-Ia
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 15:15:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNBJG-00EeIS-VS
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 17:15:42 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a049592-bab6-0a2a0a5309dd-0a2a45078612-30
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 17:15:42 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a04959e-229c-0a2a45070019-d155dd32e8db-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 17:15:42 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-44e5624c053so3902526f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 08:15:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548e4bb87bsm39854284f8f.2.2026.05.13.08.15.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 08:15:41 -0700 (PDT)
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
        d=suse.com; s=google; t=1778685342; x=1779290142; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=quk3qkY5nIGCC2Hk7He372Fv5npd2nrI9YbcrJ8IJmo=;
        b=SwbbAE0p7HScI5YdHipFL0D0TIdYKItnkASvRrbPwFIRdPlj3bGWjm3nbhpBdyrFPC
         3/3CvClV08+8BM2YuTxsRKUcC3TvTErRdefO1IOIFPHFY1GuYsjRUecBBhw9rbLT6OmQ
         2+l/W1nXbbkfQviOBoNmaIcd73sOGXUnIa98qBVg4znP3PeGKCXHi0YDx3B8K711KNmP
         yGvc5wCycSChPM1zsjMkez3P+sX3ZHIXbxNr+loN2YLwCOQoDR7ZZqyZYgMe/JRPjN3o
         zaAb8hpQ16q3Y89SSgaTeNIFl+GfkrSn8Nz1wGbwQh5m6xGA/QVZ8j+Wyq3//jJlvM2g
         pn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778685342; x=1779290142;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quk3qkY5nIGCC2Hk7He372Fv5npd2nrI9YbcrJ8IJmo=;
        b=OyyY4lQ/nARpMWxViirFR15dMpjGv7CeN0crzTQTmjVAYpvBWyNubD/ioWpXM1Uih6
         HWXODNd0lQEReiCZ2XpbJzbPsV0BYoRnt3HPrvV9BGF2zi+ciSvcRalXbA6Yd+b/raDK
         EAmt42hA7n2u348JK8K8IShQnxv5PAzd5sYtrFNVwmR1N/tQ6CI9NW5Hc8bFXjYI54bi
         zuReTB5lQ3pfMghtSp74ZvyMSkCsufJ6B/DgrecWnJjwt6ZndRAfAn71gAXVTE/D5Q3c
         YQ1GkuD7iAtGl44TurSHfJg2Os8a8KBi1qTc4pvI06PnMv8dtuZHB8TczPgHmXRQNno/
         PqeA==
X-Gm-Message-State: AOJu0YzIOVsji02cIbh2kqxZq7QC0Rpg9gdRQrZ0TatzElC4JfNy/t6u
	sA0eUs5DC5kIUMm++HAIR7g34ggGSTlbFACr/Sh1GJddjls57UG7q/nH9YCfFl7BdQ==
X-Gm-Gg: Acq92OHcA6So78L86+f+TownO9ITFi4nYh4PB3uEJksUzMZ3vKzUvfNLsKIPykHLMCr
	kn1vQt9+9tmA1sNp9Vd508+it/B1kTLhn5foxc4UKs1Pzc4Fb+KQWsQBN2FowY7q74TxORdXPKA
	0W0968eSCEsKqsAcremd+YJKcuDEDphXM+g6+jQD1PlZvwj7TbJBjGYJhvfn6rOkE/zgdManJeq
	pJaHqeCUgFF5ugz6lwDjBKx07imDKA8UHYjV1s7YegOACjHQ27yrevezEtQC/LuCgYz0WLWJCoX
	PqpKnb0uC/vkqZaFWx9C+EP98gmEx5K7dSZILP9Q5n5sXfruG6mQ0Gscx7hCcwcCkH7S9/13tDk
	OQl2VtKRydmJy4P13Rp/oLWkOyzu5Wzqw+YQ8yS9qpvQ0eLJKlo4MWGhbKuMoRcHL4hzZ79uyO2
	/bTyjMxTDCGsNLBkl8J0BB7Rc5fjrVmu5H2P0nabm8/Om37xqH4rHK82jlml9PxQN9rAPjW1MSZ
	oKYg5CQBqE7gAI=
X-Received: by 2002:a05:6000:220b:b0:43c:f583:126a with SMTP id ffacd0b85a97d-45c7843076emr5622388f8f.14.1778685342216;
        Wed, 13 May 2026 08:15:42 -0700 (PDT)
Message-ID: <d70965fe-5039-4a9a-a470-a9d2a0bc6ebe@suse.com>
Date: Wed, 13 May 2026 17:15:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] x86/time: move BCD_TO_BIN() uses
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <b36b6f2f-2b0e-462d-9846-4a1b4d7edef9@suse.com>
 <2c5af8f9-05f6-43c4-afb4-a50cbacd2d49@suse.com>
 <agQ8tRY3Kya6RasY@macbook.local>
 <d37322ac-fdf9-48bb-91e3-3e8d560fa758@suse.com>
 <agSRm3T0Y3EfuqFb@macbook.local>
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
In-Reply-To: <agSRm3T0Y3EfuqFb@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1778685342-0AD77C48-D5D8C923/0/0
X-purgate-type: clean
X-purgate-size: 1745
X-Rspamd-Queue-Id: 8D38B535E4C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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

On 13.05.2026 16:58, Roger Pau Monné wrote:
> On Wed, May 13, 2026 at 12:39:46PM +0200, Jan Beulich wrote:
>> On 13.05.2026 10:56, Roger Pau Monné wrote:
>>> On Tue, May 12, 2026 at 04:59:03PM +0200, Jan Beulich wrote:
>>>> ---
>>>> How come RTC_ALWAYS_BCD is compile-time constant 1? And then even with an
>>>> inverted comment? Looks like we've inherited this from Linux, and even in
>>>> Linus'es current tree it's still this same way. Yet all half-way recent
>>>> chipsets I'm aware of properly implement the DM bit in reg B. Might this
>>>> be another 32-bit leftover?
>>>
>>> *shrugs* I don't know.  Seems like Linux is still doing it, so it's
>>> likely safer for us to continue doing it also?  We had no reports of
>>> it being problematic, albeit one could argue it would be best to
>>> prevent such reports by doing the right thing.
>>
>> That's my point. If we did this as specified, we'd unbreak systems with the
>> DM bit set correctly, but we'd break (hypothetical) systems with it bogusly
>> set. Like with a few other fixes, perhaps we should correct it, but provide
>> a command line option to restore old behavior?
> 
> Possibly, but I would do after 4.22 has branched, just in case.

Of course.

> One thing I've noticed, is that Xen don't attempts to set
> RTC_DM_BINARY in REG_B, shouldn't it try to set the bit when probing
> for the CMOS?  Since it assumes BCD mode it should at least try to set
> it?

For one - don't you mean "clear it"? But then - no, that bit is purely
informational aiui. Changing it won't alter what the date/time registers
hold (only how they're updated). Hence by fiddling with it we'd corrupt
information (breaking OSes which properly respect the bit).

Jan

