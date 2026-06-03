Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3W85BkcfIGrIwAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 14:34:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 685776378DA
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 14:34:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=bRG1B8be;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1326156.1591591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUknK-0005qR-CO; Wed, 03 Jun 2026 12:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326156.1591591; Wed, 03 Jun 2026 12:34:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUknK-0005p4-9P; Wed, 03 Jun 2026 12:34:02 +0000
Received: by outflank-mailman (input) for mailman id 1326156;
 Wed, 03 Jun 2026 12:34:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUknI-0005oy-VV
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 12:34:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUknI-0073w7-Bx
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:34:00 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a201f2f-bab6-0a2a0a5309dd-0a2a450684ae-28
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 14:34:00 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a201f38-7371-0a2a45060019-d1558030d5a9-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 14:34:00 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-49068493267so75205045e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 05:34:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2dc412sm7731715f8f.4.2026.06.03.05.33.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 05:33:59 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780490040; x=1781094840; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nV3GB0xfzPvXONTZJ/JUSnFT+yCniSQflPNHwXAPYUk=;
        b=bRG1B8beeYXTxB9Yjom4bOedw9B+n/xXArymLemUnQAYx9BIa3EBemNeLaz8zJwyz0
         AQRL6w0RgTgNPXmTCd++YJJWwDDI8wg3pAQeXQtuMVDNnH7nBixNWuNaWX8uv5uB4nCo
         TXZmd0uqLCbdy4ObHUUoyNXReS5KfhyX8hMmUhNrFakrjibwFvENsWG888ZB0/xEoBfG
         BIJ/JqdUNW1NVjpf/TuNoCfvon2ltNn6rhGeTU1Hvl/P9Yx+gEdUiPDYAgt03UCMSrYZ
         t0aGEpfiqraLclgkVAIJceC11ThoDlFPWDeafQH7kVu3+iFZJzNRq9Dr8BnS3nNL93qo
         9snw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780490040; x=1781094840;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nV3GB0xfzPvXONTZJ/JUSnFT+yCniSQflPNHwXAPYUk=;
        b=poJIF+uYEV0b590Yy/t/dqaNj4wYt9rFVcthMvOmGrsXTEYHsu4bcC1SaGC1da4RHV
         BCkshjP1kDYk+7t4G0/l5YV88kSxmrZcBEFhiaaVy+Dnzb9clKhRN9Tv8gLghmU05NF5
         5OAG2x3YPZBpkOgHKG+HIxMA7BFm5L5YxeLmC1wS8hDqe5oZfEv0ndLPjqylU5u7iHZ/
         sMYHMNVMjtvdUrmcoePWLb3K16rfgtYIJOMNTISZCk1HTpLBwGS9AsmfnT7SA2KupLOB
         VW/XSJ1mX30rf+kFsAcHWCiJHquMdKo1d8vSVacIDDzdtgJwXAAPVQcE4fsWcpPq9QRE
         utLA==
X-Forwarded-Encrypted: i=1; AFNElJ8Bihw3BuM6m6FtFHdvJOgQ7nox2muF4yDZtGzZhnx3vXywjFc72ts/Q3b4Bl0Szqgod+v4NN61Xs4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1mVsN9ndc3gToPS1HuQwRtphfuhzvQVxKTh13zjmpolr7ocRy
	/5XKOhGu/AYWJ3+lxOI4LbNErQgdswuVpqVDrzqlUWwGHpE3YeKRZso58TRmq7O68w==
X-Gm-Gg: Acq92OHYG6cZ0egTj3ViyKPvwU9ore1ExP2WpW0XMXy/sbB+Wfqt4Xz554S2MHr5v8n
	+6yMIv0FaN1ilIDppyIaiwaST2vdVCo6GRg81D/l18TlgBtvddxBfKtT9+qORcWVZiGmmVcX8bB
	G1CJmIHPqF89km60mhWpTgqgqZVDp/iSbypo3KSFz5k9c8MTEEuPc5rszXRedcTEmzs+m6t7Nce
	ULUDiGHCzZbYjAf4Fye/l8V0sAd0ocgnaSLS6EDpDQcCVcnFoTqnjQIQc3xOZMNS0MD+3g9TlgY
	1lidsRuNim9llghMZWoChY/c564h+sSenvvfkd7AwE6I5hOiB1Jnn8XvKLXvT6crh3YsXBwGPmQ
	4dkGwz++MoNzDASO5ZZyj1doYu0ePYYUxmYlTAv/ZlVREPCDuEQXPH4oC2CZJCWuz5ZpM4j4k1I
	LFnHIxz4cTUcwih2NYlrbyCLoj0tN97UXOdvFC7NXnzJthrF0pWiFHUCmIvVjhjFg3F1gmc3agQ
	e+zzDSCLmTINK/bv0r03mOgFoGWfvOSVaZu
