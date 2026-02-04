Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCDvH8IPg2kPhQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 10:22:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1996E3C44
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 10:22:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220275.1528988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnZ5A-0003FM-Gj; Wed, 04 Feb 2026 09:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220275.1528988; Wed, 04 Feb 2026 09:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnZ5A-0003D8-DF; Wed, 04 Feb 2026 09:21:56 +0000
Received: by outflank-mailman (input) for mailman id 1220275;
 Wed, 04 Feb 2026 09:21:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnZ59-0003D2-7e
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 09:21:55 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1cf32ea-01aa-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 10:21:53 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48068ed1eccso61001215e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 01:21:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4831084dd88sm31442025e9.6.2026.02.04.01.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 01:21:52 -0800 (PST)
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
X-Inumbo-ID: f1cf32ea-01aa-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770196913; x=1770801713; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KZAy3JBFmfHD5+cvcujEFJBeVcKl/dA93tdV5F0xLLY=;
        b=YUBj6ts59m1emaozuPr1UYCoVewROkJ9Oy/Z9jTs2zemVn47I2uD9+eBN3q0vFcXBq
         hzx7/6daVk2duf6Wb6t4UU+yyrGcUeevkiNIKobDbpzBr95eZ1LXIHnv65HHh3X6iKMM
         8sTc9vQsLoDylFBd1Qai74jfaw72wj1Ra2bAcTkZEu1bcLw0KbV0a2yXOLBC4oCxZEEw
         eGypHaTAWHYwmsBS7jQIaZP01W/TwRxO7hZo3knpj52waoGPTXzStIQbTzCIy5xDbwyP
         FFbgpz/K23IMHThiIwRVZyyabsPGbpD3K2k22uCTEc2JyPFvjQXt2QEe1wcpxPVQtLoW
         kJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770196913; x=1770801713;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZAy3JBFmfHD5+cvcujEFJBeVcKl/dA93tdV5F0xLLY=;
        b=U5Aw0JDu2BeDfOilOia5E4uBYepRK5FfICMT5T6yxT6YBqetYPGsMBVLVTxY6L3Dhv
         HKp33omidhHfZqp/sZ0I+ZcgQ4VvUCcM2iG2UvITkerkjh2tqqR5+apBrBAKyqQXyN77
         J2FY/+wHcdZpNDcPp25vPCZ3e86XIe8CmPvZ4TsMYBz5T2Bvrsih9A+JngCvmdGQR4ef
         TPgMZKczUARMYyjInpVyxKBNkwkZ/UXUIkJIb0SAAUJNPSAx64z/qX30DNn8+wjxXVjD
         GjSUgDHsC+dLRoCEdGo1mzJBJLBEM9k0KD2N8tWXlWrc0eoAsST6jdQM8cFyAx7/bFxJ
         Usxw==
X-Forwarded-Encrypted: i=1; AJvYcCWqVdcrc9yD1fqugaN0eZXRG8MZV3+CahLrLRXEA4hv0508ZHOEfJHEatBibLz/o2yZntDs0l0HFvs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0GqM5x6nAICRcEAuBiIN5hXeF42e1j6RiTAtvy+wJ5YvmxB7Q
	wPSupsP0lS8uGAoWZwCFrjW+ZJMHUAliCkhE7W2pioLFbkpXF2AWl5L30Q3CU4Q3zg==
X-Gm-Gg: AZuq6aLH8/mvyVryz8fcCFEWqzHjzNByy426fo4IB5eKqZ+B5salhjV/ZQKB2xoG3c2
	bQv+bBG7omrpDm0uZnD28Gke/95dsPpabVFcB5m4x4e2RlPzqBSFTue8A6zlpxirtXwRIcH1vPQ
	0s0Bmk+sEM84LXPUop5qwhLYw8MOOfLQQcagwiDzyixed1uI9NkBmty5wr8l2uAPE2gYERiiNZt
	u1TJOr2oMsBNdybgHwQOFGBY5MAR1jTYv/XcusiH8ALJrElq+31lip4DC/1kL8L08LBx5CByzw4
	t6Z3ZXu3qasQnm1NGOBveh7bRXnbLX2bfirjS52rbSW4xZ5YarlyDdh+ph5WKhUbt9N9WDRLazh
	DXBdvUSJ/zHQ4OtQik14YHyg4t6TnAG0vtzxSoRM808hyE9PJHvF7ddTSk9tQvKby+x9wqX4TC4
	XYfbryf64HYyZ/KZEWgAk3gcDv7q4n6S9oiDsO0ybkiZChjIbF6mMK0V4vyBMjZ3NrJ5+KhY47G
	/8=
