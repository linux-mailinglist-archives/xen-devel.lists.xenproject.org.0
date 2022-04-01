Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DB34EE9D2
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 10:36:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297272.506332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naClJ-0003tp-C3; Fri, 01 Apr 2022 08:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297272.506332; Fri, 01 Apr 2022 08:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naClJ-0003rN-85; Fri, 01 Apr 2022 08:36:05 +0000
Received: by outflank-mailman (input) for mailman id 297272;
 Fri, 01 Apr 2022 08:36:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1naClH-0003rH-Md
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 08:36:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naClH-0000cB-87; Fri, 01 Apr 2022 08:36:03 +0000
Received: from [54.239.6.189] (helo=[192.168.18.123])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naClH-0007JR-1R; Fri, 01 Apr 2022 08:36:03 +0000
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
	bh=CveRPQi/o9UbDyGR19L62x+fJcdwB+G3zOCh9jvbha0=; b=pwvT14ZhaP9+jU21zYBObD0EsX
	rsyoC+DU2QJb0S/YOBvz5R6ZjoSUdBb0jrrmx3TBho0enNtp+SP1Oxmd30sER3b9egF+kuMDvKFo9
	Ly4EgYh7KCn+Gvvdyldh1MEtSp1Kod8IH3GB4F/oqweDcYBxjsiWXOyStRy9UP23Vj/c=;
Message-ID: <d7fa66f4-6053-8c1c-3fb0-29e419f7591e@xen.org>
Date: Fri, 1 Apr 2022 09:36:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 3/5] xen/arm: configure dom0less domain for enabling
 xenstore after boot
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com,
 Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop>
 <20220128213307.2822078-3-sstabellini@kernel.org>
 <e55c03f6-5b20-ce9c-ce88-11dc85623dce@xen.org>
 <alpine.DEB.2.22.394.2203221722430.2910984@ubuntu-linux-20-04-desktop>
 <799f69b2-f581-9f5f-004a-8f9f790aba2a@xen.org>
 <alpine.DEB.2.22.394.2203311341220.2910984@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2203311341220.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 01/04/2022 01:34, Stefano Stabellini wrote:
>>> Because (as you noted as a comment to the following patch) as soon as
>>> d->arch.hvm.params[HVM_PARAM_STORE_PFN] is set the guest can continue
>>> with the initialization and will expect the right data to be set on the
>>> page.
>>
>> I think you misunderstood my question. From my understanding, at the moment,
>> Linux would break with your proposal. So you need to modify the kernel in
>> order to support what you are doing.
> 
> Linux does not break with this proposal. I wrote a longer explanation
> [1] some time ago.

I guess I should not have written "broken" here. But instead point out 
that...

> 
> In short: the master branch and any supported versions of Linux boots
> fine with this proposal without changes, however it wouldn't be able to
> use PV drivers when started as dom0less kernel.
> 
> To be able to use the new feature, this patch is required [2].

... without the extra patch is Linux, you would not be able to take 
advantage of this feature.

>> IOW, we have room to decide the approach here.
>>
>> Xenstore protocol has a way to allow (re)connection (see
>> docs/mics/xenstore-ring.txt). This feature looks quite suited to what you are
>> trying to do here (we want to delay the connection).
>>
>> The main advantage with this approach is the resources allocation for Xenstore
>> will be done in the place and the work in Linux could be re-used for
>> non-dom0less domain.
>>
>> Have you explored it?
> 
> Luca (CCed) is the original author. I don't know if he explored that
> approach. I have not looked into it in any details but I think there
> might be challenges: in this case there is nothing on the shared page.
> There are no feature bits as it has not been initialized (xenstored is
> the one initializating it).
I agree there is nothing today. But here, we have the liberty to 
initialize the feature bits in Xen.

> 
> Keep in mind that Luca and I have done many tests on this approach, both
> the Xen side, the Linux side (very many different kernel versions) and
> complex configurations (both network and block PV drivers, DMA mastering
> devices, etc.) If we changed approach now we would lose some of the
> value of the past efforts.

I appreciate the effort you put into testing this approach. However, 
this is an external interface that we will consider stable as soon as 
the two sides (Xen and Linux) are committed. So I want to make sure we 
are not putting ourself in a corner.

One major issue I can forsee with your approach is the xenstore 
initialization seem to only works for HVM. In theory, we may have the 
same need for PV (e.g. in the case of Hyperlaunch).

How would your proposal work for PV guest?

Note that I now that PV guest may not work without Xenstore. But I don't 
see any reason why we could not start them before Xenstored.

Cheers,

-- 
Julien Grall

