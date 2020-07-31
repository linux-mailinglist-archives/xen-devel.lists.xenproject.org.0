Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD678234829
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 17:06:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Wbs-0000Uk-6W; Fri, 31 Jul 2020 15:06:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PAbA=BK=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k1Wbq-0000Uf-72
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 15:06:10 +0000
X-Inumbo-ID: 5d2ef908-d33f-11ea-abd0-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d2ef908-d33f-11ea-abd0-12813bfff9fa;
 Fri, 31 Jul 2020 15:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c01nQpnuMNKDRMqpXstX0sq2XzDK1emqrSyXjhCI+7Q=; b=gV77bL5olyvAGxLEE0MDSf3+Xy
 p8npeRT6AgeqoaI3J8za1Vghb262jeBlYU0nMv7UjPPza+e5/ewzqEOnN7wvxwUiPF4p7E6uBROIC
 BmMXeUNmbb95Y7mn/SzHqu7Z7nUysgs10GaBAcD8mHqjCSACjssDiuTqGMl+DzqasDPM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1Wbm-0004Vd-D0; Fri, 31 Jul 2020 15:06:06 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1Wbl-0008TT-Vu; Fri, 31 Jul 2020 15:06:06 +0000
Subject: Re: [PATCH v3] xen/arm: Convert runstate address during hypcall
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jan Beulich <jbeulich@suse.com>
References: <3911d221ce9ed73611b93aa437b9ca227d6aa201.1596099067.git.bertrand.marquis@arm.com>
 <f48f81d5-589e-3f75-1044-583114bf497e@xen.org>
 <d8eb8052-6370-7484-1c9a-f90d83396fa1@suse.com>
 <5301A49B-3404-4AC2-B04E-2BB969BABEED@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b59494b5-866e-30d9-7dfc-a4aa6366a91e@xen.org>
Date: Fri, 31 Jul 2020 16:06:03 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <5301A49B-3404-4AC2-B04E-2BB969BABEED@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Bertrand,

On 31/07/2020 14:09, Bertrand Marquis wrote:
> 
> 
>> On 31 Jul 2020, at 14:19, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 30.07.2020 22:50, Julien Grall wrote:
>>> On 30/07/2020 11:24, Bertrand Marquis wrote:
>>>> At the moment on Arm, a Linux guest running with KTPI enabled will
>>>> cause the following error when a context switch happens in user mode:
>>>> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0
>>>>
>>>> The error is caused by the virtual address for the runstate area
>>>> registered by the guest only being accessible when the guest is running
>>>> in kernel space when KPTI is enabled.
>>>>
>>>> To solve this issue, this patch is doing the translation from virtual
>>>> address to physical address during the hypercall and mapping the
>>>> required pages using vmap. This is removing the conversion from virtual
>>>> to physical address during the context switch which is solving the
>>>> problem with KPTI.
>>>
>>> To echo what Jan said on the previous version, this is a change in a
>>> stable ABI and therefore may break existing guest. FAOD, I agree in
>>> principle with the idea. However, we want to explain why breaking the
>>> ABI is the *only* viable solution.
>>>
>>>  From my understanding, it is not possible to fix without an ABI
>>> breakage because the hypervisor doesn't know when the guest will switch
>>> back from userspace to kernel space.
>>
>> And there's also no way to know on Arm, by e.g. enabling a suitable
>> intercept?

There is no easy way to do it. You might be able to route all EL0 
exceptions to EL2 using HCR_EL2.TGE, but this is basically disable EL1 
(kernel space). The amount of work required and the overhead is likely 
not worth it.

> 
> An intercept would mean that Xen gets a notice whenever a guest is switching
> from kernel mode to user mode.
> There is nothing in this process which could be intercepted by Xen, appart from
> maybe trapping all access to MMU registers which would be very complex and
> slow.

I agree. Although, even if it wasn't slow, there is no guarantee that 
any of those registers would be accessed during the switch.

You could implement a "dumb" KPTI by just removing the mappings from the 
page-tables.

Cheers,

-- 
Julien Grall

