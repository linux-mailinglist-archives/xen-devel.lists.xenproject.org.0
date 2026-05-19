Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yInKEHcPDGqJVAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 09:21:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A58CA578F13
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 09:21:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312454.1582546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPElT-0002DI-Hs; Tue, 19 May 2026 07:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312454.1582546; Tue, 19 May 2026 07:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPElT-0002CM-CP; Tue, 19 May 2026 07:21:19 +0000
Received: by outflank-mailman (input) for mailman id 1312454;
 Tue, 19 May 2026 07:21:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPElR-0002CC-Um
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 07:21:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPElR-00BOEf-Ac
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 09:21:17 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c0f62-bab6-0a2a0a5309dd-0a2a45099b7e-44
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 09:21:17 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c0f6d-2497-0a2a45090019-d155802aa561-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 09:21:17 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48a3e9862f0so18089605e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 00:21:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe53804aesm289881545e9.15.2026.05.19.00.21.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 00:21:16 -0700 (PDT)
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
        d=suse.com; s=google; t=1779175276; x=1779780076; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m90ntWzG5kgyHuikzIndBiREKwCzLhOdbUjtNerME8A=;
        b=Cau8jRedBTUWkvKEfHB/Hf+orocAiBWNZcMskB+oD3XD+xd5AIVRW/jcsegSsAEgjB
         GqDOIu0rIXv/xX8IRE6g6JT1gUdnaX354fgrnyDqUmT9ctA6HOfekpjCjDFpKQeCkyLv
         GNkfgJdNw6J7UR+wehonszbsR8hbFO5FqGUlSNekMI0LRS8x/2mWcSNY6TyIuuPg4av1
         orLRhgHkUQ2vXjQTGsDGnITTj3Amy6t5PESTsEyKUSlSLDp7Ge6X8XOY/laXkMQ7wHDG
         08vZrsNaAp9M/DR18sQvYccTEgav+NqhgWKmw4MAhwV6n1PWH4YW1ho2CwCDinVewgxp
         +sYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175277; x=1779780077;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m90ntWzG5kgyHuikzIndBiREKwCzLhOdbUjtNerME8A=;
        b=moTGyrM12lBKMAjuqkZw3QaG+kobD85LgBbiZXv4q3jJXEQ/bCKXWhMgwaGptVzHE2
         HRuK7m9PvPFoh7k9mHobb2+UI7lRLt8QrQsg9R9n+7bun0GfZXl9uavzKPsyML4YJvQc
         78FfxhkTjGDTsNl1Jrd0kfsdA9eQlx2VSu6On5tJIio78Vixv2zTKavURPBloPHo+5a4
         qv7QK4Txed1fHC07CGr9po14ZZUC3qcJDKGzGFEBQKX6JPb7/cBSPXBbbwvJbQ+E0Ayu
         HCULixS14zCNq9b3P5e6bFpgZO5IOHctFkx5vg1NVGWHTsewwtcZaiYdwEQsHsrMnRJk
         /JOA==
X-Forwarded-Encrypted: i=1; AFNElJ/Dosocx/jZ/0KXtDXL4Rp568TTzGInidr6K0YHUSIM/LDUkIFxUcF+ewPDTx6s/DeA1Pop94rvOUs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBXmkZHm1Hp7sOrsjmPRMoIodliKjng4BxregJDdzovJPiT04x
	+VY11sDJAF6tTjP2FOcpQqbUQAdh4l6T4yL5aY5q8xxYgdgJvTG9Q8vjui94JikpgA==
X-Gm-Gg: Acq92OGNmb4g8gfXigeBM4e+Tx9nMgW8p5x0218OeQ6pIu1af85Dg26W+x9nl4qGdv/
	ny9efeeq7bXczv0QrYeHZiEUDyoZnivv0HnrvZi3yBPfelQD+P+Q+dtGeho29IIpAMxDp9XLoGl
	AL3dwwJlesEdNmPWCHPkT0xoUjRMF6WHnRf5SY36Gs1fN+b5o+esLp+SEscqMfWYpU2njnBPzkw
	DHMqhyX07ottOzPvn8GIA7SXA6YmUc43lSxuCi4mv4bNtUn7Hr7hpBPLH8YSlr5URfPxADR1RfQ
	XE1sd2S5qfip+oV6kmQ8GAEHMO1rKbcQXyes2intxUX0eCODrJ85+MTEpR1m6sqblOIZTTTwWpM
	1TdUgTKT+NenvNBX8mDCXwWkiXiFbFcNJYGtMwM/00LLWjchCWmCqy0ILzcELLp2SghG7mx1yiO
	r8/Q6/5Pzj911Ytr2bfgN+rJe8mXmYGYaLuZ0lO4p1Nh/eYmB8771qLd0fsAvQda4whW3pmTL5T
	iezegZCae19FJa+paBSzipaUw==
X-Received: by 2002:a05:600c:8485:b0:48a:5339:a46 with SMTP id 5b1f17b1804b1-48fe537fb70mr3431315e9.9.1779175276600;
        Tue, 19 May 2026 00:21:16 -0700 (PDT)
Message-ID: <0686cb4d-3020-4c2e-9231-f1a28c714c0c@suse.com>
Date: Tue, 19 May 2026 09:21:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/irq: Return -EEXIST from map_domain_pirq()
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260519001559.28129-1-jason.andryuk@amd.com>
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
In-Reply-To: <20260519001559.28129-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1779175277-40D67A53-29D3986F/0/0
X-purgate-type: clean
X-purgate-size: 1840
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
X-Rspamd-Queue-Id: A58CA578F13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.05.2026 02:15, Jason Andryuk wrote:
> commit bfc341a65cfb ("x86: Make the hypercall PHYSDEVOP_alloc_irq_vector
> hypercall dummy.") modified map_domain_pirq() to return 0 when an irq or
> pirq is already mapped, when it previously returned -EINVAL.  This
> occured when moving map_domain_pirq()'s call from
> PHYSDEVOP_alloc_irq_vector into PHYSDEVOP_apic_write.
> 
> However, this means other callers cannot detect when a pirq or irq is
> already mapped.  Since success is returned but the pirq is not
> connected, it will never fire.
> 
> Modify map_domain_pirq() to return -EEXIST.  -EINVAL is already returned
> elsewhere in map_domain_pirq(), so -EEXIST allows identifying this case.
> With that, squash -EEXIST in ioapic_guest_write() so the behavior does not
> change.

What about the function's uses from allocate_and_map_[gm]si_pirq()? Don't they
then also need to cope with getting back -EEXIST to keep externally visible
behavior unaltered? Else those cases want discussing in the description, I
suppose.

> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> I'm not sure whether or not this warrants a Fixes.  Nothing in tree
> today is broken, so I did not add one.

In which case this then also isn't 4.22 material, I guess?

> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -2315,6 +2315,8 @@ int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 val)
>          ret = map_domain_pirq(hardware_domain, pirq, irq,
>                                MAP_PIRQ_TYPE_GSI, NULL);
>          write_unlock(&hardware_domain->event_lock);
> +        if ( ret == -EEXIST )
> +            ret = 0;
>          if ( ret < 0 )
>              return ret;

Slightly shorter

        if ( ret < 0 && ret != -EEXIST )
            return ret;

?

Jan

