Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 588875AA9A4
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 10:13:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397438.638015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU1o1-0003Mf-GS; Fri, 02 Sep 2022 08:13:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397438.638015; Fri, 02 Sep 2022 08:13:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU1o1-0003K3-Cf; Fri, 02 Sep 2022 08:13:37 +0000
Received: by outflank-mailman (input) for mailman id 397438;
 Fri, 02 Sep 2022 08:13:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oU1nz-0003Jx-V1
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 08:13:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oU1nz-0001dh-K7; Fri, 02 Sep 2022 08:13:35 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.18.194]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oU1nz-0003H6-EW; Fri, 02 Sep 2022 08:13:35 +0000
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
	bh=nqKqBX88AtQ6oEKESEOaPu9A1+c8RgTpoOjHZ69JxyU=; b=58nwyYRE0T0anXYjhTVpgiTHh6
	PvwSCm3zhmQuKgybBO2mzSs59a+EX6DOTYeGkeNq6dOIDrz81XV4CKMwZWCt3gAg/5J/79FYTYbFD
	nT09NHyAP6lbaIc8LcIxLReb0KAiYZdDcRERh5yaHj3J2V6vXaawf9UXhI78zH4VDaoU=;
Message-ID: <70c3f092-8926-0114-1d8a-944aff12a1f7@xen.org>
Date: Fri, 2 Sep 2022 09:13:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v6 1/9] xen/arm: introduce static shared memory
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220721132115.3015761-1-Penny.Zheng@arm.com>
 <20220721132115.3015761-2-Penny.Zheng@arm.com>
 <ce6c2e20-2d5f-dccc-e4d0-0e8ce92caeb4@xen.org>
 <AM0PR08MB453055962750CBD525997CE7F7769@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <3b58faef-d87d-3381-f54d-8ccdc0ea105f@xen.org>
 <AM0PR08MB4530DD45D81B4238A1011500F77A9@AM0PR08MB4530.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AM0PR08MB4530DD45D81B4238A1011500F77A9@AM0PR08MB4530.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 02/09/2022 04:26, Penny Zheng wrote:
>>> Do you think I shall further point out that right now, this part
>>> feature is not implemented in codes?
>>
>> I have made a couple of suggestion for the code. But I think the binding
>> would look a bit odd without the host physical address. We would now have:
>>
>> < [size] [guest address]>
>>
>> I think it would be more natural if we had
>>
>> <[guest address] [size]>
>>
>> And
>>
>> <[guest address] [size] [host physical address]>
>>
> 
> Ok, about the binding order change, do you prefer it in v7 or 4.17-post,
> since it may also need a few code tweak.

The binding will become stable as soon as we release 4.17. So this would 
need to be fixed before releasing.

Cheers,

-- 
Julien Grall

