Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B18D7A6BBE2
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 14:42:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923993.1327353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvcdQ-00048R-Ab; Fri, 21 Mar 2025 13:42:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923993.1327353; Fri, 21 Mar 2025 13:42:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvcdQ-00045h-7J; Fri, 21 Mar 2025 13:42:04 +0000
Received: by outflank-mailman (input) for mailman id 923993;
 Fri, 21 Mar 2025 13:42:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvcdP-00045b-5j
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 13:42:03 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44147bea-065a-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 14:42:00 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39127512371so1345987f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 06:42:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f995789sm2450064f8f.17.2025.03.21.06.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Mar 2025 06:41:59 -0700 (PDT)
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
X-Inumbo-ID: 44147bea-065a-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742564520; x=1743169320; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bKgWvdF+/GTmeEImkbmAOR0AtiSkDy1IlyRzOKotBrQ=;
        b=Q5BIPBxwMZDM0rVrOjrX7hIHPDlc/e+UNfG1KlK3oBGADENTo0gd5Z5ApS7xne4TJb
         DpjgdYfCN51M+IPDcObBftr7T2JUQD32UcjJ/PZrPSbuPVPprTJR81WV4/UCidWjsX4A
         L+ukqpgPwd+va15kUACjsUQDGikm/yzhoRMNKqn6HZS0iEx4f6vfSjmOu/ohI7MtOZ88
         4GLjNJQkSdqNQBvKUcooWdzj1Goz51Ay95j8dTxah1HBmQUSJpuTeffEX/NeIp3lMtMd
         1hDzpNjzbV7zMyArDG90JQHSVRYzYRiCmgn26BBfmuzOqBlTpQEfXx+LfYmlr1oobrRL
         YR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742564520; x=1743169320;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKgWvdF+/GTmeEImkbmAOR0AtiSkDy1IlyRzOKotBrQ=;
        b=DhGEzuc894alTYf8Et+K6iWKFIMn2C/9sd6Yk45GFSfvmLHRo0oX7HJjGqqsC6s8NB
         Orci2OMRnB+HqoM1BB0M2NxKsDTNNs7iVcp8r+hM+x7SIOaj21TJblOeh9l78gSbYJO5
         2iHoeesSQNaevkfcoVeQoncxbwNAKUIhAiOP3bIM7kzblywl6/ejQ6uMHfAoZdRFyYcF
         15uVMNXOiMuVL38bZIz6fjPSCBcp5yIQTZBg7MnLtboN4ZwaobL59FJWXp0uLuStD766
         PiqDV1lELPKaYAA7A4hjEElouzFjmKT4hmG5H3bnavUxHWsxu33bsx/F6rdRlxoHIJPW
         BUrA==
X-Forwarded-Encrypted: i=1; AJvYcCWV5EBa1kHsckNJgYL7XKnPJHHE74zObRbOl8ofyyFdlgdwnNf0ui/ugDPjvD9MioS7g+6aUPWvuUw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzC2HzCOP/lpJSMo95Hb+ZwWJcPV+YCZGNZ+c1ldGb2pW7SvmNI
	NcmQoynxqTwtGnSJZabA3WbUY5Xr0C8sEgrCr7lLc9GLSbpOfGUcOOUGSXH0Bw==
X-Gm-Gg: ASbGncvUVIdYqcWF5M22F1xSqCyvUDWQYO1OEtD0vSk9+bMoXDxWxkbCnsNV3kBLG9w
	qFdOqTMBRlZxysXa3HHAsdLI8+u4iSHlpQKY9IW4piv51z7JCdw/yrBjCIKeJxbz3qsU3Gp0YlT
	D7ipCAECqtYqx5N6Rg1TJOLvcoJZRQpwcFqumOYhkNx0WpatjH2qKLPtEt6I4tjuXNp+wT0t6wS
	NABY1mL0ukOJpp4jJTYVafq/RVMNGoBET1jkS7TsAoLywaMSXvw+N8kRv39YzjyIopNk35YrRw6
	c0YNYY6ZOAvo56dfLpbS1CTo7hbQVHWmQcGwlroFq+tXHqw13iFIJaslPSqyCLMdRcOgGVZgBh8
	ccp6J3OBYv4JZF1lc+coPL8bcEpjdpQ==
X-Google-Smtp-Source: AGHT+IHsC8ZkXS8Kk0n5UN2S9WkeOqXKzBhCrZEe2cMXIUu6WjaPyoCXThU7eMwSrkNEx/sdcXsg3A==
X-Received: by 2002:a5d:64e5:0:b0:38f:2b77:a9f3 with SMTP id ffacd0b85a97d-3997f932cc8mr3685366f8f.43.1742564520236;
        Fri, 21 Mar 2025 06:42:00 -0700 (PDT)
