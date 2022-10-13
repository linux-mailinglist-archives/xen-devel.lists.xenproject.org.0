Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8E95FD953
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 14:40:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421967.667708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixUk-0003Ed-08; Thu, 13 Oct 2022 12:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421967.667708; Thu, 13 Oct 2022 12:39:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixUj-0003CI-TW; Thu, 13 Oct 2022 12:39:25 +0000
Received: by outflank-mailman (input) for mailman id 421967;
 Thu, 13 Oct 2022 12:39:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oixUh-0003CA-Pr
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 12:39:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oixUd-00073a-Ma; Thu, 13 Oct 2022 12:39:19 +0000
Received: from [15.248.2.148] (helo=[10.24.69.9])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oixUd-00069U-Hh; Thu, 13 Oct 2022 12:39:19 +0000
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
	bh=eWakhKxC3SXnvMx8Tzw6m9s/73HqJbY1g4SOB5Auz2s=; b=a9Q65JG/xTm4i4yyg6ap+D4cN5
	qFDARU4QWjRTHk27hB7Q4yTmeDCCYJdea1AB9YUIYpRi2KkpgN591/MSoTz/yTxOa/tXprUqBRk4Q
	7MTl9UUnkLZXfLSaOpFk9m/7CMGU9Y9sLTNr6aaf0djPUgt2mHTXKYycmuo07KzCbSiU=;
Message-ID: <ccca7922-513d-3a9d-c994-f15c23e40812@xen.org>
Date: Thu, 13 Oct 2022 13:39:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.1
Subject: Re: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221013083818.36209-1-Henry.Wang@arm.com>
 <c1020b65-491f-e1c5-3ef3-7edb99e0435c@xen.org>
 <AS8PR08MB7991F3222D1C616AEF9C771092259@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <2c2b3e8f-34fc-1ef2-c086-233964e29e43@xen.org>
 <03419318-275a-1f9d-6e00-1a3489659f22@suse.com>
 <AS8PR08MB79917792FD8A7695C969020992259@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <05c4def0-321e-c864-7d92-b4dfe110d030@suse.com>
 <AS8PR08MB7991AD5D30E4EBADD0A7582592259@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991AD5D30E4EBADD0A7582592259@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/10/2022 13:29, Henry Wang wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>>>> Assuming you have 4 (N) page table levels, isn't it 7 (1 + 2 * (N - 1))?
>>>> Or is the root table not taken from the p2m pool?
>>>
>>> Correct, on arm the root is not taken from the pool.
>>
>> Isn't that a (perhaps just minor) mistake?
> 
> Not really, in the code review phase, the question of whether we include
> the root in the p2m pool was discussed and the conclusion at that time
> was not including this page for now, as this is supposed to require a lot
> of extra work/refactor. Probably there will be a series from my side to
> add the root to the pool, but at least not now.

The root page tables can be one of multiple concatenated pages (up to 8 
pages). The P2M pool is allocating page by page and therefore wouldn't 
allow us to allocate contiguous pages.

Therefore, we need to handle the root differently. At which point it 
doesn't seem to be worth it to allocate it from the P2M pool.

Cheers,

-- 
Julien Grall

