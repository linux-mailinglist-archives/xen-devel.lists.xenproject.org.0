Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D16752A64
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 20:41:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563363.880574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qK1FQ-00021q-DE; Thu, 13 Jul 2023 18:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563363.880574; Thu, 13 Jul 2023 18:41:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qK1FQ-0001zT-Ah; Thu, 13 Jul 2023 18:41:04 +0000
Received: by outflank-mailman (input) for mailman id 563363;
 Thu, 13 Jul 2023 18:41:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qK1FO-0001zN-RJ
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 18:41:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qK1FO-0000w6-0z; Thu, 13 Jul 2023 18:41:02 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.30.214]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qK1FN-0005op-Qe; Thu, 13 Jul 2023 18:41:01 +0000
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
	bh=PNx4BVssbsyDXauQTngh3Z4kDcMyVs7xLKtpnHVEigs=; b=rO57tju/9DHJeoEjryuuo+92Wd
	j4EdY68681TzlE7VXyNADjl3VDsoKMs6ROpblhhJfUK+pkHVuHY7aKlohUd0SumxnuWaGFYf7yHRx
	D1qhfuAqCqPbPfBxieateIYbYSf4k93N8KT163q2ePbp6qvsWawt4RAaM9wTZQOsUxFU=;
Message-ID: <041323d2-9114-328f-40c6-f5fed60892a5@xen.org>
Date: Thu, 13 Jul 2023 19:40:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/3] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig
 option
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>
References: <20230707014754.51333-1-stewart.hildebrand@amd.com>
 <20230707014754.51333-2-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230707014754.51333-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stewart,

On 07/07/2023 02:47, Stewart Hildebrand wrote:
> From: Rahul Singh <rahul.singh@arm.com>
> 
> Setting CONFIG_PCI_PASSTHROUGH=y will enable PCI passthrough on ARM, even though
> the feature is not yet complete in the current upstream codebase. The purpose of
> this is to make it easier to enable the necessary configs (HAS_PCI, HAS_VPCI) for
> testing and development of PCI passthrough on ARM.
> 
> Since PCI passthrough on ARM is still work in progress at this time, make it
> depend on EXPERT.

While preparing the patch for committing, I noticed that HAS_PASSTHROUGH 
will now allow the user to select one of the IOMMU quarantine options.

There are three of them right now:
   1. none
   2. basic (i.e. faulting)
   3. scratch page

The latter is unlikely to work on Arm because we don't setup the scratch 
page. AFAIU, for that, we would need to implement the callback 
quarantine_init().

I would expect 1 and 2 work. That said, I think 1. would behave like 2. 
because on Arm the device should not be automatically re-assigned to 
dom0. I know this is correct for platform device, but will it be valid 
for PCI as well?

Overall, before enabling HAS_PASSTHROUGH, I think there would be a bit 
of tweaking necessary to at least prevent a user to select the option 3 
(either via Kconfig or the command line). And possibly update the 
Kconfig for IOMMU_QUARANTINE to reflect the behavior on Arm.

Cheers,

-- 
Julien Grall

