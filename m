Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF7819BF3F
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 12:22:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJwwL-0000nh-9t; Thu, 02 Apr 2020 10:19:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8h32=5S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJwwJ-0000nc-Ez
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 10:19:11 +0000
X-Inumbo-ID: 646c96db-74cb-11ea-bba1-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 646c96db-74cb-11ea-bba1-12813bfff9fa;
 Thu, 02 Apr 2020 10:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585822750;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3/YZSxwxJdT+2zm3hr8RD7262jgsENAYDbS1h2PY7l0=;
 b=LTTM59bS/ZAVBJaqAjqKzT0aGstBFVXVbfOIjWgwgKrn/c3Q1ybNB6uM
 XnqxAcMiO+8mIPXWPktkg9muDqLwNjIivcpVXFneJFrvHVvOzFA5EQln5
 9opwhr2oaH4uAp40kefI76QGTgVmacB1OWUOqnCZqiU5zSA/ilHb8CuQT w=;
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
IronPort-SDR: Be+7e6xH7LJDnmNx+3cTRqTen6+RPZZZf2wUTt6utz+BsHDh1oMTxEO6hzSNZzZvVLthMmJ30t
 o8+r8BMDuz7Z0Bb3VaiRIhUDOEP6aas/DkNnSNq8xsM7lrPzk4motAvN15jFopO4JusUc6nq1w
 uFCZPy3/cj0IQYGWIG+KlGIAkB7eGV9Dmx+MAzRLLhYRkxB487aSTF73fsMFqgx+6uO2RFSODE
 kXwBrDfw+v3sHnC9JQs6J/vwrrd6bLfjnJiytxEQFfcuGt+kun65X8FBoiJjHjX7GCt8lAD9pk
 gdM=
X-SBRS: 2.7
X-MesageID: 15715926
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,335,1580792400"; d="scan'208";a="15715926"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 1/5] x86/ucode/intel: Remove CPUID from collect_cpu_info()
Date: Thu, 2 Apr 2020 11:18:58 +0100
Message-ID: <20200402101902.28234-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200402101902.28234-1-andrew.cooper3@citrix.com>
References: <20200402101902.28234-1-andrew.cooper3@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The CPUID instruction is expensive.  No point executing it twice when once
will do fine.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/intel.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 72bd1ad0bc..f1e64e188b 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -121,14 +121,12 @@ static int collect_cpu_info(struct cpu_signature *csig)
 
     memset(csig, 0, sizeof(*csig));
 
-    csig->sig = cpuid_eax(0x00000001);
-
     rdmsrl(MSR_IA32_PLATFORM_ID, msr_content);
     csig->pf = 1 << ((msr_content >> 50) & 7);
 
     wrmsrl(MSR_IA32_UCODE_REV, 0x0ULL);
     /* As documented in the SDM: Do a CPUID 1 here */
-    cpuid_eax(1);
+    csig->sig = cpuid_eax(1);
 
     /* get the current revision from MSR 0x8B */
     rdmsrl(MSR_IA32_UCODE_REV, msr_content);
-- 
2.11.0


