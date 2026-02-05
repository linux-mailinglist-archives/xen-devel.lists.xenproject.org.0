Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uM+oJP2fhGmI3wMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 14:49:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D00ABF38A1
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 14:49:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221964.1530057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnzjQ-0000nL-7c; Thu, 05 Feb 2026 13:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221964.1530057; Thu, 05 Feb 2026 13:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnzjQ-0000kd-3j; Thu, 05 Feb 2026 13:49:16 +0000
Received: by outflank-mailman (input) for mailman id 1221964;
 Thu, 05 Feb 2026 13:49:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnzjP-0000kX-Ii
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 13:49:15 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73bf04f2-0299-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 14:49:12 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-42fb2314f52so654394f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 05:49:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43617e250b2sm15746796f8f.8.2026.02.05.05.49.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 05:49:11 -0800 (PST)
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
X-Inumbo-ID: 73bf04f2-0299-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770299352; x=1770904152; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DWJuRUBRC+KFG6gKJNVY2K6ME6JbpPwoYQMCXiDAsek=;
        b=PiWcq31Q+34Jn3suXK64fzMMjaP3bUBvI6LNP7RRLLNB5kVlghBfRoEhhlpBcrgMFm
         uQlJB2cAVhdbyh8maDyrE7aizH5jd/Qnvz08R32UvfQnDMjy937kwqX59fXM0fBVuCDf
         lbT2x3VjYAyS2Ryerv0zuVwA5WfPjeBrVFq0OO9oFlPPqYh4Ci7FIzS7kmh25M8B9Sz0
         j74ok0gsSAwPNRnAKlewj9j8FnSFPx11o+BjnoQhzE+Y775dL7/jE5MixZ6ab2wNycRD
         LH2igB43HhBXFLT3wRvT9Q0e+k/ZIpdzxWYEHlFK13vaGnp8jkwqocb3H14KDlgS/RCA
         w3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770299352; x=1770904152;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWJuRUBRC+KFG6gKJNVY2K6ME6JbpPwoYQMCXiDAsek=;
        b=xGw3iTkSruswUrkrDOe/qE1ddCIyGyn2bHaXSRwesMb1Kitkd7FZWjiW2bZSlT9jyc
         vD5fdJLbN/o/tKDNm0lTHnc9RpjiTsGkYIqjRkq5FDUhKenBcmpuyE4ir+3ZYXrynqzp
         mqTLg5WZtQ5xKj7neI/7PZOs+1FGilczMxlAz2US/phDUWXs5q4xjeOg86PO08apzusx
         T1zCx9SAJfYwj4Ujm7PMqTA4ueKerluXwR4a58BHZZEwNgMAQrK3vbrvVhvOJfFvtOGz
         vxKAO857/tws8hF54tdLumxZ+uRhAIoziaY61vZuPPcQD2xaBSW4QeZa3dOssPNtXTDL
         o0jw==
X-Forwarded-Encrypted: i=1; AJvYcCW1vdXlGxxK11qJTogj9N+zi9q0IAaUpF5MAfGas39a4kTLEKwqrMup533S663sfuEU70uCJFztw5c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGu+TAL9l7nlZIPGnp3+abnYzFzOEVkucJtPBm2v0QiUhpo8ao
	nfY2qjh8ETM2wRrY5jc39WkgIbOYZd1QZBe9OAeKYBtOGvmFSZzxKAL4hUHUp9aUxQ==
X-Gm-Gg: AZuq6aJdxb/g8SV9aqEHwwyiP9DgVb3gD/lzTEj12hXec7ovYyDChvQ8G2vtTwFArEN
	g/CqpEgRVNNCL87fctiLKNB6vaT42kEUlRRvpdQviHLd8wa5u2qqUUmuviGEKUSy4y1SKnXD2Sc
	PVsV5W9Z5D55mJBWSehn6lEChRzbaOL0/Czf7RdYROv/XyWd61VxSRDyrp/Fikc7kior7VJXJ4L
	cb3Q3b1SXNFU/8ntvs45a6T9TMPeKNCoCBJ9Y4g+LQlNkEZ38Soowk4OmjZ9LWe9UhjsqZY+QNX
	qB0KvtNKMs9SIu0t5HCtTMzL3mEK3+JBWGRzEQp1ebUy2Bgxtiy//cZoAjkw2+xu9L/PnfrrNQV
	VwCqorbxpw6O4gTQxlwKnuGYy0DH7/ES0aWlIS3JF/vvR+LYb5N3XUwiityxbWkCuwMv5uIHNOA
	E9dBsQf6lcYUrScFMYhiT/Jahh98HKLMGSOh070apa/bBgljHiLH4a7Df2GZJXognbKwG3t9mOG
	ZQ=
