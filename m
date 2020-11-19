Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C00C2B9823
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 17:40:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31153.61415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfmzC-0004IG-GD; Thu, 19 Nov 2020 16:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31153.61415; Thu, 19 Nov 2020 16:40:42 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfmzC-0004Hm-Cj; Thu, 19 Nov 2020 16:40:42 +0000
Received: by outflank-mailman (input) for mailman id 31153;
 Thu, 19 Nov 2020 16:40:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfmzA-0004Hh-P9
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:40:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfmz9-0000Is-1N; Thu, 19 Nov 2020 16:40:39 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfmz8-00036f-Nn; Thu, 19 Nov 2020 16:40:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfmzA-0004Hh-P9
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Siu+kiN1q+xZWaEI+EZxnH3bFP7l5kBVOzbq2GMdbxk=; b=CkZ0vEmHdc00niKoMHyeFy9TQH
	hEiI9h5/oS/e4c1EW7IYVHj+FWBerKzl3yw+hFrTEy4lQjcne3Zpn+rpoaEiS/+ZCoEAi7K9h2EzW
	hHEHJfsVPqBWuNPugsiukpgBwtuU5MSyy6lnT8sxMpdGvNFb8d1NFnRNhOhsCNUZsth8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfmz9-0000Is-1N; Thu, 19 Nov 2020 16:40:39 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfmz8-00036f-Nn; Thu, 19 Nov 2020 16:40:38 +0000
Subject: Re: [PATCH] xen/iommu: vtd: Fix undefined behavior pci_vtd_quirks()
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, Kevin Tian <kevin.tian@intel.com>
References: <20201119145216.29280-1-julien@xen.org>
 <16b256f5-1ceb-c12f-ff7b-9c6f1a5cc3cb@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <12223d32-c1da-2b6e-1193-93b6ca113953@xen.org>
Date: Thu, 19 Nov 2020 16:40:37 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <16b256f5-1ceb-c12f-ff7b-9c6f1a5cc3cb@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 19/11/2020 16:38, Andrew Cooper wrote:
> On 19/11/2020 14:52, Julien Grall wrote:
>> Note that splat is from 4.11.4 and not staging. Although, the problem is
>> still present.
>>
>> This can be solved by making the first operand unsigned int.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> CR: https://code.amazon.com/reviews/CR-38873112
> 
> IIRC, this is an internal link, which doesn't want including on the
> upstream commit?

Yes. I forgot to sanitize commit message when sending it.

I will remove it while committing unless there is a need to send a new 
version.

Cheers,

-- 
Julien Grall

