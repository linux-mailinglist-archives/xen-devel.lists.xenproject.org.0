Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKsaNHJR12kFMggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 09:12:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4535C3C6DC9
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 09:12:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276700.1562031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAjYz-000408-0T; Thu, 09 Apr 2026 07:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276700.1562031; Thu, 09 Apr 2026 07:12:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAjYy-0003xs-TJ; Thu, 09 Apr 2026 07:12:28 +0000
Received: by outflank-mailman (input) for mailman id 1276700;
 Thu, 09 Apr 2026 07:12:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAjYx-0003xm-9I
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 07:12:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAjYw-00A75x-Es
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 09:12:26 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d75149-5cb7-0a2a0a5109dd-0a2a4506d83c-42
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 09:12:26 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d7515a-0df0-0a2a45060019-d1558031e9e7-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 09:12:26 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-488a29e6110so5373175e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 00:12:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cf8612cfsm32956715e9.0.2026.04.09.00.12.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 00:12:25 -0700 (PDT)
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
        d=suse.com; s=google; t=1775718745; x=1776323545; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VhUWl2dnV5JSOc1PRiMyO91K9EFCCdr8WsNDrEOtGno=;
        b=Ru7v6aHONQjmUeX/h/l3A3YZPrrhWHBKhIPiYcxPz8/uA2wayMYy/N6xgwQwstWJ0F
         oD8SvspMwJrqdRiyg9a2N9mx3ddER8FQkSgPAriM09SOui9hoxwVWmXtf4ddCKmDsWlN
         lPu/Ka5ljzxvJDCSAj4G1a3uuzVEDBj2NjLvEjKGXsBw0o9f2f/uVFMt2RnswoSQFK6T
         bp1AZxaZ6hjQ+LjDal/TmHPGnaX6bRyRz9loMT3cxB74JxAkZVxQU9vcw5GcvgoVYnxJ
         8qA6GYWRYN7Rs+ursSkeJpEOFMXJySTDaOr7a1v5ZkIuhoowNCBi5i5XyJBeb9gLpFGN
         oIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775718745; x=1776323545;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhUWl2dnV5JSOc1PRiMyO91K9EFCCdr8WsNDrEOtGno=;
        b=d1R5YaIewP0seUWVEIrMJLD5gpQyp70WqZqOQbNXr8gbGYG/j8S7Glv9aN/Na9+4m7
         e0XeOu1zl0oN03HTVXAARhIP0Rga30Tg8QWVpSCeJNdHkEdY0XTgOF8CPFYnjIIpV2U3
         Sz5+prB72PDl1wxnoJmQT+qX/4aOfVW7Zjxe2gNHTv1nSURluQGW0HsNHSB4OTSTqMit
         zEnkfaN4BNcRqTJr8xFw15DSBJ34a8NHv6sq0KppmuxJWMt8tf4DHiUeGIYX+OgbLYju
         th4chIK8dV/gHr/ioH2LZTPEamwD1Y09H6+cPL0Tl3ty5Pl8XVsYQHh0FSwgbwyNX/7S
         iyCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGuziVDLXi00lO+lZ4ccUGmSTHWJY18YnM71VP6Awox1tdh0gU4WkRxBtJeibWGnVP8Gpbelnadu0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyl7eFQw00UZuBDffzxjbjIbXc7O9Jjf0ChqnAMgjPBOP/dxK/v
	XkIcBBdK0neqb3gAYYHpxVLpzWc3ysb0H3sQGHdQ3oVUZLyW/scqQC4B0WyOn20M1g==
X-Gm-Gg: AeBDiev01i2khG/p8fO8DwRbBGZlGNmKAp1uDJcp2y+DYbrHDxfFgFDobW1QN75wMjt
	sRWjL3FZyy6W2q5pLPC3XhkurBH77R8YyDatAzf1yOEWH0ujQuZLoJGZaDebCeAIIG4YxOAXpfA
	bUqUYfl+1wuumjl9h9mLsJ30gjxvulspcuwht4X+ytIjRhEqQhnZxaGIqKlNczKNR8P5RXL2KmJ
	w9aUk11uFaC6+jb8zf4zIMjy2rDGMw5LAk1pbvc+onJKyFfuUo8QyZO87vEe8wWbdL2J8KGONcV
	6Oib7PmEL2rkDzqjumFNPERKDBQoHemu4zFYy3UWhjy8qrI59o48k+VnGcBvuqwVQPO1QyL+5vq
	EqyZr7tcGVSrCbfSdNDiL3U8NfYnl23XmUROw+g6hM/A34CxbnIpHuXM5B0dXaF4pnmx40KM7ZV
	X6caFFl7jPi/q/esxJDLjBJkPbjWgLuBSkggRV/yxdZ9smDTsniYOL74r4m9l2Ftr5XeXVb6iq7
	7Cp9KVCKyYM72Q=
