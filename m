Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3232C1BA7B1
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 17:16:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT5UJ-0004eU-JT; Mon, 27 Apr 2020 15:16:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jT5UI-0004eO-D5
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 15:16:02 +0000
X-Inumbo-ID: 0110367d-889a-11ea-97a9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0110367d-889a-11ea-97a9-12813bfff9fa;
 Mon, 27 Apr 2020 15:16:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0CC60AE2E;
 Mon, 27 Apr 2020 15:15:59 +0000 (UTC)
Subject: Re: [PATCH] x86: refine guest_mode()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <7b62d06c-1369-2857-81c0-45e2434357f4@suse.com>
 <1704f4f6-7e77-971c-2c94-4f6a6719c34a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5bbe6425-396c-d934-b5af-53b594a4afbc@suse.com>
Date: Mon, 27 Apr 2020 17:15:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1704f4f6-7e77-971c-2c94-4f6a6719c34a@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.04.2020 16:35, Andrew Cooper wrote:
> On 27/04/2020 09:03, Jan Beulich wrote:
>> The 2nd of the assertions as well as the macro's return value have been
>> assuming we're on the primary stack. While for most IST exceptions we
>> eventually switch back to the main one,
> 
> "we switch to the main one when interrupting user mode".
> 
> "eventually" isn't accurate as it is before we enter C.

Right, will change.

>> --- a/xen/include/asm-x86/regs.h
>> +++ b/xen/include/asm-x86/regs.h
>> @@ -10,9 +10,10 @@
>>      /* Frame pointer must point into current CPU stack. */                    \
>>      ASSERT(diff < STACK_SIZE);                                                \
>>      /* If not a guest frame, it must be a hypervisor frame. */                \
>> -    ASSERT((diff == 0) || (r->cs == __HYPERVISOR_CS));                        \
>> +    if ( diff < PRIMARY_STACK_SIZE )                                          \
>> +        ASSERT(!diff || ((r)->cs == __HYPERVISOR_CS));                        \
>>      /* Return TRUE if it's a guest frame. */                                  \
>> -    (diff == 0);                                                              \
>> +    !diff || ((r)->cs != __HYPERVISOR_CS);                                    \
> 
> The (diff == 0) already worried me before because it doesn't fail safe,
> but this makes things more problematic.  Consider the case back when we
> had __HYPERVISOR_CS32.

Yes - if __HYPERVISOR_CS32 would ever have been to be used for
anything, it would have needed checking for here.

> Guest mode is strictly "(r)->cs & 3".

As long as CS (a) gets properly saved (it's a "manual" step for
SYSCALL/SYSRET as well as #VMEXIT) and (b) didn't get clobbered. I
didn't write this code, I don't think, so I can only guess that
there were intentions behind this along these lines.

> Everything else is expectations about how things ought to be laid out,
> but for safety in release builds, the final judgement should not depend
> on the expectations evaluating true.

Well, I can switch to a purely CS.RPL based approach, as long as
we're happy to live with the possible downside mentioned above.
Of course this would then end up being a more intrusive change
than originally intended ...

Jan

