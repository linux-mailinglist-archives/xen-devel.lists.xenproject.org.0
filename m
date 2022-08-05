Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE5858ADF0
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 18:14:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381406.616073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJzxr-000789-KK; Fri, 05 Aug 2022 16:14:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381406.616073; Fri, 05 Aug 2022 16:14:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJzxr-00075E-Ha; Fri, 05 Aug 2022 16:14:19 +0000
Received: by outflank-mailman (input) for mailman id 381406;
 Fri, 05 Aug 2022 16:14:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oJzxp-000758-Bn
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 16:14:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJzxp-0004TT-1W; Fri, 05 Aug 2022 16:14:17 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.9.179]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJzxo-0001mm-Rv; Fri, 05 Aug 2022 16:14:16 +0000
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
	bh=oppPtUa9gUMv3aBAKnYK8X5squWNVmFP7ys6AaSrUTc=; b=l9DSfSElfuVQND2AVd1nVv63CY
	047WnIq0c3bh3BKuuHL2VLaScZbIJ/dA8ETIUaC3MzcEqgEPGPbbsh9J+3uYf2Grhytd9yRCunpEr
	nxvGT0lqI03hJDsPHgxikaqFzEEGccvZFftIV+gZXMTGgeAiz34rTuMYRud8EfSJiX/g=;
Message-ID: <6a276407-cfcd-d383-6d51-644b463ee510@xen.org>
Date: Fri, 5 Aug 2022 17:14:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH 7/8] xen: introduce xen-evtchn dom0less property
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <f2bc792f8dea59648b011cda4fe7c42929c4e3d7.1655903088.git.rahul.singh@arm.com>
 <B91E9B3F-27DA-4412-9F1D-AFD1287D0898@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <B91E9B3F-27DA-4412-9F1D-AFD1287D0898@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/08/2022 17:10, Rahul Singh wrote:
> Hi ,

Hi Rahul,

>> On 22 Jun 2022, at 3:38 pm, Rahul Singh <Rahul.Singh@arm.com> wrote:
>>
>> Introduce a new sub-node under /chosen node to establish static event
>> channel communication between domains on dom0less systems.
>>
>> An event channel will be created beforehand to allow the domains to
>> send notifications to each other.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> docs/misc/arm/device-tree/booting.txt |  62 +++++++++++-
>> xen/arch/arm/domain_build.c           | 139 ++++++++++++++++++++++++++
>> xen/arch/arm/include/asm/domain.h     |   1 +
>> xen/arch/arm/include/asm/setup.h      |   1 +
>> xen/arch/arm/setup.c                  |   2 +
>> 5 files changed, 204 insertions(+), 1 deletion(-)
> 
> I am waiting for a review for this patch and the next patch in the series before
> I send the next version. Sending this email as a gentle reminder.

I wasn't planning to review this patch and the next one yet because this 
looks mostly parsing. I think this is more important to get patch #1-#6 
correct first.

Cheers,

-- 
Julien Grall

