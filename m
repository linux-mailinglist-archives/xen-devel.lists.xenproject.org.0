Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 505796614E9
	for <lists+xen-devel@lfdr.de>; Sun,  8 Jan 2023 13:14:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473138.733613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEUYH-0006KP-Uo; Sun, 08 Jan 2023 12:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473138.733613; Sun, 08 Jan 2023 12:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEUYH-0006HM-S0; Sun, 08 Jan 2023 12:13:25 +0000
Received: by outflank-mailman (input) for mailman id 473138;
 Sun, 08 Jan 2023 12:13:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pEUYG-0006HG-Kq
 for xen-devel@lists.xenproject.org; Sun, 08 Jan 2023 12:13:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEUYG-0005cM-5L; Sun, 08 Jan 2023 12:13:24 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEUYF-0003cA-Sh; Sun, 08 Jan 2023 12:13:24 +0000
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
	bh=8J4YsxLSyyEjda5xIkLHeBep8ikZw7KoQ0QgXbjTHhY=; b=BJiou41POJ4/8CqOQbzJv9JCu/
	MG4YKthQUFoh28feDGPCq9NlHHltY9Da0Hi06UKAGUZzIcXBinm3sVldG8b+d2LV/u6daexAKbjdR
	nbLlXJ80m/SPr8tGZ+027bMUL8ZIx6CXCnzVctSWTHaiCV+NpLw0UKXAPrgX9d/IKDPk=;
Message-ID: <3832d94f-6856-82b3-ea64-a9e79460c547@xen.org>
Date: Sun, 8 Jan 2023 12:13:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v1 04/13] xen/arm: expand shm_membank for unprovided host
 address
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
 <20221115025235.1378931-5-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221115025235.1378931-5-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 15/11/2022 02:52, Penny Zheng wrote:
> When host address is not provided in "xen,shared-mem", we let Xen
> automatically allocate requested static shared memory from heap, and it
> stands good chance of having multiple host memory banks allocated for the
> requested static shared memory as a result. Therefore current membank is not
> going to cover it.
> 
> This commit introduces a new field "mem" to cover both scenarios.
> "struct membank" is used when host address is provided, whereas
> "struct meminfo" shall be used when host address not provided.

 From this patch, it is not clear to me how a user can know which part 
of the union should be used.

However... I am not entirely sure why you need to create a union because 
in your new structure you can fit one bank.

Cheers,

-- 
Julien Grall

