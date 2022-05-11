Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEA1522E95
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 10:39:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326607.549169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nohs7-0005mQ-K6; Wed, 11 May 2022 08:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326607.549169; Wed, 11 May 2022 08:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nohs7-0005kc-FJ; Wed, 11 May 2022 08:39:03 +0000
Received: by outflank-mailman (input) for mailman id 326607;
 Wed, 11 May 2022 08:39:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nohs6-0005kW-BS
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 08:39:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nohs4-0002Dd-BW; Wed, 11 May 2022 08:39:00 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nohs4-0003O1-5X; Wed, 11 May 2022 08:39:00 +0000
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
	bh=kgUC+Rs5Vn5//va/tKS75tf+yp0C6rGOJgWh8QYITi4=; b=Xr3imEWVCzvuP/UvQBnIu+zf+h
	JvON1wVg+RWHIA5Xk/g0CqNYcgjVEGd7VpJyQUxjhwvrtyQkoO4EI/HeYrhoW2oUyb4FvAJeXRnRh
	h/e5jdkal/POSzrxC22Z3UTVROePRwCfr1nUeOK3KAhVxdZM3bobUwTdmV5NPkJMSiQ8=;
Message-ID: <0f39d464-5a2c-a8f6-04c8-f96da7340003@xen.org>
Date: Wed, 11 May 2022 09:38:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v6 4/7] xen/arm: configure dom0less domain for enabling
 xenstore after boot
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
 <20220505001656.395419-4-sstabellini@kernel.org>
 <8011EAE7-7DF6-4342-B0BF-F64190099BA0@arm.com>
 <eab9afec-b023-ef7a-dc09-1b579c7f36b4@xen.org>
 <37C437B0-BF87-41C0-8FF1-0BF193C667C4@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <37C437B0-BF87-41C0-8FF1-0BF193C667C4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 11/05/2022 08:46, Bertrand Marquis wrote:
>> On 10 May 2022, at 17:35, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Rahul,
>>
>> On 10/05/2022 17:30, Rahul Singh wrote:
>>>> +    rc = evtchn_alloc_unbound(&alloc);
>>>> +    if ( rc )
>>>> +    {
>>>> +        printk("Failed allocating event channel for domain\n");
>>>> +        return rc;
>>>> +    }
>>>> +
>>>> +    d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN] = alloc.port;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> static int __init construct_domU(struct domain *d,
>>>>                                   const struct dt_device_node *node)
>>>> {
>>>> @@ -3214,6 +3243,14 @@ static int __init construct_domU(struct domain *d,
>>>>      if ( rc < 0 )
>>>>          return rc;
>>>>
>>>> +    if ( kinfo.dom0less_enhanced )
>>> I think we need to do something like this to fix the error.
>>>   if ( hardware_domain && kinfo.dom0less_enhanced )
>>> {
>>> }
>>
>> Is there any use case to use "dom0less_enhanced" without dom0 (or a domain servicing Xenstored)?
>>
> 
> Just being curious here but would it even be possible to have non dom0 domain servicing xenstored ?

You can build Xenstored against mini-os and configure the init script to 
launch xenstored as a domain.

> 
>> If not, then I would consider to forbid this case and return an error.
> 
> One way or an other we need to solve the crash but if it is forbidden we must prevent coming to this step earlier as it means the configuration is wrong.

I think this should be checked when parsing the configuration.

Cheers,

-- 
Julien Grall

