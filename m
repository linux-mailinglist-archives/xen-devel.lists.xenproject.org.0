Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 683F7DEA2C
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 12:57:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMVIQ-0006k0-Ko; Mon, 21 Oct 2019 10:52:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QP7N=YO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iMVIO-0006jv-NN
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 10:52:16 +0000
X-Inumbo-ID: d5c30eba-f3f0-11e9-944b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5c30eba-f3f0-11e9-944b-12813bfff9fa;
 Mon, 21 Oct 2019 10:52:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 11751B147;
 Mon, 21 Oct 2019 10:52:11 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <99e719cc-936e-c3a7-c94e-ca92b6905960@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2999dbd9-0e6d-3340-5915-0d76dd906e22@suse.com>
Date: Mon, 21 Oct 2019 12:52:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <99e719cc-936e-c3a7-c94e-ca92b6905960@citrix.com>
Content-Type: multipart/mixed; boundary="------------CED1E4E837E7F7CB8FE8BB4B"
Content-Language: en-US
Subject: Re: [Xen-devel] PV-shim 4.13 assertion failures during vcpu_wake()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <George.Dunlap@citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--------------CED1E4E837E7F7CB8FE8BB4B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.10.19 11:51, Sergey Dyasli wrote:
> Hello,
> 
> While testing pv-shim from a snapshot of staging 4.13 branch (with core-
> scheduling patches applied), some sort of scheduling issues were uncovered
> which usually leads to a guest lockup (sometimes with soft lockup messages
> from Linux kernel).
> 
> This happens more frequently on SandyBridge CPUs. After enabling
> CONFIG_DEBUG in pv-shim, the following assertions failed:
> 
> Null scheduler:
> 
>      Assertion 'lock == get_sched_res(i->res->master_cpu)->schedule_lock' failed at ...are/xen-dir/xen-root/xen/include/xen/sched-if.h:278
>      (full crash log: https://paste.debian.net/1108861/ )
> 
> Credit1 scheduler:
> 
>      Assertion 'cpumask_cycle(cpu, unit->cpu_hard_affinity) == cpu' failed at sched_credit.c:383
>      (full crash log: https://paste.debian.net/1108862/ )
> 
> I'm currently investigation those, but would appreciate any help or
> suggestions.

Hmm, I think that pv_shim_cpu_up() shouldn't do the vcpu_wake(), but the
caller.

Does the attached patch help?


Juergen

--------------CED1E4E837E7F7CB8FE8BB4B
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-shim-fix-pv-shim-cpu-up-down.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-xen-shim-fix-pv-shim-cpu-up-down.patch"

From 068ea0419d1a67e967b9431ed11e24b731cd357f Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
Date: Mon, 21 Oct 2019 12:28:33 +0200
Subject: [PATCH] xen/shim: fix pv-shim cpu up/down

Calling vcpu_wake() from pv_shim_cpu_up() is wrong as it is not yet
sure that the correct scheduler has taken over the cpu. Doing the
call after continue_hypercall_on_cpu() is correct, so let
pv_shim_cpu_up() just online the cpu.

Adapt pv_shim_cpu_down() to be symmetric, even if that is not
required for correctness.

Reported-by: Sergey Dyasli <sergey.dyasli@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/x86/pv/shim.c | 16 ----------------
 xen/common/domain.c    | 31 ++++++++++++++++++-------------
 2 files changed, 18 insertions(+), 29 deletions(-)

diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index 5edbcd9ac5..bc6a2f3eb9 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -815,16 +815,11 @@ long pv_shim_cpu_up(void *data)
 {
     struct vcpu *v = data;
     struct domain *d = v->domain;
-    bool wake;
 
     BUG_ON(smp_processor_id() != 0);
 
-    domain_lock(d);
     if ( !v->is_initialised )
-    {
         domain_unlock(d);
-        return -EINVAL;
-    }
 
     if ( !cpu_online(v->vcpu_id) )
     {
@@ -832,18 +827,12 @@ long pv_shim_cpu_up(void *data)
 
         if ( rc )
         {
-            domain_unlock(d);
             gprintk(XENLOG_ERR, "Failed to bring up CPU#%u: %ld\n",
                     v->vcpu_id, rc);
             return rc;
         }
     }
 
-    wake = test_and_clear_bit(_VPF_down, &v->pause_flags);
-    domain_unlock(d);
-    if ( wake )
-        vcpu_wake(v);
-
     return 0;
 }
 
@@ -852,11 +841,6 @@ long pv_shim_cpu_down(void *data)
     struct vcpu *v = data;
     long rc;
 
-    BUG_ON(smp_processor_id() != 0);
-
-    if ( !test_and_set_bit(_VPF_down, &v->pause_flags) )
-        vcpu_sleep_sync(v);
-
     if ( cpu_online(v->vcpu_id) )
     {
         rc = cpu_down_helper((void *)(unsigned long)v->vcpu_id);
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 9c7360ed2a..e83657e310 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1428,19 +1428,21 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
         break;
 
     case VCPUOP_up:
-#ifdef CONFIG_X86
-        if ( pv_shim )
-            rc = continue_hypercall_on_cpu(0, pv_shim_cpu_up, v);
-        else
-#endif
         {
             bool wake = false;
 
             domain_lock(d);
-            if ( !v->is_initialised )
-                rc = -EINVAL;
-            else
-                wake = test_and_clear_bit(_VPF_down, &v->pause_flags);
+#ifdef CONFIG_X86
+            if ( pv_shim )
+                rc = continue_hypercall_on_cpu(0, pv_shim_cpu_up, v);
+#endif
+            if ( !rc )
+            {
+                if ( !v->is_initialised )
+                    rc = -EINVAL;
+                else
+                    wake = test_and_clear_bit(_VPF_down, &v->pause_flags);
+            }
             domain_unlock(d);
             if ( wake )
                 vcpu_wake(v);
@@ -1465,14 +1467,17 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
         rc = 0;
         v = d->vcpu[vcpuid];
 
+#ifdef CONFIG_X86
+        BUG_ON(pv_shim && smp_processor_id() != 0);
+#endif
+
+        if ( !test_and_set_bit(_VPF_down, &v->pause_flags) )
+            vcpu_sleep_nosync(v);
+
 #ifdef CONFIG_X86
         if ( pv_shim )
             rc = continue_hypercall_on_cpu(0, pv_shim_cpu_down, v);
-        else
 #endif
-            if ( !test_and_set_bit(_VPF_down, &v->pause_flags) )
-                vcpu_sleep_nosync(v);
-
         break;
 
     case VCPUOP_is_up:
-- 
2.16.4


--------------CED1E4E837E7F7CB8FE8BB4B
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------CED1E4E837E7F7CB8FE8BB4B--

