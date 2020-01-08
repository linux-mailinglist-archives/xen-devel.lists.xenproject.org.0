Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AED133F97
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 11:48:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ip8pl-0000d8-Ir; Wed, 08 Jan 2020 10:45:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Mkji=25=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ip8pj-0000cw-E5
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 10:45:03 +0000
X-Inumbo-ID: ec709b4a-3203-11ea-ad7a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec709b4a-3203-11ea-ad7a-12813bfff9fa;
 Wed, 08 Jan 2020 10:45:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CEFF5AD54;
 Wed,  8 Jan 2020 10:45:01 +0000 (UTC)
To: Tao Xu <tao3.xu@intel.com>, xen-devel@lists.xenproject.org
References: <764d3c88-ce22-c968-9169-896892aa55e5@intel.com>
 <61d03b85-fd54-f6a0-dcd5-8fda2194a9f0@suse.com>
 <2a111e1a-9016-7488-1e48-4ac2e2e34351@intel.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4d2c8710-e544-3f9b-a036-5dab073d46bf@suse.com>
Date: Wed, 8 Jan 2020 11:45:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <2a111e1a-9016-7488-1e48-4ac2e2e34351@intel.com>
Content-Type: multipart/mixed; boundary="------------74F0E2186D38737332F849E7"
Content-Language: en-US
Subject: Re: [Xen-devel] [BUG] XEN crash and double fault when doing cpu
 online/offline
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--------------74F0E2186D38737332F849E7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08.01.20 09:32, Tao Xu wrote:
> 
> On 1/8/20 3:50 PM, Jürgen Groß wrote:
>> On 08.01.20 06:50, Tao Xu wrote:
>>> Hi,
>>>
>>> When I use xen-hptool cpu-offline/cpu-online to let CPU in a socket 
>>> online/offline using the script as follows:
>>>
>>> for((j=48;j<=95;j++));
>>> do
>>>    xen-hptool cpu-offline $j
>>> done
>>>
>>> for((j=48;j<=95;j++));
>>> do
>>>    xen-hptool cpu-online $j
>>> done
>>>
>>> Xen crash when cpu re-online. I use the upstream XEN(0dd92688) and 
>>> try many days, it still crash. But if I only do cpu online/offline 
>>> for CPU 48~59, Xen will not crash. The bug can be reproduced when we 
>>> do cpu online/offline for most CPU in a socket. And interesting thing 
>>> is when we use the script as follow:
>>>
>>> for((j=48;j<=95;j++));
>>> do
>>>    xen-hptool cpu-offline $j
>>>    xen-hptool cpu-online $j
>>> done
>>>
>>> Xen will not crash too. Is there a bug in sched_credit2?
>>>
>>> The crash message as follows:
>>>
>>> (XEN) Adding cpu 77 to runqueue 1
>>> (XEN) Adding cpu 78 to runqueue 1
>>> (XEN) Adding cpu 79 to runqueue 1
>>> (XEN) Adding cpu 80 to runqueue 1
>>> (X(ENXE) N) *** DOUBLE FAULT ***
>>> (XEN) Assertion 'debug->cpu == smp_processor_id()' failed at 
>>> spinlock.c:88
>>> (XEN) ----[ Xen-4.14-unstable  x86_64  debug=y   Not tainted ]----
>>> (XEN) Debugging connection not set up.
>>> (XEN) CPU:    48
>>> (XEN) ----[ Xen-4.14-unstable  x86_64  debug=y   Not tainted ]----
>>> (XEN) CPU:    0
>>> (XEN) RIP:    e008:[<ffff82d080240bfc>] _spin_unlock+0x40/0x42
>>
>> So the original problem causes a double fault, but spinlock debugging
>> causes a subsequent panic.
>>
>> Can you please retry the tests with the attached patch? It should
>> result in diagnostic data related to the real problem.
>>
>>
>> Juergen
> 
> Hi Juergen,
> 
> After apply your patch, spin_lock still assert. And the address 
> ffff82d0bffce880 is not in the xen-syms.

Yes, I had a bug in my modified ASSERT(), but this time the data is
better.

> 
> (XEN) Adding cpu 78 to runqueue 1
> (XEN) *** DOUBLE FAULT ***
> (XEN) ----[ Xen-4.14-unstable  x86_64  debug=y   Not tainted ]----
> (XEN) CPU:    49
> (XEN) RIP:    e008:[<ffff82d0bffce880>] ffff82d0bffce880

This seems to be a crash in the stub page of cpu 48.

I don't think this is related to the scheduler, but to stub page
handling.

Can you please try the attached patch?


Juergen

--------------74F0E2186D38737332F849E7
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-x86-clear-per-cpu-stub-page-information-in-cpu_s.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename*0="0001-xen-x86-clear-per-cpu-stub-page-information-in-cpu_s.pa";
 filename*1="tch"

From 6067e84192b1c5aaa4675437c3d2a743d18c7c7d Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Date: Wed, 8 Jan 2020 11:41:17 +0100
Subject: [PATCH] xen/x86: clear per cpu stub page information in
 cpu_smpboot_free()

cpu_smpboot_free() removes the stubs for the cpu going offline, but it
isn't clearing the related percpu variables. This will result in
crashes when a stub page is released due to all related cpus gone
offline and one of those cpus going online later.

Fix that by clearing stubs.addr and stubs.mfn in order to allocate a
new sub page when needed.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/x86/smpboot.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 7e29704080..46c0729214 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -945,6 +945,8 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
                              (per_cpu(stubs.addr, cpu) | ~PAGE_MASK) + 1);
         if ( i == STUBS_PER_PAGE )
             free_domheap_page(mfn_to_page(mfn));
+        per_cpu(stubs.addr, cpu) = 0;
+        per_cpu(stubs.mfn, cpu) = 0;
     }
 
     FREE_XENHEAP_PAGE(per_cpu(compat_gdt, cpu));
-- 
2.16.4


--------------74F0E2186D38737332F849E7
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------74F0E2186D38737332F849E7--

