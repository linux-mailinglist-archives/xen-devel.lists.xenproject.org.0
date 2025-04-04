Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1A4A7B806
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 08:58:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937759.1338650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0az5-00006v-Rh; Fri, 04 Apr 2025 06:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937759.1338650; Fri, 04 Apr 2025 06:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0az5-00005p-O6; Fri, 04 Apr 2025 06:56:59 +0000
Received: by outflank-mailman (input) for mailman id 937759;
 Fri, 04 Apr 2025 06:56:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u0az3-00005h-Nt
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 06:56:57 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb818744-1121-11f0-9ffb-bf95429c2676;
 Fri, 04 Apr 2025 08:56:50 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39c2688619bso1076777f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 23:56:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c30096889sm3543417f8f.2.2025.04.03.23.56.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 23:56:49 -0700 (PDT)
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
X-Inumbo-ID: fb818744-1121-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743749809; x=1744354609; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=inRTDlAfEnNSsn2Uh92EmrLSbLyMJS4B3173BF1PyVU=;
        b=Dpq8LdY+dy5nw+noc/GdziyQim1oGAnE4pCYzdpDOdnpthLL9u9BvHpyKaD49G7vv0
         16W2fOk68C0Bk0sbbHp7sIQyjyLKXqGcgf7br2SRAfnTrE3yJbZmfUwYW0hxXSPBELiF
         zG8EXSkyKCyMawNJeflN7MDlh1WaxF9WIav7mz4krzZV1+9ZMFQOLD63/rZJO0uO3gER
         eeQTCfAQ0T8Yc8OdFBytuTVMyEwTBjfdYcK7dBe9hXnWb9+aoRJWWZQ1mLxLAjQ5vXmi
         qK7upR8CPK2Pti8JFZGDl3PhUrZDp4o40vAFY30gHs01qklq5szEBgZaQk5+wLcst02T
         UTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743749809; x=1744354609;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=inRTDlAfEnNSsn2Uh92EmrLSbLyMJS4B3173BF1PyVU=;
        b=FL5/651E8a4rSUTflBZJsLkaV8MNvLtYbDtrxvuljb05T6DIM79ojRDze+sATGgzfD
         i7GI26Tfq1hzcvL12fAU7ci9mt0fFqooA8VdRPIH6pqxk28/jMPmpmbd0Xvcvqz2ltgt
         IKjCKO50AhXy50L6TZOed+HaDVgS+TTL4mvCBSFdpJ9UubjjMpDy3E7g8GbR3QUB95p5
         6jT11OgTZrvUGCFTFCwPSy087Q7ac6UgIFi3BZR5acZwvvSmlwuVLba9g0hOH0Rlk/mn
         Qp7NkrdsUDjTn0RHE/m6dI+o+zsTbcUDnDVPSnOWmziem+KSfhzUYg8mABzi/jwI2bg8
         l/7A==
X-Forwarded-Encrypted: i=1; AJvYcCUkxudk0mmUHn6ZbrVU3d6eDIhK/F2cdAzebJLFwMF/odsOQHEizufa8oDhtY2ru4TxGVou43HIgl4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxi1XXmNRer68+z5tu97sHGgQXNGdblycOl2XU08NCq4aYKEUW3
	7TO54Mk04qiw8SaHjTL/I1TZ9hcspCMmluyhfe6swNqFEKrijrb8YJD7V/DhEg==
X-Gm-Gg: ASbGnctixk1lV7Qeg8QhBZO9Bgx/jDFHRFJ+FJ/8gMAe+pILOoSqHfWjeBkIFUJ2Dpy
	zRvuYXs1T3inXwZES4UPcUn9hY+xOR9uCbHKP1AzwksZzbVyJ9ljgnTwwYank/CS7JsHFi6I/kh
	lVn3QQFJkcpx5CPa/y6mguDa6RAICU1y3h0R7RxIICedDfGjEKtU/UeFXCOkew2D35PN1PiARlL
	oCMMJb5PdBn3EEJNf7lkgAx8tjIT505qEunBFp0usv73euxPo99ErDvruCrUQZ+Kq6yzrQ17eOF
	/nmVjpLXPtikQ+sSZtACb3JSZXflvwHGWBMtxJGipBntmK23KMDNNts3rDLUBlacydpoYeNcdGy
	Gw9IkPkuIbDCVFn7RDR5gS1BizZMtyg==
X-Google-Smtp-Source: AGHT+IGfd2bddJWT6El4nkMTdgAZnOUI4etdYkao2ODX6xTA2G1QKUFLWrOzk3HaH5SggFjYMTWP6w==
X-Received: by 2002:a5d:5c84:0:b0:391:2eb9:bdc5 with SMTP id ffacd0b85a97d-39cb35be53emr1441653f8f.23.1743749809445;
        Thu, 03 Apr 2025 23:56:49 -0700 (PDT)
Message-ID: <3c2127ec-63fb-457b-8229-fc8a2b9fbf00@suse.com>
Date: Fri, 4 Apr 2025 08:56:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/riscv: Increase XEN_VIRT_SIZE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <e5fa4219ccf43125e2489cc8c49b4404e6ed22ce.1743434164.git.oleksii.kurochko@gmail.com>
 <54ebdcb7-071f-411f-803a-930dc330a497@suse.com>
 <32264ccb-e566-41e0-973f-5bc7d874f970@gmail.com>
 <9d7e1553-3af8-4fc3-a400-8714d9b68411@suse.com>
 <30d8e316-aff5-498a-b2bd-448e0b2518ae@gmail.com>
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
In-Reply-To: <30d8e316-aff5-498a-b2bd-448e0b2518ae@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2025 18:20, Oleksii Kurochko wrote:
> 
> On 4/1/25 6:04 PM, Jan Beulich wrote:
>> On 01.04.2025 17:58, Oleksii Kurochko wrote:
>>> On 3/31/25 6:14 PM, Jan Beulich wrote:
>>>> On 31.03.2025 17:20, Oleksii Kurochko wrote:
>>>>> +        _AC(XEN_VIRT_START, UL) >> vpn1_shift;
>>>>> +    const unsigned long xen_virt_end_vpn =
>>>>> +        xen_virt_starn_vpn + ((XEN_VIRT_SIZE >> vpn1_shift) - 1);
>>>>> +
>>>>>        if ((va >= DIRECTMAP_VIRT_START) &&
>>>>>            (va <= DIRECTMAP_VIRT_END))
>>>>>            return directmapoff_to_maddr(va - directmap_virt_start);
>>>>>    
>>>>> -    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
>>>>> -    ASSERT((va >> (PAGETABLE_ORDER + PAGE_SHIFT)) ==
>>>>> -           (_AC(XEN_VIRT_START, UL) >> (PAGETABLE_ORDER + PAGE_SHIFT)));
>>>>> +    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(8));
>>>> Is it necessary to be != ? Won't > suffice?
>>> It could be just > MB(2). Or perphaps >=.
>>> = would make the build fail, wouldn't it?
> 
> I just realized that BUILD_BUG_ON() condition is compared to zero so actually everything what
> will make the condition true will cause a build fail as inside it used !(condition).

???

> So it seems like we have to check for XEN_VIRT_SIZE != MB(16) and change each time when XEN_VIRT_SIZE
> is increased.

I don't think so, but I need to first understand the point you make above.

Jan

