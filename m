Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPlaBCmcBGr3LwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 17:43:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FE05365F4
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 17:43:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308238.1579772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNBjj-0007FV-9c; Wed, 13 May 2026 15:43:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308238.1579772; Wed, 13 May 2026 15:43:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNBjj-0007EC-5u; Wed, 13 May 2026 15:43:03 +0000
Received: by outflank-mailman (input) for mailman id 1308238;
 Wed, 13 May 2026 15:43:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNBjh-0007E6-Q5
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 15:43:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNBjg-0015Eo-Ld
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 17:43:00 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a049bfa-e002-0a2a0a5209dd-0a2a450bd542-16
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 17:43:00 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a049c04-212f-0a2a450b0019-d1558036b414-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 17:43:00 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-488af96f6b2so83309225e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 08:43:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45491f8d4c3sm41760372f8f.34.2026.05.13.08.42.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 08:42:59 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778686980; x=1779291780; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V+inOK2x/6FApQmexOxsKZ4km4MjoG7n4SP9MvzDO5o=;
        b=CWzTRpj1yZdRov8bja0XptZn/ufHrGHzRR0GXP79XC4UqYd0NPaTt819YvB27TKEh4
         4Cf+I2vYUNeTL7HlFRaAgrgx0o04mHjJMz3Z9vaLYHsiOfu18fk2nJXKsuU1NFzDcSgw
         LlM63zAwgrMDYuHz5QlD0SUPC0b58//BYQwQH9AaldNdqq6TGrnIx6E+EUEud6rVsHVl
         XeCrzsXkQ8RBEAnieSYfHw2XSikNCdccDN9c1ViC/fzLlEzGiqpH/R7Ud8Fo1g50ir1j
         be8Ak8uV8Gy8GE8lW+xEJ9RLH5ELHOdJM1QdSxcR9/Lx7JOPGR7QbERwJqtA1WDTIxjU
         Iwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686980; x=1779291780;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+inOK2x/6FApQmexOxsKZ4km4MjoG7n4SP9MvzDO5o=;
        b=SizjRBMcM3L3bYTOkSTfdX36QfLgNJeDW4JsxnizSJP0YEH+UWZzFhG7hl9tKf7KSw
         cf0V1xsxcc8VHi4fWtrqrP9Or6QUL6AsodSEuFF2TfAvEQDx6IHSj4i0E68cBlRo1oqv
         LNQnvj8KCwkSypq2AowkCYSCmhaKt0Uo5yGCnKgBb92a+tPW7XIWF3vYpD3rL5QBL2Rr
         yI28W2khQ0Q0El+VDJ9fi6Bjmb1Uq9j3rUa7Mbk8crCy1jZaku9OBuxzN94dLpMws94q
         Jt9+vF17/GeX2qzpRMd+iRN9BL2BRTR3ChL7Cfi6Rpd2Dom48IXWsjV+mGORK+730qSZ
         MKnQ==
X-Gm-Message-State: AOJu0YxUCpUStlusLh3W7nZ2aSrH9bc3lZOzaH0UNu4abacOU2/PfsRO
	bioZbn5aJZyf9QTegAB2yQo2nJAN0hqfofmRTw68PrXzBjPH0tq0Vax3eZ5eTmLBXdUtefOh0Om
	GFQY=
X-Gm-Gg: Acq92OF1JgJipBiZVo+5Sy0Fo7Oo5+zelrI9/bUwEf2N08E/nL8YP2ErjM8FyGWnWXm
	114Olybr5pJv/PrSRnF/Gk0Ycle5J5yyk3Nz1iEWNvfQMd8z7x5pgtU4wtH5NCtaS34+RVMCg2K
	SQ/LnHwBSSnCKPjEaetmudJkPv1GNrmqqzyJXztQykangrjlOxN/JKZhZwXMnUdAGcej+BqfWxt
	GcdvDxgzn55i34cIXtev340UAClB2wtQxfam1ExhctOJ/aWErCqfwTYejGd5lUZLAe1R1fWhehG
	QTTAUS/ocFCF6uCYNfiKwg6/AT55Vfc6uQdh8pOO+M6mzfwO/jBYYGvGobU2HXU3Y1bjjr4/YUX
	pGLleZ0IR2eiFUtFjFTutyJBZySe5pwjKoBJ97Q/6EKJtI1fWfGjUKnkuQ4oEMujygOUQWV+fbH
	OKNIuaA4c/MqUkGtv1mvZYx31H6XEmQSFAFzR0x94qdeDrhtK+0M9XDPIweYVtCrRlEB0eZ0qP2
	M0o/kQi8X+ae8M=
