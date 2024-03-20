Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAAF881434
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 16:09:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695981.1086409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmxZR-0004nM-UD; Wed, 20 Mar 2024 15:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695981.1086409; Wed, 20 Mar 2024 15:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmxZR-0004lN-RS; Wed, 20 Mar 2024 15:09:37 +0000
Received: by outflank-mailman (input) for mailman id 695981;
 Wed, 20 Mar 2024 15:09:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmxZQ-0004lH-IP
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 15:09:36 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dce8ffa3-e6cb-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 16:09:35 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a467d8efe78so760849466b.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 08:09:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 u7-20020a17090626c700b00a46e56b181bsm1799100ejc.4.2024.03.20.08.09.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 08:09:34 -0700 (PDT)
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
X-Inumbo-ID: dce8ffa3-e6cb-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710947375; x=1711552175; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5fWkWPnMdhkSD8eYem4ijP7X1u7JNbqBHCtvSL7Uxeo=;
        b=VKS9PFvLCBrkQhsikGJZKJQMj6VgAZFmOOLU22PMeRVRvEIrLQTN4rssBBnk7rlP5R
         X4rcYo0CORP51nFVuEqD5n2q2cO3ZtdflnIZNiLZMxizGlihDBr3/StO+LqYP/AvmIiq
         cOPT5j6kLruvsQRS6Y7U2PiE2QPwlxefm0rb/HOU3BaRGei4YMNoWem0mLtM5eUI+AKn
         6qwMYMXd2jHXlUDS806bGN1zjHeOqrKlm6p5AxRc/+nN4krBx+n/1IA5Vgx0ZOgfLSwY
         8w9ylsTRiUHwOVNzypOXCgiKFzPmNJnzs3KArXkq7vs0MPZ2gNLAA6sAh5oSKRaWRiqZ
         y+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710947375; x=1711552175;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5fWkWPnMdhkSD8eYem4ijP7X1u7JNbqBHCtvSL7Uxeo=;
        b=uRAobbsZBJmJ9VauA5hrskkLh1r2I0fhP7/inwxzV9WeA46WnNLf6D839sTU5pcIfj
         LmwYqoqpPgAs8liE2eFjrCmd+2d+JnDRl+lXu4YPNV5HiOiEZoEybslQG54FUqRraUvw
         4sNda7c78cs7FDBt5vEMskdPi+C/una+hclPUse3nCQAlX6oyvnzJ7nmYobY3giVqE5A
         PnEJ6B/vt/R0XTgFulq5Zx7TJqLfMtERLAT2tgjtadxtZskvu1e3cwHLUjez5IirIxkH
         rtFOZ+V4cRbnlUD7XllEeAYj9KOab5acipsDCsduzrcjemNF4tZYs/nkOsd0ngv6G0nW
         JV9A==
X-Forwarded-Encrypted: i=1; AJvYcCUg43n0UVR7OrFV4sMLkSzHvOTAtnXVCbcPyzh7Lh/MHDvQ24FlZf74aQWhaJMt4GlBT7SdEuZhA2CE1K/+J16PTosUt7PeJcoh2GFuQY0=
X-Gm-Message-State: AOJu0YyCE7MeSD29/a53tLBtcZjWpL0CAx47j2HwpV4H2Pn5z5s+iWEe
	Q+JiEEIKbtePFt11AZBJJJicCCo7zbXCkh/0kBKePTs11O3hsGpcJBY9hRXdnA==
X-Google-Smtp-Source: AGHT+IF6AdUYewFCcc9PdxDShniczEzSSWIGGS8subtQtPMt8KhqvrhhM8q4+/K9xVvLQqJwemNaJg==
X-Received: by 2002:a17:906:124b:b0:a46:8846:5aa0 with SMTP id u11-20020a170906124b00b00a4688465aa0mr4536995eja.56.1710947374911;
        Wed, 20 Mar 2024 08:09:34 -0700 (PDT)
Message-ID: <73314dc5-0145-4aa7-a3cd-23c943235392@suse.com>
Date: Wed, 20 Mar 2024 16:09:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vcpu: relax VCPUOP_initialise restriction for non-PV
 vCPUs
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240320135720.68894-1-roger.pau@citrix.com>
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
In-Reply-To: <20240320135720.68894-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.03.2024 14:57, Roger Pau Monne wrote:
> There's no reason to force HVM guests to have a valid vcpu_info area when
> initializing a vCPU, as the vCPU can also be brought online using the local
> APIC, and on that path there's no requirement for vcpu_info to be setup ahead
> of the bring up.  Note an HVM vCPU can operate normally without making use of
> vcpu_info.

While I'd agree if you started with "There's no real need to force ...", I
still think there is a reason: If one wants to use paravirt interfaces (i.e.
hypercalls), they would better do so consistently. After all there's also
no need to use VCPUOP_initialise, yet you're not disabling its use.

As said in reply to Andrew's reply, besides acting as a sentinel that
structure instance also acts as a sink for Xen accesses to a vCPU's
vcpu_info. By removing the check, you switch that from being a safeguard to
being something that actually has to be expected to be accessed. Unless
you've audited all uses to prove that no such access exists.

Jan

