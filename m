Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0950A25F49
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 16:55:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880749.1290830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teymz-0006wY-W2; Mon, 03 Feb 2025 15:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880749.1290830; Mon, 03 Feb 2025 15:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teymz-0006um-TP; Mon, 03 Feb 2025 15:55:09 +0000
Received: by outflank-mailman (input) for mailman id 880749;
 Mon, 03 Feb 2025 15:55:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1teymy-0006ue-Ri
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 15:55:08 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d899457-e247-11ef-a0e7-8be0dac302b0;
 Mon, 03 Feb 2025 16:55:07 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5d3e6f6cf69so8148160a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 07:55:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47a7eb2sm770162966b.3.2025.02.03.07.55.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 07:55:06 -0800 (PST)
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
X-Inumbo-ID: 3d899457-e247-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738598107; x=1739202907; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IU8uMiFDnDUxbEeoa7fYI6WzIXF/rU6/xUldK/2pGnc=;
        b=adHuFGUcuzsgDm/vIPgBefsfZYjtq1FybtLUwWliMJ5wC/bfbyouOVIOPLq+BFAtMr
         gzTg67VAhk+YZWSlFlElYYUcNh+n5xUjLFQ0GeEtiRsIigq+h51OL0myycR3G+nyV0/t
         sBLArzAoia9L3FY3rKqJ8sBVeO4BdWPFsIL3k7r2egj1bUoKFlAQno2SPKFiCA7zC/rf
         VW8MS6tEWXRwl6AsIaNMVi7Ln7L7Ri8F5gMxyYIsoQHJN580fKzmG7p2Ej+B8IGgCwNo
         nZjiWtud7J6WgvEOvne7Rk//IwAVqE9scPzNdHcQp25UW+93XKY3X7+jOEjx5IQiL0VQ
         49fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738598107; x=1739202907;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IU8uMiFDnDUxbEeoa7fYI6WzIXF/rU6/xUldK/2pGnc=;
        b=bXxNmaHNiZwgli79Mt194pOeKFF1+I5nz1zEpK0IKIEaQKrvmeEVkQbByY0BvrEsrB
         r/wBF4+eZ+oSkobLnY9gKLw8WioZ2Q/1k+Kvy9Es98QPBUz403ErMDJEkhR7ukxPcpk0
         38eGypq9UGs2fVCHKapbVHXZrem5UYLCWwF/M4XhDHS5Mp4vHEUAkz1v+2gujfViRFw8
         8STRDTk7UXoHNSMz4BrDdxEKS2ZDmiCOrbHY8KrwO4Djb2gNf9GEBfFGDtVCYnbpALd8
         gKk3fpVHboDOdCmUYzE30xXR04Fg5fszb2Yxy+GoUMEEINgd9OsvSi+S/xV3EkEopdaG
         DtyQ==
X-Gm-Message-State: AOJu0Yx96+FHlp0ad1w2mqG61sF+jFuSiZJiZebYfMR1wNse+htraOM2
	LS86EXu8Gf3QJrKsyhp8AeGF+va4wFmjF55k4Q/VwEYcnBr5cj+p4yGpviV3bw==
X-Gm-Gg: ASbGncuWHD7dAa7/vmsI0dqRFFd2Gdnn/iO2Pvzlbj2XCI6RPSw22xu4s48VLlo1A8K
	Sof7jhbnxEfmUEi2C/970EhpqxJpawO5L3n023fZXAUPQlDVOILIVhxSaQGo1JIOyIdpDiUAAFA
	lo/pT7EYrGDY4PD6gtcspjS7DZpsnEWhE/BvWhmH79lS4xVXhw1zQSEZEqmyEBgTtxK+3+7c0J8
	M4dvOyjxn4BSbzTlzYghsqF5+n/s5a79j3RPMZ6H3zIDqjV82h2pE5dv1UPxmt+gf4LA+KsO7+k
	QAmDXiZ3IiyVc1cy3OUdAN+1tfPNp9DlvWbX8jQDOcZqtW3sH521QmINCAVWlUhiDSb8ZdwGAMi
	s
X-Google-Smtp-Source: AGHT+IHQmHKcuFsYwDg3ffr1CmzBBQnhMPUlnQLGZ6lh70j8+A49Nk5kPuy4hEL5NDmD/pXi1UD0RA==
X-Received: by 2002:a17:906:f598:b0:ab7:4633:c39c with SMTP id a640c23a62f3a-ab74633c3bdmr59248766b.49.1738598107038;
        Mon, 03 Feb 2025 07:55:07 -0800 (PST)
Message-ID: <98d96825-896d-4c01-87ec-ae0c24fca61c@suse.com>
Date: Mon, 3 Feb 2025 16:55:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 2/3] x86/PCI: init segments earlier
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <2bb9d3c4-0761-4d63-8193-29293e35eb04@suse.com>
 <940ccd1b-9ad8-4b68-a035-36f45326872b@suse.com>
 <Z6C6fUeB4mFfGfJc@macbook.local>
 <e7eff762-ff80-440e-8a92-e5a5e09a97ce@suse.com>
 <37df8931-c9f4-4af2-a099-b2bb4539bffe@suse.com>
 <ebf97ded-3e26-4bb8-8a61-ebdcdac1b176@citrix.com>
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
In-Reply-To: <ebf97ded-3e26-4bb8-8a61-ebdcdac1b176@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.02.2025 15:23, Andrew Cooper wrote:
> On 03/02/2025 1:03 pm, Jan Beulich wrote:
>> On 03.02.2025 14:00, Jan Beulich wrote:
>>> On 03.02.2025 13:45, Roger Pau Monné wrote:
>>>> On Thu, Jan 30, 2025 at 12:12:31PM +0100, Jan Beulich wrote:
>>>>> --- a/xen/arch/x86/x86_64/mmconfig-shared.c
>>>>> +++ b/xen/arch/x86/x86_64/mmconfig-shared.c
>>>>> @@ -402,8 +402,6 @@ void __init acpi_mmcfg_init(void)
>>>>>  {
>>>>>      bool valid = true;
>>>>>  
>>>>> -    pci_segments_init();
>>>>> -
>>>>>      /* MMCONFIG disabled */
>>>>>      if ((pci_probe & PCI_PROBE_MMCONF) == 0)
>>>>>          return;
>>>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>>>> @@ -55,6 +55,8 @@ void __init acpi_iommu_init(void)
>>>>>  {
>>>>>      int ret = -ENODEV;
>>>>>  
>>>>> +    pci_segments_init();
>>>> My preference might be to just place the pci_segments_init() call in
>>>> __start_xen(),
>>> As said in reply to Andrew - I was considering doing so as an alternative
>>> to the moving done here. I can certainly do so, in case some non-negative
>>> reply comes back from him.
>> Oh, and: With further adjustments following from what Andrew had outlined,
>> I'm actually moving the invocation of what was pci_segments_init() back to
>> where it's now. (Which doesn't mean that couldn't be done from
>> __start_xen(); just mentioning it.)
> 
> The name acpi_mmcfg_init() at least has a PCI implication, given mmcfg.
> 
> I know it's late in 4.20, and moving pci_segments_init() would be
> acceptable at this juncture.
> 
> However, if you're making progress with improving radix trees, I think
> that would be a better approach and probably fine to be considered at
> this point.

Well, let me submit v2 then with all those new patches.

Jan

