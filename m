Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECh4J3a++Gnh0AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 17:42:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB224C0D4D
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 17:42:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300075.1574641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJvQf-0003tw-0k; Mon, 04 May 2026 15:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300075.1574641; Mon, 04 May 2026 15:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJvQe-0003rp-UF; Mon, 04 May 2026 15:41:52 +0000
Received: by outflank-mailman (input) for mailman id 1300075;
 Mon, 04 May 2026 15:41:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJvQd-0003rQ-Nh
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 15:41:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJvQc-006Xuq-VQ
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 17:41:50 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8be21-e002-0a2a0a5209dd-0a2a4509b524-48
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 17:41:50 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8be3e-2497-0a2a45090019-d155802aada0-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 17:41:50 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso30193525e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 08:41:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a81ed69fasm397905975e9.3.2026.05.04.08.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 08:41:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1777909310; x=1778514110; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=00PbRVofBXLJIarDJGGwrlLIELLVE6trVcwdeljioX4=;
        b=RK8KYWE6jHGVJla6L6uiN5P11XnS1n3uCIHt0sVNfXWchvm3R5EBNRJauKkJ8TZ073
         utm0h5LoOCe2CAPVZwd3E4eSsRYVhkXiNIAInDgHtemkEClxNBu6xRPCCSjM+dKRl+6l
         K/bPjb+Snu5hJTiHJWfV4In9jdqv+Bs/AYxpfFxAv289VdsQDVeWAZ7cAcXObtlE2Elg
         DMEhFi9rFkOtv6MJpI1DuVqoIhEuS1j5SwOnmMIciW8rCOj0uFHWikk+Yytcjv99WDsP
         3wxmiUEJdXbchp7aMyIEHJrxxgge8t2qqZMoqGIjjzX7LFWxZIsgKi3udZ43obR/bqbk
         W0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777909310; x=1778514110;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00PbRVofBXLJIarDJGGwrlLIELLVE6trVcwdeljioX4=;
        b=hNvp1dxrCV6DKzqw1itOYkpxjamOeCG6vk5NTV9A1m1M7FemsN9izOrK+9D83Uadwv
         YMwXq/0+3HwXykgCM4lnGBC+nuEej2duoV/3g5BSvcwnKgDz9e/VwctASKi9Jj5qj6oO
         i8JMhIkrcaldscK3PmhAwP5J5l1VdTi5pfYPilhZ/ykU9gwV9Ui6BPYrFpI2SqOXbk2R
         C2GLKth+gQzNW1RyOkbUM4nutjFHoiLgd5S72bv3yanlqLnJGISotrS67FGDe22Fjp00
         Hem0UeGh2rMbLABGDuRg/1S7h/lhyBmDXOcQNHuYbQRsc7rD6hhqg/K6hrTjL/8+BW2u
         LlDg==
X-Forwarded-Encrypted: i=1; AFNElJ8SbwiD6KNJzxzZa0Y7TnMp5eEQdMYbZSBhkvvYXKnU/e9aNtPGDMCQRny+53rQzh7dPQJV0jADxfw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5n6jFNO8tZoQBhgEjGm2/zteLjbilBUpggFtx385g6eTu4Wzp
	Ws1HffRyLAQtC40krlesabrsXG0AWT7Utt8aisNpgz0lUbf9foUwZ79wqcY3xYwAVg==
X-Gm-Gg: AeBDietLfp76Ld99eYRJwpouOod/R2lr0Yz1mMchZ/U3c9g8A2GlBzdoorSBisoGHIk
	x94fqLPlXHp2tzNrgBftUibbAQp50eZ6pOkt0Pjc+upjJA1yiaUTK//vaYA3SaSQpDMzxOyHhP3
	sMC83xgzHXM3egMrNfCdyGSSaudn9b+Dw7PSlT3gNJmpe4oXmqzFiPU+kpwUvawPLJI0Ew9gO9m
	Ij1+Nc5sYbCXPJDzVQuz1YhDsYGSB3n5ftHSNZNJR86/4/DrToWTWPGcJlEYEBmIY2FmC3yqNZ6
	NsqtfKLkmvLhLrLo76RKwfp/FbHjPHfhagJoUIUf9GJN4SkWUstgdwTkcWy5WKnvTkIdJuZOqTe
	NxEohF2ZMwSV4nirQ8L4I37yGpOaYCJ/SpQNlLjPXqkSzw8IVl/A2FdsLGb9DnF1JTS5/bmQYQ1
	Og5wUVDERZrFCICt6nXjFyCWFOyL3DNGDQfY0vjfZSanejWPSd0ZKvljAKxA5oC+ZWN4uYo+Jml
	dSbERM0rZQ=
X-Received: by 2002:a05:600c:45c5:b0:488:a916:14a8 with SMTP id 5b1f17b1804b1-48a98871959mr168578835e9.10.1777909309920;
        Mon, 04 May 2026 08:41:49 -0700 (PDT)
Message-ID: <13283cac-7a52-4db2-8542-056248149fa7@suse.com>
Date: Mon, 4 May 2026 17:41:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/7] vmx: Introduce vcpu single context VPID
 invalidation
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1776259594.git.teddy.astie@vates.tech>
 <50c96e2306538eb7cd28ddfcb21163c628fae0a4.1776259594.git.teddy.astie@vates.tech>
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
In-Reply-To: <50c96e2306538eb7cd28ddfcb21163c628fae0a4.1776259594.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1777909310-4236CA53-5356D623/0/0
X-purgate-type: clean
X-purgate-size: 1725
X-Rspamd-Queue-Id: 0BB224C0D4D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
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

On 15.04.2026 15:32, Teddy Astie wrote:
> Introduce vpid_sync_vcpu_context to do a single-context invalidation
> on the vpid attached to the vcpu as a alternative to per-gva and all-context
> invlidations.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
>  xen/arch/x86/include/asm/hvm/vmx/vmx.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> index da04752e17..3524cb3536 100644
> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> @@ -452,6 +452,27 @@ static inline void ept_sync_all(void)
>  
>  void ept_sync_domain(struct p2m_domain *p2m);
>  
> +static inline void vpid_sync_vcpu_context(const struct vcpu *v)
> +{
> +    int type = INVVPID_SINGLE_CONTEXT;
> +
> +    /*
> +     * If single context invalidation is not supported, we escalate to
> +     * use all context invalidation.
> +     */
> +    if ( likely(cpu_has_vmx_vpid_invvpid_single_context) )
> +        goto execute_invvpid;
> +
> +    /*
> +     * If single context invalidation is not supported, we escalate to
> +     * use all context invalidation.
> +     */
> +    type = INVVPID_ALL_CONTEXT;
> +
> +execute_invvpid:
> +    __invvpid(type, v->arch.hvm.n1asid.asid, 0);
> +}

I think this (such) better would be introduced with a user (else the
description wants to say what it's going to be needed for). I further think
that this (such) would better be done without goto (else at the very least
the label wants to conform to ./CODING_STYLE). And finally I think that the
local variable would better be of an unsigned type.

Jan

