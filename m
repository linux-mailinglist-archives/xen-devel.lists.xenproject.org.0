Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 642AD4BA5EF
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 17:30:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274921.470557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKjfD-0005I0-75; Thu, 17 Feb 2022 16:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274921.470557; Thu, 17 Feb 2022 16:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKjfD-0005GA-48; Thu, 17 Feb 2022 16:29:51 +0000
Received: by outflank-mailman (input) for mailman id 274921;
 Thu, 17 Feb 2022 16:29:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nKjfC-0005G4-H8
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 16:29:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nKjf7-000188-NW; Thu, 17 Feb 2022 16:29:45 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=[10.7.236.18])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nKjf7-00046D-H5; Thu, 17 Feb 2022 16:29:45 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=a5hJ6sE6YIbun3pdVHiv4KDsA8J63QXFakflQfgHBnI=; b=KZncZyu78B8F8Yyx3OTHBJlpbQ
	PeRU9xo/2Ntq7qAP58RUM7ODDsniCWs/vWf4VomySui3A9tBwC4NsfeZ/Pa3RKK38aHk2Oodci2dK
	8VG6hho+qQRMFfCz8ah+vmD1B0gCK/fzEK4UOvBrCjKbm1LayeK+ByZVa444+fl8BBvQ=;
Message-ID: <bf8dba24-c4c2-5aa9-1cf7-cd5315d5b067@xen.org>
Date: Thu, 17 Feb 2022 16:29:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [XEN PATCH v9 04/30] build: set ALL_OBJS in main Makefile; move
 prelink.o to main Makefile
To: Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-5-anthony.perard@citrix.com>
 <9bd4d8e6-d426-97be-f1d4-429a793f888c@suse.com> <YfPUP6iAatz9JPaS@perard>
 <4c757048-bf9f-5743-a2e7-cbf5a7fd97d5@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4c757048-bf9f-5743-a2e7-cbf5a7fd97d5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28/01/2022 11:41, Jan Beulich wrote:
> On 28.01.2022 12:32, Anthony PERARD wrote:
>> On Thu, Jan 27, 2022 at 04:50:32PM +0100, Jan Beulich wrote:
>>> On 25.01.2022 12:00, Anthony PERARD wrote:
>>>> --- a/xen/Makefile
>>>> +++ b/xen/Makefile
>>>> @@ -285,6 +285,16 @@ CFLAGS += -flto
>>>>   LDFLAGS-$(CONFIG_CC_IS_CLANG) += -plugin LLVMgold.so
>>>>   endif
>>>>   
>>>> +# Note that link order matters!
>>>
>>> Merely as a remark: I wonder how applicable that comment is anymore.
>>> If anything I'd expect it to be relevant to $(TARGET_SUBARCH)/head.o
>>> (Arm) and boot/built_in.o (x86), neither of which get named here.
>>
>> Indeed, the order here probably doesn't matter. I tried to build on x86
>> with the list reversed (so still leaving boot/ first) and the build
>> works. I didn't try to boot it.
> 
> It's quite unlikely for the order to matter at build time. Being able
> to boot the result is the minimum. Even then you can't be sure you
> merely avoided the problematic piece of code on the particular
> hardware you did the test on. Perhaps the most fragile parts are
> sections holding pointers which get processed in the order the linker
> put them. E.g. unexpected interdependencies between initcalls.
> 
>> Maybe it's time to retire the comment?
> 
> Probably, but Arm folks would want to confirm that's fine on their side
> as well.

Sorry I missed that comment. On Arm, the ordering is enforced in 
xen/arm/Makefile:

ALL_OBJS := $(TARGET_SUBARCH)/head.o $(ALL_OBJS)

AFAIK, the ordering in xen/Makefile doesn't matter to us. So I think the 
comment in xen/Makefile can be droppped.

That said, I always found this approach too magic. I have a TODO (low 
priority though) to enforce the ordering in the link script instead.

Anyway, I will build Xen with your branch and test it to confirm there 
are no changes.

Cheers,

-- 
Julien Grall

