Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BC5B11806
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 07:38:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057099.1425025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufB8J-0007lp-4I; Fri, 25 Jul 2025 05:38:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057099.1425025; Fri, 25 Jul 2025 05:38:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufB8J-0007il-0Q; Fri, 25 Jul 2025 05:38:15 +0000
Received: by outflank-mailman (input) for mailman id 1057099;
 Fri, 25 Jul 2025 05:38:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L813=2G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ufB8H-0007if-E4
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 05:38:13 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8df55aa3-6919-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 07:38:12 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45618ddd62fso18336415e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 22:38:12 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f2ab:e91f:46e4:60d0:c444?
 (p200300cab711f2abe91f46e460d0c444.dip0.t-ipconnect.de.
 [2003:ca:b711:f2ab:e91f:46e4:60d0:c444])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45870532b5asm40430895e9.5.2025.07.24.22.38.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 22:38:11 -0700 (PDT)
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
X-Inumbo-ID: 8df55aa3-6919-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753421892; x=1754026692; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l9s/fvg6/A8qfchhSyUYK6UfFkN+6ejbsyDWm+Id1No=;
        b=IU1RzixrIKxW/ujhP1vPqoZFpO7rsClVkn/6ly7EwwRYvGAA3V9kMyo+N0V8JtzBtr
         UqrjB2pYU3AL/weUvV6vhb5PwR639WeOSh9hSmKC7OWyiLwC2pZ3w3wOvF05cbSStOWk
         7XnA5sLCicrWzaGZyevlTI23T/4D4RKZfvTQI7g1xvOoNTjIt/UqLCfTQwoazmb6ApHV
         z+rywwGc2XZwfHYshv5uiPmkm+AQuC9r02mUPNen0Mswiedbrl1ZbkiUQ50nVs0au7te
         G1E+sJ/hvOeAE4PKxQGIbV+6N8jHJqBITZK1pYsZNtrvjt1xRVH0nhsCt8HzuttQb/LC
         sxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753421892; x=1754026692;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9s/fvg6/A8qfchhSyUYK6UfFkN+6ejbsyDWm+Id1No=;
        b=sf1kZoq0zDm1zuAfxBW/VS49CO4Yu93o9kj9foOJ0LGx5HPTnhBKmvzAnB6PZvP/1o
         +igmahiPOLqm98JUR1JBQ76DqmW61I8DFlqE6SDjnv6qkw1Xmw948WGEOPwfCbkJPmtj
         I6xuV1fvok15ClTH3BKdmbD5LHJgex6nDp5npgq1nZPgQPLMu6P0VubT7OzyfHRxv9ei
         X0MkfpRBgH/QpMYok9qq7jyk1XJ2cfdTTnnhl56PQfMIiaPywMhE209JPeMiVVqYRFUa
         rPpURTRGS3sYppOUeFvfA9zI17EzF2aMVxDmvOX/4zSWulbTJl9sY1pIN/feROAXXAnc
         zNbA==
X-Forwarded-Encrypted: i=1; AJvYcCXYdZZpAtPnbltYA80P1UroLWUJBev4ukTjajMaOqd5jAel+ebrUw3Z18pt+fsu5bxkImTIfYlSpYg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxuIULRGvaj3nk6iuiFwctzIbeZmolZYrPjantbOq0o6nAgOgxV
	hy39WAmC6m++ENosTbldt3mAlOcNe5EivM5A2GgSBBAHKvefQV7tdkxyZ1OQ8gelgx8dTqIC4SE
	4ld4=
X-Gm-Gg: ASbGnctBDsVObIM/61ZhNwOkoLvb15SsnwevbxECylM8WNDtI6KHqCnUL+761f+pavD
	VT86cj63HVbnZsTEphwKt1qFtpKxO+SIyFIMm2VH7MbhyZame7n74JKT9DCY/Pw6HnMyLWxLtKk
	Sh9g4xyEkBM4ulcARrcBW+3ni1DSFYBYHYZb7nSHSG0XFK8pCxuiA43cuzWByFXvT1DM5KRbm/H
	tk6spColZtDj7gLcySsBVGjWF5cqti+X0LzEcOP6QIVqadXwnG4kSqCbrfZSi5vGmOfg4EitXdG
	M01rPy4U3ndudnUY5iTO4Tj+z8erXKLz8kLKpAuwiyfpWjcLdjdmW1uRnXblpuUrMs7YKdZLwk8
	ht7wqgJhqbx2BxGg/SSZbAP7BESsOGhxCDEMyVkKv1Y1GzFSnJxBLBy5BkjoDIV5LUefncJSmQw
	XKDyIvyBqb8rSkO1QKByPsTo0YTgURPCVLaWzwvFVLpEFPZSWnOtD6fP6s
