Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FAB950E45
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 23:03:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776639.1186814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdyfK-0000vT-Qx; Tue, 13 Aug 2024 21:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776639.1186814; Tue, 13 Aug 2024 21:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdyfK-0000t7-Nv; Tue, 13 Aug 2024 21:02:50 +0000
Received: by outflank-mailman (input) for mailman id 776639;
 Tue, 13 Aug 2024 21:02:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sdyfK-0000t1-0L
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 21:02:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sdyfJ-00078u-Ir; Tue, 13 Aug 2024 21:02:49 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sdyfJ-0008BF-E5; Tue, 13 Aug 2024 21:02:49 +0000
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
	bh=ecsivWuiDBHCZCG209lFjyMnxbqzt05UtU0c470VEYg=; b=hR1NQV7FKNJzEtkBogT9bh6HiQ
	PV9b3QXMuTlqwSmse89dVAcQ1YRT9maY4FGNP9xFJemcVoNwtmYocjXDW5rnzR8q9Fvkymc5oDUF1
	LxUCnmSF/cRyVa2MpKLncJpaGVBxuxFrB//IjSh1JAniGop9VT6tIcfrqhBxcKkC4QzE=;
Message-ID: <2912b3cc-813d-43e5-bcf3-8e3182592776@xen.org>
Date: Tue, 13 Aug 2024 22:02:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: char: omap-uart: add "clock-hz" option
Content-Language: en-GB
To: Amneesh Singh <a-singh21@ti.com>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240719113313.145587-1-a-singh21@ti.com>
 <b7ef34fe-f6eb-45e8-8f6a-0e2c4bd0175b@xen.org>
 <njlq7laeswww46izwpkzuvnvu3lcycv7kc6dt2urbrpimj6uej@tzjuwwhwwqmp>
 <8c12dc98-bc9f-49bf-bc18-ddae99fa7312@xen.org>
 <csvohhbfi7ilqjzmozhb7u75jp7kfncpyj335hz5vksjw7lr46@57puayor4b4r>
 <ff6a7077-efbb-4002-9426-a9f05760f8f8@xen.org>
 <pm2tulzvwuexw6stt2gx6nxbhnmqy36tbswde7j26wtq3x6wob@hyxxarp32or5>
From: Julien Grall <julien@xen.org>
In-Reply-To: <pm2tulzvwuexw6stt2gx6nxbhnmqy36tbswde7j26wtq3x6wob@hyxxarp32or5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Amneesh,

Sorry for the late answer.

On 06/08/2024 12:50, Amneesh Singh wrote:
>> need to specify the clockspeed on the command line. I think we should
>> investigate other approaches such as implementing partially
>> clk_get_rate() (if this is how Linux manage to retrieve the clock speed
>> without any command line option).
> I guess, we can just ditch the entire idea, and just use the a default
> fallback and just print a message informing the user that there is no
> frequency in the DT. I do not think implementing clk_get_rate (or any
> clock API) is feasible or worth the effort to be completely honest.
> What do you think? I do not particularly have any issues with that. I
> feel like this is a niche case (at least now) anyway.

Michal, Stefano and I had a chat. We agree that implementing 
clk_get_rate() may be too complex. So the best next solution is to ask 
the user to update the DT and read the property from Xen.

Cheers,

-- 
Julien Grall

