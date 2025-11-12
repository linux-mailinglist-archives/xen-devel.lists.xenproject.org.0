Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C05FC5189F
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 11:02:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159645.1487961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ7g5-00070L-Qk; Wed, 12 Nov 2025 10:02:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159645.1487961; Wed, 12 Nov 2025 10:02:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ7g5-0006yY-Nc; Wed, 12 Nov 2025 10:02:13 +0000
Received: by outflank-mailman (input) for mailman id 1159645;
 Wed, 12 Nov 2025 10:02:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJ7g4-0006yR-5S
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 10:02:12 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6a7256f-bfae-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 11:02:09 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b7291af7190so101950466b.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 02:02:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bfa25454sm1540594666b.75.2025.11.12.02.02.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 02:02:08 -0800 (PST)
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
X-Inumbo-ID: a6a7256f-bfae-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762941728; x=1763546528; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dIJLZf1CFtolWEgSjwO7An0+GPUmbc4i4F4px3YqsZE=;
        b=UHOyg92IAICrY8fkATFCpsJm+C4fJXnwkiw7zeQ8P0T9/EorAVSR8k1mgV1R6AQVka
         WDql+ZvnwaV7Kps7OIW+MDAbjmmR/keqlwX3aqhKToWihTFQCc44sFOD7KQiYirUGOA5
         VoE1Xrm8Exe4/EIyVk0jd73JyJqZHMZVh91ieb7z63oxZcCMNLgBd3GAt96Xqy4jLRiv
         ZvjzE5fIK5FVljYB3s61JF4nhrQtScDm2xNXWtC7YA9yDpkx9I/7N3aAkn4dFzhF0i7Z
         yd+iwQOLV7iqPV1Sg0c5HLvZvKFYrOkTI+wqk8iP1cYj/CHo3Rwps0AW+JnO5j4MKd8f
         tbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762941728; x=1763546528;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIJLZf1CFtolWEgSjwO7An0+GPUmbc4i4F4px3YqsZE=;
        b=c5foKHGfJYuquc/ot14meYLBl3soUD6qzPS4+kI6ziUSYiwnrl2JdmR/cjIPKYmhnh
         6kdUGP9fUVyY137r60J4jaio9XlIJCVJ8rKvDVmNhVt1IRdkEWB01xM5s96NAWjHoV18
         mC6vP6dq2OSzhzG0FvXexZXRRNgFQ2KigCkQJSqYwxQ7j/JQYWfToGJ6pgFIpugl/+KC
         oqdxfi57XMNIiR9CDJw9+3WyOtKtp9JvWp2cJKsZppOkZqQBiR76IFObS6HioU3SShN0
         SDTtxa2UZi+PTHTgV52LRlWsdxfjOhI8K8EgheR94ifIsH8wFngiEsoVXy0fxgs2HVme
         aIKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe9BKaMKXwTL6sqKwfXViIZl6fEyA4QXbECENy4r0qoBIlISxdDuM86UjoRdXtG8OVQ34er0YhCxo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyyrc9NTq0s50tRyvwlSTSmMyl11o2Ng8HZCmPw3k7s+ckcJU/u
	th11Mq9F0217p9lkkCta+EIGfcALEz6SWQKkpuRz0c4X+nWMivOc4xSilbc8Kim1gQ==
X-Gm-Gg: ASbGnctp4ArD9iv9gMxdfs+bIe7VyAxwpkPtFAwyfLgVJmBTPXk0SkE0DiN66HyZaKL
	d7+FDsaqq4KmRSNJNQSfkv0uDowL/3XD4dX4j5rnROJXvEEhAAlBRlP7jLtVz1FyFM3d+H7ffTr
	RG3NbVOunNGpkFAVEwz/kkVSuy9t7VPkJJ1WD+YVqt5xBugBi9/sBNOsbsLo9JzUEpFKoIoIs+K
	KBejL+G3TaY0ZYRYCJPouT2raSBlFHT8fFsV9JbNkJwHMC+n6LlXCeMbPMG3PaXTLhJnQL3rGYz
	T01mexpEDW4ey5R1+ZAnRXcPTzq5MOGgHbnaQt288Hlz3I8pwrW/oKGEFind9tUdsNqti9hdPb5
	X/zBYeZYTf6QgN0Ut7bOyMAXg2tZMB+XVHCJumYJdJ4qzCeFxYCN8PXAisGlLTcfFeeG0+owqyD
	T8rfiC6YSMc6qT0sAE0MnludPPjVAyZBAsLTSLFMRiH96d+iihhf5pukPiqgkR2Ri7
