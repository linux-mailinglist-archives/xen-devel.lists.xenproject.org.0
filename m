Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 388F666622E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 18:42:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475664.737428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFf66-0007Wg-VR; Wed, 11 Jan 2023 17:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475664.737428; Wed, 11 Jan 2023 17:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFf66-0007Tv-S6; Wed, 11 Jan 2023 17:41:10 +0000
Received: by outflank-mailman (input) for mailman id 475664;
 Wed, 11 Jan 2023 17:41:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pFf65-0007Tp-Sz
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 17:41:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pFf65-0006Vr-ML; Wed, 11 Jan 2023 17:41:09 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.5.208]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pFf65-0000Am-GH; Wed, 11 Jan 2023 17:41:09 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=fv3MXOu6EuolHTnQDcmuRLHyg/qPSeb3PzTxILBhHN8=; b=dv7SVcKhR+mtH7H4vfq+alyXYz
	01aYzpxEVaPQfeNfZcLvYAxF9K4MBEEIOGPyBXKjvNkmfFD/GdQHSQKRC9vlV5SG69HKWN5IxtZRJ
	NDhIpDFi62cv+0jd0oz4E8dKaMhRw9DbT9QfXo6YqPOuOyPBiFx8m8j2ldmddbTF3CiU=;
Message-ID: <3e7059c2-0d23-03f2-9a93-f88de09171f4@xen.org>
Date: Wed, 11 Jan 2023 17:41:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: Xenalyze on ARM ( NXP S32G3 with Cortex-A53)
Content-Language: en-US
To: El Mesdadi Youssef ESK UILD7 <youssef.elmesdadi@zf.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <AM5PR0802MB25781717167B5BFC980BF2A49DFF9@AM5PR0802MB2578.eurprd08.prod.outlook.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AM5PR0802MB25781717167B5BFC980BF2A49DFF9@AM5PR0802MB2578.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+Stefano)

On 10/01/2023 14:20, El Mesdadi Youssef ESK UILD7 wrote:
>>> Hello,
> 
>>>
> I'm trying to measure the performance of Xen on the S32G3 microprocessor, unfortunately, after following the BSP-Linux to install Xen, I found that Xentrace is not available or not compatible with ARM architecture. I have seen some studies on  Xilinx, and how they made Xentrace compatible with ARM, but I have no resources or access to get that and make it work on my Board. If there is any help I would appreciate it and thanks in advance.

xentrace should work on upstream Xen. What did you version did you try? 
Can you also clarify the error you are seen?

> 
>>> I have some extra questions, and it will be helpful to share your ideas with me,
> 
> 
>    *   Is it possible to run a native application ( C-code) on the virtual machine, turn on a LED,  have access to the GPIO, or send some messages using Can-Interface?

Yes if you assign (or provide para-virtualized driver) the 
GPIO/LED/Can-Interface to the guest.

>    *   My Board has no Ethernet, and no Extern SD Card, is there any method I can use to build a kernel for an operating system with my laptop, and transfer it to the board?

I am confused, if you don't have network and an external sdcard, then 
you did you first put Xen on your system?

In theory you could transfer the binary (using base64) via the serial 
console. But that's hackish. Instead, I would recommend to speak with 
the board vendor and ask them how you can upload your own software.

>    *   Any suggestions in detail to measure the interrupt latency, Xen Overhead, and switch context (time to switch from one VM to another, that's what I wanted to measure with Xenalyze)

xentrace will be your best bet. Otherwise, you will need to implement 
custom tracing.

Cheers,

-- 
Julien Grall

