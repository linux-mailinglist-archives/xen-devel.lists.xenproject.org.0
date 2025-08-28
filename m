Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E00C4B393EF
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 08:41:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097561.1451840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urWJi-0006bn-QC; Thu, 28 Aug 2025 06:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097561.1451840; Thu, 28 Aug 2025 06:41:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urWJi-0006aJ-NK; Thu, 28 Aug 2025 06:41:02 +0000
Received: by outflank-mailman (input) for mailman id 1097561;
 Thu, 28 Aug 2025 06:41:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urWJg-0006aD-TS
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 06:41:00 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f579d7e2-83d9-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 08:41:00 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-afcb78f5df4so89562266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 23:40:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c5010e151sm8759012a12.4.2025.08.27.23.40.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 23:40:59 -0700 (PDT)
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
X-Inumbo-ID: f579d7e2-83d9-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756363259; x=1756968059; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OhZ1gZzf44P+/UtcAZrf7/k2gD8+KX3uQL6OE4lJuz8=;
        b=Lc/59148t972J4Xpyl2vggHn+mAzJb4fKM5kmgusFL5v27xgHjXwG1fHUvHMtT3bfJ
         +B50BNMWr0LiNelQMbbuSEa6T2Zic9R7triCvKVtw40P8IDuNJHVk+ZM4Yi12zQpokN7
         g+gvN59cF+nWpTUjbt5W6hrVWs+wleOgbI9m9KgDcioxlmq+iEfcC/2YTJR9q1K+k015
         gvtP6NuxNp6s+BjjSAtyqHFmnXgNRM+lz7fbc7uTu4SoeOXR2B3BXF4eOKmyr721EZT/
         9Zyg9w9z/ROdOO7WqvLLStPy2rk8T3rDppCI1OgiUcnwvFs6PNRyzk8JuR3bPOfl46/L
         Casg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756363259; x=1756968059;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhZ1gZzf44P+/UtcAZrf7/k2gD8+KX3uQL6OE4lJuz8=;
        b=imry9+Zm9qOmTXvcQTaGO7hlHGIQu3IImMcvszvTBaSfPLGmPW91l5c+Mltvzg8NYX
         VGNu90eMidwApiHUKZy0po0RM7QDdC8Wc6EESQ5kgVfAMS5b+J24oYIQi07NExfnbNNH
         zz3LVKEGXGO8gJbbYZjeGBJduzxCAB3IV0EhsZdZazAGn1nXRYEGlY1850JRgK938mRe
         vBwwDY/+fs5KTAnX6ifXeEcf2VgBjtT2aFvHxJ92yq6fn26Oafr5aD3OfPRupNj9tWlm
         SWxjjPkgMMwH61zUrbPU1gc6yhhvY58r1ulYL62qq1tKSHbrlYefOauZnVzpOWDcfBJL
         BIsw==
X-Forwarded-Encrypted: i=1; AJvYcCVDEpvyXVo9jMYT7hT8ZUitQ8PE7+Ag5gBETgemWU0FQ68pIdASQ6wf8GQELMq5LRFWCBNntnvWVj0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwjGGYTjQhr90aTkPPMDmQRk0j2bvEQ9MK9Z3rl3afv4A14Qti
	1akvK0qOwxFToDa5vjw1l3ivO2T/iutt8xBAbhQdQWCnCmpggRxIfFVvRKenWnPD7g==
X-Gm-Gg: ASbGncsyrkZk/Ji5r3hbRKSMlHrxpNJDdHxR86MOwrfiMRuz4ulEc4pql+ewOLr7q00
	JpzTWPDT1Uuf6nlWJyyWEkVl0WBRw3oeoNJOLrg4M/vkFaBIPEvZPtHgfqtSNCIXZAPQuJ5rL0D
	1bDq7M3bK6GjmnMKgkV/4vbEmOnGTU/eU8jH9WxODUqOIsZLCcotrcZGltLrHgmM9XW601Fjij3
	Dw1nrvXexjbutr8AXUmSLBsUbU8OG1vXuWF0Pl2cNlLLOlajEBSNgtBckl4AW91OJcuTEHt96cI
	Iy7NcTeCh0aJji7ZzEPimk9KUIx4xGESID0AQsAfRHR+A8RFwzhk6crmCA7Zn5dcRpfPj6FONA8
	LQ+b7YEyTo2mLT4NvoWbneUzEnlcgLGFaliVsWNUtcW/efrcsTiNRfbQqRYy52FaHEiGivQIXZ4
	CR2N1ur53nyqx0IDSmuQ==
X-Google-Smtp-Source: AGHT+IEFqQO3PhLF/h2v1d0h2I+U+0bR0oOe2pygS2ZMARBWOqcbIT8okxkUDFe4oR6tvGAHsHYQwg==
X-Received: by 2002:a17:907:9725:b0:afe:c7a3:c6a5 with SMTP id a640c23a62f3a-afec7a3c889mr464493866b.26.1756363259257;
        Wed, 27 Aug 2025 23:40:59 -0700 (PDT)
Message-ID: <58b39f4b-51e2-49d9-938b-d8e6b4dbaf73@suse.com>
Date: Thu, 28 Aug 2025 08:40:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 06/10] xen/domctl: extend XEN_DOMCTL_assign_device
 to handle not only iommu
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com>
 <aa4bf9a069721ace3b9da7409923455eed2f6896.1753184487.git.oleksii_moisieiev@epam.com>
 <3ff863d9-764c-4478-9bb9-b783ff850185@suse.com>
 <e214b0b9-1cdb-43c7-a02f-a1b64b3bfb8a@epam.com>
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
In-Reply-To: <e214b0b9-1cdb-43c7-a02f-a1b64b3bfb8a@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 07:48, Oleksii Moisieiev wrote:
> 
> 
> On 22/07/2025 15:34, Jan Beulich wrote:
>> On 22.07.2025 13:41, Oleksii Moisieiev wrote:
>>> @@ -859,7 +860,25 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>>       case XEN_DOMCTL_test_assign_device:
>>>       case XEN_DOMCTL_deassign_device:
>>>       case XEN_DOMCTL_get_device_group:
>>> +        int ret1;
>>> +
>>>           ret = iommu_do_domctl(op, d, u_domctl);
>>> +        if ( ret < 0 && ret != -ENXIO )
>>> +            return ret;
>> If this is where you want the ENXIO for that the previous patch switched to,
>> then I see no reason for that earlier change at all. Inside the hypervisor
>> you can simply figure out what the right thing to do is; you could avoid
>> calling iommu_do_domctl() altogether and call ...
> 
> My point was to leave the decision making to the calls themselves.
> So iommu_do_domctl will make a decision whether to process the node or 
> not, same for the scmi call.
> I can figure out if there is a need to call iommu_do_domctl or 
> sci_do_domctl here but this means moving
> part of the logic from specific calls to the common code.

To avoid that, maybe it needs doing the other way around? I.e. try ...

>>> +        /*
>>> +         * Add chained handling of assigned DT devices to support
>>> +         * access-controller functionality through SCI framework, so
>>> +         * DT device assign request can be passed to FW for processing and
>>> +         * enabling VM access to requested device.
>>> +         * The access-controller DT device processing is chained after IOMMU
>>> +         * processing and expected to be executed for any DT device
>>> +         * regardless if DT device is protected by IOMMU or not (or IOMMU
>>> +         * is disabled).
>>> +         */
>>> +        ret1 = sci_do_domctl(op, d, u_domctl);

... this first?

Jan

