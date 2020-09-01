Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D6D258D34
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 13:10:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kD4BS-0000Ve-6b; Tue, 01 Sep 2020 11:10:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6GQ=CK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kD4BQ-0000V0-EY
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 11:10:36 +0000
X-Inumbo-ID: 263c1e8f-9c54-440b-83fd-2fc466c9c4e2
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 263c1e8f-9c54-440b-83fd-2fc466c9c4e2;
 Tue, 01 Sep 2020 11:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598958633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gPkcofx5wqS3WmC+5Y4XByDXXhvalyO2X0/eP2W2w0Y=;
 b=LUF5PaIau8vuR2UAKFRouQnN/+opAqlteLXuhZzKDcZtSJ3aAUQrMTdj
 6SZO8YUF5TpDRQnio5WMeB3GOBIY7QFMy4gM9eARX1J2r42V/Mw7FhpiJ
 fnx5MIg8hByJ6cOqRKKELrgCqfHMFOjvWHC3uPxRqWTu0lEjEMCs1C1xt c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: JsMJ9J27Kg39sWJ/sRl19UZjLueF8UIkQy4ZHaibDeBsyM/hD7ZGV9hZWP2Ywjfqq+d1rPpRPE
 NVTySGipQDaxDw63IENjKLFdQ7olxPE+D30p/VpuYSHRIEPQtsMauWbfmwiC5sWH9x2emQVk5p
 eC6lGWVVQtPE0AP0HKXk3WeLbuB5UEwTHrvpd4az6vbT0ytUodgRfewOqWpYUZNUx/1NRCvxTE
 G6vIPHN6cZuIbtv9siz8xTC0g5QqaAwezM2vk3jII+oS7PEKsYrXTwBlmjpvL/3LZjW+1HvUK8
 GiQ=
X-SBRS: 2.7
X-MesageID: 26679910
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,378,1592884800"; d="scan'208";a="26679910"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/8] x86/svm: silently drop writes to SYSCFG and related
 MSRs
Date: Tue, 1 Sep 2020 12:54:39 +0200
Message-ID: <20200901105445.22277-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901105445.22277-1-roger.pau@citrix.com>
References: <20200901105445.22277-1-roger.pau@citrix.com>
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

The SYSCFG, TOP_MEM1 and TOP_MEM2 MSRs are currently exposed to guests
and writes are silently discarded. Make this explicit in the SVM code
now, and just return default constant values when attempting to read
any of the MSRs, while continuing to silently drop writes.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Return 0 from SYSCFG.
 - Merge switch cases.

Changes sincxe v1:
 - Return MtrrFixDramEn in MSR_K8_SYSCFG.
---
 xen/arch/x86/hvm/svm/svm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index ca3bbfcbb3..af584ff5d1 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1917,6 +1917,9 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
             goto gpf;
         break;
 
+    case MSR_K8_SYSCFG:
+    case MSR_K8_TOP_MEM1:
+    case MSR_K8_TOP_MEM2:
     case MSR_K8_VM_CR:
         *msr_content = 0;
         break;
@@ -2094,6 +2097,9 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
             goto gpf;
         break;
 
+    case MSR_K8_TOP_MEM1:
+    case MSR_K8_TOP_MEM2:
+    case MSR_K8_SYSCFG:
     case MSR_K8_VM_CR:
         /* ignore write. handle all bits as read-only. */
         break;
-- 
2.28.0


