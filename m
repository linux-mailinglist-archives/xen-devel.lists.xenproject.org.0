Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F150A88553F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 09:07:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696231.1086943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnDSG-0000tl-Gf; Thu, 21 Mar 2024 08:07:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696231.1086943; Thu, 21 Mar 2024 08:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnDSG-0000sT-CU; Thu, 21 Mar 2024 08:07:16 +0000
Received: by outflank-mailman (input) for mailman id 696231;
 Thu, 21 Mar 2024 08:07:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ILtd=K3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnDSF-0000sL-Tt
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 08:07:15 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 059f1688-e75a-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 09:07:12 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d485886545so12215821fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 01:07:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e25-20020a170906845900b00a449026672esm8183817ejy.81.2024.03.21.01.07.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 01:07:11 -0700 (PDT)
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
X-Inumbo-ID: 059f1688-e75a-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711008432; x=1711613232; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XNUZ3U/Fwfx76i0s24VQTCYrKYugniQ3n/ljjcXCIyo=;
        b=afeT+S3jg2MBCly37k7wNx+JFJKACyD41wIREqf8fnCJ358VfnsSuOl6RjGx2Aqln+
         msDnOzJKqruc8/E0R5fpWC4g4H1v+dFNtoKwwcclu2Fa3K3yHnh4ZWX6DlbxMvjOlIH2
         jghfUtEZMT2JFPKTnQrg2iHBFr3NCMu0HvZm8EMFpIkkD4pJID/Igw9S7MOPPQ6oYYAk
         U8Ijoa/DBXFgUZiO0dfv4HmruMZexDPaVlmQatSnt55HIwsRuHk41pD3mwiLRlo200T+
         oOzthloG9nzUyjHaLCmRwHNO2Sl7b1FU2+h/mUAwgJRdCA2bx+kZq99QPk40N9RjmvwY
         unSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711008432; x=1711613232;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XNUZ3U/Fwfx76i0s24VQTCYrKYugniQ3n/ljjcXCIyo=;
        b=Rrxc71+SM7OjAK6L/rSPgAhqa67zx/6hHH8+eopAfsZ1Sn/0BDSryCtofn9gsPOa1w
         3Nsb0Ao+TpZCryRRII8EjsatmDRlMHFfXymc8lpzI7mCuUuheuXcgM9OA9U3hHFXMFS+
         gfEUfNtivNDChuEHZL6SvfTENAL63TTLNY5sgk4Y8EfOiFcYV2YnmxH9/QvEoy7XxJ9/
         ofByLwMwbQ9ajSzQuAC0cCYwJosqHZ7FhqDq5SC5mBClPLiOKdpmuE3fYnzJqK2Chkak
         fGe0wBEv8Wd8c4BhbXplJriecs3DoaBvhN4Uv/PDmd9KeJ71FylRrAzzwWXT7f/hGuhS
         a4cw==
X-Forwarded-Encrypted: i=1; AJvYcCUw4T6QkwrdCRreRY47HW9E9d0dRFfavc+TS1zqW85Fo0+pcmHtv/VRGHZ5lH/7DsgJ+yYgdk3E38V6lvIIhP8LhbJ8nj8wyNiQyDAmFdQ=
X-Gm-Message-State: AOJu0YzMvlSf7yK6zYbAodk660k3f0ejxjNpxgAEAXzSZmpXNNsHlg1z
	WOPwtH1jjAuvrxdYTGrcpmvAOSZHnjTEKSFfb3D44KcXGPUSFf/3NH2SdtLmDg==
X-Google-Smtp-Source: AGHT+IFYqfChU4kOXeOyQPmKTGUiAsc1t/xKcUllqM5FF3YbAID5kB84xqcZFVq5hS0OZFMoT7o/WA==
X-Received: by 2002:a2e:2e0f:0:b0:2d3:3305:c37a with SMTP id u15-20020a2e2e0f000000b002d33305c37amr1061916lju.7.1711008431743;
        Thu, 21 Mar 2024 01:07:11 -0700 (PDT)
Message-ID: <4cc5d746-a50c-4819-a56e-512abf797ef2@suse.com>
Date: Thu, 21 Mar 2024 09:07:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vcpu: relax VCPUOP_initialise restriction for non-PV
 vCPUs
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240320135720.68894-1-roger.pau@citrix.com>
 <73314dc5-0145-4aa7-a3cd-23c943235392@suse.com> <ZfsPAj-ggY6unQef@macbook>
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
In-Reply-To: <ZfsPAj-ggY6unQef@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2024 17:29, Roger Pau Monné wrote:
> On Wed, Mar 20, 2024 at 04:09:33PM +0100, Jan Beulich wrote:
>> On 20.03.2024 14:57, Roger Pau Monne wrote:
>>> There's no reason to force HVM guests to have a valid vcpu_info area when
>>> initializing a vCPU, as the vCPU can also be brought online using the local
>>> APIC, and on that path there's no requirement for vcpu_info to be setup ahead
>>> of the bring up.  Note an HVM vCPU can operate normally without making use of
>>> vcpu_info.
>>
>> While I'd agree if you started with "There's no real need to force ...", I
>> still think there is a reason: If one wants to use paravirt interfaces (i.e.
>> hypercalls), they would better do so consistently. After all there's also
>> no need to use VCPUOP_initialise, yet you're not disabling its use.
>>
>> As said in reply to Andrew's reply, besides acting as a sentinel that
>> structure instance also acts as a sink for Xen accesses to a vCPU's
>> vcpu_info. By removing the check, you switch that from being a safeguard to
>> being something that actually has to be expected to be accessed. Unless
>> you've audited all uses to prove that no such access exists.
> 
> I'm kind of lost in this last paragraph, how is that different than
> what currently happens when an HVM vCPU >= 32 is brought up using the
> lapic and has no vpcu_info mapped?

I think this aspect was simply missed back at the time. And I think it
wants mentioning explicitly to justify the change.

As said in reply to Andrew, I don't think the dummy structure can be got
rid of. Nor can the checks here be (easily) removed altogether, i.e. your
change cannot (easily) be extended to PV as well. Even conditional removal
of the structure in !PV builds would first require all vcpu_info accesses
to gain a suitable conditional. Which may be undesirable, as some of these
may be deemed fast paths.

> Also, from a quick look it seems like sites do check whether vcpu_info
> == dummy_vcpu_info, otherwise we would already be in trouble.

Such checks exist in code managing vcpu_info, but not - afaics - in places
actually accessing it.

Jan

