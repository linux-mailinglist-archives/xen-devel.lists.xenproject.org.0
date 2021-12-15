Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C63B4476595
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 23:22:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247620.427028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxcei-0006Rw-Hx; Wed, 15 Dec 2021 22:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247620.427028; Wed, 15 Dec 2021 22:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxcei-0006MT-B5; Wed, 15 Dec 2021 22:21:48 +0000
Received: by outflank-mailman (input) for mailman id 247620;
 Wed, 15 Dec 2021 22:21:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LTfI=RA=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mxceg-0005ZJ-Mu
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 22:21:46 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62bea4b9-5df5-11ec-9e60-abaf8a552007;
 Wed, 15 Dec 2021 23:21:45 +0100 (CET)
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
X-Inumbo-ID: 62bea4b9-5df5-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639606904;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1sJTP2vFe7TUxYv8fxcjX4sbJWFBPyrCwJr81dmHE5A=;
  b=QZlKSctVc7MTYak1OnqQnE1rJ+kPqbYcnj8AIElwLlb1oOERCo4OCu1l
   VsStOEmPf8xgpYShKkK3f8ycDfgs7/2SufZBtXUAoSI0o93s3WI4Sz1CW
   diN4uXMYqwseUYdZzdrcpCQW6ORzmgWtNKQeof7dioQ5I5j6+z8+Zp5NN
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: bfkV+bUSFRfie8G58yskNAm4RdSahQqULovzT5f9dhAknp/T5GNtOf8ZeXBSQKfRdy3v1vVCBq
 lQK2SsfV1r9xKzD0gbdWMD1TfhIb/Wt9qpEZLfSGLNk+aATyywmS8tpmCzl8ElI6mCPdoXxPe+
 vuFMuj6LGgeodUm6Lw6ZCCVqS2kQEMxy+r970Wzlq01hhdeuJ05wS0Q0KJSJ9q+1Qhd4HdIgC+
 Syt+Kx6eWE3oUW5ox8NazXPJqyPbZLHWRAUvE2I0JW1Xf/ZJArYF4nxOJdso9Q72ECeVqvqvVd
 kQSH6MxtmU0pvDCYpg3fpFzv
X-SBRS: 5.1
X-MesageID: 60126720
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2F+FPqMM72hx4RrvrR1okMFynXyQoLVcMsEvi/4bfWQNrUp01TEFz
 TccWWyCPf6LYWDwL48latvgo0MH7JLSn9FmQQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En5400s+w7VRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYowuktOhvx
 NBkj4WbcSc0fbXxsdgHXDANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgm9p3J4RR662i
 8wxSjVORx38PjB1BFYcLpYgt9imgHf9WmgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m66j
 G/b+2XyAjkBKceSjzGC9xqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvla6kzUkRdZVOtcjwzmt1+nM3i+lHGctG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnF447SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCslNOZJhKTysDA3CMqsyq7DFDFtW
 1BexKCjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9sBvWAlexc0aJ5fEdMMX
 KM1kVkLjHO0FCH1BZKbnqrrU5h6pUQePYqNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm3FmrUuOFMuT50n2jtKjiIu9FO5t3K2mNbtisstpYWz9r
 r5iCid940kFDbClPHCIqdV7wJJjBSFTOK0aYvd/LoarSjeK0kl7YxMI6b9+KYFjgYpPkeLEo
 iO0VkNCkQKtjnzbMwSaLHtkbeq3D5p4qHs6Ow0qPEqphCd/Mdr+sv9HestlZ6Qj+cxi0eVwE
 6sPdfKfD6kdUT/A4TkcM8Xw9dQwaBSxiAuSFCO5ezxjLYV4TgnE94a8LAvi/SUDFAStss46r
 +Hy3w/XW8NbFQ9jENzXeLSkyFbo5SoRn+d7Xk3pJNhPeRqzrNg2enKp1vJuepMCMxTOwDeex
 j26OxZAqLmfuZIx/fnImbuA89WjHdxhExcIBGLc97u3a3XXpzLx3Y9aXe+UVjnBT2eoqr66b
 OBYwvygYv0KmFFG79h1H7pxlP9s4tLuo/lRzxh+HWWNZFOuU+syLn6D1MhJl6tM2r4G5lfmB
 hPRooFXaeeTJcfoMF8NPw50PO2M2MYdliTW8flocl7x4zV6/ebfXEhfV/VWZPex8Feh3FsZ/
 Noc
