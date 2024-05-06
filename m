Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8463C8BCBA3
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 12:08:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717426.1119623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vFy-0006tv-Sk; Mon, 06 May 2024 10:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717426.1119623; Mon, 06 May 2024 10:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vFy-0006sK-Pk; Mon, 06 May 2024 10:07:38 +0000
Received: by outflank-mailman (input) for mailman id 717426;
 Mon, 06 May 2024 10:07:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3vFw-0006sE-N5
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 10:07:36 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7473b897-0b90-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 12:07:33 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41b79451145so12316475e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 03:07:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cm11-20020a5d5f4b000000b0034dd27adb2fsm10296294wrb.107.2024.05.06.03.07.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 03:07:32 -0700 (PDT)
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
X-Inumbo-ID: 7473b897-0b90-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714990052; x=1715594852; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rRfGvW0aOUXUA/OnoM19hA59ktYGB4Ifflpn7fMvZYg=;
        b=HXbbnMYb5RDivnCdxRhFYpxOpQKgl/rF+4kIUU6KVXC4jNe9fiFoSyoy3PHirjzQge
         dgmpVu/hjPnYbBNJB1NBJSXpWPAlqPvOEOm8GLrpyX8WR30Mb6D+S2HPaFPeWaATsq3y
         U8hZ5ev/5KUuAPfMWWu3GtIgRzEmhir5bg5a/5fYSAdYP6wUQ9kK6aeRUzuosCvvzuXE
         ajh9TzfCnRWAXWrdGdeg3xM0JrUyeX1A1HTBFO5PY/MJ/TzCq74Scy6uEsXVADSn5+dU
         cFvoZcUaNisLQ2lY43tLWTl+K6clAm0D0gCRJm1aFkMhmSqu4W4Uo3N5rbSNGZa8jUZB
         o5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714990052; x=1715594852;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rRfGvW0aOUXUA/OnoM19hA59ktYGB4Ifflpn7fMvZYg=;
        b=vxEjA0KbSDBHD6+DYbEYXm3TlP/0NqhvSDFr6rjvnJ/RPSMniZpaWSxveJ8MZuP7WL
         8ulBEwcoghfImGoY6pkPk9PF3GRWlGiMrfxqFrVJjCkUgE5KoLGxIcNhBImEx91eoBdT
         q4nY/0QyBpmBmlil4+2K5hUZhLJbAAFr5lqitg4plP4R9qnFMJrAHCqfpM4Pk/kklvxV
         VU166yQCWxa+BUd/bfp2SvduwaC+7ZayW6w8BuX15bvxEmc8FAymb+gmN5xAG6vsZGiR
         baqkK74VALOOR7TBHL+T4cDecFdN+e5GkWiMsx1ovYljtiPI9boEjQeqohYbQpqXINom
         kf+A==
X-Forwarded-Encrypted: i=1; AJvYcCV8WcxPKaYmKQ3Ym3ewEg+POdkXQU7JCS5CXxDWydSPsY2Ncw19s8OpxICRqLS1LMvkOI9ukmqro8FHdxUXXzZjBJEcLJcmwrtUV3EysM4=
X-Gm-Message-State: AOJu0YzbIj06I3nm0fusHp4SV+VFOm9/AHC1E4bsoHZdDTfT2FcN6u4e
	4yDQzZuU68GdkzTnJfNBQm3KvUfVxHWoGWxjoDfzWHTtfGKAeB/40LgMvcazZw==
X-Google-Smtp-Source: AGHT+IEf19JWnuxwQOqsLOBnerM5Ugif5QAnX0DK2p5XEXmNF2VgsIQZySwm/PuBqEbkeUw/esv8Rg==
X-Received: by 2002:adf:cc8a:0:b0:34b:147f:df6c with SMTP id p10-20020adfcc8a000000b0034b147fdf6cmr6055812wrj.48.1714990052564;
        Mon, 06 May 2024 03:07:32 -0700 (PDT)
Message-ID: <45c52348-e821-4e36-9bd6-7dda00eeb7d3@suse.com>
Date: Mon, 6 May 2024 12:07:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19? 1/2] xen/x86: account for max guest gfn and
 number of foreign mappings in the p2m
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20240430165845.81696-1-roger.pau@citrix.com>
 <20240430165845.81696-2-roger.pau@citrix.com>
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
In-Reply-To: <20240430165845.81696-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.04.2024 18:58, Roger Pau Monne wrote:
> Keep track of the maximum gfn that has ever been populated into the p2m, and
> also account for the number of foreign mappings.  Such information will be
> needed in order to remove foreign mappings during teardown for HVM guests.

Is "needed" the right term? We could e.g. traverse the P2M tree (didn't look
at patch 2 yet as to how exactly you use these two new fields there), at which
point we might get away without either or both of these extra statistics,
while at the same time also not needing to iterate over a gigantic range of
GFNs. Going from populated page tables would roughly match "max_gfn", with the
benefit of certain removals of P2M entries then also shrinking the upper bound.

> @@ -1049,6 +1057,8 @@ static inline int p2m_entry_modify(struct p2m_domain *p2m, p2m_type_t nt,
>          if ( !page_get_owner_and_reference(mfn_to_page(nfn)) )
>              return -EBUSY;
>  
> +        p2m->nr_foreign++;
> +
>          break;
>  
>      default:
> @@ -1069,6 +1079,7 @@ static inline int p2m_entry_modify(struct p2m_domain *p2m, p2m_type_t nt,
>              return -EINVAL;
>          }
>          put_page(mfn_to_page(ofn));
> +        p2m->nr_foreign--;
>          break;

Like for the ioreq accounting I'm a little worried of putting this here,
especially with the decrement thus coming ahead of the actual page table
update, but probably I'm overly concerned here. The put_page() living here
would clearly be doing bigger damage if not unconditionally followed by a page
table write. IOW - just a remark, no request for any kind of change.

> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -413,6 +413,8 @@ int p2m_set_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
>          set_rc = p2m->set_entry(p2m, gfn, mfn, order, p2mt, p2ma, -1);
>          if ( set_rc )
>              rc = set_rc;
> +        else
> +            p2m->max_gfn = gfn_max(gfn_add(gfn, 1u << order), p2m->max_gfn);

For one a (new) field named "max_..." wants to record the maximum value, not
one above. And then you want to use 1UL, to match ...

>          gfn = gfn_add(gfn, 1UL << order);
>          if ( !mfn_eq(mfn, INVALID_MFN) )

... surrounding code (more just out of context).

Further I can't really convince myself that doing the update just here is
enough, or whether alternatively the update wouldn't want to be further
constrained to happen just on newly set foreign entries. In that latter
case it would be far easier to reason whether doing the update just here is
sufficient. Plus iirc foreign entries are also necessarily order-0 (else
p2m_entry_modify() wouldn't be correct as is), which would allow to store
just the gfn we have in hands, thus resulting in the field then being
properly named (as to its prefix; it would likely want to become
"max_foreign_gfn" then).

Jan

