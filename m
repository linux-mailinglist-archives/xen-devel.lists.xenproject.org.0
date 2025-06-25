Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2465AAE7E6D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 12:04:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024598.1400431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUMzP-0008AW-9p; Wed, 25 Jun 2025 10:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024598.1400431; Wed, 25 Jun 2025 10:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUMzP-00088L-6G; Wed, 25 Jun 2025 10:04:23 +0000
Received: by outflank-mailman (input) for mailman id 1024598;
 Wed, 25 Jun 2025 10:04:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QoV+=ZI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUMzN-0007uJ-QX
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 10:04:21 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3a69a1a-51ab-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 12:04:21 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso5319399f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 03:04:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d86ef84fsm127050225ad.216.2025.06.25.03.04.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 03:04:20 -0700 (PDT)
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
X-Inumbo-ID: c3a69a1a-51ab-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750845861; x=1751450661; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SBeqnB9PW2QxdiM/RBwMWjUFjBtgIPeRVqMNQVohzec=;
        b=Qh+WxbiMZ+jkwUkMbt2xw+3tJoMxLzaGVyHu2GvibcpuOU8f323Mg4kRASxqnyTUrd
         ijrFFK809r8WU41amgPD5EIhY9+d9AKOL4tdgCGKsp11QgffJbixTp+wX4vDp5gjMsCg
         vQJgXQ30DxLnkb8ktojujwaz2B5ZbDXdplpy542gK71B1MSglG1seru5KySJWG/OdTuf
         +AZ8fSKVRxTBSnf119b0/IJKvbi4oAxQylet2s5Lg6dX3ouG/r5nh1T0EvJM3UFsu7S4
         8HXXxNoFBK1TT1P3n8qL84OcKsWv0u1hW/yCEmHMv8TWhcOt48xS9sIquX0ckiNgqXkx
         mCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845861; x=1751450661;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SBeqnB9PW2QxdiM/RBwMWjUFjBtgIPeRVqMNQVohzec=;
        b=QENlWCZ6PoWaLeeZyN4oQpKQXiYqGryzDeZCW0nRDEO6VsrUPpqgk8HpFxAugJUrG3
         36qtGxtm7e+7uQhkl1iBUGBM425UnZCwzbcfJyGxMWN/+z+Rxnvlw7+vYRHKGNLvupwY
         03aPX4PsOaUgRMTxNZqNhlfdehoCNww1AnK7SUoiPEAWF5wZtVcMYpgNEK8laKLwerp1
         xYguQN8J3oYijDRTREeKgej9qDTPu2RAhJ+X3g1nRGR6Rn159VkTrHGQAypmPYtpdgpa
         AYk/cl6sRvWRjGebjX9wnvaKRmcLjkoh/wy4gkTQE81YHXnImV/9crgzPMvpBY/kdhZk
         Sd7A==
X-Forwarded-Encrypted: i=1; AJvYcCXEYdNOASDGwR4AzWNKDjaphOeFdXlQF3Xkgdo5ANhlZCsp5efWPRzXGwCP3EDp0zHAbzaCqK407IE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxxd1EQlAErFUsK+hJT3/cPId+LVvteXcgzrkZ6G+Muc25pbYBy
	din4D/ed2A+OsxwTa7XpksVbr+zcU9zA+n2BhndERUYbbFdghOoLoLhWHTPyWdR0uA==
X-Gm-Gg: ASbGncvJj+bBZEN7rXMN0t4Mf2pMguw+gDecBCk1ZDwikBUEVdSJJeWKJq2paYv0Yku
	q3dbEukrkyEqaVG2s5rVmNPCU+p0EHEOKnH9w1XLcI/tEcthv+RlI6hoDjT0SkhOtZX+8tlidrB
	57tj8euAjCuKeUmcrgUw1gt4mZuW+Mkv10Z+G5A2voXvjtt06R4gvSte5EhZQD7XnpUFg08pM1o
	GtJtqnW3W8n12RLu2s33YTaeiLc0AiUhanoNQgjuf57epFuswLfwsazNHNW7vfaCVVUva0eFmvq
	IbPFHTHUouTXvX/6TVaR6rBqCYUBOPfMwpz0g/LidclageTqIpvgB0OM9YI9jC5AsMKhGVUMas3
	m3rsX5gpfp50kO72kfmQHDGRmCAJFZK326yeypNu+JQw9wPM=
X-Google-Smtp-Source: AGHT+IFaG15mC0GvyMJkG5Aj3mFOCu8Em5Z6QXe9+vH8vVL5DFWkKbMD2+fUWCWfJMkc7Xaq6Rz2xg==
X-Received: by 2002:a05:6000:401f:b0:3a0:9dfc:da4 with SMTP id ffacd0b85a97d-3a6ed646a0fmr1801919f8f.42.1750845860630;
        Wed, 25 Jun 2025 03:04:20 -0700 (PDT)
Message-ID: <c5ef539d-2e21-4ecb-a0e7-02efe8116bec@suse.com>
Date: Wed, 25 Jun 2025 12:04:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
From: Jan Beulich <jbeulich@suse.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Huang, Ray" <Ray.Huang@amd.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-3-Jiqian.Chen@amd.com>
 <516a3adc-320d-46ce-b235-8ef91469abcf@suse.com>
 <BL1PR12MB5849F696814E17D20012BAC2E77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <227df6d3-a2c3-4576-bde9-d8057c378e7a@suse.com>
 <BL1PR12MB5849C69BD1485B1B98F7D0FDE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <5c4b186e-686e-4fc8-bcf1-854bc1f5ec8b@suse.com>
 <BL1PR12MB5849DE8416FE549834235780E778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <9d5d0e44-66c3-4e3f-8704-2c862c5f5aff@suse.com>
 <BL1PR12MB5849B3C334EF0C5BBCAFB7BAE77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <3638e73c-2a83-4164-9a84-839245245727@suse.com>
 <BL1PR12MB584988E00D0F4A4330B9B968E77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <771cd5b7-2b89-49b1-9aba-8cd79319d3ce@suse.com>
Content-Language: en-US
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
In-Reply-To: <771cd5b7-2b89-49b1-9aba-8cd79319d3ce@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2025 12:03, Jan Beulich wrote:
> On 25.06.2025 11:27, Chen, Jiqian wrote:
>> If I understand correctly, I need to change the definition of vpci_capability_t to be:
>>
>> typedef struct {
>>     unsigned int id;
>>     bool is_ext;
>>     int (* init)(const struct pci_dev *pdev);
>>     int (* cleanup)(const struct pci_dev *pdev);
>> }
>> #ifdef CONFIG_X86
>> __aligned(16)
>> #endif
>> vpci_capability_t;
> 
> You'll need to check whether this has the intended effect. There are yet more
> peculiarities when it comes to attributes on structs, typedefs, and the
> combination of the two. I wonder though: Do we really need a typedef here?
> Going with just struct vcpi_capability would eliminate concerns over those
> peculiarities.
> 
> Also, as said - you will need to check whether other architectures are
> different from x86-64 in this regard. We better wouldn't leave a trap here,
> for them to fall into when they enable vPCI support. I.e. my recommendation
> would be that if in doubt, we put the __aligned() there unconditionally.

And, forgot to say, there definitely wants to be a comment here.

Jan

