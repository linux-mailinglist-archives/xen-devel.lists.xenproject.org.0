Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CFCA89548
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 09:38:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952186.1347715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4asM-00007B-1a; Tue, 15 Apr 2025 07:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952186.1347715; Tue, 15 Apr 2025 07:38:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4asL-00004w-V8; Tue, 15 Apr 2025 07:38:33 +0000
Received: by outflank-mailman (input) for mailman id 952186;
 Tue, 15 Apr 2025 07:38:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4asK-0008WV-E7
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 07:38:32 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0ea8c69-19cc-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 09:38:31 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-39d83782ef6so3991868f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 00:38:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae9780a0sm13439902f8f.50.2025.04.15.00.38.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 00:38:30 -0700 (PDT)
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
X-Inumbo-ID: a0ea8c69-19cc-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744702711; x=1745307511; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N1GyCT/cs4goAAz2N8zXEg1cflt+E4Km7OSUcxdDr4I=;
        b=V3b94+rgpPLX9MYyfNJ/7zmOUHhM4F6mGtZ0YhPVRg6qrcAOK/u6AF/FaVonT6iAO8
         CqMHPyeUU++Ini607jWXb5XclCM5ZyByin2T3V27LbcPB6QdEnp0Sgtt1ofNgRIc0EYC
         HOsD4ha9I7CHtzdETpj0gvBHqlni8kos4zBukGEsdnJ2zBHT8ZJOPaf6hQtRRZc7UVmj
         izOwn8Esy4lVOVBoWd5VJsI8hyz62crIL2HgkDZcleoDRl2ndpfXhNQ/Ufhy0NABViTK
         N2lNWfQBVKBLq838Sf3i8mUQxnARxigv1rpi22hK80i5lPdyEldImEfcNBA+iH1lme79
         zg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702711; x=1745307511;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1GyCT/cs4goAAz2N8zXEg1cflt+E4Km7OSUcxdDr4I=;
        b=B41HhZlqJ5KM4TyScvlzX5JzfUZQFJ9nmkOg+sqhSveN11IsRJSUo2aUdIYrb4WGae
         hSXTTHgpLFBoauJ5SwS6jXXXIezMifhxk2/pwcaZfdKZwx5SXe7AEY8DfjnvGjbydDO7
         24+hdrMkh+KnuPYcl5rJBce2wdChxrs/5al3YvVY3Fd/FeLeZFWTz08NMZaAF7EBIYWT
         KfA+Za0vyVrmCNk/WemxRTG72HkT5MdoTi/emP87xb5bOqk60buRDFnKofPkDjXre7mC
         qxnq5tG9eZBrHHKHik/Iz6sQOOdsGKjqM4PDAqoN31+gy2GxCLasE2p+ey6EoYQOi7kZ
         vu2Q==
X-Gm-Message-State: AOJu0YxBl7r+dp6qJxL17sG0K9+k2xC4QjGZ0zZH4kYA3Cv8izFvyQw5
	IdgGkNlFfQD+PCUPQZnmhusJg/jkwtW/lLsqmMw+47FFGQHxWVunOAJ+UxQCC+Wc1lCkf/gucH0
	=
X-Gm-Gg: ASbGncsjLrvvLjJR5G3tTSiBWMHnMtbKUjtWb5ImUs+IV7zG/qUbJadl7Sf8UdtC53C
	QDvBLY3Yt8BfahkUNBhwCoMm0jVe9Ue2t45s/IudiOymxEFn1dAtZMxC/A5B/3Jm3OkBZpu0aB7
	c1y8+nxf0smwf0zmOXEkjYeW3zABmqyXIt2mNZSnRWupcxX5uI7oLBpaNYw9d1oY9kw3GGNPb1j
	lZk2W3WUdvpyHlxHlIz9FBOKlIdjXL994Kx973SgFwTdHIPBlzkwp0cKqR9HvSKJKmF7cc9PGt1
	qrXR2BhZfOOuvZ9zl30HoWtIeF3e3mXLi23maSVbDjnC4HH/7agfUvdKLTAA94E5GrYqtC/bBDk
	en0DpqnQbQDOTNKIQpEK8peNDKQ==