X-Received: by 2002:a05:600c:138f:b0:47e:e076:c7a5 with SMTP id 5b1f17b1804b1-4889970e3c4mr327842795e9.11.1775718745513;
        Thu, 09 Apr 2026 00:12:25 -0700 (PDT)
Message-ID: <6904ffa4-acc1-48ba-bc98-2fecf288d926@suse.com>
Date: Thu, 9 Apr 2026 09:12:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/gen-cpuid: Split deep_features by vendor
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260408163549.135245-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260408163549.135245-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1775718746-AFD3C3D8-DAB543DA/0/0
X-purgate-type: clean
X-purgate-size: 3391
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 4535C3C6DC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08.04.2026 18:35, Andrew Cooper wrote:
> AMD CPUs need LKGS depend on NSCB, but this dependency cannot be unconditional
> as it will break FRED on Intel CPUs which don't need to enumerate the absence
> of a bug.
> 
> The deep dependecy logic is formed of two parts; a deep_features bitmap
> indicating which features have dependencies, and deep_deps; the mapping of
> feature to dependent features.  Given that NSCB is an unconnected root of a
> dependency, we can have the row in deep_deps and conditionally exclude it the
> deep_features level.
> 
> Rename INIT_DEEP_FEATURES to INIT_ALL_DEEP_FEATURES and add AMD and INTEL
> forms too.  In both xc_cpuid_apply_policy() and sanitise_featureset(), choose
> the appropriate {amd,intel}_deep_features based on vendor.
> 
> Introduce the NSCB <-> LKGS dependency and exclude the NSCB row from
> intel_deep_features.

This reads as if there was a bi-directional dependency.

> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -650,9 +650,12 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>  
>      if ( featureset )
>      {
> +        static const uint32_t amd_deep_features[] =  INIT_AMD_DEEP_FEATURES;
> +        static const uint32_t intel_deep_features[] =  INIT_INTEL_DEEP_FEATURES;

Nit: One blank too many each (after '=').

> @@ -158,11 +159,21 @@ static void zero_leaves(struct cpuid_leaf *l,
>  
>  static void sanitise_featureset(uint32_t *fs)
>  {
> +    const uint32_t *deep_features;
>      /* bitmap_for_each() uses unsigned longs.  Extend with zeroes. */
>      uint32_t disabled_features[
>          ROUNDUP(FSCAPINTS, sizeof(unsigned long)/sizeof(uint32_t))] = {};
>      unsigned int i;
>  
> +    /*
> +     * At the time of writing, amd_deep_features contains one extra dependency
> +     * over intel for a "hardware no longer has this bug" bit.
> +     */
> +    if ( boot_cpu_data.vendor & (X86_VENDOR_AMD|X86_VENDOR_HYGON) )
> +        deep_features = amd_deep_features;
> +    else
> +        deep_features = intel_deep_features;

Aren't there going to be other somewhat similar features which may want
marking like this (no matter whether right away they have a dependency)?
Deferring the special-casing until a dependency appears is only risking
to forget to add them.

> --- a/xen/tools/gen-cpuid.py
> +++ b/xen/tools/gen-cpuid.py
> @@ -344,6 +344,12 @@ def crunch_numbers(state):
>          # The ARCH_CAPS CPUID bit enumerates the availability of the whole register.
>          ARCH_CAPS: feat_range(RDCL_NO, RDCL_NO + 63),
>  
> +        # AMD-only special case.  NullSelectorClearsBase is really a "hardware
> +        # doesn't have this bug any more" bit.  All FRED-capable hardware has
> +        # NSCB properties, so disallow configurations which would cause LGKS
> +        # to behave unexpectedly.
> +        NSCB: [LKGS],

Along the lines of my reply to your review comments on my LKGS patch, why
is LKGS different from other selector loads? Don't we rather need to
disallow (perhaps not physically, but verbally) the suppressing of NSCB?
And then also for a few other "features", as per above? FDP_EXCP_ONLY and
NO_FPU_SEL clearly would be of that kind, and (for possible dependencies)
AMD doesn't know of them.

Also, nit: "LKGS" (in the comment).

Jan

