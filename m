Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDEF6F579E
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 14:10:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529153.823240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puBJQ-0001sN-I1; Wed, 03 May 2023 12:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529153.823240; Wed, 03 May 2023 12:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puBJQ-0001pe-Eu; Wed, 03 May 2023 12:10:24 +0000
Received: by outflank-mailman (input) for mailman id 529153;
 Wed, 03 May 2023 12:10:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1puBJO-0001pW-NZ
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 12:10:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puBJO-0001N1-CA; Wed, 03 May 2023 12:10:22 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.7.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puBJO-0001X6-4p; Wed, 03 May 2023 12:10:22 +0000
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
	bh=f7n7K79rPqQ1unoFM74/iUlmR416DinXE/L8aH1BDmk=; b=wqsPYl/4KfSVkhHHQyLI1hqz5c
	W4NrsUCCwxnE488PD8tS9/DjMEGznZoGesCUYIuKUn1ve+JUaflgoFC40cNQvyA82PplzWIKsjU0/
	NXpNjfmZi1o8EUWXVuzBjkkYsYouKF0t7cc7/Lo5i1PN7A6gcjMGZozSQXMDHeT+d7G4=;
Message-ID: <9735d546-4869-2847-db5c-411c489faea1@xen.org>
Date: Wed, 3 May 2023 13:10:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [XEN v6 10/12] xen/arm: domain_build: Check if the address fits
 the range of physical address
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
 <20230428175543.11902-11-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230428175543.11902-11-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28/04/2023 18:55, Ayan Kumar Halder wrote:
> handle_pci_range() and map_range_to_domain() take addr and len as uint64_t
> parameters. Then frame numbers are obtained from addr and len by right shifting
> with PAGE_SHIFT. The frame numbers are expressed using unsigned long.
> 
> Now if 64-bit >> PAGE_SHIFT, the result will have 52-bits as valid. On a 32-bit
> system, 'unsigned long' is 32-bits. Thus, there is a potential loss of value
> when the result is stored as 'unsigned long'.
> 
> To mitigate this issue, we check if the starting and end address can be
> contained within the range of physical address supported on the system. If not,
> then an appropriate error is returned.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

