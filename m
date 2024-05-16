Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A1E8C71E2
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 09:17:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722834.1127165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7VMY-0003dA-Hl; Thu, 16 May 2024 07:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722834.1127165; Thu, 16 May 2024 07:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7VMY-0003ab-Ee; Thu, 16 May 2024 07:17:14 +0000
Received: by outflank-mailman (input) for mailman id 722834;
 Thu, 16 May 2024 07:17:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7VMW-0003aV-RL
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 07:17:12 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5047675a-1354-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 09:17:11 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-56e48d0a632so3835784a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 00:17:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bed0035sm10127275a12.50.2024.05.16.00.17.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 00:17:11 -0700 (PDT)
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
X-Inumbo-ID: 5047675a-1354-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715843831; x=1716448631; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W5MeLCkLCvsz71byx6cErlNzGkhmYwaMtdCJstKIW74=;
        b=DqejDtyzNyRx5MMEXqLlZYCqYBVeFxg5Y7x8Dxc5vDIm4RTEdWdcNNNBbp5buZGkZb
         WtCBJS54u6pCq4EVuWoEPJ3fQ69MQ5X8Fz5zykV2nF9ySOLesYyqnrbfz2Qzl7aFYOVG
         X+Kuzcy7/09f2ZwgTVaXlOKUijTxAFqMdkvGxot7qKIPKAnXCtBb1NUZYXJagsuxQlhU
         pAwmLy6bzF1MaP9pLduE3eF7NtT1iwaI17l2pniz/emAAVNOy/SV3gsBQZj3h+FCfNI7
         oK+lQm6GBmQAgIgx4FAaRENaC8Z1SGuWbczUCuAm6MfQ/AvwC2OvwxS27c54vH/Sfk62
         Y9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715843831; x=1716448631;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W5MeLCkLCvsz71byx6cErlNzGkhmYwaMtdCJstKIW74=;
        b=ZI76AjHf9KbhdC/J8s+J7mo0gPI5NMpPSrKylbdGO+c0FyruiiwH56PUY5RgpMdAX4
         1wGkXPMt0d4Lc9haKNGQ+IzwxZkqrxfI2fLFI8RDgBK3rGW+Qqh89QMN2jXaCzt/16vU
         BFGEUHL5xai81zq7gPZKhAorKNZ4J595rUVsfcIIwuM7k1uFssc3Y29WARSAvKY9hx2D
         1bdPGocjp2gfPC7B6IOPctMA/EQu3I4H/wa/E89LSsDziQTH07HBEZOYY0z/deL/xGIq
         X+KnbkdTUrUjRZeY/j7VvTwC+6jyoi1eA0xd7UopRHhodgM6zXpUDUNkj6FLldBQrXdZ
         S7vw==
X-Gm-Message-State: AOJu0YybLy77xpLYFzd7IBM4nDhZPpZoDmyc6Pry6imvPD/iE0roo+Xk
	jjYp3gFBYxBWzArBh9sEurkvuUE7LP2Z2hqTPZGs4tr9UrGPCbYV2FOdT4sSQw==
X-Google-Smtp-Source: AGHT+IEWK7UFczPO82/ECAbemvYreZ2oDBp6W5qew16fQMB6SZaLurhDWlSc5JLtKbsWO3DxdIJbew==
X-Received: by 2002:a50:d615:0:b0:56c:522f:53e1 with SMTP id 4fb4d7f45d1cf-5734d5d13b1mr18833901a12.17.1715843831302;
        Thu, 16 May 2024 00:17:11 -0700 (PDT)
Message-ID: <b50d0a83-fab4-4f59-bf4d-5c5593923f34@suse.com>
Date: Thu, 16 May 2024 09:17:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 01/19] x86: Create per-domain mapping of
 guest_root_pt
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-2-eliasely@amazon.com>
 <dd145c67-8e3e-4b15-94f7-c7cd1f127d45@suse.com>
 <bda3386e-26c5-4efd-b7ad-00f3643523fa@amazon.com>
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <bda3386e-26c5-4efd-b7ad-00f3643523fa@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.05.2024 20:25, Elias El Yandouzi wrote:
> However, I noticed quite a weird bug while doing some testing. I may 
> need your expertise to find the root cause.

Looks like you've overflowed the dom0 kernel stack, most likely because
of recurring nested exceptions.

> In the case where I have more vCPUs than pCPUs (and let's consider we 
> have one pCPU for two vCPUs), I noticed that I would always get a page 
> fault in dom0 kernel (5.10.0-13-amd64) at the exact same location. I did 
> a bit of investigation but I couldn't come to a clear conclusion. 
> Looking at the stack trace [1], I have the feeling the crash occurs in a 
> loop or a recursive call.
> 
> I tried to identify where the crash occurred using addr2line:
> 
>  > addr2line -e vmlinux-5.10.0-29-amd64 0xffffffff810218a0
> debian/build/build_amd64_none_amd64/arch/x86/xen/mmu_pv.c:880
> 
> It turns out to point on the closing bracket of the function 
> xen_mm_unpin_all()[2].
> 
> I thought the crash could happen while returning from the function in 
> the assembly epilogue but the output of objdump doesn't even show the 
> address.
> 
> The only theory I could think of was that because we only have one pCPU, 
> we may never execute one of the two vCPUs, and never setup the mapping 
> to the guest_root_pt in write_ptbase(), hence the page fault. This is 
> just a random theory, I couldn't find any hint suggesting it would be 
> the case though. Any idea how I could debug this?

I guess you want to instrument Xen enough to catch the top level fault (or
the 2nd from top, depending on where the nesting actually starts) to see
why that happens. Quite likely some guest mapping isn't set up properly.

Jan

> [1] https://pastebin.com/UaGRaV6a
> [2] https://github.com/torvalds/linux/blob/v5.10/arch/x86/xen/mmu_pv.c#L880
> 
> Elias
> 


