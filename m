Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB681A3B8C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 22:49:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMe6P-0004Bo-Pf; Thu, 09 Apr 2020 20:48:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FLbM=5Z=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jMe6O-0004Bj-HV
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 20:48:44 +0000
X-Inumbo-ID: 7fc72e3a-7aa3-11ea-b58d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7fc72e3a-7aa3-11ea-b58d-bc764e2007e4;
 Thu, 09 Apr 2020 20:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586465323;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Rjn5z8tWEI99ZKW9mjsqO/GepQite5MHo/l5hfVY1Fs=;
 b=fQdHRPTsRNlU+6vRy+p/qZO2izJNcm+U+x40CDsgyHLD+tz9lx/hH49R
 HVjyWnXwOp7k3r2+60Phr6Cs/lM9ZoDXpON2EGrj7YwaDNgetHZ1GMizB
 phI44y5hKDGHlnFCnOyp9QMpjYybg4Cbmx7S4EF+3SWphPsPMbQbPF7PQ I=;
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
IronPort-SDR: b+SjthSYtJLMM4n2lAsuXONT/NfCpd7Z+uKq7sV2uVHwrI+kph2WgSBq/un3YY4uTh9IGYpRxE
 wusKBy1vsZa7a0n+CwyNjGLBjNlOxqc7BLVtzrBiv8ScB/MX1q3QKLFDhM6SvymFuOgHVOKR0w
 EXmJhL+EW692/sWxt44j9ETH5rudUfNb1wOYZYK37/kKoc4B6Tj018uOGXD/Wf17tip/JsM9Vj
 3SdgUJO/ZTmuAlRb82j+nSNvweSARYzFQ9LOfUyDcrbAZlMn3pnWRxpS4SL8FZwPUlLc43cpqZ
 3oA=
X-SBRS: 2.7
X-MesageID: 16135641
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,364,1580792400"; d="scan'208";a="16135641"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/mem_sharing: Fix build folloing VM Fork work
Date: Thu, 9 Apr 2020 21:48:37 +0100
Message-ID: <20200409204837.7017-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

A default build fails with:

  mem_sharing.c: In function ‘copy_special_pages’:
  mem_sharing.c:1649:9: error: ‘HVM_PARAM_STORE_PFN’ undeclared (first use in this function)
           HVM_PARAM_STORE_PFN,
           ^~~~~~~~~~~~~~~~~~~

I suspect this is a rebasing issue with respect to c/s 12f0c69f2709 "x86/HVM:
reduce hvm.h include dependencies".

Fixes: 41548c5472a "mem_sharing: VM forking"
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Tamas K Lengyel <tamas@tklengyel.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/mm/mem_sharing.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 85951b7bea..e572e9e39d 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -41,6 +41,8 @@
 #include <asm/hvm/hvm.h>
 #include <xsm/xsm.h>
 
+#include <public/hvm/params.h>
+
 #include "mm-locks.h"
 
 static shr_handle_t next_handle = 1;
-- 
2.11.0


