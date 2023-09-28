Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA6C7B160A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 10:31:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609368.948414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlmPw-0001R9-LU; Thu, 28 Sep 2023 08:30:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609368.948414; Thu, 28 Sep 2023 08:30:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlmPw-0001P1-It; Thu, 28 Sep 2023 08:30:40 +0000
Received: by outflank-mailman (input) for mailman id 609368;
 Thu, 28 Sep 2023 08:30:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qlmPv-0001Ov-A0
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 08:30:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qlmPu-0007Uf-7j; Thu, 28 Sep 2023 08:30:38 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qlmPu-0002S1-2O; Thu, 28 Sep 2023 08:30:38 +0000
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
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=oyaGeOMJ9cRvPlQOEWWEOBBZ5rEzbY7JIVr6SlN+veI=; b=ulG0Z34gkmag8O12plsl2Qs9Qr
	YwDiw4MxplNdSQw2PiNqldLFlsdtMvOid8+5UBkCmOYCRTY9wWjVFmIE35T5wDN6jDb/uLO+mqO7P
	IH+hsiJM4SUCVV3i8djy/dk1rbuM+WTw3LEuIT/IrNOW7K+k5kosXM+qnTJ7DllN1HyA=;
Message-ID: <7aeea21c-a2e5-4619-b177-e433e50bd4f4@xen.org>
Date: Thu, 28 Sep 2023 09:30:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen(arm64) hang on suspend/resume
Content-Language: en-GB
To: Jonas Blixt <jonas.blixt@actia.se>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <3c79ea2fec984e21b07d9365c08a5862@actia.se>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3c79ea2fec984e21b07d9365c08a5862@actia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/09/2023 12:15, Jonas Blixt wrote:
> Hello,

Hi,

> 
> I've encountered a strange behavior with Xen on arm64 with regards to suspend/resume.
> 
> My setup:
> Version: Xen 4.13.1

This has been relaesed in 2019 and not even the latest point release for 
4.13 (it is 4.13.5). For new development, I would strongly recommend to 
use the latest stable (4.17) if not staging.

But you should at least use the lastest point release (4.13.5). Note 
that this tree is not anymore supported at all by the community. So it 
may contain (security) bugs.

> Target: NXP imx8x SoC
> 
> We also use a set of patches from Aggios (https://xen-devel.narkive.com/yGps0HKG/rfc-v2-xen-arm-suspend-to-ram-support-in-xen-for-arm)

There was a new version of the series sent in 2022 [1]. This is based on 
a more recent Xen (4.16). I would suggest to give a try and check if it 
helps.

Note that this series is still in development and has not yet been 
accepted by the community. So if there are any bugs, then I would 
recommend to contact the original author.


> Occasionally xen gets stuck on resume. We know that the lower levels wake up and xen starts to resume because xen's debug console is available. When we're in this state dom0 does not resume and both pCPU's are in idle loops. If we at this point issue debug console commands (like 'h' for the help menu) that schedule tasklets dom0 wakes up and continues. Debug function that run in the irq-handler does not have the same effect.

It sounds like the dom0 vCPUs were not unblocked. That said, it is 
unclear why 'h' would help. Would you be able to print the field 
'pause_flags' for each vCPU?

You could use the key 'q' to dump all the domain information. Hopefully, 
this doesn't have a side-effect. If it has, then I would suggest to add 
some printk at boot.

Cheers,

[1] https://lore.kernel.org/cover.1665128335.git.mykyta_poturai@epam.com

-- 
Julien Grall

