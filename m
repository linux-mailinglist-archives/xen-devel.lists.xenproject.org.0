Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0044546FD69
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 10:09:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243626.421463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvbuH-0008C4-6u; Fri, 10 Dec 2021 09:09:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243626.421463; Fri, 10 Dec 2021 09:09:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvbuH-00089x-3N; Fri, 10 Dec 2021 09:09:33 +0000
Received: by outflank-mailman (input) for mailman id 243626;
 Fri, 10 Dec 2021 09:09:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mvbuG-00089r-41
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 09:09:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mvbuF-0001k0-U0; Fri, 10 Dec 2021 09:09:31 +0000
Received: from [54.239.6.184] (helo=[192.168.9.67])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mvbuF-0001kj-Ns; Fri, 10 Dec 2021 09:09:31 +0000
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
	bh=XIPmTl0d5WI5yvmsZC68H9GM8X6AE8QmvYsZDuBAoEE=; b=DAsHt0iao8iLhh+rTn9mpAfBR+
	AlLZ/wBMxCdmwsRKyhB2ak8N1Pesu0q5DVqhjJHM6lzepefJrqh3NcuTpZgRMcoeoWoJ6sKYlGCax
	KdArgvFYGwopIskFjLPr2NI+KzYJahIpPds+HfgTUK074fsfdXfkzXCnbyUJKmLpOUdU=;
Message-ID: <669d3f56-13b8-f159-2053-b39f1ba4222f@xen.org>
Date: Fri, 10 Dec 2021 09:09:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH V4 6/6] dt-bindings: xen: Clarify "reg" purpose
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1639080336-26573-1-git-send-email-olekstysh@gmail.com>
 <1639080336-26573-7-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1639080336-26573-7-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 09/12/2021 20:05, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Xen on Arm has gained new support recently to calculate and report
> extended regions (unused address space) safe to use for external
> mappings. These regions are reported via "reg" property under
> "hypervisor" node in the guest device-tree. As region 0 is reserved
> for grant table space (always present), the indexes for extended
> regions are 1...N.
> 
> No device-tree bindings update is needed (except clarifying the text)
> as guest infers the presence of extended regions from the number
> of regions in "reg" property.
> 
> While at it, remove the following sentence:
> "This property is unnecessary when booting Dom0 using ACPI."
> for "reg" and "interrupts" properties as the initialization is not
> done via device-tree "hypervisor" node in that case anyway.
You sent a similar patch for Xen and have already commented there [1] . 
In short, the OS will be using the node to discover whether it is 
running on Xen for both ACPI and DT. The hypervisor node also contain 
the UEFI information for dom0.

Cheers,

[1] 
https://lore.kernel.org/xen-devel/9602b019-6c20-cdc7-23f3-9e4f8fd720f6@xen.org/T/#t

-- 
Julien Grall

