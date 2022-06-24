Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9AE559FAE
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 19:29:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355780.583652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4n6x-00047U-Hk; Fri, 24 Jun 2022 17:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355780.583652; Fri, 24 Jun 2022 17:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4n6x-00045g-Dl; Fri, 24 Jun 2022 17:28:51 +0000
Received: by outflank-mailman (input) for mailman id 355780;
 Fri, 24 Jun 2022 17:28:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4n6v-00045a-9J
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 17:28:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4n6t-0003pU-AV; Fri, 24 Jun 2022 17:28:47 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.4.76])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4n6t-0002r3-4v; Fri, 24 Jun 2022 17:28:47 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=Ndb0oprtCRhf+y5+7akjUInJJBj9HPbzJezBpH9A4dw=; b=E96T9SdzHxvQFeDvYvIA+JzBrU
	2Bwwz2PnhjjxIUUDFOaq60qWrO73u+XWQp7VZFNsabETyeFjBkwxd3eah82nRTWVLNJJjVWmuY29n
	l/vV0vM+RbSzHHODPcKk8z9wzpiM/qwwXSx+aJbPWqe0PDrbBR01wr7curXxTd8Vkr9s=;
Message-ID: <7689497b-1977-b30a-5835-587fa266c721@xen.org>
Date: Fri, 24 Jun 2022 18:28:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: Reg. Tee init fail...
To: "SK, SivaSangeetha (Siva Sangeetha)" <SivaSangeetha.SK@amd.com>
References: <DM4PR12MB5200C7C38770E07B5946424A80B49@DM4PR12MB5200.namprd12.prod.outlook.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DM4PR12MB5200C7C38770E07B5946424A80B49@DM4PR12MB5200.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

(moving the discussion to xen-devel as I think it is more appropriate)

On 24/06/2022 10:53, SK, SivaSangeetha (Siva Sangeetha) wrote:
> [AMD Official Use Only - General]

Not clear what this means.

> 
> Hi Xen team,
> 
> In TEE driver, We allocate a ring buffer, get its physical address from __pa() macro, pass the physical address to secure processor for mapping it and using in secure processor side.
> 
> Source: https://elixir.bootlin.com/linux/latest/source/drivers/crypto/ccp/tee-dev.c#L132
> 
> This works good natively in Dom0 on the target.
> When we boot the same Dom0 kernel, with Xen hypervisor enabled, ring init fails.

Do you have any error message or error code?

> 
> 
> We suspect that the address passed to secure processor, is not same when xen is enabled, and when xen is enabled, some level of address translation might be required to get exact physical address.

If you are using Xen upstream, Dom0 will be mapped with IPA == PA. So 
there should be no need for translation.

Can you provide more details on your setup (version of Xen, Linux...)?

Cheers,

-- 
Julien Grall