Message-ID: <f90b5092-1522-414a-b57a-7a9d116a1f43@suse.com>
Date: Fri, 21 Mar 2025 14:41:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1741958647.git.mykyta_poturai@epam.com>
 <132afbca390edd6e9fd7b1ffacf6c5aff0d29aa7.1741958647.git.mykyta_poturai@epam.com>
 <7fa0bde7-3aa9-48f4-a0ed-d03216edcc4e@suse.com>
 <dbc57c17-867f-49c4-be61-186b5562eff1@epam.com>
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
In-Reply-To: <dbc57c17-867f-49c4-be61-186b5562eff1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.03.2025 11:56, Mykyta Poturai wrote:
> On 17.03.25 17:07, Jan Beulich wrote:
>> On 14.03.2025 14:34, Mykyta Poturai wrote:
>>> --- a/xen/arch/arm/pci/pci.c
>>> +++ b/xen/arch/arm/pci/pci.c
>>> @@ -16,9 +16,18 @@
>>>   #include <xen/device_tree.h>
>>>   #include <xen/errno.h>
>>>   #include <xen/init.h>
>>> +#include <xen/iommu.h>
>>>   #include <xen/param.h>
>>>   #include <xen/pci.h>
>>>   
>>> +bool is_pci_passthrough_enabled(bool dom0)
>>> +{
>>> +    if ( dom0 )
>>> +        return pci_passthrough_enabled || iommu_enabled;
>>
>> As I think I said before - the function's name now no longer expresses
>> what it really checks. That (imo heavily) misleading at the use sites
>> of this function.
> 
> I am afraid I don't understand your concern. It still checks if PCI 
> passthrough is enabled. With just the change that ARM needs some extra 
> logic for Dom0 PCI to work properly.

Conceptually there's no such thing as "pass through" for Dom0. Hence the
name of the function itself isn't correctly reflecting what it's checking
for. iommu_enabled is a prereq for pass-through to be enabled, but it
doesn't imply that's necessarily the case.

> Maybe change the parameter name to 
> something like "for_pci_hwdom"?

That may help below, yes. But not here.

> >>> @@ -85,7 +94,7 @@ static int __init pci_init(void)
>>>        * Enable PCI passthrough when has been enabled explicitly
>>>        * (pci-passthrough=on).
>>>        */
>>> -    if ( !pci_passthrough_enabled )
>>> +    if ( !is_pci_passthrough_enabled(true) )
>>
>> There's no Dom0 in sight anywhere here, is there? How can you pass true
>> as argument for the "dom0" parameter?
> 
> This should be read as "is pci passthrough enabled for Dom0?" and if it 
> is we definitely need to do a PCI init.
> 
> I've also done some investigations on possible ways to remove the 
> Dom0/other domains distinction, but I'm afraid this is the most 
> reasonable way to make PCI functional on Dom0 without explicitly 
> enabling PCI passthrough.
> 
> SMMU is configured to trigger a fault on all transactions by default and 
> we can't statically map PCI devices to Dom0, so the only other way is to 
> put PCI in full passthrough mode, which I think is not safe enough.
> And we also can't drop this patch as it was directly requested by Julien 
> here [1].
> 
>>> --- a/xen/drivers/pci/physdev.c
>>> +++ b/xen/drivers/pci/physdev.c
>>> @@ -19,7 +19,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>           struct pci_dev_info pdev_info;
>>>           nodeid_t node = NUMA_NO_NODE;
>>>   
>>> -        if ( !is_pci_passthrough_enabled() )
>>> +        if ( !is_pci_passthrough_enabled(true) )
>>>               return -EOPNOTSUPP;
>>
>> Seeing the function's parameter name, how do you know it's Dom0 calling
>> here?
> 
> Is this a functional or naming concern? If it is about naming then can 
> it also be solved by renaming the parameter?

The renaming suggested above would resolve this, yes. Whether "for_pci_hwdom"
or anything alike is a good parameter name is a different question.

> Regarding functional issues, I have assumed that only hwdom can make 
> physdev operations, but after checking it, this assumption seems to be 
> correct on x86 but wrong on Arm.
> I expected there would be a check in do_arm_physdev_op() or somewhere 
> near it, similar to how it is done in x86, but there are none. I'm not 
> sure if it is intentional or by mistake, I think it needs some 
> clarification by Arm folks.

Hmm, looking at x86'es do_physdev_op() I fear I can't see such a check there
either. And indeed there are certain PHYSDEVOP_* which DomU-s may also make
use of.

Jan

