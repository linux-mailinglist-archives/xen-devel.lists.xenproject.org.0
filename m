Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 096C0B36DB6
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 17:29:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094794.1450027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqvbA-0004jC-2G; Tue, 26 Aug 2025 15:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094794.1450027; Tue, 26 Aug 2025 15:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqvb9-0004hS-Vv; Tue, 26 Aug 2025 15:28:35 +0000
Received: by outflank-mailman (input) for mailman id 1094794;
 Tue, 26 Aug 2025 15:28:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqvb8-0004hM-EP
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 15:28:34 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52cd78e3-8291-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 17:28:32 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-afcb78ead12so800468766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 08:28:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe48fbdb52sm803559866b.33.2025.08.26.08.28.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 08:28:30 -0700 (PDT)
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
X-Inumbo-ID: 52cd78e3-8291-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756222111; x=1756826911; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ikk0ogt2jTSOrk7dckJntQN+OhY/THsc82QdKbhEgE0=;
        b=DnFfqGY7ifrO3a4O5z3u+wj4By9shtDulk0ZW9a9BJPP7VGLbKx+CKcPkoBSBI1aOW
         szBB1o9P/oOFxSKgSw9SDI+DeFp6POpIXPGdi4rfdYIMoPmDODgl4SFKhRTrPawuheT+
         769/ULEAAcSbUblA/gzlYGMZ5eXLfWS0NZ2oME1Y6WLket7MIy/9iuHVOeQ8SFmbQErM
         bNr7rXPFNqdaQzP70v7TPmPZURUp9ks5Remg33kcYive3sRDd4GjO6NHU+k/TdDJuQiM
         2JcwkMBuIsJIo662CrAy+eKv0eQJfRPXCF1f65tmcBChIrSnSlT2/2J8m6ne6hsqYODL
         hmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756222111; x=1756826911;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ikk0ogt2jTSOrk7dckJntQN+OhY/THsc82QdKbhEgE0=;
        b=a/5ia85qrgA9WKoFyy5/ZqGGYzimPDNweUh3lKEk+Si9+lyT9iwFCxAjyeyWnHTWHg
         WBoft5hxNJYy9Ni/ehsmoLTCUJM2dpbHzFao+quXmaXQVQX5Uy/v/U8UuweBwe+RZiIr
         iBpFEhJHEcT0mxWpiQRaZqkSqlLufajNr5d2cg/+nGvrOQyTAIT8AkEi0yUf0kTgM47y
         y+ZNENWh/dQADlT9Cv/4Uqq7DgsqF6WEzaBykEqTu/7edz6oBu1V8XhWVQOFlHYewYhK
         QIjs49t/kThupCtwZD6ZZADRBpWIWxYiwzAdFIKY8sFPMrZs9PgIt+mcDPhpLsiJfffZ
         gZuw==
X-Gm-Message-State: AOJu0Yx7YAT3ZLNOkD/wUZiBDeVZkZJtVItWG3Ka3v/469nsTfFmHBmg
	nJ7UqEG3aPTrXFwCkdmjLjKwtOufOZlKPmm+XZo6NYn6R62KK1Zh/AZHSKbB0xF9ckpE0SIFYfm
	mKV4=
X-Gm-Gg: ASbGncvXuAl1VK7Ll/XOjd4sdx38fTpYoL2J6P337sZN9DwVwH24522BPbkq5GJ3U8F
	5IuzOdWcJV+FLn+b6WjaYN3avIn2YSUdFaxs9n7mJdkwDleOvnRYse+qQ5Mru/alPMOetb7l7bJ
	m4vSj1UAHk4PIxKrVXmyGmVMKOJUE1lfx1ReZtTEPN1vRyNZAJmfPQJvoDm0uIwAM349S91vcWL
	79iP7vUYnAeuACZ4Z0slTmKYK/Nb0IY3S6wID51jvgci2yr0Dz5PgoLHlfCcD9Bt39UFVijLABV
	LdKARfY47EfbyNcm/UZiIhbP2xWrXdgMb1Gu3KYR1+J2T1geB9lvy3y01RgKJutOFW9otvxx5tp
	TxvPMdd5zSXMrBtChwxM8LSKJsjyY2Aha4CnDtoKSA4MC5nCeKDVphzoEXMCVqNVMbmQZ3StKIO
	IcfibYrBs=
X-Google-Smtp-Source: AGHT+IHSkPHVNEPS7kqKJFqij0tFpk4h2Pc+5SctWIQV6OxpzLubJWhcGiKNjomMpnmhsUfBmh5N8Q==
X-Received: by 2002:a17:907:7f94:b0:ade:43e8:8fa4 with SMTP id a640c23a62f3a-afe28f154dcmr1593728066b.18.1756222110973;
        Tue, 26 Aug 2025 08:28:30 -0700 (PDT)
Message-ID: <a8a61b98-0798-44c1-8426-0fb18a77a6ca@suse.com>
Date: Tue, 26 Aug 2025 17:28:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: (auto-)ballooning issue
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

the other day I observed a strange issue with XTF's selftest failing to
have its VMs created, when running all flavors in a group. (Other tests
look to be similarly affected, it's just the selftest that I run most
frequently.) Originally I suspected a PVH-specific issue, but the
problem surfacing only there is because with PVH Dom0 I have less free
memory left after boot than with PV Dom0. Beyond that, both
configurations use the same hypervisor, with built-in DOM0_MEM="-255M".

The issue looks to be further affected (but not caused) by domain
cleanup being quite a bit slower under PVH Dom0, compared to PV. I.e.
by the time the 2nd test is started, memory from the 1st one still
wasn't completely freed. The result is that randomly one of the latter
(batched) tests fails at domain creation ("failed to free memory for
the domain").

xl's freemem() calls libxl_set_memory_target() followed by
libxl_wait_for_memory_target(). The latter function expects the domain
to balloon down enough for its ->tot_pages (in the hypervisor) to be
at or below the previously set target. However, already immediately
after boot "xl list -l" and "xs ls /" show target values which are 1
page below the hypervisor's record. With libxl_set_memory_target()
requesting relative adjustment, the Dom0 kernel will balloon out the
requested number of pages, but ->tot_pages going down by as many pages
isn't enough to please libxl_wait_for_memory_target().

I'm not even close to having an opinion as to where the problem is: It
could be that the kernel's balloon driver is off by a page. I'm more
inclined though to think that it is entirely unrealistic to expect the
kernel's balloon driver and Xen to have an exactly matching view of
the memory owned by the domain. Yet then it is simply invalid to
compare values taken from Xenstore against values taken from Xen. While
problematic for absolute requests, for relative ones it should be
possible apply the decrement to the source later used to compare
against while waiting.

Jan

