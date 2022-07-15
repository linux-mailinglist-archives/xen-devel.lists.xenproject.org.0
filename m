Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E0457668C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 20:10:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368453.599741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCPlN-0002MJ-E1; Fri, 15 Jul 2022 18:10:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368453.599741; Fri, 15 Jul 2022 18:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCPlN-0002Iq-Al; Fri, 15 Jul 2022 18:10:05 +0000
Received: by outflank-mailman (input) for mailman id 368453;
 Fri, 15 Jul 2022 18:10:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oCPlL-00025E-Rw
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 18:10:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCPlL-0002Un-Ii; Fri, 15 Jul 2022 18:10:03 +0000
Received: from [54.239.6.188] (helo=[192.168.17.116])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCPlL-0002md-Bu; Fri, 15 Jul 2022 18:10:03 +0000
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
	bh=0dq+NPThF+RlX1bDPiXVFdfGt6qqMAkPqDf4Cr73lIk=; b=il5ytrRZ3EsxlBO41OJc62gmnJ
	KXWFyXBFomzzeeeyFQRc4VajTHf6KovzxTjDb/+AigIpFtbass/L5X9CBvkdxCPWCXxcEbo1VSuRB
	5s3TmMNenn5ZDKJokLFBnMqTiVYflBcuc7ZxeWWZj94o/PCmGcoNY547EwxS1yspB+2Q=;
Message-ID: <eb483210-9f6c-9177-4e96-d87fb4ff9d1b@xen.org>
Date: Fri, 15 Jul 2022 19:10:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v5 1/8] xen/arm: introduce static shared memory
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220620051114.210118-1-Penny.Zheng@arm.com>
 <20220620051114.210118-2-Penny.Zheng@arm.com>
 <45a41132-1520-a894-a9eb-6688c79a660d@xen.org>
 <DU2PR08MB7325E703004D3BB160C2CF50F7BB9@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DU2PR08MB7325E703004D3BB160C2CF50F7BB9@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Penny,

On 29/06/2022 09:39, Penny Zheng wrote:
>>> +    for ( i = 0; i < mem->nr_banks; i++ )
>>> +    {
>>> +        /*
>>> +         * A static shared memory region could be shared between multiple
>>> +         * domains.
>>> +         */
>>> +        if ( paddr == mem->bank[i].start && size == mem->bank[i].size )
>>> +            break;
> 
> Maybe I need to add a check on shm-id:
> "
>          /*
>           * A static shared memory region could be shared between multiple
>           * domains.
>           */
>          if ( strcmp(shm_id, mem->bank[i].shm_id) == 0 )
>          {
>              if ( paddr == mem->bank[i].start && size == mem->bank[i].size )
>                  break;
>              else
>              {
>                  printk("Warning: xen,shm-id %s does not match for all the nodes using the same region.\n",
>                         shm_id);
>                  return -EINVAL;
>              }
>          }
> "
> Wdyt？

AFAICT, this would allow to region to overlap if they have different shm 
ID. I am not entirely sure the rest of your code would work properly in 
this case (what if the owner is different).

So I think we need the following checks:
   1) The shm ID matches *and* the region exactly match
   2) The shm ID doesn't match and the region doesn't overlap with an 
existing one

Cheers,

-- 
Julien Grall

