Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF7B637F59
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 19:57:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448026.704804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyHPV-0005sP-BJ; Thu, 24 Nov 2022 18:57:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448026.704804; Thu, 24 Nov 2022 18:57:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyHPV-0005pv-8S; Thu, 24 Nov 2022 18:57:21 +0000
Received: by outflank-mailman (input) for mailman id 448026;
 Thu, 24 Nov 2022 18:57:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oyHPS-0005pp-QU
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 18:57:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oyHPS-0003VV-Dr; Thu, 24 Nov 2022 18:57:18 +0000
Received: from [54.239.6.186] (helo=[192.168.1.238])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oyHPS-0006Ug-7S; Thu, 24 Nov 2022 18:57:18 +0000
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
	bh=yR+6Qol7h/zbe2k8iJ4QBQVvzuit0LZY6iElvEjKmpU=; b=jJZZhdLly97TW07FsvCRadJyhs
	WdMGww22ae4CQYuJJ8TziGG4UoojH6OjKoBb7qHoma2cMIrnx2bPM1MZIvFpRCxG/q/U8X1E9Rj1p
	qLo5nPYFvPuFiQ1tKCiZAfEisTkFcTwnMW67KW2tR9Z8L6gVn5XSTiXzaaZ2V+NO1Vts=;
Message-ID: <eedd5b2f-3d5c-aa85-5a86-98a8717568a1@xen.org>
Date: Thu, 24 Nov 2022 19:57:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v2] xen/arm: Do not route NS phys timer IRQ to Xen
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221028124937.27677-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221028124937.27677-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 28/10/2022 14:49, Michal Orzel wrote:
> At the moment, we route NS phys timer IRQ to Xen even though it does not
> make use of this timer. Xen uses hypervisor timer for itself and the
> physical timer is fully emulated, hence there is nothing that can trigger
> such IRQ. This means that requesting/releasing IRQ ends up as a deadcode
> as it has no impact on the functional behavior, whereas the code within
> a handler ends up being unreachable. This is a left over from the early
> days when the CNTHP IRQ was buggy on the HW model used for testing and we
> had to use the CNTP instead.
> 
> Remove the calls to {request/release}_irq for this timer as well as the
> code within the handler. Since timer_interrupt handler is now only used
> by the CNTHP, refactor it as follows:
>   - rename it to htimer_interrupt to reflect its purpose,
>   - remove the IRQ affiliation test,
>   - invert the condition to avoid indented code and use unlikely,
>   - improve readability by adding new lines \btw code and comments.
> 
> Keep the calls to zero the CNTP_CTL_EL0 register for sanity and also
> remove the corresponding perf counter definition.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

