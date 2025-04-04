Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E643A7B88E
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 10:08:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937928.1338780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0c4x-00011a-Go; Fri, 04 Apr 2025 08:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937928.1338780; Fri, 04 Apr 2025 08:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0c4x-0000zp-Dq; Fri, 04 Apr 2025 08:07:07 +0000
Received: by outflank-mailman (input) for mailman id 937928;
 Fri, 04 Apr 2025 08:07:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u0c4w-0000zh-Ij
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 08:07:06 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca6189d2-112b-11f0-9ffb-bf95429c2676;
 Fri, 04 Apr 2025 10:07:02 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso11663125e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Apr 2025 01:07:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301a0a90sm3693968f8f.21.2025.04.04.01.07.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 01:07:01 -0700 (PDT)
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
X-Inumbo-ID: ca6189d2-112b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743754022; x=1744358822; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V9cC4/6Nx56k5u/OU29yv3NZMWQZ7a/TTzf+o5t6MrU=;
        b=WcByEIPe+3QR8MWaCSbbbNBqBjenajAoqG7L7VohvGVXCKSKk9uCKS0ABWnudsPdCr
         Qx/Ro2tGEEFPt9WcinSg8CDTy7TOyMIEKLJs3kTPMMS1fGQdf79mzhOr6trjF1/ut7td
         qTXkbBYNf3aGpBl1v8N1/o7lgDMalp1iI8yQWDAi2U9iO8QS4EgpV5NF8hWhsrWiWlP3
         x9V9k5LgJY5DZs7XqCMADNycuKNw9+M5Y4RAVZnJKMtq8rPeS/lKxB7VylocqYOscOlP
         XPp1QSHdS52V/wgSWuD/HKZGv0Afc90c5+lrHy3LDRnj8KZHTTplRh4PERgmMeXq7m+j
         pqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743754022; x=1744358822;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9cC4/6Nx56k5u/OU29yv3NZMWQZ7a/TTzf+o5t6MrU=;
        b=Xlb9lOs1aQ4QlwYwnn91U10GpKLzYKSRPO5GhOqK/ewpuTmT52ya3xP8bbqXToIbSY
         6FZ9pnWtmCZcXbE2z5WptFB0jhsfV7aBYoMwq9PWNLCVymf7uFlJ8Cd+ebJGZmVFrB4e
         ycqt4xIfbDd+z/L5xJh5MpEs9PRZG+NMsY5i3pQYRpcFTlgEookrvHduVpNd/2dOysx/
         r0zwOuIVqbQ56DuilrIjrj8wiKgX24K8R9Yya1gh4Qy2vhTgkWtvUiwoKbrPU5wWYyQ9
         KvZv2cLzd8ht/56gzZgj6ZmSUAI1hGbGioTikbpe+/IeKJGOZGyy82kSJwHkFyRbVi9d
         P9pA==
X-Forwarded-Encrypted: i=1; AJvYcCW6cSbXD/03fSzpdxs1qhfYvgPGD2QzKDbGE9ysurGJFKnBg/3SEU1xdcFkDih/cOf+7K/To8IRgbI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwrUKbffNlSC4G7am0h4bJeQzSzxlgqaeUo+s2Je1PrFj4RUavA
	X2N9isHXrF8nsFIkZq25QRRfd33bhQt0wzAYT5OomHLb62OB4ee9y1skqTVyfw==
X-Gm-Gg: ASbGncs8yb0peDOqNtqB+wRdbEym84ZN430bz6vKnaRXxQ0FFEKUKRtb+//md3ToVI+
	Y2g70VoztmNcoVh1mhQN6OQLrKLF3dbEIIhkP+V0Z4IC/hewoRO6gvcDZ4O9XMRu7U6G8wZJHVi
	ktZBjdiUOiweEqTO37ZmDyCFDa/aUk4rl0L1Crbey0JLaZEt16PxXaLCqcNK06ID/j6nPf6IqqD
	Qxyy6Mt2vorf7WRSTdDO590zoxa8BSo/wTQbqiHoXnZ/7RRSsZln3bXGyJ2t4s80IbB/wUjrIMO
	6tjqhnhDvnPw6PWKqN4cWcdLWPDUzBJl/7k7Z9eRQs96wYH9R1c4KO0UdaYYF1cPN3UwrN9Ca/O
	YkYaQ9oJLiR75/CxOCn/tKS37KEYZEA==
X-Google-Smtp-Source: AGHT+IGUPQmpF7Fv+nXkAslbU/N0jhb+hDckkfHFeYRoE0VlqUL01brmVeHfvgaKwRWCtHib+N5gFw==
X-Received: by 2002:a5d:584c:0:b0:391:43cb:43fa with SMTP id ffacd0b85a97d-39cba93cf0emr1782833f8f.51.1743754022014;
        Fri, 04 Apr 2025 01:07:02 -0700 (PDT)
Message-ID: <e8ca1efb-384f-4c60-94b2-95528301a156@suse.com>
Date: Fri, 4 Apr 2025 10:07:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] xen/x86: allow overlaps with non-RAM regions
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 jason.andryuk@amd.com, Xenia.Ragiadakou@amd.com,
 Alejandro.GarciaVallejo@amd.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2504031755440.3529306@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2504031755440.3529306@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.04.2025 03:01, Stefano Stabellini wrote:
> On one Sapphire AMD x86 board, I see this:
> 
> 
> (XEN) [0000003943ca6ff2]  [00000000f0000000, 00000000f7ffffff] (reserved)
> (XEN) [00000039460886d9]  [00000000fd000000, 00000000ffffffff] (reserved)
> [...]
> (XEN) [    4.612235] 0000:02:00.0: not mapping BAR [fea00, fea03] invalid position

I, too, see something like this on an SPR system. That's a firmware issue,
which hence first of all should be dealt with at the firmware side.

> Linux boots fine on this platform but Linux as Dom0 on Xen does not.
> This is because the pci_check_bar->is_memory_hole check fails due to the
> MMIO region overlapping with the EFI reserved region.

And then what's the actual, observable problem? On my system I haven't
noticed anything going wrong yet, albeit the affected device is also left
without a driver.

Also aiui you strictly mean PVH Dom0 here?

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -797,6 +797,9 @@ bool is_memory_hole(mfn_t start, mfn_t end)
>          if ( !entry->size )
>              continue;
>  
> +        if ( entry->type > 1 )
> +            continue;

I'm sorry to ask, but what's a literal 1 here? I'm pretty convinced we
would want to still object to overlaps with unusable ranges, for example.
Yet by open-coding what E820_RAM expands to you completely hide what this
check is about. Yes, this is an RFC, but even there such context is
important.

Furthermore my general take here is: We shouldn't simply silence issues
arising from firmware doing odd things. My take here is still the same
as the position I took when I still was maintainer of the EFI code in
Xen: We shouldn't by default work around such issues, when doing so may
negatively affect systems not exposing such odd behavior.

Finally a Misra-related observation while looking at this: Isn't
is_memory_hole() unreachable code in a !HVM configuration?

Jan

