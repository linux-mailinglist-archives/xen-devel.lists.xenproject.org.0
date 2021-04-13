Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD4435E3A7
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 18:18:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109975.209910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWLj8-0003r4-QT; Tue, 13 Apr 2021 16:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109975.209910; Tue, 13 Apr 2021 16:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWLj8-0003qf-NH; Tue, 13 Apr 2021 16:17:22 +0000
Received: by outflank-mailman (input) for mailman id 109975;
 Tue, 13 Apr 2021 16:17:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lWLj7-0003qa-QS
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 16:17:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWLj7-0007Sx-9S; Tue, 13 Apr 2021 16:17:21 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWLj7-00070i-1s; Tue, 13 Apr 2021 16:17:21 +0000
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
	bh=GkceW10k83A2HTyah+YJ6/nafU0HIMcdaI/31a8rfIQ=; b=zGirWaOox1shZkh1wOaMVUf3mG
	9o4wmv1pADtEtQ+64izPMHlS31FmpPOU+NwkD1fw+Q5qPXUOe/npzQuGHzoH6GMUcHoFPjmO61sVs
	jq211oqoJJ0ImjsbH7ySCHc2PCvMwJmXv7rg/sifJJ5qOHQM29hABkMiO96cmAEOksho=;
Subject: Re: [xen-unstable bisection] complete test-armhf-armhf-xl-multivcpu
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org,
 osstest service owner <osstest-admin@xenproject.org>
References: <E1lVPaB-0007ue-Ho@osstest.test-lab.xenproject.org>
 <b7800c49-8106-e2cc-2fa3-9682305f333f@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <867e0bc1-ba0d-771a-0cfd-1e83fad431aa@xen.org>
Date: Tue, 13 Apr 2021 17:17:19 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <b7800c49-8106-e2cc-2fa3-9682305f333f@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 12/04/2021 09:53, Jan Beulich wrote:
> On 11.04.2021 04:12, osstest service owner wrote:
>> branch xen-unstable
>> xenbranch xen-unstable
>> job test-armhf-armhf-xl-multivcpu
>> testid guest-start/debian.repeat
>>
>> Tree: linux git://xenbits.xen.org/linux-pvops.git
>> Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
>> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
>> Tree: xen git://xenbits.xen.org/xen.git
>>
>> *** Found and reproduced problem changeset ***
>>
>>    Bug is in tree:  xen git://xenbits.xen.org/xen.git
>>    Bug introduced:  9617d5f9c19d1d157629e1e436791509526e0ce5
>>    Bug not present: 5c3c410bd2ea8d2cc520e8e8f83ad143c9c5cff7
>>    Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/160931/
>>
>>
>>    commit 9617d5f9c19d1d157629e1e436791509526e0ce5
>>    Author: Julien Grall <jgrall@amazon.com>
>>    Date:   Sat Feb 20 17:54:13 2021 +0000
>>    
>>        xen/arm: mm: flush_page_to_ram() only need to clean to PoC
>>        
>>        At the moment, flush_page_to_ram() is both cleaning and invalidate to
>>        PoC the page.
>>        
>>        The goal of flush_page_to_ram() is to prevent corruption when the guest
>>        has disabled the cache (the cache line may be dirty) and the guest to
>>        read previous content.
>>        
>>        Per this definition, the invalidating the line is not necessary. So
>>        invalidating the cache is unnecessary. In fact, it may be counter-
>>        productive as the line may be (speculatively) accessed a bit after.
>>        So this will incurr an expensive access to the memory.
>>        
>>        More generally, we should avoid interferring too much with cache.
>>        Therefore, flush_page_to_ram() is updated to only clean to PoC the page.
>>        
>>        The performance impact of this change will depend on your
>>        workload/processor.
>>        
>>        Signed-off-by: Julien Grall <jgrall@amazon.com>
>>        Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>        Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Is it possible that other code (guest one in particular considering the
> failure pattern, but possibly not limited to that) has developed a
> dependency on the prior behavior?

This is not a problem in the guest. I overlooked that 
flush_page_to_ram() is also used when emulating the instruction to 
invalidate by set/way the data cache.

We would need to tell flush_page_to_ram() which type of operation we 
want to do. I will not have time to work on it right now, so I have 
reverted the patch to unblock OssTest.

Sorry for the breakage.

Cheers,

-- 
Julien Grall

