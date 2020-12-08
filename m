Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 543412D3256
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 19:47:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47667.84360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmi1S-0004UA-Ho; Tue, 08 Dec 2020 18:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47667.84360; Tue, 08 Dec 2020 18:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmi1S-0004Tl-EX; Tue, 08 Dec 2020 18:47:38 +0000
Received: by outflank-mailman (input) for mailman id 47667;
 Tue, 08 Dec 2020 18:47:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kmi1R-0004Tg-G1
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 18:47:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kmi1Q-0006Tv-7c; Tue, 08 Dec 2020 18:47:36 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kmi1Q-0007gh-0V; Tue, 08 Dec 2020 18:47:36 +0000
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
	bh=ENT6h8UNCHRxBm/mDi0sAcFmAXX8XKWlD5w1KWH69tE=; b=GKCWh5zCmqOJn6hamSdwxs5nSK
	RuwBJnBodx314KjyZVwgRuWJFrKJxwdeLNGGAhKpKUOaAW3iSYB46D2ZdL0es1R54rSYebBzSx+d6
	glgtp+N4sqjzQLN0VsKsBlMasbx1A1CbDRlje4hCkMMXIOM/NK4r6vrsHHwH7lRtm7Go=;
Subject: Re: [PATCH] xen/arm: Add workaround for Cortex-A53 erratum #845719
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Michal Orzel <Michal.Orzel@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
References: <20201208072327.11890-1-michal.orzel@arm.com>
 <d286241c-fd3b-8506-37e5-0ddcdaae97be@xen.org>
 <5D1B5771-A6B3-4F5E-81A1-864DBC8787B4@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <bf45e0f4-2de7-d1db-4732-342937bf61e7@xen.org>
Date: Tue, 8 Dec 2020 18:47:34 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <5D1B5771-A6B3-4F5E-81A1-864DBC8787B4@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 08/12/2020 14:38, Bertrand Marquis wrote:
> Hi Julien,
> 
>> On 8 Dec 2020, at 09:47, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 08/12/2020 07:23, Michal Orzel wrote:
>>> When executing in aarch32 state at EL0, a load at EL0 from a
>>> virtual address that matches the bottom 32 bits of the virtual address
>>> used by a recent load at (aarch64) EL1 might return incorrect data.
>>> The workaround is to insert a write of the contextidr_el1 register
>>> on exception return to an aarch32 guest.
>>
>> I am a bit confused with this comment. In the previous paragraph, you are suggesting that the problem is an interaction between EL1 AArch64 and EL0 AArch32. But here you seem to imply the issue only happen when running a AArch32 guest.
>>
>> Can you clarify it?
> 
> This can happen when switching from an aarch64 guest to an aarch32 guest so not only when there is interaction.

Right, but the context switch will write to CONTEXTIDR_EL1. So this case 
should already be handled.

Xen will never switch from AArch64 EL1 to AArch32 EL0 without a context 
switch (the inverse can happen if we inject an exception to the guest).

Reading the Cortex-A53 SDEN, it sounds like this is an OS and not 
Hypervisor problem. In fact, Linux only seems to workaround it when 
switching in the OS side rather than the hypervisor.

Therefore, I am not sure to understand why we need to workaroud it in Xen.

Cheers,

-- 
Julien Grall

