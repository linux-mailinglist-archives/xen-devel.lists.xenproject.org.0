Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A737CF580
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 12:43:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619160.963772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQUF-00072h-RZ; Thu, 19 Oct 2023 10:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619160.963772; Thu, 19 Oct 2023 10:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQUF-00070a-P1; Thu, 19 Oct 2023 10:42:43 +0000
Received: by outflank-mailman (input) for mailman id 619160;
 Thu, 19 Oct 2023 10:42:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qtQUE-00070U-Ko
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 10:42:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtQUC-0004XU-IS; Thu, 19 Oct 2023 10:42:40 +0000
Received: from [15.248.3.1] (helo=[10.24.67.33])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtQUC-0007CB-AO; Thu, 19 Oct 2023 10:42:40 +0000
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
	bh=N4qcqYJGHacde6of26e8ytX9+Tz/Y0wDSLy1tpexaKE=; b=3uPUmjyO3SXdfGEMF4qGRWTeRr
	Vk5yuzs/Zqf1D8s+oZfMoIuBhKPw8s/GMqNCqsykOHCNMZrmDjLreXEXgjmJ79Nkyfe93Vs1VskZu
	H7Fk1B4az8WwLPzEcxvsJO+W9VTdn5XQYePwapaiUC6ilQ3x2JRKUcrYX4rK7qVdedF4=;
Message-ID: <9ee7b3c9-de71-4790-815c-8b2859a85465@xen.org>
Date: Thu, 19 Oct 2023 11:42:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/29] xen/asm-generic: introduce stub header device.h
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <3cc9ecc3abcd21c5ed7276b01bf5963e6a5fd5e0.1694702259.git.oleksii.kurochko@gmail.com>
 <a20f5783-7ee3-6ed1-d4cf-379c30c64a12@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a20f5783-7ee3-6ed1-d4cf-379c30c64a12@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/10/2023 10:14, Jan Beulich wrote:
> On 14.09.2023 16:56, Oleksii Kurochko wrote:
>> --- /dev/null
>> +++ b/xen/include/asm-generic/device.h
>> @@ -0,0 +1,65 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef __ASM_GENERIC_DEVICE_H__
>> +#define __ASM_GENERIC_DEVICE_H__
>> +
>> +struct dt_device_node;
>> +
>> +enum device_type
>> +{
>> +    DEV_DT,
>> +    DEV_PCI,
>> +};
> 
> Are both of these really generic?

I think can be re-used for RISC-V to have an abstract view a device. 
This is for instance used in the IOMMU code where both PCI and platform 
(here called DT) can be assigned to a domain. The driver will need to 
know the difference, but the common layer doesn't need to.

>> +struct device {
>> +    enum device_type type;
>> +#ifdef CONFIG_HAS_DEVICE_TREE
>> +    struct dt_device_node *of_node; /* Used by drivers imported from Linux */
>> +#endif
>> +};
>> +
>> +enum device_class
>> +{
>> +    DEVICE_SERIAL,
>> +    DEVICE_IOMMU,
>> +    DEVICE_GIC,
> 
> This one certainly is Arm-specific.

This could be renamed to DEVICE_IC (or INTERRUPT_CONTROLLER)

> 
>> +    DEVICE_PCI_HOSTBRIDGE,
> 
> And this one's PCI-specific.

Are you suggesting to #ifdef it? If so, I don't exactly see the value here.

> 
> Overall same question as before: Are you expecting that RISC-V is going to
> get away without a customized header? I wouldn't think so.

I think it can be useful. Most likely you will have multiple drivers for 
a class and you may want to initialize certain device class early than 
others. See how it is used in device_init().

Cheers,

-- 
Julien Grall

