Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD3B942D67
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 13:40:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768491.1179319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ7gI-0002P8-QH; Wed, 31 Jul 2024 11:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768491.1179319; Wed, 31 Jul 2024 11:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ7gI-0002Mz-Nh; Wed, 31 Jul 2024 11:39:46 +0000
Received: by outflank-mailman (input) for mailman id 768491;
 Wed, 31 Jul 2024 11:39:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZ7gG-0002Mt-TU
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 11:39:44 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 918c537d-4f31-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 13:39:38 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-530ae4ef29dso1756671e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 04:39:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad411b1sm756039866b.125.2024.07.31.04.39.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 04:39:41 -0700 (PDT)
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
X-Inumbo-ID: 918c537d-4f31-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722425982; x=1723030782; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+6fYC5mahefV2YP5/svw79TEY+oy9eFPkzq2UWAj5js=;
        b=BsV83/FCIHmryP/UmUByjaQ8jeXEzLJtsFmS83vQDfSEGoAiSxRTL6kXTdaluK3hoB
         7+vOdwIvjsxDfq+vKrkK9bCc5pTi6sQItYRKuGbKLAfLQkFZYmF2ZNQzjUVmHi+vsxTy
         f8BIg75Xjn021b5l7zspDvfDOl5fa8liIQNFQkY3ewM1V7rk2D4Ktb3ASTYSKCNSxTad
         0SguSQsKBGq9WLA1K5hulB9XPiWaKpIHU0zUFDt9RSzoE5aQ7VD5vz8MNzXCGND2KQdS
         rWLrL0IV19qYjmJaqNphVo0ZJEth+xMX8EGfaPLgR5XeKzd+VEjpSzSNaCADedggYQ3T
         Zs6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722425982; x=1723030782;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6fYC5mahefV2YP5/svw79TEY+oy9eFPkzq2UWAj5js=;
        b=cCtz4VOsyr/cbIyUpSRwfdJGE3wUimCaTf/WPQxXuDRsNbJ5Wa42ZcNQlBK125n2Le
         VwsDHf3rhW6086zMy8/NqBwl757uat7Lg6J6k5Khv88Z7pku9U/mvt1SJjXb+HhbD7In
         uH+8yT7SH5b7H0WhqCayMl8d+an4mWBvOd5CCjr6ytinH4yMUVefCmCBuZHQNVhorxJN
         Nx4Xbk4nHM1uxN9jRijQjdzdH6q6Sow3F6+zRRhbARKLzyFf6HSFvreEsJNdC8rD/Ab9
         271o7kZjJ3m8xJzuU6eAPezt6AnSt5WN30XMQxkJDwPju4ydnqPgQaQ++/2Y2oTCLeje
         M7Nw==
X-Gm-Message-State: AOJu0YzhRtCKWC0j6pNu6uSIDjrxZAjYrd06pC+/B8hQfdtat+CVP4qR
	wP+o6DNl3OOqYZ9na61YvGZj82nVuyfbPo+GZraRhK5izUCg22OUq7C7N40w6g==
X-Google-Smtp-Source: AGHT+IFeGk326gQ6y1oKRHJu69G9C+oq4q/dmxLIvjld7UKG/8Vhr3bjsZjHy9fg5YnSjUKehIEWgg==
X-Received: by 2002:ac2:43d2:0:b0:52f:cd03:a823 with SMTP id 2adb3069b0e04-5309b2cac8cmr11855108e87.45.1722425982261;
        Wed, 31 Jul 2024 04:39:42 -0700 (PDT)
Message-ID: <ff922c7a-aa66-4b23-8b9f-63b0b403ff14@suse.com>
Date: Wed, 31 Jul 2024 13:39:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-3-Jiqian.Chen@amd.com> <Zqnswi7ihOhMxPsi@macbook>
 <0aa0982a-30b3-43cd-9a9e-4542d7cb583f@suse.com> <Zqn014wCEfWhyo1-@macbook>
 <8ff685a6-0cbd-45cd-a818-4535a040c478@suse.com> <Zqn7HEuooChgRCuf@macbook>
 <d65ae152-22ee-4a57-8ff4-43ef0c234f5f@suse.com> <ZqoF55yapMxGN_WM@macbook>
 <fa33fbf8-32b6-48dc-a30c-dd76b021a76d@suse.com> <ZqogJVHV36ytYVP1@macbook>
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
In-Reply-To: <ZqogJVHV36ytYVP1@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.07.2024 13:29, Roger Pau Monné wrote:
> On Wed, Jul 31, 2024 at 11:55:35AM +0200, Jan Beulich wrote:
>> On 31.07.2024 11:37, Roger Pau Monné wrote:
>>> On Wed, Jul 31, 2024 at 11:02:01AM +0200, Jan Beulich wrote:
>>>> On 31.07.2024 10:51, Roger Pau Monné wrote:
>>>>> I agree with (a), but I don't think enabling PVH dom0 usage of the
>>>>> hypercalls should be gated on this.  As said a PV dom0 is already
>>>>> capable of issuing PHYSDEVOP_{,un}map_pirq operations against a PVH
>>>>> domU.
>>>>
>>>> Okay, I can accept that as an intermediate position. We ought to deny
>>>> such requests at some point though for PVH domains, the latest in the
>>>> course of making vPCI work there.
>>>
>>> Hm, once physdev_map_pirq() works as intended against PVH domains, I
>>> don't see why we would prevent the usage of PHYSDEVOP_{,un}map_pirq
>>> against such domains.
>>
>> Well. If it can be made work as intended, then I certainly agree. However,
>> without even the concept of pIRQ in PVH I'm having a hard time seeing how
>> it can be made work. Iirc you were advocating for us to not introduce pIRQ
>> into PVH.
> 
> From what I'm seeing here the intention is to expose
> PHYSDEVOP_{,un}map_pirq to PVH dom0, so there must be some notion of
> pIRQs or akin in a PVH dom0?  Even if only for passthrough needs.

Only in so far as it is an abstract, handle-like value pertaining solely
to the target domain.

>> Maybe you're thinking of re-using the sub-ops, requiring PVH domains to
>> pass in GSIs?
> 
> I think that was one my proposals, to either introduce a new
> hypercall that takes a GSI, or to modify the PHYSDEVOP_{,un}map_pirq
> in an ABI compatible way so that semantically the field could be a GSI
> rather than a pIRQ.  We however would also need a way to reference an
> MSI entry.

Of course.

> My main concern is not with pIRQs by itself, pIRQs are just an
> abstract way to reference interrupts, my concern and what I wanted to
> avoid on PVH is being able to route pIRQs over event channels.  IOW:
> have interrupts from physical devices delivered over event channels.

Oh, I might have slightly misunderstood your intentions then.

>> I think I suggested something along these lines also to
>> Jiqian, yet with the now intended exposure to !has_pirq() domains I'm
>> not sure this could be made work reliably.
> 
> I'm afraid I've been lacking behind on reviewing those series.
> 
>> Which reminds me of another question I had: What meaning does the pirq
>> field have right now, if Dom0 would issue the request against a PVH DomU?
>> What meaning will it have for a !has_pirq() HVM domain?
> 
> The pirq field could be a way to reference an interrupt.  It doesn't
> need to be exposed to the PVH domU at all, but it's a way for the
> device model to identify which interrupt should be mapped to which
> domain.

Since pIRQ-s are per-domain, _that_ kind of association won't be
helped. But yes, as per above it could serve as an abstract handle-
like value.

Jan

