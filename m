Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63592306177
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 18:01:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76295.137618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4oCQ-00050j-2L; Wed, 27 Jan 2021 17:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76295.137618; Wed, 27 Jan 2021 17:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4oCP-00050K-VJ; Wed, 27 Jan 2021 17:01:45 +0000
Received: by outflank-mailman (input) for mailman id 76295;
 Wed, 27 Jan 2021 17:01:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l4oCN-00050B-LB
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 17:01:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l4oCM-0002cG-EU; Wed, 27 Jan 2021 17:01:42 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l4oCM-0003Le-8F; Wed, 27 Jan 2021 17:01:42 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=SAp+WUkGXKZv3aRDsd0yPXOaKkDKl/nsAUw1T3b4rOs=; b=R6IYKe6LPbTQoTiA/U4g54dNO4
	QukuwN97gV7LBoxl8Wu5Vklrbta9oE000aT/eE09ny+qXpwol92n1AAI3wWFN1FntWYZp0l5SA/Ot
	sOQzFMBYdowpAk0xtp5QAH6zYYFgwKOnRr9st9D6dyZJG1mLYepEG6ZDQcfmSl7yCKnk=;
Subject: Re: [PATCH V5 14/22] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Jan Beulich <jbeulich@suse.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
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
From: Julien Grall <julien@xen.org>
Message-ID: <d977056e-a265-b0ba-c0e6-2cc7fe3800e9@xen.org>
Date: Wed, 27 Jan 2021 17:01:39 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <ff05bfd8-150a-1dbc-8c25-c922ee863146@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 26/01/2021 09:15, Jan Beulich wrote:
> On 25.01.2021 20:08, Oleksandr Tyshchenko wrote:
>> --- a/xen/include/xen/dm.h
>> +++ b/xen/include/xen/dm.h
>> @@ -19,6 +19,8 @@
>>   
>>   #include <xen/sched.h>
>>   
>> +#include <public/hvm/dm_op.h>
>> +
>>   struct dmop_args {
>>       domid_t domid;
>>       unsigned int nr_bufs;
> 
> How come this becomes necessary at this point in the series, when
> nothing else in this header changes, and nothing changes in the
> public headers at all? Is it perhaps a .c file that needs the
> #include instead? Headers shouldn't pull in other headers without
> clear need - as indicated in reply to a prior version, we have
> way too many bad examples (causing headaches in certain cases),
> and we'd like to avoid gaining more. (Oh, I notice you actually
> have a post-commit-message remark about this, but then this
> patch should be marked RFC until the issue was resolved.)

dm.h contains the following:

struct dmop_args {
     domid_t domid;
     unsigned int nr_bufs;
     /* Reserve enough buf elements for all current hypercalls. */
     struct xen_dm_op_buf buf[2];
};

The struct xen_dm_op_buf is defined public/hvm/dm_op.h. On x86, this 
will be indirectly included via:
    ->  xen/sched.h
     ->  xen/domain.h
      ->  asm/domain.h
       ->  asm/hvm/domain.h
        ->  public/hvm/dm_op.h

It looks like this was include from asm/hvm/domain.h because, before 
this series, NR_IO_RANGE_TYPES made use of a DMOP definition.

With this series, the type is now moved in ioreq.h. So I think we may be 
able to drop the include from asm/hvm/domain.h (this would avoid to 
include it everywhere...).

I also think we want to include public/hvm/dm_op.h in xen/dm.h because 
it is included directly by *.c.

Cheers,

-- 
Julien Grall

