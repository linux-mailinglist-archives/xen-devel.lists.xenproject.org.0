Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9189255A163
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 21:10:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355833.583752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4ohE-0003GV-0M; Fri, 24 Jun 2022 19:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355833.583752; Fri, 24 Jun 2022 19:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4ohD-0003Dx-Tj; Fri, 24 Jun 2022 19:10:23 +0000
Received: by outflank-mailman (input) for mailman id 355833;
 Fri, 24 Jun 2022 19:10:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4ohC-0003Dr-3U
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 19:10:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4ohB-0005m2-QP; Fri, 24 Jun 2022 19:10:21 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.4.76])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4ohB-0008HW-K3; Fri, 24 Jun 2022 19:10:21 +0000
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
	bh=q1f0OwZV0j2RYU6Cm6ogVRo1zLLGWLKZ6IO1I6ztJ8s=; b=g+NdlN7YenniLmUIFPIS3fmZH4
	GBcCO8j0d6ASEBeLZVYbhTq9G2IDZq696rlZihrN7zIGA/UFHSeaTgaXCU3wqVPj9rpTwG1eW/wMv
	oOfiFKoRxNMcP5bSyL/9bgH7RpXutg2F6FMWAvIgHe0qkL7yKo55IpunZ/H5HW+XXIU8=;
Message-ID: <e9c2f30b-a9fd-5ef4-b7b1-e8ff54c6175c@xen.org>
Date: Fri, 24 Jun 2022 20:10:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v5 4/8] xen/arm: introduce put_page_nr and get_page_nr
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220620051114.210118-1-Penny.Zheng@arm.com>
 <20220620051114.210118-5-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220620051114.210118-5-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 20/06/2022 06:11, Penny Zheng wrote:
> Later, we need to add the right amount of references, which should be
> the number of borrower domains, to the owner domain. Since we only have
> get_page() to increment the page reference by 1, a loop is needed per
> page, which is inefficient and time-consuming.
> 
> To save the loop time, this commit introduces a set of new helpers
> put_page_nr() and get_page_nr() to increment/drop the page reference by nr.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

