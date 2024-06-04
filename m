Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F257D8FB124
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 13:30:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735362.1141549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sESMR-0000ZI-UG; Tue, 04 Jun 2024 11:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735362.1141549; Tue, 04 Jun 2024 11:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sESMR-0000XQ-Q1; Tue, 04 Jun 2024 11:29:51 +0000
Received: by outflank-mailman (input) for mailman id 735362;
 Tue, 04 Jun 2024 11:29:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sESMQ-0000XJ-G7
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 11:29:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sESMP-0000U8-Oy; Tue, 04 Jun 2024 11:29:49 +0000
Received: from [62.28.225.65] (helo=[172.20.145.71])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sESMP-0002hQ-H8; Tue, 04 Jun 2024 11:29:49 +0000
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
	bh=h4DzSjwu3DCXM+ZlOhs99zEoRyWLq8LtkDh0vhjNaxM=; b=bI4gPVfJH3j010QvDRvbQ4tkvZ
	srNzzhwgSrINxpd8RD3qxUC6bYCcS50MRAb2B3vd05PiUcMSBuhdFgXlu+gxVNb9TZVOk02J7/b0H
	QO7N3amYqEVCTtrfmRAZOtaV+VhN3bAolQZ8fgeV7BBkvjnpxzFD7p5BAkq+rJSp9IBs=;
Message-ID: <eb18d4d8-ede2-4529-92f1-3ba8a5beea72@xen.org>
Date: Tue, 4 Jun 2024 12:29:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4.2] xen/p2m: put reference for level 2 superpage
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240528125603.2467640-1-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240528125603.2467640-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 28/05/2024 13:56, Luca Fancellu wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> We are doing foreign memory mapping for static shared memory, and
> there is a great possibility that it could be super mapped.
> But today, p2m_put_l3_page could not handle superpages.
> 
> This commits implements a new function p2m_put_l2_superpage to handle
> level 2 superpages, specifically for helping put extra references for
> foreign superpages.
> 
> Modify relinquish_p2m_mapping as well to take into account preemption
> when we have a level-2 foreign mapping.
> 
> Currently level 1 superpages are not handled because Xen is not
> preemptible and therefore some work is needed to handle such superpages,
> for which at some point Xen might end up freeing memory and therefore
> for such a big mapping it could end up in a very long operation.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

