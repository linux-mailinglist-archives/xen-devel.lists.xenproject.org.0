Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C04A4567010
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 15:57:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361319.590767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8j2o-0000aJ-CL; Tue, 05 Jul 2022 13:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361319.590767; Tue, 05 Jul 2022 13:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8j2o-0000Xy-9S; Tue, 05 Jul 2022 13:56:50 +0000
Received: by outflank-mailman (input) for mailman id 361319;
 Tue, 05 Jul 2022 13:56:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o8j2m-0000Xs-96
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 13:56:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8j2l-0005eX-BT; Tue, 05 Jul 2022 13:56:47 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[10.7.237.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8j2l-0003tj-5X; Tue, 05 Jul 2022 13:56:47 +0000
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
	bh=D+dkj/jgym+ceY3z8amVg2pnE1tPUUK1qu/AlVLQbR4=; b=b9FFyiwaq3J4Ou15c5eu6720hW
	4sWz3d5fldOTGS23ubDBJ0IFNl4eZoZLCTQzOy5xc8GYKLH5KCLfINbu2ygPX8AdaKle38iv2YcNM
	dBb6od/MsvW0px6X9vPvEKoL5rR+DuvbJ8z22AFKCiMJQC7Dx5SvFje2lVPhQJqtYLys=;
Message-ID: <77952dd3-e777-f4ca-75d0-c168c10d46d0@xen.org>
Date: Tue, 5 Jul 2022 14:56:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 5/8] xen/evtchn: don't close the static event channel.
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <91656930b5bfd49e40ff5a9d060d7643e6311f4f.1655903088.git.rahul.singh@arm.com>
 <b64a7980-e51b-417b-4929-94a020c81438@xen.org>
 <7403EAA7-67A4-4A8D-835E-6015463B9016@arm.com>
 <a5cd291d-45b1-baf4-4d0b-907140b38eab@xen.org>
 <DC011AED-F74B-4055-8DEE-6FFC6FC5215C@arm.com>
 <dbdf3bb2-edc6-e622-f17a-8819f6fcb43d@xen.org>
 <67EA3F72-5F6D-4150-A9BA-EAF92E6C9EA1@arm.com>
 <289ebc8b-96f2-8764-5b17-680734e473fe@xen.org>
 <DCF75039-2719-4FC4-AA0A-2E5A00018823@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DCF75039-2719-4FC4-AA0A-2E5A00018823@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 05/07/2022 14:28, Rahul Singh wrote:
> Hi Julien,

Hi Rahul,

>> On 28 Jun 2022, at 4:18 pm, Julien Grall <julien@xen.org> wrote:
>>> a new driver in linux kernel, etc where right now we just need to introduce an extra IOCTL in linux to support this feature.
>>
>> I don't understand why would need a new driver, etc. Given that you are introducing a new IOCTL you could pass a flag to say "This is a static event channel so don't close it".
> 
> I tried to implement other solutions to this issue. We can introduce a new event channel state “ECS_STATIC” and set the
> event channel state to ECS_STATIC when Xen allocate and create the static event channels.

 From what you wrote, ECS_STATIC is just an interdomain behind but where 
you want Xen to prevent closing the port.

 From Xen PoV, it is still not clear why this is a problem to let Linux 
closing such port. From the guest PoV, there are other way to pass this 
information (see below).

> 
>  From guest OS we can check if the event channel is static (via EVTCHNOP_status()  hypercall ), if the event channel is
> static don’t try to close the event channel. If guest OS try to close the static event channel Xen will return error as static event channel can’t be closed.
Why do you need this? You already need a binding indicating which ports 
will be pre-allocated. So you could update your binding to pass a flag 
telling Linux "don't close it".

I have already proposed that before and I haven't seen any explanation 
why this is not a viable solution.

Cheers,

-- 
Julien Grall

