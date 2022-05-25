Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 355E15338D5
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 10:54:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337043.561519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntmmG-0006SW-Em; Wed, 25 May 2022 08:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337043.561519; Wed, 25 May 2022 08:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntmmG-0006Pq-Bo; Wed, 25 May 2022 08:54:00 +0000
Received: by outflank-mailman (input) for mailman id 337043;
 Wed, 25 May 2022 08:53:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ntmmF-0006Pk-Ki
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 08:53:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntmmF-0004Tu-Ca; Wed, 25 May 2022 08:53:59 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.21.168]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntmmF-0007B7-6L; Wed, 25 May 2022 08:53:59 +0000
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
	bh=WjHLldIN5NReoGm9OZ9ZGcfla+l9akKwDIiD4nEg/7M=; b=tPGw+YBr5ldfVwP2ZOXoGO2dDL
	eGLGtTOeNd4ooegAXyhMnXuUgnNNz2ZO4ALC1pw+w2XDnr5Wret4sdBhAX04YtTOxClNF1a9HXIrX
	CuFFWvWhMuKO3tuQWV6PUX8Ksxebc6MBd0VCPJv98cFXy6MpWFOyItO8Piw8wGjV4Cng=;
Message-ID: <7959ff38-53e3-761b-7792-0ea2526c51ff@xen.org>
Date: Wed, 25 May 2022 09:53:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] xen/iommu: dt: Check the return value of
 xsm_deassign_dtdevice()
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20220522165900.83104-1-julien@xen.org>
 <A7BBA491-2CF9-4D4B-A7C3-56AB004EF842@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <A7BBA491-2CF9-4D4B-A7C3-56AB004EF842@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/05/2022 08:54, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

>> On 22 May 2022, at 17:59, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> xsm_deasign_dtdevice() will indicate whether the caller is allowed
>> to issue the operation. So the return value has to be checked.
>>
>> Spotted by clang static analyzer.
>>
>> Fixes: fe36cccc483c ("xen/passthrough: Extend XEN_DOMCTL_*assign_device to support DT device")
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> With the typo spotted by Michal solved (can be done on commit):
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

I fixed the typo and committed.

Cheers,

-- 
Julien Grall

