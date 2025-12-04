Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BB8CA2C1B
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 09:10:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177350.1501661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR4Pr-0006xo-UK; Thu, 04 Dec 2025 08:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177350.1501661; Thu, 04 Dec 2025 08:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR4Pr-0006v7-Qw; Thu, 04 Dec 2025 08:10:19 +0000
Received: by outflank-mailman (input) for mailman id 1177350;
 Thu, 04 Dec 2025 08:10:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6HWG=6K=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vR4Pq-0006tQ-5U
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 08:10:18 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3353d03-d0e8-11f0-980a-7dc792cee155;
 Thu, 04 Dec 2025 09:10:03 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-42b3c5defb2so356530f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Dec 2025 00:10:03 -0800 (PST)
Received: from [10.188.153.1] (cust-west-par-46-193-35-210.cust.wifirst.net.
 [46.193.35.210]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d352a52sm1788537f8f.38.2025.12.04.00.10.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 00:10:02 -0800 (PST)
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
X-Inumbo-ID: a3353d03-d0e8-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764835803; x=1765440603; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kfat4wxdrTqwqAlZzuGd6mN1XCYqVm4+qO5sYRRuw5I=;
        b=aECG9jA0tJvsM55x2mE9oA/WGnDbUX/O+BNGZoPGBrCQVEvMPSMMvFJePqxTL14RGE
         /xhQElOkuEHdAOhZouL8175UpTD3oicC8OynIvzt9wQoOanByquYZtNQwKeeZ96K40aE
         6npKYCToisZ1fwXC8WUBoAQWawNFb2iJkDZk3Bm6hfLwoLkXY/rOU1I7ijmnqLd+1RvF
         5AHH97hJbepPrPShGUMGUqEpB7OUss6fKLXaYJcOvHoGe66J6sLDQIOstcN52akYlRol
         fs3SfTL8jmqcAiQFw8dZhSMPzFVwWNMUxr97rYiSdIwDre9hD8CeJ9uwqeGgrMiwe+5K
         JQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764835803; x=1765440603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kfat4wxdrTqwqAlZzuGd6mN1XCYqVm4+qO5sYRRuw5I=;
        b=eJlke72+QcxsC51AgfoLpWbMVTERu1DxFsxuicATywIxgnyz231PBAQkg/aHo/8JHX
         Mj+dRQ1UY8OX4sgw6s7ckOAVZ/TkPVgfI1ZQvbhMIhk7LHqxH8o4Xk6Y5s7aMWZB6nGo
         yH3KgQfF8uBH9pItOlALWeg49FFSIL9JK+rK/NdARPXn+dF39Ls0wQJsslE3KVvYsxHS
         zNzKvW4xt7QzAK/6jjSRi9CXU4eK7yO7A3SDUcbnRBjspBpJED29D6OU3VzmFq6/GtFR
         LvyJi7Oz197cbfLK/pZQ7AQtb5M8CdMM3/Ks9JFE0W75JzghznP5jE75ozhDlfu+hsRs
         g7TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGoRlJf56ZDs//DkxVE6i2i1kUQfkyHApv4TVddHR9Ncyd1D8Ui0tp4P1kyZzfoV+m9Y+Szm+VOM8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3PBb1uHfI8+3umX3p/Q7c3zT2cb5+qcFLSvIA41dTgTMb6z2F
	Wwfgo9ml6BWFfpjez6rVIChhu8w2vCJPB0QQ61EqraQdrFygiH2f3N/K
X-Gm-Gg: ASbGnct8DL8/jc42+hGvp7aV7tCbAWE6Q6XcjeNcVEhrUTnpxEVCwhyrMpj8MYQkezw
	c7Rlj+UPIcSypYzfwOiXUk9tlzPGS8fd6NZaDEgk7lFKr3KYUcgRHYXCjaJvWKAZAeJX/WjBlDE
	IvcT7kdmeoOf0svtA3ajNuVs6n7ONwQDOB1SZjkV5jDjrJe57xbpLw6zCuGWIoG7MatOUhMRTDJ
	2GYDcoM7q0mguGsoc0va/MUMcTzukTMU/a877gn6TepWz1fs8Tvd5459ff+GW3DNKn83/CxH1gz
	NY/kLc5h3/bHQIzvjO3FDBb4rYUxI67CJjcp5+aXjH9k6Lh3QYgqN2uRh+XnMLzidJgyp28yqqO
	COOuktoSWrTetPKg8vKMsyC+ihsoYv63+CzDwKz3yPnchl7BeKHvSRgjVxBHKY82TeEusdDs18c
	NuEgdTZIQ1dscJP6+Vt3017rGqkBqs4AMfgmD/RnGg43l7K8j1Vf5WLPFSASvS8Unrbmn2ioEmz
	e0PSvQrdu3p
X-Google-Smtp-Source: AGHT+IG+OyvU4M/3UQERDLSeBuC3m74mpdJx5BtG3weZS/A1YOeNdP2eT9VfOGbkHnFfmNmqhaCJhw==
X-Received: by 2002:a05:6000:24c1:b0:42b:41d3:daf1 with SMTP id ffacd0b85a97d-42f731a5cc7mr5535776f8f.38.1764835803075;
        Thu, 04 Dec 2025 00:10:03 -0800 (PST)
Message-ID: <123abeae-cd91-492a-b9e3-3b6bfde0503e@gmail.com>
Date: Thu, 4 Dec 2025 09:10:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/dom0less: Increase guest DTB size for high-vCPU
 guests
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20251202193246.3357821-1-oleksandr_tyshchenko@epam.com>
 <98e9f551-cd8f-4c0c-aa79-144466e68df0@epam.com>
 <a1443030-f594-4f25-b12a-37974eae64d2@epam.com>
 <291a2d7c-f9fa-4c36-bfd5-5706ebea3e2e@gmail.com>
 <66282501-ac91-4d00-89e4-8d3765786219@epam.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <66282501-ac91-4d00-89e4-8d3765786219@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Oleksandr,

On 12/3/25 3:05 PM, Oleksandr Tyshchenko wrote:
>
> On 03.12.25 15:36, Oleksii Kurochko wrote:
>
>
>> On 12/3/25 12:03 PM, Oleksandr Tyshchenko wrote:
>>> On 02.12.25 23:33, Grygorii Strashko wrote:
>>>> On 02.12.25 21:32, Oleksandr Tyshchenko wrote:
>>>>> Creating a guest with a high vCPU count (e.g., >32) fails because
>>>>> the guest's device tree buffer (DOMU_DTB_SIZE) overflows during
>>>>> creation.
>>>>> The FDT nodes for each vCPU quickly exhaust the 4KiB buffer,
>>>>> causing a guest creation failure.
>>>>>
>>>>> Increase the buffer size to 16KiB to support guests up to
>>>>> the MAX_VIRT_CPUS limit (128).
>>>>>
>>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>> ---
>>>>> Noticed when testing the boundary conditions for dom0less guest
>>>>> creation on Arm64.
>>>>>
>>>>> Domain configuration:
>>>>> fdt mknod /chosen domU0
>>>>> fdt set /chosen/domU0 compatible "xen,domain"
>>>>> fdt set /chosen/domU0 \#address-cells <0x2>
>>>>> fdt set /chosen/domU0 \#size-cells <0x2>
>>>>> fdt set /chosen/domU0 memory <0x0 0x10000 >
>>>>> fdt set /chosen/domU0 cpus <33>
>>>>> fdt set /chosen/domU0 vpl011
>>>>> fdt mknod /chosen/domU0 module@40400000
>>>>> fdt set /chosen/domU0/module@40400000 compatible  "multiboot,kernel"
>>>>> "multiboot,module"
>>>>> fdt set /chosen/domU0/module@40400000 reg <0x0 0x40400000 0x0 0x16000 >
>>>>> fdt set /chosen/domU0/module@40400000 bootargs "console=ttyAMA0"
>>>>>
>>>>> Failure log:
>>>>> (XEN) Xen dom0less mode detected
>>>>> (XEN) *** LOADING DOMU cpus=33 memory=0x10000KB ***
>>>>> (XEN) Loading d1 kernel from boot module @ 0000000040400000
>>>>> (XEN) Allocating mappings totalling 64MB for d1:
>>>>> (XEN) d1 BANK[0] 0x00000040000000-0x00000044000000 (64MB)
>>>>> (XEN) Device tree generation failed (-22).
>>>>> (XEN)
>>>>> (XEN) ****************************************
>>>>> (XEN) Panic on CPU 0:
>>>>> (XEN) Could not set up domain domU0 (rc = -22)
>>>>> (XEN) ****************************************
>>>>> ---
>>>>> ---
>>>>>     xen/common/device-tree/dom0less-build.c | 8 +++++---
>>>>>     1 file changed, 5 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/
>>>>> device-tree/dom0less-build.c
>>>>> index 3f5b987ed8..d7d0a47b97 100644
>>>>> --- a/xen/common/device-tree/dom0less-build.c
>>>>> +++ b/xen/common/device-tree/dom0less-build.c
>>>>> @@ -461,10 +461,12 @@ static int __init
>>>>> domain_handle_dtb_boot_module(struct domain *d,
>>>>>     /*
>>>>>      * The max size for DT is 2MB. However, the generated DT is small
>>>>> (not including
>>>>> - * domU passthrough DT nodes whose size we account separately), 4KB
>>>>> are enough
>>>>> - * for now, but we might have to increase it in the future.
>>>>> + * domU passthrough DT nodes whose size we account separately). The
>>>>> size is
>>>>> + * primarily driven by the number of vCPU nodes. The previous 4KiB
>>>>> buffer was
>>>>> + * insufficient for guests with high vCPU counts, so it has been
>>>>> increased
>>>>> + * to support up to the MAX_VIRT_CPUS limit (128).
>>>>>      */
>>>>> -#define DOMU_DTB_SIZE 4096
>>>>> +#define DOMU_DTB_SIZE (4096 * 4)
>>>> May be It wants Kconfig?
>>>> Or some formula which accounts MAX_VIRT_CPUS?
>>> I agree that using a formula that accounts for MAX_VIRT_CPUS is the most
>>> robust approach.
>> One option could be to detect the size at runtime, essentially, try to
>> allocate
>> it, and if an error occurs, increase the fdtsize and try again. I don’t
>> really
>> like this approach, but I wanted to mention it in case someone finds it
>> useful.
>> The benefit of this approach is that if, in the future, something else such
>> as a CPU node contributes to the final FDT size, we won’t need to update
>> the
>> formula again.
> I got your point and understand the goal, but I see the following
> concerns with that:
>
> 1. Xen has to do all the work to build the device tree, fail, throw all
> that work away, and then start over again. This wastes time during the
> system's boot-up process.
>
> 2. Boot-time code should be as deterministic and predictable as
> possible. A static, worst-case calculation is highly predictable,
> whereas a retry loop is not.
>
> 3. It adds logical complexity (error handling, looping, size increments)
> to what should be a straightforward setup step.

Yes, I totally agree with all your concerns, so lets just go with a formula
approach.

Thanks.

~ Oleksii


