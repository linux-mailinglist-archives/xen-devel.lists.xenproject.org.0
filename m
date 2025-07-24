Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EB4B1020C
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 09:37:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055347.1423756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueqW1-0008K5-Dt; Thu, 24 Jul 2025 07:37:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055347.1423756; Thu, 24 Jul 2025 07:37:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueqW1-0008HV-B7; Thu, 24 Jul 2025 07:37:21 +0000
Received: by outflank-mailman (input) for mailman id 1055347;
 Thu, 24 Jul 2025 07:37:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueqW0-0008HP-Ew
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 07:37:20 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 076024aa-6861-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 09:37:19 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so6636255e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 00:37:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458714605c2sm3697495e9.19.2025.07.24.00.37.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 00:37:18 -0700 (PDT)
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
X-Inumbo-ID: 076024aa-6861-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753342639; x=1753947439; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3qSqJZtOGw2ZHzLWZ9f1TCtd/vZQ/hDFek5PfjpKCwg=;
        b=VWos4N9/zrKRMoJEGtlsxBs+XO4yWNA5hnHJm3bmUQ4mDSWtyffFytKgTdrDQEj1Q0
         IpnjpeZ+8eSHU7ufOD785MLyI02qxIoNL/QAcMswJd26hJBhyutIcIaQzpUo5/Hrbhur
         LIi9IKNb9ZzzfARJrcQdAEZCMiR36JWcQ+8WmIavKFh/3EWsBKcMbHfWTG5mfQaXEbyX
         +vVZJoe/C9bsuAWgsFofrF+CQxiiTpZxKRM26RnIXmVGE8PJxtDL5oVT9YghcH3ofB8P
         blqo77NewknS3xb3ZRzAHiG+R9okQ6XB8RuMdjN//e+c0pqeNTxL8viqtzDbA8Ho1zt9
         zTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753342639; x=1753947439;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qSqJZtOGw2ZHzLWZ9f1TCtd/vZQ/hDFek5PfjpKCwg=;
        b=qzF4ijyqIfsAlUtkwY3QyHi7rSaE6LpQ05RYrQu8lNPJgmwZiD5USu2iXiY8S74TMY
         FKfdxxeMu31SeFpcmNGFm/51wi9akVJsNo1PA4P4Sp/cJFAn6F8BqwFrHBDh+p5qMIku
         RvIzRefglJRqGPLdEuG3pU64gyORH3B9dIUkb2cgpwL0Kk9OEKmWwMbLGxgVvb1FVd2a
         qWsolloSO1zKgluB0R3Pll54sACcpg81bhQLVi9PrwRGygXvVvFecMJqHF8wtSWw8Cef
         nf0OqFbVjd+vU4hk44wKalZvE4jxsCqvBrOe9Glykv3+0HafRabPonMCMnb0CEh9mFXz
         fj6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9FpraX8pyINuD6DS6fYLqbMgXAuiNrh3aqNNAI9TuAHvd6sHXFWr2AB7YNDxTyXTJwtahhpZqos0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz9MUdMPLyALR7mZvqjGZPF63CDLukQtUeSA8udii/tNQPYLnT2
	O256XAmr4sFTLgDfnJfAlG4F9NueoTbIwMxviPAjHN6xb7v07todNR0lB77R2VHw2Q==
X-Gm-Gg: ASbGncsBZnTFG8Wj1GGAGUHVk+faYfGsJ+ZJXQ3XtwNd2WFBzo5SW1QuhewW1gtfPoZ
	PbRtKjo0LFZFwNvT6zt4RlZCgheSIflGxl2LRiFj+PpizUtUWW8AwavxKXWeEUHH9SxBwR4uyQq
	NZfX2FAKQfY+kamZokXpYvlz9LwVrdi4qungG9T6vGndun9KEZXS+wvlezrvQCTEvCwgn60UpwD
	i/XYPhLJBsiM6IeSOWlGwNS6wCIeJEzFHHmlvh/wBQps7gMIPI6gPM/fsaXC1Rhm33B+4Puf+Xe
	XC2kCPFufPaZr45W7x02Ro0VLIF3mkbFoJmk65hkOy1QquLVlEasBgS6gLOYi+bIJpsH5xLPDp+
	so3qz/aZcfgD9EKj3gRnhJgGUvCGgGKQQEaKyatdmUk6xlRxIwe99wQVPyadvBAmIYrH083u1aW
	JknqcNrTU=
