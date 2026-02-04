Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEsrDMNSg2mJlQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 15:08:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EB6E6DF6
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 15:08:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220552.1529221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vndX1-00043b-GV; Wed, 04 Feb 2026 14:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220552.1529221; Wed, 04 Feb 2026 14:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vndX1-000421-DC; Wed, 04 Feb 2026 14:06:59 +0000
Received: by outflank-mailman (input) for mailman id 1220552;
 Wed, 04 Feb 2026 14:06:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vndX0-00041v-E4
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 14:06:58 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2e5c3d7-01d2-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 15:06:55 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-482f2599980so41315665e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 06:06:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48310919211sm71367365e9.11.2026.02.04.06.06.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 06:06:53 -0800 (PST)
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
X-Inumbo-ID: c2e5c3d7-01d2-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770214014; x=1770818814; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kAdJKCuMR2VPVKGrUYXATSAIcaDw8lax06lydPETrdo=;
        b=RQO3DdGhUYe2xUr/C0yKXouqcbkiiECm4z639lnRwawFMTtFzkMV1e2vX7zZ1QWDRk
         JsiQPpmn4jP2th+snpwq2iY7H8rKKRRbneVPMwHIOq/L88seuXK57oiKc+5sGXWT5D27
         5fC+mt8t582U+M7QElIdJLMBfFtglfsi8AhI2gl8tNsUoAELxl7wMMhaXX3kebtUQ7MW
         glSjx24nBe6KQDJGyRFa3ZgCWHO/Ag/QQNwgKzEyeKR9yWSGzxD5pa7G6989U33ap+Fn
         lRFTcOrby8Pe94b430sQomxSBC86T+4riJc/dI6lGlc9ZTIJ8pgHfz1QLtLSOHu5AXjG
         jkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770214014; x=1770818814;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAdJKCuMR2VPVKGrUYXATSAIcaDw8lax06lydPETrdo=;
        b=mrN9Y5P5L1F3sDu4t12yCk79queHfQSmeQ5e/WtU5uPmUtFoN3deHH5qnXjeni80QQ
         k2Sjqjp5yg8jZIGxtO2HQpSsDDTWtHfLckfrzdycSQhAh040rXAP9d8lIHRQrmGAEL66
         lNebBAS8QuuYTZwhvmNqidcuQpXqUygtqJ4kHy01ZtDczJnvfwrkc9q7XXntRmR4Idb8
         QifK/pI4Z6JWV5ss4mp7xp/ko8xx3oD3mTGIV0RtAI2X3f/Pqf8VT0VB/sS34iPQ6Htz
         1ROwa2as7MPaG4ECdjV54/tsCWY20Rldpe/BzIMV4glgTbi0BvuNhTWg2o5cWUIej1Fb
         n3Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXtdgYhRzVGV3UmBqhebdzqWQYRPUtdtfDvC85Pz8mEKKERzAyzSymVsA0CJgc4G16TorI3l+FvuFg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwL8fUSAr5R2bdmcoBW9E4TOoH69pVdhO8k9NR1Y965tFSzCBw/
	sih4ftU4pjJlXJceZd3YMGoh5L3UQlxyQPsBThFMI/q2wx+cgHXAbttjJ96f8davUA==
X-Gm-Gg: AZuq6aKWllybqOKWePT3berlAYCgbyILCcf39BL+hj26CR3Mnfd9kLcR70hXusdzAD+
	yEdzvR+F5cnEKrBy6Mwkc8fwBhH4zwzVX0NUOAU4+0th+FrKCD6/3lVgUNQ+9kuM+C6+CC8RC6s
	oaLkf9dcU4h0KZbBGW0MJhNH5gHejD6+ZDfVkRtT65PYIjPsv+fQ/nh7XDeN+lnC25L9MmY0ML4
	VAnoy3vWT1g05SIt1o3OvC7ShzQKX8hulh/Jyk5Vn3F+IiU7A22w6ZSy04SJwxXZJQ3+DsaMZPa
	hKV/0dZ7cxvtavdcgRbgrsn8uJG8LRfrhKpiqyBgMCpLTLtbgRgnnoQUg0HFKGznM4SUx95y3vy
	/pQ7lUV25g6Q+GzU7zWyA4NOL+qFfpf8nQQsZ4gkZRMjM0U6tmyTHLjMuCjDpF5a82W1vT3BQU+
	DPveG7Jpenby69A70jBmWRLRcFj1xYl0Wrm6rKVF64VuVH/8oAqFdBxXsPGeEMaKKppbD79ten7
	kM=
X-Received: by 2002:a05:600c:680a:b0:480:6c75:ddce with SMTP id 5b1f17b1804b1-4830e9a9b17mr43613705e9.33.1770214014364;
        Wed, 04 Feb 2026 06:06:54 -0800 (PST)
Message-ID: <82540f88-ffcd-46a9-9813-ebe42ef0b0ec@suse.com>
Date: Wed, 4 Feb 2026 15:06:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/domain: adjust limitation on shared_info
 allocation below 4G
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260204122553.75711-1-roger.pau@citrix.com>
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
In-Reply-To: <20260204122553.75711-1-roger.pau@citrix.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 81EB6E6DF6
X-Rspamd-Action: no action

On 04.02.2026 13:25, Roger Pau Monne wrote:
> The limitation of shared_info being allocated below 4G to fit in the
> start_info field only applies to 32bit PV guests.  On 64bit PV guests the
> start_info field is 64bits wide.  HVM guests don't use start_info at all.
> 
> Drop the restriction in arch_domain_create() and instead free and
> re-allocate the page from memory below 4G if needed in switch_compat(),
> when the guest is set to run in 32bit PV mode.
> 
> Fixes: 3cadc0469d5c ("x86_64: shared_info must be allocated below 4GB as it is advertised to 32-bit guests via a 32-bit machine address field in start_info.")

The tag is here because there is the (largely theoretical?) possibility for
a system to have no memory at all left below 4Gb, in which case creation of
a PV64 or non-shadow HVM guest would needlessly fail?

> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with two nits:

> --- a/xen/arch/x86/pv/domain.c
> +++ b/xen/arch/x86/pv/domain.c
> @@ -247,6 +247,26 @@ int switch_compat(struct domain *d)
>      d->arch.has_32bit_shinfo = 1;
>      d->arch.pv.is_32bit = true;
>  
> +    /* Check whether the shared_info page needs to be moved below 4G. */
> +    if ( virt_to_maddr(d->shared_info) >> 32 )
> +    {
> +        shared_info_t *prev = d->shared_info;
> +
> +        d->shared_info = alloc_xenheap_pages(0, MEMF_bits(32));
> +        if ( !d->shared_info )
> +        {
> +            d->shared_info = prev;
> +            rc = -ENOMEM;
> +            goto undo_and_fail;
> +        }
> +        put_page(virt_to_page(prev));
> +        clear_page(d->shared_info);
> +        share_xen_page_with_guest(virt_to_page(d->shared_info), d, SHARE_rw);
> +        /* Ensure all references to the old shared_info page are dropped. */

"references to ... page are dropped" reads as if talk was of page references.
vcpu_info_reset() writes out pointers only, though. May I suggest

        /* Ensure all pointers to the old shared_info page are replaced. */

?

> +        for_each_vcpu( d, v )

A common oddity, where my personal take is that only one of two forms are
possible (without ./CODING_STYLE saying anything explicit): Either such a
for_each_... is deemed a (kind-of) keyword (like "for"), then it wants to be

        for_each_vcpu ( d, v )

or it is deemed not to be one, then it wants to be

        for_each_vcpu(d, v)

Jan

