Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C078056E2
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 15:11:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647925.1011702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAW90-00071G-PY; Tue, 05 Dec 2023 14:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647925.1011702; Tue, 05 Dec 2023 14:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAW90-0006xg-MH; Tue, 05 Dec 2023 14:11:26 +0000
Received: by outflank-mailman (input) for mailman id 647925;
 Tue, 05 Dec 2023 14:11:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAW8y-0006eb-DM
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 14:11:24 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bd27c5c-9378-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 15:11:23 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33349b3f99aso1790169f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 06:11:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fs20-20020a05600c3f9400b0040b5517ae31sm21649714wmb.6.2023.12.05.06.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 06:11:22 -0800 (PST)
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
X-Inumbo-ID: 2bd27c5c-9378-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701785483; x=1702390283; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A07R8nZe2kZ1OoLl3Eyhf5BWSkwzYxMlQyHCJgZQb6U=;
        b=XPqBRs2X6JWFF9ydWSdF5N5keVMvrHg26RD/L5vf8Kfpwyq9QLe2ZXMkOIkS9Fo919
         tZenc9dO2oO2vfAtW83Qyg7wmieJ0SiSw5fgW5Qri2ZxzoZvt8enj9UFJovMokwvW7Mx
         btyZ8vEVFaxfUZP6HM6eCFayrOPFpHXk7SDcQ9SaqnHbj+eSt9Ihf3DO4t8oUWKOJ9E8
         E3GbktBF5t50JXnxmIXoOcgIQpYYJ9DQ+t4Z48yRqky7HGhpL9hxQ81RJ2R7rLS73Nsp
         /VeiZ404hC3uPaJvj2pP5FVrvBLDxNrfnabim3lAevWPy+xPX+pTeIkT7c3RRQSPVpot
         5xHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701785483; x=1702390283;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A07R8nZe2kZ1OoLl3Eyhf5BWSkwzYxMlQyHCJgZQb6U=;
        b=vAU4f9aLassmpaAZXvxyZG+5QiqHTnVv73elCRqO8G8y4Ieok4uRD3pWpvczqZr0sW
         65o/tGqGD7nknE5oemD5nWPZRMCJ5simgqKH/3u34XqWvIpuKvEFhzS9bEttbfAtxPRM
         DazS+Ps+2pmPRVPH7KE9+l1gj527yZCTiSL1n81xsnWEsmcpf3wv3m2eIQZBVk2p9RuE
         HW6D34/2b30gzZGNsSCv2Q0afVZvg9KvTY7q4K8PyNUoMo+yKF8IMPKKIPmW5q1lFSWy
         uot3xJH4LQ1tNgqJZcYtqmGN48Rapisux2N0zmfaBWSXbUMPg6RR2embxSl1csfo7h2M
         Y9dg==
X-Gm-Message-State: AOJu0YyjQbor1t9HlCm7gFsS5S8LTJdby82PNrNLCxXBFKE0B//TvtKQ
	p8eTuTAVTnObfR9WCAb9KH5D
X-Google-Smtp-Source: AGHT+IHGTpOyJxWtBgyyE3YgZd3wWAOzr+t2VAg1iC8qJzqjhAQgo42XlrXN2wlkZp1mdWphzemScw==
X-Received: by 2002:a05:600c:354c:b0:407:8e85:89ad with SMTP id i12-20020a05600c354c00b004078e8589admr531251wmq.14.1701785483126;
        Tue, 05 Dec 2023 06:11:23 -0800 (PST)
Message-ID: <cbfe6823-9092-4fa3-8641-81d9819fed09@suse.com>
Date: Tue, 5 Dec 2023 15:11:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen: make include/xen/unaligned.h usable on all
 architectures
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Arnd Bergmann <arnd@arndb.de>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20231205100756.18920-1-jgross@suse.com>
 <20231205100756.18920-2-jgross@suse.com>
 <1984c65c-72d8-4850-9886-f2b0766224a5@xen.org>
 <e8df45d3-1d7d-432b-b0ca-7532d4b35eae@suse.com>
 <96ed8aa3-f92f-4b33-a846-549cfda14548@xen.org>
 <3789ced7-e320-4e32-bda9-3039551a7117@suse.com>
 <652bdb77-6f2d-4fe0-9ae1-132be50962e3@xen.org>
 <57eb9981-26e6-4281-ab31-78fb5b7427b1@suse.com>
 <c65b22b2-ca1c-4c4c-9aa5-6cf74c0fdc6b@xen.org>
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
In-Reply-To: <c65b22b2-ca1c-4c4c-9aa5-6cf74c0fdc6b@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.12.2023 15:01, Julien Grall wrote:
> On 05/12/2023 13:59, Jan Beulich wrote:
>> On 05.12.2023 14:46, Julien Grall wrote:
>>> On 05/12/2023 13:41, Juergen Gross wrote:
>>>> On 05.12.23 14:31, Julien Grall wrote:
>>>>> Anyway, given you don't seem to have a use-case yet, I would simply to
>>>>> consider to surround the declaration with an a config which can be
>>>>> selected if unaligned access is supported.
>>>>
>>>> Like in xen/common/lzo.c et al?
>>>
>>> Just to clarify, I am suggesting to add in unaligned.h:
>>>
>>> #ifdef CONFIG_HAS_UNALIGNED_ACCESS
>>>
>>> your definitions
>>>
>>> #endif
>>
>> But that would be wrong: HAS_UNALIGNED_ACCESS would be there to indicate
>> one does _not_ need any special accessors.
> 
> I am guessing you are disagreeing on the name rather than the concept? 
> If so, what about CONFIG_UNALIGNED_ACCESS_ALLOWED?

Not really, no. Of course the name needs to properly express the purpose.
But I don't see why a Kconfig control would be appropriate here. You simply
want to provide accessors to unaligned data. Nobody needs to use them, but
when you have to, they ought to be there. A Kconfig control (of the name
you suggested first) would be helpful to not penalize architectures which
can do unaligned accesses without any helpers (in case the code generated
through the helpers turned out sub-optimal).

Jan

