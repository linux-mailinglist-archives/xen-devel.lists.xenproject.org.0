Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 461452DFD1A
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 15:57:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57396.100402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krMbd-0006UH-Qr; Mon, 21 Dec 2020 14:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57396.100402; Mon, 21 Dec 2020 14:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krMbd-0006Ts-Nm; Mon, 21 Dec 2020 14:56:13 +0000
Received: by outflank-mailman (input) for mailman id 57396;
 Mon, 21 Dec 2020 14:56:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wm/H=FZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1krMbc-0006Tn-7p
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 14:56:12 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2f2007e-7608-4198-a1c0-5d1910bf3bba;
 Mon, 21 Dec 2020 14:56:05 +0000 (UTC)
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
X-Inumbo-ID: a2f2007e-7608-4198-a1c0-5d1910bf3bba
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608562565;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IsbdRLNgcktPXpB+x8LBH5Rgb6C8AoFkm8H3FotSQd0=;
  b=JuS65IJHtcoeyEuM9VFymo9meOFHC2e09SKf9+MMRn1R4t3zR288+6zB
   nsz48SZvd2x3GmKYMxRZowindyjCJVylWQTS+aMBreQFww2CVESOMzsxf
   oBtfxe4M4mN5MST02m7SLUVAzMHJsO6ABC0KIVL7ypr31yX7qjSy7TuHk
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Vp7Vx3JoRUDp8fpAEngbl2SuTTqZ70nSOPeTLXoTu9IcLU8PLIqMZMm0imNH6jD2pN/VKylqEx
 t9VcCv9Ao1xYsD8XqgLSj5gk3ugS7S12ZPRLeII7oBTN4VlsuSj3fOj6dRnumCx6vS6mBVcR2C
 G1ucvulyMFduAUWMoxVjZIu3mVCksfzBFLd4wi0OyzaaJ48wIweK+lbEVXz6mvJFPqhSnjBXIC
 +B57XWs9beCF2POTOIiJk50uIdg/zKGRC8460HzJrJ6Z4qAbq5xiJ4XXSTIvguXu+5JO17uOkn
 tak=
X-SBRS: 5.2
X-MesageID: 33665476
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,436,1599537600"; 
   d="scan'208";a="33665476"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/shadow: Fix build with !CONFIG_SHADOW_PAGING
Date: Mon, 21 Dec 2020 14:55:25 +0000
Message-ID: <20201221145525.30804-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Implement a stub for shadow_vcpu_teardown()

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/include/asm-x86/shadow.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/include/asm-x86/shadow.h b/xen/include/asm-x86/shadow.h
index 29a86ed78e..e25f9604d8 100644
--- a/xen/include/asm-x86/shadow.h
+++ b/xen/include/asm-x86/shadow.h
@@ -99,6 +99,7 @@ int shadow_set_allocation(struct domain *d, unsigned int pages,
 
 #else /* !CONFIG_SHADOW_PAGING */
 
+#define shadow_vcpu_teardown(v) ASSERT(is_pv_vcpu(v))
 #define shadow_teardown(d, p) ASSERT(is_pv_domain(d))
 #define shadow_final_teardown(d) ASSERT(is_pv_domain(d))
 #define shadow_enable(d, mode) \
-- 
2.11.0


