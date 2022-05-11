Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3944A5233BF
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 15:12:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326854.549498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nom88-00070e-R6; Wed, 11 May 2022 13:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326854.549498; Wed, 11 May 2022 13:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nom88-0006xj-N3; Wed, 11 May 2022 13:11:52 +0000
Received: by outflank-mailman (input) for mailman id 326854;
 Wed, 11 May 2022 13:11:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nom87-0006xd-9c
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 13:11:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nom85-00073B-As; Wed, 11 May 2022 13:11:49 +0000
Received: from [54.239.6.188] (helo=[192.168.11.111])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nom85-0005AN-3W; Wed, 11 May 2022 13:11:49 +0000
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
	bh=6LJxQpv+6Ai1F95mbhnxAR79VlXpP1nEcK0rK4efYAM=; b=xR+ca6Q4A2ZfeR9tomz2l5SypC
	+qxrcez3w9lJ6e61iQavSbCPncZ0iD0gfDAOaC7iJJX8Avp+LXymBq96EWBSoSWhMwAzRqUdNRC5z
	qL62Et9SH0UTihYmGYyX/sgy2lEosM5T9WVQrdp64wwgxWIYjS6QELrHgEQNyvSFFmZU=;
Message-ID: <573e94c4-7de0-e442-c9d8-559b55ae3144@xen.org>
Date: Wed, 11 May 2022 14:11:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v6 4/7] xen/arm: configure dom0less domain for enabling
 xenstore after boot
To: Rahul Singh <Rahul.Singh@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <10151DF3-A3C9-49FB-8F2B-B36407E5CE82@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Rahul,

On 11/05/2022 11:53, Rahul Singh wrote:
>> On 11 May 2022, at 10:18 am, Bertrand Marquis <Bertrand.Marquis@arm.com> wrote:
>>
>> Hi Julien,
>>
>>> On 11 May 2022, at 10:10, Julien Grall <julien@xen.org> wrote:
>>>
>>> Hi Bertrand,
>>>
>>> On 11/05/2022 09:46, Bertrand Marquis wrote:
>>>>> On 11 May 2022, at 09:38, Julien Grall <julien@xen.org> wrote:
>>>>>
>>>>> Hi Bertrand,
>>>>>
>>>>> On 11/05/2022 08:46, Bertrand Marquis wrote:
>>>>>>> On 10 May 2022, at 17:35, Julien Grall <julien@xen.org> wrote:
>>>>>>>
>>>>>>> Hi Rahul,
>>>>>>>
>>>>>>> On 10/05/2022 17:30, Rahul Singh wrote:
>>>>>>>>> + rc = evtchn_alloc_unbound(&alloc);
>>>>>>>>> + if ( rc )
>>>>>>>>> + {
>>>>>>>>> + printk("Failed allocating event channel for domain\n");
>>>>>>>>> + return rc;
>>>>>>>>> + }
>>>>>>>>> +
>>>>>>>>> + d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN] = alloc.port;
>>>>>>>>> +
>>>>>>>>> + return 0;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> static int __init construct_domU(struct domain *d,
>>>>>>>>> const struct dt_device_node *node)
>>>>>>>>> {
>>>>>>>>> @@ -3214,6 +3243,14 @@ static int __init construct_domU(struct domain *d,
>>>>>>>>> if ( rc < 0 )
>>>>>>>>> return rc;
>>>>>>>>>
>>>>>>>>> + if ( kinfo.dom0less_enhanced )
>>>>>>>> I think we need to do something like this to fix the error.
>>>>>>>> if ( hardware_domain && kinfo.dom0less_enhanced )
>>>>>>>> {
>>>>>>>> }
>>>>>>>
>>>>>>> Is there any use case to use "dom0less_enhanced" without dom0 (or a domain servicing Xenstored)?
>>>>>>>
>>>>>> Just being curious here but would it even be possible to have non dom0 domain servicing xenstored ?
>>>>>
>>>>> You can build Xenstored against mini-os and configure the init script to launch xenstored as a domain.
>>>> So dom0 is not mandatory or should mini-os be started as Dom0 for this to work ?
>>>
>>> In order to allocate the event channel, you need to know the ID of the domain where Xenstored will run. Stefano's patch is relying on Xenstored to be run in Domain 0.
>>>
>>> This would need to be updated if we want to run it in a separate domain.
>>
>> Ok then Dom0 is mandatory at the moment, I am ok with that.
>>
>>>
>>>>>
>>>>>>> If not, then I would consider to forbid this case and return an error.
>>>>>> One way or an other we need to solve the crash but if it is forbidden we must prevent coming to this step earlier as it means the configuration is wrong.
>>>>>
>>>>> I think this should be checked when parsing the configuration.
>>>> If dom0 is mandatory yes, we should still make sure that this code cannot be reached so an ASSERT would be nice here at least in case someone tries to activate this code without dom0 (which might happen when we will push the serie for static event channels).
>>>
>>> I am fine with an ASSERT().
>>>
>>> Are you saying that dom0less_enhanced will be set to true for the static event channel series?
>>>
>>> If yes, then I think dom0less_enhanced will need to be an enum so we know what part of Xen is exposed.
>>
>> No it won’t, we just need some of the changes done but without setting dom0less_enhanced.
>> @Rahul: can you confirm.
>>
> 
> We need to set the "xen,enhanced” enabled for dom0less domU to enable
> the event-channel interface in dom0less guest. If we did not set this property we can’t
> use the event-channel interface in dom0less domUs guests.

Is this because the domU will not know which PPI will be used for 
notification?

The property "xen,enhanced" with an empty string (or with the value 
"enabled") is meant to indicate that PV drivers will be usable in the 
domain.

AFAIU, you are suggesting to change the meaning based on dom0 whether 
has been created. I don't particularly like that because a user may 
spent a while to understand why Xenstored doesn't work.

The current proposal for xen,enhanced allows us to define new values if 
we wanted to only enabled selected interfaces. AFAIU, in your case, you 
only want to expose the event channel interface, so I would create a new 
value to indicate that the event channel interface is exposed. Xen would 
then create only the part for the event channel (i.e. no extended 
regions, grant tables...).

Cheers,

-- 
Julien Grall

