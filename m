Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0866829C4
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 10:59:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487502.755154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMnQE-0004lX-Ix; Tue, 31 Jan 2023 09:59:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487502.755154; Tue, 31 Jan 2023 09:59:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMnQE-0004j4-G8; Tue, 31 Jan 2023 09:59:26 +0000
Received: by outflank-mailman (input) for mailman id 487502;
 Tue, 31 Jan 2023 09:59:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMnQD-0004iy-JS
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 09:59:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMnQD-0006WY-6z; Tue, 31 Jan 2023 09:59:25 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.14.74]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMnQD-0003xm-1W; Tue, 31 Jan 2023 09:59:25 +0000
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
	bh=OAPeHy/0SDnRTC1ShnbPDm2XNvl7LMFEozy9czPWj/0=; b=ht+lfgtjfPr2v6A5YNrCHDYzjP
	dbQY8oRSmm/KYAedxCHrpsPV5avRqhFQn9Om2+AjshdbSQ2JBg5FALfB5FdFrmdZP9Rj8Ti6ZG5Cr
	rnFpkjZRFCPvLeMrDLrwTtV/UhZhlM3WemGUYXch7FTUbvSrzOeK/PKqIT4IqVE9QV3w=;
Message-ID: <b8b0b07c-2b5f-f5df-1a95-e787f2cab25a@xen.org>
Date: Tue, 31 Jan 2023 09:59:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/3] xen/arm: Add memory overlap check for
 bootinfo.reserved_mem
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230130040535.188236-1-Henry.Wang@arm.com>
 <20230130040535.188236-2-Henry.Wang@arm.com>
 <fca91d3c-5d8a-3f7e-419a-a4c5208273dc@xen.org>
 <AS8PR08MB79910D7E3C7F32D8CDCB851092D09@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <ffa2c5e3-9dcb-eca1-fe3f-6ad4c7c83bae@xen.org>
 <AS8PR08MB799131C4BA5A3C5A33A0CD8D92D09@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB799131C4BA5A3C5A33A0CD8D92D09@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 31/01/2023 09:30, Henry Wang wrote:
> Hi Julien,
> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Subject: Re: [PATCH v3 1/3] xen/arm: Add memory overlap check for
>> bootinfo.reserved_mem
>>> I will fix this patch and #2 in v4.
>>
>> I am happy to deal with it on commit if you want.
> 
> Including adding the comment for both patches? This would be wonderful
> and very nice of you to do that. But if your time is limited I am also more
> than happy to respin the patch (probably even with Stefano's Reviewed-by
> tag if he is ok with it) to reduce your burden. That said, if I need to respin the
> patch, it would be good to get some hints about the wording of the comments
> to avoid another v+1 just because of my inaccurate wording :)

Good idea. My suggestion would be:

TODO: '*_end' could be 0 if the bank/region is at the end of the 
physical address space. This is for now not handled as it requires more 
rework.

Cheers,

-- 
Julien Grall

