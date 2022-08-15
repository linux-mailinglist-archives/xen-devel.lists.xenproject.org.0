Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 448BE593377
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 18:48:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387709.624065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNdFo-0005FY-Q1; Mon, 15 Aug 2022 16:47:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387709.624065; Mon, 15 Aug 2022 16:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNdFo-0005Cw-NF; Mon, 15 Aug 2022 16:47:52 +0000
Received: by outflank-mailman (input) for mailman id 387709;
 Mon, 15 Aug 2022 16:47:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oNdFn-0005Co-BK
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 16:47:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oNdFn-0001KU-5o; Mon, 15 Aug 2022 16:47:51 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[10.95.149.129]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oNdFm-0000SD-WF; Mon, 15 Aug 2022 16:47:51 +0000
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
	bh=Ayz+h/kJxaGovDdaVPFH0/EfZvovudBXIvuaqnz5ZSg=; b=AoGkUdq7tpjvCodyK9gxNV/yUI
	hDIrbO4HN6bRr/mcpHdQWeI3Qcd0GarM1ENNSqy+iwvST7HvJq3fzGrqBD7emVgFutDwIZvygeDgk
	rBaJMuqE9kbW78ZqSTafOtvAQ10ECmWeAiTCdRMjmDBAS6v9xLDRc4Kb9x084gv8iDo0=;
Message-ID: <15023215-6697-112b-2bc6-8ec7880a9704@xen.org>
Date: Mon, 15 Aug 2022 17:47:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH 7/7] xen/arm32: traps: Dump more information for
 hypervisor data abort
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220812192448.43016-1-julien@xen.org>
 <20220812192448.43016-9-julien@xen.org>
 <AS8PR08MB799170A0EF051DE12565D9D992689@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB799170A0EF051DE12565D9D992689@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/08/2022 02:40, Henry Wang wrote:
> Hi Julien,

Hi Henry,

>> -----Original Message-----
>> Subject: [PATCH 7/7] xen/arm32: traps: Dump more information for
>> hypervisor data abort
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Unlike arm64, on arm32 there are no extra information dumped (e.g.
>> page table walk) for hypervisor data abort.
>>
>> For data abort, the HSR will be set properly and so replace the call
>> to do_unexpected_trap() with do_trap_hyp_sync() to dispatch the error.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> I think this patch looks good to me so:
> 
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> 
> But it seems that there is a duplicated patch at:
> https://patchwork.kernel.org/project/xen-devel/patch/20220812192448.43016-10-julien@xen.org/

Hmmm... I dropped a patch from the series and it looks like I didn't 
properly clean the directory before doing that. Please ignore patch #8.

Cheers,

-- 
Julien Grall

