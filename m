Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEBD90C4FC
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 10:39:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742843.1149720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJUMj-0004bt-O9; Tue, 18 Jun 2024 08:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742843.1149720; Tue, 18 Jun 2024 08:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJUMj-0004Zl-K7; Tue, 18 Jun 2024 08:38:57 +0000
Received: by outflank-mailman (input) for mailman id 742843;
 Tue, 18 Jun 2024 08:38:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MUlf=NU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJUMi-0004Zf-Ai
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 08:38:56 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31f59772-2d4e-11ef-b4bb-af5377834399;
 Tue, 18 Jun 2024 10:38:54 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-57ca578ce8dso5935816a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 01:38:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f9806csm598447266b.195.2024.06.18.01.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 01:38:53 -0700 (PDT)
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
X-Inumbo-ID: 31f59772-2d4e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718699934; x=1719304734; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AnZWs13gONBrlER4YdTUIiLsTrQi0YoR2Ni4Wt7t7Hs=;
        b=NznerrHi/GjD8W0HNJ8oTgxM6E+qVHfx/PhgZqrsxB7gdEMFbD4DRADoNFTikaS6zZ
         jeePtvKIxe55hzmnS4P3JWXxHF22DkDnQT8ob8L98kJYkfrsJWPoKJaKvvg3z2aqgvQ+
         vV5NPIcV2o+sBJRcw2Au0F/Q3PivwWYEQI7Ocp28HLIiSKNk6pBFMBBct851MEhuz4M5
         NxEZiAO2SY7+y21dJUJJ8qC3HYZLF6Q8wSd0S+DKUxAcUh1MhTbmSbzlw895vfsGOEQY
         ON2/sro6e4ID2Bl4BqbUHv6EEN0M00BGghuw4UCcC18ph56qqlDtgFrKV5Mk215s344J
         nyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718699934; x=1719304734;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnZWs13gONBrlER4YdTUIiLsTrQi0YoR2Ni4Wt7t7Hs=;
        b=UsvDiv4zMcPfaHIwc19XjXqj2nC6u+UoCkQNG6PIekeU6hw7PDgDso5tX/hQyVeu1e
         I+NihVB3RHiWi5XQ5qxmTnTSPYlNOpxE9iVFgQH6hoShW7KZlH/VyI6Vd3SWu8h3nKpG
         RZjLG1FHfL06axXX6AEeu3+mhI8z/qm78yZlpsCzyumNma2WIYs5JBgUzbp1iaOXKE/4
         +Yr+Zzl1xYHWG4vT5UAvPnfcwAbEM60cm/I2iTx0B38jEmrjOvgftMoVTaI0f4ZO9Mf+
         2ZpS1smXWxf/qyA3N1rgasY6S019YbhrG9odHbJpDj0u6r38c2k5P/p89CkpDxIq5k6U
         qnUw==
X-Forwarded-Encrypted: i=1; AJvYcCW+Pp5+fUhf4OwLg3WIFA72ZdLHaSdzbwdUGuXhN+VJyC800eXAM0NUYXxy5P/6kxISXnPsZ3veYPi1V60RzzZPg4+cXiJp/Aas7pe5gcM=
X-Gm-Message-State: AOJu0YwFKE/miY9gCOPPGRUEHRGTOhP70Xdmi8ICB0GciU67lvVgDR3U
	W77B3UQ/o2qhb5LtqCmDjQmvqbouTcB8TXKomHt6Rvlk5PbgZP7Sl+Z4FFOsKQ==
X-Google-Smtp-Source: AGHT+IFg1le6jF5017yZVjJTJvP5H6IzgVTsawT7JR4KZm/VHhY2dFfTNXcUyY+cAOIHNnOzMG7uvQ==
X-Received: by 2002:a17:907:a64b:b0:a6f:8a1b:9964 with SMTP id a640c23a62f3a-a6f8a1ba21fmr323140766b.57.1718699933558;
        Tue, 18 Jun 2024 01:38:53 -0700 (PDT)
Message-ID: <c41031f9-bf3f-472e-82be-c1efea07c343@suse.com>
Date: Tue, 18 Jun 2024 10:38:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v10 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-3-Jiqian.Chen@amd.com>
 <cb9910cd-7045-4c0d-a7cf-2bcf36e30cb2@suse.com>
 <BL1PR12MB5849FC16D91FADD5B7D30A63E7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849FC16D91FADD5B7D30A63E7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.06.2024 08:49, Chen, Jiqian wrote:
> On 2024/6/17 22:45, Jan Beulich wrote:
>> On 17.06.2024 11:00, Jiqian Chen wrote:
>>> If run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
>>> a passthrough device by using gsi, see qemu code
>>> xen_pt_realize->xc_physdev_map_pirq and libxl code
>>> pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq
>>> will call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq
>>> is not allowed because currd is PVH dom0 and PVH has no
>>> X86_EMU_USE_PIRQ flag, it will fail at has_pirq check.
>>>
>>> So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
>>> PHYSDEVOP_unmap_pirq for the failed path to unmap pirq.
>>
>> Why "failed path"? Isn't unmapping also part of normal device removal
>> from a guest?
> Yes, both. I will change to also "allow PHYSDEVOP_unmap_pirq for the device removal path to unmap pirq".
> 
>>
>>> And
>>> add a new check to prevent self map when subject domain has no
>>> PIRQ flag.
>>
>> You still talk of only self mapping, and the code also still does only
>> that. As pointed out before: Why would you allow mapping into a PVH
>> DomU? IOW what purpose do the "d == currd" checks have?
> The checking I added has two purpose, first is I need to allow this case:
> Dom0(without PIRQ) + DomU(with PIRQ), because the original code just do (!has_pirq(currd)) will cause map_pirq fail in this case.
> Second I need to disallow self-mapping:
> DomU(without PIRQ) do map_pirq, the "d==currd" means the currd is the subject domain itself.
> 
> Emmm, I think I know what's your concern.
> Do you mean I need to
> " Prevent map_pirq when currd has no X86_EMU_USE_PIRQ flag "
> instead of
> " Prevent self-map when currd has no X86_EMU_USE_PIRQ flag ",

No. What I mean is that I continue to fail to see why you mention "currd".
IOW it would be more like "prevent mapping when the subject domain has no
X86_EMU_USE_PIRQ" (which, as a specific sub-case, includes self-mapping
if the caller specifies DOMID_SELF for the subject domain).

> so I need to remove "d==currd", right?

Removing this check is what I'm after, yes. Yet that's not in sync with
either of the two quoted sentences above.

>>> So that domU with PIRQ flag can success to map pirq for
>>> passthrough devices even dom0 has no PIRQ flag.
>>
>> There's still a description problem here. Much like the first sentence,
>> this last one also says that the guest would itself map the pIRQ. In
>> which case there would still not be any reason to expose the sub-
>> functions to Dom0.
> If change to " So that the interrupt of a passthrough device can success to be mapped to pirq for domU with PIRQ flag when dom0 is PVH.",
> Is it OK?

Kind of, yes. "can be successfully mapped" is one of the various possibilities
of making this read a little more smoothly.

Jan

