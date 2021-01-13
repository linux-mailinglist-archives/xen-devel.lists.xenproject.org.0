Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A062F5169
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 18:50:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66653.118460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzkHv-0005VQ-64; Wed, 13 Jan 2021 17:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66653.118460; Wed, 13 Jan 2021 17:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzkHv-0005V1-2n; Wed, 13 Jan 2021 17:50:31 +0000
Received: by outflank-mailman (input) for mailman id 66653;
 Wed, 13 Jan 2021 17:50:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kzkHt-0005Uw-4M
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 17:50:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kzkHp-0001Ap-8L; Wed, 13 Jan 2021 17:50:25 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kzkHo-0002Qw-Vu; Wed, 13 Jan 2021 17:50:25 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=JJwkoRlWM8+jhQKIZUWe6pqo7HH31FbPvkPctXou4I4=; b=bZ4ipDhyLJhoyATEbPMx564224
	J6Ez4hrtj7gG/L9mTD3OZ5NyB/E5I8nTKwG094di0FH7554d7kFfEtdW28cUlIOYDoVT0LwqlCstk
	P2cGnykMV/GWR3CNRIXQIxHZWrA0cwNdHtlN1ettRJT7T7Fw5cQZR43Jz64NZPtOz548=;
Subject: Re: [PATCH] xen/iommu: smmu: Use 1UL << 31 rather than 1 << 31
To: Hans van Kranenburg <hans@knorrie.org>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Rahul.Singh@arm.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20201224152419.22453-1-julien@xen.org>
 <617a8755-1993-d46d-d1bf-2f518b5d4233@knorrie.org>
From: Julien Grall <julien@xen.org>
Message-ID: <c55fc2f5-e10a-638c-c16b-aa0056d29ad1@xen.org>
Date: Wed, 13 Jan 2021 17:50:23 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <617a8755-1993-d46d-d1bf-2f518b5d4233@knorrie.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Hans,

Sorry for the late reply.

On 24/12/2020 19:48, Hans van Kranenburg wrote:
> On 12/24/20 4:24 PM, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Replace all the use of 1 << 31 with 1UL << 31 to prevent undefined
>> behavior in the SMMU driver.
> 
> You're replacing it by 1U, not 1UL, in the patch below.

Thank you for pointing that out! Stefano fixed it on commit.

Cheers,

-- 
Julien Grall

