Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEgGCrnD6Gm9PwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 14:48:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDDD4462BC
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 14:48:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290490.1570067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFX0V-0000kM-5U; Wed, 22 Apr 2026 12:48:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290490.1570067; Wed, 22 Apr 2026 12:48:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFX0V-0000he-2l; Wed, 22 Apr 2026 12:48:43 +0000
Received: by outflank-mailman (input) for mailman id 1290490;
 Wed, 22 Apr 2026 12:48:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wFX0T-0000hY-Lv
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 12:48:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFX0T-000aYZ-2h
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 14:48:41 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e8c3a6-bab6-0a2a0a5309dd-0a2a4508882a-8
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 14:48:40 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e8c3a8-63b5-0a2a45080019-d1558033cc7a-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 14:48:40 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-48984d29fe3so45381575e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 05:48:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cb1176sm46976861f8f.3.2026.04.22.05.48.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 05:48:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1776862120; x=1777466920; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tSuTHtUS0dWcOOAJWlPom7MnGrM9QcHnLmLoUOPjDik=;
        b=O5+NKk3Yjqx1XlQ7eBm06oPzXWZh5qssZiBgjGK0fhXeSZSCxuMmiLfSNW/n3h1liY
         0EqIRsxxsAtD9XR9mutJmbw43ysF/kJUP98RVhtwWfwTsqkkn1oxjMN8yPLbcYdLkuJU
         OMCstBDIIR1OSlLbOOjA1gEfXix98iYdLJk15mtUKiCXBiNNYAq5MM00GGbPxOMrjq0n
         C0z8lQwOW3GVPN3vyiAT4YMTcuFVUj76C77YaNAruGDjDlH/dRS7Z2tdGbEqp2AGZIOJ
         bZx0BOjV9tGlKyRlnNX0Wb9y8cfYq6qg8/njKHd3mTe2clQ703IoR33+NPVNHY9I0puY
         E2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776862120; x=1777466920;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tSuTHtUS0dWcOOAJWlPom7MnGrM9QcHnLmLoUOPjDik=;
        b=HwVRqQ0tksexXC1lAu0KRGuxw9I2Aw6tK+EsNL0pj1vb6br+hnbFBCDu+/C9xL/w8z
         ze4JHILX6XbihfBrsOD4H4r4Z+2Rt1ael/GPKqZ3A0y1DXhWySd4+moSwOy6s6f0rQ1D
         IqgHB9aPjQ9UY+TSxRSXjOBehZ868prt/m1xr/65P5eKYlzb8FstqFOou0xkCWiiEffc
         O7mOsla3/nmebmB0WulzBZFpzQBvLewEDSPczHzfVhh4194l/+YnqYjYHorUtt9164JK
         fNa+ODvuMy8yGURg5W5nwLXirsRRT2ywgPuHljZ2lTO4MRVHj6Kq0+ktebmi4ACz+Pn0
         QRJA==
X-Forwarded-Encrypted: i=1; AFNElJ+LVp+Nrrps7V4n9frtyuoV2c4++2u+gItdyJN+cmB7dp1WH0B1Cq9QR2sgg3rlorXDWPnvwZAdq+Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzb4msE9yoPr2TCrTCOIVwVP0Y5CUBoeWBAkZrE/u14de7FAETD
	riZrzdc2wxvqezL0QLxvX9xwD22+Djiw6vkuxwPWsHZBDGF4obqzMCiK12PakeGNIw==
X-Gm-Gg: AeBDiesseDUaNbFtVhFpadZYQKIJMXPY+DlUgoyUIIerWamJay2FDPUzoNJOjmxO1gh
	W0Hidp+PLbeIQ711+Av6ycsEMKAYN0jglYcPMSdhcpczqrQ9X4mCTP5WIFXbeYKVGTdz0+aCW1s
	IidQFzpn4GVN3lt31Nq081CDVnoeH1R2iLki6O8egw3nPzjq1NrJx9sTMc/5v0HOM5WF2N4SuEL
	0djEGkMnDPNjBUiv9bTwQRr9QQB1Ikx9o2nE9ZJG1kuf9xmlyw6ab4weIar+tel+I6BFfwAK4T7
	9Ikn21IQ271dC28T1jHHwn11PYdh+fFnW7CCF6YcDAZNjejeuVVw1bMFL1hGWP9+c1Rx3ftXbUb
	MGcpvOgphA9qzcdLlWMSv0AE0avsB+OqbhWUYNL1D1lnMDDkN00twk1c1RWy4VuQYzWRJE+iEeh
	v5xt1C6vkWDX/ewuMoXsWdLD+xKtl0FhYdsVQtHKlJPmZrmrxTuDuj7tItV+LULbJJuMtYSnuAl
	FAk/lEsFg/9ZGbvpkncdBfFVw==
X-Received: by 2002:a05:600c:3f0c:b0:48a:563c:c8e0 with SMTP id 5b1f17b1804b1-48a563cd16bmr89412465e9.1.1776862120271;
        Wed, 22 Apr 2026 05:48:40 -0700 (PDT)
