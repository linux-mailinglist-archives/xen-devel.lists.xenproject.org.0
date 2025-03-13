Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35399A5FAF6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:13:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912757.1318965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslBL-0006CP-35; Thu, 13 Mar 2025 16:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912757.1318965; Thu, 13 Mar 2025 16:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslBL-0006AM-0Y; Thu, 13 Mar 2025 16:13:15 +0000
Received: by outflank-mailman (input) for mailman id 912757;
 Thu, 13 Mar 2025 16:13:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsl6I-0001uS-9s
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:08:02 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54b7a509-0025-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 17:07:58 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso7541105e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:08:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a731019sm59691045e9.2.2025.03.13.09.07.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 09:07:59 -0700 (PDT)
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
X-Inumbo-ID: 54b7a509-0025-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741882080; x=1742486880; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F968EDtyxXKciLWHcXZkuA8Oqr6WkNLwLwiKKFbVZXo=;
        b=SJi4iWLhoYRZ2dU+8Ck+yZtWZS2gmQYRXOKGErUbgdPQ/uP58S8Oc7AeBv8u5qYSOa
         r6R3m1OcNfv+cjglUcFbNFUcR4AIrxwYttlZvSgqBpAQpdJmqrKWWRtxswGP/UARe0v3
         r+G6XtxavIWh/uJbMa5aBAnue71xStXkk+rJV/oS7rg3AIO9sBPQTr7OOMCDVp3/ICne
         Xl2cAW/okb+Pm9sUxcU68Mb2yVySSZ8gY0eN3wm5NUa++Ny4uK7Zf5ae4ZHDaU2fr5fk
         1unGl8m293CREXL7YelV2EWVwtZn9PxyNX1U4rdd8Z+JBjxHp5Ig1ASSZVKXfxuGIrae
         WBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741882080; x=1742486880;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F968EDtyxXKciLWHcXZkuA8Oqr6WkNLwLwiKKFbVZXo=;
        b=tMtbrquYXuY24R9gatDl+IR+O1ehtChwH5ZAkkiXALbU5wd2XkGNoQoQIbHlU+xf39
         Ymcn2SKmwd3UO/QUW0/gcOB7Lr4RVPHSb0sbzLS1cGsFjUHldRPM61gMg6zNax6km+q4
         3i3WENnNEn0xXvXsKEyqHU3WulrGXq6DIx70Ppl0m/0rMO+adlFo46wooNSD06Qe4sb0
         FbVGzJKquY/WmBF8FvVxj/BGlc5MPfEkiJfHGj7EwDhff85O8qnbSMEcwGwpKdKOemuM
         wHakc7y0PMK6CLeBxl15PaMKVa1JTROucS3OIEStsU/tigSgW3hMp+8qANOFSxDCxvje
         RcSw==
X-Gm-Message-State: AOJu0YzRUXiLQBTy8/SmKUbXwfMzJAR4bth1hSZU1s3kpCxDiwJaBZiv
	uBvYbJRidbaCKGCNhjXQeVsMdPvHrsDsO4BWW+KmjhHz5epfhjgAbbYgzmSUNIcY8WIuSII4gcE
	=
X-Gm-Gg: ASbGncsCpb0lO8o69oYoL4YHlyfVSGMTVOc83241GaDgg85Sod4bGHTi1hrc3fg9DBc
	n0Kgo+hl9TaAVJcHVNdraZfjO2TpbugsuXR8xO857qtvrxPOc/Bucnd07ZP/y65sWZ0zBcDi9RU
	bqIRnsFBqY2a2782fNJqHbWJ0mpz23R5NJlhlj+9t4RaBSd2nXTKffjy5TU1D47eQ4bc0LmZ1Nr
	C9Bx6k6+184QicIwOqEwtEQgd9FMT8gPgN1vqOn3KYIfJEujl7cJMhKrME2oXF7ZStudOaUei5Y
	sZD3GrZI7IYTkix8G258hya32PX5fQq1iRfVohr7tebk7mOCzDL7OpMizkuKNaMzbFYcna80UYy
	V8wvNf2jCB2sUyDY2ZDcLm/RRJmcyfA==
