Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9101C369C
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 12:19:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVYBZ-0003BP-CS; Mon, 04 May 2020 10:18:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVYBY-0003BK-BB
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 10:18:52 +0000
X-Inumbo-ID: a658ed62-8df0-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a658ed62-8df0-11ea-b9cf-bc764e2007e4;
 Mon, 04 May 2020 10:18:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 05460AC53;
 Mon,  4 May 2020 10:18:51 +0000 (UTC)
Subject: Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the
 menuconfig directly
To: Julien Grall <julien@xen.org>
References: <20200430142548.23751-1-julien@xen.org>
 <20200430142548.23751-3-julien@xen.org>
 <3a4ec020-f626-031e-73a6-b2eee97ab9e8@suse.com>
 <548a9fc5-c251-5d8b-d297-4788d60b801d@xen.org>
 <36944bda-14a8-0134-cd1d-1f08becb28b0@suse.com>
 <898479ac-fd5c-48f4-28cb-8bbb2dc60d83@xen.org>
 <443018dd-d30e-037d-b7b1-d531d81bed15@suse.com>
 <3c581eac-9b2f-493c-f86e-2377450a6a2a@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cb829776-b18d-3535-1869-da9dc2232ec8@suse.com>
Date: Mon, 4 May 2020 12:18:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3c581eac-9b2f-493c-f86e-2377450a6a2a@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.05.2020 11:54, Julien Grall wrote:
> Hi Jan,
> 
> On 04/05/2020 10:37, Jan Beulich wrote:
>> On 04.05.2020 11:30, Julien Grall wrote:
>>> Hi Jan,
>>>
>>> On 04/05/2020 10:18, Jan Beulich wrote:
>>>> On 30.04.2020 17:35, Julien Grall wrote:
>>>>> On 30/04/2020 15:50, Jan Beulich wrote:
>>>>>> On 30.04.2020 16:25, Julien Grall wrote:
>>>>>>> EXPERT mode is currently used to gate any options that are in technical
>>>>>>> preview or not security supported At the moment, the only way to select
>>>>>>> it is to use XEN_CONFIG_EXPERT=y on the make command line.
>>>>>>>
>>>>>>> However, if the user forget to add the option of one of the make
>>>>>>> command (even a clean), then .config will get rewritten. This may lead
>>>>>>> to a rather frustrating experience as it is difficult to diagnostic the
>>>>>>> issue.
>>>>>>
>>>>>> Is / will this still be true after Anthony's rework of the build
>>>>>> system? Right now we already have
>>>>>>
>>>>>> clean-targets := %clean
>>>>>> no-dot-config-targets := $(clean-targets) \
>>>>>>                             ...
>>>>>
>>>>> I haven't tried Anthony's rework yet. But I guess the problem would
>>>>> be the same if you forget to add XEN_CONFIG_EXPERT=y on make.
>>>>
>>>> Why? xen/.config would get re-written only if kconfig got run in
>>>> the first place. It is my understanding that no-dot-config-targets
>>>> exist to avoid including .config, and as a result make won't find
>>>> a need anymore to cause it to re-made if out of date.
>>>
>>> kconfig may be executed because you change one of the */Kconfig file.
>>> So if you happen to forget XEN_CONFIG_EXPERT=y on your build command
>>> line, then you will have your .config rewritten without expert options.
>>
>> That's still a build system issue then (if this is really what happens):
>> Dependencies of xen/.config shouldn't be evaluated as long as it doesn't
>> get used.
> 
> I am not sure to understand what you mean by "doesn't get used here". When you build Xen, xen/.config is a dependency for the auto-generated header. So 'make' will actually check whether there are any modification in */Kconfig.

But you were talking about "make clean", weren't you?

Jan

