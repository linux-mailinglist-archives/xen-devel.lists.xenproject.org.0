Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDA31C2113
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 01:04:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUehg-0001AP-VD; Fri, 01 May 2020 23:04:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T3Df=6P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jUehf-0001AF-N1
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 23:04:19 +0000
X-Inumbo-ID: 15fcccbc-8c00-11ea-9887-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15fcccbc-8c00-11ea-9887-bc764e2007e4;
 Fri, 01 May 2020 23:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588374258;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HTUK8m+QrV1a4/c+FcbBl6B+TxDRXiRJZVfXM92PQy0=;
 b=iOc9QmKxzAeTJCrxrx/MA3LkSf8Dde+9NsbXTPx7VC+uh1TNJ1r4ZSth
 cnMZLPIFRVYxoxolviwSMGZB/OGw3yD2TTR8r+OKo2WtgHJ3PZByi2q29
 ZIJl+1fuy2gzZxNaDsCmKgG5XIW/+WaD8zePshBmg/3NsGwsBh7ekJU2B k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LwgmbsDFxdS+tPhQKNfQOdklFvxXZDioEMP9BKxTatOmGiSlPKvotKZZwqe3z+LlvdvTNSoFug
 NJ2mHwyf1Ao8tw+o6ofA7ZWar0nPm/qP15wYYp3kPU9d9mj5tHrECaarbawvhyN6nNML/mr2zj
 nV6vc007LnblHHWt4VgzZNHORmk98DXVTGnb9tKQ23wuwFb3Z69Sj6/2mDLXs0eRRopJDOE/J5
 bDq1LMsTN2dNfIyG4ZSHRsaXwMf2x/ZRetoDZ9OmSoGfZ/vGglnjx+g51ZgbGV/iEsQcEvHcRj
 Xzk=
X-SBRS: 2.7
X-MesageID: 17294144
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,341,1583211600"; d="scan'208";a="17294144"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 14/16] x86/alt: Adjust _alternative_instructions() to not
 create shadow stacks
Date: Fri, 1 May 2020 23:58:36 +0100
Message-ID: <20200501225838.9866-15-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200501225838.9866-1-andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The current alternatives algorithm clears CR0.WP and writes into .text.  This
has a side effect of the mappings becoming shadow stacks once CET is active.

Adjust _alternative_instructions() to clean up after itself.  This involves
extending the set of bits modify_xen_mappings() to include Dirty (and Accessed
for good measure).

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/alternative.c | 14 ++++++++++++++
 xen/arch/x86/mm.c          |  6 +++---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index ce2b4302e6..004e9ede25 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -21,6 +21,7 @@
 #include <asm/processor.h>
 #include <asm/alternative.h>
 #include <xen/init.h>
+#include <asm/setup.h>
 #include <asm/system.h>
 #include <asm/traps.h>
 #include <asm/nmi.h>
@@ -398,6 +399,19 @@ static void __init _alternative_instructions(bool force)
         panic("Timed out waiting for alternatives self-NMI to hit\n");
 
     set_nmi_callback(saved_nmi_callback);
+
+    /*
+     * When Xen is using shadow stacks, the alternatives clearing CR0.WP and
+     * writing into the mappings set dirty bits, turning the mappings into
+     * shadow stack mappings.
+     *
+     * While we can execute from them, this would also permit them to be the
+     * target of WRSS instructions, so reset the dirty after patching.
+     */
+    if ( cpu_has_xen_shstk )
+        modify_xen_mappings(XEN_VIRT_START + MB(2),
+                            (unsigned long)&__2M_text_end,
+                            PAGE_HYPERVISOR_RX);
 }
 
 void __init alternative_instructions(void)
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 4e2c3c9735..26b01cb917 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5448,8 +5448,8 @@ int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
  * mappings, but will shatter superpages if necessary, and will destroy
  * mappings if not passed _PAGE_PRESENT.
  *
- * The only flags considered are NX, RW and PRESENT.  All other input flags
- * are ignored.
+ * The only flags considered are NX, D, A, RW and PRESENT.  All other input
+ * flags are ignored.
  *
  * It is an error to call with present flags over an unpopulated range.
  */
@@ -5462,7 +5462,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
     unsigned long v = s;
 
     /* Set of valid PTE bits which may be altered. */
-#define FLAGS_MASK (_PAGE_NX|_PAGE_RW|_PAGE_PRESENT)
+#define FLAGS_MASK (_PAGE_NX|_PAGE_DIRTY|_PAGE_ACCESSED|_PAGE_RW|_PAGE_PRESENT)
     nf &= FLAGS_MASK;
 
     ASSERT(IS_ALIGNED(s, PAGE_SIZE));
-- 
2.11.0


