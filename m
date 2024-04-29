Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2998B63E4
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 22:56:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714397.1115604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Y2R-0001yI-E0; Mon, 29 Apr 2024 20:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714397.1115604; Mon, 29 Apr 2024 20:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Y2R-0001wx-BH; Mon, 29 Apr 2024 20:55:51 +0000
Received: by outflank-mailman (input) for mailman id 714397;
 Mon, 29 Apr 2024 20:55:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s1Y2P-0001wr-J8
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 20:55:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s1Y2P-00064K-3u; Mon, 29 Apr 2024 20:55:49 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s1Y2O-0001US-Sx; Mon, 29 Apr 2024 20:55:49 +0000
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
	bh=IXrDxMWNKpOf7W2trHGjEVSGA+Mdk4h//e4JzWzIO6k=; b=zaXMHcRO/ss043QBIm2bPYD5Gg
	ur7AFC2drz+pA9Vju6J1BjebKvwP3l/v2DL4mkTQo7Hubj+J8lT9vK3beJH4+hSu2Imt8IkWtOVdq
	HSZQQIFNTqBUiS06I1nWy8GKZpcGxTS4oRrzyCRnTC5JdhxpdFhwq59vIdvC2SodNcrM=;
Message-ID: <72eef04f-b155-4f7e-a216-146f3dce993c@xen.org>
Date: Mon, 29 Apr 2024 21:55:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 5/5] xen/arm: ffa: support notification
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "patches@linaro.org" <patches@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240426084723.4149648-1-jens.wiklander@linaro.org>
 <20240426084723.4149648-6-jens.wiklander@linaro.org>
 <c7a672a7-02f8-4d24-b87e-1b8439d7eb4c@xen.org>
 <1A23083C-9605-4291-AF2F-5891AF270333@arm.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <1A23083C-9605-4291-AF2F-5891AF270333@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 29/04/2024 08:20, Bertrand Marquis wrote:
>  From the comment in sched.h:
> /*
>   * rcu_lock_domain_by_id() is more efficient than get_domain_by_id().
>   * This is the preferred function if the returned domain reference
>   * is short lived,  but it cannot be used if the domain reference needs
>   * to be kept beyond the current scope (e.g., across a softirq).
>   * The returned domain reference must be discarded using rcu_unlock_domain().
>   */
> 
> Now the question of short lived should be challenged but I do not think we can
> consider the current code as "long lived".

Actually, I am not entirely sure you can use put_domain() in interrupt 
context. If you look at the implementation of domain_destroy() it takes 
a spin lock without disabling the interrupts.

The same spinlock is taken in domain_create(). So there is a potential 
deadlock.

Which means the decision between the two is not only about liveness.

Cheers,

-- 
Julien Grall

