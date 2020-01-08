Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C35DC133C74
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 08:52:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ip66f-0001GB-Mp; Wed, 08 Jan 2020 07:50:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Mkji=25=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ip66e-0001G2-AY
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 07:50:20 +0000
X-Inumbo-ID: 7ea311e6-31eb-11ea-bf56-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ea311e6-31eb-11ea-bf56-bc764e2007e4;
 Wed, 08 Jan 2020 07:50:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 61FC3AD2C;
 Wed,  8 Jan 2020 07:50:09 +0000 (UTC)
To: Tao Xu <tao3.xu@intel.com>, xen-devel@lists.xenproject.org
References: <764d3c88-ce22-c968-9169-896892aa55e5@intel.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <61d03b85-fd54-f6a0-dcd5-8fda2194a9f0@suse.com>
Date: Wed, 8 Jan 2020 08:50:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <764d3c88-ce22-c968-9169-896892aa55e5@intel.com>
Content-Type: multipart/mixed; boundary="------------460BD9A454F1DC7E39B39B94"
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
--------------460BD9A454F1DC7E39B39B94
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08.01.20 06:50, Tao Xu wrote:
> Hi,
> 
> When I use xen-hptool cpu-offline/cpu-online to let CPU in a socket 
> online/offline using the script as follows:
> 
> for((j=48;j<=95;j++));
> do
>    xen-hptool cpu-offline $j
> done
> 
> for((j=48;j<=95;j++));
> do
>    xen-hptool cpu-online $j
> done
> 
> Xen crash when cpu re-online. I use the upstream XEN(0dd92688) and try 
> many days, it still crash. But if I only do cpu online/offline for CPU 
> 48~59, Xen will not crash. The bug can be reproduced when we do cpu 
> online/offline for most CPU in a socket. And interesting thing is when 
> we use the script as follow:
> 
> for((j=48;j<=95;j++));
> do
>    xen-hptool cpu-offline $j
>    xen-hptool cpu-online $j
> done
> 
> Xen will not crash too. Is there a bug in sched_credit2?
> 
> The crash message as follows:
> 
> (XEN) Adding cpu 77 to runqueue 1
> (XEN) Adding cpu 78 to runqueue 1
> (XEN) Adding cpu 79 to runqueue 1
> (XEN) Adding cpu 80 to runqueue 1
> (X(ENXE) N) *** DOUBLE FAULT ***
> (XEN) Assertion 'debug->cpu == smp_processor_id()' failed at spinlock.c:88
> (XEN) ----[ Xen-4.14-unstable  x86_64  debug=y   Not tainted ]----
> (XEN) Debugging connection not set up.
> (XEN) CPU:    48
> (XEN) ----[ Xen-4.14-unstable  x86_64  debug=y   Not tainted ]----
> (XEN) CPU:    0
> (XEN) RIP:    e008:[<ffff82d080240bfc>] _spin_unlock+0x40/0x42

So the original problem causes a double fault, but spinlock debugging
causes a subsequent panic.

Can you please retry the tests with the attached patch? It should
result in diagnostic data related to the real problem.


Juergen

--------------460BD9A454F1DC7E39B39B94
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-spinlock-disable-spinlock-debugging-in-console_f.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-xen-spinlock-disable-spinlock-debugging-in-console_f.pa";
 filename*1="tch"

From 1e84395de9ae532a479706ff74f50040f25041fa Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
Date: Wed, 8 Jan 2020 08:43:53 +0100
Subject: [PATCH] xen/spinlock: disable spinlock debugging in
 console_force_unlock()

console_force_unlock() might result in subsequent ASSERT() triggering
when CONFIG_DEBUG_LOCKS was active. Avoid that by calling
spin_debug_disable() in console_force_unlock() and make the spinlock
debug assertions trigger only if spin_debug was active.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/spinlock.c      | 2 +-
 xen/drivers/char/console.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index ed69f0a4d2..43c3a437e8 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -85,7 +85,7 @@ static void got_lock(union lock_debug *debug)
 
 static void rel_lock(union lock_debug *debug)
 {
-    ASSERT(debug->cpu == smp_processor_id());
+    ASSERT(atomic_read(&spin_debug) > 0 || debug->cpu == smp_processor_id());
     debug->cpu = SPINLOCK_NO_CPU;
 }
 
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index b31d789a5d..4bcbbfa7d6 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1077,6 +1077,7 @@ void console_unlock_recursive_irqrestore(unsigned long flags)
 void console_force_unlock(void)
 {
     watchdog_disable();
+    spin_debug_disable();
     spin_lock_init(&console_lock);
     serial_force_unlock(sercon_handle);
     console_locks_busted = 1;
-- 
2.16.4


--------------460BD9A454F1DC7E39B39B94
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------460BD9A454F1DC7E39B39B94--

