Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFQrK6dWhGlb2gMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 09:36:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC9AEFF6A
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 09:36:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221607.1529789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnuqm-0002ii-SE; Thu, 05 Feb 2026 08:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221607.1529789; Thu, 05 Feb 2026 08:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnuqm-0002h1-PE; Thu, 05 Feb 2026 08:36:32 +0000
Received: by outflank-mailman (input) for mailman id 1221607;
 Thu, 05 Feb 2026 08:36:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnuqm-0002gu-3E
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 08:36:32 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4350f89-026d-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 09:36:29 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47ff94b46afso6666675e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 00:36:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483179d7346sm54145265e9.0.2026.02.05.00.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 00:36:28 -0800 (PST)
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
X-Inumbo-ID: c4350f89-026d-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770280589; x=1770885389; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NWu9I34hkUQGwz+y0rftURk8xs5tDjpX+OFqhQ2TI6o=;
        b=NuSFwDLLliCo7E+4xWhkuqNdn8XK6ky1H/qafKtUj4OnFmKZ4OQf/RzdU4VJxiDkDL
         GOA4OqBYWL6nmPHau8YQWOXVcTEbrKkwRbox6NTsSF8dfG3psB7/8OWfk96Ok8TnFC8o
         1GZMsYTUmyRw4CAlBEo0eDYHjz7lO5dHZaG3Zi7YBy4gZbBl6HjMMCK7xyMbLOg2gJjk
         ALC4Xd72ZYUPseZKEYwaM7oStefxGf5HvjtNZl76bjnW+13fJBpu5dwAwnZW14mLtt6d
         zNObzd5is3Yo5wyrwLWwsYYB0TpQUbDn/1AazhPwjloHEeaXGqWoTtxqIEqKQsDuS+px
         mEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770280589; x=1770885389;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWu9I34hkUQGwz+y0rftURk8xs5tDjpX+OFqhQ2TI6o=;
        b=Hpil+bpKew+I5NGSpe97PJ3bbAI8a6heFBNghqJZIcHJBaaw/vex8Xhb+ZNa/Vz60m
         yfg4MNCEphC5R/FVNSm5ATKNu4bTuzgXq8oEEphAbNrH7PXYwK9rYg02t4ytm9LOqAzU
         IFdqbKKsOuOnVy0b5ihv5FHn1ppMtBqapZ3S5spFo9sfebp9k05DiGCT3sbuOCgA5Nn+
         7JCRbp0rRZ5FF/WZkTx+pq1rFWb27CqIqEyO4tQYD5+ZwfrWvfx0qDh63ckT+bmqgllf
         mNsKbtCyN1ZDwmNGWYnBTfzLOm+jWZ+gbieUN1YJIhBXUtAJCawz7YvQWg4v5JV2hZIG
         7/lw==
X-Forwarded-Encrypted: i=1; AJvYcCVvcE14j+NDd2iM+AVkvPBXkv3QtIen44GYX9WVyo3jowHcAyeyybqZuLz3+WZx4z0S6jjr6tPWYdI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLGGub/RZE+/BvS0FKc9/wyuGoCY9gqneTgykrUD4WwtI4jAo7
	WulvYVbQeTcqz0cLVJiDG5OhaqrKsblDDWDoYEqtdoVrxoOgSNabCym4bWy3OdFDFQ==
X-Gm-Gg: AZuq6aIDIoHfkyryvnE6s3fBnK+hUR5aEeagKyt/WTyvkJtCe2aljPN+1lUo68Z2fNG
	BhPk45D1PdvhPHW7pRju/nOpexJ91Jx8WJwS3vhylFLeN158Vr2wvGTrIzVOOteqLqvmP6KIyAk
	eduHzQAU6LbmFjP+mN48WdKZ48bpOeBjBW5nDiyzUktL3Vu2Szw36d3b4v16XXoJTU8iCJ4lKnU
	pziteY3Ps0ia38n5ARt16Xs55Y6Gb2kpwa21r52XDf4RcN9p8YCHKvN4FcO6FAdnwF1FCAPjHHh
	X7uTX1aWO35Zc2lVAhkymcJmW61g+lzJL/sP+iITWrKcG2WY87tQLU7wc7741zrxh0k5liUZq3y
	n+JOIJaFqTZmrsITuQRjIW/KUxjAvALcM3x296mV8ET1k49GTuJW1VsasYJsAVn92LYvEqwKoWq
	s6l2KPOaXjtNXfDwPpLwdbGMT3b/XuECCIBUXz6ZWHALr5WWMefd/+HWWsdejcwlKOReW+XBJpE
	A8=
X-Received: by 2002:a05:600c:19cc:b0:47d:6c36:a125 with SMTP id 5b1f17b1804b1-483179dbd52mr28509115e9.17.1770280588734;
        Thu, 05 Feb 2026 00:36:28 -0800 (PST)
Message-ID: <5aaee345-5ace-42b7-a436-ae6ce57cb9fc@suse.com>
Date: Thu, 5 Feb 2026 09:36:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/domain: adjust limitation on shared_info
 allocation below 4G
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260205080308.91057-1-roger.pau@citrix.com>
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
In-Reply-To: <20260205080308.91057-1-roger.pau@citrix.com>
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
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1CC9AEFF6A
X-Rspamd-Action: no action

On 05.02.2026 09:03, Roger Pau Monne wrote:
> --- a/xen/arch/x86/pv/domain.c
> +++ b/xen/arch/x86/pv/domain.c
> @@ -247,6 +247,34 @@ int switch_compat(struct domain *d)
>      d->arch.has_32bit_shinfo = 1;
>      d->arch.pv.is_32bit = true;
>  
> +    /*
> +     * For 32bit PV guests the shared_info machine address must fit in a 32-bit
> +     * field within the guest's start_info structure.  We might need to free
> +     * the current page and allocate a new one that fulfills this requirement.
> +     */
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
> +        /*
> +         * Ensure all pointers to the old shared_info page are replaced.  vCPUs
> +         * below XEN_LEGACY_MAX_VCPUS will stash a pointer to
> +         * shared_info->vcpu_info[id].
> +         */

To cope with the toolstack-dependent ordering of actions, may I suggest "... may
have stashed ..." instead?

Jan

> +        for_each_vcpu ( d, v )
> +            vcpu_info_reset(v);
> +    }
> +
>      for_each_vcpu( d, v )
>      {
>          if ( (rc = setup_compat_arg_xlat(v)) ||