IronPort-HdrOrdr: A9a23:EaD/Nqp0yV2NSod8zw6W+rcaV5rReYIsimQD101hICG9Evb0qy
 lhppQmPH7P+VIssRQb8+xoV5PufZqxz/BICOoqTNKftWvdyQiVxehZhOOP/9SJIUbDH4VmpM
 VdmsZFaeEZDTJB/LvHCAvTKadd/DFQmprY+ts3zB1WPH9Xg7kL1XYfNu4CeHcGPzWvA/ACZf
 yhz/sCnRWMU1INYP+2A3EUNtKz3eEixPrdEGc77wdM0nj3sQ+V
X-IronPort-AV: E=Sophos;i="5.88,209,1635220800"; 
   d="scan'208";a="60126720"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/4] x86/cpuid: Introduce dom0-cpuid command line option
Date: Wed, 15 Dec 2021 22:21:14 +0000
Message-ID: <20211215222115.6829-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211215222115.6829-1-andrew.cooper3@citrix.com>
References: <20211215222115.6829-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Specifically, this lets the user opt in to non-default for dom0.

Collect all dom0 settings together in dom0_{en,dis}able_feat[], and apply it
to dom0's policy when other tweaks are being made.

As recalculate_cpuid_policy() is an expensive action, and dom0-cpuid= is
likely to only be used by the x86 maintainers for development purposes, forgo
the recalculation in the general case.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Rework almost from scratch, on top of broken-out changes.
---
 docs/misc/xen-command-line.pandoc | 17 +++++++++++++++++
 xen/arch/x86/cpuid.c              | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index f7797ea233f9..383a854dec60 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -801,6 +801,23 @@ Controls for how dom0 is constructed on x86 systems.
 
     If using this option is necessary to fix an issue, please report a bug.
 
+### dom0-cpuid
+    = List of comma separated booleans
+
+    Applicability: x86
+
+This option allows for fine tuning of the facilities dom0 will use, after
+accounting for hardware capabilities and Xen settings as enumerated via CPUID.
+
+Options are accepted in positive and negative form, to enable or disable
+specific features, but specify both forms of the same option is undefined.
+All selections via this mechanism are subject to normal CPU Policy safety and
+dependency logic.
+
+This option is intended for developers to opt dom0 into non-default features,
+and is not intended for use in production circumstances.  If using this option
+is necessary to fix an issue, please report a bug.
+
 ### dom0-iommu
     = List of [ passthrough=<bool>, strict=<bool>, map-inclusive=<bool>,
                 map-reserved=<bool>, none ]
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index e11f5a3c9a6b..83a80ba6de70 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -116,6 +116,23 @@ static int __init parse_xen_cpuid(const char *s)
 }
 custom_param("cpuid", parse_xen_cpuid);
 
+static bool __initdata dom0_cpuid_cmdline;
+static uint32_t __initdata dom0_enable_feat[FSCAPINTS];
+static uint32_t __initdata dom0_disable_feat[FSCAPINTS];
+
+static void __init _parse_dom0_cpuid(unsigned int feat, bool val)
+{
+    __set_bit(feat, val ? dom0_enable_feat : dom0_disable_feat);
+}
+
+static int __init parse_dom0_cpuid(const char *s)
+{
+    dom0_cpuid_cmdline = true;
+
+    return parse_cpuid(s, _parse_dom0_cpuid);
+}
+custom_param("dom0-cpuid", parse_dom0_cpuid);
+
 #define EMPTY_LEAF ((struct cpuid_leaf){})
 static void zero_leaves(struct cpuid_leaf *l,
                         unsigned int first, unsigned int last)
@@ -768,6 +785,25 @@ void __init init_dom0_cpuid_policy(struct domain *d)
      */
     if ( cpu_has_arch_caps )
         p->feat.arch_caps = true;
+
+    /* Apply dom0-cpuid= command line settings, if provided. */
+    if ( dom0_cpuid_cmdline )
+    {
+        uint32_t fs[FSCAPINTS];
+        unsigned int i;
+
+        cpuid_policy_to_featureset(p, fs);
+
+        for ( i = 0; i < ARRAY_SIZE(fs); ++i )
+        {
+            fs[i] |= dom0_enable_feat[i];
+            fs[i] &= ~dom0_disable_feat[i];
+        }
+
+        cpuid_featureset_to_policy(fs, p);
+
+        recalculate_cpuid_policy(d);
+    }
 }
 
 void guest_cpuid(const struct vcpu *v, uint32_t leaf,
-- 
2.11.0


