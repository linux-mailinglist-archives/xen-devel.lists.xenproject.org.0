Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04352330C53
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 12:29:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94799.178525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJE48-0006R7-5D; Mon, 08 Mar 2021 11:28:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94799.178525; Mon, 08 Mar 2021 11:28:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJE48-0006Qi-1R; Mon, 08 Mar 2021 11:28:48 +0000
Received: by outflank-mailman (input) for mailman id 94799;
 Mon, 08 Mar 2021 11:28:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mI6H=IG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJE46-0006Qd-Aa
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 11:28:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a043af92-f18b-4561-aad8-7a63befbd7a1;
 Mon, 08 Mar 2021 11:28:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 943C3AC0C;
 Mon,  8 Mar 2021 11:28:44 +0000 (UTC)
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
X-Inumbo-ID: a043af92-f18b-4561-aad8-7a63befbd7a1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615202924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ouI8LPsBHyY+4ZE+IepA+KITvpShdC3ToQh5zmV3/Co=;
	b=gfdd0bqkg8mBe7hO2c7oOY4vtRe7VcBXBImDoRtva/OAkgrMzmmpnawUdgg10jc8E1Crls
	BCnnmoJyL1m3ocKi6Pctrt5nvn4Po3XmdE3FuLaWwJqEp82RFmq0ID8x1iMW3/4IuRo1F+
	g3MnZV6XsIyRP56K/yHDr/eSz4US9/s=
Subject: Re: [PATCH] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, bertrand.marquis@arm.com, wei.chen@arm.com,
 xen-devel@lists.xenproject.org
References: <20210308095233.13329-1-michal.orzel@arm.com>
 <3709714b-6627-3c66-b8ca-4cb9c59df83b@suse.com>
 <f15c2f35-4f1c-de2c-81dc-de47282cf588@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dc49957d-885d-07e4-aa00-74668e331da2@suse.com>
Date: Mon, 8 Mar 2021 12:28:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <f15c2f35-4f1c-de2c-81dc-de47282cf588@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.03.2021 12:02, Michal Orzel wrote:
> On 08.03.2021 11:00, Jan Beulich wrote:
>> On 08.03.2021 10:52, Michal Orzel wrote:
>>> +config DTB_FILE
>>> +	string "Absolute path to device tree blob"
>>> +	default ""
>>> +	depends on LINK_DTB
>>> +	---help---
>>> +	  When using a bootloader that has no device tree support or when there
>>> +	  is no bootloader at all, use this option to specify the absolute path
>>> +	  to a device tree that will be linked directly inside Xen binary.
>>
>> How is selecting LINK_DTB but leaving DTB_FILE at an empty string
>> different from not having a LINK_DTB setting at all?
>>
> LINK_DTB acts as a switch to allow setting the dtb path. Not having LINK_DTB option will result in
> a build failure each time the user does not want to embed dtb into Xen(DTB_FILE is empty).

Which isn't any different from having LINK_DTB and leaving the
string empty, is it? I.e. imo no improved user experience.

> I do not see why someone would want to select LINK_DTB leaving DTB_FILE as an empty string.

People may not "want" to, but simply think accepting the default
is fine, considering they've already said to link in some DTB.
It may be obvious to you that there's no good default here, but
it may not be to the person configuring their Xen. I'm guessing
here, but did you try leaving out the default line? Would this
make kconfig insist on the person to type in something? (Likely
an empty string would still be accepted. As would be a relative
path, despite what the help text says; I guess some forms of
relative paths may even work.)

Jan