X-Google-Smtp-Source: AGHT+IESjGUbmjPG+49pZQ8EsNiv/DSur+BhTL6kYGqfbJckOAcZ9NUJlM9NCSyw/rYqfMgZhDANtg==
X-Received: by 2002:a17:907:d0e:b0:b43:b7ec:b8a1 with SMTP id a640c23a62f3a-b733197ed5cmr269327266b.24.1762941728456;
        Wed, 12 Nov 2025 02:02:08 -0800 (PST)
Message-ID: <58508638-ecff-4507-a11a-8dd7ac52e61f@suse.com>
Date: Wed, 12 Nov 2025 11:02:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/28] xen/domctl: wrap domain_kill() with
 CONFIG_MGMT_HYPERCALLS
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "oleksii.kurochko@gmail.com" <oleksii.kurochko@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "Orzel, Michal" <Michal.Orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-16-Penny.Zheng@amd.com>
 <8c74774a-458b-4918-8d65-fcb3eacfe98b@suse.com>
 <DM4PR12MB845189415FBE1E8C250C81D2E1CCA@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB845189415FBE1E8C250C81D2E1CCA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.11.2025 09:58, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, October 30, 2025 8:44 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; oleksii.kurochko@gmail.com; Stefano
>> Stabellini <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Bertrand
>> Marquis <bertrand.marquis@arm.com>; Orzel, Michal <Michal.Orzel@amd.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Anthony PERARD <anthony.perard@vates.tech>;
>> Roger Pau Monné <roger.pau@citrix.com>; Shawn Anastasio
>> <sanastasio@raptorengineering.com>; Alistair Francis <alistair.francis@wdc.com>;
>> Bob Eshleman <bobbyeshleman@gmail.com>; Connor Davis
>> <connojdavis@gmail.com>; Tamas K Lengyel <tamas@tklengyel.com>; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH v3 15/28] xen/domctl: wrap domain_kill() with
>> CONFIG_MGMT_HYPERCALLS
>>
>> On 13.10.2025 12:15, Penny Zheng wrote:
>>> --- a/xen/arch/x86/mm/mem_sharing.c
>>> +++ b/xen/arch/x86/mm/mem_sharing.c
>>> @@ -1396,6 +1396,7 @@ int __mem_sharing_unshare_page(struct domain *d,
>>>      return rc;
>>>  }
>>>
>>> +#ifdef CONFIG_MGMT_HYPERCALLS
>>>  int relinquish_shared_pages(struct domain *d)  {
>>>      int rc = 0;
>>> @@ -1452,6 +1453,7 @@ int relinquish_shared_pages(struct domain *d)
>>>      p2m_unlock(p2m);
>>>      return rc;
>>>  }
>>> +#endif /* CONFIG_MGMT_HYPERCALLS */
>>>
>>>  static int range_share(struct domain *d, struct domain *cd,
>>>                         struct mem_sharing_op_range *range)
>>
>> Is this necessary? Shouldn't MEM_SHARING as a whole become dependent upon
>> MGMT_HYPERCALLS, then also covering XENMEM_sharing_op? (The same will
>> already implicitly happen for MEM_PAGING, due to its VM_EVENT dependency.)
>>
> 
> Yes, Since I didn't see VM_EVENT dependency for MEM_SHARING. I'm not 100% sure that whether memory sharing feature is dependent on VM_EVENT. Also as I roughly look through the codes in mm/mem_sharing.c, maybe only mem_sharing_notify_enomem() utilizes vm event subsystem.

Right, a little while ago (iirc in the context of your work) Tamas said the same.
But I didn't ask about VM_EVENT; I asked about MGMT_HYPERCALLS.

Jan

