Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2850F155375
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 09:06:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izycR-0002tb-8c; Fri, 07 Feb 2020 08:04:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nQzt=33=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1izycP-0002tW-T9
 for xen-devel@lists.xen.org; Fri, 07 Feb 2020 08:04:05 +0000
X-Inumbo-ID: 6847e91a-4980-11ea-a759-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6847e91a-4980-11ea-a759-bc764e2007e4;
 Fri, 07 Feb 2020 08:04:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B3772B021;
 Fri,  7 Feb 2020 08:04:03 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xen.org>
References: <6722f058-61eb-30c9-f97d-def690ccd7b8@citrix.com>
 <6a3aa771-927b-b3bd-dd05-1eea90b0a97f@suse.com>
 <6f3a1061-fd05-91e8-54ad-666ec3984ffb@citrix.com>
 <c5831cef-ff27-93e5-7536-2d6092ca1ad8@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <38a28a9d-cc99-0776-1f8b-4103df3d3e9c@suse.com>
Date: Fri, 7 Feb 2020 09:04:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <c5831cef-ff27-93e5-7536-2d6092ca1ad8@citrix.com>
Content-Type: multipart/mixed; boundary="------------AB4A19FC38B9C597FF1157A5"
Content-Language: en-US
Subject: Re: [Xen-devel] Live-Patch application failure in core-scheduling
 mode
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
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--------------AB4A19FC38B9C597FF1157A5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06.02.20 15:02, Sergey Dyasli wrote:
> On 06/02/2020 11:05, Sergey Dyasli wrote:
>> On 06/02/2020 09:57, Jürgen Groß wrote:
>>> On 05.02.20 17:03, Sergey Dyasli wrote:
>>>> Hello,
>>>>
>>>> I'm currently investigating a Live-Patch application failure in core-
>>>> scheduling mode and this is an example of what I usually get:
>>>> (it's easily reproducible)
>>>>
>>>>       (XEN) [  342.528305] livepatch: lp: CPU8 - IPIing the other 15 CPUs
>>>>       (XEN) [  342.558340] livepatch: lp: Timed out on semaphore in CPU quiesce phase 13/15
>>>>       (XEN) [  342.558343] bad cpus: 6 9
>>>>
>>>>       (XEN) [  342.559293] CPU:    6
>>>>       (XEN) [  342.559562] Xen call trace:
>>>>       (XEN) [  342.559565]    [<ffff82d08023f304>] R common/schedule.c#sched_wait_rendezvous_in+0xa4/0x270
>>>>       (XEN) [  342.559568]    [<ffff82d08023f8aa>] F common/schedule.c#schedule+0x17a/0x260
>>>>       (XEN) [  342.559571]    [<ffff82d080240d5a>] F common/softirq.c#__do_softirq+0x5a/0x90
>>>>       (XEN) [  342.559574]    [<ffff82d080278ec5>] F arch/x86/domain.c#guest_idle_loop+0x35/0x60
>>>>
>>>>       (XEN) [  342.559761] CPU:    9
>>>>       (XEN) [  342.560026] Xen call trace:
>>>>       (XEN) [  342.560029]    [<ffff82d080241661>] R _spin_lock_irq+0x11/0x40
>>>>       (XEN) [  342.560032]    [<ffff82d08023f323>] F common/schedule.c#sched_wait_rendezvous_in+0xc3/0x270
>>>>       (XEN) [  342.560036]    [<ffff82d08023f8aa>] F common/schedule.c#schedule+0x17a/0x260
>>>>       (XEN) [  342.560039]    [<ffff82d080240d5a>] F common/softirq.c#__do_softirq+0x5a/0x90
>>>>       (XEN) [  342.560042]    [<ffff82d080279db5>] F arch/x86/domain.c#idle_loop+0x55/0xb0
>>>>
>>>> The first HT sibling is waiting for the second in the LP-application
>>>> context while the second waits for the first in the scheduler context.
>>>>
>>>> Any suggestions on how to improve this situation are welcome.
>>>
>>> Can you test the attached patch, please? It is only tested to boot, so
>>> I did no livepatch tests with it.
>>
>> Thank you for the patch! It seems to fix the issue in my manual testing.
>> I'm going to submit automatic LP testing for both thread/core modes.
> 
> Andrew suggested to test late ucode loading as well and so I did.
> It uses stop_machine() to rendezvous cpus and it failed with a similar
> backtrace for a problematic CPU. But in this case the system crashed
> since there is no timeout involved:
> 
>      (XEN) [  155.025168] Xen call trace:
>      (XEN) [  155.040095]    [<ffff82d0802417f2>] R _spin_unlock_irq+0x22/0x30
>      (XEN) [  155.069549]    [<ffff82d08023f3c2>] S common/schedule.c#sched_wait_rendezvous_in+0xa2/0x270
>      (XEN) [  155.109696]    [<ffff82d08023f728>] F common/schedule.c#sched_slave+0x198/0x260
>      (XEN) [  155.145521]    [<ffff82d080240e1a>] F common/softirq.c#__do_softirq+0x5a/0x90
>      (XEN) [  155.180223]    [<ffff82d0803716f6>] F x86_64/entry.S#process_softirqs+0x6/0x20
> 
> It looks like your patch provides a workaround for LP case, but other
> cases like stop_machine() remain broken since the underlying issue with
> the scheduler is still there.

And here is the fix for ucode loading (that was in fact the only case
where stop_machine_run() wasn't already called in a tasklet).

I have done a manual test loading new ucode with core scheduling
active.


Juergen

--------------AB4A19FC38B9C597FF1157A5
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-make-sure-stop_machine_run-is-always-called-in-a.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename*0="0001-xen-make-sure-stop_machine_run-is-always-called-in-a.pa";
 filename*1="tch"

From 4bfa45935c791c28814565cd261f4d5ff640653c Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Julien Grall <julien@xen.org>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Date: Thu, 6 Feb 2020 15:39:32 +0100
Subject: [PATCH] xen: make sure stop_machine_run() is always called in a
 tasklet

With core scheduling active it is mandatory for stop_machine_run() to
be called in a tasklet only.

Put a BUG_ON() into stop_machine_run() to test for this being sure
and adapt the missing call site (ucode loading).

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/x86/microcode.c  | 54 +++++++++++++++++++++++++++++------------------
 xen/common/stop_machine.c |  1 +
 2 files changed, 35 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/microcode.c b/xen/arch/x86/microcode.c
index c0fb690f79..3efdf8269a 100644
--- a/xen/arch/x86/microcode.c
+++ b/xen/arch/x86/microcode.c
@@ -561,30 +561,18 @@ static int do_microcode_update(void *patch)
     return ret;
 }
 
-int microcode_update(XEN_GUEST_HANDLE_PARAM(const_void) buf, unsigned long len)
+struct ucode_buf {
+    unsigned long len;
+    char buffer[];
+};
+
+static long microcode_update_helper(void *data)
 {
     int ret;
-    void *buffer;
+    struct ucode_buf *buffer = data;
     unsigned int cpu, updated;
     struct microcode_patch *patch;
 
-    if ( len != (uint32_t)len )
-        return -E2BIG;
-
-    if ( microcode_ops == NULL )
-        return -EINVAL;
-
-    buffer = xmalloc_bytes(len);
-    if ( !buffer )
-        return -ENOMEM;
-
-    ret = copy_from_guest(buffer, buf, len);
-    if ( ret )
-    {
-        xfree(buffer);
-        return -EFAULT;
-    }
-
     /* cpu_online_map must not change during update */
     if ( !get_cpu_maps() )
     {
@@ -606,7 +594,7 @@ int microcode_update(XEN_GUEST_HANDLE_PARAM(const_void) buf, unsigned long len)
         return -EPERM;
     }
 
-    patch = parse_blob(buffer, len);
+    patch = parse_blob(buffer->buffer, buffer->len);
     xfree(buffer);
     if ( IS_ERR(patch) )
     {
@@ -699,6 +687,32 @@ int microcode_update(XEN_GUEST_HANDLE_PARAM(const_void) buf, unsigned long len)
     return ret;
 }
 
+int microcode_update(XEN_GUEST_HANDLE_PARAM(const_void) buf, unsigned long len)
+{
+    int ret;
+    struct ucode_buf *buffer;
+
+    if ( len != (uint32_t)len )
+        return -E2BIG;
+
+    if ( microcode_ops == NULL )
+        return -EINVAL;
+
+    buffer = xmalloc_bytes(len + sizeof(*buffer));
+    if ( !buffer )
+        return -ENOMEM;
+
+    ret = copy_from_guest(buffer->buffer, buf, len);
+    if ( ret )
+    {
+        xfree(buffer);
+        return -EFAULT;
+    }
+    buffer->len = len;
+
+    return continue_hypercall_on_cpu(0, microcode_update_helper, buffer);
+}
+
 static int __init microcode_init(void)
 {
     /*
diff --git a/xen/common/stop_machine.c b/xen/common/stop_machine.c
index 33d9602217..fe7f7d4447 100644
--- a/xen/common/stop_machine.c
+++ b/xen/common/stop_machine.c
@@ -74,6 +74,7 @@ int stop_machine_run(int (*fn)(void *), void *data, unsigned int cpu)
     int ret;
 
     BUG_ON(!local_irq_is_enabled());
+    BUG_ON(!is_idle_vcpu(current));
 
     /* cpu_online_map must not change. */
     if ( !get_cpu_maps() )
-- 
2.16.4


--------------AB4A19FC38B9C597FF1157A5
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------AB4A19FC38B9C597FF1157A5--

