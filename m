Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A614A1F7B32
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 17:57:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjm3e-0006RM-DH; Fri, 12 Jun 2020 15:57:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5h37=7Z=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jjm3c-0006K0-3i
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 15:57:28 +0000
X-Inumbo-ID: 64878f00-acc5-11ea-b5e3-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64878f00-acc5-11ea-b5e3-12813bfff9fa;
 Fri, 12 Jun 2020 15:57:18 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: eRFtV+V4WhEVoVjHDyCMwnWyvoCyKAzxQJKaFS42Ybaa5AaK/TbaSitMe4MGEUWWVFlyq8X3S2
 f3+EWI/Ns2FNkYx30rBE4krpVQyHehlYT6KJQKkGHr+4PVrfFz8oyU+OUlDW60iE2BLyBDcfSE
 B+L2Qe935SRk+mUjCIp9SCOOZIHERNKdjx+g32oADaAl4TqkDG+68q6P6SJxyWUdn7BW3xHCZ8
 4yH5ysQPR3jylPczxBDa0cNVkMigf/nMSpg5E3cG3Kw+3C37tcK2PE52UEHn1QyOFSHBc8t/5l
 XZM=
X-SBRS: 2.7
X-MesageID: 20213502
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,503,1583211600"; d="scan'208";a="20213502"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14 4/8] x86/vpt: only try to resume timers belonging to
 enabled devices
Date: Fri, 12 Jun 2020 17:56:36 +0200
Message-ID: <20200612155640.4101-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200612155640.4101-1-roger.pau@citrix.com>
References: <20200612155640.4101-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Check whether the emulated device is actually enabled before trying to
resume the associated timers.

Thankfully all those structures are zeroed at initialization, and
since the devices are not enabled they are never populated, which
triggers the pt->vcpu check at the beginning of pt_resume forcing an
exit from the function.

While there limit the scope of i and make it unsigned.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vpt.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index 47f2c2aa64..62c87867c5 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -636,14 +636,19 @@ static void pt_resume(struct periodic_time *pt)
 
 void pt_may_unmask_irq(struct domain *d, struct periodic_time *vlapic_pt)
 {
-    int i;
-
     if ( d )
     {
-        pt_resume(&d->arch.vpit.pt0);
-        pt_resume(&d->arch.hvm.pl_time->vrtc.pt);
-        for ( i = 0; i < HPET_TIMER_NUM; i++ )
-            pt_resume(&d->arch.hvm.pl_time->vhpet.pt[i]);
+        if ( has_vpit(d) )
+            pt_resume(&d->arch.vpit.pt0);
+        if ( has_vrtc(d) )
+            pt_resume(&d->arch.hvm.pl_time->vrtc.pt);
+        if ( has_vhpet(d) )
+        {
+            unsigned int i;
+
+            for ( i = 0; i < HPET_TIMER_NUM; i++ )
+                pt_resume(&d->arch.hvm.pl_time->vhpet.pt[i]);
+        }
     }
 
     if ( vlapic_pt )
-- 
2.26.2