X-Received: by 2002:a05:600c:3b16:b0:480:3b4e:41b8 with SMTP id 5b1f17b1804b1-4830e9934d2mr31832515e9.33.1770196913298;
        Wed, 04 Feb 2026 01:21:53 -0800 (PST)
Message-ID: <2a09d8d7-c826-4b8f-a531-e26c4b352d40@suse.com>
Date: Wed, 4 Feb 2026 10:21:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/24] xen/domctl: wrap pci-subset iommu-related domctl
 op with CONFIG_MGMT_HYPERCALLS
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "grygorii_strashko@epam.com" <grygorii_strashko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Andryuk, Jason" <Jason.Andryuk@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Garcia Vallejo, Alejandro" <Alejandro.GarciaVallejo@amd.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-15-Penny.Zheng@amd.com>
 <DM4PR12MB84517CB58BD82B676DD25AE9E198A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <bdda8006-6361-4e79-b3ef-19409bf98587@suse.com>
 <DM4PR12MB84517BAB14591F2D46BF082FE198A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB84517BAB14591F2D46BF082FE198A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:penny.zheng@amd.com,m:Ray.Huang@amd.com,m:grygorii_strashko@epam.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:Jason.Andryuk@amd.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:Alejandro.GarciaVallejo@amd.com,m:stefano.stabellini@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E1996E3C44
X-Rspamd-Action: no action

On 04.02.2026 09:23, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, February 4, 2026 4:09 PM
>>
>> On 04.02.2026 08:50, Penny, Zheng wrote:
>>>> -----Original Message-----
>>>> From: Penny, Zheng <penny.zheng@amd.com>
>>>> Sent: Friday, November 21, 2025 6:58 PM [...]
>>>> 772,14 +774,16 @@ static const struct iommu_ops
>>>> __initconst_cf_clobber  _iommu_ops = {
>>>>      .quarantine_init = amd_iommu_quarantine_init,
>>>>      .add_device = amd_iommu_add_device,
>>>>      .remove_device = amd_iommu_remove_device,
>>>> -    .assign_device  = amd_iommu_assign_device,
>>>>      .teardown = amd_iommu_domain_destroy,
>>>>      .clear_root_pgtable = amd_iommu_clear_root_pgtable,
>>>>      .map_page = amd_iommu_map_page,
>>>>      .unmap_page = amd_iommu_unmap_page,
>>>>      .iotlb_flush = amd_iommu_flush_iotlb_pages,
>>>> +#ifdef CONFIG_MGMT_HYPERCALLS
>>>> +    .assign_device  = amd_iommu_assign_device,
>>>>      .reassign_device = reassign_device,
>>>>      .get_device_group_id = amd_iommu_group_id,
>>>> +#endif
>>>
>>> FWIS, Alejandro has come up a more clever way to DCE these kinds of op,
>> staying conditionally as callback. Here, I just took this commit as example to show
>> the methodology:
>>> ```
>>>          .assign_device  = IS_ENABLED(CONFIG_MGMT_HYPERCALLS)
>>>                                         ? amd_iommu_assign_device
>>>                                         : NULL, ``` The compiler has
>>> enough visibility to know that static(amd_iommu_assign_device()) is used, and is
>> droppable when MGMT_HYPERCALLS=n. So there is no need to do ifdef-wrapping
>> around these statics now. Later when jason's "--gc-section" patch serie in,  --gc-
>> section will help linker identify them unused when MGMT_HYPERCALLS=n, then
>> remove them automatically.
>>
>> I fear I don't see why --gc-sections would make a difference when, for static
>> functions, the compiler already is in the position of removing the functions.
> 
> I may misunderstand the DCE process. With this change, we don't need to put #ifdef CONFIG_MGMT_HYPERCALLS around the statics (e.g. amd_iommu_assign_device()). So preprocessor will not help us remove them.

But the compiler's optimization passes can, when they observe that a static
function, while referenced by source code, is referenced only in branches of
conditionals which are compile-time false. Without link-time optimization
that's really about all DCE can do.

Jan

