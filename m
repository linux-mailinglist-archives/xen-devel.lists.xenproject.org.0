Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A38A670D7
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 11:12:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918858.1323485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuTvC-00041j-JV; Tue, 18 Mar 2025 10:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918858.1323485; Tue, 18 Mar 2025 10:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuTvC-0003zh-Fd; Tue, 18 Mar 2025 10:11:42 +0000
Received: by outflank-mailman (input) for mailman id 918858;
 Tue, 18 Mar 2025 10:11:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuTvB-0003zb-1s
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 10:11:41 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 617deb74-03e1-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 11:11:38 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-390effd3e85so4460490f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 03:11:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975d65sm17934940f8f.56.2025.03.18.03.11.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 03:11:37 -0700 (PDT)
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
X-Inumbo-ID: 617deb74-03e1-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742292698; x=1742897498; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lwwA8y9jAIBDcAKCb9oxdke4CzWiyLLSZ1xSf66cJ/Q=;
        b=AkZh7Ls5SciHVlps537PHIQatIulPYjucIrwBvQRtK7N2qF/sTSgW955yDMjQzTAY9
         JKpGQ75o/3F+cVZzJClkRuyKFH7mFyK4l2qnW9Mb8NIVkFeTbSgUQP4TTEOGrcHRLxNC
         m7VmkEaA9tZKIOZ9VcUjWAcwnbyyNcWbyVQM18+OeYMBOHbBqS+J3EW88HOHo23itZPa
         rQ1wKyRpDcIklOaSQDDDyNBXCHFnPZh4yfo9sFmdTrAL8RcjEPhgRznuMlsF/0tUNLEB
         y7zRjTouBzc7KTcPpJigqz+rwO0StCc3ntms2jlKuDgjyWROMvEY7A8WlF0vIzfOZvLd
         r2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742292698; x=1742897498;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwwA8y9jAIBDcAKCb9oxdke4CzWiyLLSZ1xSf66cJ/Q=;
        b=xPeZbutg74ipMi5xBsuaO/UA5Fjfc0EPaeE0XKYrnIKVJuRb9xqrVZe2MvDL+74jxn
         0bbEIEsIU8m4fjmoDPXrdqesekDASj5fA/vHCnItNPf6Bx6pKtfoOXuQRN07e/GJlth/
         7dmF8ypAVygm5gbGFiC0sF1vEqTPB/2fDdI0gHIfLEljgPro/o2y2ueZbLrYlemwfg0q
         G10x+oB5zCoyPLi/XYU/dbwigQj7ma+MpHhNwiX9zS92Vbycrl9xNraN/pGebc0mXh7G
         j34lt6GmqpjEw3balVXPsuuMw3C6mBNVyjIzXmpKRMgsFkjbXMEM7O9Joui9uJC99lqz
         +LVQ==
X-Forwarded-Encrypted: i=1; AJvYcCViOTIc4WTc51L6/SaBvDyLFv997kxvesVpWhQRKGWenOEIeELcd6qu/WHH658t8M4I4WDEu6cYjCQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YycISG58gZDzrn/C7dJ0Kwb4BgSI6cWIz2FfldzPufotBnwPvTT
	7Bnf/Co+k+yhkOPXnpLh9sNnIP4jXxih0Xh+7cza2J3jGRQ9g2RT7OELIQfR1w==
X-Gm-Gg: ASbGnct8RfPxjwCKNq5yfzYeDcVcUhpNqHAjnIQQyKZNlujZOzZRp7ASZeJjSdsQ6hi
	g9owbUwsTTS9vVuHT5Xqe8yqvHeMwUZjhoNzKOkkM9JoHN2qx9CtoMzThP8CgKndCxvrqrfaCFG
	Vlw+UzwkYJq62WPJBHmlt/ksi/+IdBnYfdD37j+IcGB5wubwhThhImH2Zo19urj3khTPTeRbQSr
	xVFTTHYEVrw1Q6NNo47cGnSnbHeas+dR3736M77T9vl3cqMEqux5fjN8ifwdSx3AS9VIjFFIV1j
	ZGAJ5sAFIkTZJ7aoQvUlOh9scql8EQ2LrUH5A8mUkEUfI5H+qFmiukpEkj61yIwVbUj8j9q5Fby
	l+Q6kDtrn6hW/wHsKtW/Vgsw8evSZzj6Yc+h5LFVY
X-Google-Smtp-Source: AGHT+IHwmRvb8372as5Tc4px0qUe/xWTHa8oOlYRt7Xn/aBXAEClP8FL+IlHNNSSSf+Lz9+FsgUKDQ==
X-Received: by 2002:a5d:6c63:0:b0:391:4bf2:6f0d with SMTP id ffacd0b85a97d-3971fdc6e1bmr12551466f8f.52.1742292698224;
        Tue, 18 Mar 2025 03:11:38 -0700 (PDT)
Message-ID: <a738e3d9-bfd3-46be-8f66-cbbe4353f93a@suse.com>
Date: Tue, 18 Mar 2025 11:11:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/dm: arm: Introduce inject_msi2 DM op
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <cover.1705066642.git.mykyta_poturai@epam.com>
 <6c551b03796fbf091b22fcde96d894cd5308ff91.1705066642.git.mykyta_poturai@epam.com>
 <1793f158-ed83-46f9-be12-68c5ce86e4c4@suse.com>
 <495906c3-9937-4b54-ae3a-8e8ad2b9814f@epam.com>
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
In-Reply-To: <495906c3-9937-4b54-ae3a-8e8ad2b9814f@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2025 10:10, Mykyta Poturai wrote:
> On 15.01.24 11:35, Jan Beulich wrote:
>> On 14.01.2024 11:01, Mykyta Poturai wrote:
>>> --- a/xen/include/public/hvm/dm_op.h
>>> +++ b/xen/include/public/hvm/dm_op.h
>>> @@ -444,6 +444,17 @@ struct xen_dm_op_nr_vcpus {
>>>   };
>>>   typedef struct xen_dm_op_nr_vcpus xen_dm_op_nr_vcpus_t;
>>>   
>>> +#define XEN_DMOP_inject_msi2 21
>>> +#define XEN_DMOP_MSI_SOURCE_ID_VALID (1u << 0)
>>> +
>>> +struct xen_dm_op_inject_msi2 {
>>> +    uint64_aligned_t addr;
>>> +    uint32_t data;
>>> +    uint32_t source_id; /* PCI SBDF */
>>
>> Since the comment says SBDF (not BDF), how are multiple segments handled
>> here? At least on x86 (VT-d and V-i) source IDs are only 16 bits iirc,
>> and are local to the respective segment. It would feel wrong to use a
>> 32-bit quantity there; IOW I'd rather see this as being two 16-bit fields
>> (segment and source_id).
> 
> I'm planning on resuming this series in the near future and want to 
> clarify the DM op interface.
> 
> Wouldn't it be better to keep things consistent and use 
> XEN_DMOP_PCI_SBDF as it's done in xen_dm_op_ioreq_server_range? Also 
> with this, the value can be easily casted to pci_sbdf_t later and split 
> to segment and BDF if needed.

The essence of my earlier comment is: Naming, contents, and comments need
to be in sync.

I question though that "casting to pci_sbdf_t" is technically possible.
Nor am I convinced that it would be desirable to do so if it was possible
(or if "casting" was intended to mean something else than what this is in
C). See my recent comments on some of Andrii's patches [1][2].

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2025-03/msg01294.html
[2] https://lists.xen.org/archives/html/xen-devel/2025-03/msg01301.html

