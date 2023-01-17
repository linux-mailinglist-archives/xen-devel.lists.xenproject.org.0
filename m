Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 435B566DF66
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 14:52:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479402.743218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmNb-00078k-MA; Tue, 17 Jan 2023 13:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479402.743218; Tue, 17 Jan 2023 13:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmNb-000766-Iz; Tue, 17 Jan 2023 13:51:59 +0000
Received: by outflank-mailman (input) for mailman id 479402;
 Tue, 17 Jan 2023 13:51:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHmNa-000760-62
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 13:51:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHmNZ-0000yj-Oh; Tue, 17 Jan 2023 13:51:57 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.7.198]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHmNZ-0007LG-IX; Tue, 17 Jan 2023 13:51:57 +0000
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
	bh=oUnLgfiWq3z2+0zDMvwMCyiXqT8wN1dnNLinglaaqo0=; b=qCiNaL0LqYWMSp2InMC4iDpsOe
	I9/UBGj2H327cJOND9ggtF6yqTu7KcWJhtDOROFWOtgm5jwIpsQqXlb0VHf8Ok7jZfzCzMNcJlGQM
	Mtu+UbJA5l2tmfNEuaU9DcJPkixp/DbfJM25F7Pf4K9+FbdLNM2Wf88psK/CBZlf0z/0=;
Message-ID: <c31a5507-7b72-2f2b-63f6-0f5c89d7b666@xen.org>
Date: Tue, 17 Jan 2023 13:51:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/3] xen/arm64: Fix incorrect DIRECTMAP_SIZE
 calculation
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230117114332.25863-1-michal.orzel@amd.com>
 <20230117114332.25863-2-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230117114332.25863-2-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 17/01/2023 11:43, Michal Orzel wrote:
> The direct mapped area occupies L0 slots from 256 to 265 included
> (i.e. 10 slots), resulting in 5TB (512GB * 10) of virtual address space.
> However, due to incorrect slot subtraction (we take 9 slots into account)
> we set DIRECTMAP_SIZE to 4.5TB instead. Fix it.
> 
> Note that we only support up to 2TB of physical memory so this is
> a latent issue.
> 
> Fixes: 5263507b1b4a ("xen: arm: Use a direct mapping of RAM on arm64")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

