Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E191A231A
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 15:34:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMAq4-0007IT-M9; Wed, 08 Apr 2020 13:33:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D8Jc=5Y=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jMAq4-0007IO-1n
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 13:33:56 +0000
X-Inumbo-ID: 97b4ae98-799d-11ea-83d8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97b4ae98-799d-11ea-83d8-bc764e2007e4;
 Wed, 08 Apr 2020 13:33:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2B99FAE59;
 Wed,  8 Apr 2020 13:33:53 +0000 (UTC)
Subject: Re: [RFC PATCH 00/26] Runtime paravirt patching
To: Peter Zijlstra <peterz@infradead.org>,
 Ankur Arora <ankur.a.arora@oracle.com>
References: <20200408050323.4237-1-ankur.a.arora@oracle.com>
 <20200408120856.GY20713@hirez.programming.kicks-ass.net>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <bcf8206d-5a41-4e6b-1832-75ba1d6367e4@suse.com>
Date: Wed, 8 Apr 2020 15:33:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200408120856.GY20713@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: hpa@zytor.com, xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pbonzini@redhat.com,
 namit@vmware.com, mhiramat@kernel.org, jpoimboe@redhat.com,
 mihai.carabas@oracle.com, bp@alien8.de, vkuznets@redhat.com,
 boris.ostrovsky@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08.04.20 14:08, Peter Zijlstra wrote:
> On Tue, Apr 07, 2020 at 10:02:57PM -0700, Ankur Arora wrote:
>> Mechanism: the patching itself is done using stop_machine(). That is
>> not ideal -- text_poke_stop_machine() was replaced with INT3+emulation
>> via text_poke_bp(), but I'm using this to address two issues:
>>   1) emulation in text_poke() can only easily handle a small set
>>   of instructions and this is problematic for inlined pv-ops (and see
>>   a possible alternatives use-case below.)
>>   2) paravirt patching might have inter-dependendent ops (ex.
>>   lock.queued_lock_slowpath, lock.queued_lock_unlock are paired and
>>   need to be updated atomically.)
> 
> And then you hope that the spinlock state transfers.. That is that both
> implementations agree what an unlocked spinlock looks like.
> 
> Suppose the native one was a ticket spinlock, where unlocked means 'head
> == tail' while the paravirt one is a test-and-set spinlock, where
> unlocked means 'val == 0'.
> 
> That just happens to not be the case now, but it was for a fair while.

Sure? This would mean that before spinlock-pvops are being set no lock
is allowed to be used in the kernel, because this would block the boot
time transition of the lock variant to use.

Another problem I'm seeing is that runtime pvops patching would rely on
the fact that stop_machine() isn't guarded by a spinlock.


Juergen

