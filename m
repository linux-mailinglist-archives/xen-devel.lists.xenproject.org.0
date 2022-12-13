Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9B664B7AF
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 15:46:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460690.718646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p56Xt-0007XU-KT; Tue, 13 Dec 2022 14:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460690.718646; Tue, 13 Dec 2022 14:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p56Xt-0007VT-Gv; Tue, 13 Dec 2022 14:46:13 +0000
Received: by outflank-mailman (input) for mailman id 460690;
 Tue, 13 Dec 2022 14:46:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p56Xr-0007VN-LW
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 14:46:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p56Xr-00021s-C6; Tue, 13 Dec 2022 14:46:11 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.2.179]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p56Xr-0004zI-6E; Tue, 13 Dec 2022 14:46:11 +0000
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
	bh=KC9005s/KywlPJeKFn7yVMOxSsuA9eqqkyCG6iuoSZI=; b=Z5KCvuoA5yOEyQtMJUjeo1sslz
	hUtLXekPyrVxGjKuVuyah3H5p5m1ZHRjpEaszl8pLNvnLzmNEXgY3S4LBfT6B34iLReF/FXbe2BET
	bimr2Mc42qtiUMlhJoxm7tOj5RPXLXzgQjg0iP5jDJ7BmLCgHYATgdMYum7QiMRuXrBc=;
Message-ID: <728c43c9-895a-2126-a587-113d7041bf54@xen.org>
Date: Tue, 13 Dec 2022 14:46:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 1/3] xen/arm: Add memory overlap check for
 bootinfo.reserved_mem
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221205025753.2178965-1-Henry.Wang@arm.com>
 <20221205025753.2178965-2-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2212061716170.4039@ubuntu-linux-20-04-desktop>
 <8e635354-fdf4-a37f-0dba-c4b29063e152@xen.org>
 <alpine.DEB.2.22.394.2212071424060.4039@ubuntu-linux-20-04-desktop>
 <556d4b3f-3983-a336-f299-ce6b2b4a6e72@xen.org>
 <alpine.DEB.2.22.394.2212071534260.2730675@ubuntu-linux-20-04-desktop>
 <AS8PR08MB799135DFF656809F03039BE9921F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2212121327010.3075842@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2212121327010.3075842@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 12/12/2022 21:29, Stefano Stabellini wrote:
>>>> Personally, I think trying to share the code between the two types is a bit
>>>> odd. The logic is the same today, but I envision to merge reserved_mem,
>>> mem
>>>> and acpi in a single array (it would look like the E820) as this would make
>>>> easier to find the caching attributes per regions when mapping the RAM. So
>>>> sharing the code would not be possible.
>>>>
>>>> That said, if you really want to share the code between the two types. Then
>>> I
>>>> would prefer one of the following option:
>>>>     1) Provide a callback that is used to fetch the information from the array
>>>>     2) Provide a common structure that could be used by the function.
>>>>
>>>> This would match other generic function like sort & co.
>>>
>>> I think option 2) would be the best but I couldn't think of a simple way
>>> to do it (without using a union and I thought a union would not make
>>> things nicer in this case).
>>>
>>> Rather than option 1), I think I would rather have 2 different functions
>>> to check struct bootmodules and struct meminfo, or the macro.
>>
>> I personally don't have specific taste here. I think the option
>> is good one as long as we can (1) share most part of the code (2) make the
>> code easy to extend in the future. So as long as you two reach
>> a consensus here I will change to the agreed method in v2.
> 
> I think Julien and I already agree on having 2 separate functions to
> check for struct bootmodules and struct meminfo. Julien, I take you
> prefer the two separate functions to a MACRO, right?

In this case, yes because the macro would IMHO a bit too large.

Cheers,

-- 
Julien Grall

