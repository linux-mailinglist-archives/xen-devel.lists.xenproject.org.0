Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F507606884
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 20:56:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427097.675935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olaiI-0007Vf-U3; Thu, 20 Oct 2022 18:56:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427097.675935; Thu, 20 Oct 2022 18:56:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olaiI-0007Tq-RH; Thu, 20 Oct 2022 18:56:18 +0000
Received: by outflank-mailman (input) for mailman id 427097;
 Thu, 20 Oct 2022 18:56:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1olaiH-0007Ta-Fd
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 18:56:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1olaiH-0006wF-7x; Thu, 20 Oct 2022 18:56:17 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1olaiH-0001Vx-2t; Thu, 20 Oct 2022 18:56:17 +0000
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
	bh=BsqcKR31UDH75rYIoEOEzJTiJkoyy/xdt4zh7gBfwlc=; b=pxpM4kjq7FEpncF+8WEF5D9FpJ
	K4tOKm/6h3cwBjdFhQkMkccgnDbszNPlmb9aHpyG0S9aDqisV5eIQ/J+Tb59tmpYHSNDCNtR+pXtK
	XxyALJocmUJwAp82ViMVScMdTcreEhfsrQKV34Fu+mNLQU78rUk0/nQ7TPYDvoGvKVDc=;
Message-ID: <921d5899-6ceb-ae0a-00d5-d708fd1dfff4@xen.org>
Date: Thu, 20 Oct 2022 19:56:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH v2] xen/arm: mark handle_linux_pci_domain() __init
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <20221014025354.30248-1-stewart.hildebrand@amd.com>
 <20221014200926.15250-1-stewart.hildebrand@amd.com>
 <fe6ac13f-70c4-8d15-20b5-a52ec88f394d@xen.org>
 <dda3b199-55ac-d557-b934-c070db8a371e@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <dda3b199-55ac-d557-b934-c070db8a371e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/10/2022 19:53, Stewart Hildebrand wrote:
> On 10/20/22 14:19, Julien Grall wrote:
>> Hi Stewart,
> 
> Hi Julien,
> 
>> I nearly missed this one because it was threaded under v1. In the
>> future, would you be able to send new version in a separate thread? This
>> makes easier to track it.
> 
> I will keep this in mind for next time.
> 
>> On 14/10/2022 21:09, Stewart Hildebrand wrote:
>>> All functions in domain_build.c should be marked __init. This was
>>> spotted when building the hypervisor with -Og.
>>>
>>> Fixes: 1050a7b91c xen/arm: add pci-domain for disabled devices
> 
> I missed parenthesis and quotes around the referenced commit. To keep it in the same format as other Fixes: tags, can you please add during commit (pending release ack)?

Will do.

Cheers,

-- 
Julien Grall

