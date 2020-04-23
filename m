Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBE71B54FC
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 08:56:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRVkx-0006LL-Ej; Thu, 23 Apr 2020 06:54:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0dw1=6H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jRVkv-0006LG-UE
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 06:54:41 +0000
X-Inumbo-ID: 4d84130c-852f-11ea-9328-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d84130c-852f-11ea-9328-12813bfff9fa;
 Thu, 23 Apr 2020 06:54:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 445E8ADD3;
 Thu, 23 Apr 2020 06:54:38 +0000 (UTC)
Subject: Re: [PATCH] xen/grants: fix hypercall continuation for
 GNTTABOP_cache_flush
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20200422130753.14713-1-jgross@suse.com>
 <6b050b8e-72d2-2d4f-3e23-101596d31d40@suse.com>
 <alpine.DEB.2.21.2004220911040.25377@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c157a585-790d-8feb-1527-9eb3f0b3a729@suse.com>
Date: Thu, 23 Apr 2020 08:54:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004220911040.25377@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.04.2020 18:31, Stefano Stabellini wrote:
> On Wed, 22 Apr 2020, Jan Beulich wrote:
>> On 22.04.2020 15:07, Juergen Gross wrote:
>>> --- a/xen/common/grant_table.c
>>> +++ b/xen/common/grant_table.c
>>> @@ -3626,12 +3626,12 @@ do_grant_table_op(
>>>          if ( unlikely(!guest_handle_okay(cflush, count)) )
>>>              goto out;
>>>          rc = gnttab_cache_flush(cflush, &opaque_in, count);
>>> -        if ( rc > 0 )
>>> +        if ( rc >= 0 )
>>>          {
>>>              guest_handle_add_offset(cflush, rc);
>>>              uop = guest_handle_cast(cflush, void);
>>> +            opaque_out = opaque_in;
>>>          }
>>> -        opaque_out = opaque_in;
>>>          break;
>>>      }
>>>  
>>> @@ -3641,7 +3641,7 @@ do_grant_table_op(
>>>      }
>>>  
>>>    out:
>>> -    if ( rc > 0 || opaque_out != 0 )
>>> +    if ( rc > 0 || (opaque_out != 0 && rc == 0) )
>>
>> I disagree with this part - opaque_out shouldn't end up non-zero
>> when rc < 0, and it won't anymore with the change in the earlier
>> hunk.
> 
> But opaque_out could end up being non-zero when rc == 0.

Which is the case the original code meant to deal with. (I still
think it is unfortunate behavior of the cache-flush implementation
to assign meaning other than "success, done" to rc == 0.)

> I think it is a
> good improvement that we explicitly prevent rc < 0 from entering this
> if condition. This is why this new version of the patch is my favorite:
> it is the one that leads to the code most robust. 
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Well, looks like I'm outvoted then. Nevertheless thanks ...

> That said, as I mentioned before, I would be OK even without the last
> part because it would still be enough to fix the bug.

.. for also clarifying this.

Jan

