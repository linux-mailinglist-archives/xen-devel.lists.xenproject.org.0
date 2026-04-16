Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMcQKwPI4Gn0lwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 13:29:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1629240D68C
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 13:29:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283232.1565515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDKtH-0003yu-LP; Thu, 16 Apr 2026 11:28:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283232.1565515; Thu, 16 Apr 2026 11:28:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDKtH-0003w3-Im; Thu, 16 Apr 2026 11:28:11 +0000
Received: by outflank-mailman (input) for mailman id 1283232;
 Thu, 16 Apr 2026 11:28:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDKtF-0003vx-UW
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 11:28:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDKtF-00GUzC-BR
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 13:28:09 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0c7c6-2eae-0a2a0a5409dd-0a2a450b8dc4-20
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 13:28:09 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0c7c9-212f-0a2a450b0019-d1558033f048-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 13:28:09 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-488d2079582so73450555e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 04:28:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f0e9a72csm42587255e9.16.2026.04.16.04.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 04:28:08 -0700 (PDT)
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
        d=suse.com; s=google; t=1776338889; x=1776943689; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w1dvHbggISbXY1daKgxew8q+wBdaRi4gHqSc4ZF0+Lg=;
        b=A9JDS8p6et+fvDe8DEmwuuWWplPQVn+3fbFmUygTL/HiNgyBHOIEL1drTXhXv+CAij
         lQQ6mL2l0lVLhyPuLUVRAmklqt4aEAPiDp46EVFtQPpyFvQXk8IA1l5QqtsC2nqYRO4Z
         b4Od7p8CfRi6kZNUYE0pWi3joPAxLLeJs2VKo5E1z9CweabgdMuPMoa6K/QzuegcQXrW
         ekvhX0SM8wKINzGGU0AF+yyMv2F2zqZ/snIu6M21aR3k2HJ3Nkt0fUsWuqnuz+EUOjvT
         JsBmNjBot5SjEBv3zB717TfPG/YQUl5eakbULnOGkjIXkZ8fIbCkGT80Qf5lYMuYgrT6
         k7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776338889; x=1776943689;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1dvHbggISbXY1daKgxew8q+wBdaRi4gHqSc4ZF0+Lg=;
        b=BC9ZHz2srZcq4YtOIvpf6KaYHCOaqxrpnxUjwa900Au3jcHwuLzkTjrbX/wbTboC+A
         qnIgYFEaAa9Bq+Ck/18By3JYc2JhrJEMqva9zyl0IxFccnilDbOZvWMWNN1zmi86ox+u
         ML/aY4VEeCQDoo2/3OQpNb5Zz6rNHjv9wy2//EoKVzGoNJUV2gkzJATvu8Uasf+B+nSm
         qtA4xk08f/T2YToHV/fL6H6tS8NrF8q+4ste38stsSQ8vPFTn4WyaVC3ReHaJhe0B9zl
         lCSfszIpcGvt/4UI9u27v72oCiQvEgK2HpnA7KRwtSByhB8qaSdKINZI6kwPjjE2fQfC
         0zxA==
X-Forwarded-Encrypted: i=1; AFNElJ9QPuzU2IocFuzg/cQOr0TM+kn/nkFrsIRGTTcs5JTecT7iB9MHKj+KLxbcYB6M6CsqQ7XVMDpAlnI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxUn6OxuVJB5DMA92RNI32AWZ7x9bDvf/+Cidin+DZCYTtTc+f
	rEoHCQRY4HjJTcDzqR/a5HRNZcPT4A1pqZrmjZzqGglCbJx1z16t2/W2eJddVQL8Eg==
X-Gm-Gg: AeBDieuqd2lWxKQUK4M/pqM/Plg6/iYEn8wT4N5Jg3fXjyrf716svCjX3lM6f5FM+3q
	9yfeok6rbpc1QFR6/mI6w07HxPlmGGZ3i2j4grPPX7OAG445YxiAlCfknCVO3uiWqw6bHwKCEFT
	bsT+/3BE7Eb3JQaSxCRL1yFE+PHQMRhGjlGTQaU3mKZinlCDS1MP+qXZt0Cz56rYkTUA/GPQKNq
	PXPyOXhTYUe7uGbd7csjwYJZrfJCIfngylUVoYVs8faGihvaQDtzG9ehMmBCLH7Z+o90kU0kdJy
	txuftoGd0uNLkyYLVLcygP+tJFVN9owwHhNWhI2HDSFLqkBLmvVIRuuDPWxGdrdnXj7yUPJYtJB
	8srr4nx8QljKcIg3CeflJyrX6KmfLNo3ARlmTM0144Ywx92NwGQYTPzo+c5DEQE3jjJZDG8ix6G
	Jnb0DDn7Z6xq7pILkzC53YT/9Js7XPg14VBe04Q6Fptmyhd90PcrQGkpnXfoQUG44WrKyOgQ6DW
	Q+jX4QZ0uWVduZeSt6ITU65bQ==
