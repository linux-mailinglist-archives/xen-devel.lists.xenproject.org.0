Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DA0588913
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 11:08:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379678.613330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJAMU-00043t-It; Wed, 03 Aug 2022 09:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379678.613330; Wed, 03 Aug 2022 09:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJAMU-000411-GA; Wed, 03 Aug 2022 09:08:18 +0000
Received: by outflank-mailman (input) for mailman id 379678;
 Wed, 03 Aug 2022 09:08:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oJAMT-00040u-7G
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 09:08:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJAMS-00047M-Ny; Wed, 03 Aug 2022 09:08:16 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[192.168.5.217]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJAMS-0000id-HO; Wed, 03 Aug 2022 09:08:16 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=omntIGbRmalpCHa0iV7OEFUIIbYk4pjArzDVUV0HWxo=; b=Es+Gxx6qUMI2yHD2ByYtEcGgK8
	eH+wZ8H+tu5rRBtzkJ/uskI0a0p2QJulvWSl+5e3dAxrJ+oSH240VjFWO2XxeBtb1TAcDf0+98079
	li4atO1sYPqiJwe3g0vZcR+l2NGaVoDGRXPYp1CVAEjcughctikLqsRKm3oKfcSlkZGQ=;
Message-ID: <4a05282b-cb5b-5004-6d1f-40db208c4057@xen.org>
Date: Wed, 3 Aug 2022 10:08:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH v2] arm/vgic-v3: fix virq offset in the rank when storing
 irouter
Content-Language: en-US
From: Julien Grall <julien@xen.org>
To: Hongda Deng <Hongda.Deng@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei.Chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220729083602.390484-1-Hongda.Deng@arm.com>
 <f3d19d31-6e91-44c6-5233-9cc8ecc569f2@xen.org>
In-Reply-To: <f3d19d31-6e91-44c6-5233-9cc8ecc569f2@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 03/08/2022 09:19, Julien Grall wrote:
> Hi Hongda,
> 
> On 29/07/2022 09:36, Hongda Deng wrote:
>> When vGIC performs irouter registers emulation, to get the target vCPU
>> via virq conveniently, Xen doesn't store the irouter value directly,
>> instead it will use the value (affinities) in irouter to calculate the
>> target vCPU, and then save the target vCPU in irq rank->vcpu[offset].
>>
>> When vGIC tries to get the target vCPU, it first calculates the target
>> vCPU index via
>>    int target = read_atomic(&rank->vcpu[virq & INTERRUPT_RANK_MASK]);
>> and then it gets the target vCPU via
>>    v->domain->vcpu[target];
>>
>> When vGIC tries to store irouter for one virq, the target vCPU index
>> in the rank is computed as
>>    offset &= virq & INTERRUPT_RANK_MASK;
>> finally it gets the target vCPU via
>>    d->vcpu[read_atomic(&rank->vcpu[offset])];
>>
>> There is a difference between them while getting the target vCPU index
>> in the rank. Actually (virq & INTERRUPT_RANK_MASK) would already get
>> the target vCPU index in the rank, it's wrong to add '&' before '=' when
>> calculate the offset.
>>
>> For example, the target vCPU index in the rank should be 6 for virq 38,
>> but vGIC will get offset=0 when vGIC stores the irouter for this virq,
>> and finally vGIC will access the wrong target vCPU index in the rank
>> when updating the irouter.
>>
>> Fixes: 5d495f4349b5 ("xen/arm: vgic: Optimize the way to store the 
>> target vCPU in the rank")
>> Signed-off-by: Hongda Deng <Hongda.Deng@arm.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Committed.

Cheers,

-- 
Julien Grall

