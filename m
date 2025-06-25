Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFE4AE85A9
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 16:08:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024937.1400690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUQnM-0000Y6-Ep; Wed, 25 Jun 2025 14:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024937.1400690; Wed, 25 Jun 2025 14:08:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUQnM-0000V9-AR; Wed, 25 Jun 2025 14:08:12 +0000
Received: by outflank-mailman (input) for mailman id 1024937;
 Wed, 25 Jun 2025 14:08:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QoV+=ZI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUQnK-0000V3-IU
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 14:08:10 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2436997-51cd-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 16:08:08 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso1678957f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 07:08:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749b5e2145bsm4894594b3a.54.2025.06.25.07.08.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 07:08:06 -0700 (PDT)
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
X-Inumbo-ID: d2436997-51cd-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750860488; x=1751465288; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cxjiKF220tZ4ezq10EPqwbZvYUvol3Fy/rHGsaAVyJI=;
        b=NxcWLXxYdAjQ3jzigIrgXL7C3pTr1iJTLSAdWLnmnfGDtRDxAamIqSViV+ZinfARke
         GPb95NSriNnfnIsG02q46cxc9VdYlYnyQUWl5CvV2ryE2sm1MzxepHxX9QGsi94zlWZR
         uFzwVxBc20SRByNkwCidOHVW1/0Bsot7YlDyJ6/xxTR+PZgSOzZGIYrpu9M3A2p9iens
         IBWqqCRcYR/fGE9/lySLVit0FaZPOOWFrof8VXhE/ZzlYm2v+xBjn1KGkia6c0rOqEum
         zZbHZ3n3ZinD/dGj1FZQXLCuihARqVtAPEfWMwBOQXt/3WMrMl4PkVW+vVKHnU42HMgv
         xnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750860488; x=1751465288;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxjiKF220tZ4ezq10EPqwbZvYUvol3Fy/rHGsaAVyJI=;
        b=kxwXtwzZw//PIfLMG1a/IfU8fOno2mFeZg99Tt5MoKK3SY7vauzUOHrztu+fQI2CDk
         dmv33XLX8r/plG6tzygF8AjKXEeOQTIRa0Pg4eZkLYGKZzBHUXQ+eYa/ASXnTmxoJ4a/
         105CNrsF/JegwMAhm73WuHHe/qfOtsdo8SdQhXeTtCyURsc4EIarYg82tCWe9jDcXZ8T
         j1AqnTOvH5BcMpU07Lbznfrt9H0XJ8NKb0lJLpvRoAIRm8nN2p9sJNYREK50fX9jee1O
         wA/+8HI5nIPPcBPTbrItv++N9EZaZytoZK924Ppd6kLURnvkbxqbIHIW45Rl5JRCVuWI
         NV1A==
X-Forwarded-Encrypted: i=1; AJvYcCX9M3Z8KIAFY+N8wNYJUbVhbfJ+27axFb6cRMhADQ55fsfdwc+fmjvUIS0Xcwo45wS4yzYPq5FBxJI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxieTcSUusW+ub8KGk6c0Sg7FPIaIRqXgU7zSI6k7WWoh+5H2+3
	w/gsh0mdu/PIHGC/syFIFvkTjCUEj77vlIHXtYi2Og9lN5+iStWLqxMuDXg4qI0kKw==
X-Gm-Gg: ASbGncuELVHIq64p/u8tnX+tVlCm9BRAGqjDZitO35Q6vXvGa/9kSRDD1ZNK4KjGXM6
	RgpR0/iTO9376EbCPhvP+WkYUEYtSyoDspNwM/lXgPxDWXqtBWW47RtXO01TCKsL9T+xfB5PckA
	7dSPjeJzXAa/TOUIB6kT5OGcZBO/4GiP1QWNVyJX0A9DAbq5HzsPv6eX8dHDWZnTEqdSuwJKzVY
	IDWA26ly08luJztAxgDWsp/JtuKhHXlkBlWFiJ4pAVH8UzdwQDYliGCZBtjUXDbV3gkezRSK2xI
	9GusJmL54T7X3uIAJHcoY0sRYGjUE05KeoSyfHddmPFAUDg42G19KWaE+38lfiISEvFpAsTt0OD
	U5vfUe5bzdl48h/HwRzLZbFt2gTb67RG8C1J5q73P2o0f3bw=
X-Google-Smtp-Source: AGHT+IFdr1XYTOMipMlU6GXt1wzEp1KzG0ejdmXJT0llPCKQibgQdxRlE8+JvAybNyTsn0YVQcCoDw==
X-Received: by 2002:a05:6000:4022:b0:3a5:8977:e10f with SMTP id ffacd0b85a97d-3a6ed637c5amr2730210f8f.28.1750860487648;
        Wed, 25 Jun 2025 07:08:07 -0700 (PDT)
Message-ID: <7753470a-efef-478a-bbe5-ae48d008cfdb@suse.com>
Date: Wed, 25 Jun 2025 16:07:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
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
 <BL1PR12MB58492A16BFE80B49045AB936E77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB58492A16BFE80B49045AB936E77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2025 12:16, Chen, Jiqian wrote:
> On 2025/6/25 18:03, Jan Beulich wrote:
>> Also, as said - you will need to check whether other architectures are
>> different from x86-64 in this regard. We better wouldn't leave a trap here,
>> for them to fall into when they enable vPCI support. I.e. my recommendation
>> would be that if in doubt, we put the __aligned() there unconditionally.
> That's difficult for me to check on all different platforms since I don't have them all.

You don't need to have them. You'd need to carefully go through the respective
section(s) of their psABI-s.

> So you mean I should remove "#ifdef CONFIG_X86"? Just let __aligned(16) for all platforms?

Yes. And, as also said, with a suitable comment please.

Jan

