Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F066364E6
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 16:55:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447665.704155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxs5l-0005Gd-Qs; Wed, 23 Nov 2022 15:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447665.704155; Wed, 23 Nov 2022 15:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxs5l-0005Eb-Na; Wed, 23 Nov 2022 15:55:17 +0000
Received: by outflank-mailman (input) for mailman id 447665;
 Wed, 23 Nov 2022 15:55:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oxs5j-0005EV-Kk
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 15:55:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxs5h-0000SR-3F; Wed, 23 Nov 2022 15:55:13 +0000
Received: from [54.239.6.185] (helo=[192.168.17.134])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxs5g-0000W6-QT; Wed, 23 Nov 2022 15:55:13 +0000
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
	bh=2DU5FXefMwkpxT5iu9q9AFV/I8ZqbL11hribnK80jCI=; b=hGyF218PFjA015KXQz/iDoOFYK
	/NCIKJK8zm0mPhYqOBZ0bEVzE9RxUnpeG4mmTM/4ljsrbBkvU1uGZANVS6HncLXUcq8za84sLHqDo
	H+HsMzz1yKIxxHUVv27hBrQhw1k1wrn7HkqnmBJw+DbUv/3m1shYOuVsgjvewJ21KOSI=;
Message-ID: <ac30e532-7ea5-4dec-9dbb-203daaa80e31@xen.org>
Date: Wed, 23 Nov 2022 16:55:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH] xen/arm: Fix unreachable panic for vpl011 vIRQ
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221123143913.6527-1-michal.orzel@amd.com>
 <29E29CB0-35F8-4961-9197-14E8CD7C43CA@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <29E29CB0-35F8-4961-9197-14E8CD7C43CA@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/11/2022 15:22, Bertrand Marquis wrote:
> Hi Michal,
> 
>> On 23 Nov 2022, at 14:39, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> When creating direct mapped domU, the vIRQ for vpl011 is taken from
>> the SERHND_DTUART serial port using serial_irq. This function can return
>> -1 (i.e. no interrupt found) in which case we should call a panic.
>> However, vpl011_virq is defined as unsigned int which causes the panic
>> to be unreachable, because less than zero comparison of an unsigned value
>> can never be true. Fix it by defining vpl011_virq as int.
>>
>> Fixes: 3580c8b2dfc3 ("xen/arm: if direct-map domain use native UART address and IRQ number for vPL011")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> 
>> ---
>> To be considered to be taken for 4.17, although direct-map depends on
>> CONFIG_STATIC_MEMORY which is marked as unsupported.
> 
> At this stage I do not think we should back port it for the release.
> We should consider this as candidate for 4.17.1

We don't usually backport fixes for tech preview feature.

Cheers,

-- 
Julien Grall

