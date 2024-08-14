Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B208E95189F
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 12:25:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777065.1187263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seBBW-0005PT-A1; Wed, 14 Aug 2024 10:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777065.1187263; Wed, 14 Aug 2024 10:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seBBW-0005MT-6i; Wed, 14 Aug 2024 10:24:54 +0000
Received: by outflank-mailman (input) for mailman id 777065;
 Wed, 14 Aug 2024 10:24:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhoJ=PN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1seBBV-0005MN-AM
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 10:24:53 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7121145f-5a27-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 12:24:52 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a7aac70e30dso718609366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 03:24:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f3f47b80sm154700166b.8.2024.08.14.03.24.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 03:24:51 -0700 (PDT)
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
X-Inumbo-ID: 7121145f-5a27-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723631091; x=1724235891; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0lxduDBAJwajVDY+FbcGHidnrz+X89rVLTqDuLp3OAo=;
        b=DG7i3AZL7IAYR39HgIoN1KutmZI+n0LNtul4Y03hyIRKKxbY1WEEHgwpRoddrqTPtR
         OQJsg2mlsT6qXKEj97yEMGK7Q1SxOpJcy1j3RRTJIdUlAKbHgUw17zZOJ3cKf9sDGX5a
         eZtEOCwm8Maq841DrUov1TKynuBPqFPbqOXESPEj1Zg/hNIcFmT9uT2Tl5fuaxNkn+mb
         YriP23ACUU9rcq7xc7k35b4djlXfvUH1O00eX3d9qhoVbeNiecmh2Oj5YFfCzngRApEl
         H+5TAkNGv38fRgm+mUXxjmdbLFb5xlTZEwGmncadYh5XMuTRMwp7QqrsaUApXp5svwl5
         Y4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723631091; x=1724235891;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0lxduDBAJwajVDY+FbcGHidnrz+X89rVLTqDuLp3OAo=;
        b=d3rJ+AFSGxW6PHFBZrfEpb+HyoO388zGLfrwepm1QJukrE3/kbbmTkLmx7lG7JK1Q0
         3Vkm4sHY+qBnuqzKWqARHLqbgF6shwv0SWZMzwy1i/JCxJnjgzQFKkZIBXvksUXUfZ8w
         HCOVDZZn2z3e/cfGG4av/qf1x6GAU+IPRN7jDLDPY5374MG5H5E1CvJ2JgDnJ6FGo4MY
         BV/jFUgMASOkJhQ7E8VwV8UaoUHrW8p3guUc0wS6c0cMj0fzx3Bv7+s7d8P8KNYsVFYZ
         naeo9W45sTUAzj1ILdG8uB+7/QS1WqHN0/WebcsPwDargHMpq7ACK1jQsfqeGP17eAKu
         fJCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJy8b1iclcEf9ceeWuhB+zTp4Y+YrKZbKBETY/jwpOWWF+5lA8xnAPMeUIZ+9XZayjU+/uQTrNR4l4ui3X9aTcan13+GztBh0FkBx61tw=
X-Gm-Message-State: AOJu0Yw1c7p2YJ3VEN/fF4tCY9yDFebc58zUbitxGxBOJA0aJuNClqtG
	imQ3YxH6xfzxyIhySdI/6d0fer18iB9bmNHaxgnFaldNvPZZMVd6KtRAMq3WXg==
X-Google-Smtp-Source: AGHT+IFSGYwGlc2eQFy+kAri+y8RjbeDVBOdXYYq6SoesJudZ0wmRJDMRuuB/MC3lD/Rnq3TzCPzyw==
X-Received: by 2002:a17:907:c0d:b0:a7a:ab1a:2d71 with SMTP id a640c23a62f3a-a83670956a2mr146905566b.59.1723631091428;
        Wed, 14 Aug 2024 03:24:51 -0700 (PDT)
Message-ID: <2d8902c6-49df-4149-bbc6-e9a1e728450f@suse.com>
Date: Wed, 14 Aug 2024 12:24:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/22] x86/mm: avoid passing a domain parameter to L4 init
 function
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: alejandro.vallejo@cloud.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-9-roger.pau@citrix.com>
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
In-Reply-To: <20240726152206.28411-9-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.07.2024 17:21, Roger Pau Monne wrote:
> @@ -1673,13 +1668,14 @@ void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
>          l4e_from_mfn(sl4mfn, __PAGE_HYPERVISOR_RW);
>  
>      /* Slot 260: Per-domain mappings. */
> -    l4t[l4_table_offset(PERDOMAIN_VIRT_START)] =
> -        l4e_from_page(d->arch.perdomain_l3_pg, __PAGE_HYPERVISOR_RW);
> +    if ( perdomain_l3 )
> +        l4t[l4_table_offset(PERDOMAIN_VIRT_START)] =
> +            l4e_from_page(perdomain_l3, __PAGE_HYPERVISOR_RW);
>  
>      /* Slot 4: Per-domain mappings mirror. */
>      BUILD_BUG_ON(IS_ENABLED(CONFIG_PV32) &&
>                   !l4_table_offset(PERDOMAIN_ALT_VIRT_START));
> -    if ( !is_pv_64bit_domain(d) )
> +    if ( perdomain_l3 && maybe_compat )
>          l4t[l4_table_offset(PERDOMAIN_ALT_VIRT_START)] =
>              l4t[l4_table_offset(PERDOMAIN_VIRT_START)];

I think it would be nice if the description could clarify why we need checks
of perdomain_l3 twice here. I assume going forward you want to be able to
pass in NULL. Therefore, if the conditionals are required, I think it would
make sense to have just one, enclosing both (related) writes.

Jan

