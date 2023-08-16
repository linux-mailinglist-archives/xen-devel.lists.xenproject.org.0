Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6883277E4AA
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 17:07:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584791.915620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWI6z-0001Uu-Qq; Wed, 16 Aug 2023 15:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584791.915620; Wed, 16 Aug 2023 15:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWI6z-0001SX-Nu; Wed, 16 Aug 2023 15:07:05 +0000
Received: by outflank-mailman (input) for mailman id 584791;
 Wed, 16 Aug 2023 15:07:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWI6y-0001SR-Fb
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 15:07:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWI6y-0002Yn-20; Wed, 16 Aug 2023 15:07:04 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.5.61])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWI6x-0003bY-Rt; Wed, 16 Aug 2023 15:07:03 +0000
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
	bh=l/xeI4XevecRUiJR7DJPSF3CPoZibyFBZ9rLXM5zs/Y=; b=Pq8QXt2V2s00rNjSO6xn2DA7yG
	pxvZivbDWwKIgBBB8egP/y+zFvrvlTX/qq2+BtVx64wq7PIwFPApU+ZHl8Uk64CCQITeCXuMbfkHO
	OM1Xfl/ayQj90TIlbblvtwzYIqHHlqpmwOnC9rqgNZAOeGUWsmRSkWP9WohD1zAqrw30=;
Message-ID: <53027136-7008-4afe-b092-eb51f7242dcb@xen.org>
Date: Wed, 16 Aug 2023 16:07:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v11 03/14] xen/arm: ffa: send guest events to Secure
 Partitions
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Marc Bonnici <Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230731121536.934239-1-jens.wiklander@linaro.org>
 <20230731121536.934239-4-jens.wiklander@linaro.org>
 <EF204A13-A736-4C20-BF4F-94B609F488F8@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <EF204A13-A736-4C20-BF4F-94B609F488F8@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/08/2023 10:40, Bertrand Marquis wrote:
> Hi Jens,

Hi,

>> On 31 Jul 2023, at 14:15, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>> /* This function is supposed to undo what ffa_domain_init() has done */
>> static int ffa_domain_teardown(struct domain *d)
>> {
>>      struct ffa_ctx *ctx = d->arch.tee;
>> +    unsigned int n;
>> +    int32_t res;
>>
>>      if ( !ctx )
>>          return 0;
>>
>> +
> 
> NIT: this extra line should be removed.
> 
> @Julien: are you ok to fix that one on commit ?

Yes I can do it.

CHeers,

-- 
Julien Grall

