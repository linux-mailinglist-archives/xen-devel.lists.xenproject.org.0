Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E362E00CB
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 11:30:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMqSD-00089G-D9; Tue, 22 Oct 2019 09:27:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jyZJ=YP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iMqSB-00089A-R9
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 09:27:47 +0000
X-Inumbo-ID: 33c58677-f4ae-11e9-9464-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33c58677-f4ae-11e9-9464-12813bfff9fa;
 Tue, 22 Oct 2019 09:27:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1D2F1B89F;
 Tue, 22 Oct 2019 09:27:44 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <99e719cc-936e-c3a7-c94e-ca92b6905960@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <78a0e2bd-b061-99c5-aab7-970e8fc353bc@suse.com>
Date: Tue, 22 Oct 2019 11:27:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <99e719cc-936e-c3a7-c94e-ca92b6905960@citrix.com>
Content-Type: multipart/mixed; boundary="------------B9D1A734DA845F84428FD4E1"
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
--------------B9D1A734DA845F84428FD4E1
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

And now a more sane patch to try.


Juergen


--------------B9D1A734DA845F84428FD4E1
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-pvhsim-fix-cpu-onlining.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="0001-xen-pvhsim-fix-cpu-onlining.patch"

From 205b7622b84bc678f8a0d6ac121dff14439fe331 Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Date: Tue, 22 Oct 2019 11:14:08 +0200
Subject: [PATCH] xen/pvhsim: fix cpu onlining

Since commit 8d3c326f6756d1 ("xen: let vcpu_create() select processor")
the initial processor for all pv-shim vcpus will be 0, as no other cpus
are online when the vcpus are created. Before that commit the vcpus
would have processors set not being online yet, which worked just by
chance.

When the pv-shim vcpu becomes active it will have a hard affinity
not matching its initial processor assignment leading to failing
ASSERT()s or other problems depending on the selected scheduler.

Fix that by redoing the affinity setting after onlining the cpu but
before taking the vcpu up.

Fixes: 8d3c326f6756d1 ("xen: let vcpu_create() select processor")
Reported-by: Sergey Dyasli <sergey.dyasli@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/x86/pv/shim.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index 5edbcd9ac5..4329eaaefe 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -837,6 +837,8 @@ long pv_shim_cpu_up(void *data)
                     v->vcpu_id, rc);
             return rc;
         }
+
+        vcpu_set_hard_affinity(v, cpumask_of(v->vcpu_id));
     }
 
     wake = test_and_clear_bit(_VPF_down, &v->pause_flags);
-- 
2.16.4


--------------B9D1A734DA845F84428FD4E1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------B9D1A734DA845F84428FD4E1--

