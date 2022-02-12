Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A92AB4B3777
	for <lists+xen-devel@lfdr.de>; Sat, 12 Feb 2022 19:55:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270845.465176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIxXm-00006S-OD; Sat, 12 Feb 2022 18:54:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270845.465176; Sat, 12 Feb 2022 18:54:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIxXm-0008VY-LG; Sat, 12 Feb 2022 18:54:50 +0000
Received: by outflank-mailman (input) for mailman id 270845;
 Sat, 12 Feb 2022 18:54:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nIxXk-0008VS-Uo
 for xen-devel@lists.xenproject.org; Sat, 12 Feb 2022 18:54:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nIxXh-0002fO-T3; Sat, 12 Feb 2022 18:54:45 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nIxXh-0000gN-NU; Sat, 12 Feb 2022 18:54:45 +0000
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
	bh=ktHzQV8yIQsZP8qebA2zS5vxbuKHD3CYO3HGLia9my8=; b=5C+PCbqJQsHU9IddheSVdGYo70
	iOV0L2Bb+IlGteaE3gECeGvYsMaL+WKx7AXP/MXTb0Ht2KqdnwzukMl4N/xshdK9rra8oh267pwug
	BQVlzQ/ZkX0aVYRYPdPnk+YyrZSPD6pAUTs8LEI2rWJ/Wy9aFmKbM3TRaDB6WupIagVI=;
Message-ID: <b1968764-e26e-35ea-1e74-7c3509c97707@xen.org>
Date: Sat, 12 Feb 2022 18:54:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH RFC 1/3] xen/efi: Always query the console information and
 get GOP
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org, Daniel Kiper <daniel.kiper@oracle.com>
References: <20220206192839.75711-1-julien@xen.org>
 <20220206192839.75711-2-julien@xen.org>
 <88741681-929f-4cda-e841-023bdbf8f772@suse.com>
 <26cdd9cf-15d6-a463-b1bb-28964005f618@xen.org>
 <YgcOg6p8D+6hWWsE@mattapan.m5p.com>
 <d2a2f715-9eab-aeb1-8099-4db614eb26a8@xen.org>
 <Ygf6VznolUhlpAzp@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <Ygf6VznolUhlpAzp@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/02/2022 18:20, Elliott Mitchell wrote:
> On Sat, Feb 12, 2022 at 01:10:52PM +0000, Julien Grall wrote:
>>
>> On 12/02/2022 01:33, Elliott Mitchell wrote:
>>> On Mon, Feb 07, 2022 at 06:52:57PM +0000, Julien Grall wrote:
>>>> On 07/02/2022 08:46, Jan Beulich wrote:
>>>>> On 06.02.2022 20:28, Julien Grall wrote:
>>>>>>
>>>>>> It is not entirely clear to me why the GOP was only fetched when
>>>>>> the configuration file is used.
>>>>>>
>>>>>> I have tested this on RPI4 and it seems to work. Any chance this
>>>>>> was done to workaround an x86 platform?
>>>>>
>>>>> This was done so in the context of making the code work for Arm. See
>>>>> commit c38cf865ec82 ("EFI: ignore EFI commandline, skip console setup
>>>>> when booted from GRUB"), the description of which explicitly says
>>>>>
>>>>> "Don't do EFI console or video configuration when booted by GRUB.  The EFI boot
>>>>>     code does some console and video initialization to support native EFI boot from
>>>>>     the EFI boot manager or EFI shell.  This initlization should not be done when
>>>>>     booted using GRUB."
>>>>
>>>> I read that and still couldn't figure out why this was done like that.
>>>
>>> The most likely motivation was simply "Eww!  ACPI/UEFI use gobs of
>>> memory!  Purge the abomination!"
>>>
>>> Unfortunately ACPI/UEFI are large an complex due to trying to solve a
>>> large and complex problem.  ACPI/UEFI attempt to provide an OS agnostic
>>> presentation of the hardware layout.  Whereas device-trees are a common
>>> *format* for presenting hardware to *an* OS (similar to how JSON is a
>>> common format).
>>>
>>> Due to the size and complexity, most developers have preferred the
>>> simpler device-tree format even though that severely limits OS choice.
>>> As such, nuking ACPI/UEFI's presence is common in the ARM world.  Versus > the x86 world where Intel dragged everyone onto ACPI/UEFI.
>>>
>>> One can see this in patches like Roman Shaposhnik's "Making full 2G of
>>> memory available to Xen on HiKey" which simply tosses EFI into the
>>> garbage bin as useless overhead.
>>
>> I couldn't find a series with this name in my archives. By any chance,
>> are you referring to [1]?
> 
> The patch may have appeared under more than one title.  The raw content
> is publically visible at:
> 
> https://github.com/lf-edge/eve/blob/master/pkg/xen/arch/aarch64/0002-arm-efi-mem-detection.patch
> 
> The issue is few ARM projects are really trying to support enough
> different devices for ACPI/UEFI to hit their forte.  At which point
> ACPI/UEFI get treated as worthless overhead.

Thanks! I wasn't aware of that patch.

>>> You stated your patch was for 5.17-rc2.  How much backporting would you
>>> expect this patch to be viable for?  (I'm unsure how much churn is
>>> occuring in the relevant portions of Linux) The long-term branches of
>>> Linux include 5.4.179, 5.10.100 and 5.15.23.  `patch` indicated it could
>>> apply to 5.10.92 source with fuzz (hmm).  This suggests 5.15 is likely
>>> viable, but 5.10 is risky and 5.4 is a very long shot.
> 
>> I haven't looked at backports, so I don't know. But this is not a patch
>> I would consider to request for backport myself because IHMO this is
>> adding device support.
> 
> People who need this feature are likely to backport it themselves.

Well, anyone can ask backport. I am not planning to ask nor do the 
backport work myselff. But feel free to send an e-mail to stable after 
the Linux patch is merged.

> 
> Looking at the 5.10.92 source I've got handy, it appears reasonable.  The
> fuzz appears to have be a missed newline when I attempted to grab the
> patch from the site you used.
> 
> You want test reports yet?

I need to do some respin. So I would say wait until the next version.

Cheers,

-- 
Julien Grall

