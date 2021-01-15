Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AA32F7C22
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 14:10:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68069.121770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Ord-0000js-FO; Fri, 15 Jan 2021 13:10:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68069.121770; Fri, 15 Jan 2021 13:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Ord-0000iV-BX; Fri, 15 Jan 2021 13:10:05 +0000
Received: by outflank-mailman (input) for mailman id 68069;
 Fri, 15 Jan 2021 13:10:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0Orc-0000XR-AU
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 13:10:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a48fa26-b246-4509-aae7-e18715da7d31;
 Fri, 15 Jan 2021 13:09:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BB512AC63;
 Fri, 15 Jan 2021 13:09:58 +0000 (UTC)
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
X-Inumbo-ID: 4a48fa26-b246-4509-aae7-e18715da7d31
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610716198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xG6lnNnIjFocXqYok7AgK8nXhBbKlPsAsFROmO93htQ=;
	b=ZL9e5TweA+neukgx2TWKeDRcSmbR4+WFCCbm3jUY2Mri0m+Y0k/6KHEiG2CXh2nYU6+035
	hn0I08yzuSWhkbificVWTbcvmS+LzzSqXKvp+LvsZhWtt5Rws1GNnqCejq22nB0wVox51b
	/TAhdNeNsylr+P8ODLSB34MnOWxvAHg=
Subject: Re: [PATCH v4 08/11] xen/compiler: import 'fallthrough' keyword from
 linux
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1610115608.git.rahul.singh@arm.com>
 <aab15a158f6acb5f5a1cfd0dad1d4493b1fcace9.1610115608.git.rahul.singh@arm.com>
 <9dd27a7d-a77a-14ff-c62c-c813b21fb34e@suse.com>
 <alpine.DEB.2.21.2101121521500.2495@sstabellini-ThinkPad-T480s>
 <ce896f84-917b-14e8-40e4-46b5ce3cb2f6@suse.com>
 <alpine.DEB.2.21.2101141546350.31265@sstabellini-ThinkPad-T480s>
 <EA49F7DE-22AF-4F95-9158-0EE42519FE7A@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3e49735c-adc8-775d-3115-cf623ed1cef0@suse.com>
Date: Fri, 15 Jan 2021 14:09:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <EA49F7DE-22AF-4F95-9158-0EE42519FE7A@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.01.2021 13:14, Rahul Singh wrote:
> Hello,
> 
>> On 14 Jan 2021, at 11:47 pm, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>
>> On Thu, 14 Jan 2021, Jan Beulich wrote:
>>> On 13.01.2021 00:30, Stefano Stabellini wrote:
>>>> On Tue, 12 Jan 2021, Jan Beulich wrote:
>>>>> On 08.01.2021 15:46, Rahul Singh wrote:
>>>>>> -Wimplicit-fallthrough warns when a switch case falls through. Warning
>>>>>> can be suppress by either adding a /* fallthrough */ comment, or by
>>>>>> using a null statement: __attribute__ ((fallthrough))
>>>>>
>>>>> Why is the comment variant (which we use in many places already,
>>>>> albeit with varying wording) not the route of choice?
>>>>
>>>> See previous discussion:
>>>>
>>>> https://marc.info/?l=xen-devel&m=160707274517270
>>>> https://marc.info/?l=xen-devel&m=160733742810605
>>>> https://marc.info/?l=xen-devel&m=160733852011023
>>>>
>>>> We thought it would be best to introduce "fallthrough" and only resort
>>>> to comments as a plan B. The usage of the keyword should allow GCC to do
>>>> better checks.
>>>
>>> Hmm, this earlier discussion was on an Arm-specific thread, and I
>>> have to admit I can't see arguments there pro and/or con either
>>> of the two alternatives.
>>>
>>>>>> Define the pseudo keyword 'fallthrough' for the ability to convert the
>>>>>> various case block /* fallthrough */ style comments to null statement
>>>>>> "__attribute__((__fallthrough__))"
>>>>>>
>>>>>> In C mode, GCC supports the __fallthrough__ attribute since 7.1,
>>>>>> the same time the warning and the comment parsing were introduced.
>>>>>>
>>>>>> fallthrough devolves to an empty "do {} while (0)" if the compiler
>>>>>> version (any version less than gcc 7) does not support the attribute.
>>>>>
>>>>> What about Coverity? It would be nice if we wouldn't need to add
>>>>> two separate constructs everywhere to make both compiler and static
>>>>> code checker happy.
>>>>
>>>> I don't think I fully understand your reply here: Coverity doesn't come
>>>> into the picture. Given that GCC provides a special keyword to implement
>>>> fallthrough, it makes sense to use it when available. When it is not
>>>> available (e.g. clang or older GCC) we need to have an alternative to
>>>> suppress the compiler warnings. Hence the need for this check:
>>>>
>>>>  #if (!defined(__clang__) && (__GNUC__ >= 7))
>>>
>>> I'm not sure how this interacts with Coverity. My point bringing up
>>> that one is that whatever gets done here should _also_ result in
>>> Coverity recognizing the fall-through as intentional, or else we'll
>>> end up with many unwanted reports of new issues once the pseudo-
>>> keyword gets made use of. The comment model is what we currently
>>> use to "silence" Coverity; I'd like it to be clear up front that
>>> any new alternative to be used is also going to "satisfy" it.
>>
>> That is a good point, and I agree with that. Rahul, do you have access
>> to a Coverity instance to run a test? 
> 
> No I don’t have access to Coverity to run a test.What I found out that from the Linux kernel mailing list Coverity understand the "__attribute__((__fallthrough__))” keyword.

Okay, thanks, looks sufficient afaic.

Jan

> [1] https://lore.kernel.org/lkml/20181021182926.GB6683@kroah.com/
> [2] https://lore.kernel.org/patchwork/patch/1108577/
> 
> Regards,
> Rahul
> 


