Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 806AF7EC2C4
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 13:45:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633630.988663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3FH7-0000bK-9D; Wed, 15 Nov 2023 12:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633630.988663; Wed, 15 Nov 2023 12:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3FH7-0000Yk-6H; Wed, 15 Nov 2023 12:45:45 +0000
Received: by outflank-mailman (input) for mailman id 633630;
 Wed, 15 Nov 2023 12:45:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r3FH5-0000Ya-QG
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 12:45:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3FH5-0000XE-FQ; Wed, 15 Nov 2023 12:45:43 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3FH5-0003bg-9k; Wed, 15 Nov 2023 12:45:43 +0000
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
	bh=kUwTVv6zEwKQN3nfKbGHzcwRFgO9CS0FtdL4iqd2M8s=; b=O9KG5S83x20MAstwJtN8QVEALe
	sADYuGvixTzbOv9OVyQQEexpnNcZ4mDDkHD0OvmZjEVzyuE7wGx1HnMTvFRRPoWsivjq0DIQX+mtx
	kmzj01RCSJbTttsMu8UHXKywUmlXtJv/1A01oyck5cZUqvbjCxEI4O9LxRrJlbEF4blQ=;
Message-ID: <d290546d-ff44-40d8-aca1-e421bf045481@xen.org>
Date: Wed, 15 Nov 2023 12:45:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/6] xen/arm: Intercept vPCI config accesses and
 forward them to emulator
Content-Language: en-GB
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com>
 <20231115112611.3865905-6-Sergiy_Kibrik@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231115112611.3865905-6-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/11/2023 11:26, Sergiy Kibrik wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This is needed for supporting virtio-pci.
> 
> In case when the PCI Host bridge is emulated outside of Xen
> (IOREQ server), we need some mechanism to intercept config space
> accesses on Xen on Arm, and forward them to the emulator
> (for example, virtio backend) via IOREQ request.
> 
> Unlike x86, on Arm these accesses are MMIO, there is no CFC/CF8 method
> to detect which PCI device is targeted.
> 
> In order to not mix PCI passthrough with virtio-pci features we add
> one more region to cover the total configuration space for all possible
> host bridges which can serve virtio-pci devices for that guest.
> We expose one PCI host bridge per virtio backend domain.
I am a little confused. If you expose one PCI host bridge per virtio 
backend, then why can't the backend simply register the MMIO region and 
do the translation itself when it receives the read/write?

To me, it only makes sense for Xen to emulate the host bridge access if 
you plan to have one host bridge shared between multiple IOREQ domains 
or mix with PCI pasthrough.

 From my perspective, I don't expect we would have that many virtio PCI 
devices. So imposing a host bridge per device emulator will mean extra 
resource in the guest as well (they need to keep track of all the 
hostbridge).

So in the longer run, I think we want to allow mixing PCI passthrough 
and virtio-PCI (or really any emulated PCI because nothing here is 
virtio specific).

For now, your approach would be OK to enable virtio PCI on Xen. But I 
don't think there are any changes necessary in Xen other than reserving 
some MMIO regions/IRQ.

Cheers,

-- 
Julien Grall

