Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 007CF306184
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 18:04:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76302.137631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4oFJ-0005C7-HJ; Wed, 27 Jan 2021 17:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76302.137631; Wed, 27 Jan 2021 17:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4oFJ-0005Bi-Dv; Wed, 27 Jan 2021 17:04:45 +0000
Received: by outflank-mailman (input) for mailman id 76302;
 Wed, 27 Jan 2021 17:04:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4oFI-0005Bd-Dw
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 17:04:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bb5674c6-c259-4be8-9f35-4f0e62ce02c6;
 Wed, 27 Jan 2021 17:04:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3FBD9AAC6;
 Wed, 27 Jan 2021 17:04:42 +0000 (UTC)
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
X-Inumbo-ID: bb5674c6-c259-4be8-9f35-4f0e62ce02c6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611767082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MvCvvf0SMRzngs1kwVhboppIrZ/CyZB6JxS0jlkDvR4=;
	b=P78G9Ga9WjmIIqMHV4VqIP65Vs51NhzSMcrOERJd5sUaVt5kRmO5twHFWfgbudoWERXVu4
	7tMCjwyTTBEBMIBR8sT2qGc4NbXjVsPAMwuWl3Q5CJRLprKkktnNaUcyXN3p9Ue403mEoX
	hL0ZZQrDayG+Wj9Pkt/CPy8+EYZ5/8o=
Subject: Re: [PATCH V5 14/22] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Julien Grall <julien@xen.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-15-git-send-email-olekstysh@gmail.com>
 <ff05bfd8-150a-1dbc-8c25-c922ee863146@suse.com>
 <d977056e-a265-b0ba-c0e6-2cc7fe3800e9@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e80eaf48-69a8-6901-6efd-262d2aae23f8@suse.com>
Date: Wed, 27 Jan 2021 18:04:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <d977056e-a265-b0ba-c0e6-2cc7fe3800e9@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.01.2021 18:01, Julien Grall wrote:
> Hi Jan,
> 
> On 26/01/2021 09:15, Jan Beulich wrote:
>> On 25.01.2021 20:08, Oleksandr Tyshchenko wrote:
>>> --- a/xen/include/xen/dm.h
>>> +++ b/xen/include/xen/dm.h
>>> @@ -19,6 +19,8 @@
>>>   
>>>   #include <xen/sched.h>
>>>   
>>> +#include <public/hvm/dm_op.h>
>>> +
>>>   struct dmop_args {
>>>       domid_t domid;
>>>       unsigned int nr_bufs;
>>
>> How come this becomes necessary at this point in the series, when
>> nothing else in this header changes, and nothing changes in the
>> public headers at all? Is it perhaps a .c file that needs the
>> #include instead? Headers shouldn't pull in other headers without
>> clear need - as indicated in reply to a prior version, we have
>> way too many bad examples (causing headaches in certain cases),
>> and we'd like to avoid gaining more. (Oh, I notice you actually
>> have a post-commit-message remark about this, but then this
>> patch should be marked RFC until the issue was resolved.)
> 
> dm.h contains the following:
> 
> struct dmop_args {
>      domid_t domid;
>      unsigned int nr_bufs;
>      /* Reserve enough buf elements for all current hypercalls. */
>      struct xen_dm_op_buf buf[2];
> };

Which means the public header should be included, yes, but
right away at the point this dependency appears, not at a
random point later in the series.

Jan

> The struct xen_dm_op_buf is defined public/hvm/dm_op.h. On x86, this 
> will be indirectly included via:
>     ->  xen/sched.h
>      ->  xen/domain.h
>       ->  asm/domain.h
>        ->  asm/hvm/domain.h
>         ->  public/hvm/dm_op.h
> 
> It looks like this was include from asm/hvm/domain.h because, before 
> this series, NR_IO_RANGE_TYPES made use of a DMOP definition.
> 
> With this series, the type is now moved in ioreq.h. So I think we may be 
> able to drop the include from asm/hvm/domain.h (this would avoid to 
> include it everywhere...).
> 
> I also think we want to include public/hvm/dm_op.h in xen/dm.h because 
> it is included directly by *.c.
> 
> Cheers,
> 


