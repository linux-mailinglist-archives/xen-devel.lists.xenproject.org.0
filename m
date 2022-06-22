Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6330D5552E5
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 19:57:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354274.581335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o44be-0007Gw-2E; Wed, 22 Jun 2022 17:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354274.581335; Wed, 22 Jun 2022 17:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o44bd-0007EG-Vm; Wed, 22 Jun 2022 17:57:33 +0000
Received: by outflank-mailman (input) for mailman id 354274;
 Wed, 22 Jun 2022 17:57:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o44bc-0007EA-Bm
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 17:57:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o44bb-0001xz-Pn; Wed, 22 Jun 2022 17:57:31 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.1.223]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o44bb-00083F-IJ; Wed, 22 Jun 2022 17:57:31 +0000
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
	bh=XT/bi/uIzrCH6IecR7ly/L3haTafrz73zG8pzJE4w4c=; b=65EpWa/smI+duGLKubLG/OI8Bu
	KUuthK0lpXjWsOViL+Z4YQr0aNSDCLg/NtfotTrKNORECMKXxSysebSunB4Lr25w4vNZK/oCDCi+n
	xvUTm9nDaBqfkBIpAmVu7Eq/zFIoN2wf3j+KsniqHR8OJw81CMxdMX9LU5y7kLtz6m/M=;
Message-ID: <90b86795-b9a8-a01d-1e92-5e7bcdb1ae7a@xen.org>
Date: Wed, 22 Jun 2022 18:57:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] xen/arm: smpboot: Allocate the CPU sibling/core maps
 while preparing the CPU
To: Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@arm.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 Julien Grall <jgrall@amazon.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220614094119.94720-1-julien@xen.org>
 <f60bd88a-90bc-60a9-be72-aa533315c55f@arm.com>
 <3ed8e44f-293d-958f-c144-466e16d034e2@xen.org>
 <55f45337-2da1-fe8f-b7a5-272577ed4d50@arm.com>
 <alpine.DEB.2.22.394.2206141723360.1837490@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2206141723360.1837490@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 15/06/2022 01:23, Stefano Stabellini wrote:
> On Tue, 14 Jun 2022, Michal Orzel wrote:
>> On 14.06.2022 13:08, Julien Grall wrote:
>>>>> +    unsigned int rc = 0;
>>>> ... here you are setting rc to 0 even though it will be reassigned.
>>>> Furthermore, if rc is used only in case of CPU_UP_PREPARE, why not moving the definition there?
>>>
>>> Because I forgot to replace "return NOTIFY_DONE;" with :
>>>
>>> return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
>> That is what I thought.
>> With these fixes you can add my Rb.
> 
> And also my
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks. I have committed this patch.

Cheers,

-- 
Julien Grall

