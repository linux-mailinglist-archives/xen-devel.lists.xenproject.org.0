Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 015DDAEF1C7
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 10:50:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029442.1403181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWWgZ-0001EQ-39; Tue, 01 Jul 2025 08:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029442.1403181; Tue, 01 Jul 2025 08:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWWgY-0001Bw-Uj; Tue, 01 Jul 2025 08:49:50 +0000
Received: by outflank-mailman (input) for mailman id 1029442;
 Tue, 01 Jul 2025 08:49:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=28IZ=ZO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWWgX-0001Bq-Pv
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 08:49:49 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57adf9b5-5658-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 10:49:47 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a51481a598so1678638f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 01:49:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f542e494sm15001259a91.31.2025.07.01.01.49.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 01:49:46 -0700 (PDT)
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
X-Inumbo-ID: 57adf9b5-5658-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751359787; x=1751964587; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SfXwyirN7XXgznRbq91A1uKr8U2XVhgESX0cgoajrdU=;
        b=EUazcohN75KE+2g+JTLI9B69y+DufPcKfM9a+dnlx4Lm6YGT/14BcGBdzO61ELoXHC
         bWEp8UPsPz2mAfKx3WvvNN9EhnofUmCOHYVywNrMLxFApxYh62sDzlXcWxzwufBNKEuf
         Y2ok2JAm1HnFccRQcgORWEqsQM0HAFrHIbAffbHxTcpCfRnB00/o5ILnnOduOUyh9335
         YBCWVEwILbL96S2s+QKQg20eEUe3i9Oklbr0fa0Ni8Y9qFJPrMFvIYCRVbbvjYhX54hj
         lLETtVRepXg9JkZoXazZy66S3HhkRji/ftTMNeLkn1QDaw8v+J7wN/h8++4/kZ5R4hWo
         +tLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751359787; x=1751964587;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfXwyirN7XXgznRbq91A1uKr8U2XVhgESX0cgoajrdU=;
        b=Lkl3u9xTkESlnkNygVr0QxGSXbc4tdWGpDvSmwWfOjPSrhF74BG4fH1/sYC/DkIQGl
         dOiNpzlwTdEH0H3bd7CAHUA5TwSg2bRrIc0tJ2vvnS77AnQLLT4MutOoSPMn7TS73epL
         OiIA+PgvLa/fOdOLndmr6Ssh5eN1kTW0rY8wadh0k8S0EwZcl2iwmcOOU7GdM9ixsT7m
         yWaCr+Pw4wqYK8dm/EVgomci6Jv6u/aUgeC76t6npUuoJwfLAsEjpYtby9havikGbjfS
         7BN2t6PJg5/5P04S8Cu0YMbY8l8qhz2ZqRCkz//DlDwj+2p3XjB5lGNib5uBf/PJDAW9
         2/rQ==
X-Forwarded-Encrypted: i=1; AJvYcCXheFSAq3BL90Y7ANSGoJ07MSCY+vVtIZBX7vqDe6rgyGw1MgScifHWQqWHf4K3eLFtXvApN3Zxyp0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTn18YFuReNqwd6e4GcgwugX9TZqaJg0sX8IruCoOWLDUbDW1T
	toxHy7eEuvTWvMb/dYfSlPlf+htPR81JZdTJw5eTUq4+ySrS2lNG1IK3WLWOcn79aQ==
X-Gm-Gg: ASbGncvMil+CcvCGVweya4tznqfYG2QeVbo//fAE3RQozBJYGy0YutSyt3aLbKSQZch
	RCGxxVuS1DBpWpRtnXURM8JTJrkoOAEYyHTj44pB/S0eNrr8Po++7+GZM501PA7oWqZkAEYhlCN
	kGhiBFJdJ8I2pQwIMNRKTb5LFeeqWEzpi5rECz3duhttHONGTjYE8ujH0TUanSNMzd+7y6l9erI
	GXO1HQC5sU4RMvykAKuUknbDWpaI9tyQTsaPQPaWNVNth5/hb4X/w2CPgv+DOmCqaO7NUddmfoK
	LEV44YSx4EBc/IgcKk8aYuNq+5X1ryvY9wtMEMI6URAoEkGX15sOScH4axC1ZZnTXUL9wP4w0t1
	jFM8M8LtzkiT7TFyalTETv+srWCg8sdytFf8Yz30v0Yr5rRE=
