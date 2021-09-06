Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61088401999
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 12:18:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179586.325926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNBhI-0007dO-Ko; Mon, 06 Sep 2021 10:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179586.325926; Mon, 06 Sep 2021 10:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNBhI-0007aJ-HO; Mon, 06 Sep 2021 10:17:52 +0000
Received: by outflank-mailman (input) for mailman id 179586;
 Mon, 06 Sep 2021 10:17:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mNBhG-0007aD-7o
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 10:17:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNBhG-0001JG-1F; Mon, 06 Sep 2021 10:17:50 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNBhF-00030S-R7; Mon, 06 Sep 2021 10:17:49 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=2AS3K2FbI2bd9Qg1w3F4RKn4dZ2PjVJc8kXf8TTYLZE=; b=DZo8XLD/EXOqvOcc85kZL0s9pa
	zz4LMwrPN1yu0acKVKzXtdGEgjtridSe1DScoiuanx6fGTjQwMZCdVKK0P3GNeRKI3a7AJgptiWJa
	Q/Rwihi2aUwpbXRFBApoTkwXm4p/pL8F8AZdIio58CLh7ctUNt0nyX3zfn+HJf09kJyA=;
Subject: Re: About Arm guests accessing to GICD_ICPENR
To: Hongda Deng <Hongda.Deng@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, nd <nd@arm.com>
References: <VE1PR08MB5677BABDFBBCA24B4ADA9C16E6D29@VE1PR08MB5677.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9152003b-87c6-f9ac-1754-db1eba86a6c3@xen.org>
Date: Mon, 6 Sep 2021 11:17:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <VE1PR08MB5677BABDFBBCA24B4ADA9C16E6D29@VE1PR08MB5677.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 06/09/2021 10:04, Hongda Deng wrote:
> Hi Julien,

Hi Hongda,

> Xen provides vGIC to support Xen guests, and currently xen will return IO
> unhandled when guests access GICD ICPENRn registers. This works fine with Linux
> guests, for Linux won't access these registers. But for Zephyr, this mechanism
> will cause IO dataabort on Zephyr's initialization which makes Zephyr get in
> fatal error.
>   
> One method to ease this is to let vGIC ignore GICD ICPENRn registers access. I
> tested it with Linux guests and Zephyr guests, and both works fine. And I found
> in this patch[1] that it would be more complex to touch the read part for
> I{S,C}PENDR and the write part for ICPENDR,

Read to I{S,C}PENDR should already return. AFAIK, what's left 
unimplemented is write to ICPENDR.

> so could we ignore GICD ICPENDRn
> registers access to ease Zephyr's initialization problem?
Would you be able to provide more information on how Zephyr is using it?

> 
> If Xen wants a complete GICD ICPENDRn emulation to fix it, do you have any
> suggestions.

Emulating ICPENDR is not easy with the existing vGIC. It would be great 
to finally have a vGIC spec compliant, but I also appreciate this is 
going to take some time.

Ignoring the access is probably the best we can do. However, this is 
also a risky approach because Zephyr (or another OS) may genuinely want 
to clear an already pending interrupt. So I would suggest to walk the 
interrupts that are meant to be modified and check whether they are 
already pending. If they are then print a message.

This would make clear to the developper that something may go wrong 
later on.

Cheers,

-- 
Julien Grall

