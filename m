Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 821B044D76A
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 14:42:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224764.388250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlAKz-0004Bu-2r; Thu, 11 Nov 2021 13:41:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224764.388250; Thu, 11 Nov 2021 13:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlAKy-00049c-VT; Thu, 11 Nov 2021 13:41:56 +0000
Received: by outflank-mailman (input) for mailman id 224764;
 Thu, 11 Nov 2021 13:41:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mlAKx-00049W-AB
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 13:41:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mlAKu-0006EF-JL; Thu, 11 Nov 2021 13:41:52 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.21.213]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mlAKu-00014p-D0; Thu, 11 Nov 2021 13:41:52 +0000
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
	bh=QiK97p+//Hl2Wx4Kr+vsjA4nvHaDHimZkzDXMSEOOKg=; b=Pb/h//JtRAbva/5sqlffX/Uvls
	NjN/wBSNFi7nTSGnv0y5+UnrkFm18TCP29heGFcV8Z4KBg762y0QHLhycjlKHX4P2qa97fUKfCCjq
	nlyxRq0lflzjMpyCPx9cXlc0MGvFnH6yn49vpCq3StJF1E1xecaSmL6Y4NoZzJIycEQc=;
Message-ID: <62d96c46-fa37-438d-1099-34290c52232b@xen.org>
Date: Thu, 11 Nov 2021 13:41:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH v3] xen/arm: don't assign domU static-mem to dom0 as
 reserved-memory
To: Ian Jackson <iwj@xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Penny.Zheng@arm.com,
 Bertrand.Marquis@arm.com, Wei.Chen@arm.com, Volodymyr_Babchuk@epam.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20211110201812.934306-1-sstabellini@kernel.org>
 <34d14ad2-3af6-1624-f30d-12f53f8ffdfb@xen.org>
 <24973.7073.267980.897378@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <24973.7073.267980.897378@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ian,

On 11/11/2021 13:33, Ian Jackson wrote:
> Julien Grall writes ("Re: [PATCH v3] xen/arm: don't assign domU static-mem to dom0 as reserved-memory"):
>> Hi Stefano,
>>
>> On 10/11/2021 20:18, Stefano Stabellini wrote:
>>> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>>
>>> DomUs static-mem ranges are added to the reserved_mem array for
>>> accounting, but they shouldn't be assigned to dom0 as the other regular
>>> reserved-memory ranges in device tree.
>>>
>>> In make_memory_nodes, fix the error by skipping banks with xen_domain
>>> set to true in the reserved-memory array. Also make sure to use the
>>> first valid (!xen_domain) start address for the memory node name.
>>>
>>> Fixes: 41c031ff437b ("xen/arm: introduce domain on Static Allocation")
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
>>
>> Reviewed-by: Julien Grall <jgrall@amazon.com>
> 
> FTAOD: I don't see a for-4.16 tag here.  So I think this is targeted
> for post-4.16 ?  But I wonder if it ought to be considered.  I don't
> understand the impact of the bug that is being fixed here.

The first version of the patch [1] was tagged with for-4.16 and contains 
the rationale.

I was thinking to commit it because it already contains your 
release-acked-by. Can you let me know if it still stands?

Cheers,

[1] 
https://lore.kernel.org/xen-devel/24970.20802.96908.223297@mariner.uk.xensource.com/T/#m058f2d243f6670ef48e77f40c25ac0115f0dae74

> 
> Thanks,
> Ian.
> 

-- 
Julien Grall

