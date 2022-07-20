Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFDD57B534
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 13:17:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371496.603444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE7gY-00061x-Nh; Wed, 20 Jul 2022 11:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371496.603444; Wed, 20 Jul 2022 11:16:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE7gY-0005ye-K1; Wed, 20 Jul 2022 11:16:10 +0000
Received: by outflank-mailman (input) for mailman id 371496;
 Wed, 20 Jul 2022 11:16:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oE7gX-0005yY-Do
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 11:16:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oE7gU-00071w-42; Wed, 20 Jul 2022 11:16:06 +0000
Received: from [54.239.6.185] (helo=[192.168.0.130])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oE7gT-0000hO-T7; Wed, 20 Jul 2022 11:16:06 +0000
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
	bh=UGUhOqkA6huNyuSVwxF9aSA9OkbZWMExmaJSQcdwXJ8=; b=E8Fq+vn7DcB3C7x9NagltS72t5
	ucrCbatZtUxFtdaswQ+eau8G7KBf0VGrJsJLpF3a8Ss6icKcaKVTYANydOnNZIYQLeRQiW+KJ7bgh
	fyeS+1LwOeFwHGLTMUtzZL8JeL/FGI//hHLdVvaZBKx+pP9cr92wmyFMbZwcCyRSYAHk=;
Message-ID: <ee0a62af-fa79-3699-7652-d976a8690995@xen.org>
Date: Wed, 20 Jul 2022 12:16:03 +0100
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <BB3ECBA1-A028-44A0-A6BB-5D6BD009C095@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 20/07/2022 10:59, Rahul Singh wrote:
>> On 13 Jul 2022, at 1:29 pm, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 13/07/2022 13:12, Bertrand Marquis wrote:
>>>> On 13 Jul 2022, at 12:31, Julien Grall <julien@xen.org> wrote:
>>>>> I can't
>>>>> see why it would be wrong to have a more tight limit on static ports
>>>>> than on traditional ("dynamic") ones. Even if only to make sure so
>>>>> many dynamic ones are left.
>>>>
>>>> This is similar to Xen forbidding to close a static port: it is not the hypervisor business to check that there are enough event channel ports freed for dynamic allocation.
>>> On other side we need to be cautious not to add too much complexity in the code by trying to make things always magically work.
>>> If you want Xen to be accessible to non expert by magically working all the time, there would be a lot of work to do.
>>
>> It is not clear to me whether you are referring to a developper or admin here.
>>
>> On the admin side, we need to make sure they have an easy way to configure event channels. One knob is always going to easier than two knobs.
>>
>> On the developper side, this could be resolved by better documentation in the code/interface.
>>
>> Cheers,
> 
> To conclude the discussion, If everyone agree I will add the below patch or similar in the next version to restrict the
> max number of evtchn supported as suggested.

I am fine if the limit for domU is fixed by Xen for now. However, for 
dom0, 4096 is potentially too low if you have many PV drivers (each 
backend will need a few event channels). So I don't think this wants to 
be fixed by Xen.

I am not entirely sure we want to limit the number of event channels for 
dom0. But if you want to, then this will have to be done via a command 
line option (or device-tree property).

Cheers,

-- 
Julien Grall

