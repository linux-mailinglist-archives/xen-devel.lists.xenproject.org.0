Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D433CCC2DD
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 15:08:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189696.1510398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWEgG-0006dZ-DN; Thu, 18 Dec 2025 14:08:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189696.1510398; Thu, 18 Dec 2025 14:08:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWEgG-0006c8-AI; Thu, 18 Dec 2025 14:08:36 +0000
Received: by outflank-mailman (input) for mailman id 1189696;
 Thu, 18 Dec 2025 14:08:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vWEgE-0006c2-Fa
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 14:08:34 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08daa572-dc1b-11f0-9cce-f158ae23cfc8;
 Thu, 18 Dec 2025 15:08:32 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-477a219dbcaso6233635e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 06:08:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be3269e2asm40051015e9.10.2025.12.18.06.08.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 06:08:31 -0800 (PST)
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
X-Inumbo-ID: 08daa572-dc1b-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766066911; x=1766671711; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KOiHxY9urHshkLkyx70QEMfU3IbH3HkpOy76UUpuVpc=;
        b=KK29bzqWFbuXPsPqpMOVjc2u5S3IJGxUHIaiHpkol9wufjlFZ84KobuFsA+hJgnG0G
         B3DFClvzIC9yUE27zxwLPqffPc2bqa4e3Cf0h+3HxTJKEdi+QC9lP1t9CCliwGWut+lt
         aUwfgpFmybz5yM8Bgz58eEnUBUCufnuvu1F2eLy3i9lLAN7oxjbJS0y5kbbRl8RLLgwJ
         DisyjWHpFCaGWr2MwSwwrMIV0AUkt2oY584ZbYw2HW+APoX2jdTesqejSaTYHEwMYrpC
         a9yx1wd3XAXGTL3kFxn/slTLVMc2xqGYuCaSmSqMnuR/mSUrt32CggVgGGna+v7X4bLa
         454g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766066911; x=1766671711;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOiHxY9urHshkLkyx70QEMfU3IbH3HkpOy76UUpuVpc=;
        b=Q7calxGjghZBYkQ8nQXT18QXUl/Bby+TygYj7jgo/AnDbEYLZFajWO6NEOk3Be0cxZ
         7GgKojfXz3BzTLU/R2+QmtJlFE0seawAl22qw/j0Z3yLFSq8VcRiovE+CpfP85o1mr8T
         MgZySJCMO2h1LfESjcjMUlmWQs5k6ifXSUlUIwKT878TSv4T96GXy9XuBY/uFqmxsAxT
         3h8eA6rh1SADSkgj1TMAT487yIEiu9BM8d4VcLMgzK3QMeraDAM9hLHihWU1ZadSEJn7
         icuPHY9hUSadRfyiiD8TunkAherLeUVtXHChrpouUhSUrKJmC3ncsSl1ns7/w/pUvTqq
         upkg==
X-Gm-Message-State: AOJu0YxNiEoBN6mIK1udO9IPo9XxIzXjtFmFEwrP4c82otYXLt97V9wb
	0ArU6jCV+Pnmf42TQ8X3Hyx05S97p0xp4PAb6E/xyNOJHo8kystm+Z1qqbs0YVJwFw==
X-Gm-Gg: AY/fxX4F5wCa8Y79JPwFE2M95DhvW59fsHKikcrCajYJod3TDFIbO2CeGh/Lpm065Kh
	qWqPfHYuwNaqhPpND0ryA7C5wP/hYMlDo1jd3xc/DzW/KE656TYhOV/l7Oq38d6/5mdN8Cr6GoU
	x4yxClyoG7aMkmpTU7C+5aGLsWkjTZjEYp/lqtIKL+RGQiCrWtvc99984qwCNZYYIdfePiomrgz
	KvDYdZBszQsqq6B1GNUoSWBAxFmcd29FeidTsgFegzwwC4Oj7SDdgnJTfPgnA8XrB0NQFGj43UD
	xKicrl/yPByLu0L/CawjNNyFsQih50UOx/s2eCxHkVpbk5hraozHBZ9IJKmnnpJUGO2lIgr3fLk
	8V1XxLEoKqY9fuOGCLjdL+Wu78Cnh3oiVqo8ao345KJUwSeUQXzu/AgX0/KVENHx/toScFxz05r
	iTzTSuzst8/DeLaRct8Jop2QAqcDl2IXD5eoQm22ixeViiA5N1vsYixsrmmNrt6VvMox1tnQO/+
	qs=
X-Google-Smtp-Source: AGHT+IFH0/aBFJ0on3hxYT3b3lQnYJTM05an+hh+y6myQCplpRXZjU+GqzfpWyRey4EtzZTHwG2HXw==
X-Received: by 2002:a05:600c:1c1a:b0:477:755b:5587 with SMTP id 5b1f17b1804b1-47a8f89b8b5mr255947415e9.8.1766066911485;
        Thu, 18 Dec 2025 06:08:31 -0800 (PST)
Message-ID: <c0a054c5-258a-41fd-a392-4c33f8055fc0@suse.com>
Date: Thu, 18 Dec 2025 15:08:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/fuzz: use vpath uniformly for access to hypervisor
 library code
To: Anthony PERARD <anthony@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <0cdf924a-2e9b-4997-a01d-6d8b2f711104@suse.com>
 <aUQEbVRCXxzXJxJk@l14>
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
In-Reply-To: <aUQEbVRCXxzXJxJk@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.12.2025 14:41, Anthony PERARD wrote:
> On Tue, Dec 16, 2025 at 04:34:31PM +0100, Jan Beulich wrote:
>> It's not quite clear why for libelf and the emulator we use symlink-ing,
>> while elsewhere we use vpath. Do so for these two as well, thus also
>> eliminating the need for custom -iquote options and custom cleaning.
> 
> It was an attempt to rework the "tools/" makefiles to be non-recursive,
> via the use of subdirmk. `vpath` wouldn't have worked in that
> configuration as stated in the commit introducing the symlink.

Hmm, I see it says so, yet it says nothing as to why.

> But I never managed to finish this conversion.

Plus the symlinking also comes with downsides. They may get in the way of
moving build and/or source trees, for example. (Not that the tools/ subtree
would support out-of-tree builds yet, but still.)

Jan

