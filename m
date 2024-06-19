Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D734F90E9AA
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 13:37:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743667.1150600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJtd3-0000GF-GE; Wed, 19 Jun 2024 11:37:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743667.1150600; Wed, 19 Jun 2024 11:37:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJtd3-0000ED-DV; Wed, 19 Jun 2024 11:37:29 +0000
Received: by outflank-mailman (input) for mailman id 743667;
 Wed, 19 Jun 2024 11:37:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sJtd1-0000E7-Ua
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 11:37:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sJtcz-0001rP-8H; Wed, 19 Jun 2024 11:37:25 +0000
Received: from [15.248.3.90] (helo=[10.24.67.26])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sJtcy-0001i5-VN; Wed, 19 Jun 2024 11:37:25 +0000
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
	bh=KvT4XPGLOy9LcTkyKXD0mINhG2TBgfi8ASfYPerfDss=; b=MwiBrOXYZvHufb0BVM9sT2A6RC
	wgdaS2DziV8rcS5iIR4KJ0rz1MWJhKWiwkeYmQRyH1P/yMuzjKiMfsJOkzmeobs8RznQYA9vLk5XJ
	uHJQth2mevyzDVyLvsGWMDUHb4tbjgr8lm2o0ofEAVweMQRQLqmTQCHbJ5u6iE7iUqsw=;
Message-ID: <4213a7b9-b2f8-4e3d-a63a-e8b7b53fd642@xen.org>
Date: Wed, 19 Jun 2024 12:37:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] xen/arm: static-shmem: fix "gbase/pbase used
 uninitialized" build failure
Content-Language: en-GB
To: "Oleksii K." <oleksii.kurochko@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240619064652.18266-1-michal.orzel@amd.com>
 <8C571FCD-3EAF-40B5-8694-625880176F8B@arm.com>
 <691f0bebe10e09f8fb46d0816fa20c61a9d9d3aa.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <691f0bebe10e09f8fb46d0816fa20c61a9d9d3aa.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 19/06/2024 12:19, Oleksii K. wrote:
> Hi,
> On Wed, 2024-06-19 at 09:02 +0000, Bertrand Marquis wrote:
>> Hi,
>>
>> Adding Oleksii for Release ack.
>>
>> Cheers
>> Bertrand
>>
>>> On 19 Jun 2024, at 08:46, Michal Orzel <michal.orzel@amd.com>
>>> wrote:
>>>
>>> Building Xen with CONFIG_STATIC_SHM=y results in a build failure:
>>>
>>> arch/arm/static-shmem.c: In function 'process_shm':
>>> arch/arm/static-shmem.c:327:41: error: 'gbase' may be used
>>> uninitialized [-Werror=maybe-uninitialized]
>>>   327 |         if ( is_domain_direct_mapped(d) && (pbase != gbase)
>>> )
>>> arch/arm/static-shmem.c:305:17: note: 'gbase' was declared here
>>>   305 |         paddr_t gbase, pbase, psize;
>>>
>>> This is because the commit cb1ddafdc573 adds a check referencing
>>> gbase/pbase variables which were not yet assigned a value. Fix it.
>>>
>>> Fixes: cb1ddafdc573 ("xen/arm/static-shmem: Static-shmem should be
>>> direct-mapped for direct-mapped domains")
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

I have committed to unblock the CI. But I have some questions on the 
approach. I will ask them separately.

Cheers,

-- 
Julien Grall

