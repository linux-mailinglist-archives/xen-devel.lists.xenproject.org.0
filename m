Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABABF85E065
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 15:59:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684067.1063739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rco3M-0001AA-M7; Wed, 21 Feb 2024 14:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684067.1063739; Wed, 21 Feb 2024 14:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rco3M-000180-JJ; Wed, 21 Feb 2024 14:58:32 +0000
Received: by outflank-mailman (input) for mailman id 684067;
 Wed, 21 Feb 2024 14:58:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TA2L=J6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rco3K-00017u-ID
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 14:58:30 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa40ee7d-d0c9-11ee-98f5-efadbce2ee36;
 Wed, 21 Feb 2024 15:58:28 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a28a6cef709so820813766b.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Feb 2024 06:58:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ts7-20020a170907c5c700b00a3f4bb02bc8sm486131ejc.42.2024.02.21.06.58.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 06:58:25 -0800 (PST)
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
X-Inumbo-ID: aa40ee7d-d0c9-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708527505; x=1709132305; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G/p1pS4DzE5YyDMUJcVgfeMjgWT7V9bvuL4NGd3j3LQ=;
        b=AfGbJyeHGYksO/D6bb/o0wzlb/AXV56MynckxgxdbMWLKlSLzwDrASBBMGf2lWhltk
         38Tn0Ez7deIrYfxokdZfr79cxARCQipCHo8pzq9zuntDnTDRgXkVt+DhoPjEZsnOA+s2
         jG3xkyd7G8O036vOqBoxQJpLIOTjmG1l6M3/UW0YAQs7UnrKH3Iy6Ts7R6hVUAYcJEq8
         IV2Xusz7EVHpZ1zOBQoNfhCkVCDTU9fEzDAZbX4HMY929dKH4Pe086+e7CZmVkpc3ZTk
         iNsCJwcjqofJC+2mpj2bNSVS68Yiy68uOPjr6hLaOuYI79jWfBNX2wmAQf9omawL3OZd
         oMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708527505; x=1709132305;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G/p1pS4DzE5YyDMUJcVgfeMjgWT7V9bvuL4NGd3j3LQ=;
        b=jNZvtAqViJsl7sv9/Q3T9fz+QeMMMcdBqvfBlJxQMhvRQlyTCgal2RQJA7+F8b8oWW
         o+ovK2YiRHClsgR+uSdPMiRdRaPppuDMuysXs+VAj/qcSfa1y79lQ68kcap3i2OUGJm2
         Kf+srJsf5+loEong/PQ9dyHchPLe3BNjdhR69ppyB780V7y3HC+MyJG0WVQfa0/iERSQ
         5zMStkXNClKnK+H/E0IDtmEYmV2BYflbCg+Nauyg8moGGQf3p355VI3Z6qsooIAqJRas
         zp0X94eJdAAd+wphJMP2U+z9psPWoBUJK53+Iq04lMNK1ZqeqF+iOFnLBFL5mXvCNWHt
         Owjw==
X-Forwarded-Encrypted: i=1; AJvYcCVoWSTN+yNAwKuQYaqop3c7tl3Aq9wayXqohap0A5Pyt9c98X5bW4OAUv0aucbGkwXqSF3AxzFrTP/lVE8zv0MkqPfv3Q8OrFjulX3u/U4=
X-Gm-Message-State: AOJu0YyRlvIJEVh9iDzUJ5uFCYx2hPCKLgz4gMiZpnRjzNSi9omXpOaE
	wGnc2IpCs3mE5g6SxerG2cMTHRo4tTOfvfaF8qoMCQN2AUJIWksBQZGghEP8vg==
X-Google-Smtp-Source: AGHT+IHd3SEnXzBwjccwyim0c94d45naHaXVQjzgG/i4PVGFKqZfqn+sH7HwH+3n5VtdBMnKOFpI0A==
X-Received: by 2002:a17:907:1044:b0:a3e:590f:6348 with SMTP id oy4-20020a170907104400b00a3e590f6348mr7681451ejb.41.1708527505509;
        Wed, 21 Feb 2024 06:58:25 -0800 (PST)
Message-ID: <dfcfcab7-50b4-45b2-a25a-8898b74054a9@suse.com>
Date: Wed, 21 Feb 2024 15:58:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/30] xen/asm-generic: introdure nospec.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <5889d7a5fa81722472f95cc1448af0be8f359a7d.1707146506.git.oleksii.kurochko@gmail.com>
 <510d74ca-5cce-48f8-93f6-407cd727cf7b@xen.org>
 <8a09e386b709f780f193af39af63b6aeb75c868e.camel@gmail.com>
 <aaf86d31-7ae0-4e33-8386-dda4bd21496a@suse.com>
 <ab040f3c8ee35f49fffac385053b55053c52da8c.camel@gmail.com>
 <a6394d8a-63d0-42bf-8ed7-a7722cb7e71c@suse.com>
 <3e0c83fd0e3dc424059575cf9da9d57a87d90736.camel@gmail.com>
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
In-Reply-To: <3e0c83fd0e3dc424059575cf9da9d57a87d90736.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.02.2024 13:47, Oleksii wrote:
> As I understand it, evaluate_nospec()/block_speculation() were
> introduced for x86 to address the L1TF vulnerability specific to x86
> CPUs.

Well, if you look at one of the later commits altering x86'es variant,
you'll find that this wasn't really correct.

> This vulnerability is exclusive to x86 architectures [1], which
> explains why evaluate_nospec()/block_speculation() are left empty for
> Arm, RISC-V, and PPC.
> 
> It is unclear whether these functions should be utilized to mitigate
> other speculation vulnerabilities. If they should, then, based on the
> current implementation, the Arm platform seems to accept having
> speculative vulnerabilities.
> 
> The question arises: why can't other architectures make their own
> decisions regarding security? By default, if an architecture leaves the
> mentioned functions empty, it implies an agreement to potentially have
> speculative vulnerabilities. Subsequently, if an architecture needs to
> address such vulnerabilities, they can develop arch-specific nospec.h
> to implement the required code.

You can't take different perspectives on security. There is some
hardening which one architecture may go farther with than another,
but e.g. information leaks are information leaks and hence need
addressing. Of course if an arch knew it had no (known) issues, then
using a generic form of this header would be okay (until such time
where an issue would be found).

And btw, looking at how xen/nospec.h came about, it looks pretty clear
to me that array_index_mask_nospec() should move from system.h to
nospec.h. That would make Arm's form immediately different from what
a generic one might have, and quite likely an inline assembly variant
could also do better on RISC-V (unless, as said, RISC-V simply has no
such issues). Then again I notice Arm64 has no override here ...

Jan

