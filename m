Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C15A8B3118D
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 10:19:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089701.1447203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upMzp-0000UW-Ca; Fri, 22 Aug 2025 08:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089701.1447203; Fri, 22 Aug 2025 08:19:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upMzp-0000Sf-9w; Fri, 22 Aug 2025 08:19:37 +0000
Received: by outflank-mailman (input) for mailman id 1089701;
 Fri, 22 Aug 2025 08:19:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDWw=3C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1upMzo-0000SZ-2Y
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 08:19:36 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc9fa00d-7f30-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 10:19:34 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-afcb6856dfbso330724166b.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Aug 2025 01:19:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded2ba3a4sm560433866b.13.2025.08.22.01.19.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Aug 2025 01:19:29 -0700 (PDT)
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
X-Inumbo-ID: bc9fa00d-7f30-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755850774; x=1756455574; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4dcUSGcxU6eotDtJDY8oRYnaaw4k3P7G0g7uUvfOK7U=;
        b=T/wlyyrJs2ySZyqvfqwQxw1wUt1wW5A67LERRcUby1O1t303L1sEGZ+s3uxH/sTWGz
         QCXAFOgSnQKtJGysvWEOXmSd50oAccamYpgh5Im4ZPSKdwjqL9gIZbNdaxlgUn//w619
         zwrA04G+s9VvlF9pY7ZlS6Ex34FhQXODVnEe2Hh6opXgKW77TnxSWXvWRNUXbbaAwmeZ
         BVFvGJGH+4LYsDiriE2zhaiMaloU8ZWfw+SHeuEBmh7yehq5QDwBtMNhDGEXYH3y4LGt
         ytkqvqCKxgKovJtvcSkXxUY8ePMXBESZrE6z40KGpA0MZDfuxtk3JSHfZWiXDui4lUKX
         wBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755850774; x=1756455574;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dcUSGcxU6eotDtJDY8oRYnaaw4k3P7G0g7uUvfOK7U=;
        b=H6u4JJ5Gy1Lxvbo2ZvDgLTKI5oHeStvEHxjTuUBX9UuXnFcgAklsr0Ol43bILr2M3C
         za31HWTdjP/eNF4up3G+CCqu3PmG4n1Vx3ymW97oKDxD9A2COYAgNAH7DDfAtyGxuQcn
         DiCUIuVXhmDSiH5SVorzhL/5iQmNFNOLpKaviAFz8TRl56+ReBHWe1D/WULg+WdWgS59
         qYnUzh/HENkgdimXCC4T9zzibjmqCRapNMH6lPU0Z/T3iTvMqY8IVmoVoRHa8y+vcR5+
         hTETK7pdF9dd7moDOTZpccQBRfxLGuELkMCdc09gMveZyLP0f+qsWQXcw2WOFI6oj+yK
         eUmA==
X-Forwarded-Encrypted: i=1; AJvYcCVt73tzuUNlAtigozXRLDiA8j4zLSw/sv4VxRkPKlPZ1U5Bq8BblOasBdZ7U2Jr+Rkr+dBKUCB+RsM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYZBYaMnttiRuuLmGgdM3PC468PRsSqnAxaQxWi/tIfadTOr2k
	fy+LHA5tnjsK4JW0jBHi5fulLWWWF7ZTDF5FoAmWKgnoLdx4LSVvxYtH5WzogNjtgQ==
X-Gm-Gg: ASbGnctUN/4o6xouadYa5XJpLJMmXoXruwyxfE8xK1Lqo+1LrtUXYP9wWB1LHub8eJF
	gnoWY+27GJaGFC0Bc9PGh8yAoGOD0DwmAoNM4JuXGOTOW0YGe3xF8HcQFViW4TMVxCgyKUpug0k
	rrZM8yMW0tqgHrBY2PiZRhaVOHQ+ZEf464IEIJkO+ndYKr37JLyhzBXZgVf1+GrY4mJZmrfOybT
	32Lfn5F2zYY368i5XMlRnmBKtLUN+pZgkVHxlFep4rcqVim/xinwUf8keFtvG1bdYtmDHIxEBtY
	V6uKdoQe6r2W7+vhJpUoe/GS16bhDNTiki8WIBunmpHb0LxhBRERaJuwOtiFeI1Malia5zxDMYj
	Q3kjzm09eYKEtuSCNyg6ozJeEa4p41A8Qf3Gg2nEIO9TfnEY4FcDvdIEDfHtVex46fx8mYKvbHZ
	zAhJipssk=
X-Google-Smtp-Source: AGHT+IGhcfam/c5psyVUGAgc8ruBu+isM94kjmoSiTpBewOQo+UiDxKnPnX9GTqU596uxHtMwZSSMA==
X-Received: by 2002:a17:907:3f2a:b0:afa:1d2c:bbd1 with SMTP id a640c23a62f3a-afe296e71f2mr206274566b.30.1755850769409;
        Fri, 22 Aug 2025 01:19:29 -0700 (PDT)
Message-ID: <2ba28d38-3251-492e-b7d8-a626dcaa1035@suse.com>
Date: Fri, 22 Aug 2025 10:19:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] xen/pci: add discovered PCI device at boot
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Luca Fancellu <luca.fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1755683961.git.mykyta_poturai@epam.com>
 <bb2589996131b0e7e645c0af281b9862e2e0f4cb.1755683961.git.mykyta_poturai@epam.com>
 <26bad9fb-3c4b-4423-a443-3406d07d56e0@suse.com>
 <df2d1f6a-23bc-4451-a91f-a484b448c467@epam.com>
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
In-Reply-To: <df2d1f6a-23bc-4451-a91f-a484b448c467@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.08.2025 10:03, Mykyta Poturai wrote:
> On 21.08.25 12:08, Jan Beulich wrote:
>> On 20.08.2025 14:28, Mykyta Poturai wrote:
>>> From: Luca Fancellu <luca.fancellu@arm.com>
>>>
>>> In dom0less mode, there is no dom0 that can call PCI physdev ops to
>>> register PCI devices to iommu, so it needs to be done by Xen.
>>> pci_add_device requires some default domain, we don't have hwdom, and
>>> the guests are not yet created during the PCI init phase, so use dom_io
>>> as a temporary sentinel before devices are assigned to their target
>>> domains.
>>>
>>> Rename setup_hwdom_pci_devices to setup_pci_devices and add dom0less
>>> handling to it.
>>>
>>> In pci_add_device there is a call to xsm that doesn't consider the
>>> requester of the function to be Xen itself, so add a check to skip
>>> the call if the owner domain is dom_io, since it means the call is
>>> coming directly from Xen.
>>>
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
>>> ---
>>> (cherry picked from commit eff51e50021b75f5a50533f7de681b2ce044f5bd from
>>>   the downstream branch poc/pci-passthrough from
>>>   https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git
>>>
>>> v1->v2:
>>> * integrate add_discovered_pci_devices into existing routines
>>> * better explain the need for dom_io
>>
>> What I continue to miss is an explanation of why devices can't go to their
>> ultimate "destination" domain right away (once those have been created),
>> i.e. why the dom_io intermediary is necessary in the first place.
> 
> I've done some testing and indeed everything seems to work if we call 
> pci_add_device directly during domain construction instead of 
> reassigning them. Do you think this would be a better approach?

I think so, yes, but first and foremost you'll need Arm maintainer buyoff
on either approach (or yet another one).

Jan

> If so 
> then I guess this series needs to be dropped, and I will prepare a new 
> one with direct device assignment to DomUs.



