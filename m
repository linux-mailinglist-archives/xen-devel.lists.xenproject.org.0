Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C5F1E6A32
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 21:14:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeNxl-0006Ir-7W; Thu, 28 May 2020 19:13:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lRPh=7K=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jeNxj-0006Ij-V2
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 19:13:08 +0000
X-Inumbo-ID: 43151b74-a117-11ea-9dbe-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43151b74-a117-11ea-9dbe-bc764e2007e4;
 Thu, 28 May 2020 19:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gdzdzxQWyHvqIMFrWwBAsCN6nbH5qSJ0n1v5OvUpoOQ=; b=0b+V7SJKjImsGb48pqt5Ah5RMD
 Pw4jdjvtNjdgdjFFi9ZYNouxShyeGwx2DUVdXjMSAvCYAFwmoNjLWcQ96B2/tWcPIDXAgNjhJEOxW
 xOhGm4h/7ZVn+Gy3gLTb1QuM3Lal/xDGTmMrNYHGEcO+y1X9Y9Bc4EEtYzItGyQQKxYo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jeNxe-0003b9-4q; Thu, 28 May 2020 19:13:02 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jeNxd-0002XH-TY; Thu, 28 May 2020 19:13:02 +0000
Subject: Re: [RFC PATCH 1/1] xen: Use a global mapping for runstate
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger@xen.org>
References: <cover.1590675919.git.bertrand.marquis@arm.com>
 <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
 <20200528165341.GH1195@Air-de-Roger>
 <B0CBD25E-49D8-4AE5-B424-83E9A05FBF58@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <de72ffe2-34a9-0b65-8d66-3f1322258d0c@xen.org>
Date: Thu, 28 May 2020 20:12:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <B0CBD25E-49D8-4AE5-B424-83E9A05FBF58@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 28/05/2020 18:19, Bertrand Marquis wrote:
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> int domain_kill(struct domain *d)
>>> {
>>>      int rc = 0;
>>> @@ -727,7 +788,10 @@ int domain_kill(struct domain *d)
>>>          if ( cpupool_move_domain(d, cpupool0) )
>>>              return -ERESTART;
>>>          for_each_vcpu ( d, v )
>>> +        {
>>> +            unmap_runstate_area(v, 0);
>>
>> Why is it not appropriate here to hold the lock? It might not be
>> technically needed, but still should work?
> 
> In a killing scenario you might stop a core while it was rescheduling.
> Couldn’t a core be killed using a cross core interrupt ?

You can't stop a vCPU in the middle of the context switch. The vCPU can 
only be scheduled out at specific point in Xen.

> If this is the case then I would need to do masked interrupt locking sections to prevent that case ?

At the beginning of the function domain_kill() the domain will be paused 
(see domain_pause()). After this steps none of the vCPUs will be running 
or be scheduled.

You should technically use the lock everywhere to avoid static analyzer 
throwing a warning because you access variable with and without the 
lock. A comment would at least be useful in the code if we go ahead with 
this.

As an aside, I think you want the lock to always disable the interrupts 
otherwise check_lock() (this can be enabled with CONFIG_DEBUG_LOCKS only 
on x86 though) will shout at you because your lock can be taken in both 
IRQ-safe and IRQ-unsafe context.

Cheers,

-- 
Julien Grall

