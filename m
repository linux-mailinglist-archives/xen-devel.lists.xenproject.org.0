Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBViM6c2DGqOaAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 12:08:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D7F57BE61
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 12:08:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312711.1582779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPHN6-0004UJ-8A; Tue, 19 May 2026 10:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312711.1582779; Tue, 19 May 2026 10:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPHN6-0004SR-5R; Tue, 19 May 2026 10:08:20 +0000
Received: by outflank-mailman (input) for mailman id 1312711;
 Tue, 19 May 2026 10:08:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPHN4-0004SL-8J
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 10:08:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPHN3-006HbB-GZ
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 12:08:17 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c367a-2eae-0a2a0a5409dd-0a2a4509913e-40
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 12:08:17 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c3691-2497-0a2a45090019-d155dd2ebc18-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 12:08:17 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-43d7e23defbso1869651f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 03:08:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e768c4fsm44830360f8f.8.2026.05.19.03.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 03:08:16 -0700 (PDT)
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
        d=suse.com; s=google; t=1779185297; x=1779790097; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3I66sgPFUWgB/mtoEHwoGGGGjhZKOoP1e5qfUtkd074=;
        b=fl/2LlxV0CBgrI6SfCZ0VvclbV2ui1R3F0gSIIFN0R2ePQzeObFyN9ncbpXl7q1zZC
         B+7gsXs3QM4Gw1pEKRZ3cqr3ZuKsAondFUkAewPlzuGFl9cEZNmqyWABtTk2gw5mxOXr
         Z8S97jydRlPt6liGl5SGNPTRqrqrgdLJ/dBW5ygbb5iNKz5KT/gIR7Fhf4x3tbvfo8zO
         6wbYCfRTBiUOcHkuJXKjnvQKkDYevQxv/pztQGPuuT7mlAagBJLft4VhO7LGdwlUhI9W
         ycM7cw6ff/Af6mKNxig2HiiCB8KO4Oh1AcnNrezHhbkUXUiQSL+Q+/YHbam/I9aI20/7
         xprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779185297; x=1779790097;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3I66sgPFUWgB/mtoEHwoGGGGjhZKOoP1e5qfUtkd074=;
        b=EuBzuF+g8nsSp8tfh+971Cd8h+t4nM6F5PsDeUqThg+DaLHGgK6ihOmbDZKRULm98r
         6B7YPls7TVrja9Gpjvp7DRH0DcaAcuhepjykG4bKRFkTKDdcbYYINNL+2RpusPW0Egh2
         Yfi2k7QmJBexNnQ39nU1gZ6ke0+40DAHVlStR8iqtqp7D+jf+T7XG12TKi+YiuvDbk7c
         T0T+i8x9k3GJJZjOJKKOGi/2nNiHfskhVuYdCHHxYoAdRu6IVENFLaRpvYbjU0LWTW0Q
         kH/57ZHsXlaWmFJqYn/f8vaMP5+WSboZReUj6JpVcL+cF7xgl+T6aL1QVLbbT7ehQv10
         HjPA==
X-Forwarded-Encrypted: i=1; AFNElJ+mo2u3sXbe2HAs4Pl0VNCVu6z4wHwy6xLUQ2zfAnm+Hf4n+ayl0OuVbYeod5wtLuIMCDD12Ml/yDA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQYmPtuG5EUxfHp6j4NbBDjqGCDVcCZ9iKch/RiMhIssO6i4f/
	P9+DJDEOTaRVwV/hpR36LezzRvzHa4rCd8yUc+dlaDUTSBqkDMQaZvOtDaVBAzMyPw==