X-Google-Smtp-Source: AGHT+IG7zey9t8D/enPMHahwcwkShUrft3z5Y5zDeQGjOHFx+rQRMBReq6pFz6xyt7T2kRs9g8TXOg==
X-Received: by 2002:a05:600c:4fce:b0:43b:c0fa:f9dd with SMTP id 5b1f17b1804b1-43d01c25c64mr100357375e9.25.1741882080049;
        Thu, 13 Mar 2025 09:08:00 -0700 (PDT)
Message-ID: <5cb338cb-3e5d-4c3d-8ee6-6c0c7c76348e@suse.com>
Date: Thu, 13 Mar 2025 17:07:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/amd-iommu: Add interrupt remapping quirk for
 ath11k
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20250226211125.43625-1-jason.andryuk@amd.com>
 <Z8A9LYjgr92IignP@macbook.local>
 <1d3ac61a-1acf-46b3-91bc-1dcb8bab1559@amd.com>
 <Z9L-HPlfZhvIh8yn@macbook.local>
 <d3378c73-7185-4f9f-8e61-be12171dfc21@citrix.com>
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
In-Reply-To: <d3378c73-7185-4f9f-8e61-be12171dfc21@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.03.2025 17:02, Andrew Cooper wrote:
> On 13/03/2025 3:47 pm, Roger Pau Monné wrote:
>> On Thu, Mar 13, 2025 at 11:30:28AM -0400, Jason Andryuk wrote:
>>> On 2025-02-27 05:23, Roger Pau Monné wrote:
>>>> On Wed, Feb 26, 2025 at 04:11:25PM -0500, Jason Andryuk wrote:
>>>>> The ath11k device supports and tries to enable 32 MSIs.  Linux in PVH
>>>>> dom0 and HVM domU fails enabling 32 and falls back to just 1, so that is
>>>>> all that has been tested.
>>>> DYK why it fails to enable 32?
>>> In Linux msi_capability_init()
>>>
>>>         /* Reject multi-MSI early on irq domain enabled architectures */
>>>         if (nvec > 1 && !pci_msi_domain_supports(dev,
>>> MSI_FLAG_MULTI_PCI_MSI, ALLOW_LEGACY))
>>>                 return 1;
>>>
>>> MSI_FLAG_MULTI_PCI_MSI is only set for AMD and Intel interrupt remapping,
>>> and Xen PVH and HVM don't have either of those.  They are using "VECTOR", so
>>> this check fails.
>> Oh, interesting.  So classic PV MSI domain supports
>> MSI_FLAG_MULTI_PCI_MSI, even when no IOMMU is exposed there either.
>>
>> Thanks, so it's nothing specific to Xen, just how Linux works.
> 
> This is something which TGLX and I have discussed in the past.  It is a
> mistake for any x86 system to do MSI multi-message without an IOMMU.

Well, with PVH there always will be an IOMMU, just that Linux can't see
it. Even with PV it should be the hypervisor to determine whether multi-
message MSI is possible. Hence how the classic (non-pvops) kernel had
worked in this regard.

Jan

> MSI multi-message gets you a power-of-2, aligned, block of vectors, up
> to a maximum of 32, which must always target the same CPU.
> 
> The LAPIC prioritisation is on groups of 16, aligned, vectors.
> 
> If MSI has 16 or fewer vectors, then any interrupt causes all others to
> be blocked owing to LAPIC behaviour.
> 
> With 32 vectors, you can get two vectors (one from the first 16, one
> from the second 16) where the higher vector can interrupt the lower
> one.  And you pay 32 vectors for this.
> 
> With the IOMMU, every message gets a controllable CPU and controllable
> priority, because they come from the IRTE, not the device.
> 
> Removing Multi-MSI support makes vector allocation much easier because
> you you never need to allocate/move blocks.
> 
> ~Andrew


