Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5929BC9F283
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 14:37:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176789.1501255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQn2T-0005Z7-4w; Wed, 03 Dec 2025 13:37:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176789.1501255; Wed, 03 Dec 2025 13:37:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQn2T-0005Xs-1b; Wed, 03 Dec 2025 13:37:01 +0000
Received: by outflank-mailman (input) for mailman id 1176789;
 Wed, 03 Dec 2025 13:36:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mi53=6J=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vQn2R-0005Xk-A3
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 13:36:59 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23c50b63-d04d-11f0-9d1a-b5c5bf9af7f9;
 Wed, 03 Dec 2025 14:36:58 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4779a4fc95aso6790575e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Dec 2025 05:36:58 -0800 (PST)
Received: from [10.188.153.1] (cust-east-par-46-193-78-210.cust.wifirst.net.
 [46.193.78.210]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f6ffa18ffsm8659858f8f.5.2025.12.03.05.36.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Dec 2025 05:36:56 -0800 (PST)
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
X-Inumbo-ID: 23c50b63-d04d-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764769017; x=1765373817; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AveSLccaTYPYn21bzC3+zll33l8dwPO6jD/UJYury4U=;
        b=TSrRngM48EgAlFhwXa0y1oD56w+7zs65rQsJxtnuRjfE10tnVSe85b1fptzkzOV1/J
         00nfmrnii3bwPCpF4YglenpCl+e/WFZG8OKE3mq7uvOOqjw55TWMK7HQ69kEtQ72ZIVM
         qwuO8XmsGxvUE5SoWCs7R+fOssm+giLyFO/b7zLNOfVgsUFkSmsk4MGCT3hwuD5WpvFN
         JGXgD0v2XEwjvtNdsI4V0GmFXxDmd1SIVsdchqgqkBEtcVQjOUTGZ/K89MMlo/Ngl0Gm
         N+F0S2S0SnsET4p6W9RNDAjF9rbQ0aEQFi83i8vaY2b5VeWiS5shiOdE8ppBaoKwTtvt
         LX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764769017; x=1765373817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AveSLccaTYPYn21bzC3+zll33l8dwPO6jD/UJYury4U=;
        b=qg4y6C1XjlmWQ85wbfRL6F5oJRcE2AZOkVlUAKKHRu6O8ZSP2yjpqSs0TflvvzX8rI
         jwQd9HEyyNeer9XXungIhUb0QhHCjTW4xdQpXEeiP52ZoDSNmX5HJDb5npNYp32Df1CN
         Au3UCxwPKFcs9jpxa9Nh1bD6ZYzEbNN8+sRNDh9LDy8KDaGIK5fbNk8lf6/Re/ZKykdh
         qUwWK7yVgIvrK5J79FNk5qs6AsqaitFeXYqckqQmxmC+SYsJEgRL5JU/zlUX0gyX4zcj
         ypC0l9KUFJVLDI5FfaA5DLMrwMvE1ERf2U1UJZzL+nQ8zDYcFs/qM6zet79Z3Dr++OSK
         dVgA==
X-Forwarded-Encrypted: i=1; AJvYcCXrgOOA8wjwLtWHdhVbUtPorLSdm+mSdzaEfWdW4DQiPIKIplF1TOMl7EyGXaQBsaFF8G22n8BYphw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKX+eTMTMjW5oiuXBdPAWPYxtGnNITYE7M5iwdaLRdyn4VtFdY
	dkT3cS3LWAqa5QM2HSdcO0PQ4DMRffufbXR24ACwiKP2QFQkEXZBiiiI
X-Gm-Gg: ASbGnctvT9J8PjGBwmIWyc/Zt369cjVsV7f5bdzHGRA16wcnZNEK1/Wi0AD0P1H0/TJ
	Y5C3UTEf5TrOJj2nk0vPUAhUabJNkbakg8z4CwPVCOkcmxtr1lrpFPo26pN9zyaZSrjYRMpwJf8
	CLK1lDkpfE+4c/L5cUquDempG0a09aWr8TsyEUENjqjLktYIGs5NJ5BlOYaMrIVoSk9jyHLrtvd
	3mnnmaz+Xzwcqj9DvXgwzhzwNj6mrjvIQIeQq5quX8Rg2jHgLuxDaIysgHqmyoTwFXDsdyBNTM5
	tbGGnMHIJ0/w7Dh2Atnl29o+omAJAuL1h4vkzmB87+/ykCoAR3BPceNPrF78spUPjEsLd8v9F23
	Qlf6kwlY0NPKsucIwx4FtBKCbUq3bYxG3nVFCNGi/hHLQmr5ORLjZSU0ZGUMubxP79yvD/kZtq+
	pbec70Tmrk2i7s/l5l0ZpO2cs4hqKqQOU7xZl8uTDRuFtgNnBPvUYGcA/Qr2AD78cVsHFn675Ll
	g==
X-Google-Smtp-Source: AGHT+IHD+VLT6T8HxpQ9CM5M4n6GyrEHnCDxVkbUcN2C7rFdcI10soWv/62KyWmCQAYKKMP87pU+7A==
X-Received: by 2002:a05:600c:4507:b0:479:2a78:4a2e with SMTP id 5b1f17b1804b1-4792aeefe08mr28368165e9.7.1764769017218;
        Wed, 03 Dec 2025 05:36:57 -0800 (PST)
Message-ID: <291a2d7c-f9fa-4c36-bfd5-5706ebea3e2e@gmail.com>
Date: Wed, 3 Dec 2025 14:36:55 +0100
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a1443030-f594-4f25-b12a-37974eae64d2@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Oleksandr,

On 12/3/25 12:03 PM, Oleksandr Tyshchenko wrote:
> On 02.12.25 23:33, Grygorii Strashko wrote:
>>
>> On 02.12.25 21:32, Oleksandr Tyshchenko wrote:
>>> Creating a guest with a high vCPU count (e.g., >32) fails because
>>> the guest's device tree buffer (DOMU_DTB_SIZE) overflows during creation.
>>> The FDT nodes for each vCPU quickly exhaust the 4KiB buffer,
>>> causing a guest creation failure.
>>>
>>> Increase the buffer size to 16KiB to support guests up to
>>> the MAX_VIRT_CPUS limit (128).
>>>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> ---
>>> Noticed when testing the boundary conditions for dom0less guest
>>> creation on Arm64.
>>>
>>> Domain configuration:
>>> fdt mknod /chosen domU0
>>> fdt set /chosen/domU0 compatible "xen,domain"
>>> fdt set /chosen/domU0 \#address-cells <0x2>
>>> fdt set /chosen/domU0 \#size-cells <0x2>
>>> fdt set /chosen/domU0 memory <0x0 0x10000 >
>>> fdt set /chosen/domU0 cpus <33>
>>> fdt set /chosen/domU0 vpl011
>>> fdt mknod /chosen/domU0 module@40400000
>>> fdt set /chosen/domU0/module@40400000 compatible  "multiboot,kernel"
>>> "multiboot,module"
>>> fdt set /chosen/domU0/module@40400000 reg <0x0 0x40400000 0x0 0x16000 >
>>> fdt set /chosen/domU0/module@40400000 bootargs "console=ttyAMA0"
>>>
>>> Failure log:
>>> (XEN) Xen dom0less mode detected
>>> (XEN) *** LOADING DOMU cpus=33 memory=0x10000KB ***
>>> (XEN) Loading d1 kernel from boot module @ 0000000040400000
>>> (XEN) Allocating mappings totalling 64MB for d1:
>>> (XEN) d1 BANK[0] 0x00000040000000-0x00000044000000 (64MB)
>>> (XEN) Device tree generation failed (-22).
>>> (XEN)
>>> (XEN) ****************************************
>>> (XEN) Panic on CPU 0:
>>> (XEN) Could not set up domain domU0 (rc = -22)
>>> (XEN) ****************************************
>>> ---
>>> ---
>>>    xen/common/device-tree/dom0less-build.c | 8 +++++---
>>>    1 file changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/
>>> device-tree/dom0less-build.c
>>> index 3f5b987ed8..d7d0a47b97 100644
>>> --- a/xen/common/device-tree/dom0less-build.c
>>> +++ b/xen/common/device-tree/dom0less-build.c
>>> @@ -461,10 +461,12 @@ static int __init
>>> domain_handle_dtb_boot_module(struct domain *d,
>>>    /*
>>>     * The max size for DT is 2MB. However, the generated DT is small
>>> (not including
>>> - * domU passthrough DT nodes whose size we account separately), 4KB
>>> are enough
>>> - * for now, but we might have to increase it in the future.
>>> + * domU passthrough DT nodes whose size we account separately). The
>>> size is
>>> + * primarily driven by the number of vCPU nodes. The previous 4KiB
>>> buffer was
>>> + * insufficient for guests with high vCPU counts, so it has been
>>> increased
>>> + * to support up to the MAX_VIRT_CPUS limit (128).
>>>     */
>>> -#define DOMU_DTB_SIZE 4096
>>> +#define DOMU_DTB_SIZE (4096 * 4)
>> May be It wants Kconfig?
>> Or some formula which accounts MAX_VIRT_CPUS?
>
> I agree that using a formula that accounts for MAX_VIRT_CPUS is the most
> robust approach.

One option could be to detect the size at runtime, essentially, try to allocate
it, and if an error occurs, increase the fdtsize and try again. I don’t really
like this approach, but I wanted to mention it in case someone finds it useful.
The benefit of this approach is that if, in the future, something else such
as a CPU node contributes to the final FDT size, we won’t need to update the
formula again.

>
> Here is the empirical data (by testing with the maximum number of device
> tree nodes (e.g., hypervisor and reserved-memory nodes) and enabling all
> optional CPU properties (e.g., clock-frequency)):
>
> cpus=1
> (XEN) Final compacted FDT size is: 1586 bytes
>
> cpus=2
> (XEN) Final compacted FDT size is: 1698 bytes
>
> cpus=32
> (XEN) Final compacted FDT size is: 5058 bytes
>
> cpus=128
> (XEN) Final compacted FDT size is: 15810 bytes
>
>
> static int __init prepare_dtb_domU(struct domain *d, struct kernel_info
> *kinfo)
>    {
>        int addrcells, sizecells;
> @@ -569,6 +569,8 @@ static int __init prepare_dtb_domU(struct domain *d,
> struct kernel_info *kinfo)
>        if ( ret < 0 )
>            goto err;
>
> +    printk("Final compacted FDT size is: %d bytes\n",
> fdt_totalsize(kinfo->fdt));
> +
>        return 0;
>
>      err:
>
> This data shows (assuming my testing/calculations are correct):
>
> - A marginal cost of 112 bytes per vCPU in the final, compacted device tree.
> - A fixed base size of 1474 bytes for all non-vCPU content.
>
> Based on that I would propose the following formula with the justification:
>
> /*
>    * The size is calculated from a fixed baseline plus a scalable
>    * portion for each potential vCPU node up to the system limit
>    * (MAX_VIRT_CPUS), as the vCPU nodes are the primary consumer
>    * of space.
>    *
>    * The baseline of 2KiB is a safe buffer for all non-vCPU FDT
>    * content. The 128 bytes per vCPU is derived from a worst-case
>    * analysis of the FDT construction-time size for a single
>    * vCPU node.
>    */
> #define DOMU_DTB_SIZE (2048 + (MAX_VIRT_CPUS * 128))
>
> **********************************************
>
> Please tell me would you be happy with that?

I would also like to note that we probably want to add a BUILD_BUG_ON() check
to ensure that DOMU_DTB_SIZE is not larger than SZ_2M. Otherwise, we would get
a runtime error instead of a build-time failure, since there is code that limits
fdtsize to SZ_2M:

     /* Cap to max DT size if needed */
     fdt_size = min(fdt_size, SZ_2M);

Thanks.

~ Oleksii


