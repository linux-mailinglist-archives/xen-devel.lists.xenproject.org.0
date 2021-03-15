Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E4C33ABC2
	for <lists+xen-devel@lfdr.de>; Mon, 15 Mar 2021 07:43:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97846.185618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLgvv-0006lx-BW; Mon, 15 Mar 2021 06:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97846.185618; Mon, 15 Mar 2021 06:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLgvv-0006lc-8O; Mon, 15 Mar 2021 06:42:31 +0000
Received: by outflank-mailman (input) for mailman id 97846;
 Mon, 15 Mar 2021 06:42:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yGRb=IN=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lLgvu-0006lX-1A
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 06:42:30 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 940b8ccb-63c6-40c3-b6ce-0b330825de02;
 Mon, 15 Mar 2021 06:42:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1D1CD6E;
 Sun, 14 Mar 2021 23:42:24 -0700 (PDT)
Received: from [10.57.18.146] (unknown [10.57.18.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7E993F792;
 Sun, 14 Mar 2021 23:42:22 -0700 (PDT)
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
X-Inumbo-ID: 940b8ccb-63c6-40c3-b6ce-0b330825de02
Subject: Re: [PATCH v5] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org
References: <20210311142207.25556-1-michal.orzel@arm.com>
 <572b503c-6650-a0a7-74d6-f5f3ba076fea@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <79317a40-9128-4d4d-4774-51632c0c393a@arm.com>
Date: Mon, 15 Mar 2021 07:42:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <572b503c-6650-a0a7-74d6-f5f3ba076fea@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11.03.2021 15:50, Jan Beulich wrote:
> On 11.03.2021 15:22, Michal Orzel wrote:
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
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> albeit I think that, as suggested, ...
> 
>> --- a/xen/arch/arm/xen.lds.S
>> +++ b/xen/arch/arm/xen.lds.S
>> @@ -222,7 +222,7 @@ SECTIONS
>>  
>>  #ifdef CONFIG_DTB_FILE
>>    /* Section for the device tree blob (if any). */
>> -  _sdtb = .;
>> +  PROVIDE(_sdtb = .);
>>    .dtb : { *(.dtb) } :text
>>  #endif
> 
> .. the now pointless (always true) #ifdef here should also go
> away.
> 
Will be done in v6.
> Jan
> 

Michal

