Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE0081CF9F
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 23:02:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659690.1029418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGnZf-00072M-Eu; Fri, 22 Dec 2023 22:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659690.1029418; Fri, 22 Dec 2023 22:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGnZf-00070M-Ba; Fri, 22 Dec 2023 22:00:55 +0000
Received: by outflank-mailman (input) for mailman id 659690;
 Fri, 22 Dec 2023 22:00:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kBLA=IB=citrix.com=prvs=713b4d154=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rGnZd-00070E-Si
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 22:00:53 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9087d4e4-a115-11ee-98ec-6d05b1d4d9a1;
 Fri, 22 Dec 2023 23:00:50 +0100 (CET)
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
X-Inumbo-ID: 9087d4e4-a115-11ee-98ec-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1703282450;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NyMn+F+hFZOalcCl7Sy3A/+RiZ6ShplbOULfWH5F7dw=;
  b=F3DgkLKkJMjCaHFchcqAzy9Y7TYHFcfQxu9rOJKmSoZmnmkXqNuPIr12
   L04F6MKFqrLT0ewp+O6wAWpRZHZCZlfUJmQlKCek9HgDkVDPmo80ACtlH
   FjTvD9Z9c3C8hhm53iAFVX2JIP500iTpJ6XrGCs9f8Q8IH5/e89VBtib4
   0=;
X-CSE-ConnectionGUID: yRHRQTKUQCOAJOn1oXFaXg==
X-CSE-MsgGUID: ZY7ktRjsRZeVoCWnrg2U4Q==
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 128969904
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:tmoGEqAe5NEh8xVW/3Ljw5YqxClBgxIJ4kV8jS/XYbTApDlw0zZVy
 DcWXzjVP6qOMDTzL9lwbIm/9kgAsZCBm4U2QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48D8kk/nOH+KgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMt8pvlDs15K6p4WlC5ARlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw69xXO1hy1
 sEhAxckTDeF3uWG7ruLRbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdIL2U3BPjDS0Qn1lM/IZQyhuq3wFL4dCVVsgm9rqsr+WnDigd21dABNfKMIIzbG5QExhrwS
 mTuzVWmAQ0gNsel+ze79VmTgPXAxx6nYddHfFG/3qEz2wDCroAJMzUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiH2DuAQVV5xPEuk5wAaXw6HQ7kCSAW1sZhxrZcEitcQ2bSc3z
 VLPlNTsbRRwtJWFRHTb8a2bxQ5eIgBMczVEP3VdC1JYsp+8+Onfky4jUP5yKo6Pt+HWJAjb5
 Bmoiy5ngIU9hP4EgvDTEU/8v968mnTYZldqvl6NATv/v14RWWKzW2C/BbHmARd8wGWxFADpU
 IAswZT20Qz3JcjleNaxaOsMBqq1wP2OLSfRh1Vid7F4qGz2oSH7J9wBumgnTKuMDirjUWa4C
 HI/RCsLvMMDVJdURf4fj32N5zQCkvG7SIWNugH8ZdtSeJlhHDJrDwk3DXN8K1vFyRB2+YlmY
 MfzTCpZJSpCYUiR5GbsFrh1PH5C7nxW+F4/srihlEv+iefOOiTLIVrHWXPXBt0EAGq/iF292
 75i2wGikn2zjMWWjvHrzLMu
IronPort-HdrOrdr: A9a23:ZIgAgqD0V6tEll/lHemg55DYdb4zR+YMi2TC1yhKJyC9Ffbo8P
 xG/c5rsSMc5wxwZJhNo7y90cq7MBbhHPxOkOos1N6ZNWGM0gaVxelZnO3fKlbbehEWmNQz6U
 4ZSdkdNOHN
X-Talos-CUID: =?us-ascii?q?9a23=3AlLbd3Gqt/4oQfiWw/dIMROrmUdEfUkfk8FTtGmS?=
 =?us-ascii?q?fIEROTuSSeXGZyKwxxg=3D=3D?=
X-Talos-MUID: 9a23:iXqgHgnNVHQMBQdfhhNOdnpQBZhr/56sE3o/nKsBkPaCLyMqBmuk2WE=
X-IronPort-AV: E=Sophos;i="6.04,297,1695700800"; 
   d="scan'208";a="128969904"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, "Jan
 Beulich" <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] xen/livepatch: Make check_for_livepatch_work() faster in the common case
Date: Fri, 22 Dec 2023 22:00:45 +0000
Message-ID: <20231222220045.2840714-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

When livepatching is enabled, this function is used all the time.  Really do
check the fastpath first, and annotate it likely() as this is the right answer
100% of the time (to many significant figures).

This cuts out 3 pointer dereferences in the "nothing to do path", and it seems
the optimiser has an easier time too.  Bloat-o-meter reports:

  add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-57 (-57)
  Function                                     old     new   delta
  check_for_livepatch_work.cold               1201    1183     -18
  check_for_livepatch_work                    1021     982     -39

which isn't too shabby for no logical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

I'm still a little disappointed with the code generation.  GCC still chooses
to set up the full stack frame (6 regs, +3 more slots) intermixed with the
per-cpu calculations.

In isolation, GCC can check the boolean without creating a stack frame:

  <work_to_to>:
    48 89 e2                mov    %rsp,%rdx
    48 8d 05 de e1 37 00    lea    0x37e1de(%rip),%rax        # ffff82d0405b6068 <per_cpu__work_to_do>
    48 81 ca ff 7f 00 00    or     $0x7fff,%rdx
    8b 4a c1                mov    -0x3f(%rdx),%ecx
    48 8d 15 45 aa 39 00    lea    0x39aa45(%rip),%rdx        # ffff82d0405d28e0 <__per_cpu_offset>
    48 8b 14 ca             mov    (%rdx,%rcx,8),%rdx
    0f b6 04 02             movzbl (%rdx,%rax,1),%eax
    c3                      retq

but I can't find a way to convince GCC that it would be worth not setting up a
stack frame in in the common case, and having a few extra mov reg/reg's later
in the uncommon case.

I haven't tried manually splitting the function into a check() and a do()
function.  Views on whether that might be acceptable?  At a guess, do() would
need to be a static noinline to avoid it turning back into what it currently
is.
---
 xen/common/livepatch.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 1209fea2566c..b6275339f663 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -1706,15 +1706,15 @@ void check_for_livepatch_work(void)
     s_time_t timeout;
     unsigned long flags;
 
+    /* Fast path: no work to do. */
+    if ( likely(!per_cpu(work_to_do, cpu)) )
+        return;
+
     /* Only do any work when invoked in truly idle state. */
     if ( system_state != SYS_STATE_active ||
          !is_idle_domain(current->sched_unit->domain) )
         return;
 
-    /* Fast path: no work to do. */
-    if ( !per_cpu(work_to_do, cpu ) )
-        return;
-
     smp_rmb();
     /* In case we aborted, other CPUs can skip right away. */
     if ( !livepatch_work.do_work )

base-commit: 49818cde637b5ec20383e46b71f93b2e7d867686
-- 
2.30.2


