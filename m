Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F9FAB7E46
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 08:47:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984790.1370733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFSNi-0007jo-Nq; Thu, 15 May 2025 06:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984790.1370733; Thu, 15 May 2025 06:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFSNi-0007gv-K1; Thu, 15 May 2025 06:47:50 +0000
Received: by outflank-mailman (input) for mailman id 984790;
 Thu, 15 May 2025 06:47:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFSNh-0007gl-E3
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 06:47:49 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8383a8b4-3158-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 08:47:48 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5fcc96b6a64so1167970a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 23:47:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad21985340fsm1045211066b.167.2025.05.14.23.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 23:47:47 -0700 (PDT)
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
X-Inumbo-ID: 8383a8b4-3158-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747291668; x=1747896468; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B4F3dvZtX8E/G76kxLLrrIEWmKyp7XFxWuNqrIQdBfw=;
        b=SmGjAIVahKKcEG17WZnPkSAKmtm+astC5DoYppwqMuTWNSahRJxUR0iMV/QCzvtive
         sIofFz/V9mwk6zZXF0/nvVhtHzndxcYZXVady+UA57cd2K7z8JFxPqg7uWBYs1qvTJDd
         UXTK3ZYg4Q9VgyNC4rbJLM5PhymfkuEPW2kzGfmQhTIpeUA/pNeyCwfFuQrxBnQ0TSli
         FMfiWcBguQUltfwNyT1hiGib0dmus7N2KIvC/Gyug/E2Uzh9p8xML0CqbvkfQN2Q4vpB
         tIdiFGOX8xmMFztvnj3a06IHYwRl6XXOMYBVIPBEHSWsyVJ/T2wrONBdq9qHrgY3zrzh
         vQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747291668; x=1747896468;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4F3dvZtX8E/G76kxLLrrIEWmKyp7XFxWuNqrIQdBfw=;
        b=WYq1IQCZdsflcxwP652RB8wHvEgzwT+5Ygg6srf2m2nF04ZCRq7j0LfOfqdryXbw3C
         iAFrYLokJYv8syYnLNeBpg6W8n1EYhCg3bMxLVzX5oIT+IJvENJFipGx89eP1gRy1HGF
         Cd7lOPBjwxpmT6N96IgoGnTpqe7LgXd+MY3MbchsxONbqyuA+UsmnUrFQjveMzewwzx3
         q9OaqwnJWPPoAe2lxBZZj3q4+xgzzjNKst1j/DNgRpAYWZmlVtxiivlSR6KM0kYxfzB9
         XZQSdt0clZswaveERRKEUdg9Na/WG8CG6h19mStV37A2rANzilnsogHx0AwaBjETjf4q
         Ucqw==
X-Gm-Message-State: AOJu0YwufxWdjurd8XyVhOCC1mmscrjy+/1ELYYRrhKZYLpasaIjHNDr
	J/jsgY8DVu6GJMd5UlhBOiza0jJkZBixs5ivSTj5YvBjgxtxIp79t4yZNrWmVw==
X-Gm-Gg: ASbGncs3oHk0nnVegHIrLRr0qGWCg8hb07ATQdfU4G6zD6Dz0nREimUBNvgHBP7VqsH
	dlfL7bWgetZQRRSu9rFo5XRKSYck9lDeCScK2e8TlL6WSqQ1ocO0daYU6pW7FeZTNKuLKGTozhZ
	NI6AmM8uWO59ip0Ps3AAsTc9tSTA7ejVaVC/BGmr+It5SJHvKbvNF7kLc+rmmXqcS44xviQITv1
	5mPdlzISsy9Eo7ybwdSVweHixIBu5nUqWF9/jwdQ4Q2L6nwgV/rRdiyXbZoxNcw3AehYO6M1ao5
	VIr7xZh6r7TOt3U/LK3LoKWob/lh8V5nbvN26kJ9hQabBq9f7v0wuWgXnTJyy6G868Tu9rExgGh
	jF28EuH20ABVZzNLLWLnLFWftSqwjFo5owpVg
X-Google-Smtp-Source: AGHT+IH/DcKcCEfnMxN+9dSFioIPzt2CNm63hHKM0S6Q4N+Ag95ko9F9ytFqiYLb/om5tzLnm+zU3A==
X-Received: by 2002:a17:907:7f28:b0:ac3:3cff:268 with SMTP id a640c23a62f3a-ad4f723fd41mr598650866b.30.1747291667677;
        Wed, 14 May 2025 23:47:47 -0700 (PDT)
Message-ID: <c6dda7b1-1c99-4fb9-9f0b-54cfcffccb30@suse.com>
Date: Thu, 15 May 2025 08:47:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] x86/HVM: limit cache writeback overhead
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
 <9274fbb1-c1be-9570-ecfc-8f0ac9a1f42b@suse.com>
 <aCST30l2N9X6AOgr@macbook.lan>
 <be7e2d91-69f5-4168-9d2c-57d3f6dac26f@suse.com>
 <aCSy1sSjZ6MiHOIT@macbook.lan>
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
In-Reply-To: <aCSy1sSjZ6MiHOIT@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.05.2025 17:12, Roger Pau Monné wrote:
> On Wed, May 14, 2025 at 03:20:56PM +0200, Jan Beulich wrote:
>> On 14.05.2025 15:00, Roger Pau Monné wrote:
>>> On Wed, May 03, 2023 at 11:47:18AM +0200, Jan Beulich wrote:
>>>> There's no need to write back caches on all CPUs upon seeing a WBINVD
>>>> exit; ones that a vCPU hasn't run on since the last writeback (or since
>>>> it was started) can't hold data which may need writing back.
>>>
>>> Couldn't you do the same with PV mode, and hence put the cpumask in
>>> arch_vcpu rather than hvm_vcpu?
>>
>> We could in principle, but there's no use of flush_all() there right now
>> (i.e. nothing to "win").
> 
> Yes, that will get "fixed" if we take patch 2 from my series.  That
> fixes the lack of broadcasting of wb{,no}invd when emulating it for
> PV domains.
> 
> I think this patch would be better after my fix to cache_op(),

Right, this matches what I said ...

> and
> then the uncertainty around patch 2 makes it unclear whether we want
> this.
> 
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> With us not running AMD IOMMUs in non-coherent ways, I wonder whether
>>>> svm_wbinvd_intercept() really needs to do anything (or whether it
>>>> couldn't check iommu_snoop just like VMX does, knowing that as of
>>>> c609108b2190 ["x86/shadow: make iommu_snoop usage consistent with
>>>> HAP's"] that's always set; this would largely serve as grep fodder then,
>>>> to make sure this code is updated once / when we do away with this
>>>> global variable, and it would be the penultimate step to being able to
>>>> fold SVM's and VT-x'es functions).
>>>
>>> On my series I expand cache_flush_permitted() to also account for
>>> iommu_snoop, I think it's easier to have a single check that signals
>>> whether cache control is allowed for a domain, rather that having to
>>> check multiple different conditions.
>>
>> Right, adjustments here would want making (in whichever series goes in
>> later).
>>
>> For both of the responses: I think with patch 1 of this series having
>> gone in and with in particular Andrew's concern over patch 2 (which
>> may extend to patch 3), it may make sense for your series to go next.
>> I shall then re-base, while considering what to do with patches 2 and 3
>> (they may need dropping in the end).

... here.

Jan

> Makes sense, I still need to get over your feedback on my series, I've
> been distracted with other stuff.
> 
> Thanks, Roger.


