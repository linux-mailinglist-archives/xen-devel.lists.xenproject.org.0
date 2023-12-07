Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8C3808898
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 13:58:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649853.1014868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBDxb-0001M6-9o; Thu, 07 Dec 2023 12:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649853.1014868; Thu, 07 Dec 2023 12:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBDxb-0001KE-6r; Thu, 07 Dec 2023 12:58:35 +0000
Received: by outflank-mailman (input) for mailman id 649853;
 Thu, 07 Dec 2023 12:58:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rBDxZ-0001K8-Ci
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 12:58:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBDxY-0003HG-UU; Thu, 07 Dec 2023 12:58:32 +0000
Received: from [15.248.3.113] (helo=[10.24.67.25])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBDxY-0005lR-NV; Thu, 07 Dec 2023 12:58:32 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=CTkZr54jQZLWNJBvwjG4v+r1Cjl46Pc2EGHJvvlqZkQ=; b=Us8SAaAvxDreVEud6kPHmk48Rq
	l9FPYOC7vTagkplxhGyboEqg9Hx04ykCOaFeaJxImKPAMOQiMaarsrYauQnH6DlkEXfWEP2cjAZRv
	nE8ZNWa7O+2innOvC+oN4e7uZd+fgs9a9Krf5ONJ9ofecePnXPpfIus/q6n1juIeNUB4=;
Message-ID: <beb24b8c-700f-4d2a-955f-2d2b30d4ae79@xen.org>
Date: Thu, 7 Dec 2023 12:58:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: bootfdt: Check return code of
 device_tree_for_each_node()
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231207101432.37732-1-michal.orzel@amd.com>
 <d45f0d37-dbca-44a8-a27f-b9e709bb9cfd@xen.org>
In-Reply-To: <d45f0d37-dbca-44a8-a27f-b9e709bb9cfd@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/12/2023 12:20, Julien Grall wrote:
> Hi Michal,
> 
> On 07/12/2023 10:14, Michal Orzel wrote:
>> As a result of not checking the return code of 
>> device_tree_for_each_node()
>> in boot_fdt_info(), any error occured during early FDT parsing does not
>> stop Xen from booting. This can result in an unwanted behavior in later
>> boot stages. Fix it by checking the return code and panicing on an error.
>>
>> Fixes: 9cf4a9a46717 ("device tree: add device_tree_for_each_node()")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> With one remark below:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

It is now committed.

Cheers,

-- 
Julien Grall

