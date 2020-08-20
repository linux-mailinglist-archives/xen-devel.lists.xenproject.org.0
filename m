Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F6F24C16A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 17:09:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8mC6-0003mx-Lw; Thu, 20 Aug 2020 15:09:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00F7=B6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k8mC4-0003mF-Rd
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 15:09:32 +0000
X-Inumbo-ID: 7c115b8d-a4dc-4e13-9dc2-4876a2493a15
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c115b8d-a4dc-4e13-9dc2-4876a2493a15;
 Thu, 20 Aug 2020 15:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597936173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FKYzxNpQWEfSFaEX9BxBNLb9An6Dr63PFxa7t7708g8=;
 b=aaGWxMglVZp5IZ50G9rFfP1m+V7jfrK4LF51rlb34qhYtVT2hYBHah8m
 cYk1C70eerCig/7NC7CQE6Rp/1KOt4CODOR17SSPMbyQLVA8dd+mDaClJ
 lHaPajEostc38ea2P0SuHeWuLmbHDO8lf39yaJ32Xkqs5lCYS61x2uFba 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: dQMauhDpzkj4942q+G/yxU5ylH/07HIC2/D1T50wq4BWY2N4APmoUvV4TfJqZOw7I/b1K4mrb2
 yQOUT42IIFjb4HJ13MIA2POWLhFrVYb2Pw4zE8s+F46wVV2xCOacv/xGxbw/WzbdFnU6BA2GP2
 XkUAM1jIel3GLazaJ1zjuD9AkgZ24UUfeJa0WLBYZGEivOAtbNyKZ+i/RS/FX/6qshTdaMDB/o
 8ueEgReD9G95wvxB5EfmLOQuebG17WpVv5PfFmUQbUmtXZphVTXW+QN6C4vmjSPbYi4alPrrw3
 zCk=
X-SBRS: 2.7
X-MesageID: 25292195
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,333,1592884800"; d="scan'208";a="25292195"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 4/8] x86/svm: drop writes to BU_CFG on revF chips
Date: Thu, 20 Aug 2020 17:08:31 +0200
Message-ID: <20200820150835.27440-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200820150835.27440-1-roger.pau@citrix.com>
References: <20200820150835.27440-1-roger.pau@citrix.com>
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

We already have special casing to handle reads of this MSR for revF
chips, so do as the comment in svm_msr_read_intercept says and drop
writes. This is in preparation for changing the default MSR write
behavior, which will instead return #GP on not explicitly handled
writes.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/hvm/svm/svm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 2d0823e7e1..7586b77268 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2125,6 +2125,12 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
         nsvm->ns_msr_hsavepa = msr_content;
         break;
 
+    case MSR_F10_BU_CFG:
+        /* See comment in svm_msr_read_intercept. */
+        if ( boot_cpu_data.x86 != 0xf )
+            goto gpf;
+        break;
+
     case MSR_AMD64_TSC_RATIO:
         if ( msr_content & TSC_RATIO_RSVD_BITS )
             goto gpf;
-- 
2.28.0


