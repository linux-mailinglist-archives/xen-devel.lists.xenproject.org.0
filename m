Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8830F33200F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 08:48:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95245.179742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJX6V-0002Gz-Om; Tue, 09 Mar 2021 07:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95245.179742; Tue, 09 Mar 2021 07:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJX6V-0002Gd-Lg; Tue, 09 Mar 2021 07:48:31 +0000
Received: by outflank-mailman (input) for mailman id 95245;
 Tue, 09 Mar 2021 07:48:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bv84=IH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJX6T-0002GY-VD
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 07:48:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32a65161-c4de-4a41-8a30-501dedcb3108;
 Tue, 09 Mar 2021 07:48:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5BE26AC1F;
 Tue,  9 Mar 2021 07:48:28 +0000 (UTC)
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
X-Inumbo-ID: 32a65161-c4de-4a41-8a30-501dedcb3108
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615276108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o7n054MX+Dq/BvPhJ4RPtTh/X29Mm2l8invMO0pHy/U=;
	b=mLoLocmp/3c5K9QpvNgZC26JnZ1e5U0l3GiWGfFKqw5ezwwlYrer8RjeS5G5cw8+8b58aN
	Wp/1WIkKHXFyYY6ROysrdMRwKhSXl4HQDec4XOPeT08gL99O4DvzvnZ+fBnwyQe2LHGRw3
	iRrn4F9XIkqYjSyZto0T03lcyGd7avU=
Subject: Re: [PATCH v2] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org
References: <20210308135937.1692-1-michal.orzel@arm.com>
 <37ea3c87-c960-4c92-af5f-71f2db774a75@suse.com>
 <efdf6d29-7e1e-4239-ac80-31cfef18ab31@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <abd8ac9a-4f5c-162a-5730-8eff8b5fa5fc@suse.com>
Date: Tue, 9 Mar 2021 08:48:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <efdf6d29-7e1e-4239-ac80-31cfef18ab31@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.03.2021 08:28, Michal Orzel wrote:
> 
> 
> On 08.03.2021 15:26, Jan Beulich wrote:
>> On 08.03.2021 14:59, Michal Orzel wrote:
>>> --- a/xen/arch/arm/Makefile
>>> +++ b/xen/arch/arm/Makefile
>>> @@ -68,7 +68,7 @@ extra-y += $(TARGET_SUBARCH)/head.o
>>>  
>>>  #obj-bin-y += ....o
>>>  
>>> -ifdef CONFIG_DTB_FILE
>>> +ifneq ($(CONFIG_DTB_FILE),"")
>>>  obj-y += dtb.o
>>>  AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
>>>  endif
>>
>> Right now what I have for my Arm test builds is an unquoted
>> string in ./.config, e.g.:
>>
>> CONFIG_DTB_FILE:=/usr/local/arm-linux-gnueabi/vexpress-v2p-aem-v7a.dtb
>>
>> While I suppose you've tested that the resulting quoting is still
>> okay, to reduce confusion perhaps the AFLAGS-y line would better
>> be changed to
>>
>> AFLAGS-y += '-DCONFIG_DTB_FILE=$(CONFIG_DTB_FILE)'
> 
> It is tested. I can change it to:
> AFLAGS-y += -DCONFIG_DTB_FILE='$(CONFIG_DTB_FILE)'
> as the -DCONFIG_DTB_FILE= does not need to be within quotes

Either way would seem better to me than the current use of escaped
double quotes. (Personally I prefer to quote entire arguments, but
that's clearly a taste aspect.)

Jan

