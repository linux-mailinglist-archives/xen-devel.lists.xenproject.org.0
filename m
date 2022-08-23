Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACF159E3F5
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 14:49:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391957.630018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQTL0-0004fI-Ol; Tue, 23 Aug 2022 12:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391957.630018; Tue, 23 Aug 2022 12:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQTL0-0004dV-Ld; Tue, 23 Aug 2022 12:48:58 +0000
Received: by outflank-mailman (input) for mailman id 391957;
 Tue, 23 Aug 2022 12:48:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oQTKz-0004dP-P4
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 12:48:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQTKq-00032z-8Y; Tue, 23 Aug 2022 12:48:48 +0000
Received: from [54.239.6.189] (helo=[192.168.28.231])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQTKp-0008DU-VS; Tue, 23 Aug 2022 12:48:48 +0000
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
	bh=8trgNXR1w7bekheGOTWkEciJaaT3n6KZjEFCN24DnQU=; b=gCBE+OmtBqZNfwz7DcCFkKdR9Q
	TZw8q5XK7ter6b844hbV9CW7Pq74Bb+bS2phdnap3i5FhN9j8aV7M9FNL8ogGVKGQOHyW8fIfW0/b
	/Bj6NzlNrC4mdb9CtVfkUASP7ienBSvg92lyTL1iv7gOzWL/fzfsDkQZ3SgHb+GFEKa4=;
Message-ID: <caeb00e7-6239-1d9d-ae78-008830562239@xen.org>
Date: Tue, 23 Aug 2022 13:48:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v2 3/7] xen/evtchn: restrict the maximum number of evtchn
 supported for domUs
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Rahul Singh <Rahul.Singh@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1660902588.git.rahul.singh@arm.com>
 <1a8c49dcc237187cbb9fccaafe1e6533fe68381c.1660902588.git.rahul.singh@arm.com>
 <71c651a6-e8ad-78fc-efe5-2f20c332530a@suse.com>
 <96618b21-7cb5-d160-75b3-953ccdc75ac5@xen.org>
 <f8a3f7d6-1db9-cc74-5d60-8a0e22b80a3d@suse.com>
 <6A4EBDE0-60A0-46B9-A9BA-C689B9F8F129@arm.com>
 <fdfe8a77-34a3-252f-6aab-1850cc30c7a3@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <fdfe8a77-34a3-252f-6aab-1850cc30c7a3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 23/08/2022 12:35, Jan Beulich wrote:
> On 23.08.2022 12:39, Rahul Singh wrote:
>> Hi Jan,
>>
>>> On 23 Aug 2022, at 9:29 am, Jan Beulich <jbeulich@suse.com> wrote:
>>>
>>> On 23.08.2022 09:56, Julien Grall wrote:
>>>> On 22/08/2022 14:49, Jan Beulich wrote:
>>>>> On 19.08.2022 12:02, Rahul Singh wrote:
>>>>>> --- a/xen/arch/arm/domain_build.c
>>>>>> +++ b/xen/arch/arm/domain_build.c
>>>>>> @@ -3277,7 +3277,7 @@ void __init create_domUs(void)
>>>>>>           struct xen_domctl_createdomain d_cfg = {
>>>>>>               .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
>>>>>>               .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>>>>>> -            .max_evtchn_port = -1,
>>>>>> +            .max_evtchn_port = MAX_EVTCHNS_PORT,
>>>>>>               .max_grant_frames = -1,
>>>>>>               .max_maptrack_frames = -1,
>>>>>>               .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
>>>>>> --- a/xen/include/xen/sched.h
>>>>>> +++ b/xen/include/xen/sched.h
>>>>>> @@ -76,6 +76,9 @@ extern domid_t hardware_domid;
>>>>>>   /* Maximum number of event channels for any ABI. */
>>>>>>   #define MAX_NR_EVTCHNS MAX(EVTCHN_2L_NR_CHANNELS, EVTCHN_FIFO_NR_CHANNELS)
>>>>>>
>>>>>> +/* Maximum number of event channels supported for domUs. */
>>>>>> +#define MAX_EVTCHNS_PORT 4096
>>>>>
>>>>> I'm afraid the variable name doesn't express its purpose, and the
>>>>> comment also claims wider applicability than is actually the case.
>>>>> It's also not clear whether the constant really needs to live in
>>>>> the already heavily overloaded xen/sched.h.
>>>>
>>>> IMHO, I think the value would be better hardcoded with an explanation on
>>>> top how we chose the default value.
>>>
>>> Indeed that might be best, at least as long as no 2nd party appears.
>>> What I was actually considering a valid reason for having a constant
>>> in a header was the case of other arches also wanting to support
>>> dom0less, at which point they likely ought to use the same value
>>> without needing to duplicate any commentary or alike.
>>
>>
>> If everyone is  okay I will modify the patch as below:
> 
> Well, I'm not an Arm maintainer, so my view might not matter, but
> if this was a change to code I was a maintainer for, I'd object.
> You enforce a limit here which you can't know whether it might
> cause issues to anyone.

I understand the theory and in general I am not in favor of restricting 
a limit without any data. However, here, I think we have all the data 
necessary that would justify the limit.

In order to use event channels, a guest needs to know which PPI is used 
to notify the guest.

Until recently, we didn't expose the node to dom0less domUs (this was 
introduced when adding support for PV devices). So a guest couldn't 
discover that event channels are used. That said, if the guest figured 
out the PPI (the value can be guessed) then it could potentially use the 
event channels.

However, for Xen on Arm, we are not supporting any guest that don't use 
the firmware tables (e.g. device tree/ACPI). So for such use case, I 
don't care if it breaks because they are relying on unstable information.

What I care about is any user that follow the rules. We only started to 
advertise Xen via Device-Tree to dom0less domUs after 4.16. So I think 
this is fine to restrict the limit now because we haven't released 4.17 yet.

Regarding the default limit, I think it is better to stay consistent 
with libxl and also use 1023. If an admin wants more event channels, 
then we could introduce per-domain property to overwrite the default.

It should not be too difficult to add, but I don't think this is a must.
So I will let Rahul to decide whether he has time to add it.

Cheers,

-- 
Julien Grall

