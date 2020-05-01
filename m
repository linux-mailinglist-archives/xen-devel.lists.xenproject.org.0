Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFD01C0FD4
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 10:41:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jURDY-0002bb-QV; Fri, 01 May 2020 08:40:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s7FD=6P=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jURDW-0002bW-VY
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 08:40:19 +0000
X-Inumbo-ID: 62c7ccfa-8b87-11ea-ae69-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62c7ccfa-8b87-11ea-ae69-bc764e2007e4;
 Fri, 01 May 2020 08:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BhBFqZ62xkew4T/rAsoiVvhDXft83XsDK8eCAT+fzq0=; b=A0PXYXRYqny8clbxvd2XrtEQf4
 bGA+4Ql4JU3JOKovzHqi4CIrvCHKkDV76M7P61cFGgNRecq9hGO7MGDYz9wDJlcZopy3hWbkscZ/3
 vXLzgrXbsjBIWDA+g883GmVJSXMXxeud27ctzkRnzU+g5AR/OROvYDV6yrV/ftb1i1rY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jURDV-00054H-6J; Fri, 01 May 2020 08:40:17 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jURDU-0002Vw-Vc; Fri, 01 May 2020 08:40:17 +0000
Subject: Re: [PATCH 09/12] xen/arm: if is_domain_direct_mapped use native
 addresses for GICv3
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-9-sstabellini@kernel.org>
 <923411c5-37d4-c86e-c5a8-8acd8a6830e7@xen.org>
 <alpine.DEB.2.21.2004301613220.28941@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <ab281b4d-c78f-15c3-57d3-85d0cef7bec8@xen.org>
Date: Fri, 1 May 2020 09:40:15 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004301613220.28941@sstabellini-ThinkPad-T480s>
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
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Stefano,

On 01/05/2020 02:31, Stefano Stabellini wrote:
> On Wed, 15 Apr 2020, Julien Grall wrote:
>>> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
>>> index 4e60ba15cc..4cf430f865 100644
>>> --- a/xen/arch/arm/vgic-v3.c
>>> +++ b/xen/arch/arm/vgic-v3.c
>>> @@ -1677,13 +1677,25 @@ static int vgic_v3_domain_init(struct domain *d)
>>
>>
>> I think you also want to modify vgic_v3_max_rdist_count().
> 
> I don't think so: domUs even direct-mapped still only get 1 rdist
> region. This patch is not changing the layout of the domU gic, it is
> only finding a "hole" in the physical address space to make sure there
> are no conflicts (or at least minimize the chance of conflicts.)

How do you know the "hole" is big enough?

> 
>>>         * Domain 0 gets the hardware address.
>>>         * Guests get the virtual platform layout.
>>
>> This comment needs to be updated.
> 
> Yep, I'll do
> 
> 
>>>         */
>>> -    if ( is_hardware_domain(d) )
>>> +    if ( is_domain_direct_mapped(d) )
>>>        {
>>>            unsigned int first_cpu = 0;
>>> +        unsigned int nr_rdist_regions;
>>>              d->arch.vgic.dbase = vgic_v3_hw.dbase;
>>>    -        for ( i = 0; i < vgic_v3_hw.nr_rdist_regions; i++ )
>>> +        if ( is_hardware_domain(d) )
>>> +        {
>>> +            nr_rdist_regions = vgic_v3_hw.nr_rdist_regions;
>>> +            d->arch.vgic.intid_bits = vgic_v3_hw.intid_bits;
>>> +        }
>>> +        else
>>> +        {
>>> +            nr_rdist_regions = 1;
>>
>> What does promise your the rdist region will be big enough to cater all the
>> re-distributors for your domain?
> 
> Good point. I'll add an explicit check for that with at least a warning.
> I don't think we want to return error because the configuration it is
> still likely to work.

No it is not going to work. Imagine you have have a guest with 3 vCPUs 
but the first re-distributor region can only cater 2 re-distributor. How 
is this going to be fine to continue?

For dom0, we are re-using the same hole but possibly not all of them. 
Why can't we do that for domU?

Cheers,

-- 
Julien Grall

