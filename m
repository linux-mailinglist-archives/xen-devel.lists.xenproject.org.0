Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6673B3FEA7
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 13:54:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106180.1456931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utPb7-0000vE-2d; Tue, 02 Sep 2025 11:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106180.1456931; Tue, 02 Sep 2025 11:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utPb6-0000rw-Vm; Tue, 02 Sep 2025 11:54:48 +0000
Received: by outflank-mailman (input) for mailman id 1106180;
 Tue, 02 Sep 2025 11:54:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1utPb5-0000ri-1o
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 11:54:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1utPb4-002rw5-1Z;
 Tue, 02 Sep 2025 11:54:46 +0000
Received: from [15.248.2.30] (helo=[10.24.67.22])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1utPb4-00D3V0-1S;
 Tue, 02 Sep 2025 11:54:46 +0000
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
	bh=2+jEwqycw1vDeXGQROS9+pQ2b06MUhzGIsuk6QT8jRI=; b=cE3VWr/thsd9iBTcZ51tQGAWW5
	Jk1qZtctAH6+liOqtCip/4oLV1pTd+3WYG9noJ+wVC1qkNzsWrx0pRDwg1pmSVIVfcYiLPGulFHC2
	KnB8gqU6Bw3w9ee4yV6eCAa8DoIXhIF3YUdQluaFrgZh3aUCxm2yDbYIQzFDShvnGUc8=;
Message-ID: <b2968b50-3ca6-416b-86d9-c809ef87c567@xen.org>
Date: Tue, 2 Sep 2025 12:54:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] xen/arm: dm: Drop XEN_DMOP_get_ioreq_server_info from
 supported
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250902094931.1733774-1-oleksandr_tyshchenko@epam.com>
 <319c280a-535d-498a-b0ab-93882663e23b@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <319c280a-535d-498a-b0ab-93882663e23b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/09/2025 11:18, Orzel, Michal wrote:
> 
> 
> On 02/09/2025 11:49, Oleksandr Tyshchenko wrote:
>> The said sub-op is not supported on Arm, since it:
>>   - does not support the buffered emulation (so bufioreq_port/bufioreq_gfn
>>     cannot be returned), please refer to ioreq_server_create()
>>   - does not support "legacy" mechanism of mapping IOREQ Server
>>     magic pages (so ioreq_gfn/bufioreq_gfn cannot be returned), please
>>     refer to arch_ioreq_server_map_pages(). On Arm, only the Acquire
>>     Resource infrastructure is used to query and map the IOREQ Server pages.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> Could we perhaps add a Fixes tag here pointing to the commit introducing these
> DM ops and thus add this patch for this release? Not sure what others think.

Fixes usually implies a bug and I don't see what bug we are solving. In 
fact, I don't understand why we are trying to remove the subop...

Cheers,

-- 
Julien Grall


