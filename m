Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D49FDA07519
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 12:51:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868286.1279820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVr41-0005Sd-Lc; Thu, 09 Jan 2025 11:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868286.1279820; Thu, 09 Jan 2025 11:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVr41-0005QS-Iw; Thu, 09 Jan 2025 11:51:01 +0000
Received: by outflank-mailman (input) for mailman id 868286;
 Thu, 09 Jan 2025 11:51:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pS5t=UB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVr40-0005QI-57
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 11:51:00 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe19c70f-ce7f-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 12:50:59 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-436341f575fso8919465e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 03:50:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2ddca2dsm52559985e9.21.2025.01.09.03.50.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 03:50:58 -0800 (PST)
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
X-Inumbo-ID: fe19c70f-ce7f-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736423459; x=1737028259; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H9m8LioseIqRAUAmVRhVyBB7x2L9TDN3Hr8T1J8beSU=;
        b=GMrldDCLwRpmUeXJgzYDnJBrbB49GdP7jhh7M+1EUH2snnkiQc8Su541B5Ye6V6ECb
         N+ucLOpOIXXhw+0qpfhJjXdHlJqMtoqvk144erAmof073DgZusaCGdMNyVhmSNONsAX7
         lR5B3Ch7cWDMp0mQsqAQcBbZ+X1d57qC0uEsrkIYulSAeTIZJypB0IIDRDF1LQ99kVln
         6eDB3sCHJFbf2wG2ugyST1uqGVcw9AKqgJ71JU/3LGC0viX0bUZUUzKEYGfi6Rn5uyr6
         Zx2rXv7OK1UcT12N3Xm06UgRRqaOQuP3kpH3bs80vG1kLqzY6ahL0Rvfzebw8TFJddPu
         DMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736423459; x=1737028259;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9m8LioseIqRAUAmVRhVyBB7x2L9TDN3Hr8T1J8beSU=;
        b=b+CEWj3bfYVvARZKJ6x4pWpmaSVmPdxuyObkvCw7vosgtv2VHkO3XGrO3ny8RRHNv0
         KbSUSVxPQNTFMSekzjwQLaJ0iN/fD8hyhNjwusxwf+DWVVfRsITyyrIMl+ko6zAgHTNy
         odImXVBCKZY7IglfBYodA5BztdgcU9wliNjs2hnmeM4VENvoKdG12cqN15nA/nRVFSOd
         8aCL4fQk2AJu5Zx1lkkd2vzjCIEshPy+BhE6EIUIM/ByjH4rL4O8VeUicvuhqXkEHfpy
         b4GVIH+7i/QA8TB0srhMz4qdZ7ITui/ppjYA4JLmJfdJkW8Sd4phiUoWRmzOIVhpIDhk
         0dMw==
X-Forwarded-Encrypted: i=1; AJvYcCUQJJ6VYpz8b5EPWbhf3vqJq40sJ0oRE+DSMq9aQfmtADkYxPwvsDtn4M8LLTIzEdneyeYRWobIJ4Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzcapTmI9iKD6fUo1M2pd8vAd8uto2NPLfbVLnwivLaihsxEb8h
	HfRzzFztDQWDUm/ugwZwx/EMZDBHP/o1sZmhK2WKt3hEHDxaMOpQNSRLG8wBV/0J1/3bb5YvLVA
	=
X-Gm-Gg: ASbGnct/2JoUbKFx24ikNXL8OTgk+ZQmm6p3MD8v7knsmeiWpbAKY5X2U4zvtKPMnY4
	LrCHBDi9+zPBt0pwsmHz1E2PidsVEi+m7mPvhyQlvrPvKQulHP2CxytPpofAVes8PttF0GxdrZQ
	100OTbBemrmOkch5/QtmHcogaaME56HOMdllYXLGvi/pS8UfsFca/SgmkSskd3Ook/9jiTmUdqX
	lPQyUyVpEFYg7jkWpRG7Glh56sT9zPpMpRPbn92nhyI7Lnpv4p8JlC1uFs+3OTxGEXJpZ7mS67R
	LrTR5U23aGgIfUWUrA9R1cuwNqYDo0oSFJHDZ+reow==
X-Google-Smtp-Source: AGHT+IGCv3s8wq4GwM89JKsOUNktDSiI6s9eEiG+tuGsk01df+4ki07ESE7Fi0CdRLVNGqMruUXoDA==
X-Received: by 2002:a05:600c:314e:b0:434:f5c0:329f with SMTP id 5b1f17b1804b1-436e2697947mr64735685e9.14.1736423458687;
        Thu, 09 Jan 2025 03:50:58 -0800 (PST)
Message-ID: <ec04cc3a-8d35-4a56-a956-f36041d5e54b@suse.com>
Date: Thu, 9 Jan 2025 12:50:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN RFC PATCH v4 0/5] IOMMU subsystem redesign and PV-IOMMU
 interface
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1730718102.git.teddy.astie@vates.tech>
 <Z38-y9xR-6C_sARJ@mail-itl> <c0b9fbdb-87db-4f31-8069-0c2d1c4ad4cd@vates.tech>
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
In-Reply-To: <c0b9fbdb-87db-4f31-8069-0c2d1c4ad4cd@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.01.2025 12:39, Teddy Astie wrote:
>> 3. Xen complains on boot about missing endbr64 (surprisingly, it didn't
>>     exploded):
>>
>>      (XEN) alt table ffff82d0404234d8 -> ffff82d040432d82
>>      (XEN) altcall iommu_get_max_iova+0x11/0x30 dest iommu.c#intel_iommu_get_max_iova has no endbr64
>>      (XEN) altcall context.c#iommu_reattach_phantom+0x30/0x50 dest iommu.c#intel_iommu_add_devfn has no endbr64
>>      (XEN) altcall context.c#iommu_detach_phantom+0x25/0x40 dest iommu.c#intel_iommu_remove_devfn has no endbr64
>>      (XEN) altcall iommu_context_init+0x27/0x40 dest iommu.c#intel_iommu_context_init has no endbr64
>>      (XEN) altcall iommu_attach_context+0x3c/0xd0 dest iommu.c#intel_iommu_attach has no endbr64
>>      (XEN) altcall context.c#iommu_attach_context.cold+0x1d/0x53 dest iommu.c#intel_iommu_detach has no endbr64
>>      (XEN) altcall iommu_detach_context+0x37/0xa0 dest iommu.c#intel_iommu_detach has no endbr64
>>      (XEN) altcall iommu_reattach_context+0x95/0x240 dest iommu.c#intel_iommu_reattach has no endbr64
>>      (XEN) altcall context.c#iommu_reattach_context.cold+0x29/0x110 dest iommu.c#intel_iommu_reattach has no endbr64
>>      (XEN) altcall iommu_context_teardown+0x3f/0xa0 dest iommu.c#intel_iommu_context_teardown has no endbr64
>>      (XEN) altcall pci.c#deassign_device+0x99/0x270 dest iommu.c#intel_iommu_add_devfn has no endbr64
>>
> 
> I also see that, but I am not sure what I need to do to fix it.

Add cf_check to the functions in question, I guess.

Jan

