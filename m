Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIPLAxC6fGk0OgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 15:02:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3440BB715
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 15:02:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1217592.1527010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlp47-0008QQ-VB; Fri, 30 Jan 2026 14:01:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1217592.1527010; Fri, 30 Jan 2026 14:01:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlp47-0008NL-SQ; Fri, 30 Jan 2026 14:01:39 +0000
Received: by outflank-mailman (input) for mailman id 1217592;
 Fri, 30 Jan 2026 14:01:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ahnO=AD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vlp47-0008NF-80
 for xen-devel@lists.xenproject.org; Fri, 30 Jan 2026 14:01:39 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d71874a-fde4-11f0-9ccf-f158ae23cfc8;
 Fri, 30 Jan 2026 15:01:30 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-43590777e22so1369281f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Jan 2026 06:01:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806ce56068sm192940895e9.13.2026.01.30.06.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jan 2026 06:01:29 -0800 (PST)
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
X-Inumbo-ID: 2d71874a-fde4-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769781690; x=1770386490; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wfzMo+NakLZygboHWLa1nAa4V5nThGPZmL5ZVtFLazU=;
        b=K5d9KzXuYIcTckVLtIcFPgNxnWvhnFlvYpZebkJh0KgdqtS1dI7tMxfhWDKp/bmeco
         uxFbsSktYKqyjjzr1GLhry7y3nuX+dFLMJ3q6WVh65BzzYlLtTbrlZrtt7q6XGi6mB14
         Os1ERRwLVM21+pWCFzXbnyp2xyIbaWIjh3/oIYn1BijvNIOXdc8H0mxlInipX6Xe2cvo
         iWmtCx2q1LqzIBXlXwMCEswjP1OFoj8UerZGzNwLkzXaL3+ePg7/1UHPd+UhBQSETUq7
         YDph7nCJfsl2FngiIQym1ps4jFtrOSlJaSo05EMgzJ6aNrKrE7O/4s/KlOdhPZKUH6w+
         uN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769781690; x=1770386490;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfzMo+NakLZygboHWLa1nAa4V5nThGPZmL5ZVtFLazU=;
        b=d1WtfavBA8djGL0ZgOk7zp4ag6/2NkzBO8xMhMMo1KEEPJxxtU9cG5k5SU6iEvMiYH
         xSp8dtjdBB97gKaNWYwd7sPA0Kx1ndEdMfLX9Hgs/mYuH0p2tJto3l18F08keJ2fc2uR
         /grJ8U2mNdhpXL4ypRjcUqvwK996r73XMPyvV4EtCMD1dJvqmAUgokHBLRpTVPu+rSkn
         GpGuve6cOeLhM2DjpWxo8fNyxhOUIUPFS+KZqzsVLF9ZhWq5rywnE53VvEay4eLiMsJ0
         JEHdYiDBTYm6hARZditS96kybj9BR+dg/gAlJ9fl7pOD2UFtscCm5Ts44MVzMW0xIhdR
         NErQ==
X-Gm-Message-State: AOJu0YzWZ17AopsLkkdOwFYixWZ/7n6mVTBEHGc+C846V9A6vCodNQtr
	LynTMtRoEq+1yHP5XxCGmMbBtiHwvTZcw2vAjA4wLMvHbC678IQVlGeCHX0oGjlJ0Q==
X-Gm-Gg: AZuq6aKkQKv3SluvsDqNvf91wZYIK+1Msonw3ClX0Ueje1BweG1FLNndwe7glRf1fCP
	tviWBzv1OKoCPJnC+bv/ZqqNLOEFIBw6oGrdeaeVW5xp74FGVAlMtGYLQxQyozR1xyrD3B4rO1Z
	oCElaDNoMGjkhqcxSwbYJ8y4ls1yZidcDZn2yh8ZVF3YsfqzASVj27hez7IzEsg+lPUXmfiLJG0
	4CRsWZY392fZxx9QE39UZKqQmO3LD7JrE4FVYkTKLT0y7KyaWWuE/Blk7DGQEbC43gzMxBHbVha
	LMOVD6UhwEgv+EfDY+Utbss/SqdCS/S+o185ubSfnSgsLEwjNJP4r7PDGbkDOSBAR+ZpVuTU/VV
	oBmaf8TYndOhDx7CtFGYglTYUPKi7e57pwQRUelYfk+aAAJoQ1mGHLmTvpxTHR/EgpeLAhF+3vd
	j6KwnrmO1brJyoQU+9u+fizaFkqF+fP0YnxAoGIJsgDw2FEArJQJBH6atT7/KQ/qAupiyCHo/Iz
	RA=
X-Received: by 2002:a05:600c:b8a:b0:477:9b35:3e49 with SMTP id 5b1f17b1804b1-482db4525b7mr34418325e9.3.1769781690003;
        Fri, 30 Jan 2026 06:01:30 -0800 (PST)
Message-ID: <3743c709-90bf-4a4f-90b2-04935881436b@suse.com>
Date: Fri, 30 Jan 2026 15:01:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: allow ->write_msr() to distinguish origins of
 writes
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <7987f1fc-5b5e-40c6-866e-ac332097c635@suse.com>
 <aXyBT-HOBxZQHeFY@Mac.lan>
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
In-Reply-To: <aXyBT-HOBxZQHeFY@Mac.lan>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,citrix.com:email];
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
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C3440BB715
X-Rspamd-Action: no action

On 30.01.2026 11:00, Roger Pau Monné wrote:
> On Tue, Jan 27, 2026 at 11:21:06AM +0100, Jan Beulich wrote:
>> Only explicit writes are subject to e.g. the checking of the MSR intercept
>> bitmap, which extends to VM-event's hvm_monitor_msr(). Indicate, by way of
>> a new boolean parameter, to the hook functions which variant it is.
>>
>> Fixes: 6eb43fcf8a0b ("x86emul: support SWAPGS")
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> ---
>> Later, in particular for nested, ->read_msr() may need to gain a similar
>> parameter.
>>
>> Prior to nested making use of it, the new parameter is effectively dead
>> code with VM_EVENT=n. If we accepted Misra rule 2.2, something would
>> likely need doing about this.
> 
> Hm, yes, it propagates into hvm_msr_write_intercept() which then turns
> into `if ( may_defer && false )` in the VM_EVENT=n.  But then you
> could say the same about the code inside the if block above for the
> VM_EVENT=n, it's also effectively unreachable code.

Unreachable and dead code are different things to Misra, though. It is my
understanding that we deliberately permit constructs reducing to "if (0)"
in certain configurations, relying on DCE: There's then no generated code
for the construct, and hence nothing that cannot be reached. The
situation is different for a parameter that has no use: Its removal (in
the specific configuration) wouldn't alter the behavior. Hence the
parameter and all arguments passed for it are "dead".

>> @@ -2427,9 +2428,10 @@ static int cf_check hvmemul_read_msr(
>>  static int cf_check hvmemul_write_msr(
>>      unsigned int reg,
>>      uint64_t val,
>> -    struct x86_emulate_ctxt *ctxt)
>> +    struct x86_emulate_ctxt *ctxt,
>> +    bool explicit)
>>  {
>> -    int rc = hvm_msr_write_intercept(reg, val, true);
>> +    int rc = hvm_msr_write_intercept(reg, val, explicit);
> 
> I've wondered whether we also want to rename the parameter of
> hvm_msr_write_intercept() into something different than may_defer.  It
> feels weird to translate a parameter that denotes an explicit MSR
> access into one that signals whether it's fine to defer the operation
> or not.

I did think the same, just that - considering all use sites - I couldn't
even come close to thinking of some sensible new name.

Jan

