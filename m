Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D67E622C09C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 10:23:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jysz0-0001Pl-85; Fri, 24 Jul 2020 08:23:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5T8C=BD=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jysyz-0001Pg-7p
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 08:23:09 +0000
X-Inumbo-ID: e7b37022-cd86-11ea-87e3-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7b37022-cd86-11ea-87e3-bc764e2007e4;
 Fri, 24 Jul 2020 08:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=67gnAVfj5c5wLITd427kJl9QyzcDZeQx+7iKWLhruVA=; b=6Yw2Uwodf207aY8e8gIPeAPaN/
 GGGxmQ7MzGYqbE7TfXCELxw1rJ88JycjBDmMopBFs09F973WHPXCLAPkZDatVn1HlE7dtivPdcGzI
 ILM7O8GHDMqP7JXfhY03xTlT6u9I/V82VuF7MjJBHmS4z9uH409T9PmE10Zd0eLD1lX4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jysyx-0002GU-D3; Fri, 24 Jul 2020 08:23:07 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jysyx-0005Ks-63; Fri, 24 Jul 2020 08:23:07 +0000
Subject: Re: [RFC PATCH v1 1/4] arm/pci: PCI setup and PCI host bridge
 discovery within XEN on ARM.
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
References: <cover.1595511416.git.rahul.singh@arm.com>
 <64ebd4ef614b36a5844c52426a4a6a4a23b1f087.1595511416.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <756d7979-0ebf-b9a4-72bd-18782762f7da@xen.org>
Date: Fri, 24 Jul 2020 09:23:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <64ebd4ef614b36a5844c52426a4a6a4a23b1f087.1595511416.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: nd@arm.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Bertrand.Marquis@arm.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Rahul,

On 23/07/2020 16:40, Rahul Singh wrote:
> XEN during boot will read the PCI device tree node “reg” property
> and will map the PCI config space to the XEN memory.
> 
> XEN will read the “linux, pci-domain” property from the device tree
> node and configure the host bridge segment number accordingly.
> 
> As of now "pci-host-ecam-generic" compatible board is supported.
> 
> Change-Id: If32f7748b7dc89dd37114dc502943222a2a36c49
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>   xen/arch/arm/Kconfig                |   7 +
>   xen/arch/arm/Makefile               |   1 +
>   xen/arch/arm/pci/Makefile           |   4 +
>   xen/arch/arm/pci/pci-access.c       | 101 ++++++++++++++
>   xen/arch/arm/pci/pci-host-common.c  | 198 ++++++++++++++++++++++++++++
>   xen/arch/arm/pci/pci-host-generic.c | 131 ++++++++++++++++++
>   xen/arch/arm/pci/pci.c              | 112 ++++++++++++++++
>   xen/arch/arm/setup.c                |   2 +
>   xen/include/asm-arm/device.h        |   7 +-
>   xen/include/asm-arm/pci.h           |  97 +++++++++++++-
>   10 files changed, 654 insertions(+), 6 deletions(-)

As a general comment, I would suggest to split the patch in smaller 
chunk. This would help the review and also allow to provide more 
explanation on what is done.

For instance, I think it is possible to a split looking like:
     - Add framework to access an hostbridge
     - Add support for ECAM
     - Add code to initialize the PCI subsystem

There is also some small fixes in this code that probably can move in 
there own patches.

Cheers,

-- 
Julien Grall

