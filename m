Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D969754F2A1
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 10:17:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351099.577609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o279z-0004vp-8i; Fri, 17 Jun 2022 08:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351099.577609; Fri, 17 Jun 2022 08:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o279z-0004t7-5M; Fri, 17 Jun 2022 08:16:55 +0000
Received: by outflank-mailman (input) for mailman id 351099;
 Fri, 17 Jun 2022 08:16:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o279x-0004su-FU
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 08:16:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o279w-0006Bj-KC; Fri, 17 Jun 2022 08:16:52 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.0.243]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o279w-0005Z2-Cy; Fri, 17 Jun 2022 08:16:52 +0000
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
	bh=ychhPBjESfktqZuqgD7DpY1PUlkzuhKF23PbFWiNdv0=; b=s+A2QN7fQUJeAoOivDV5IEiJQv
	TgyCAFthIDsR4feU+7DKEyAit8tT+3jh5kV3wzgIMgq6pFenV3Q3vx7pi2cvtZQy9OFCgNAOb/uvr
	OnvlXtLR+gWG8ivQOly1UHWMQ+ERcZX+VCLNGJXLon6jiCPdWzvwwkPA11+iIvljHNK0=;
Message-ID: <94122e8d-224d-2632-27ad-d56d3a24b367@xen.org>
Date: Fri, 17 Jun 2022 09:16:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/2] xen/arm: add FF-A mediator
To: Jens Wiklander <jens.wiklander@linaro.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220609061812.422130-1-jens.wiklander@linaro.org>
 <20220609061812.422130-3-jens.wiklander@linaro.org> <874k0nhvsq.fsf@epam.com>
 <20220616223728.GA71444@jade>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220616223728.GA71444@jade>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jens,

On 16/06/2022 23:37, Jens Wiklander wrote:
> On Tue, Jun 14, 2022 at 07:47:18PM +0000, Volodymyr Babchuk wrote:
>>
>> Hello Jens,
>>
>> Sorry for late review, I was busy with internal projects.
>>
>> This is preliminary review. I gave up at scatter-gather operations. Need
>> more time to review them properly.
> 
> No problem, thanks for taking the time.
> 
>>
>> One thing that bothers me is that Xen is non-preemptive and there are
>> plenty potentially long-running operations.
> 
> There's room to deal with that in the FF-A specification. These scatter
> gather operation are quite complicated so I started with the minimum. We
> can as a future optimization address the problem with long running
> operations.

I would be OK to defer this work. However, I think this should be 
written down as Xen community will not be able to security support until 
we resolved the known places where a vCPU may hog pCPU longer than 
necessary.

This reminds me that this series doesn't add a support statement for the 
new subsystem in SUPPORT.md. AFAICT, this should be tech preview for now.

Cheers,

-- 
Julien Grall

