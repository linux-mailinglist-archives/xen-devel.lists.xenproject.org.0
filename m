Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 912EA9B782A
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 11:00:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828559.1243483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Rxu-0002iH-Mm; Thu, 31 Oct 2024 09:59:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828559.1243483; Thu, 31 Oct 2024 09:59:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Rxu-0002gF-K7; Thu, 31 Oct 2024 09:59:42 +0000
Received: by outflank-mailman (input) for mailman id 828559;
 Thu, 31 Oct 2024 09:59:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zW4/=R3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t6Rxt-0002g9-Bs
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 09:59:41 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6d5b8f4-976e-11ef-a0c3-8be0dac302b0;
 Thu, 31 Oct 2024 10:59:38 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-37d538fe5f2so551239f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 02:59:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd947c26sm50700845e9.26.2024.10.31.02.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 02:59:37 -0700 (PDT)
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
X-Inumbo-ID: d6d5b8f4-976e-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzAiLCJoZWxvIjoibWFpbC13cjEteDQzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQ2ZDViOGY0LTk3NmUtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMzY4Nzc4LjExOTY2Miwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730368777; x=1730973577; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3gOw0xV3V6YPYlSOEqd0FZorfzusHbr/CPQhBKNW5Q8=;
        b=edJzMaLGGqfEBmSjlsJIjy7bPUzH402KpwbeBSt9yCtzh3bC6hcPYZ64KrIWA1NK1m
         jLCO+uvHC0hg9DJ+uzmorf9Vb2gzsj/onQiBkwUrP7ph64UWzWFQWMHHJDi3mgug0oHr
         bM2WCyS/ceNF15rYRvguaBhTjlXSL3udFlTbfhLB9VFkvE5Ipw85h5PG2AIEfi4Ly+uT
         KpHx/TcR2cx3NrJ34qVyXMFRtFgoNA0ACPPi+c6vPfw46ZBiQkmZu56Y1yM0djq4tZkF
         /BqsJxH+gjMGJjY8syS+cvL6DdHPstjSp+3BLo/0d2Jl9azUGElal/KKJULCUI3O8qBv
         vKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730368777; x=1730973577;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gOw0xV3V6YPYlSOEqd0FZorfzusHbr/CPQhBKNW5Q8=;
        b=ZIrFB7GIucaQ483RPdvtqXti8LXVVAa+Tz2szi+xjzsG/G4XdpY7IISotDqV0MKkiz
         33/a4pUYAVdjKTb1CImRHZpKz4dYVBymVouwAGMR2aJ6G1wIKjnKPsS87xAerkFTgQqR
         W/PLFtEToVxtmfdhVwcJ4rDUzKGRXYANGUKU5Weo4ufREhshs76zxw5jyl80KHeDEm/z
         sS4s2uNXHrZhSGKO5N7AofOUoP84UPgIGbrHByV/fb4U39W+ERwVmQx3NSPYkuLqELMn
         3B3LlvQau9633583S7OA5izcFVMBMhvR76QRFcOX7IPTIPz6fNNKp7JxaX23QSC4dYHU
         /70g==
X-Forwarded-Encrypted: i=1; AJvYcCVpGOczo9dnCwqER2rzjrU7JGw2cJz1TrANHZqWbEMYPHysVu4n0DhL34yITyd3cgU/A286TImTBs4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyTCBCCouyDbnMPGYV+mj6ylynJ0/C6f2hbSQ1cQzS06QzY7snk
	SgpmpeoscQzYzW6xjrkKr9tTr0IiVn+Th0q+UoFxajPXWKt6GrjBfMTPkibO4g==
X-Google-Smtp-Source: AGHT+IH3upsQUHAohRvoNQuI6AVtnT2e0+6KIyOOYU2mUTxTr+/QLZsXpAUqzIPxZluzyM6Ggvz6xw==
X-Received: by 2002:a05:6000:1a8e:b0:368:37ac:3f95 with SMTP id ffacd0b85a97d-381be7d8f8bmr2133782f8f.31.1730368777392;
        Thu, 31 Oct 2024 02:59:37 -0700 (PDT)
Message-ID: <90996cfa-1c41-4113-846c-eade5c849104@suse.com>
Date: Thu, 31 Oct 2024 10:59:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: ensure L2 is always freed if empty
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241030114852.55530-1-roger.pau@citrix.com>
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
In-Reply-To: <20241030114852.55530-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.10.2024 12:48, Roger Pau Monne wrote:
> The current logic in modify_xen_mappings() allows for fully empty L2 tables to
> not be freed and unhooked from the parent L3 if the last L2 slot is not
> populated.
> 
> Ensure that even when an L2 slot is empty the logic to check whether the whole
> L2 can be removed is not skipped.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> I've attempted to find a Fixes tag for this one, but I'm afraid there have been
> many changes in the function, and it's possibly the code that introduced the L2
> freeing (4376c05c31132) the one that failed to originally adjust this case.

Yes, that looks to be the one. It has been a long while, but I think it was
(wrong) similarity considerations with the corresponding L3E handling (near
the top of the main loop) that resulted in me not touching that "continue".
We certainly don't want to ever free L3 tables (vacating L4 entries); since
the 32-bit case still mattered back then, the "continue" also couldn't have
been simply replaced (as there that same consideration applied to L2 tables
and L3 entries, for further extended reasons imposed by PAE).

Jan

