Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A555FEA9C
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 10:36:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422558.668658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojGAA-0005uQ-LS; Fri, 14 Oct 2022 08:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422558.668658; Fri, 14 Oct 2022 08:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojGAA-0005rW-I5; Fri, 14 Oct 2022 08:35:26 +0000
Received: by outflank-mailman (input) for mailman id 422558;
 Fri, 14 Oct 2022 08:35:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ojGA8-0005rQ-U5
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 08:35:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ojGA6-0004RP-DN; Fri, 14 Oct 2022 08:35:22 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.21.194]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ojGA6-0000LB-74; Fri, 14 Oct 2022 08:35:22 +0000
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
	bh=MLU3um5FtNsxGU7b3TCOORnq16lZtaM/jUFycCMHrY8=; b=ub04MmmndVrdMibdQ95PLPEEXV
	K9is6znfvBhxhpOD1YWf8GxyuiW2Ai9DfIp7TJPOtU8YJl9xUsMbanzPAd5IVQY2DtxU2/lYlqup3
	o9irPbDhjIt8iGklezsqVG4AfFx5PFVVX6jbl9vkqHLCU0oO7M3B8hqth7RR36p/aBCs=;
Message-ID: <a4a8fa5b-afff-0a49-7c06-b9be82669aac@xen.org>
Date: Fri, 14 Oct 2022 09:35:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH for-4.17 2/2] SUPPORT.md: Mark static heap feature as
 supported
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Henry Wang <Henry.Wang@arm.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>
References: <20221013025722.48802-1-Henry.Wang@arm.com>
 <20221013025722.48802-3-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2210131655530.3690179@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2210131655530.3690179@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 14/10/2022 00:55, Stefano Stabellini wrote:
> On Thu, 13 Oct 2022, Henry Wang wrote:
>> With the P2M pages pool bounding the domain memory runtime allocation
>> and the documented minimal size requirement of the static heap, it is
>> safe to mark static heap feature as supported.
> 
> Usually we wait at least one release cycle before marking a feature as
> supported. However, I can see that this case is a bit different because
> effectively static heap memory is a safety/security feature.

Even with patch #1 merged, we are still missing some information on how 
to size the heap. But see below...

> 
> Julien, Bertrand, I'll let you know decide on this one

It doesn't seem to make sense to security support the static heap when 
allocating statically memory for domains are still in tech preview.

That's because if you want to have your system security supported, then 
you will need all the allocations to come from the heap. At which point, 
restricting the heap seems pointless.

So I think it would be better to wait until the static memory is fully 
supported.

Cheers,

-- 
Julien Grall

