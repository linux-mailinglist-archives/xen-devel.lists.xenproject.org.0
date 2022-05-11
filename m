Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 491E2523733
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 17:25:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327060.549774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nooDT-0000Zj-3G; Wed, 11 May 2022 15:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327060.549774; Wed, 11 May 2022 15:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nooDS-0000Wp-W1; Wed, 11 May 2022 15:25:30 +0000
Received: by outflank-mailman (input) for mailman id 327060;
 Wed, 11 May 2022 15:25:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nooDS-0000Wj-1p
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 15:25:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nooDQ-0001Ba-4T; Wed, 11 May 2022 15:25:28 +0000
Received: from [54.239.6.188] (helo=[192.168.11.111])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nooDP-00053R-U3; Wed, 11 May 2022 15:25:28 +0000
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
	bh=MWdG8HWRQtdjm7hYRurT4+xl1Cfh1altkzMduDCvyM0=; b=lqpX5UQ9NvVx28OsWFagpcFQ7s
	hemggjeaUSY6YpLmidM8DsvEAZTbZMrjngdQyzhqWwAR+AQ2UrzsH1uHgrJLHLR21mz5+DcDjue1e
	YTMqSlzrhxiGwAJ36WYvCsSCft88rDVC7vLE0zwOqp1xmu4kWpgtzB8Z7JhfGGTpt7K4=;
Message-ID: <9b6720d5-a4b1-3065-61ef-4341c2cd0933@xen.org>
Date: Wed, 11 May 2022 16:25:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v6 4/7] xen/arm: configure dom0less domain for enabling
 xenstore after boot
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
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
 <0f39d464-5a2c-a8f6-04c8-f96da7340003@xen.org>
 <4BEDB555-12F4-4A91-8D16-D83DBB1BE3CC@arm.com>
 <34b790af-c56a-26c7-e218-7961023b8605@xen.org>
 <9707ACA4-711A-4691-BA2A-FCDDAFFD9DE8@arm.com>
 <10151DF3-A3C9-49FB-8F2B-B36407E5CE82@arm.com>
 <573e94c4-7de0-e442-c9d8-559b55ae3144@xen.org>
 <3AC1200B-4F64-4828-8EAF-E6039E3613F1@arm.com>
 <4D04ACBD-014A-4A74-8B2C-6BCFB8D562A0@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4D04ACBD-014A-4A74-8B2C-6BCFB8D562A0@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/05/2022 16:05, Rahul Singh wrote:
>>> The property "xen,enhanced" with an empty string (or with the value "enabled") is meant to indicate that PV drivers will be usable in the domain.
>>>
>>> AFAIU, you are suggesting to change the meaning based on dom0 whether has been created. I don't particularly like that because a user may spent a while to understand why Xenstored doesn't work.
>>>
>>> The current proposal for xen,enhanced allows us to define new values if we wanted to only enabled selected interfaces. AFAIU, in your case, you only want to expose the event channel interface, so I would create a new value to indicate that the event channel interface is exposed. Xen would then create only the part for the event channel (i.e. no extended regions, grant tables...).
>>
>> Ok. I will create the new property something like “xen,evtchn” to enable the event-channel for dom0less guests.
>> Based on “xen,evtchn” property I will create the hypervisor node with only PPI interrupt property.
> 
> If we don’t want to create the new property we can use "xen,enhanced = evtchn” to
> enable the event-channel interfacefor dom0less guests.

I would prefer the "xen,enhanced = evtchn" because to avoid corner cases 
such as xen,enhanced without xen,evtchn

Cheers,

-- 
Julien Grall

