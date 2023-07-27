Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA6B765EF1
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 00:09:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571291.894795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP99r-0006hi-AB; Thu, 27 Jul 2023 22:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571291.894795; Thu, 27 Jul 2023 22:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP99r-0006f4-6k; Thu, 27 Jul 2023 22:08:31 +0000
Received: by outflank-mailman (input) for mailman id 571291;
 Thu, 27 Jul 2023 22:08:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qP99p-0006ey-TF
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 22:08:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qP99p-00016s-Jj; Thu, 27 Jul 2023 22:08:29 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qP99p-0003AR-DY; Thu, 27 Jul 2023 22:08:29 +0000
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
	bh=Ty1W4hT/Eg2ClQkGebCYdqEBnm1Aluw4dXTjpv0V1Hg=; b=FtOZw/t7P3OG0EHTXQWP0NKVu9
	aD4ykPcUTE/SQE6uikN7zAHqXPlJfue5vZ7wQdjy+45nopNaqHctyKS7zku5kHNtpyzVd/UYG8cTd
	zhVb8oxrZ/rf0EJKpMUtJ24Wsl8l1A2mEzGQNj2QTZNl2lGzHs3tiZ9++oClM5ZTP+AY=;
Message-ID: <258a6383-e6a9-c311-beb5-3284c812c50a@xen.org>
Date: Thu, 27 Jul 2023 23:08:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v2] xen/arm32: head: Widen the use of the temporary
 mapping
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 Henry Wang <Henry.Wang@arm.com>, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230724101458.79412-1-julien@xen.org>
 <AD86AD11-2FFC-4276-B0B4-F0E370F22EBC@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AD86AD11-2FFC-4276-B0B4-F0E370F22EBC@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 24/07/2023 18:15, Luca Fancellu wrote:
> 
> 
>> On 24 Jul 2023, at 11:14, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> At the moment, the temporary mapping is only used when the virtual
>> runtime region of Xen is clashing with the physical region.
>>
>> In follow-up patches, we will rework how secondary CPU bring-up works
>> and it will be convenient to use the fixmap area for accessing
>> the root page-table (it is per-cpu).
>>
>> Rework the code to use temporary mapping when the Xen physical address
>> is not overlapping with the temporary mapping.
>>
>> This also has the advantage to simplify the logic to identity map
>> Xen.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Hi Julien,
> 
> Seems good to me, I’ve also tested on qemu and FVP, creating/destroying guests and no issues so far.
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com>

Thanks. I have committed with Henry's tag. But I also realized that I 
forgot to strip the changelog :/.

Cheers,

-- 
Julien Grall

