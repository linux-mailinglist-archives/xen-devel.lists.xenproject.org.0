Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF8031D828
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 12:25:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86216.161682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCKxY-0004RF-Qt; Wed, 17 Feb 2021 11:25:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86216.161682; Wed, 17 Feb 2021 11:25:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCKxY-0004Qq-NM; Wed, 17 Feb 2021 11:25:32 +0000
Received: by outflank-mailman (input) for mailman id 86216;
 Wed, 17 Feb 2021 11:25:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lCKxW-0004Ql-VX
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 11:25:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCKxU-0001cz-DY; Wed, 17 Feb 2021 11:25:28 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCKxU-0008G6-5t; Wed, 17 Feb 2021 11:25:28 +0000
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
	bh=BjARDfv67VUgnEkyeC9djvBnhG9dcZLvDOnPv6Do+vA=; b=2PBiSKPTL9HefLyoDxwwlrbIah
	sNhgM6KBDxNcgkvH9wqLoHY1BfFGsWNm92/YGRjiDjme4QJraeKbh5eNQ97AR1H63r3Fe7yqY3+7d
	MFERpOwxr0Hg0sG1wZBt7AnZ1V0kfWXC0yO8KkuX+I4p222HsGPv3md8NdvwbHfTSJls=;
Subject: Re: [for-4.15][PATCH v2 2/5] xen/iommu: Check if the IOMMU was
 initialized before tearing down
To: paul@xen.org, xen-devel@lists.xenproject.org
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 'Julien Grall' <jgrall@amazon.com>, 'Jan Beulich' <jbeulich@suse.com>
References: <20210209152816.15792-1-julien@xen.org>
 <20210209152816.15792-3-julien@xen.org>
 <04f401d6ff21$3b167720$b1436560$@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <78eb9b66-6676-d7d8-d427-2f345c2673f5@xen.org>
Date: Wed, 17 Feb 2021 11:25:26 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <04f401d6ff21$3b167720$b1436560$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Paul,

On 09/02/2021 20:22, Paul Durrant wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 09 February 2021 15:28
>> To: xen-devel@lists.xenproject.org
>> Cc: hongyxia@amazon.co.uk; iwj@xenproject.org; Julien Grall <jgrall@amazon.com>; Jan Beulich
>> <jbeulich@suse.com>; Paul Durrant <paul@xen.org>
>> Subject: [for-4.15][PATCH v2 2/5] xen/iommu: Check if the IOMMU was initialized before tearing down
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> is_iommu_enabled() will return true even if the IOMMU has not been
>> initialized (e.g. the ops are not set).
>>
>> In the case of an early failure in arch_domain_init(), the function
>> iommu_destroy_domain() will be called even if the IOMMU is not
>> initialized.
>>
>> This will result to dereference the ops which will be NULL and an host
>> crash.
>>
>> Fix the issue by checking that ops has been set before accessing it.
>>
>> Fixes: 71e617a6b8f6 ("use is_iommu_enabled() where appropriate...")
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Paul Durrant <paul@xen.org>

Thanks! Ian gave his Release-Acked-by so I will commit this patch now.

Cheers,

-- 
Julien Grall

