Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E03385ABBD
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 20:04:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683078.1062419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc8w3-0002ZX-JD; Mon, 19 Feb 2024 19:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683078.1062419; Mon, 19 Feb 2024 19:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc8w3-0002XD-FM; Mon, 19 Feb 2024 19:04:15 +0000
Received: by outflank-mailman (input) for mailman id 683078;
 Mon, 19 Feb 2024 19:04:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rc8w2-0002X7-KC
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 19:04:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rc8w1-0005RH-Qs; Mon, 19 Feb 2024 19:04:13 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rc8w1-000857-M2; Mon, 19 Feb 2024 19:04:13 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=7/1h3QI9c/Ilm0cIOGZSzexY92xMXTkud0URse3Hfv4=; b=fjAnMJx/Wa8cBfwf4CWq0ypWQu
	9fzrgpkkIn/yzh5wfoBNg8ZON9yyEdrJf2D2xLgmpz8F7WqLnQAZhB4ZsHbALqt7vHDrEnQTze4Wu
	TI/9Be9Ff307uLjIDiPsxm2dKSdHULOZuQsKeEJlY8fVMmnDLjNVA1I7AfIZhf16z2AA=;
Message-ID: <d5d5c3a0-94fc-45e8-9b1e-7b32bc648472@xen.org>
Date: Mon, 19 Feb 2024 19:04:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/7] xen/asm-generic: introduce generic device.h
Content-Language: en-GB
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1707499278.git.oleksii.kurochko@gmail.com>
 <4ecb5e5f4a1dbf585ac7a9ebe40b5fd8e4709182.1707499278.git.oleksii.kurochko@gmail.com>
 <319dcf7a-88cd-488e-ae51-6c20c19d8f22@xen.org>
 <9d4f3093de6f95b09e44bc66fe9a9d4b0009dc43.camel@gmail.com>
 <3171ef24-bcb3-4387-ba32-f1c4d6c7220a@xen.org>
 <9fe0221a4c093fb5935ff3a519f2ef7180e569e1.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9fe0221a4c093fb5935ff3a519f2ef7180e569e1.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksii,

On 15/02/2024 16:54, Oleksii wrote:
>>
>> On 14/02/2024 09:32, Oleksii wrote:
>>> On Tue, 2024-02-13 at 18:09 +0000, Julien Grall wrote:
>>>>> +#ifdef CONFIG_HAS_PASSTHROUGH
>>>>> +    struct iommu_fwspec *iommu_fwspec; /* per-device IOMMU
>>>>> instance data */
>>>>> +#endif
>>>>> +};
>>>>> +
>>>>> +typedef struct device device_t;
>>>>> +
>>>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>>>> +
>>>>> +#include <xen/device_tree.h>
>>>>> +
>>>>> +#define dev_is_dt(dev)  ((dev)->type == DEV_DT)
>>>>> +
>>>>> +/**
>>>>> + *  device_init - Initialize a device
>>>>> + *  @dev: device to initialize
>>>>> + *  @class: class of the device (serial, network...)
>>>>> + *  @data: specific data for initializing the device
>>>>> + *
>>>>> + *  Return 0 on success.
>>>>> + */
>>>>> +int device_init(struct dt_device_node *dev, enum device_class
>>>>> class,
>>>>> +                const void *data);
>>>>> +
>>>>> +/**
>>>>> + * device_get_type - Get the type of the device
>>>>> + * @dev: device to match
>>>>> + *
>>>>> + * Return the device type on success or DEVICE_ANY on failure
>>>>> + */
>>>>> +enum device_class device_get_class(const struct dt_device_node
>>>>> *dev);
>>>>> +
>>>>> +#define DT_DEVICE_START(name_, namestr_, class_)            \
>>>>> +static const struct device_desc __dev_desc_##name_ __used   \
>>>>> +__section(".dev.info") = {                                  \
>>>>> +    .name = namestr_,                                       \
>>>>> +    .class = class_,
>>>>> +
>>>>> +#define DT_DEVICE_END                                       \
>>>>> +};
>>>>> +
>>>>> +#else /* !CONFIG_HAS_DEVICE_TREE */
>>>>> +#define dev_is_dt(dev) ((void)(dev), false)
>>>>> +#endif /* CONFIG_HAS_DEVICE_TREE */
>>>>> +
>>>>> +#define dev_is_pci(dev) ((dev)->type == DEV_PCI)
>>>>> +
>>>>> +struct device_desc {
>>>>> +    /* Device name */
>>>>> +    const char *name;
>>>>> +    /* Device class */
>>>>> +    enum device_class class;
>>>>> +
>>>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>>>> +
>>>>> +    /* List of devices supported by this driver */
>>>>> +    const struct dt_device_match *dt_match;
>>>>> +    /*
>>>>> +     * Device initialization.
>>>>> +     *
>>>>> +     * -EAGAIN is used to indicate that device probing is
>>>>> deferred.
>>>>> +     */
>>>>> +    int (*init)(struct dt_device_node *dev, const void *data);
>>>>> +
>>>>> +#endif
>>>>> +};
>>>> I am not sure I fully understand why "device_desc" is not
>>>> protected
>>>> by
>>>> CONFIG_HAS_DEVICE_TREE. The structure doesn't mean much when the
>>>> config
>>>> is disabled. Can you clarify?
>>> I thought that one day struct device_desc and acpi_device_desc will
>>> be
>>> "merged", and so decided just to #ifdef only DEVICE_TREE specific
>>> fields.
>>
>> It might be possible to merge the two if we were using an union for
>> the
>> ACPI/DT specific part. However the majority of the parsing code needs
>> to
>> differ. So I am not convinced there would be any value to merge the
>> two
>> structures.
> In this case, let's have two separate structures.
> 
> This is not the current situation, and I don't have a specific example.
> It appears that all architectures will use Device Tree or ACPI.
> However, does it make sense to keep 'struct device_desc' more generic
> to accommodate non-DT or non-ACPI cases?

I am not entirely sure what else to say. As I wrote before yes it could 
be made generic. But right now I don't see any values.

If you have any idea how to share the structure. Then feel free to make 
a proposal and I will review it.

Cheers,

-- 
Julien Grall

