Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 371AC330FC7
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 14:45:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94940.178963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJGC2-0005vR-67; Mon, 08 Mar 2021 13:45:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94940.178963; Mon, 08 Mar 2021 13:45:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJGC2-0005v2-34; Mon, 08 Mar 2021 13:45:06 +0000
Received: by outflank-mailman (input) for mailman id 94940;
 Mon, 08 Mar 2021 13:45:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NN5v=IG=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lJGC0-0005ux-Pd
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 13:45:04 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c634aa56-bfa3-41d3-89d9-45eb129a220e;
 Mon, 08 Mar 2021 13:45:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0A4E31B;
 Mon,  8 Mar 2021 05:45:02 -0800 (PST)
Received: from [10.57.16.174] (unknown [10.57.16.174])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E401B3F71B;
 Mon,  8 Mar 2021 05:45:00 -0800 (PST)
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
X-Inumbo-ID: c634aa56-bfa3-41d3-89d9-45eb129a220e
Subject: Re: [PATCH] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, bertrand.marquis@arm.com, wei.chen@arm.com,
 xen-devel@lists.xenproject.org
References: <20210308095233.13329-1-michal.orzel@arm.com>
 <3709714b-6627-3c66-b8ca-4cb9c59df83b@suse.com>
 <f15c2f35-4f1c-de2c-81dc-de47282cf588@arm.com>
 <dc49957d-885d-07e4-aa00-74668e331da2@suse.com>
 <15564cc3-db36-e7c3-df8d-64f6f54b4f3d@arm.com>
 <bb0ee356-510b-4b83-819e-77d83fcc6e10@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <5d304c0a-56bf-1c7d-065f-12473a36ae4b@arm.com>
Date: Mon, 8 Mar 2021 14:44:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bb0ee356-510b-4b83-819e-77d83fcc6e10@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 08.03.2021 14:13, Jan Beulich wrote:
> On 08.03.2021 14:11, Michal Orzel wrote:
>>
>>
>> On 08.03.2021 12:28, Jan Beulich wrote:
>>> On 08.03.2021 12:02, Michal Orzel wrote:
>>>> On 08.03.2021 11:00, Jan Beulich wrote:
>>>>> On 08.03.2021 10:52, Michal Orzel wrote:
>>>>>> +config DTB_FILE
>>>>>> +	string "Absolute path to device tree blob"
>>>>>> +	default ""
>>>>>> +	depends on LINK_DTB
>>>>>> +	---help---
>>>>>> +	  When using a bootloader that has no device tree support or when there
>>>>>> +	  is no bootloader at all, use this option to specify the absolute path
>>>>>> +	  to a device tree that will be linked directly inside Xen binary.
>>>>>
>>>>> How is selecting LINK_DTB but leaving DTB_FILE at an empty string
>>>>> different from not having a LINK_DTB setting at all?
>>>>>
>>>> LINK_DTB acts as a switch to allow setting the dtb path. Not having LINK_DTB option will result in
>>>> a build failure each time the user does not want to embed dtb into Xen(DTB_FILE is empty).
>>>
>>> Which isn't any different from having LINK_DTB and leaving the
>>> string empty, is it? I.e. imo no improved user experience.
>>>
>>>> I do not see why someone would want to select LINK_DTB leaving DTB_FILE as an empty string.
>>>
>>> People may not "want" to, but simply think accepting the default
>>> is fine, considering they've already said to link in some DTB.
>>> It may be obvious to you that there's no good default here, but
>>> it may not be to the person configuring their Xen. I'm guessing
>>> here, but did you try leaving out the default line? Would this
>>> make kconfig insist on the person to type in something? (Likely
>>> an empty string would still be accepted. As would be a relative
>>> path, despite what the help text says; I guess some forms of
>>> relative paths may even work.)
>>>
>> There is no option here to make kconfig insist on person to type something.
>> There is one solution. If I change in here:
>> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/Makefile;h=16e6523e2cc6072b7d4cbcdeaf4726b7a9b1d381;hb=HEAD#l71
>> from:
>> ifdef CONFIG_DTB_FILE
>> to:
>> ifneq ($(CONFIG_DTB_FILE),"")
>> then if user selects LINK_DTB but does not provide dtb path, the dtb will not be embedded into Xen.
> 
> I think this would be preferable plus eliminate the need for the
> separate LINK_DTB option.
> 
Will do this and send as v2
> Jan
> 
Michal

