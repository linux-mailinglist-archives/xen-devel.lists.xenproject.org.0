Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9364C4C4F54
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 21:12:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279587.477339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNgx6-0007ps-KS; Fri, 25 Feb 2022 20:12:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279587.477339; Fri, 25 Feb 2022 20:12:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNgx6-0007nS-HA; Fri, 25 Feb 2022 20:12:32 +0000
Received: by outflank-mailman (input) for mailman id 279587;
 Fri, 25 Feb 2022 20:12:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nNgx5-0007nM-1H
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 20:12:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNgx4-0001X0-Ts; Fri, 25 Feb 2022 20:12:30 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.31.13]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNgx4-0007F0-OI; Fri, 25 Feb 2022 20:12:30 +0000
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
	bh=Auvgj0/rbJfyJ5LgCODNKZpgZL4w/Q0O9qQG2SfrTQs=; b=FriGTSWkjjaMTD2iIfiddiNIFW
	gjT1DhKmKoPLpNXOO5qWqnN1L/Hshzq4kMIlOGOAVoeBriZQ2EKqR8Bu+uWCnoi5hFKrqS67rhZpK
	oEU0HtaAz7ZkZeTKvWPYG0GiKVisM5iW9Pbgo6+bRBsmDzFhNXfsdvQfsA9GdgNVl850=;
Message-ID: <4c558f8f-56d4-0445-32d4-169bc5d0a3bc@xen.org>
Date: Fri, 25 Feb 2022 20:12:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: Proposal for Porting Xen to Armv8-R64 - DraftA
To: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Penny Zheng <Penny.Zheng@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 nd <nd@arm.com>
References: <PAXPR08MB7420A01809B84E04E196793F9E3D9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2202241606450.239973@ubuntu-linux-20-04-desktop>
 <AS1PR08MB74269923288B75097392BDD99E3E9@AS1PR08MB7426.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS1PR08MB74269923288B75097392BDD99E3E9@AS1PR08MB7426.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Wei,

On 25/02/2022 10:48, Wei Chen wrote:
>> >     Armv8-R64 can support max to 256 MPU regions. But that's just
>> theoretical.
>> >     So we don't want to define `pr_t mpu_regions[256]`, this is a memory
>> waste
>> >     in most of time. So we decided to let the user specify through a
>> Kconfig
>> >     option. `CONFIG_ARM_MPU_EL1_PROTECTION_REGIONS` default value can be
>> `32`,
>> >     it's a typical implementation on Armv8-R64. Users will recompile Xen
>> when
>> >     their platform changes. So when the MPU changes, respecifying the
>> MPU
>> >     protection regions number will not cause additional problems.
>> 
>> I wonder if we could probe the number of MPU regions at runtime and
>> dynamically allocate the memory needed to store them in arch_vcpu.
>> 
> 
> We have considered to used a pr_t mpu_regions[0] in arch_vcpu. But it seems
> we will encounter some static allocated arch_vcpu problems and sizeof issue.

Does it need to be embedded in arch_vcpu? If not, then we could allocate 
memory outside and add a pointer in arch_vcpu.

Cheers,

-- 
Julien Grall

