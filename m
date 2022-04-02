Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB184F04CC
	for <lists+xen-devel@lfdr.de>; Sat,  2 Apr 2022 18:18:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297822.507343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nagSE-0005uC-LX; Sat, 02 Apr 2022 16:18:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297822.507343; Sat, 02 Apr 2022 16:18:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nagSE-0005re-HI; Sat, 02 Apr 2022 16:18:22 +0000
Received: by outflank-mailman (input) for mailman id 297822;
 Sat, 02 Apr 2022 16:18:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nagSC-0005rY-Mo
 for xen-devel@lists.xenproject.org; Sat, 02 Apr 2022 16:18:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nagSC-0005VE-B3; Sat, 02 Apr 2022 16:18:20 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nagSC-0000Pn-5Z; Sat, 02 Apr 2022 16:18:20 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=W1SKoUxM25j38sJNlw9ZaiKjGIJole2qbduEv16CJW4=; b=e8SQaH+rfwLLHzBg7BZQCpmseK
	gIh9HfhMwPZB05XAtgdfduvZ+NiASx5t/3j+ya35dMS4zMHjsbBOqILR9Z1GiI0rCPP2SaoH0sJxK
	38vD7Wm731MZWBmsPT6nIGLnj+GTBNQt5ezGOMTAMFeBq9a1OUEXlcVBi5dmhWQri7+c=;
Message-ID: <3a164544-7760-1f57-1af6-c80020b604f0@xen.org>
Date: Sat, 2 Apr 2022 17:18:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-6-julien@xen.org>
 <alpine.DEB.2.22.394.2204011639430.2910984@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 05/19] xen/arm: mm: Add support for the contiguous bit
In-Reply-To: <alpine.DEB.2.22.394.2204011639430.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/04/2022 00:53, Stefano Stabellini wrote:
> On Mon, 21 Feb 2022, Julien Grall wrote:
>> @@ -1333,21 +1386,34 @@ static int xen_pt_update(unsigned long virt,
>>       while ( left )
>>       {
>>           unsigned int order, level;
>> +        unsigned int nr_contig;
>> +        unsigned int new_flags;
>>   
>>           level = xen_pt_mapping_level(vfn, mfn, left, flags);
>>           order = XEN_PT_LEVEL_ORDER(level);
>>   
>>           ASSERT(left >= BIT(order, UL));
>>   
>> -        rc = xen_pt_update_entry(root, pfn_to_paddr(vfn), mfn, level, flags);
>> -        if ( rc )
>> -            break;
>> +        /*
>> +         * Check if we can set the contiguous mapping and update the
>> +         * flags accordingly.
>> +         */
>> +        nr_contig = xen_pt_check_contig(vfn, mfn, level, left, flags);
>> +        new_flags = flags | ((nr_contig > 1) ? _PAGE_CONTIG : 0);
> 
> Here is an optional idea to make the code simpler. We could move the
> flags changes (adding/removing _PAGE_CONTIG) to xen_pt_check_contig.
> That way, we could remove the inner loop.
> 
> xen_pt_check_contig could check if _PAGE_CONTIG is already set and based
> on alignment, it should be able to figure out when it needs to be
> disabled.

My initial attempt was to do everything in a loop. But this didn't pan 
out as I wanted (I felt the code was complex) and there are extra work 
to be done for the next 31 entries (assuming 4KB granularity).

Hence the two loops. Unfortunately, I didn't keep my first attempt. So I 
can't realy show what I wrote.

Cheers,

-- 
Julien Grall

