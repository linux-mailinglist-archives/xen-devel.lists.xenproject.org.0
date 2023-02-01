Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4EE686549
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 12:20:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488262.756277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNB9y-0005kH-Os; Wed, 01 Feb 2023 11:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488262.756277; Wed, 01 Feb 2023 11:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNB9y-0005gu-LU; Wed, 01 Feb 2023 11:20:14 +0000
Received: by outflank-mailman (input) for mailman id 488262;
 Wed, 01 Feb 2023 11:20:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pNB9w-0005go-M0
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 11:20:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pNB9w-0005dw-4C; Wed, 01 Feb 2023 11:20:12 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.6.251]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pNB9v-0000NU-SQ; Wed, 01 Feb 2023 11:20:12 +0000
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
	bh=hg8uX44vBfViCGrkaX0dzp9s2UNwI8RN/ZaXh1/ViiU=; b=vCgURObd3RJCpODVwCFeXAP7T2
	SOItSSSNUkRCZ4PcWZTvwQ4H/67tKQLy1sIBJhpEHEH6w4tttTQ34/fZAXoUxpiGw5ANzAxeCicZI
	/2N3v0G3ITWX6KbQBy4bKr0H0119OdHyM+K/Wk0l+l4gevkd7L16DrKMDx5J6CPxKDPg=;
Message-ID: <6d3638e0-5613-ee7b-d919-1db3cd0ca2fb@xen.org>
Date: Wed, 1 Feb 2023 11:20:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] xen/arm: Add support for booting gzip compressed
 uImages
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, ayankuma@amd.com
References: <20230131151354.25943-1-michal.orzel@amd.com>
 <20230131151354.25943-3-michal.orzel@amd.com>
 <653d05c1-a860-052c-4ce2-55998c77db42@xen.org>
 <442d7e6b-9b51-69bc-48ea-c844427a4a97@amd.com>
 <f45dfe55-ca51-7aa0-ef9a-2788cfead470@xen.org>
 <7c09b900-6568-e57d-3256-2cf72a73690c@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7c09b900-6568-e57d-3256-2cf72a73690c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/02/2023 11:01, Michal Orzel wrote:
> I would prefer not to do this in this series as the goals are different. This series is to remove
> the known Xen limitation.

The reason I am asking is it effectively change the way you would 
implement. If we were going to support zImage/Image within uImage, then 
we would need to fallthrough rather than calling kernel_decompress().

I am not aware of any at the moment. Better asking now than realizing 
after the fact that there is a need...

>>> This could be solved by doing (not harmful in my opinion for common case)
>>> addr &= PAGE_MASK.
>> I don't quite understand your argument here. We need a check that work
>> for everyone (not only in the common case).
> As we assume the kernel module is at page aligned address (otherwise the issue you observed
> can happen not only in uImage compressed case)

I am not aware of such assumption. It is allowed to use non page-aligned 
address and it is correct for Xen to not free the first part if it is 
not page aligned because the first part may contain data from another 
module (or else).

> , having a check like
> this is generic. I.e. for normal usecase (no uImage compressed), addr &= PAGE_MASK
> does not modify the address. For uImage compressed usecase it causes the addr to get
> back to the previous value (before we added header size to it).
> 
> Apart from the addr, we need to pass the correct size (as we extracted header size from it).
> We could have the following (with appropriate comment):
> size += addr - (addr & PAGE_MASK);
> addr &= PAGE_MASK;
> fw_unreserved_regions(addr, addr + size, init_domheap_pages, 0);
> 
> It does not look great but solves the uImage issue and does not modify
> the previous behavior. Anyway, I'm open for suggestions.

Two options:
  1) Move the call to fw_unreserved_regions() outside of 
kernel_decompress().
  2) Pass the offset of the gzip header to kernel_decompress(). 
Something like where it would be  sizeof(uimage) in the uImage case or 0 
otherwise.

I have a slight preference for the latter.

Cheers,

-- 
Julien Grall