X-Google-Smtp-Source: AGHT+IGE4TiMtaJoUM1eSoQr3ECtSjC3DyVm/Xe/vglFsFrXiIzrwa43xTf/wMYoMLSfhMGggMdAng==
X-Received: by 2002:a05:6000:220c:b0:39c:266b:feec with SMTP id ffacd0b85a97d-39edc306e8cmr1710572f8f.7.1744702710811;
        Tue, 15 Apr 2025 00:38:30 -0700 (PDT)
Message-ID: <291d4115-a493-4bf5-8667-a730f76647a4@suse.com>
Date: Tue, 15 Apr 2025 09:38:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drivers: Change amd_iommu struct to contain
 pci_sbdf_t, simplify code
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Andrii Sultanov <sultanovandriy@gmail.com>
References: <cover.1744657012.git.andriy.sultanov@vates.tech>
 <40f504017d71c16a3e2bc8945ac5e674a3e791ed.1744657012.git.andriy.sultanov@vates.tech>
 <Z/4MCopF/j5357Mf@starscream>
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
In-Reply-To: <Z/4MCopF/j5357Mf@starscream>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.04.2025 09:34, dmkhn@proton.me wrote:
> On Mon, Apr 14, 2025 at 08:19:16PM +0100, Andrii Sultanov wrote:
>> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
>> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
>> @@ -43,7 +43,7 @@ struct amd_iommu *find_iommu_for_device(int seg, int bdf)
>>      {
>>          unsigned int bd0 = bdf & ~PCI_FUNC(~0);
>>
>> -        if ( ivrs_mappings[bd0].iommu && ivrs_mappings[bd0].iommu->bdf != bdf )
>> +        if ( ivrs_mappings[bd0].iommu && ivrs_mappings[bd0].iommu->sbdf.bdf != bdf )
>>          {
>>              struct ivrs_mappings tmp = ivrs_mappings[bd0];
>>
>> @@ -121,7 +121,7 @@ static bool use_ats(
>>  {
>>      return !ivrs_dev->block_ats &&
>>             iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
>> -           pci_ats_device(iommu->seg, pdev->bus, pdev->devfn);
>> +           pci_ats_device(iommu->sbdf.seg, pdev->bus, pdev->devfn);
> 
> Same idea about updating signature to take pci_sbdf_t.

Perhaps both this and ...

>> @@ -147,17 +147,17 @@ static int __must_check amd_iommu_setup_domain_device(
>>      if ( rc )
>>          return rc;
>>
>> -    req_id = get_dma_requestor_id(iommu->seg, pdev->sbdf.bdf);
>> -    ivrs_dev = &get_ivrs_mappings(iommu->seg)[req_id];
>> +    req_id = get_dma_requestor_id(iommu->sbdf.seg, pdev->sbdf.bdf);
>> +    ivrs_dev = &get_ivrs_mappings(iommu->sbdf.seg)[req_id];
>>      sr_flags = (iommu_hwdom_passthrough && is_hardware_domain(domain)
>>                  ? 0 : SET_ROOT_VALID)
>>                 | (ivrs_dev->unity_map ? SET_ROOT_WITH_UNITY_MAP : 0);
>>
>>      /* get device-table entry */
>> -    req_id = get_dma_requestor_id(iommu->seg, PCI_BDF(bus, devfn));
>> +    req_id = get_dma_requestor_id(iommu->sbdf.seg, PCI_BDF(bus, devfn));
>>      table = iommu->dev_table.buffer;
>>      dte = &table[req_id];
>> -    ivrs_dev = &get_ivrs_mappings(iommu->seg)[req_id];
>> +    ivrs_dev = &get_ivrs_mappings(iommu->sbdf.seg)[req_id];
>>
>>      if ( domain != dom_io )
>>      {
>> @@ -275,7 +275,7 @@ static int __must_check amd_iommu_setup_domain_device(
>>      ASSERT(pcidevs_locked());
>>
>>      if ( use_ats(pdev, iommu, ivrs_dev) &&
>> -         !pci_ats_enabled(iommu->seg, bus, pdev->devfn) )
>> +         !pci_ats_enabled(iommu->sbdf.seg, bus, pdev->devfn) )
> 
> ... and same for pci_ats_enabled()

... this would best take a pointer to a const pdev (if that works out).

And yes, there's a lot of similar cleanup to be done in this area. I don't
think we can demand Andrii to do it all in one go.

Jan

