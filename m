Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E779C5239
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 10:39:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834274.1249889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAnN6-000641-HN; Tue, 12 Nov 2024 09:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834274.1249889; Tue, 12 Nov 2024 09:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAnN6-00061H-Dq; Tue, 12 Nov 2024 09:39:40 +0000
Received: by outflank-mailman (input) for mailman id 834274;
 Tue, 12 Nov 2024 09:39:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAnN4-00061B-T9
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 09:39:38 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06b2d678-a0da-11ef-99a3-01e77a169b0f;
 Tue, 12 Nov 2024 10:39:34 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-431ac30d379so47058975e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2024 01:39:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b3de8710sm185670135e9.17.2024.11.12.01.39.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 01:39:34 -0800 (PST)
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
X-Inumbo-ID: 06b2d678-a0da-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzEiLCJoZWxvIjoibWFpbC13bTEteDMzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjA2YjJkNjc4LWEwZGEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDA0Mzc0Ljk0NTI0LCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731404374; x=1732009174; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w4Fo7aF93GrBAIT6BV8fr8v8WjQIXnPxU39naw4ai40=;
        b=EM3qlNOeD67SA/gGy49q+tl5x6SvPYIQlUESEPzxPpRC47eeHXu1Kgt1veOAdg+6th
         Li/+mWz1CmG21rClIjMbgOeC+pJLvoSO9VEzVjHoSVVD14XQ7aRo12v0dLjoSTULA2Z5
         FtoLjNSHajip+CUpJjzG6L5JfVczVhFLrsCymiDpXZjsU5BA7H870MKBUmBtCOwa2Als
         Q95t/3VSs6BufEBLUnlWCNHBqpghUneKudFEna9aVsG11chemXFRw6oEoWlcalbbyfT0
         z5xrKHenp2oOqgbwQoARqss1+HKtCsxd/nDvEMlctMpQuiOed0KTHczoJKEYu4NIY1R0
         pSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731404374; x=1732009174;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4Fo7aF93GrBAIT6BV8fr8v8WjQIXnPxU39naw4ai40=;
        b=Ttj9hswkk4RFJ93wWYFwmLypjWoTvI2W6oQ4eG6CD5uYwBuYogf46vOZbzQbjL+RAf
         0ow2caag/DsoHxKaVcdQjdiZJ0sB3kIO2tZs0mivtCUmoL6+IaZerIWStiZsaxTnHRHL
         0xBtys1PFRBv72AHJWaocsXXwcHuZ/AozPQT1jBC8smsjFKeSRgfMqRytdfQwaErxpH+
         MWG2L68Cl5jvyWW2G5PUJEViWIoO/TCk5dG9OJNpF4hDBNKoyvVGp2+w5To4sQVFCXLD
         9E7kh2CWGKUGxPEKNfh5qpLl4LCWQ4YLgFtrsWhWmvE95INTGTJaeEP5sbl7KfX7r7iO
         zljQ==
X-Gm-Message-State: AOJu0Yw9ub80+1JltdKoIWR5B2+WU2ApUh0tOaVG/CjaE32KNeefRWyk
	11U8pVo3rJSfSWdy7jtawqm7ZAoU0/FcNh+1xMq8Dlvy9CdmYtfjgS867KhwIQ==
X-Google-Smtp-Source: AGHT+IFx5pshVOHVBQA1zR3Ys6Lynk7I2htxKp5TbPqMHAMlc2lpYx+jcbya11lX1ZW8iVrrmDr+6A==
X-Received: by 2002:a05:600c:3582:b0:430:54a4:5ad7 with SMTP id 5b1f17b1804b1-432b74faabdmr135789545e9.1.1731404374289;
        Tue, 12 Nov 2024 01:39:34 -0800 (PST)
Message-ID: <f8bedb2a-1d32-4e99-885a-79a56c1bdd36@suse.com>
Date: Tue, 12 Nov 2024 10:39:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] xen/pci: introduce PF<->VF links
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
 <20241018203913.1162962-3-stewart.hildebrand@amd.com>
 <Zx_a57npsdRhLgYr@macbook> <b3f9a4a4-112b-4d58-afca-bc88ea2b1e11@amd.com>
 <ZzMZpg3FCyc4SW4z@macbook>
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
In-Reply-To: <ZzMZpg3FCyc4SW4z@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.11.2024 10:02, Roger Pau Monné wrote:
> On Mon, Nov 11, 2024 at 03:07:28PM -0500, Stewart Hildebrand wrote:
>> On 10/28/24 14:41, Roger Pau Monné wrote:
>>> if ( !pdev->info.is_virtfn && !list_empty(&pdev->vf_list) )
>>> {
>>>     struct pci_dev *vf_pdev;
>>>
>>>     while ( (vf_pdev = list_first_entry_or_null(&pdev->vf_list,
>>>                                                 struct pci_dev,
>>> 						vf_list)) != NULL )
>>>     {
>>>         list_del(&vf_pdev->vf_list);
>>>         vf_pdev->virtfn.pf_pdev = NULL;
>>>         vf_pdev->broken = true;
>>>     }
>>>
>>>     printk(XENLOG_WARNING "PCI SR-IOV PF %pp removed with VFs still present\n",
>>>            &pdev->sbdf);
>>> }
>>
>> Yeah. Given that the consensus is leaning toward keeping the PF and
>> returning an error, here's my suggestion:
>>
>>     if ( !pdev->info.is_virtfn && !list_empty(&pdev->vf_list) )
>>     {
>>         struct pci_dev *vf_pdev;
>>
>>         list_for_each_entry(vf_pdev, &pdev->vf_list, vf_list)
>>             vf_pdev->broken = true;
>>
>>         pdev->broken = true;
> 
> Do you need to mark the devices as broken?  My expectation would be
> that returning -EBUSY here should prevent the device from being
> removed, and hence there would be no breakage, just failure to fulfill
> the (possible) hot-unplug request.

That very much depends on Dom0 kernels then actually respecting the error,
and not considering the underlying hypercall a mere notification.

Jan

