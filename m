Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 551C334002C
	for <lists+xen-devel@lfdr.de>; Thu, 18 Mar 2021 08:23:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98831.187713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMmye-0007Yt-Hg; Thu, 18 Mar 2021 07:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98831.187713; Thu, 18 Mar 2021 07:21:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMmye-0007YU-EV; Thu, 18 Mar 2021 07:21:52 +0000
Received: by outflank-mailman (input) for mailman id 98831;
 Thu, 18 Mar 2021 07:21:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AupJ=IQ=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lMmyd-0007YP-AB
 for xen-devel@lists.xenproject.org; Thu, 18 Mar 2021 07:21:51 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 724c1f0b-7f41-451b-8063-ef195b2d8597;
 Thu, 18 Mar 2021 07:21:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9800EED1;
 Thu, 18 Mar 2021 00:21:48 -0700 (PDT)
Received: from [10.57.19.39] (unknown [10.57.19.39])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E30D13F718;
 Thu, 18 Mar 2021 00:21:46 -0700 (PDT)
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
X-Inumbo-ID: 724c1f0b-7f41-451b-8063-ef195b2d8597
Subject: Re: [PATCH v7] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 bertrand.marquis@arm.com
References: <20210315092342.26533-1-michal.orzel@arm.com>
 <3473f8d3-c42a-9182-b4fa-c3eacb44338f@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <75800277-4107-0060-aece-d01cf29d3086@arm.com>
Date: Thu, 18 Mar 2021 08:21:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3473f8d3-c42a-9182-b4fa-c3eacb44338f@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Julien,

On 16.03.2021 15:54, Julien Grall wrote:
> Hi Michal,
> 
> On 15/03/2021 09:23, Michal Orzel wrote:
>> Currently in order to link existing DTB into Xen image
>> we need to either specify option CONFIG_DTB_FILE on the
>> command line or manually add it into .config.
>> Add Kconfig entry: CONFIG_DTB_FILE
>> to be able to provide the path to DTB we want to embed
>> into Xen image. If no path provided - the dtb will not
>> be embedded.
>>
>> Remove the line: AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
>> as it is not needed since Kconfig will define it in a header
>> with all the other config options.
>>
>> Make a change in the linker script from:
>> _sdtb = .;
>> to:
>> PROVIDE(_sdtb = .);
>> to avoid creation of _sdtb if there is no reference to it.
> 
> This means that if someone is using #ifdef CONFIG_DTB_FILE rather than .ifnes, _sdtb will get defined.

Do we really want to overengineer something that simple?
Why would someone use #ifdef CONFIG_DTB_FILE?
In my opinion the rule of thumb is that you don't use #ifdef on configs of string type.
Using #ifdef CONFIG_DTB_FILE means that someone modifying the code did not even spend 1 minute checking the Kconfig.

If you do not agree, I can modify the code so _sdtb will be created in dtb.S.
In that case I would like Jan Beulich to give his opinion before I will send v8.
> 
> The difference between two is quite subttle and can be easily missed during review.
> 
> How about defining _sdtb in dtb.S? With that approach, we would get a compiler error if someone protect _sdtb with #ifdef rather than .ifnes.
> 
> Cheers,
> 

Cheers,
Michal

