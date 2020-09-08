Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2A8260F4B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 12:08:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFaY5-0004gN-8N; Tue, 08 Sep 2020 10:08:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Jy8=CR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kFaY4-0004gG-5k
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 10:08:24 +0000
X-Inumbo-ID: 805c3514-3c43-404b-b573-26071c69f89c
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 805c3514-3c43-404b-b573-26071c69f89c;
 Tue, 08 Sep 2020 10:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599559702;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AfoJiB+xfX2BMT2tOY1nOCiTeV7VDYMcHhwxN7tfRSw=;
 b=JB8OC/ZYjCXKXxM71VCdTSx3FNNBXTwgtD7ThO6WpqaltvmvROdmVYTo
 DzMJ7p29wmR/DYM+RVYEtfcdVGl60wifLrYnXcuFwSN+fWLTbxOxBgLZ4
 HYpU02RbpsGjia6+7W+Kxv9DeIiWwVkFycln3usz4F3CbdJtPpwKpO2Hq I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: odNgjWrvV6U28UxiSiOop/e7gaPprsYCaAFtxs3x4mzaXfzE+vakdN9TWHWiRVnXentd/ftH7R
 P2rznc4ANqT6W8V1VXE5u1Qs8ksGtW3qnC11a7m0WBZbgvTWHByPT8xyKLbPYFALIb8UFGkI21
 l3okltkCsxGpQ7YVlY6Cw1tYyg0kuohjVJpyH+FQkQUEM/5rNAl5bjCArOYRw3qqgycfYBoASZ
 UKev2Rmw3i/PjHAbHYBjeup8TCNjn94Sx/goX5cM4CyxVCOiXf7r6XQdCbF3otDR1prxdYLdJD
 hkI=
X-SBRS: 2.7
X-MesageID: 27138456
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,405,1592884800"; d="scan'208";a="27138456"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/pv: Drop assertions from svm_load_segs()
Date: Tue, 8 Sep 2020 11:08:03 +0100
Message-ID: <20200908100803.8533-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

OSSTest has shown an assertion failure:
http://logs.test-lab.xenproject.org/osstest/logs/153906/test-xtf-amd64-amd64-1/serial-rimava1.log

These assertions were never appropriate, as they rule out legal (and, as it
turns out, sensible perf-wise) inputs based on an expectation of how the sole
caller would behave.

Fixes: ad0fd291c5 ("x86/pv: Rewrite segment context switching from scratch")
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/svm/svm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index af584ff5d1..eaacbcb668 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1559,13 +1559,11 @@ bool svm_load_segs(unsigned int ldt_ents, unsigned long ldt_base,
         vmcb->ldtr.base = ldt_base;
     }
 
-    ASSERT(!(fs_sel & ~3));
     vmcb->fs.sel = fs_sel;
     vmcb->fs.attr = 0;
     vmcb->fs.limit = 0;
     vmcb->fs.base = fs_base;
 
-    ASSERT(!(gs_sel & ~3));
     vmcb->gs.sel = gs_sel;
     vmcb->gs.attr = 0;
     vmcb->gs.limit = 0;
-- 
2.11.0


