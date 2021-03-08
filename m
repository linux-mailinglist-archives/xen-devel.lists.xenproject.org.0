Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 373B6330BE2
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 12:02:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94784.178488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJDeb-0004HW-JJ; Mon, 08 Mar 2021 11:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94784.178488; Mon, 08 Mar 2021 11:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJDeb-0004H7-G9; Mon, 08 Mar 2021 11:02:25 +0000
Received: by outflank-mailman (input) for mailman id 94784;
 Mon, 08 Mar 2021 11:02:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NN5v=IG=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lJDeZ-0004H1-7S
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 11:02:23 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 35058a59-1e8c-4be3-989d-2ad9de6f85bc;
 Mon, 08 Mar 2021 11:02:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C985AD6E;
 Mon,  8 Mar 2021 03:02:21 -0800 (PST)
Received: from [10.57.16.174] (unknown [10.57.16.174])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8B293F73C;
 Mon,  8 Mar 2021 03:02:19 -0800 (PST)
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
X-Inumbo-ID: 35058a59-1e8c-4be3-989d-2ad9de6f85bc
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
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <f15c2f35-4f1c-de2c-81dc-de47282cf588@arm.com>
Date: Mon, 8 Mar 2021 12:02:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3709714b-6627-3c66-b8ca-4cb9c59df83b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Jan,

On 08.03.2021 11:00, Jan Beulich wrote:
> On 08.03.2021 10:52, Michal Orzel wrote:
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -400,6 +400,20 @@ config DOM0_MEM
>>  
>>  	  Leave empty if you are not sure what to specify.
>>  
>> +config LINK_DTB
>> +	bool "Link DTB into Xen image"
>> +	depends on ARM
>> +	default n
> 
> I don't think this last line is needed.
> 
I agree. I can fix it.
>> +config DTB_FILE
>> +	string "Absolute path to device tree blob"
>> +	default ""
>> +	depends on LINK_DTB
>> +	---help---
>> +	  When using a bootloader that has no device tree support or when there
>> +	  is no bootloader at all, use this option to specify the absolute path
>> +	  to a device tree that will be linked directly inside Xen binary.
> 
> How is selecting LINK_DTB but leaving DTB_FILE at an empty string
> different from not having a LINK_DTB setting at all?
> 
LINK_DTB acts as a switch to allow setting the dtb path. Not having LINK_DTB option will result in
a build failure each time the user does not want to embed dtb into Xen(DTB_FILE is empty).
I do not see why someone would want to select LINK_DTB leaving DTB_FILE as an empty string.
> Jan
> 

Cheers,
Michal

