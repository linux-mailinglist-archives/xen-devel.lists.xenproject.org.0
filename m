Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B0F66DF82
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 14:54:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479413.743240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmOt-0008At-8F; Tue, 17 Jan 2023 13:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479413.743240; Tue, 17 Jan 2023 13:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmOt-00088E-4u; Tue, 17 Jan 2023 13:53:19 +0000
Received: by outflank-mailman (input) for mailman id 479413;
 Tue, 17 Jan 2023 13:53:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHmOr-000882-B7
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 13:53:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHmOr-00010h-4e; Tue, 17 Jan 2023 13:53:17 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.7.198]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHmOq-0007Oq-VO; Tue, 17 Jan 2023 13:53:17 +0000
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
	bh=PZK9h8f4B3/YhGgkEAQZnACh6sTHYilAU9mdpOD0ZJU=; b=OI4HR414XwshK/ulj1p5okxLpO
	4zo5NyC09MiWNSDEHgedqzKlN7DgDx74KjU1qg2yQC7ytQSKl/MXZr+4eCCyQcqn9kM74vTncOY1W
	MMjI4fTv6dA+Wjq/49BJbF+lXFe3wNrSU3cv3g4lq/n4ENzWmyEL9HNiO/JuJqRlJbhU=;
Message-ID: <0edc072e-40df-7c01-822f-67cb8b78a457@xen.org>
Date: Tue, 17 Jan 2023 13:53:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/3] xen/arm: Harden setup_frametable_mappings
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230117114332.25863-1-michal.orzel@amd.com>
 <20230117114332.25863-4-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230117114332.25863-4-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 17/01/2023 11:43, Michal Orzel wrote:
> The amount of supported physical memory depends on the frametable size
> and the number of struct page_info entries that can fit into it. Define
> a macro PAGE_INFO_SIZE to store the current size of the struct page_info
> (i.e. 56B for arm64 and 32B for arm32) and add a sanity check in
> setup_frametable_mappings to be notified whenever the size of the
> structure changes. Also call a panic if the calculated frametable_size
> exceeds the limit defined by FRAMETABLE_SIZE macro.
> 
> Update the comments regarding the frametable in asm/config.h.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

