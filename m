Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A400A331FC3
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 08:29:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95239.179719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJWnH-0000HB-QV; Tue, 09 Mar 2021 07:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95239.179719; Tue, 09 Mar 2021 07:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJWnH-0000Gh-NP; Tue, 09 Mar 2021 07:28:39 +0000
Received: by outflank-mailman (input) for mailman id 95239;
 Tue, 09 Mar 2021 07:28:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GyQX=IH=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lJWnG-0000Gc-Bp
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 07:28:38 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id cc6fcd8b-35c9-482a-92c2-8f635aa48fb4;
 Tue, 09 Mar 2021 07:28:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90485D6E;
 Mon,  8 Mar 2021 23:28:36 -0800 (PST)
Received: from [10.57.15.131] (unknown [10.57.15.131])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE5053F70D;
 Mon,  8 Mar 2021 23:28:34 -0800 (PST)
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
X-Inumbo-ID: cc6fcd8b-35c9-482a-92c2-8f635aa48fb4
Subject: Re: [PATCH v2] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org
References: <20210308135937.1692-1-michal.orzel@arm.com>
 <37ea3c87-c960-4c92-af5f-71f2db774a75@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <efdf6d29-7e1e-4239-ac80-31cfef18ab31@arm.com>
Date: Tue, 9 Mar 2021 08:28:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <37ea3c87-c960-4c92-af5f-71f2db774a75@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 08.03.2021 15:26, Jan Beulich wrote:
> On 08.03.2021 14:59, Michal Orzel wrote:
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -68,7 +68,7 @@ extra-y += $(TARGET_SUBARCH)/head.o
>>  
>>  #obj-bin-y += ....o
>>  
>> -ifdef CONFIG_DTB_FILE
>> +ifneq ($(CONFIG_DTB_FILE),"")
>>  obj-y += dtb.o
>>  AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
>>  endif
> 
> Right now what I have for my Arm test builds is an unquoted
> string in ./.config, e.g.:
> 
> CONFIG_DTB_FILE:=/usr/local/arm-linux-gnueabi/vexpress-v2p-aem-v7a.dtb
> 
> While I suppose you've tested that the resulting quoting is still
> okay, to reduce confusion perhaps the AFLAGS-y line would better
> be changed to
> 
> AFLAGS-y += '-DCONFIG_DTB_FILE=$(CONFIG_DTB_FILE)'

It is tested. I can change it to:
AFLAGS-y += -DCONFIG_DTB_FILE='$(CONFIG_DTB_FILE)'
as the -DCONFIG_DTB_FILE= does not need to be within quotes
> 
> at the same time?
> 
> Jan
> 
Michal