X-Received: by 2002:a05:600c:4e0d:b0:48a:5c23:cab with SMTP id 5b1f17b1804b1-48fc9a3abb0mr59848425e9.19.1778686980012;
        Wed, 13 May 2026 08:43:00 -0700 (PDT)
Message-ID: <6ef656b3-0428-4867-aea2-901d852d12e7@suse.com>
Date: Wed, 13 May 2026 17:42:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 3/5] x86/vRTC: support century field
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <b36b6f2f-2b0e-462d-9846-4a1b4d7edef9@suse.com>
 <383355d1-7032-4445-8a06-cb4411ea797e@suse.com>
 <agSJlh8KQ9orL6wC@macbook.local>
 <17a25f0e-91e3-4e09-92ad-21e7dc0ebe62@suse.com>
Content-Language: en-US
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
In-Reply-To: <17a25f0e-91e3-4e09-92ad-21e7dc0ebe62@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1778686980-13B78F3B-7C50F452/0/0
X-purgate-type: clean
X-purgate-size: 2495
X-Rspamd-Queue-Id: 60FE05365F4
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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

On 13.05.2026 16:58, Jan Beulich wrote:
> On 13.05.2026 16:24, Roger Pau Monné wrote:
>> On Tue, May 12, 2026 at 04:59:35PM +0200, Jan Beulich wrote:
>>> Both ROMBIOS and SeaBIOS (with CONFIG_QEMU=y, as we build it) blindly
>>> assume availability of this field (at its conventional index 0x32); OVMF
>>> at least has code to inspect FADT. Hence we ought to have supported it
>>> virtually forever.
>>>
>>> As the index is beyond RTC_CMOS_SIZE, leverage the padding field in
>>> struct hvm_hw_rtc to hold its value. Update the field only when involved
>>> values are valid BCD century specifiers. Otherwise (for VMs migrated in
>>> from an older hypervisor) leave handling to the DM.
>>>
>>> This makes the Linux rtc-cmos driver report y3k compatibility.
>>>
>>> While extending xen-hvmctx.c:dump_rtc() also add RTC offset there.
>>>
>>> Fixes: 4ca161214355 ("[HVM] Move RTC emulation into the hypervisor")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Am I overly paranoid with the checking of the field, considering that
>>> Xen 3.x post-dates year 2000 and hence all firmware nowadays usable guests
>>> have ever run with should have been aware of the field? Or am I, quite the
>>> opposite, still not strict enough?
>>>
>>> I can't help the impression that this introduces a latency issue for
>>> the 2nd of gmtime()'s while() loops: We now allow years up into the 99th
>>> century, i.e. over 8000 years away from 1970. 8000 years are very roughly
>>> 2^^38 seconds, making for (again very roughly) 5 million iterations there.
>>> Did I get my math wrong, or do we need a prereq change to (vastly) reduce
>>> the number of iterations of that loop (e.g. along the lines of the other
>>> one, first going in 400 year steps)?
>>
>> Hm, maybe we need to add some XTF testing for the RTC?  I'm slightly
>> worried how much time this could take, and since those calls are
>> serialized on the s->lock I wonder whether enough parallel accesses
>> from the guest could manage to trigger the watchdog?
> 
> I'm not really up to making an XTF test, I guess. However, as you look to
> share my concern, I'll add a prereq patch adjusting gmtime().

While making such a patch, I noticed my flaw in the description above: That
loop walks in granularity of years, so can't have more than about 10k
iterations. Shortening the processing by first going in 400-year steps may
still be worthwhile, but doesn't look to be strictly required.

Jan

