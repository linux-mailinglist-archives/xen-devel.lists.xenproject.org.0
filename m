Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJ30M7KD6GkNLQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 10:15:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC0E443527
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 10:15:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289962.1569619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFSk1-0000D8-SG; Wed, 22 Apr 2026 08:15:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289962.1569619; Wed, 22 Apr 2026 08:15:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFSk1-00009q-PV; Wed, 22 Apr 2026 08:15:25 +0000
Received: by outflank-mailman (input) for mailman id 1289962;
 Wed, 22 Apr 2026 08:15:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wFSjz-00009j-Ta
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 08:15:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFSjy-006VIK-RT
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 10:15:22 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e88396-e002-0a2a0a5209dd-0a2a450ad710-2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 10:15:22 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e8839a-56b3-0a2a450a0019-d155dd35d498-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 10:15:22 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-43cfbd17589so4011213f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 01:15:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e46898sm45663054f8f.27.2026.04.22.01.15.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 01:15:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1776845722; x=1777450522; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VWPCivG1FlUDJ/3rHdEGYd3HI1iN1xWTyaPCQgaTcSs=;
        b=ZaaIYt2MgW1IRq5IedErOERsu+p9cOrzTJeG1PA7pZSI1Y1vXCWX17Xp/EXDqQ840e
         x0C5pEPVmOhxo63OBjLhzH3aNaX8ERUOFpYMqJu3w2Z9gdBI9C4aN2tCpHEwuP+Xi06U
         IRzJibCZgzakdSP/xe9H3d40O9PCrusS6sGob45FxPgHSZypFqJVlrLsyNqyfQa/HO8i
         ZnqTKm//PsLMGcx7xlWa7/i6Ew1LLM2KzCQY2fj8DO3SqP60BL9XHprVyMFKuDI+/Smz
         XI6TYSlgupJq5aW4V9xsps0E+b/C4OvSD0SXqT667doLFK2y62ivBiMU4FBkif2TyKIX
         x0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776845722; x=1777450522;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWPCivG1FlUDJ/3rHdEGYd3HI1iN1xWTyaPCQgaTcSs=;
        b=KOsqAtCczadzW2fKpsbbKwC5821vu1h6pp4j0CIehLd+0hLOiVykAz6HJzqnzpcm5N
         UgIWji+XyWtipsPXjYTWQ1+Ge2Ky2mM8+s3K4NFlGii+UveDSjomkAeXw7qaMXxRZEHh
         +K0vmeW7RdL8jvmp3ty/vIjYrNh16nS7W4gnTTGloTsFt1KjupB/oJ3G+sf2ehdWnbSd
         6Rrzfcp5wF9ajQo5EydV6oo0tXYiNSMptIY0FU5T4u5depAPZowJi9gISOMK15A3Rio3
         0YUv2az/EO3nmEW6tSLYilUNQUpn+G0oj//AwPvYLK3Q9umLPbtIxcspabjrMWZ6AMvE
         nMNw==
X-Forwarded-Encrypted: i=1; AFNElJ+BIL6vwg9WiP/hrUtihUx68RrNbyBxztPWSpFGzNo0p15VmHAAV5NsuxwDoeJWEXSIZA4fj3Bnk04=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3Y4PbwF6U4C/z9C1l0bQoVienPFRz9ia2WJ0h2oN8eYKukFFf
	ATNcm/7m3tXNjh5FHgOMS6Y1Qb2MjPmZJA2R1NJY9uIzzOnZnakf0Zatt/XAnHAdbw==
X-Gm-Gg: AeBDieuSYqZC52yxVPpLIfNd1W4k7NWnvmNcmf2lJRzmsyOo0noEkTK9rG3s/9eVEaN
	a5UIlg0tPGFagGNvs29jQCj1rfhe5vYynrwdWJN1M5XXnKlgk34X8HQsUuS+1GbZODG88nOO8Hc
	69dqBJA40PDD6P8mSTBNZksQn5Rt31LAn30iiei5Y6NsYBVDewaDnU7sGyt6wpVXNPKRiCR2AjJ
	twvumh9m68bQKPuTbprkDHtO+/t4jGxhM0ox1BRiSspDALTsV7wN7VnEHDqbORG1pNnzOz3F37d
	tHaEbrme5o9reB6rKtCHpy3DzERIp2r18k8rMygl3z+0RbllNQF8p82hGP6KHncaWMBPW0mILDL
	4Z/jmSme8ZTPSY0S9UI94rN8OZzYcGtXOt4pEjGbiqIEMSqhR1arIwp6d6X9B4d082WHJCkySBd
	uZQkn3of5jiKaIBYSic0ziTrsoPolTEIunM6r8nUl2ILvOO5ugqgwi9A4HGzHPC0zw8MlGAQQBQ
	DzkJCPThy/3PSe2qu2f8WY5tw==
X-Received: by 2002:a05:600c:4707:b0:488:bfc3:efc with SMTP id 5b1f17b1804b1-488fb6e8eb5mr306756625e9.0.1776845721722;
        Wed, 22 Apr 2026 01:15:21 -0700 (PDT)
Message-ID: <6c86f2b0-381c-4c28-8c55-7dddc971fcae@suse.com>
Date: Wed, 22 Apr 2026 10:15:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/vmx: Avoid pausing on HVM_PARAM_IDENT_PT in
 additional cases
To: Teddy Astie <teddy.astie@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <10315bf1a012edf4821f7386b3142e56b6c23e34.1776332054.git.teddy.astie@vates.tech>
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
In-Reply-To: <10315bf1a012edf4821f7386b3142e56b6c23e34.1776332054.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1776845722-4596E8B7-A38C37F6/0/0
X-purgate-type: clean
X-purgate-size: 1511
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 3FC0E443527
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16.04.2026 11:36, Teddy Astie wrote:
> When settings HVM_PARAM_IDENT_PT, skip domain pausing when :
> - there is no vcpu
> - unrestricted guest capability is used
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> v2:
>  - rebased patches with staging

The main open issue, however, is that Andrew didn't indicate yet whether the
concern he raised on v1 was addressed. I can't very well ack the change with
a pending objection (and we still haven't settled on how to deal with
effectively abandoned ones, i.e. when one was responded to but the response
was never acknowledged).

And then surely you could have noticed yourself that ...

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -4237,11 +4237,13 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
>              rc = -EINVAL;
>          break;
>      case HVM_PARAM_IDENT_PT:
> +        v = domain_vcpu(d, 0);
> +
>          /*
>           * Only actually required for VT-x lacking unrestricted_guest
>           * capabilities.  Short circuit the pause if possible.
>           */
> -        if ( paging_mode_shadow(d) || !using_vmx() )
> +        if ( paging_mode_shadow(d) || !using_vmx() || !v || vmx_unrestricted_guest(v)  )

... this line is now too long, and there's a stray blank being added ahead
of the final closing parenthesis.

>          {
>              d->arch.hvm.params[index] = value;

Tangential: We don't need this, do we?

Jan

