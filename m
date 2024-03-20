Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7E9880D11
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 09:32:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695791.1085871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmrMB-00052T-1f; Wed, 20 Mar 2024 08:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695791.1085871; Wed, 20 Mar 2024 08:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmrMA-0004zv-Ui; Wed, 20 Mar 2024 08:31:30 +0000
Received: by outflank-mailman (input) for mailman id 695791;
 Wed, 20 Mar 2024 08:31:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmrM9-0004ya-AV
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 08:31:29 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e3c877c-e694-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 09:31:27 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a46cd9e7fcaso328270966b.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 01:31:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d26-20020a1709067f1a00b00a46a643b6fbsm4925045ejr.15.2024.03.20.01.31.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 01:31:26 -0700 (PDT)
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
X-Inumbo-ID: 3e3c877c-e694-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710923486; x=1711528286; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EKJnFkvSNBPT334XIQUQeW5rAknaRr4uKjD1bF7fAHs=;
        b=LnoFC/Ks+IUbYWWqkKpQsUeLV7EFKHHyCg/E1pgFBZ3z3IJy6owYYbF4whbD+FX7mC
         rCco2qaCxF0IK0+0ceCDZI7RjZ4O6F0+TstWsUhR3c03LslqvuDQc6/jbkJ3Nk6O2bnx
         mqSO6VhxQzzDCu3bUM/+GFSnjlml5P8kEFJUbWY0Xg8/UuGe0SG5ebiLT06RXglPH2wq
         l0+oFnwVOGcuPvUNsXRnGXTipXQTeKKEcPP/zyNlOyjN6M5ZdPeemK/pMpMH/UVNdJga
         FNNQmtEwGK83IJE721BFTRWNwBNg9fwJZm4Axp1+MmPstXTs0y6GUUPkOAyF5HZ+X447
         /guw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710923486; x=1711528286;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EKJnFkvSNBPT334XIQUQeW5rAknaRr4uKjD1bF7fAHs=;
        b=QgWs0VYk+h6HZPp1AWQrFZgsE5EKW8vix6FansynKoCtdhEIIsXOYEq6zuDeAieRvF
         widtLFd4HyYIpd6xjqRbrxbz15GM5AXRAYkEeP9rvld7+EzhluU4NIadawu44NDepyCq
         aIWM81r4DXJWTyJq85jJkpkJ4U8ofDxwvApHrLMvL8Tju2NwxSUBO7wLMSo7rg9ZdA+p
         XVMFsdO7bC31/d+v1EqTulKwSxjMAXyfNIS9m4oPi3c6wP+47azxaM2HO45i8eQNBA25
         hQVzVCLu6B9zuSvSkou29rtxgyHR7p1JcWCt+porn0gLvrZlRMNTp5ahBSQ3jIWRZv61
         0B2A==
X-Forwarded-Encrypted: i=1; AJvYcCWtr9oAdJcofpT3XyuZEJZS8bWnntDRVyrprzrrmc3czATL1rwAb4AykTqTJCTKiTLUv5ST+YHXnF4gPan9GL7Tw5J7SMpnjIXuyNwjdRM=
X-Gm-Message-State: AOJu0YxgVZxHTA9MGgPdOb556bX5uVCJNLZwzhlb509MCnxUyRXmkrPp
	up0Yt7/BdvaAzKxLTd5xCnSocRsY8WN2qlkamaoXTug6AVf3cYIO77vglC5DZg==
X-Google-Smtp-Source: AGHT+IH5v5P8qSn3E3i459hTEuflbj722KEwbN+Tg9NvRSGUzCYTzjv4V0dBXFyAm4HTP6HRXJG/vA==
X-Received: by 2002:a17:907:111b:b0:a46:d61f:c561 with SMTP id qu27-20020a170907111b00b00a46d61fc561mr791049ejb.27.1710923486499;
        Wed, 20 Mar 2024 01:31:26 -0700 (PDT)
Message-ID: <45ab1427-dc17-4881-9941-6372d2e23107@suse.com>
Date: Wed, 20 Mar 2024 09:31:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/rwlock: Don't perpeuatite broken API in new logic
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, George Dunlap
 <George.Dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240319113020.3843309-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240319113020.3843309-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.03.2024 12:30, Andrew Cooper wrote:
> The single user wants this the sane way around.  Write it as a normal static
> inline just like rspin_lock().
> 
> Fixes: cc3e8df542ed ("xen/spinlock: add rspin_[un]lock_irq[save|restore]()")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Notwithstanding Jürgen's R-b I'd be quite a bit happier if (a) this and
spin_lock_irqsave() remained consistent with one another or at least
(b) the implications of doing the necessary transformation for the
latter towards Linux compatibility were visible to have been considered,
in particular with it in mind that Misra won't like

#define spin_lock_irqsave(l, f)                               \
    ({                                                        \
        BUILD_BUG_ON(sizeof(f) != sizeof(unsigned long));     \
        (f) = spin_lock_irqsave(l);                           \
    })

in linux-compat.h (and obviously with xen/spinlock.h included ahead of
this).

Jan

