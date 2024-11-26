Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 379E29D9891
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 14:33:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843754.1259366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFvgQ-0001va-KF; Tue, 26 Nov 2024 13:32:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843754.1259366; Tue, 26 Nov 2024 13:32:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFvgQ-0001u7-Gv; Tue, 26 Nov 2024 13:32:50 +0000
Received: by outflank-mailman (input) for mailman id 843754;
 Tue, 26 Nov 2024 13:32:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zjIj=SV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFvgO-0001u1-Ky
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 13:32:48 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb234d26-abfa-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 14:32:44 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-38246333e12so5577982f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 05:32:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fafe189sm13376917f8f.32.2024.11.26.05.32.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 05:32:44 -0800 (PST)
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
X-Inumbo-ID: eb234d26-abfa-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzEiLCJoZWxvIjoibWFpbC13cjEteDQzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImViMjM0ZDI2LWFiZmEtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjI3OTY0Ljg5NjM0Niwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732627964; x=1733232764; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ra0eIdjYGALw+ZjpwNUNl1qdEmuGXFvvXvKcw/MXBC4=;
        b=fiKjWTjOm9xcEUSazuaaDh6StWlQmUU8FQHEgfyL7tehVtX5c0x1JCAvZqJF2l1p3W
         k5GqWk9v4liHRcf16OpQluXqs4sbyrF4OJFOjRBqaejHPWNJN3TmWlHKQ0yJ6Mye6KUQ
         Z8bPYBnQWriBfeUJNdffXCL5SJDjhfy8ldWEPVRqhNK9erxWa4MbZ9ayrxG9cq1y0wW9
         MAZ0kY0VDn1lqdYGCpmiZmX1TEXRRFT8l9BtFWP380YDix95nW9jzMpWG/4xUw610/+B
         ri4FUIpazYE1c2OxI8EYXqCMAnx7i6wV2hTTYUGYTUpqYjF0CHTviMas3hi6CtJNFRpm
         Ic8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732627964; x=1733232764;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ra0eIdjYGALw+ZjpwNUNl1qdEmuGXFvvXvKcw/MXBC4=;
        b=NGKWdZHmHHicCFeT+b9827RTLxl/UK3lnj7rvwFtboySNq/2C9uTpqO/5TqlD0d4ps
         smNHY6Et1VdDyvunGrE2IJTkgmzlD9VGk59eWuBMUy9gJ9HUO5mLGxfrpk/kPF0vJNwb
         MlTHyxeR+o9mN54wGKOpB6V5/E5QasSE2imSKEpA3KuCjrY/Dok64Dx1pM53Fo7GahEh
         BzsImf0j7kyovmpbsqxRuiilfaj5hrIMuNqCKsJKUWIfgr+XOOzZ0+/8Sq5if5xlJuFm
         Kmvob8tzsQ21skjy3NHBaA2BlIenwmYr4Dt4XFAA84wPjbM9iRvnrUMoxvFbiTK5i5Bg
         Fswg==
X-Forwarded-Encrypted: i=1; AJvYcCVI7BAHmTx5CNbo3ts1+5ty9UzubT4sVw5ZZlCQDPjvEbZDeh9Xi17uh80zTkruAn8mTkLKACPD7wo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyefaSGfCSdlYGdlRLHcCTFmtLWJDoO9EJ/0O+J85FHKBp2oSI8
	dp43lvSwEoa21gF9N9LmPZ7gHUKchvP+CAnixNVkGEQijj5rEUwsd57OUnAD3w==
X-Gm-Gg: ASbGnctL9QcVomMnc90imIUljyNP8sK3gAbJOCf6unkEClLUk6Tv+iJxMTrvZzp90P8
	Bv03Yru6juBTBwt/XJf/0JyQ7wdzQFnqeTucDra7ItrRGno9S9JsycUAEEIZ4fnjXHm1e8UgFPs
	MaWlvOGzJKW91VuJE4q4rvqGPLqmbjQlq+6CHCRrQw1NawQbaftcuPpnhHhYzUcy3GqPzBia58y
	6dlMk7qCc/HsqkoNX+BVt3ZSOQHLliJXxaQ9d02uhN5IbDtyoOlJIU1M35Lpr+6ksJ7oD/9e0NQ
	RwyD+dS5P2PGyAEHU9RDN8frT51mrlXPUUA=
X-Google-Smtp-Source: AGHT+IGp9RfWAQf5sLBg44xbkYL00FVv8ea4U7BpvcPwnaulVHjR4N0QfAp+cRJ/+le3W3Pkp0n/Sg==
X-Received: by 2002:a05:6000:1f86:b0:382:503c:da45 with SMTP id ffacd0b85a97d-38260bc6ba4mr19137499f8f.38.1732627964302;
        Tue, 26 Nov 2024 05:32:44 -0800 (PST)
Message-ID: <1c0befb4-be58-48c4-af8c-680942b32758@suse.com>
Date: Tue, 26 Nov 2024 14:32:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] domain: Validate __copy_to_guest in
 VCPUOP_register_runstate_memory_area
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241126102653.25487-1-michal.orzel@amd.com>
 <db4de7c6-c955-43fd-ab25-947809f357a2@suse.com>
 <16367a7e-86c2-4e2f-8798-e789139a6c63@amd.com>
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
In-Reply-To: <16367a7e-86c2-4e2f-8798-e789139a6c63@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2024 12:24, Michal Orzel wrote:
> On 26/11/2024 11:40, Jan Beulich wrote:
>> On 26.11.2024 11:26, Michal Orzel wrote:
>>> For guests with paging mode external, guest_handle_okay() always returns
>>> success, even if the guest handle is invalid (e.g. address not in P2M).
>>> In VCPUOP_register_runstate_memory_area, we would then blindly set
>>> runstate_guest() for a given vCPU to invalid handle. Moreover, we don't
>>> check the return value from __copy_to_guest() and return success to the
>>> guest, even in case of a failure during copy.
>>
>> I'm afraid this is all deliberate, providing best effort behavior. For a
>> paging mode external guest, the handle may become valid subsequently. If
>> any __copy_to_guest() fail here, subsequent update_runstate_area() may
>> succeed (and success of the actual copying isn't checked there either).
> Hmm, I've never looked at that this way. I always thought that mapping must be in place
> before setting up handle. Is this concept really something used (e.g. in Linux) or just a
> way for us to provide excuse for not hardening the code because of a fear of regressions, etc.?

I'm pretty certain some common guest OS used such "early" registration at
some point. I don't recall whether that was Windows or Linux, nor - for the
latter - whether it was upstream (pv-ops) or the old forward ports from the
2.6.18-xen tree. And I can't say whether that may still be the case
somewhere. Nor that it was specifically the runstate area (it seems more
likely that it was the vCPU info area). Hence my desire for us to be
cautious.

Jan