X-Google-Smtp-Source: AGHT+IHyS8xeFQVoOy/R521ntKIzZ2/GIhmu4LzdvyMrZfvQXtYiNqceYsmrivaJ8dGYOa+23M17Mg==
X-Received: by 2002:a05:6000:21c8:b0:3a4:eda1:6c39 with SMTP id ffacd0b85a97d-3a8fda35a01mr8922418f8f.13.1751359787010;
        Tue, 01 Jul 2025 01:49:47 -0700 (PDT)
Message-ID: <34b6cfb8-5161-4949-835f-1ddadfeb743b@suse.com>
Date: Tue, 1 Jul 2025 10:49:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 6/7] xen/arm: enable dom0 to use PCI devices with
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
References: <cover.1748422217.git.mykyta_poturai@epam.com>
 <c0b080618909580e527d7c6cce6010edf5278d2c.1748422217.git.mykyta_poturai@epam.com>
 <66cda989-efe9-4389-ae8d-cb9bc4dc5239@suse.com>
 <c5ff547e-4e0e-4f31-a07d-55527a6d8457@epam.com>
 <a73e2e41-6101-4a4e-a50e-f68d28a0637f@suse.com>
 <7250049f-e8fd-4752-b749-596332de34a0@epam.com>
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
In-Reply-To: <7250049f-e8fd-4752-b749-596332de34a0@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.07.2025 10:29, Mykyta Poturai wrote:
> On 04.06.25 08:52, Jan Beulich wrote:
>> On 03.06.2025 15:31, Mykyta Poturai wrote:
>>> On 02.06.25 11:11, Jan Beulich wrote:
>>>> On 28.05.2025 11:12, Mykyta Poturai wrote:
>>>>> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>>>
>>>>> Enable the use of IOMMU + PCI in dom0 without having to specify
>>>>> "pci-passthrough=yes". Due to possible platform specific dependencies
>>>>> of the PCI host, we rely on dom0 to initialize it and perform
>>>>> a PHYSDEVOP_pci_device_add/remove call to add each device to SMMU.
>>>>> PHYSDEVOP_pci_device_reset is left untouched as it does not have the
>>>>> pci_passthrough_enabled check.
>>>>
>>>> Just to re-raise the question here: Is this actually correct?
>>>
>>> I'm afraid I don't quite understand your concerns here.
>>>
>>> The purpose of this patch is to relax the pci_passthrough_enabled checks
>>> and make PCI physdev ops work with passthrough disabled.
>>> The reset op worked independently of PCI passthrough being on or off and
>>> will continue to do so after this patch.
>>> If your concerns are about the correctness of allowing reset to always
>>> work, you specifically requested this behavior in the patches
>>> implementing it here[1].
>>
>> Right, yet even there I had already asked for possible differing opinions.
>> Plus the case I had mentioned was specifically Dom0, which fits here.
> 
> So I've done some testing to see the actual behavior with different 
> combinations of pci-passthrough and iommu switches. With passthrough=off 
> and iommu=on the reset works fine. But with both of them off, it fails 
> because PHYSDEVOP_pci_device_add is not adding anything and therefore 
> pci_get_pdev can't find the pdev.
> 
> I am not sure which behavior would be the correct one here for 
> passthrought=off and iommu=off.
> 
> 1. Leave it as is, reset returns -ENODEV and pciback probe fails
> 2. Add the same check as in add/remove, reset will return -EOPNOTSUPP 
> and pciback probe will also fail
> 3. Add the same check as in add/remove but return 0 so pciback can probe 
> the device.
> 
> Maybe you have some thoughts on this. I can't come up with an actual 
> good reason for using pciback without pci-passthrough enabled, outside 
> of maybe "not breaking some abstract scripts". And EOPNOTSUPP seems more 
> descriptive than ENODEV so I strive towards option 2 if everyone okay 
> with that.

I think I'd favor option 2, too. Without pass-through, PHYSDEVOP_pci_device_reset
is pretty meaningless aiui. vPCI in particular builds on top of pass-through aiui,
even if that isn't expressed like that right now (e.g. by having HAS_VPCI select
HAS_PASSTHROUGH).

Jan

