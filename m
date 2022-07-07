Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E8B56A707
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 17:34:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363056.593380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9TVw-0006Kz-R3; Thu, 07 Jul 2022 15:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363056.593380; Thu, 07 Jul 2022 15:34:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9TVw-0006JC-OB; Thu, 07 Jul 2022 15:34:00 +0000
Received: by outflank-mailman (input) for mailman id 363056;
 Thu, 07 Jul 2022 15:33:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o9TVv-0006J6-3L
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 15:33:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o9TVu-0000qG-Rb; Thu, 07 Jul 2022 15:33:58 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[10.7.237.13])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o9TVu-0008Pw-J2; Thu, 07 Jul 2022 15:33:58 +0000
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
	bh=rnJfiPsQmWZTbshkN65fFEtDQJwuywOCItlDl6yv4wQ=; b=ms5rDl8un0quL02IR424v6gTIH
	x0PVHQeUMlVt1YrGfgfdWfIBKBr9vObZw9SFaXE2n48TsDr68Emr3psvaaVvimuAZ6hIzUOqS8X0h
	s+0AbVU9o6W3L4hPEwWMpVxJm41zY6H6lBHRzd40TL5gfblLL56PZTj5R9wg3IcHP9AY=;
Message-ID: <cfb037a8-ac32-90a8-b527-d259f013e30c@xen.org>
Date: Thu, 7 Jul 2022 16:33:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v4] xen/arm: avoid overflow when setting vtimer in context
 switch
To: Jiamei Xie <jiamei.xie@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20220706082558.1116811-1-jiamei.xie@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220706082558.1116811-1-jiamei.xie@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jiamei,

On 06/07/2022 09:25, Jiamei Xie wrote:
> virt_vtimer_save() will calculate the next deadline when the vCPU is
> scheduled out. At the moment, Xen will use the following equation:
> 
>    virt_timer.cval + virt_time_base.offset - boot_count
> 
> The three values are 64-bit and one (cval) is controlled by domain. In
> theory, it would be possible that the domain has started a long time
> after the system boot. So virt_time_base.offset - boot_count may be a
> large numbers.
> 
> This means a domain may inadvertently set a cval so the result would
> overflow. Consequently, the deadline would be set very far in the
> future. This could result to loss of timer interrupts or the vCPU
> getting block "forever".
> 
> One way to solve the problem, would be to separately
>     1) compute when the domain was created in ns
>     2) convert cval to ns
>     3) Add 1 and 2 together
> 
> The first part of the equation never change (the value is set/known at
> domain creation). So take the opportunity to store it in domain structure.
> 
> Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

The commit message is my own, I would like to Bertrand or Stefano to 
confirm they are happy with it :).

Cheers,

-- 
Julien Grall

