Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4883CAD3617
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 14:23:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010727.1388891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOy0t-0003j2-6t; Tue, 10 Jun 2025 12:23:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010727.1388891; Tue, 10 Jun 2025 12:23:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOy0t-0003hd-4F; Tue, 10 Jun 2025 12:23:35 +0000
Received: by outflank-mailman (input) for mailman id 1010727;
 Tue, 10 Jun 2025 12:23:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOy0r-0003hX-Kx
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 12:23:33 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6912ebe-45f5-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 14:23:28 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-450d668c2a1so43238865e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 05:23:28 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-452730b92c9sm136768285e9.24.2025.06.10.05.23.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 05:23:27 -0700 (PDT)
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
X-Inumbo-ID: b6912ebe-45f5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749558208; x=1750163008; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4cD00wWmxfNau1SVpivJfeD9IwEnOTfInru4OFavM7g=;
        b=Wn/S/+VczZcnPL+dfJntjz3AWXHLUkUdJympanN1zPkXi4i+qVEpZL+ANtwsKTt1Wh
         Xc9BtNEtdta98MLT9AIWWv+uZMoFbpsNNQl5Z4TDTzQXPtu8ojTmhpqj/hsKsXgozb6u
         tPxftm5C4Oe6vF/1vrgWEH5ryV2KzNXV1DofTSgFGn8bCd2tQWEsZbfLoyA6q/HBj/4E
         lg1nl+idI4mfrla+wemeY18NNyVm379DaUTBvDkcFrkj1x6WX9AJHEhcWiDRZxac8N5i
         wMBJCfpV3uooqmxPl6XjTsBOJrU2SUKX2q/oss9wF93eAKGw+REwkgqyU7mqbiNVAO2N
         NTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558208; x=1750163008;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cD00wWmxfNau1SVpivJfeD9IwEnOTfInru4OFavM7g=;
        b=ovhE4Ho3AT/PWGRaVQBJ6rtIQPkel1ds4fkS6ki4+SWHqhrMaEco0gWS6LWbLTzp7T
         yBTtw0XUlYkdfpg7p9WdlVZ4miVSAMYjMW5nc3bswADvGp/9hu58cndRbsEDWglem9kn
         za3a3Coe+a6O0dr9dckQXd8xqdmtZUx9vrtPCzJWAoyqfZxqnUa1yVe+Qw+emz9dAiSF
         Hs4i2ACHi9t2BrYfUJVuM8zEpOzpWvPH2j2jb5B5xSi6aZ1DVk3VaBQefGZSC9pir7N6
         HZuFlHbSUFoyNjQyE2uuJwuHH4N3LAaP1QgVFhXozx9X5dIgHViWPAfjyyUjgkTCysMx
         /Xvg==
X-Gm-Message-State: AOJu0Yxy1qtYVVRUkQ0pqt+ny0o3xV6kJT/nJT2xHa6fJHxSP9Pq3SAf
	TYuk9s6su74OL0NAWAud+D3p+hcu6pyjHUqjRwp0DudfqgPPJzdbg16W/xZdZiCiZA==
X-Gm-Gg: ASbGncvwKm+WaPeBVIDhvDgGQivn7d3SmdBEYBG4lj+sYg3J+X9lPT+D9iZtbRKRHsS
	aalZB8kwmPtXDLOlZFo7yuE8+ER/nQlAENt6JWYjOaKp2J2HaNK9f9IcHfhwnEJnYJReFi+o2jv
	Isy8OvxEGK2zjZSsZ1EdMp5AACguGySHQiKOQgB3GZDepEd5uR5dawHq71XHhy1LW0jmnGTIwZN
	SNw9cZM/UoZSSJma50RsSz60bkKAEW6iGhzeCjwbGbhN6F/RKG4sYKwkBMbH4bMiwoMzuGDp7NS
	61V8coR+q7NTM5LWA1HPCTLG7CHhDdS49LDUMk9i4xKC6Qpn8iC0OsCBPsr0EpvRW4ptCMfVjcm
	D6DTSmG6XtIGT0h50Uc+GGd+5LzQYXudBSz/HmyVgC2NvGOjasM4AeDzrOECPeoYJv/hmemvH7G
	L9RF74pBSEHHa6Cqn+zjEC
X-Google-Smtp-Source: AGHT+IE7EDJsAH2HWqmKVf6AvdBQpis/Kxsa9DYkhGjbiIS3O0B49HK/TUbRFFV3nItj6ecGaK2ZvQ==
X-Received: by 2002:a05:6000:2dc7:b0:3a4:ed9a:7016 with SMTP id ffacd0b85a97d-3a551427f0emr3065473f8f.26.1749558207624;
        Tue, 10 Jun 2025 05:23:27 -0700 (PDT)
Message-ID: <89d4250e-20aa-4515-8199-7003afb0bcbf@suse.com>
Date: Tue, 10 Jun 2025 14:23:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] xen/page_alloc: Remove `claim` from
 domain_set_outstanding_pages()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org,
 Bernhard Kaindl <bernhard.kaindl@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
 <20250314172502.53498-3-alejandro.vallejo@cloud.com>
 <aEHJEc5Pht5xcMfO@macbook.local>
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
In-Reply-To: <aEHJEc5Pht5xcMfO@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.06.2025 18:42, Roger Pau Monné wrote:
> On Fri, Mar 14, 2025 at 05:24:53PM +0000, Alejandro Vallejo wrote:
>> With a single global count for the claims it's easy to substract
>> domain_tot_pages() from the claim so the number given in the hypercall
>> is the real reservation of the domain. This is the current behaviour.
>>
>> However, a later patch introduces exact-node claims and those interact
>> very poorly with such a scheme. Since accounting domain_tot_pages() in
>> one case but not the other seems strictly worse than not accounting them
>> at all (which is at least consistent), this patch stops substracting
>> tot_pages from the claim and instead checks that claimed memory +
>> allocated memory don't exceed max_mem.
> 
> Hm, while I don't have any specific interest in keeping the current
> behavior, XENMEM_claim_pages is part of the stable ABI (it's not a
> domctl), and hence should be stable.

Is that true? It sits inside a

#if defined(__XEN__) || defined(__XEN_TOOLS__)

which generally de-marks unstable (tools-only) interfaces.

>  Note also the comment above the
> definition of XENMEM_claim_pages how it states the specific behavior
> that you are trying to change (and which should have been adjusted as
> part of this change).

This is the more important part, imo.

> I have no idea why this was made a xenmem rather than a domctl
> hypercall, but if you want to change the semantics I think the only
> option is introducing a new hypercall.

It _is_ a memory operation, and it re-uses one of the interface structs
there. (Yes, none of these would technically have prevented it from
being a domctl.)

Jan