X-Received: by 2002:a05:600c:a306:b0:480:20f1:7aa6 with SMTP id 5b1f17b1804b1-488d68607e8mr251217955e9.21.1776338888579;
        Thu, 16 Apr 2026 04:28:08 -0700 (PDT)
Message-ID: <f424bf3a-0113-4c66-b165-8dae82817f24@suse.com>
Date: Thu, 16 Apr 2026 13:28:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/time: use native TSC scaling factors when TSC is
 not scaled
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260414103327.7420-1-roger.pau@citrix.com>
 <20260414103327.7420-2-roger.pau@citrix.com>
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
In-Reply-To: <20260414103327.7420-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1776338889-7D165F3B-2FF5CC75/0/0
X-purgate-type: clean
X-purgate-size: 3325
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 1629240D68C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 14.04.2026 12:33, Roger Pau Monne wrote:
> When running HVM guest in native TSC mode avoid using the recalculated vTSC
> scaling factors based on the cpu_khz value.  Using the kHz based frequency
> leads to the TSC scaling values possibly not being the same as the ones
> used by the per CPU cpu_time->tsc_scale field, which introduces skew
> between the guest and Xen's calculations of the system time.
> 
> On a 2gHz system, where the frequency is possibly detected as 1999999999Hz
> (note this is a worse-case scenario), the cpu_khz variable will be set to
> 1999999kHz, and hence 999Hz cycles will be not accounted for per second.
> Over a second (the time synchronization period), this leads to a skew of:
> 
> cycles * 1 / (Hz freq) = 999 / 1999999999 = 499,5ns
> 
> So far this has gone unnoticed because the time synchronization rendezvous
> forces the update of the tsc_timestamp and system_time fields in the vCPU
> time info area, and hence the skew only accumulates up to the rendezvous
> period.  Attempting to remove the rendezvous causes the skew to grow
> unbounded.
> 
> Fix by using the native TSC scaling values (as used by Xen) when the guest
> TSC is not scaled.
> 
> Fixes: eab8a90be723 ("x86/time: scale host TSC in pvclock properly")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> I'm worried about the usage of cpu_khz beyond simple printing it for
> informational purposes.  Overall I think it would be safer to store the
> frequency in Hz, as to avoid losing the least significant digits.
> 
> In any case, that's a different change.

I'm not quite sure - improving accuracy is of course a good thing, but will
we ever be able to do any such calculations error free, when already the
detected frequency isn't exactly precise?

> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1710,17 +1710,25 @@ static void collect_time_info(const struct vcpu *v,
>      else
>      {
>          if ( is_hvm_domain(d) && hvm_tsc_scaling_supported )
> -        {
>              tsc_stamp            = hvm_scale_tsc(d, t->stamp.local_tsc);

This is a potentially imprecise calculation. How likely is it that its result
will indeed ...

> -            u->tsc_to_system_mul = d->arch.vtsc_to_ns.mul_frac;
> -            u->tsc_shift         = d->arch.vtsc_to_ns.shift;
> -        }
>          else
> -        {
>              tsc_stamp            = t->stamp.local_tsc;
> +
> +        /*
> +         * HVM guests using the native TSC ratio should use the same per-CPU
> +         * scaling factors as Xen.  This ensures time keeping is always in sync
> +         * between Xen and the guest.
> +         */
> +        if ( tsc_stamp == t->stamp.local_tsc )

... exactly match t->stamp.local_tsc? Don't we possibly need a (small) error
margin? (In which case of course the next question would be: How to establish
such a margin?)

Jan

> +        {
>              u->tsc_to_system_mul = t->tsc_scale.mul_frac;
>              u->tsc_shift         = t->tsc_scale.shift;
>          }
> +        else
> +        {
> +            u->tsc_to_system_mul = d->arch.vtsc_to_ns.mul_frac;
> +            u->tsc_shift         = d->arch.vtsc_to_ns.shift;
> +        }
>      }
>  
>      u->tsc_timestamp = tsc_stamp;