X-Google-Smtp-Source: AGHT+IEltzPDry4NnONYdoj17m04FBfPaIzVoUAz/9chp6L+uv2Vf+y5YtgP1ldaaxbCQ/m/ecxFlQ==
X-Received: by 2002:a05:6000:2401:b0:3a4:d8f2:d9d with SMTP id ffacd0b85a97d-3b776666c8amr511197f8f.38.1753421891903;
        Thu, 24 Jul 2025 22:38:11 -0700 (PDT)
Message-ID: <2800af03-8844-4e9d-a56b-121f52f60cc7@suse.com>
Date: Fri, 25 Jul 2025 07:38:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen: move getdomaininfo() to domain.c
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Penny Zheng <Penny.Zheng@amd.com>, ray.huang@amd.com,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250722050410.853783-1-Penny.Zheng@amd.com>
 <0939219f-1c06-4d0d-a427-6b95b5943513@suse.com>
 <alpine.DEB.2.22.394.2507221738090.7043@ubuntu-linux-20-04-desktop>
 <f75df6d6-ede6-41a6-9412-1a9b073902b5@suse.com>
 <alpine.DEB.2.22.394.2507231327280.7043@ubuntu-linux-20-04-desktop>
 <89b615e1-3ed4-4cc9-9222-4149b5a27e2e@suse.com>
 <alpine.DEB.2.22.394.2507241820560.2549622@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2507241820560.2549622@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.07.2025 03:21, Stefano Stabellini wrote:
> On Thu, 24 Jul 2025, Jan Beulich wrote:
>> On 23.07.2025 22:30, Stefano Stabellini wrote:
>>> On Wed, 23 Jul 2025, Jan Beulich wrote:
>>>> On 23.07.2025 02:46, Stefano Stabellini wrote:
>>>>> On Tue, 22 Jul 2025, Jan Beulich wrote:
>>>>>> On 22.07.2025 07:04, Penny Zheng wrote:
>>>>>>> Function getdomaininfo() is not only invoked by domctl-op, but also sysctl-op,
>>>>>>> so it shall better live in domain.c, rather than domctl.c. Which is also
>>>>>>> applied for arch_get_domain_info(). Style corrections shall be applied at
>>>>>>> the same time while moving these functions, such as converting u64 to
>>>>>>> uint64_t.
>>>>>>>
>>>>>>> The movement could also fix CI error of a randconfig picking both SYSCTL=y
>>>>>>> and PV_SHIM_EXCLUSIVE=y results in sysctl.c being built, but domctl.c not
>>>>>>> being built, which leaves getdomaininfo() undefined, causing linking to fail.
>>>>>>>
>>>>>>> Fixes: 34317c508294 ("xen/sysctl: wrap around sysctl hypercall")
>>>>>>> Reported-by: Jan Beulich <jbeulich@suse.com>
>>>>>>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>>>>>>
>>>>>> I'm not convinced of this approach. In the longer run this would mean wrapping
>>>>>> everything you move in "#if defined(CONFIG_SYSCTL) || defined(CONFIG_DOMCTL)",
>>>>>> which I consider undesirable. Without DOMCTL, the usefulness of
>>>>>> XEN_SYSCTL_getdomaininfolist is at least questionable. Therefore adding more
>>>>>> isolated "#ifdef CONFIG_DOMCTL" just there may be an option. Similarly, as
>>>>>> mentioned on the other thread, having SYSCTL depend on DOMCTL is an approach
>>>>>> which imo wants at least considering. And there surely are further options.
>>>>>>
>>>>>> As indicated elsewhere, my preference goes towards reverting the final one or
>>>>>> two patches of that series. They can be re-applied once the dependencies were
>>>>>> properly sorted, which may (as per above) involve properly introducing a
>>>>>> DOMCTL Kconfig setting first.
>>>>>
>>>>> I don't think this is a good idea.
>>>>
>>>> And implicitly you say that what I put under question in the first paragraph
>>>> is a good way forward?
>>>
>>> I think it is OK.
>>>
>>> I also think "having SYSCTL depend on DOMCTL" is certainly worth
>>> thinking about. In terms of privilege and potential for interference
>>> with other domains sysctl and domctl don't seem different so it is
>>> unlikely one would want to disable one but not the other.
>>>
>>> Another idea is to have a single kconfig for both SYSCTL and DOMCTL: we
>>> don't necessarily need to offer individual kconfig for every feature.
>>> From a safety point of view, we want to disable them both.
>>
>> Then again (and going against the thought of making SYSCTL depend on DOMCTL)
>> there may be a desire to query / alter certain properties of the system as
>> a whole, without also having that need for individual domains. But yes,
>> covering both with a single control also is an option to consider.
> 
> If making SYSCTL depend on DOMCTL and/or a single kconfig for both
> SYSCTL and DOMCTL are both way forward, then we can take this patch as
> is?

In both of the named cases this patch simply wouldn't be needed. Once the
conversion work was done, that is. And to be frank, I'm not happy to see
the function move out and then back in.

Jan

