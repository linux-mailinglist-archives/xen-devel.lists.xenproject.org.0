Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7A2661541
	for <lists+xen-devel@lfdr.de>; Sun,  8 Jan 2023 13:54:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473159.733647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEVBq-0003D9-Fz; Sun, 08 Jan 2023 12:54:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473159.733647; Sun, 08 Jan 2023 12:54:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEVBq-0003Al-Ck; Sun, 08 Jan 2023 12:54:18 +0000
Received: by outflank-mailman (input) for mailman id 473159;
 Sun, 08 Jan 2023 12:54:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pEVBo-0003Ab-U6
 for xen-devel@lists.xenproject.org; Sun, 08 Jan 2023 12:54:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEVBo-0006ZW-4E; Sun, 08 Jan 2023 12:54:16 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEVBn-0004tf-VO; Sun, 08 Jan 2023 12:54:16 +0000
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
	bh=mpwGGOGOV4+9snxHoL34MVzq/OouXdyYF0EdBGrWeZE=; b=QaKOzd2UTu+Lo9eoaRG+V/zb6r
	tTpuMAz6ZYEvjR6krF9+ne8+IWK/jFmHQSHPSEBhY3ccfPlIPtkZA/ObJDP1bWflIkHclejOyLKw8
	F7s33PsONN3sZP5khxnLJ1j0L4OxFh7DBIfw6a7oG5/tbemiPG+tnmiHAeKpR3u0PoFo=;
Message-ID: <bebd3fa6-1b04-4158-5dd6-55feba0f5560@xen.org>
Date: Sun, 8 Jan 2023 12:54:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v1 04/13] xen/arm: expand shm_membank for unprovided host
 address
From: Julien Grall <julien@xen.org>
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
 <20221115025235.1378931-5-Penny.Zheng@arm.com>
 <3832d94f-6856-82b3-ea64-a9e79460c547@xen.org>
In-Reply-To: <3832d94f-6856-82b3-ea64-a9e79460c547@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/01/2023 12:13, Julien Grall wrote:
> Hi Penny,
> 
> On 15/11/2022 02:52, Penny Zheng wrote:
>> When host address is not provided in "xen,shared-mem", we let Xen
>> automatically allocate requested static shared memory from heap, and it
>> stands good chance of having multiple host memory banks allocated for the
>> requested static shared memory as a result. Therefore current membank 
>> is not
>> going to cover it.
>>
>> This commit introduces a new field "mem" to cover both scenarios.
>> "struct membank" is used when host address is provided, whereas
>> "struct meminfo" shall be used when host address not provided.
> 
>  From this patch, it is not clear to me how a user can know which part 
> of the union should be used.

Ah it is a struct rather than an union. Yet...

> 
> However... I am not entirely sure why you need to create a union because 
> in your new structure you can fit one bank.

... my point here stands.

Cheers,

-- 
Julien Grall