X-Received: by 2002:a05:600c:c4b8:b0:490:b591:b5a3 with SMTP id 5b1f17b1804b1-490b60e9af0mr53586345e9.32.1780490039626;
        Wed, 03 Jun 2026 05:33:59 -0700 (PDT)
Message-ID: <803b9674-d0a4-41eb-898f-4cb8df83c975@suse.com>
Date: Wed, 3 Jun 2026 14:33:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/domain: fix UBSAN null pointer dereference of
 d->shared_info
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1779712171.git.oleksii.kurochko@gmail.com>
 <04dd784b6b9a4dfca9a313ea8802d8d514d65021.1779712171.git.oleksii.kurochko@gmail.com>
 <3aef7763-aea3-496a-8c18-d3659f590373@suse.com>
 <fb1b1194-5855-49d9-99fc-d35a3038833c@gmail.com>
 <3eb9ab3d-dc4d-4019-89c8-9f7dbdc528cd@suse.com>
 <9ae22210-6dd5-43e3-918e-f68b1294448d@gmail.com>
 <dc622455-c20f-4b8a-8c80-1e4c0143e8e0@suse.com>
 <ab414833-4a3c-485b-91ce-7a0a91f25182@gmail.com>
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
In-Reply-To: <ab414833-4a3c-485b-91ce-7a0a91f25182@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1780490040-8DF81D75-59453B36/0/0
X-purgate-type: clean
X-purgate-size: 2101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:from_mime,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 685776378DA

On 03.06.2026 13:57, Oleksii Kurochko wrote:
> 
> 
> On 6/3/26 1:23 PM, Jan Beulich wrote:
>> On 03.06.2026 13:05, Oleksii Kurochko wrote:
>>>
>>>
>>> On 6/3/26 7:54 AM, Jan Beulich wrote:
>>>>> --- a/xen/common/event_fifo.c
>>>>> +++ b/xen/common/event_fifo.c
>>>>> @@ -562,9 +562,10 @@ static void setup_ports(struct domain *d, unsigned
>>>>> int prev_evtchns)
>>>>>
>>>>>             evtchn = evtchn_from_port(d, port);
>>>>>
>>>>> -        if ( d->shared_info &&
>>>>> -             guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
>>>>> +#ifdef CONFIG_HAS_SHARED_INFO
>>>>> +        if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
>>>>>                 evtchn->pending = true;
>>>>> +#endif
>>>> While as per above shared_info() would best not exist when !HAS_SHARED_INFO
>>>> (in which case #ifdef may be unavoidable here), an alternative where
>>>> IS_ENABLED() could be used here may want at least considering. E.g.
>>>> causing a link-time failure when shared_info() is used (and not compiled
>>>> out).
>>>
>>> We still want here to have #ifdef instead of IS_ENABLED() as
>>> shared_info() shouldn't exist for arch without 2L support so it will end
>>> with linkage error.
>>
>> I don't understand this part.
> 
> If the change will look like:
> 
>    if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) && guest_test_bit(d, port, 
> &shared_info(d, evtchn_pending)) )
>        evtchn->pending = true;
> 
> It will help to avoid NULL pointer dereference of shared info page in 
> case of 2L isn't supported. But considering that shared_info() macros 
> will be reworked in the way which will lead to linkage error in the case 
> when it is used and arch doesn't have shared info page support usage of 
> shared_info() in setup_ports() will lead to linkage error what is wanted 
> to be avoid for arch without 2L support.

What linking error are you talking of? When !HAS_SHARED_INFO, the compiler
will DCE the entire guest_test_bit(), including the shared_info() use. IOW
I still don't understand what you're talking of.

Jan

