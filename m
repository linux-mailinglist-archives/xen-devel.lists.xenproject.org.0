Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D237C000C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 17:12:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615094.956284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqEOR-0001AD-Q8; Tue, 10 Oct 2023 15:11:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615094.956284; Tue, 10 Oct 2023 15:11:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqEOR-00017d-N9; Tue, 10 Oct 2023 15:11:31 +0000
Received: by outflank-mailman (input) for mailman id 615094;
 Tue, 10 Oct 2023 15:11:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qqEOQ-000161-5y
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 15:11:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qqEOP-0004Oi-Sj; Tue, 10 Oct 2023 15:11:29 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[10.95.104.160]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qqEOP-0000fC-MO; Tue, 10 Oct 2023 15:11:29 +0000
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
	bh=4Obq61kJUFEKTX7z8R6Sb7CT6aqwi9qgd/DZcaOpdsk=; b=T/4MdGXKEQBvGB7oq2BTKSV8/Z
	Oaaut1IoXt1GfLvRCNP2iQG3+Xl5hOYZ/8YzOwo3iBmwubbaiHHpLjLutn3RgvuLFbSDo6a00l+hN
	OGT2jxeAScs/0ZRl9pPBZ03SwxZ2DfXVQfLgHddl+sk3xD8rrQ/r1s/G7hscZ9ikLRFo=;
Message-ID: <d4418f19-940f-4839-bcce-cbdad8d2ca81@xen.org>
Date: Tue, 10 Oct 2023 16:11:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/8] xen/arm: Split page table related code to mmu/pt.c
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <penny.zheng@arm.com>
References: <20231009010313.3668423-1-Henry.Wang@arm.com>
 <20231009010313.3668423-2-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231009010313.3668423-2-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 09/10/2023 02:03, Henry Wang wrote:
> The extraction of MMU related code is the basis of MPU support.
> This commit starts this work by firstly splitting the page table
> related code to mmu/pt.c, so that we will not end up with again
> massive mm.c files.
> 
> Introduce a mmu specific directory and setup the Makefiles for it.
> Move the page table related functions and macros from arch/arm/mm.c
> to arch/arm/mmu/pt.c.
> 
> Take the opportunity to fix the in-code comment coding styles when
> possible, and drop the unnecessary #include headers in the original
> arch/arm/mm.c.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

