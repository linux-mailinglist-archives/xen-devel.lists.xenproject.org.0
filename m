Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5721BEA15
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 23:40:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTuQA-0000iK-UV; Wed, 29 Apr 2020 21:39:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4OoD=6N=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jTuQ9-0000iF-AB
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 21:39:09 +0000
X-Inumbo-ID: daa06ba0-8a61-11ea-99c5-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id daa06ba0-8a61-11ea-99c5-12813bfff9fa;
 Wed, 29 Apr 2020 21:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588196347;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aZVGHYP4QKwl6RonE5nEe5V/P6Tr3xyY8ohRc2QN858=;
 b=AcDkrj4s/0nvbRSjNcViV2acVUrGuxpyFy+ZOkMfBZsUTjuIe2E0U7mx
 L+Wwh+wedYXW/2vg4uPO3zIWp7OvNs9lhHzKVcRvvoGVGvd5Qn3EKuenk
 T6zezQ20//fuD+FisBxF3XSy/BQkmJhYq4LjHb4u0NzdtnbPE1B9bcAEG Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ojIZxgykRp9cbQx+zLJsUVZ/V6tjGivFewLzRLyQg1olcru5QcIBWHzlvehWDSXnKHg1gNlbN9
 jt4PiDOer6PgB11b7t8C7XwAd5SxTp/9cuaL/4oGDHWRruM+XxQPr0coyndqhSyx0SJS1yeqT5
 vwXBrT5KkBOEvcDsV8mibpjeW/EosM1zWuFR2Ayx7ca5ovYlvvKcO/GjEnpzdz55UsgKfAkyx2
 DdhKy9ccO5KZ7oKrNunE97Ubd6GiLK+ypwmOCdfnpuEMln89CRKy+0JxCgKyUIpiTqx9jKAX5g
 u5A=
X-SBRS: 2.7
X-MesageID: 16783390
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,333,1583211600"; d="scan'208";a="16783390"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/msr: Fix XEN_MSR_PAT to build with older binutils
Date: Wed, 29 Apr 2020 22:39:01 +0100
Message-ID: <20200429213901.16105-1-andrew.cooper3@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Older binutils complains with:
  trampoline.S:95: Error: junk `ul&0xffffffff' after expression

Use an assembly-safe constant.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/include/asm-x86/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/asm-x86/processor.h b/xen/include/asm-x86/processor.h
index ea6e5497f4..8f6f5a97dd 100644
--- a/xen/include/asm-x86/processor.h
+++ b/xen/include/asm-x86/processor.h
@@ -99,7 +99,7 @@
  * Host IA32_CR_PAT value to cover all memory types.  This is not the default
  * MSR_PAT value, and is an ABI with PV guests.
  */
-#define XEN_MSR_PAT 0x050100070406ul
+#define XEN_MSR_PAT _AC(0x050100070406, ULL)
 
 #ifndef __ASSEMBLY__
 
-- 
2.11.0