Message-ID: <a2cbb69e-e86c-4d84-b8b5-8cbe3f91cbfd@suse.com>
Date: Wed, 22 Apr 2026 14:48:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] xen/mm: Split outstanding claims into global and
 node totals
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1776172526.git.bernhard.kaindl@citrix.com>
 <e7e95f2476f1f6636f2f31618891be6c087996de.1776172526.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <e7e95f2476f1f6636f2f31618891be6c087996de.1776172526.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1776862120-C2B74DB1-9FB3C687/0/0
X-purgate-type: clean
X-purgate-size: 4882
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8BDDD4462BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 14.04.2026 15:22, Bernhard Kaindl wrote:
> Replace d->outstanding_pages with d->global_claims and add
> d->node_claims as the aggregate of the domain's node-specific claims.
> 
> Keep the allocator hot path efficient and report the combined claims
> state using the two new fields.

The truly new field (node_claims) is in fact dead code (as per Misra's
definition of the term). It therefore doesn't feel quite right that it
is being introduced without (really) being used.

> @@ -552,8 +552,7 @@ int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
>      /*
>       * Two locks are needed here:
>       *  - d->page_alloc_lock: protects accesses to d->{tot,max,extra}_pages.
> -     *  - heap_lock: protects accesses to d->outstanding_pages, total_avail_pages
> -     *    and outstanding_claims.
> +     *  - heap_lock: Protects accesses to the claims and avail_pages state.
>       */
>      nrspin_lock(&d->page_alloc_lock);
>      spin_lock(&heap_lock);

By removing the use of d-> from the bullet point, you make the result appear
to all be only global state. Imo the fields still wants mentioning like it
was before.

> @@ -561,13 +560,13 @@ int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
>      /* pages==0 means "unset" the claim. */
>      if ( pages == 0 )
>      {
> -        deduct_global_claims(d, d->outstanding_pages);
> +        deduct_global_claims(d, d->global_claims);
>          ret = 0;
>          goto out;
>      }
>  
> -    /* only one active claim per domain please */
> -    if ( d->outstanding_pages )
> +    /* Reject updating global claims and we can't update node claims */
> +    if ( d->global_claims || d->node_claims )
>      {
>          ret = -EINVAL;
>          goto out;

Is there anything wrong with the original comment (apart from style)?
Especially the new "we can't" feels misleading - if we indeed can't,
this is something that could be fixed. Isn't more like we may not
fiddle with node claims here? Plus mentioning node claims when they
aren't a thing yet is somewhat odd, too. Remember: Patches in a series
may go if with arbitrarily large gaps in between.

> @@ -891,7 +890,7 @@ static bool claims_permit_request(const struct domain *d,
>                                    unsigned int memflags,
>                                    unsigned long requested_pages)
>  {
> -    unsigned long unclaimed_pages;
> +    unsigned long unclaimed_pages, applicable_claims;
>  
>      ASSERT(spin_is_locked(&heap_lock));
>      ASSERT(avail_pages >= competing_claims);
> @@ -910,11 +909,13 @@ static bool claims_permit_request(const struct domain *d,
>      if ( !d || (memflags & MEMF_no_refcount) )
>          return false;
>  
> +    applicable_claims = d->global_claims;
> +
>      /*
>       * Allow the request to proceed when combination of unclaimed pages and the
>       * claims held by the domain cover the shortfall for the requested_pages.
>       */
> -    return requested_pages <= unclaimed_pages + d->outstanding_pages;
> +    return requested_pages <= unclaimed_pages + applicable_claims;
>  }

I don't follow what use these two hunks are here.

> @@ -1112,18 +1113,16 @@ static struct page_info *alloc_heap_pages(
>      total_avail_pages -= request;
>      ASSERT(total_avail_pages >= 0);
>  
> -    if ( d && d->outstanding_pages && !(memflags & MEMF_no_refcount) )
> +    if ( d && d->global_claims && !(memflags & MEMF_no_refcount) )
>      {
>          /*
>           * Adjust claims in the same locked region where total_avail_pages is
>           * adjusted, not doing so would lead to a window where the amount of
>           * free memory (avail - claimed) would be incorrect.
>           *
> -         * Note that by adjusting the claimed amount here it's possible for
> -         * pages to fail to be assigned to the claiming domain while already
> -         * having been subtracted from d->outstanding_pages.  Such claimed
> -         * amount is then lost, as the pages that fail to be assigned to the
> -         * domain are freed without replenishing the claim.  This is fine given
> +         * Note, after redeeming claims for the allocation here, assign_pages()
> +         * could fail. The domain looses The redeemed claims as the not assigned

Nit: ... loses the ...

> +         * pages are freed without replenishing the claim.  This is fine given
>           * claims are only to be used during physmap population as part of
>           * domain build, and any failure in assign_pages() there will result in
>           * the domain being destroyed before creation is finished.  Losing part

I'm not convinced this comment needs fiddling with. There's nothing obviously
wrong, and I don't see an obvious improvement from the changes. 

Jan