X-Google-Smtp-Source: AGHT+IFAWasMxewM/sSp5hLrNzP7+xsSPceLnLKCL+qiCYEh+90m+Up9o+mOP7x3GMcpfw/EE/uUDw==
X-Received: by 2002:a05:600c:630f:b0:456:25aa:e9b0 with SMTP id 5b1f17b1804b1-45868d47975mr65550015e9.16.1753342638814;
        Thu, 24 Jul 2025 00:37:18 -0700 (PDT)
Message-ID: <7ac57420-1927-4c1f-a2cc-b0c0172a0344@suse.com>
Date: Thu, 24 Jul 2025 09:37:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250613154847.317979-1-stewart.hildebrand@amd.com>
 <1ab5d13e-f482-42e4-aae2-7276c6ea4654@suse.com>
 <3518a202-c664-4564-b59c-194f954b232e@amd.com>
 <c281035f-f347-4af9-a24e-6d0db6cb3ba0@suse.com>
 <256def05-4fcc-4c55-b409-d5ad63ac39d4@amd.com>
 <3736acf0-5808-4195-9a8d-e271f6791969@amd.com>
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
In-Reply-To: <3736acf0-5808-4195-9a8d-e271f6791969@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2025 00:26, Stewart Hildebrand wrote:
> On 7/23/25 18:16, Stewart Hildebrand wrote:
>> On 7/23/25 10:59, Jan Beulich wrote:
>>> On 23.07.2025 16:26, Stewart Hildebrand wrote:
>>>> On 7/23/25 06:18, Jan Beulich wrote:
>>>>> On 13.06.2025 17:17, Stewart Hildebrand wrote:
>>>>>> --- a/xen/arch/arm/Kconfig
>>>>>> +++ b/xen/arch/arm/Kconfig
>>>>>> @@ -8,6 +8,8 @@ config ARM_64
>>>>>>  	depends on !ARM_32
>>>>>>  	select 64BIT
>>>>>>  	select HAS_FAST_MULTIPLY
>>>>>> +	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
>>>>>> +	select HAS_PASSTHROUGH if PCI_PASSTHROUGH
>>>>>
>>>>> As I just learned, this change (or maybe it was the "select HAS_PCI"
>>>>> further down) has exposed the quarantining Kconfig option prompt, which
>>>>> (aiui) is entirely meaningless on Arm. IOW I think further adjustments
>>>>> are necessary.
>>>>
>>>> Not entirely meaningless - the choice between "none" and "basic" still
>>>> seems relevant. Just "scratch page" quarantining hasn't been implemented
>>>> in any of the Arm iommu drivers.
>>>
>>> Is there support for "basic"? For x86, most of the involved code lives
>>> in the vendor-specific drivers, and I can't find anything related in
>>> Arm's. Note in particular the hook iommu_quarantine_dev_init() calls,
>>> which isn't provided by any of the Arm drivers afaict.
>>
>> Quoting xen/drivers/passthrough/Kconfig IOMMU_QUARANTINE_* help text:
>>
>> "... basic form, all in-flight DMA will simply be forced to encounter
>> IOMMU faults."
>>
>> My understanding of "basic" is that after destruction of a domU with a
>> PCI device assigned, the PCI device gets assigned to domIO. We have
>> special casing for ( d == dom_io ) in some instances, but otherwise it
>> has relatively little to do with the individual iommu drivers. I believe
>> assigning to domIO should be enough for the Arm iommus to generate
>> faults, since the iommu identifies the PCI device's DMA via sideband
>> information (AXI stream ID).
> 
> Oh, and also note the commit messages in
> 63919fc4d1ca ("xen/arm: smmuv3: Add PCI devices support for SMMUv3")
> and
> ca8f6ffeb6e3 ("xen/arm: smmuv2: Add PCI devices support for SMMUv2")
> "Implement basic quarantining."

I'm fine with the proposed adjustment if things work on Arm. I'll demand
an Arm maintainer ack then though, I think.

Jan

