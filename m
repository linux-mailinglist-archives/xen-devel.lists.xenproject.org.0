Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF5F5FEA69
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 10:22:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422552.668646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojFxU-0004Fs-Fg; Fri, 14 Oct 2022 08:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422552.668646; Fri, 14 Oct 2022 08:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojFxU-0004D8-Cu; Fri, 14 Oct 2022 08:22:20 +0000
Received: by outflank-mailman (input) for mailman id 422552;
 Fri, 14 Oct 2022 08:22:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ojFxT-0004D2-A7
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 08:22:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ojFxQ-0004F0-7e; Fri, 14 Oct 2022 08:22:16 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.21.194]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ojFxP-0008FO-UC; Fri, 14 Oct 2022 08:22:16 +0000
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
	bh=Nzd/rJw4tROs083lJjBEgOt4IXOzidyElLr1agx4fUc=; b=k2kqJC5w3prWlY1xlbG47tejTH
	6t2mPwOYVe2RShh59j+cJtaC4ODpBkDiNFsS9wxCOLuXr+J7nq0rQpae8xuB4RYUrLM+ZQ3o2tYYG
	PfsXGMvZctAiRA2BcWNiBSTjvusy+3VC16JR8m2YX5gpjGKQwcUaitYtz3EP7YWgbvXU=;
Message-ID: <5f985e76-e817-5d44-3463-ffc0a98c407c@xen.org>
Date: Fri, 14 Oct 2022 09:22:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH] xen/arm: mark handle_linux_pci_domain() __init
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
References: <20221014025354.30248-1-stewart.hildebrand@amd.com>
 <0ade954c-5741-754c-fc59-177feb67ddf4@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0ade954c-5741-754c-fc59-177feb67ddf4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/10/2022 08:16, Jan Beulich wrote:
> On 14.10.2022 04:53, Stewart Hildebrand wrote:
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> I guess a non-empty description and a Fixes: tag would be nice.

+1. I am actually quite interested to understand how this was spotted.

The build system should check that any function/data in domain_build.c 
are part of the __init section. So I guess the compiler you are using 
doesn't inline the function?

If so, I am actually surprised you are the first one spotted this... We 
are building on various distribution without any issues (?). I would be 
interested to know the compiler version and maybe we could add it in the 
CI.

Cheers,

-- 
Julien Grall

