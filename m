Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91183B35694
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 10:20:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094061.1449401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqoud-0002X3-NN; Tue, 26 Aug 2025 08:20:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094061.1449401; Tue, 26 Aug 2025 08:20:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqoud-0002VT-Ke; Tue, 26 Aug 2025 08:20:15 +0000
Received: by outflank-mailman (input) for mailman id 1094061;
 Tue, 26 Aug 2025 08:20:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqoub-0002VN-Jj
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 08:20:13 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c00165a-8255-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 10:20:11 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-afcb731caaaso797777266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 01:20:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe75109ca5sm462599466b.58.2025.08.26.01.20.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 01:20:10 -0700 (PDT)
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
X-Inumbo-ID: 7c00165a-8255-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756196411; x=1756801211; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aC/24mHp22BmuCbHwaEp8QneZ0ImnP+hNnsva6n5/oU=;
        b=N2DwzUxWm0WH31I1Jr8PAYfDnaz9mAuqEHdiwJ4qxyHW4eANZgs/6LW6H/kg/9jtSQ
         opandyA/eBYN5gLqOVK8yKANANt/wKmuSplrcG0ruznJbh7rdlrlCxsUJPx6X6bRl9pw
         EKGOs9OBokpwdgXYe/fJeYHuussVwV2ipZ0VZpjl9UtsIhljNwByEUBzRP1Awuf9QxF6
         1a4yvYo09nCIsPOW92+C+iRXZbTOA2hzlRoDPNG/RalUaoqHwSkMk+o1kqU+d//SxV4v
         3YWELQpcKOF9YCJZkCM4BR6RKUFc2UvhHON03btbiagoe9evR4opTagLzr/5E8IR8iEZ
         yqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756196411; x=1756801211;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aC/24mHp22BmuCbHwaEp8QneZ0ImnP+hNnsva6n5/oU=;
        b=j2Xdw80f7I2PhJhgZ4YvD1PYKdM1L7YVgAgqyOc/M5P6G8ktgSL3fX4UvXnr+usY/W
         jlAWGkUp2eRLBoVTMlSi0YquIZt3A6HsK6DNsY3bWTecbabkTIbjjdbtKtPz8MvNJAXQ
         60Ooa5Rb4i7xTDKOYatJSPuR2V6ipgQzoszQzAC2g/BP5+OUj8HTVw+8Vgzpb/D+2VAg
         qF95HMFJuHA+LcVUd9lVASCgYB4WOxSOSBKjxR4ar73RilK+N8UCLzUT/qh2P/rnTwnF
         SciUpeeOTCA5RSm1nkPjfADxvj85WGYWFCDhyLnUtclP/xRy8UrTiGuqNrWGIPEtPqeE
         M6SQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6XD8DR6BdHOIZs1zjhbKlFUlo2aiXJSo0MAUtGXCgQRoycJjotsOidkP7EfuryfejWlktIEfIWLM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDapU0RX5Gf8MboI2cNr8RYZxUG/pS++JYVUwX133RgxIkERg3
	qaq3Z7RbLw+yRyKdlq2jWsqrA0d6r98WaSMUNcjpgsv1mdbhxXPjjXylAYHK+fcDsw==
X-Gm-Gg: ASbGncuq1ZBuWt7QFd/WL05rgtuTiUp5aT1HXmZJp+gzMpIfoqncIrJxlFw7IfhiLgl
	epnBf48pZx9/QSOofw6gT3GLXvi5hH8sXkXnb7SS6fDQslab9OfYVKRD6Dcg5gXp3yCQWuNDiPg
	Bne6Qujgv3UeVHySAh7Z+8kmnH8TxTLL4u/yM4XjjsjnQ+PIK7UH9BobHWh942QUtaZs5Ip87Vx
	F2HzcBXRfKcCPhYEzt9a+fM1lFi7C8im5tH5JL8fTGAA4/U7/MHtNe03cTy8rHTlNVGUzwDmFD8
	XfhlxPQE20vmF075H6ojybLgn+OGGY2vJys2t0V0oj4m2iasarIBU+MIDYRoe4c/bWbdBMwYxhm
	Ps++83Ljv1kIIvRSWdwqVCJpG/xAnnoqLA84yKO1cl2pq/g+/daUFlUZKdUNBm0hKY3JSoGIWsL
	eTiMb9hwk=
X-Google-Smtp-Source: AGHT+IHENUYscltLPvgtizsNG6g0YBi47paU1hK2gooY6rx4X8m2TSImCERES0IqJ0T7K7Cce2ogQw==
X-Received: by 2002:a17:907:268b:b0:afd:c31c:2488 with SMTP id a640c23a62f3a-afe295380cdmr1462827866b.39.1756196410537;
        Tue, 26 Aug 2025 01:20:10 -0700 (PDT)
Message-ID: <6f66b871-9a2a-4b7f-9dcd-57dbd2922f21@suse.com>
Date: Tue, 26 Aug 2025 10:20:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] xen/page_alloc: Remove `claim` from
 domain_set_outstanding_pages()
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <cover.1755341947.git.bernhard.kaindl@cloud.com>
 <73dc08d9ec628823309acc40a2603e9138bdd4b1.1755341947.git.bernhard.kaindl@cloud.com>
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
In-Reply-To: <73dc08d9ec628823309acc40a2603e9138bdd4b1.1755341947.git.bernhard.kaindl@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.08.2025 13:19, Bernhard Kaindl wrote:
> With a single global count for the claims it is easy to substract
> domain_tot_pages() from the claim so the number given in the hypercall
> is the real reservation of the domain. This is the current behaviour.
> 
> However, a later patch introduces node-specific claims and those interact
> very poorly with such a scheme. Since accounting domain_tot_pages() in
> one case but not the other seems strictly worse than not accounting them
> at all (which is at least consistent), this patch stops substracting
> tot_pages from the claim and instead checks that claimed memory +
> allocated memory don't exceed max_mem.
> 
> Arguably it's also clearer for the caller to align the amount of claimed
> memory with that of the requested claim. xl/libxenguest code never updated
> an existing claim: It stakes a claim, allocates all domain memory, cancels
> a possible leftover claim, finishes building the domain and unpauses it.
> 
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Is this order (and the lack of From:) correct? A patch of the same title was
submitted by Alejandro at some point. Additionally the cover letter lists
this one patch as the sole Alejandro-only one. I'm also uncertain if you may
freely alter the original S-o-b, which was still having his @cloud.com email
address afaict.

> ---
>  xen/common/page_alloc.c | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)

From eyeballing both patches nothing has changed. That would support the
tagging as Alejandro-only in the cover letter, but it also means review
comments weren't addressed. Such non-addressing would, however, require a
verbal reply to those review comments, which I can't find any record of.
Instead in a reply to Roger's comments Alejandro indicated that there
indeed was an oversight on his part. My separate comment wasn't replied to
at all.

Jan