X-Gm-Gg: Acq92OF6XUGljESoir9Q1i3NUAc6UP/0q6vZTLHdz/l70KfH9YoPqaS20dPJnTDNkDo
	BLzMznGOCzJhTcjMcjexlkm5MI7c6ifk0rAldZJPfJrQ9tGt7PsdvM4MjKORQcNemWDtp0XC9VY
	/wwyspg1NkGuNdxwfTVpNvj5LYOWonPN9KQt/85Dz+ZB4UhRaJZNmiXj+hJXFT+gRMR0jtudTgX
	YGfm2oP161TSOeKXOS3Mghl8J68PIwn3ymMFFRu+WzMR1W/9lGqG5EeEC79pXHbe7jMCOYipnnz
	mgqoKvRpiLndNrtkvhfJqxcarDNbdmryYoBN6EDKsMeF0uyelYJawYAiLWhnbWYXRybMLhXMaB/
	T9qiRdDznu7+vx+jw1asp6gJhkwJUIz8s92TcUOGuCP2jI7a1wJia6RrECkq7YkOxOoubmZLcvl
	C4Sx+arNYVYyaTP8siuc9jYL/xmAGWcX/zqJp++4AjHRrssgTRRMrvcBsNxVZTJaJHNsmsk8u/2
	LoFuvlyV2ru40pbyf1wUVam7Q==
X-Received: by 2002:a05:6000:22c5:b0:43d:6f0f:32fe with SMTP id ffacd0b85a97d-45e5c6049acmr29354250f8f.31.1779185296479;
        Tue, 19 May 2026 03:08:16 -0700 (PDT)
Message-ID: <882ff7e2-077a-4af1-8e0c-4a0e83d8c2b8@suse.com>
Date: Tue, 19 May 2026 12:08:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 3/7] x86/emul: Separate out instruction completion
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
 <20260518131404.3716969-4-ross.lagerwall@citrix.com>
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
In-Reply-To: <20260518131404.3716969-4-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1779185297-8AB8EA53-BDC9F6AE/0/0
X-purgate-type: clean
X-purgate-size: 1741
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 48D7F57BE61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18.05.2026 15:14, Ross Lagerwall wrote:
> To support merging the emulated instruction and VMEXIT paths, split out
> instruction completion from the core x86 emulation so it can be called
> separately.

You don't mean to use a full-fledged struct x86_emulate_ctxt on the VMEXIT
paths, do you?

> @@ -1265,8 +1281,6 @@ x86_emulate(
>      uint8_t b, d, *opc = NULL;
>      unsigned int first_byte = 0, elem_bytes, insn_bytes = 0;
>      uint64_t op_mask = ~0ULL;
> -    bool singlestep = (_regs.eflags & X86_EFLAGS_TF) &&
> -	    !is_branch_step(ctxt, ops);

Nit: Yes, indentation was screwed here. Please ...

> @@ -1280,6 +1294,9 @@ x86_emulate(
>  
>      init_context(ctxt);
>  
> +    ctxt->singlestep = (_regs.eflags & X86_EFLAGS_TF) &&
> +	    !is_branch_step(ctxt, ops);

... correct such when moving code around.

> @@ -8347,17 +8364,6 @@ x86_emulate(
>      put_fpu(fpu_type, false, state, ctxt, ops);
>      fpu_type = X86EMUL_FPU_none;
>  
> -    /* Zero the upper 32 bits of %rip if not in 64-bit mode. */
> -    if ( !mode_64bit() )
> -        _regs.r(ip) = (uint32_t)_regs.r(ip);

While, because you have the new helper update ctxt->regs, the removal of
this update of _regs looks technically okay, ...

> -    /* Should a singlestep #DB be raised? */
> -    if ( rc == X86EMUL_OKAY && singlestep && !ctxt->retire.mov_ss )
> -    {
> -        ctxt->retire.singlestep = true;
> -        ctxt->retire.sti = false;
> -    }
> -
>      if ( rc != X86EMUL_DONE )
>          *ctxt->regs = _regs;

... further uses of _regs here (not this one, but in general) would be at
risk of no longer working as expected (yet only in a corner case, so
possibly not covered by testing).

Jan

