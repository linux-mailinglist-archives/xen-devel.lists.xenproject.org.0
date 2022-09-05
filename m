Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8AF5AD7EA
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 18:55:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399074.640114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVFNo-0001Pm-7h; Mon, 05 Sep 2022 16:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399074.640114; Mon, 05 Sep 2022 16:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVFNo-0001NR-57; Mon, 05 Sep 2022 16:55:36 +0000
Received: by outflank-mailman (input) for mailman id 399074;
 Mon, 05 Sep 2022 16:55:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVFNm-0001NL-KA
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 16:55:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVFNk-0006ZH-Be; Mon, 05 Sep 2022 16:55:32 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.1.223]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVFNk-0005Vd-4k; Mon, 05 Sep 2022 16:55:32 +0000
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
	bh=IZIz7nSvvjZV4rHsQN7sIUnHqESWRU4aVKJmtcn/JyI=; b=NICKcLVuwg5ttEjUNb9Jn4ZKI9
	bPV3RWb/mLRik239mQ9mpLujDaT6ukHgXPaHA7Zja7BCFWJo3wNNWWGrAdezKXa2b9j1Y/xdB9EdE
	87rsSz1F7YraNau5KccWGhoNyoMi88qw4shh8hMUfqTG2oxKjqiEdNSID6TQRTkuvPr4=;
Message-ID: <5c0e3697-96cd-c4e5-4de0-a01d4d699c69@xen.org>
Date: Mon, 5 Sep 2022 17:55:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v3 03/10] xen/arm: smmuv3: Ensure queue is read after
 updating prod pointer
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Zhou Wang <wangzhou1@hisilicon.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Will Deacon <will@kernel.org>
References: <cover.1662394710.git.rahul.singh@arm.com>
 <bd55c05d7197b72cb4597c7412fc4911fa2281d1.1662394710.git.rahul.singh@arm.com>
 <885a4f6b-8350-229d-55da-4171eeafb800@xen.org>
 <41229BFA-D9F9-442D-92D2-67354897B5EA@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <41229BFA-D9F9-442D-92D2-67354897B5EA@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 05/09/2022 17:49, Rahul Singh wrote:
> Hi Julien,

Hi Rahul,

> 
>> On 5 Sep 2022, at 5:37 pm, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 05/09/2022 17:30, Rahul Singh wrote:
>>> From: Zhou Wang <wangzhou1@hisilicon.com>
>>> Backport Linux commit a76a37777f2c. Rename __iomb to iomb() while
>>> merging to get in sync with other Xen definitions.
>>> Reading the 'prod' MMIO register in order to determine whether or
>>> not there is valid data beyond 'cons' for a given queue does not
>>> provide sufficient dependency ordering, as the resulting access is
>>> address dependent only on 'cons' and can therefore be speculated
>>> ahead of time, potentially allowing stale data to be read by the
>>> CPU.
>>> Use readl() instead of readl_relaxed() when updating the shadow copy
>>> of the 'prod' pointer, so that all speculated memory reads from the
>>> corresponding queue can occur only from valid slots.
>>> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
>>> Link: https://lore.kernel.org/r/1601281922-117296-1-git-send-email-wangzhou1@hisilicon.com
>>> [will: Use readl() instead of explicit barrier. Update 'cons' side to match.]
>>> Signed-off-by: Will Deacon <will@kernel.org>
>>> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git a76a37777f2c
>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>> ---
>>> Changes in v3:
>>>   - rename __iomb() to iomb() and also move it from common file to
>>>     smmu-v3.c file
>>
>> Hmmm... Quoting Bertrand:
>>
>> "We need the __iomb as “linux compatibility” in fact so I would suggest for now to only introduce it at the beginning of smmu-v3.c with other linux compatibility stuff to prevent adding this to Xen overall."
>>
>> Which I also agreed. I couldn't a more recent conversation explaining your approach. Can you outline why you didn't follow the approached discussed?
>>    
> 
> I am really sorry that I missed the naming and when I made the patch in my mind there was a comment from Stefano to
> rename the __iomb() to iomb(). I will send only this patch after fixing or do you want me to send the whole series?

I would be fine if you only resend this patch.

Also, looking at the other patches, you added the Acked-by before your 
Signed-off-by. In general, the tags are ordered chronologically, so this 
should be inverted. I can deal with that on commit once Bertrand 
confirmed he is happy with the series.

Cheers,

-- 
Julien Grall

