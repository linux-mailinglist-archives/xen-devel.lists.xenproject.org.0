Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 375A1A9E8F3
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 09:14:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970152.1358909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Igk-0002N5-Ph; Mon, 28 Apr 2025 07:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970152.1358909; Mon, 28 Apr 2025 07:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Igk-0002Lc-Mk; Mon, 28 Apr 2025 07:14:02 +0000
Received: by outflank-mailman (input) for mailman id 970152;
 Mon, 28 Apr 2025 07:14:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9Igj-0002LV-HN
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 07:14:01 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b7123cb-2400-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 09:14:00 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39c1efc457bso3050475f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 00:14:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073ca4cbcsm10082353f8f.25.2025.04.28.00.13.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 00:13:59 -0700 (PDT)
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
X-Inumbo-ID: 5b7123cb-2400-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745824440; x=1746429240; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2XEIBbRIoqNu2tpdCNte9vOYYf+G/BnqTRXsCrf+q9Q=;
        b=f87rmzPQI3rFZmoCg0QAezi6GIXhlc1f6WkWm8KgB0erO27De4XiacM6Z2oq5O2Jc4
         ZaeVD0NrY3ZPuLJefr19v6FIovpBRSA7mta7kvResRDvdD9bOE5zmJwC499Rl7SO8IIZ
         iFMwFoOXXR3ORL7lDG2DTKCSGtAR19rV0JEJZ/l24IkyhptiC3uouoFHg9hQvUSKuoEM
         Pwh/M6VQ5RITPNp/MR6mysfQ5voDDiQQwqsVNmdQg27OtdJlWK+j5ZtYIC/dWZbdWHbG
         H85cKI4v6qHM5LYBBnnKx7V6i7SUK3WVj8HwruBOmUloFACSBH8c1hP+zp1nffLC3tf6
         4Kgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745824440; x=1746429240;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XEIBbRIoqNu2tpdCNte9vOYYf+G/BnqTRXsCrf+q9Q=;
        b=S7av3x3WdK42ZwdqYAOBKIHlMZ6Ei0bJg6WQsi4SMQ3OkwOjawfffT60pycz5cMYXR
         5GQFegEiea04kyXeFdmyEjL/8hYQeg7do6YZczE9A7XClKJqNlnCs70nEuM1ubzL8olU
         8E+xIH9SE+tQ8eOw/MC04LGXQOqwi3TtSG/Ex1iZc0Q1SDv9ktWUoFM4rx8hl90YpUNX
         nn3ZAfZz0la3NIC3Ycw7eZE2bT42qZf9/UMzsD4byLXHVvhwP3EuH8R9FOqUxUvFdi5p
         EK+sIZt7hk0EfIk0Jd1PFrvW7/2L9BwpTu2fono8nilqCrCgUkcpI1TNpb5zaM3c6lJD
         yaQw==
X-Forwarded-Encrypted: i=1; AJvYcCWGranjN7ExkGavSTrekQadXmWCfVtNRrb8ds0Ocuv3ALewp1Pt+1JM/ztVgA4u3wowVDR//E6oa3o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx0B/xpbHdcHQQAgkuPztcvC8zHl9VzWB6phCUqkozRxsZLEkth
	xzbfIUkwYoA8F6BFPSeqOnyUHn452UkXtL0rBPtIQwEAhc+ahNsYrTuz4Ktj6w==
X-Gm-Gg: ASbGncv6YRH/2vzZ7NQg8zFCcqJk12AFsEeM4+3SFmIYGTOKj8kJL0Wbq9iZtPj5+i8
	elZ1TAfyWKwq2OjsbHSPxKoaCZMay0kBhx/wn9w0pgacPV9Ph6WWe3NoSFpvmww/Oc7eMwmaNQz
	uY3iiBpB4wKNEffdlx6RTs6g/KGuNZX/MOAV1wWAg46pgALDTodzFKQcBZqk0sKi3KJFhW76Fb3
	3FNQPzG6D+KOZOUAUU0b6Hi7hbLdyfwrs5Hh+A8ejLnroVvRaUHxNxtlxe2w+Tnxr8xyQ8zPQF7
	q8w++cpKqJNDVBJAgrXw83fF2SJm35GUBhU5a8fY6IFckdSANsD9z8m6v7HxuQ+057qsGGJRKKH
	bLb/+LZWI/NCIEUUcZkzrgJweJQ==
X-Google-Smtp-Source: AGHT+IF/nhXAFY5Qt5UyTX3iBp7/bgCpEJr8PVEjJB6Ek1jMqF1jSDz0B9+D8pmFdZ1JNDviGXAgrw==
X-Received: by 2002:adf:e5c3:0:b0:39a:c467:a095 with SMTP id ffacd0b85a97d-3a07aa7545emr4319963f8f.24.1745824439634;
        Mon, 28 Apr 2025 00:13:59 -0700 (PDT)
Message-ID: <19d9aec4-c21a-47a9-9c58-6bfcadbd22e0@suse.com>
Date: Mon, 28 Apr 2025 09:14:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: allow Dom0 PVH to call XENMEM_exchange
To: Stefano Stabellini <sstabellini@kernel.org>,
 "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 jason.andryuk@amd.com, agarciav@amd.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2504251314050.785180@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2504251314050.785180@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.04.2025 22:19, Stefano Stabellini wrote:
> From: Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>
> 
> Dom0 PVH might need XENMEM_exchange when passing contiguous memory
> addresses to firmware or co-processors not behind an IOMMU.

I definitely don't understand the firmware part: It's subject to the
same transparent P2M translations as the rest of the VM; it's just
another piece of software running there.

"Co-processors not behind an IOMMU" is also interesting; a more
concrete scenario might be nice, yet I realize you may be limited in
what you're allowed to say.

> XENMEM_exchange was blocked for HVM/PVH DomUs, and accidentally it
> impacted Dom0 PVH as well.

This wasn't accidental at all, I don't think.

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4401,7 +4401,7 @@ int steal_page(
>      const struct domain *owner;
>      int rc;
>  
> -    if ( paging_mode_external(d) )
> +    if ( paging_mode_external(d) && !is_hardware_domain(d) )
>          return -EOPNOTSUPP;
>  
>      /* Grab a reference to make sure the page doesn't change under our feet */

Is this (in particular the code following below here) a safe thing to do
when we don't properly refcount page references from the P2M, yet? It's
Dom0, yes, but even there I might see potential security implications (as
top violating privacy of a guest).

Furthermore cleanup_page_mappings() (called later in the function) has a
PV-only aspect which would apparently need widening to PVH Dom0 then,
too.

> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -794,7 +794,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>              rc = guest_physmap_add_page(d, _gfn(gpfn), mfn,
>                                          exch.out.extent_order) ?: rc;
>  
> -            if ( !paging_mode_translate(d) &&
> +            if ( (!paging_mode_translate(d) || is_hardware_domain(d)) &&
>                   __copy_mfn_to_guest_offset(exch.out.extent_start,
>                                              (i << out_chunk_order) + j,
>                                              mfn) )

Wait, no: A PVH domain (Dom0 or not) can't very well make use of MFNs, can
it?

Jan

