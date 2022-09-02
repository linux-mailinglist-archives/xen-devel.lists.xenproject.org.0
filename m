Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0A05AA959
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 10:02:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397417.637983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU1cS-0000j5-TS; Fri, 02 Sep 2022 08:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397417.637983; Fri, 02 Sep 2022 08:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU1cS-0000gN-QA; Fri, 02 Sep 2022 08:01:40 +0000
Received: by outflank-mailman (input) for mailman id 397417;
 Fri, 02 Sep 2022 08:01:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oU1cR-0000gH-TE
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 08:01:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oU1cR-0001RS-If; Fri, 02 Sep 2022 08:01:39 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.18.194]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oU1cR-0002UG-Cf; Fri, 02 Sep 2022 08:01:39 +0000
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
	bh=vm3NWXrvJFhnY8zHAUaiPmhnB+G0684b6qiXmr/lis8=; b=yy5z7cQNDmCUZTyvOlTcynoRI5
	3y66B3cWSUyisJMGeVKchafK4LIgzvoieojx4wDVZK8KNvC1+IMXnNGuTgjUKgUbeKIlJFkUga72s
	HHjPVkRP2y5qAq36Y6izRSoVK9FPONhzNNq48AVvTzpheGxbIfnsGI8oF6z8rfWf1lig=;
Message-ID: <56d7a2e6-8749-601b-b163-669401bdfd67@xen.org>
Date: Fri, 2 Sep 2022 09:01:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH 1/2] docs, xen/arm: Introduce reserved heap memory
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <Penny.Zheng@arm.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-2-Henry.Wang@arm.com>
 <9b5afd5e-ec5c-bac6-9ad0-9dd9663aa705@xen.org>
 <AS8PR08MB7991DCF7AF78FADB95166551927A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991DCF7AF78FADB95166551927A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 02/09/2022 02:28, Henry Wang wrote:
>> This is technically a change in behavior for Xen (we would panic rather
>> than continue). I am happy with the proposal. However, this doesn't seem
>> to be explained in the commit message.
>>
>> That said, I think this should be split in a separate patch along with
>> the ones below (including the prototype changes).
> 
> According to Michal's comment, I've removed the return type and function
> prototype change in my local v2. So this patch itself is fine. My question now
> would be, do maintainers think this change of behavior with processing the
> chosen node be helpful? 

Yes. I think it is saner to stop booting early rather than seen random 
behavior afterwards.

> Do we prefer an instant panic or current behavior?

I think we should leave that up to the caller. Today, this is a panic() 
but we may decide differently in the future.

Cheers,

-- 
Julien Grall

