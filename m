Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3642B3E132
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 13:12:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104489.1455532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut2SV-000615-I9; Mon, 01 Sep 2025 11:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104489.1455532; Mon, 01 Sep 2025 11:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut2SV-0005zO-FG; Mon, 01 Sep 2025 11:12:23 +0000
Received: by outflank-mailman (input) for mailman id 1104489;
 Mon, 01 Sep 2025 11:12:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut2SU-0005zH-OW
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 11:12:22 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87f914b1-8724-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 13:12:22 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-61cd3748c6dso8836059a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 04:12:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b041f6fb232sm335866266b.87.2025.09.01.04.12.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 04:12:21 -0700 (PDT)
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
X-Inumbo-ID: 87f914b1-8724-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756725141; x=1757329941; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3VsKv5+bqdM1NYUoHhmZMJgSPIEF0pw9EVn3rOUL28U=;
        b=PtAWexmW7UACWQuThdIeSwK/dQ1KhXSQ5+zNW2DFRlKAbdqhHQw6zYKsViESklBmrp
         ajDiH116ycb7X5BtpouGSFb3v96i9SjPhu0fHCpejCluFtVK5Hr9qsSSspe6rYQKxpJS
         QJh1XPbzVfauH0Wj91v1CY8AhGyLk45LFBWzEXBShCHTnpSJimYbotnAY2bXL+42vCaQ
         l2WHgJlsyPhN8dKNQ+5qSsNhfc4NMsRo93SCbOaVbIbnCd63cpS+NGXm0sS+Gbpn/Yty
         TA5ftxOSvs8ow+D2NOuT+rGijvFGXgGTvLQi4pyafKr/s8h58EYH8V2fS1nqbI5UglSm
         s7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756725141; x=1757329941;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VsKv5+bqdM1NYUoHhmZMJgSPIEF0pw9EVn3rOUL28U=;
        b=mDboZQABxXnIffE7TDxsIW60kZcW76ri/s3Szq8ZmWPQo7wZn/al3FnczlmFW62sev
         a1jnjvdTUyYrxvewgXruIxzy6k4kwJPlLt97in7OD2GC1XaZQwoacdl5QRG/u6dGCq4Y
         hB1xyzBF/EMbW4wvFN2PyPewNEH807RZ8YZvSEzke/EsAQ/D4kUL81kQSNlZ/GhnHFO5
         vC3x3wGU6WQVYEdDBhDEm+KyRMdMy26WvMEYAkslnv0hd7rNqome1TF51KMk0qpYkMZm
         jpDRMj0Z0y+KCX//nIePFwBuV38HAdGbMRJWGoeQCf8wisnD86zCrpUVF3KF/PEVsw/8
         pEdw==
X-Forwarded-Encrypted: i=1; AJvYcCVRIpVwpJWtFxatdyELJ9jc6oayIlAxst87gadLp2EGPaMXBIU1SmXl45VtGRvLqfXbaSymeE8QvfA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3AbdxqHnm6NtRZMYH/KLvsmLvMgdyiWtHPe29IVEaaAOnlucB
	a7tzIgfr1usvwaZcjKIfMuCaORv4HOEkLR0c/hhcjQFw1mWzJ/Aj6eTuH47MKmQ3HM3f4aY+vBu
	ocCU=
X-Gm-Gg: ASbGncv8J1788vDL6Qnk3km03Sk69SgBfEVwTHbGlqaUXS1Gtktuxjpb8Sl2RZ8GgdO
	76T9ffOGa5Hii008hmkhTGSMXCvSaKfPx8QcwCycCs76H3PKewYxhNPq9oFOTbZo0OAGxv1Kc2u
	LV68F4DWRoN7cRImRBNMTsPqfNBrEm5HwhYByZpz20+q9GpjpztudqjBwozADV7rbMgzyW466TC
	yJmGGM6gZ/ddOgUIgHtWnxK0z0rJuAEdBRo9mzHS6ipu8Tll/l7HLDVfF2f5pm8P9E59A5UEbwh
	A3AOZICFrobFpc/W7y6/R3hkxggejElWhAFtwTeh8OSJKNbq36YN4WKJNynlLfcL+ARHn+qyXWE
	E9fV5337NPP+P5gOYCJt2fTHZ/JOV71UgnK5LWWQJWp5Meo7LtoR7Yc5BRaVUgg2DAjc+xNr6kD
	xLGr/gV/4dCOcablKn5w==
X-Google-Smtp-Source: AGHT+IGMtKyiuByAuWAMrQmuNfif/jrQ9K1rVc6WtPtMFgzFKNILUlWPSbfEgtMAXDCQqGMBvZ9ygw==
X-Received: by 2002:a17:907:9629:b0:afd:d993:9f29 with SMTP id a640c23a62f3a-b01f20bfbf2mr830734066b.63.1756725141326;
        Mon, 01 Sep 2025 04:12:21 -0700 (PDT)
Message-ID: <1f6c189d-95b2-4600-9cea-73ef85cae873@suse.com>
Date: Mon, 1 Sep 2025 13:12:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/apic: Get rid of get_physical_broadcast()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250829161710.1056772-1-andrew.cooper3@citrix.com>
 <20250829161710.1056772-2-andrew.cooper3@citrix.com>
 <7d1bf3ca-b7fd-4c42-a9af-157120828d6c@suse.com>
 <da85b22c-e176-412c-9d13-b7abcf4f3def@citrix.com>
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
In-Reply-To: <da85b22c-e176-412c-9d13-b7abcf4f3def@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.09.2025 13:03, Andrew Cooper wrote:
> On 01/09/2025 9:33 am, Jan Beulich wrote:
>> On 29.08.2025 18:17, Andrew Cooper wrote:
>>> This is a port of Linux commit 517234446c1a ("x86/apic: Get rid of
>>> get_physical_broadcast()") to Xen.  Thomas Gleixner notes:
>>>
>>>   There is no point for this function. The only case where this is used is
>>>   when there is no XAPIC available, which means the broadcast address is 0xF.
>>>
>>> In Linux, users of get_physical_broadcast() have already been hidden behind
>>> CONFIG_X86_32 suggesting we can drop all of this, but that's a task for some
>>> other time.
>>>
>>> In Xen as with Linux, setup_ioapic_ids_from_mpc() and io_apic_get_unique_id()
>>> are only called in pre-xAPIC cases, so can use a broadcast ID of 0xf.  The
>>> only other user is __print_IO_APIC() for diagnostics, which can simply drop
>>> the check.
>> For setup_ioapic_ids_from_mpc() in Linux that's partly because it gained an
>> Intel && !APIC_XAPIC() check which we don't have.
> 
> In Xen, setup_ioapic_ids_from_mpc() has a comment and an xAPIC check at
> the start of the function.
> 
> We're lacking Linux commit a38c5380ef9f "x86: io_apic: Split
> setup_ioapic_ids_from_mpc()" which moved the check to the caller.
> 
> Perhaps I should s/called/used/ in the commit message?

Maybe, but I wouldn't insist.

Jan

