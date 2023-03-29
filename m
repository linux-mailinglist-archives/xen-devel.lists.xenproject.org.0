Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 220806CF520
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 23:21:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516393.800413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phdDS-00068F-7J; Wed, 29 Mar 2023 21:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516393.800413; Wed, 29 Mar 2023 21:20:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phdDS-00065R-3s; Wed, 29 Mar 2023 21:20:22 +0000
Received: by outflank-mailman (input) for mailman id 516393;
 Wed, 29 Mar 2023 21:20:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1phdDQ-00065L-AJ
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 21:20:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1phdDP-0008BC-VC; Wed, 29 Mar 2023 21:20:19 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.25.70]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1phdDP-0000Kk-OM; Wed, 29 Mar 2023 21:20:19 +0000
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
	bh=ni2JAoIlWKHwebBjXY6hHAj3TEw9oSh+J+Vg6nqPlqQ=; b=qkqZPotypGnClISdepx2dmkygy
	bEDYefqpNd1GLr/+sadfy4qj7ydkhpEFdt1MpstLgz6T4fDNI1eO47lb5FKMTbVx470D0hPTcttA0
	ZibBfeKheyjQLtYwJtbXfQkVJ2N7GoU0vCnrOuh/AGVTHMZ6+lWWAT/APL8T86YzPtQk=;
Message-ID: <80af90b9-ac51-3e16-8344-696cd5d46625@xen.org>
Date: Wed, 29 Mar 2023 22:20:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/2] xen/arm: vpl011: Fix domain_vpl011_init error path
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230323135636.25318-1-michal.orzel@amd.com>
 <20230323135636.25318-3-michal.orzel@amd.com>
 <97EBE93D-01BE-4DCE-8726-6D8066F79CA0@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <97EBE93D-01BE-4DCE-8726-6D8066F79CA0@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/03/2023 09:35, Luca Fancellu wrote:
> 
> 
>> On 23 Mar 2023, at 13:56, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> When vgic_reserve_virq() fails and backend is in domain, we should also
>> free the allocated event channel.
>>
>> When backend is in Xen and call to xzalloc() returns NULL, there is no
>> need to call xfree(). This should be done instead on an error path
>> from vgic_reserve_virq(). Moreover, we should be calling XFREE() to
>> prevent an extra free in domain_vpl011_deinit().
>>
>> In order not to repeat the same steps twice, call domain_vpl011_deinit()
>> on an error path whenever there is more work to do than returning rc.
>> Since this function can now be called from different places and more
>> than once, add proper guards, use XFREE() instead of xfree() and move
>> vgic_free_virq() to it.
>>
>> Take the opportunity to return -ENOMEM instead of -EINVAL when memory
>> allocation fails.
>>
>> Fixes: 1ee1e4b0d1ff ("xen/arm: Allow vpl011 to be used by DomU")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

And committed the series.

Cheers,

-- 
Julien Grall

