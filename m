Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAmHK2auDmr6AwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 09:04:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A72E59FDC1
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 09:04:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314836.1584808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPxRh-000421-OD; Thu, 21 May 2026 07:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314836.1584808; Thu, 21 May 2026 07:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPxRh-0003zS-La; Thu, 21 May 2026 07:03:53 +0000
Received: by outflank-mailman (input) for mailman id 1314836;
 Thu, 21 May 2026 07:03:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPxRf-0003zI-KS
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 07:03:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPxRf-00CcAT-0H
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 09:03:51 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0eae53-e002-0a2a0a5209dd-0a2a4507992c-20
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 09:03:50 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0eae56-229c-0a2a45070019-d1558031e0c6-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 09:03:50 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so81644985e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 00:03:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4903c99d807sm5076435e9.5.2026.05.21.00.03.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 00:03:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1779347030; x=1779951830; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hpLc8YnZRk20ii5m5hYyQCZnBVJ6zKoRF/I1pDeV6SQ=;
        b=HW96XXf5SttyZjo1aSWC3vzr+I1Ja2duO5Jh4PNJcKYYH86i/O2Kqi/oy+cl4rFJZQ
         3tq7Yo8CqfWDdW0JIXeMtILDG8OY8cA2AIGCPfSirtTzQbewKMvV5aBtI8iXl5HYb3fj
         tyDI1b/z9eRYkQz5tDe1Z4zSWmwAtpcH+loT65yNyQueNYqhYHTOgGEZr5GRpI/Wjyi0
         O1edcQ8e7DKgUuCXL1t9u/mJMEZEgBp1h4QvJoeOOK3k+g3gF9vJMvpyXiNGi6ZOfASO
         Ap0zjV8YZ6M1ZFXfrW5hr2DSD04RYithGuIVUtySsDqBpPGybBi721MimguJv+CogHry
         648Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779347030; x=1779951830;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpLc8YnZRk20ii5m5hYyQCZnBVJ6zKoRF/I1pDeV6SQ=;
        b=CTgpR5IO6K+hatcAwbBl+8BsSEU64+VC/KuZABShs2wibB3vYlaxmI/v+rnt0YttkI
         eWlgUuz82wgSlDkTvR8AeY6haCk/YGylyFF853AQq/85WTqEYYTOq7frXtKHho7+Sy9A
         Ysgdfen6DFC5SzkVQombaeklNh5URAWlgEp+gW6Rr4BcQyFmXLYnUEcEdMnPbc5xqRRa
         5E0KFeGZhaQlE6zrxDy9g4gQSmdwbE3iH6cxra3tgCpLBm7AQxkV5JTLqG4ixeVm1tch
         Z4lesXfCwur5EgEqmLCgPv1/+AIu3k6h+0dBWXg5cz67/f0apcNAjt+aa3coesoSduLn
         KDBA==
X-Forwarded-Encrypted: i=1; AFNElJ+rvxP+rj4iEB8HWFsCnBmrqX27E2NnjFsYPUtklQmv6Wbmu2LhVw9Duah6mEiQAGGH22BsFpaNmL8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqZmvqGNvR3RHnr4WAuef4rHiliur93QBIVvu645qscnkMaCNB
	bwJ4DD6SLE7AdYRnEq2HKzih9bMtjmbYDHzvTFsTB7jD8pb2ISvvF9S9TNxlhEr6/Ie1+j6UTsG
	TFwU=
X-Gm-Gg: Acq92OFzTMUC/BZNwru9E8fB/FecvVdl8+dDOmeP1U5M1qtqonjprsU7e1T0bmGZ2V8
	W+HFaXMgzJGqhGAV2FWDpi//i1oByEcBNq1sJOOaYw9DFgRc8hJgr2O1bCs+MG+ZIvhtxWV7wRM
	kZOOig7+kVLpB35rhPDEhBG8rKFvyOdsD2xtedq4QywmzJ51lu1w4tNfNdOnf1voST/mB6YuUOu
	NHMaJEHS0WtSs92CYCx7zu8HenLujrYpMxFUpfkfrL6NILNZyDyXbvSlKqH6g26xE8mWHTAn9qf
	xQVNXyWFtvErZrIIwK0VRchY/PssF1GR/PNBwystl443vLKpvqVxzwR8+qHX33bM73jwiasf7u+
	3HBU/QAIKtn2OMmnXlImfisYYXYcVCf/zjVxQDUb8Wlp43bGwDKnhTO18GxdsiYSTl8TunmLP00
	ZwL8s4A9kQKId3W3jcjO04F7YHalM1WOUw4hTRiF68wqq16dDyIJYoUWTu7KuZmR8KOtLwCcYsH
	PXqt4lajv/Y+6E=
X-Received: by 2002:a05:600c:1c16:b0:48f:d2b5:d7 with SMTP id 5b1f17b1804b1-49036039043mr22525665e9.12.1779347030036;
        Thu, 21 May 2026 00:03:50 -0700 (PDT)
Message-ID: <c5bb55f2-1c0b-4493-8cb6-ce680b5358a0@suse.com>
Date: Thu, 21 May 2026 09:03:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pv32: Fix bogus cr2 on fault in emulation gate
To: Teddy Astie <teddy.astie@vates.tech>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <1779292317.8631fc262581453bbf619ec5b2062170.19e46162869000f373@vates.tech>
 <0e23078f-30e0-4077-be1e-365a265603de@citrix.com>
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
In-Reply-To: <0e23078f-30e0-4077-be1e-365a265603de@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1779347030-23F7EC48-55E0A41F/0/0
X-purgate-type: clean
X-purgate-size: 1732
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,vates.tech:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1A72E59FDC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.05.2026 18:34, Andrew Cooper wrote:
> On 20/05/2026 4:51 pm, Teddy Astie wrote:
>> __{put,get}_guest returns -EFAULT on access faults which causes
>> the injected cr2 to be off by 14 bytes (as EFAULT is 14) which is
>> incorrect.
>>
>> Fix the computation by relying on copy_{from,to}_guest_pv which
>> reports the number of remaining bytes instead of a negative errno,
>> such that we can compute the offset properly.
>>
>> Fixes: 70ad570b2799 ("x86/64: paravirt 32-on-64 call gate support")
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> ---
>>  xen/arch/x86/pv/emul-gate-op.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/x86/pv/emul-gate-op.c b/xen/arch/x86/pv/emul-gate-op.c
>> index c2c699fbff..cacc171115 100644
>> --- a/xen/arch/x86/pv/emul-gate-op.c
>> +++ b/xen/arch/x86/pv/emul-gate-op.c
>> @@ -289,9 +289,10 @@ void pv_emulate_gate_op(struct cpu_user_regs *regs)
>>          int rc;
>>  #define push(item) do \
>>          { \
>> +            unsigned int __value = item; \

As per other comments, this wants to use uint32_t as type.

Given the number of comments, including some back and forth, I think a v2
really needs submitting (rather than one of us doing on-commit edits).

Jan

>>              --stkp; \
>>              esp -= 4; \
>> -            rc = __put_guest(item, stkp); \
>> +            rc = copy_to_guest_pv(stkp, &__value, sizeof(__value)); \
> 
> Oh, this probably violates MISRA, but you don't need to use a separate
> variable because sizeof() has no side effects.
> 
> Given that the expression is now &item, I think it needs to be &(item).
> 
> Can also be fixed on commit.
> 
> ~Andrew


