Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 068963404C9
	for <lists+xen-devel@lfdr.de>; Thu, 18 Mar 2021 12:39:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98891.187896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMqzV-0007PZ-7I; Thu, 18 Mar 2021 11:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98891.187896; Thu, 18 Mar 2021 11:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMqzV-0007PA-36; Thu, 18 Mar 2021 11:39:01 +0000
Received: by outflank-mailman (input) for mailman id 98891;
 Thu, 18 Mar 2021 11:38:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AupJ=IQ=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lMqzT-0007P5-Hg
 for xen-devel@lists.xenproject.org; Thu, 18 Mar 2021 11:38:59 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3ee7218d-a62b-491a-ab3d-2e687501b81b;
 Thu, 18 Mar 2021 11:38:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D108ED1;
 Thu, 18 Mar 2021 04:38:56 -0700 (PDT)
Received: from [10.57.19.39] (unknown [10.57.19.39])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18F8D3F792;
 Thu, 18 Mar 2021 04:38:53 -0700 (PDT)
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
X-Inumbo-ID: 3ee7218d-a62b-491a-ab3d-2e687501b81b
Subject: Re: [PATCH v7] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <20210315092342.26533-1-michal.orzel@arm.com>
 <3473f8d3-c42a-9182-b4fa-c3eacb44338f@xen.org>
 <75800277-4107-0060-aece-d01cf29d3086@arm.com>
 <728bb60b-adc0-7218-95a5-e733aadd5cfa@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <ed7722ea-c728-3786-734e-6a11c38df60b@arm.com>
Date: Thu, 18 Mar 2021 12:38:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <728bb60b-adc0-7218-95a5-e733aadd5cfa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 18.03.2021 10:20, Jan Beulich wrote:
> On 18.03.2021 08:21, Michal Orzel wrote:
>> Hi Julien,
>>
>> On 16.03.2021 15:54, Julien Grall wrote:
>>> Hi Michal,
>>>
>>> On 15/03/2021 09:23, Michal Orzel wrote:
>>>> Currently in order to link existing DTB into Xen image
>>>> we need to either specify option CONFIG_DTB_FILE on the
>>>> command line or manually add it into .config.
>>>> Add Kconfig entry: CONFIG_DTB_FILE
>>>> to be able to provide the path to DTB we want to embed
>>>> into Xen image. If no path provided - the dtb will not
>>>> be embedded.
>>>>
>>>> Remove the line: AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
>>>> as it is not needed since Kconfig will define it in a header
>>>> with all the other config options.
>>>>
>>>> Make a change in the linker script from:
>>>> _sdtb = .;
>>>> to:
>>>> PROVIDE(_sdtb = .);
>>>> to avoid creation of _sdtb if there is no reference to it.
>>>
>>> This means that if someone is using #ifdef CONFIG_DTB_FILE rather than .ifnes, _sdtb will get defined.
>>
>> Do we really want to overengineer something that simple?
>> Why would someone use #ifdef CONFIG_DTB_FILE?
>> In my opinion the rule of thumb is that you don't use #ifdef on configs of string type.
>> Using #ifdef CONFIG_DTB_FILE means that someone modifying the code did not even spend 1 minute checking the Kconfig.
>>
>> If you do not agree, I can modify the code so _sdtb will be created in dtb.S.
>> In that case I would like Jan Beulich to give his opinion before I will send v8.
> 
> TBH I'd find it more natural in any event if the symbol came from
> dtb.S. So far I was assuming there was some (hidden) reason why
> this wouldn't work.
> 
> Jan
> 
Then if both of you agree that _sdtb should be defined in dtb.S, I will make it in v8

Michal

