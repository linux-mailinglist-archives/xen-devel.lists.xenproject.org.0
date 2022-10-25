Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C354D60CA26
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 12:32:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429746.680944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onHDX-0000SI-6g; Tue, 25 Oct 2022 10:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429746.680944; Tue, 25 Oct 2022 10:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onHDX-0000PE-3j; Tue, 25 Oct 2022 10:31:31 +0000
Received: by outflank-mailman (input) for mailman id 429746;
 Tue, 25 Oct 2022 10:31:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1onHDV-0000P8-5d
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 10:31:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1onHDU-0000d2-Mb; Tue, 25 Oct 2022 10:31:28 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[10.95.108.38])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1onHDU-0008Oy-Eb; Tue, 25 Oct 2022 10:31:28 +0000
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
	bh=eDvmERsrdkCPddUZ49r4L0o0AtvEp/zPiu9eiteNEEI=; b=VMHOAAzC1gl/agBd5eAvA2GaXf
	MppW3PkqVqZol6G12BzZgG77dVTXJL4TdyH1SLOtvf9twYPdRqA7C4C2/dQu9PFIVq/BHXPeVkykO
	8HH+4jLTUo9NqpJ1RQRnVSsdAmWoFE3GcUehY08NA44bbLX+2esC+qe2EQ6dZ9KrkN8c=;
Message-ID: <dffca6a6-3a7c-a8ea-b61e-a37011a7afb8@xen.org>
Date: Tue, 25 Oct 2022 11:31:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [RFC v2 01/12] xen/arm: Clean-up the memory layout
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: marco.solieri@minervasys.tech, lucmiccio@gmail.com,
 carlo.nonato@minervasys.tech, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221022150422.17707-1-julien@xen.org>
 <20221022150422.17707-2-julien@xen.org>
 <c5767718-bb00-da6b-8623-1bcb6c832f85@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c5767718-bb00-da6b-8623-1bcb6c832f85@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/10/2022 10:21, Michal Orzel wrote:
> Hi Julien,

Hi Michal,


> On 22/10/2022 17:04, Julien Grall wrote:
>>
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> In a follow-up patch, the base address for the common mappings will
>> vary between arm32 and arm64. To avoid any duplication, define
>> every mapping in the common region from the previous one.
> Maybe the following title would be better suited if you only want to touch the common mappings?
> "xen/arm: Clean-up the common memory layout"

Ok.

> 
>>
>> Take the opportunity to add missing *_SIZE for FIXMAP_VIRT_* and
>> XEN_VIRT_*.
>>
>> Take the opportunity to add missing *_SIZE for some mappings.
> I think this sentence can be removed as the previous one already covers it.

Yes. I will remove it.

> 
> Apart from that, wouldn't it be useful to do the cleanup for the arm32 macros
> as you are here (FRAMETABLE, VMAP, {XEN/DOM}HEAP) ?

Can you clarify? I looked at the macros and they look clean to me.

Cheers,

-- 
Julien Grall

