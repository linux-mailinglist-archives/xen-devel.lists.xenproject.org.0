Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E42F52FDFA
	for <lists+xen-devel@lfdr.de>; Sat, 21 May 2022 17:50:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334819.558902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nsRMM-0008Tj-L3; Sat, 21 May 2022 15:49:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334819.558902; Sat, 21 May 2022 15:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nsRMM-0008Qt-Hu; Sat, 21 May 2022 15:49:42 +0000
Received: by outflank-mailman (input) for mailman id 334819;
 Sat, 21 May 2022 15:49:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nsRMK-0008Qn-7R
 for xen-devel@lists.xenproject.org; Sat, 21 May 2022 15:49:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nsRMJ-0002LB-Rj; Sat, 21 May 2022 15:49:39 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nsRMJ-0007cA-LV; Sat, 21 May 2022 15:49:39 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	References:Cc:To:From:MIME-Version:Date:Message-ID;
	bh=r2AVLzgOm0aYjYZGuq/sADyxpZfz3+q/tII/NUlZQmY=; b=tfPzClU7U0YVDJfB6/kQIi5Z63
	8R1lOBHIrxRBebJ7tqNVxlz6mOm9Gyh84sZIkIIwkr+Zjhz/HJhgXDMsNcUtP7jQnzr41M/umqUeP
	p12G5zhWSO8dgs1IHGFS0zZ9aWOIUpUOp+wPmHwvktfTr6Qm+dunYa/z70uG6C0Cs734=;
Message-ID: <c1657e2c-4dc5-695d-8603-de147d25d436@xen.org>
Date: Sat, 21 May 2022 16:49:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
From: Julien Grall <julien@xen.org>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "marco.solieri@minervasys.tech" <marco.solieri@minervasys.tech>,
 "lucmiccio@gmail.com" <lucmiccio@gmail.com>, Julien Grall
 <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220309112048.17377-1-julien@xen.org>
 <20220309112048.17377-3-julien@xen.org>
 <DE3C6104-82AD-41AE-BDAA-0074A08DDECF@arm.com>
 <cf150c85-34cb-73fb-9808-0338de546271@xen.org>
 <4384DB81-5692-4F04-AA21-387B11A88C6E@arm.com>
 <f2fcee1f-a964-045b-3fc1-db0fccb847a3@xen.org>
Subject: Re: [PATCH early-RFC 2/5] xen/arm64: Rework the memory layout
In-Reply-To: <f2fcee1f-a964-045b-3fc1-db0fccb847a3@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25/03/2022 14:36, Julien Grall wrote:
>>>>> be loaded at (512GB + 2MB). This requires a slight tweak of the boot
>>>>> code as XEN_VIRT_START cannot be used as an immediate.
>>>>>
>>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>>>
>>>>> ---
>>>>>
>>>>>     TODO:
>>>>>         - I vaguely recall that one of the early platform we 
>>>>> supported add
>>>>>           the memory starting in high memory (> 1TB). I need to check
>>>>>           whether the new layout will be fine.
>>>> I think we have some Juno with some memory like that, tell me if you 
>>>> need help here.
>>>
>>> Would you be able to check the memory layout and confirm?
>>
>> I checked and the Juno we have as the high memory a lot lower than that:
>> RAM: 0000000880000000 - 00000009ffffffff
>>
>> No idea why it was a lot higher in my mind.
> 
> I have only encountered one board with the memory over 512GB. I can't 
> remember whether it is AMD Seattle or X-Gene.

So I found the answer. This was AMD Seattle where the memory start at 
512GB. So I will map Xen starting at 2TB (so there is a bit of slack).

Cheers,

-- 
Julien Grall

