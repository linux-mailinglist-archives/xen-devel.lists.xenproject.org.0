Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B354462327C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 19:33:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441115.695416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ospt2-0003aM-As; Wed, 09 Nov 2022 18:33:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441115.695416; Wed, 09 Nov 2022 18:33:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ospt2-0003Ww-7b; Wed, 09 Nov 2022 18:33:20 +0000
Received: by outflank-mailman (input) for mailman id 441115;
 Wed, 09 Nov 2022 18:33:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ospt1-0003Wm-2g
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 18:33:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ospt0-00054w-QQ; Wed, 09 Nov 2022 18:33:18 +0000
Received: from [15.248.2.52] (helo=[10.24.69.10])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ospt0-0003dV-Jj; Wed, 09 Nov 2022 18:33:18 +0000
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
	bh=3+XOca9yPvBad15eW4f5F21HtjgVK7yKFtv6Mh2y+DI=; b=q/N5KVf78SqafFagx4J2LbXfEa
	ASxYNmLSl/LYrlyjLMyJYIieZPxV6ksp0BIpQq3+tV6H62QlvZh2OFfSPYcRyRY/QHBHrnEJ/2HRr
	Z/prlLY8Abqsm4bmJHvumrYlbcw17bsEquu61zE/lSRYOTB/sJfsKn3pehX2owDKWLf4=;
Message-ID: <5bbc68f5-0ec3-1a21-e2cb-92703fa338d7@xen.org>
Date: Wed, 9 Nov 2022 18:33:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v6 08/11] xen/arm64: move MMU related code from head.S to
 head_mmu.S
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-9-wei.chen@arm.com>
 <5b975a59-5e97-c2a8-805c-9ab99b8712aa@xen.org>
 <PAXPR08MB74206E8C1513DC90DCD71CEC9E3E9@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <PAXPR08MB74206E8C1513DC90DCD71CEC9E3E9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/11/2022 07:36, Wei Chen wrote:
> Hi Julien,

Hi Wei,

>> The patch is already quite difficult to read. So I would rather prefer
>> if the indentation is changed separately.
>>
> 
> Ok.
> 
>> Furthermore, I think it would be best if the functions moved in the
>> header are done separately to help checking (I would be able to diff the
>> source with the destination more easily).
>>
> 
> Did you mean to create a separate patch for moving the functions in macro.h?

I mean the macros in macro.h. Sorry, I misquoted it.

Cheers,

-- 
Julien Grall

