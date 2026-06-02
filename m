Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pIsPGXfPHmqSVQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:41:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CA762E1BC
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:41:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Av9E+ZYm;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1324928.1590440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOQY-000609-GS; Tue, 02 Jun 2026 12:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324928.1590440; Tue, 02 Jun 2026 12:41:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOQY-0005xx-Dh; Tue, 02 Jun 2026 12:41:02 +0000
Received: by outflank-mailman (input) for mailman id 1324928;
 Tue, 02 Jun 2026 12:41:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUOQW-0005xr-Eq
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 12:41:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUOQV-003eYB-KQ
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 14:40:59 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ecf4c-e002-0a2a0a5209dd-0a2a4504e65a-26
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:40:59 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ecf5b-1dec-0a2a45040019-d1558035b4a7-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:40:59 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4908b92904fso60685215e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 05:40:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef3556f51sm36710608f8f.25.2026.06.02.05.40.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 05:40:58 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780404059; x=1781008859; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qhDCoBSnlTbdiRqAKmmXHwkazVSdqhZLvKItmbORDvo=;
        b=Av9E+ZYmKPEdM1PBEe6OeVigiExuCZxZtPsXy3dK+RJbwrv2lHufL5/RYN2L5W3uCI
         kWOvo+MY3lZda7XZkgRAoctesFO6lZNGjstAWX7upIygoy5doZxu+qxSOdhoL/Jgqkqu
         g4BVoRHIRUWHJtVlKYkzRqipuimkbJkoE74eKRFSqNtNQhE4YGF71SxiSdaoJJ/k4w+W
         Mjl3ZbpARgRn/ng60W5ISjwmkMVDEqFcRssAKgf5jY1r3usaNSf/WnUdv/6UnxYWCP4M
         Iyjenw092KeIuJvBgczwd8+NbUtdEkOxHpObBqm2r1LLn02/03hcL9FuFFP7IxESNeUp
         FdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780404059; x=1781008859;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhDCoBSnlTbdiRqAKmmXHwkazVSdqhZLvKItmbORDvo=;
        b=k9HgPd7T+D0zlzYY+KPyeug9MkQ5qxlr4FGP/nzD1YXIJGKCUSDzZaxZN/nTUaXQSX
         n9ygddFV2r9bXiU8kWLXstbB2ByFD4PgO9iSDgFgRZZnlh6tRt1dZMpDqlRbhUccSarF
         sDBdMYxphzmtTsrts6TULklBVvJiT3LXF3JgD4OOyglCWLGu7Lo8IAS7NgVtmG+VTc98
         dr26Zl68LEbq4oqhszGU16ZhLlsueg9CGiUumT14XDmWP4cAz2viaNKUeA9q8/veHGad
         N6d3d4C7Wiq9QefWh+m+zx9N/81c76fzUCD3hnzV1OGK3Ewdh9bGRuuBh2YmvWgQqPVU
         l6Gg==
X-Forwarded-Encrypted: i=1; AFNElJ8BaAgFElYrzRVUPT7/5YT2dyi6exF/qSb/rS6z/wnXld+hwyOiC/0uJ/Xoo89ngIUmmg73ligJObk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxkGsvgjSO+wnPn/8r66oQxAYNRw93Ef0UhO1YKOjshXku5Xt4
	inK9ltF+Lc2KD/OUECG2l2EGap3rpmSmIO4c8sFB1OEtqdx8UlWZrhfpEaam7C+ilQ==
X-Gm-Gg: Acq92OF1nIdK+bLHKlISjB65fwSHYwSv6s6s/09pTkU7v7HW2tBxh0FVWq3E1Imakea
	PnX6Vvawc+evmYwTZxWHsvOQIMD10roSdtsuDNP4+oCjMbd9dA82aRfFhw5N1mNGpMUiBsU/geW
	hNoL9X6jlDXowwTIGicWBGx2Lh2+dw6cDnHIVsl+PlvEALdVnFt+OTH/muTdVGIvEYnsy6dGbWF
	hDEDm0iNvQlUOdBJe736PQJSfxrdkmM9YOABm1RNk9QNr7gm+XQ2VfxgLnPzuMmuf0bNKYPlWga
	FkJ7hlAleEuAiqkwUaJJg8x4GU6rX++nDQ5a3f5A9YXb/mzjGej5x/lrmypIxBMiSouEWDuWYP/
	rPIe13qwI4tRvbC8wycHvAS8SgoSL6T4tt6rwiQRR3ySXKkVout4/MofUg1ieinPxwd+wQxg4Iy
	SaB1+tAPRrjXSJdu7/bKro4siizE98+du5Y7oFY5smDkcFBmi0hKfT00u2pBX5fgBZ+BJ8squgO
	HehnoJOjQEjCilF8naVXQlnUw==
X-Received: by 2002:a05:600c:c0d1:20b0:490:688b:f10d with SMTP id 5b1f17b1804b1-490a290ec8fmr205690615e9.7.1780404058932;
        Tue, 02 Jun 2026 05:40:58 -0700 (PDT)
Message-ID: <bd0d81bd-b366-4db7-a37e-34c756b5d32e@suse.com>
Date: Tue, 2 Jun 2026 14:41:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] xen/mm: Normalize common per-domain page counters to
 unsigned long
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1780058608.git.bernhard.kaindl@citrix.com>
 <2a2bb3c2f32a82e722cf2e912f8b71443f67fd9b.1780058608.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <2a2bb3c2f32a82e722cf2e912f8b71443f67fd9b.1780058608.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1780404059-297793FF-353EC54B/0/0
X-purgate-type: clean
X-purgate-size: 1839
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tim@xen.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:from_mime,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3CA762E1BC

On 29.05.2026 14:43, Bernhard Kaindl wrote:
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -414,17 +414,17 @@ struct domain
>       * This field should only be directly accessed by domain_adjust_tot_pages()
>       * and the domain_tot_pages() helper function defined below.
>       */
> -    unsigned int     tot_pages;
> +    unsigned long    tot_pages;
>  
> -    unsigned int     xenheap_pages;     /* pages allocated from Xen heap */
> +    unsigned long    xenheap_pages;     /* pages allocated from Xen heap */

I'd like to at least raise the question: Are we perhaps going too far by
promoting this and ...

>      /* Pages claimed but not possessed, protected by global heap_lock. */
> -    unsigned int     outstanding_pages;
> -    unsigned int     node_claims;       /* Sum of per-node claims. */
> +    unsigned long    outstanding_pages;
> +    unsigned long    node_claims;       /* Sum of per-node claims. */
>      /* Domain objects use dedicated pages, leaving room for per-node claims. */
> -    unsigned int     claims[MAX_NUMNODES]; /* Per-NUMA-node claims. */
> +    unsigned long    claims[MAX_NUMNODES]; /* Per-NUMA-node claims. */
>  
> -    unsigned int     max_pages;         /* maximum value for domain_tot_pages() */
> -    unsigned int     extra_pages;       /* pages not included in domain_tot_pages() */
> +    unsigned long    max_pages;         /* maximum value for domain_tot_pages() */
> +    unsigned long    extra_pages;       /* pages not included in domain_tot_pages() */

... this field as well?

For claims[] in particular the doubling of space needed also isn't entirely
nice, especially when people (distros) build with a large NR_NUMA_NODES (aka
MAX_NUMNODES) but the hypervisor then runs on a few-nodes or even non-NUMA
system.

Jan

