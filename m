Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B099FAD6FDD
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 14:13:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012997.1391539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPgnJ-0002Go-8J; Thu, 12 Jun 2025 12:12:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012997.1391539; Thu, 12 Jun 2025 12:12:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPgnJ-0002F5-4v; Thu, 12 Jun 2025 12:12:33 +0000
Received: by outflank-mailman (input) for mailman id 1012997;
 Thu, 12 Jun 2025 12:12:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPgnH-0002D3-Bs
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 12:12:31 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82c9c7e1-4786-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 14:12:29 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so757224f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 05:12:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313c1bdb39bsm1277762a91.20.2025.06.12.05.12.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 05:12:28 -0700 (PDT)
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
X-Inumbo-ID: 82c9c7e1-4786-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749730349; x=1750335149; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8xyyN5XT47vJwSfKZrQEK0pCc85k8aSdstWdB8Lz9I4=;
        b=LyfVbT87ItV76ITTVu393j3v9k2Urk0J2Qx80+wD/8USPikU0wysVSDgd7YtjN/Wyp
         qm2ze3b9sNRiGtPVFsbWEpnqnRbQGYlpjko/O7+akUPgcc7nlmvPpWF2vVWY8YtsqvUY
         vQrcz3NIh0fLw7zuFBBm7I/IhS4BMbh/IVEgdDL/C6P9UFeLzwa7GgV6Pn3NgGYJt4FX
         xiyFT8Lf5UVS0Qf00eTdNTv7jw1UzojaH+3/P32afGePUb59dbm+GUua7OiB3ZArlNSq
         0EP9H5HWa5w8idLA21dx24ujvjG+XuKUylptRSbJ3VQk0R62nmsQswXMATdRGt6MSIYV
         p93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749730349; x=1750335149;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xyyN5XT47vJwSfKZrQEK0pCc85k8aSdstWdB8Lz9I4=;
        b=u/t1MjnLGGdMZdHJA5k2m8YP5rZEZO0Zs/69uYpC1gsQ3tpDPETQ39IAEe82/Ar4Vp
         VtKQHCaJFTyAGgWF5x6bYCHVd0JMuNO43zzsKcakaOiRVBLYNG3m3PPRiZlxcpGgpZnm
         t0ytnSJxHLsp4hgyFYlacnkdpv+dOXa/rfVr16rA7e9NmJ2vgHxq7W+7n3QEm1OkX2qI
         Q01vo4MS4Qu4d6gFRtELdAKfqEUjZjlIXIk09NFNb09lnByWYz3n+NlIQinjn//EV2x8
         JXReiL/9g8C+uw2M7td6vUxXsVI0tFJ+xRQemhYSH8NIrfSkjzPNdPZLQ37DpfldOla4
         PGkA==
X-Gm-Message-State: AOJu0YzhfuMYL4v/noszEbAGscJgU8Dx7LBHXnuz7gQKBwldK9eUubaJ
	7T5NnLr5dL4KSffzJ+yUlpDyklLh3CtZIYikzfnBq1RyHVYYV3SCPxSEyFBi/Pjswl7kB+bcIJh
	Fj+U=
X-Gm-Gg: ASbGnculhTrM2l7E0/zrhibGjl7iCNSXW6HLKNnh5L1UJWb+zERooqcxG4JeB8v9f37
	idLsLtzll3bBOV7Do7JxaNJ3JXwXk4BPdEY3JRWm1m3BC4xRgTX/x3qawK4Z7MPpEUGaUYBAeOL
	NwR2Cyz7gm+fMz4Pt35G6TvVQ5ZL5MUFaj0uiV7RqG07hcBJXm1mohb70+nbHe+75bRIkwAogau
	T/5eEObE+2zuJdux7LOxOSe5cGm3P21h0m8EqB477jLnE7v9XhReSotDde0vq87MMTq/2vtTh6y
	urnRmWmPWT5Oob7u1xWF/d+3Ca5VEKqY6R3tuE1CwG/otejy18PCpJhar+Sa3kiy7FY7eXSLIV8
	Z7540yHNO+yr7+yXQwx8skZNejnILT2/h+5gSlAJJFgDBaOA=
X-Google-Smtp-Source: AGHT+IHw+Oy4TN3BUHRfz+XqPgIyQ3Zyv4M9E/jhUMwksT9oCqfr3LsUz9dft4p2kgGe6CtOy3PLmw==
X-Received: by 2002:a05:6000:40cc:b0:3a5:52d4:5b39 with SMTP id ffacd0b85a97d-3a5586dcc0cmr5617067f8f.8.1749730348850;
        Thu, 12 Jun 2025 05:12:28 -0700 (PDT)
Message-ID: <2274612e-d6cd-402e-9f2c-cefb72422cd7@suse.com>
Date: Thu, 12 Jun 2025 14:12:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Proposed x86 shadow paging changes
To: Teddy Astie <teddy.astie@vates.tech>
References: <a769ea0f-84b7-47d0-9a6a-438de98aa0ed@vates.tech>
Content-Language: en-US
Cc: Xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <a769ea0f-84b7-47d0-9a6a-438de98aa0ed@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.06.2025 13:45, Teddy Astie wrote:
> In Xen x86, there is the shadow paging that could be used in some cases 
> (notably with HVM), and is used when HAP is not available. It may also 
> be used in very specific cases for PV guests.
> 
> With the vast majority of hardware supporting HAP (through EPT or NPT), 
> it's rarely used in practice for HVM, with most downstream projects 
> (XenServer, XCP-ng, QubesOS) are compiling-out its support by default. 
> It also performs very significantly worse than HAP.

Whenever this argument was made, iirc it was in particular George (who
was involved in the original work aiui) who kept pointing that such a
statement is not generally true, for numbers being workload dependent.

> Therefore, it's not very used in production, and unsurprisingly isn't 
> actively being worked on (most projects being around HAP).

Is it not? Feel free to review this 2 year old series
(https://lists.xen.org/archives/html/xen-devel/2023-05/msg01140.html),
to allow it to finally go in. I'm simply reluctant to do any other work
in that area until such earlier work was properly settled. In fact I may
have added one or two patches on top in the meantime, but I saw no good
reason to even post them, given the state of the series.

> One of the issues of Shadow Paging is that it relies on a heavy set of 
> optimizations, with some of them being effectively obselete 
> (optimisations based on heuristics designed for more than 20 years old 
> kernels) or eventually problematic (e.g with modern CPU mitigations e.g 
> L1TF mitigations).
> Most of these optimizations are hard to reason regarding reliability and 
> security and difficult to debug. Some of these optimizations causes very 
> subtle issues with TLB refactoring for ASID management rework [1].
> Moreover, it's fair to say performance is no longer the priority for 
> shadow paging.
> 
> My proposal would be to :
> - significantly reduce the complexity of shadow paging by dropping most 
> of the complex optimizations

If such can be proven to have no dramatic effect on performance, maybe.

> - consider Shadow Paging as Deprecated

I consider this impossible as long as it's still used for PV migration
and PV L1TF fallback. In particular ...

>  > Functional completeness: Yes
>  > Functional stability: Quirky
>  > Interface stability: No (as in, may disappear the next release)

... I don't see this as being possible to happen any time soon.

Jan

>  > Security supported: Yes
> 
> Teddy
> 
> [1] 
> https://lore.kernel.org/xen-devel/9cdb3e67abd01390bcc4cd103ca539d6bf7adbc0.1747312394.git.teddy.astie@vates.tech/
> 
> 
>  | Vates
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech
> 
> 


