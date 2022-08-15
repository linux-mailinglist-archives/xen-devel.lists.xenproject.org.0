Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC09E592AFC
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 10:30:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387181.623314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNVTu-0007Uc-CU; Mon, 15 Aug 2022 08:29:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387181.623314; Mon, 15 Aug 2022 08:29:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNVTu-0007SI-9k; Mon, 15 Aug 2022 08:29:54 +0000
Received: by outflank-mailman (input) for mailman id 387181;
 Mon, 15 Aug 2022 08:29:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oNVTs-0007S7-JD
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 08:29:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oNVTq-0000C3-Vt; Mon, 15 Aug 2022 08:29:50 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[10.95.149.129]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oNVTq-0008CS-Nx; Mon, 15 Aug 2022 08:29:50 +0000
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
	bh=z2vyAu3xjinNjXM/0r30GoOgrvkiFZTn0wbQboG/dh0=; b=aOaKnBvcyWU8olgTmwutj8cDV2
	Y8OJj4BbnTjYn6RBWi99K8/uiGPnkKvovB4CxVBiOL4qyV/aQCFjHYRZEPNBll+no+HuR3JzThGHY
	PDCf6Vcw2h9CA9hRMVy0407wPQUPjqgPJ4WUriVIY/5Ac5SsjRjbFUnNpO8jHSi2R/nU=;
Message-ID: <12c564db-84dc-0b04-1b87-8151e1ac1b8a@xen.org>
Date: Mon, 15 Aug 2022 09:29:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: Xen 4.17: Current status of series floating in ML
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall
 <jgrall@amazon.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "jgross@suse.com" <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 "Wei Liu (LSG)" <liuwe@microsoft.com>
References: <AS8PR08MB7991375F9A36B36AE5ADF3E092689@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <c8d7de5e-0d0b-43cb-2b89-d253a2b0b490@xen.org>
 <AS8PR08MB7991B735C93D67084E946D4992689@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991B735C93D67084E946D4992689@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/08/2022 09:21, Henry Wang wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Subject: Re: Xen 4.17: Current status of series floating in ML
>> On 15/08/2022 06:46, Henry Wang wrote:
>>> Hi all,
>>
>> Hi Henry,
>>
>> Thanks for the list!
> 
> No problem, always feel good if this can help the community.
> 
>>> ** Blocker List **:
>>> 2. tools/xenstore: add some new features to the documentation
>>> https://patchwork.kernel.org/project/xen-devel/list/?series=665064
>>> Status: Patch #2 merged. Only patch #5 is not properly reviewed/acked.
>>> Discussion seems going on and (probably?) needs a respin.
>>
>> Hmmm... Why is it a blocker? This is only documentation and I haven't
>> yet seen any code implementing those new features.
> 
> Oh I think this is because I was copied when doing the review of v2
> when people were discussing if we need a revert of mis-committed v1.
> 
> """
> As you committed, I would be OK if this is addressed in a follow-up
> series. But this *must* be addressed by the time 4.17 is released
> because otherwise we will commit ourself to a broken interface. @Henry,
> please add this in the blocker list.
> """
> 
> This series has been in my list since then :))
Ah! I forgot. We reverted the series just after. So Juergen's series is 
not a follow-up but a replacement.

Cheers,

-- 
Julien Grall

