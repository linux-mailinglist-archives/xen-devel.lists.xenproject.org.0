Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K7oEFNGBQmom8wkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 16:31:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A43876DC135
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 16:31:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=AA8Q3oKz;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1347615.1605450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weD1L-0004Us-O7; Mon, 29 Jun 2026 14:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347615.1605450; Mon, 29 Jun 2026 14:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weD1L-0004S7-KX; Mon, 29 Jun 2026 14:31:35 +0000
Received: by outflank-mailman (input) for mailman id 1347615;
 Mon, 29 Jun 2026 14:31:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weD1K-0004Rz-Cz
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 14:31:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weD1J-00DBrU-PX
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 16:31:33 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4281b8-2eae-0a2a0a5409dd-0a2a450bde28-30
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:31:33 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4281c5-ac48-0a2a450b0019-d1558033c4b8-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:31:33 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4926f8e02e8so20609705e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 07:31:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268ffe204sm326025345e9.7.2026.06.29.07.31.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 07:31:32 -0700 (PDT)
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
        d=suse.com; s=google; t=1782743493; x=1783348293; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AWhYxewr7i6uMl2HLdHiGjnS984rLOBv41VMjNqnD1o=;
        b=AA8Q3oKz1sL3+KvUNgbD8zq2dYUNxAHQwJQnlzlh6UERSmP639wNgxymaHzkeKS/xQ
         VTINN+ImUdff3r+PB2TQLmuOnC/QclbpQj7Dtao+cFXfQ1hk4as74LSFSD6UnANNULz8
         odY/rMkK2xHgwjwknzvXbYy4HxprTVPDtA4NTWZ4QxODx1ZbHmbJ5+pzRwo0SqMOT85L
         OL/9mIZA08FpteQgoxSCXXFdp7ekXJfR75mXwlU6IOOr0ftrIG+1gJY7jh7HFNBQ3KhM
         NnlproEESqNhdpsLo5WUsataZs0QLE7m4VbvyF/4exJsfOEVqaORS+pFFOkSWQynpt8u
         8OzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743493; x=1783348293;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWhYxewr7i6uMl2HLdHiGjnS984rLOBv41VMjNqnD1o=;
        b=otFeq+dCybwquweFXAEfDrqPIAtFvheDIQuT/9gzPTXU60/TfqkkWBjXiv+9O3+9H3
         dCv3EOhxC0Q0Md5cSdR486IX8Dq73ZXmiwNemSMUiNe7plvHbjFUrLg3owcHuZ0Yyd1V
         FHfoApVlJZ/ka47CpFOd3jWjVSocqN9V20BO2APUeboUW7+e7eJkT3AVWnHBSLxdhetQ
         FMX0cU812QGJLmXrzrBvM0qxnBgKloG4ZsKHHocLM19IDJGAuDXKTtiHJwUlCS/7EvzS
         EXRgsrECGnB2q3qqJzEsT7fD/gLfIiryTKrhae2VuOYv7UPZMmVB57FDRWSkXiR14VH0
         xs0A==
X-Forwarded-Encrypted: i=1; AFNElJ/a0Zpp9E6DkxuuZKtR+pj5sFlK6KgEndExpjpLF6rcuLGpsVPAdQaOcVQ62bG747PWy0fcEqh1pI4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWDt/57suWNpBGXbLPfA8rMty+6c+y2y1wx9Cef4gzcK621efz
	61XSwHg9xzI/gIupGo8vK7zJgxV/Pm7fwnpOaSDPt2NIU7Q4nw540QYa91D6RRfxEA==
X-Gm-Gg: AfdE7ckU17yo7AHiePaKbGFa2kOu8kjfSKYZGaPDPHdQTm1pMZEu7PCzAIBmrv4/Jlz
	1ofXY78fB1vxZaADTHbKJYLj72+VIZvEFR0I0lHGD8TNAQXv79ZjbjV6Z+FDBr3kceQJ3f5p6kX
	NybnCLYByyF0LjCCTE4lBj25ZXTY51kvzQtUR+Cg82DbnVwC3p6DRTLW5GYzstUguzEnrR3uImr
	Dlj30Nrr7WQhYRr2Aesl5sJnFE1/w/9UC+/F3PgicvZ/q67zC57V/NjUtrmEJMrIxaSO+dZchhQ
	GWT9Jd76WrKskR///AhS3IHTjYfd4fZC4ABpkay3llT6ROSReVepZOIY9Tv0Cf07a0E0XfYRMO7
	/K77hSbF+QjoJoJb46WzlA4JhSC4Nt1s/MB3C4SuIfTm5itwsm5dJG3M/JdK3lDLYK4j5XKbBOx
	bijxpxt8Z9y15y96RsE1SO0W/PQumG6ORvbnxp1DhzHnCallcV+Q3ThRRfBhWbDurfL7PJ88vVX
	vn6
X-Received: by 2002:a05:600d:8489:20b0:493:aaf5:6e04 with SMTP id 5b1f17b1804b1-493aaf56f86mr53851705e9.15.1782743493175;
        Mon, 29 Jun 2026 07:31:33 -0700 (PDT)
Message-ID: <fc302914-02ec-4d6d-a8c9-493e4d6153d4@suse.com>
Date: Mon, 29 Jun 2026 16:31:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2 3/4] xen/irq: handle IRQ being disabled while
 executing its handler
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260629094531.55555-1-roger.pau@citrix.com>
 <20260629094531.55555-4-roger.pau@citrix.com>
 <d965a04d-c66b-4c7c-8ce7-c1da029a6b7e@suse.com>
 <akKBWHftre8AF3f7@macbook.local>
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
In-Reply-To: <akKBWHftre8AF3f7@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1782743493-A4D2F220-6F5F67AC/0/0
X-purgate-type: clean
X-purgate-size: 1175
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A43876DC135

On 29.06.2026 16:29, Roger Pau Monné wrote:
> On Mon, Jun 29, 2026 at 12:31:56PM +0200, Jan Beulich wrote:
>> On 29.06.2026 11:45, Roger Pau Monne wrote:
>>> It's possible for IRQ_DISABLED to be set while running the handler
>>> execution loop in do_IRQ().  Such disabling can be done by the handler
>>> itself, or from a remote CPU.
>>
>> I don't think the handler itself can legitimately call any of the functions
>> setting IRQ_DISABLED.
> 
> Hm, yes, we still have no interrupt handlers that set IRQ_DISABLED,
> but we will gain one in the next patch, where ns16550_interrupt() will
> call disable_irq() that does set IRQ_DISABLED.
> 
>>> Check for IRQ_DISABLED not being set in the loop condition, as to not
>>> execute the handler if the IRQ has been disabled.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Preferably with the description adjusted (or it being pointed out what I may
>> be overlooking):
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> I'm happy to clarify the commit message to note that while we have no
> instances ATM, but that future changes might introduce some.

Better leave as is.

Jan