X-Received: by 2002:a05:6000:2303:b0:435:e486:af82 with SMTP id ffacd0b85a97d-4361805d41emr10191547f8f.45.1770299351572;
        Thu, 05 Feb 2026 05:49:11 -0800 (PST)
Message-ID: <828feb7a-2a5b-4306-8da9-162df9ecfee3@suse.com>
Date: Thu, 5 Feb 2026 14:49:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Fix memory leak in xenmem_add_to_physmap_one
To: Michal Orzel <michal.orzel@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <20260205125820.116555-1-michal.orzel@amd.com>
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
In-Reply-To: <20260205125820.116555-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:Xenia.Ragiadakou@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: D00ABF38A1
X-Rspamd-Action: no action

On 05.02.2026 13:58, Michal Orzel wrote:
> When a guest maps pages via XENMEM_add_to_physmap to a GFN that already
> has an existing mapping, the old page at that GFN was not being removed,
> causing a memory leak. This affects all mapping spaces including
> XENMAPSPACE_shared_info, XENMAPSPACE_grant_table, and
> XENMAPSPACE_gmfn_foreign. The memory would be reclaimed on domain
> destruction.
> 
> Add logic to remove the previously mapped page before creating the new
> mapping, matching the x86 implementation approach.
> 
> Additionally, skip removal if the same MFN is being remapped.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> I'm not sure where to point the Fixes tag to.
> ---
>  xen/arch/arm/mm.c | 32 +++++++++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 6df8b616e464..b9f1a493dcd7 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -166,10 +166,11 @@ int xenmem_add_to_physmap_one(
>      unsigned long idx,
>      gfn_t gfn)
>  {
> -    mfn_t mfn = INVALID_MFN;
> +    mfn_t mfn = INVALID_MFN, mfn_old;
>      int rc;
>      p2m_type_t t;
>      struct page_info *page = NULL;
> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>  
>      switch ( space )
>      {
> @@ -244,6 +245,33 @@ int xenmem_add_to_physmap_one(
>          return -ENOSYS;
>      }
>  
> +    /*
> +     * Remove previously mapped page if it was present, to avoid leaking
> +     * memory.
> +     */
> +    mfn_old = gfn_to_mfn(d, gfn);
> +
> +    if ( mfn_valid(mfn_old) )
> +    {
> +        if ( is_special_page(mfn_to_page(mfn_old)) )
> +        {
> +            /* Just unmap, don't free */
> +            p2m_write_lock(p2m);
> +            rc = p2m_set_entry(p2m, gfn, 1, INVALID_MFN,
> +                               p2m_invalid, p2m->default_access);
> +            p2m_write_unlock(p2m);
> +            if ( rc )
> +                return rc;
> +        }
> +        else if ( !mfn_eq(mfn, mfn_old) )
> +        {
> +            /* Normal domain memory is freed, to avoid leaking memory */
> +            rc = guest_remove_page(d, gfn_x(gfn));
> +            if ( rc )
> +                return rc;
> +        }
> +    }

This new code and what follows below it are not inside a single locked region,
hence the cleanup done above may well have been "undone" again by the time the
P2M lock is acquired below. That locking may not be apparent in the x86
variant when merely looking at functions used. There's a large comment,
though, explaining how we actually (ab)use the simplified locking model
(compared to what was once intended, but never carried out).

Further, doesn't P2M entry type influence what needs doing here, including
possibly rejecting the request? x86 refuses to replace p2m_mmio_direct entries
by this means, but seeing that Arm has XENMAPSPACE_dev_mmio, this case may
need handling, but the handling may need to be different from what you do
above. (Just to mention: Presumably on Arm it's no different from x86: An MMIO
page may or may not pass an mfn_valid() check.)

Jan

