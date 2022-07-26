Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DBD581876
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 19:38:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375616.608054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGOVI-0004Vi-SV; Tue, 26 Jul 2022 17:37:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375616.608054; Tue, 26 Jul 2022 17:37:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGOVI-0004TI-P4; Tue, 26 Jul 2022 17:37:56 +0000
Received: by outflank-mailman (input) for mailman id 375616;
 Tue, 26 Jul 2022 17:37:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oGOVI-0004TC-08
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 17:37:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oGOVF-0005jL-Pk; Tue, 26 Jul 2022 17:37:53 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[10.7.237.34])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oGOVF-0005kf-JY; Tue, 26 Jul 2022 17:37:53 +0000
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
	bh=858EOI/8hkdn5r97Z5UqHlsyophybJ/tSH3CID88NPY=; b=WpmoAv/DKsnxl/rpvvIDmJKV2L
	kqFWCmHkHn3PJP9CsnXdhI65IzpK7ZIyzLD6h5Ky9oaCoiK4LHtYVnO0bWkdbev1vqeQQeQQJ/3M7
	FpdTJJVCrx5pyiD+7hRd9HhuNEG5GEShvVu9ObHyVNVUOv235puZU8+7YwbhQkQ6fnpU=;
Message-ID: <c673e9df-02b6-4f90-aca9-dc2ad9d3f922@xen.org>
Date: Tue, 26 Jul 2022 18:37:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <5ea66595248c41a011ac465bfabd7a7a40dcd565.1655903088.git.rahul.singh@arm.com>
 <2cdde2eb-33ac-568b-a0ae-b819b7b4161b@xen.org>
 <1494EC8C-9916-472F-9285-57C0FF656919@arm.com>
 <abcf96b0-1c41-476a-de08-adb3eaaaa05d@xen.org>
 <addaeb82-2d15-a46e-f9f9-274572d2ddc2@suse.com>
 <9711c08f-7e16-daf3-f010-1e6a53b0b9a0@xen.org>
 <5f200481-ed3c-a463-90aa-3718c0ab57a3@suse.com>
 <758779b3-ef39-aa95-15c9-9b84b952e80b@xen.org>
 <3b42f9ab-383c-694c-cef0-5d24531e556a@suse.com>
 <019c5cb4-7e6a-d822-3c02-e3199d499106@xen.org>
 <93E40C29-DD1E-4C9B-936B-45ACA69BBD66@arm.com>
 <d868fab2-c55a-7e2c-cd54-6dc3eedbbf26@xen.org>
 <BB3ECBA1-A028-44A0-A6BB-5D6BD009C095@arm.com>
 <ee0a62af-fa79-3699-7652-d976a8690995@xen.org>
 <99D4D342-5DF7-4F85-A311-4D03967D77DB@arm.com>
 <b98c14d6-d788-427f-3fe4-b36bc85aae59@xen.org>
 <E290A20A-D6C7-4154-A0A4-3FC91C479B25@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <E290A20A-D6C7-4154-A0A4-3FC91C479B25@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 21/07/2022 16:37, Rahul Singh wrote:
> Hi Julien,

Hi Rahul,

>> On 21 Jul 2022, at 2:29 pm, Julien Grall <julien@xen.org> wrote:
>>
>> On 21/07/2022 13:50, Rahul Singh wrote:
>>> Hi Julien,
>>
>> Hi Rahul,
>>
>>>> On 20 Jul 2022, at 12:16 pm, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> Hi Rahul,
>>>>
>>>> On 20/07/2022 10:59, Rahul Singh wrote:
>>>>>> On 13 Jul 2022, at 1:29 pm, Julien Grall <julien@xen.org> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 13/07/2022 13:12, Bertrand Marquis wrote:
>>>>>>>> On 13 Jul 2022, at 12:31, Julien Grall <julien@xen.org> wrote:
>>>>>>>>> I can't
>>>>>>>>> see why it would be wrong to have a more tight limit on static ports
>>>>>>>>> than on traditional ("dynamic") ones. Even if only to make sure so
>>>>>>>>> many dynamic ones are left.
>>>>>>>>
>>>>>>>> This is similar to Xen forbidding to close a static port: it is not the hypervisor business to check that there are enough event channel ports freed for dynamic allocation.
>>>>>>> On other side we need to be cautious not to add too much complexity in the code by trying to make things always magically work.
>>>>>>> If you want Xen to be accessible to non expert by magically working all the time, there would be a lot of work to do.
>>>>>>
>>>>>> It is not clear to me whether you are referring to a developper or admin here.
>>>>>>
>>>>>> On the admin side, we need to make sure they have an easy way to configure event channels. One knob is always going to easier than two knobs.
>>>>>>
>>>>>> On the developper side, this could be resolved by better documentation in the code/interface.
>>>>>>
>>>>>> Cheers,
>>>>> To conclude the discussion, If everyone agree I will add the below patch or similar in the next version to restrict the
>>>>> max number of evtchn supported as suggested.
>>>>
>>>> I am fine if the limit for domU is fixed by Xen for now. However, for dom0, 4096 is potentially too low if you have many PV drivers (each backend will need a few event channels). So I don't think this wants to be fixed by Xen.
>>> Agree.
>>>>
>>>> I am not entirely sure we want to limit the number of event channels for dom0. But if you want to, then this will have to be done via a command line option (or device-tree property).
>>> We need to support the static event channel for dom0 also, in that case, we need to restrict the max number of evtchn for dom0 to mitigate the security issue.
>>
>> It sounds like there are some misundertanding or I am missing some context. The static event channels will be allocated at boot, so the worse that can happen is it will be slower to boot.
>>
>> My point regarding fifo was more in the generic case of allowing the caller to select the port. This would be a concern in the context of non-cooperative live-migration. An easy way is to restrict the number of ports. For you, this is just an increase in boot time.
>>
>> Furthermore, there is an issue for dom0less domUs because we don't limit the number of port by default. This means that a domU can allocate a large amount of memory in Xen (we need some per-event channel state). Hence why I suggested to update max_evtchn_channel.
> 
> Thanks for the clarification.
>>
>>> If the admin set the value greater than 4096 (or what we agreed on) and static event channel support is enabled we will print the warning to the user related to fill
>>> the hole issue for FIFO ABI.
>>
>> See above. I don't see the need for a warning. The admin will notice that it is slower to boot.
> 
> Ok. I will not add the warning. Just to confirm again is that okay If I add new command line option "max_event_channels”  in
> next version for dom0 to restrict the max number of evtchn.

Personally I am fine with a command line option to *globally* restrict 
the number of events channel. But Jan seemed to have some reservation. 
Quoting what he wrote previously:

"Imo there would need to be a very good reason to limit Dom0's port range.
"

Cheers,

-- 
Julien Grall

