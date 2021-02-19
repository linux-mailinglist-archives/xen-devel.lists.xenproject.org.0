Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5B831F9AA
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 14:10:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86870.163348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD5Xw-0002oH-4j; Fri, 19 Feb 2021 13:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86870.163348; Fri, 19 Feb 2021 13:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD5Xw-0002nv-1e; Fri, 19 Feb 2021 13:10:12 +0000
Received: by outflank-mailman (input) for mailman id 86870;
 Fri, 19 Feb 2021 13:10:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TOKe=HV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lD5Xu-0002np-Pg
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 13:10:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 505fbf80-9baf-481d-8582-baaa234996d3;
 Fri, 19 Feb 2021 13:10:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7DEB2ACBF;
 Fri, 19 Feb 2021 13:10:08 +0000 (UTC)
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
X-Inumbo-ID: 505fbf80-9baf-481d-8582-baaa234996d3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613740208; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/VKks5qxLBV3Mbj7lruyczsz3QxnsFsX+pUjFf3/Eaw=;
	b=Qoepv2G06GvbSu4dRbBoKZOqgn8kSt/1eLNDKfFJsMiSthiW1NFt4mlxdh5IAbWopk6r0b
	kHIFmEEqJp+0XRglDTjiI4bh03CXreUEoDTF6W+GX2tMC2/8rcnUJVgeA10bTzI6re3W0Z
	BU4g7VHRh3hc6LAGMI4WwCF/Wc5mEK0=
Subject: Re: Linux PV/PVH domU crash on (guest) resume from suspend
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <YCylpKU8F+Hsg8YL@mail-itl>
 <0b71a671-592a-53ab-6b4a-1fe15b9eb453@suse.com> <YC0exVYljxxvwFFt@mail-itl>
 <d848053e-b708-167a-ab7c-e7985e61d608@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <08117ed3-7e84-b233-4a74-248896e2a2d8@suse.com>
Date: Fri, 19 Feb 2021 14:10:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d848053e-b708-167a-ab7c-e7985e61d608@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 19.02.2021 13:48, Jürgen Groß wrote:
> On 17.02.21 14:48, Marek Marczykowski-Górecki wrote:
>> On Wed, Feb 17, 2021 at 07:51:42AM +0100, Jürgen Groß wrote:
>>> On 17.02.21 06:12, Marek Marczykowski-Górecki wrote:
>>>> Hi,
>>>>
>>>> I'm observing Linux PV/PVH guest crash when I resume it from sleep. I do
>>>> this with:
>>>>
>>>>       virsh -c xen dompmsuspend <vmname> mem
>>>>       virsh -c xen dompmwakeup <vmname>
>>>>
>>>> But it's possible to trigger it with plain xl too:
>>>>
>>>>       xl save -c <vmname> <some-file>
>>>>
>>>> The same on HVM works fine.
>>>>
>>>> This is on Xen 4.14.1, and with guest kernel 5.4.90, the same happens
>>>> with 5.4.98. Dom0 kernel is the same, but I'm not sure if that's
>>>> relevant here. I can reliably reproduce it.
>>>
>>> This is already on my list of issues to look at.
>>>
>>> The problem seems to be related to the XSA-332 patches. You could try
>>> the patches I've sent out recently addressing other fallout from XSA-332
>>> which _might_ fix this issue, too:
>>>
>>> https://patchew.org/Xen/20210211101616.13788-1-jgross@suse.com/
>>
>> Thanks for the patches. Sadly it doesn't change anything - I get exactly
>> the same crash. I applied that on top of 5.11-rc7 (that's what I had
>> handy). If you think there may be a difference with the final 5.11 or
>> another branch, please let me know.
>>
> 
> Some more tests reveal that this seems to be s hypervisor regression.
> I can reproduce the very same problem with a 4.12 kernel from 2019.
> 
> It seems as if the EVTCHNOP_init_control hypercall is returning
> -EINVAL when the domain is continuing to run after the suspend
> hypercall (in contrast to the case where a new domain has been created
> when doing a "xl restore").

But when you resume the same domain, the kernel isn't supposed to
call EVTCHNOP_init_control, as that's a one time operation (per
vCPU, and unless EVTCHNOP_reset was called of course). In the
hypervisor map_control_block() has (always had) as its first step

    if ( v->evtchn_fifo->control_block )
        return -EINVAL;

Re-setup is needed only when resuming in a new domain.

Jan

