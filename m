Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE67E73D117
	for <lists+xen-devel@lfdr.de>; Sun, 25 Jun 2023 14:56:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554791.866200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDPHz-0002Cd-Kl; Sun, 25 Jun 2023 12:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554791.866200; Sun, 25 Jun 2023 12:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDPHz-00029v-Gu; Sun, 25 Jun 2023 12:56:23 +0000
Received: by outflank-mailman (input) for mailman id 554791;
 Sun, 25 Jun 2023 12:56:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qDPHy-00029p-8A
 for xen-devel@lists.xenproject.org; Sun, 25 Jun 2023 12:56:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDPHx-0000LY-4Q; Sun, 25 Jun 2023 12:56:21 +0000
Received: from [193.85.242.128] (helo=[192.168.148.103])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDPHw-0003Us-UM; Sun, 25 Jun 2023 12:56:21 +0000
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
	bh=i2+K8s8xu/B9L7bB3ZnTifYLY1TrUM/wM998Nw8O3uE=; b=qmpxBv2/sORuxFh6DGMqiVN/2f
	ehZTuyKUqUZMQ+/izx5pV34uIxs4t4emFHgD32hvFEzzEP3BS0dKtDv6xtQ0SopZ1HKD/VYFJz7U7
	bohouh6dDDgYD1c+ZLfA60ZwME0jc3DW079z5g+HOq9/dIKmGSE5BTR1qvRTIqpldf1A=;
Message-ID: <5f0b5a38-710f-f820-1dc7-345ae16047ad@xen.org>
Date: Sun, 25 Jun 2023 13:56:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 0/7] SMMU handling for PCIe Passthrough on ARM
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20230607030220.22698-1-stewart.hildebrand@amd.com>
 <1f5aa53c-a9ed-41c3-2a4d-38538912cdd5@xen.org>
 <4b08b38e-3beb-6b72-83fb-6dd8c8702718@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4b08b38e-3beb-6b72-83fb-6dd8c8702718@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/06/2023 22:05, Stewart Hildebrand wrote:
> On 6/7/23 03:19, Julien Grall wrote:
>> On 07/06/2023 04:02, Stewart Hildebrand wrote:
>>> This series introduces SMMU handling for PCIe passthrough on ARM. These patches
>>> are independent from (and don't depend on) the vPCI reference counting/locking
>>> work in progress, and should be able to be upstreamed independently.
>>
>> Can you clarify how this code was tested? Does this require code not yet
>> upstreamed?
> 
> I'm testing the series standalone (+ config changes) by using a PCI device in dom0, and also in combination with the vPCI series [3] [4] for passthrough to a domU.
> 
> 
> Here are some more details on the test cases I'm using.

Thanks that's helpful! One comment about the first test case.

> 
> 
> 1. Using the PCI device in dom0 with the pci-passthrough=yes arg. In this case a couple of additional config changes [1] [2] are needed to select CONFIG_HAS_PCI=y, CONFIG_HAS_VPCI=y, and make has_vpci() return true. Aside from this series itself and the config changes, nothing else not-yet-upstreamed is required for this test case. It is on my TODO list to upstream these config changes, which I think will be useful on their own, not necessarily as part of any other series.

I find a bit confusing that the IOMMU support for dom0 is gated behind 
'pci-passthrough'. I was expecting that the iommu would also be properly 
configured for PCI if we using 'iommu=yes'.

Cheers,

-- 
Julien Grall

