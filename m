Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 342974843A1
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 15:45:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253296.434381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4l3E-0000Ph-OQ; Tue, 04 Jan 2022 14:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253296.434381; Tue, 04 Jan 2022 14:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4l3E-0000No-LO; Tue, 04 Jan 2022 14:44:36 +0000
Received: by outflank-mailman (input) for mailman id 253296;
 Tue, 04 Jan 2022 14:44:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PsXe=RU=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1n4l3C-0000Ni-U7
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 14:44:34 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d35f7c37-6d6c-11ec-81c0-a30af7de8005;
 Tue, 04 Jan 2022 15:44:33 +0100 (CET)
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
X-Inumbo-ID: d35f7c37-6d6c-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1641307473;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6TBwiKkzEfQYQBwA/AThtloBxEvEa926wANDQyl1YRE=;
  b=NJBG37gF4n8RUN6LvwCteb4nnmV2xscvpi1jxDF2hF24MExSEsnXzsL3
   wBBNtahEnu1aLIQzhuO7T83DTW9iYyS0ssQEohZsaNqC1wQ2ITk3vLXkh
   DdInTy1HkJK2nMe2y9JJWpL2iYTMOvSwWKwkJUPByVagkAlq2RKsVjWlj
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: IksqEozrCSg5jkxMsAw9Ng+tFZHDQRnNuFTU1EJVNJU8G0LlgSn0Kvb3HrDvhIc+VmcyK3sodQ
 /WAIywRKy9ARlcW7g17nCynK19f5nk6zI5lMjLE/8v/TKq10eJefx3EcQwc8jEdEmxuzBU2o95
 oKX8wh7YKWtyMMDNsEjj9w4hEeZjXu4vVDWH4/JqObdXc6l8XW+PR/9Mw6PKkfGtck/tSS9LbT
 TYKdkTTyf8RNeHKUEQzUSpwxT6mgYUbbosTznAgn3ZvbCEvs5wb6OqXPW++1IZR7r0UzAjGR0I
 OI00oZLBduJ++N4dOERFqN/V
X-SBRS: 5.1
X-MesageID: 61276048
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+Wz1HK8Mdr07OXqEBfYgDrUDv3mTJUtcMsCJ2f8bNWPcYEJGY0x3y
 mdJXWyCOfzeZmCnftBwbNmz8kxQ65KBx9FqS1BlrXw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dh3tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhR9
 +djqd/hWzsGHajNwKcaDkFzGh5xaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4XR6mAP
 5ZJAdZpRBn/TwByAEYnNM8ZoqSZrXCmXBJZlk3A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru3U70HxUbP9y30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0e+ViPfF5uROx5YnR4l7aATVcZTd+Z4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPPt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNL0D2BLwQKChRqlEGp+ZgPb1
 EXoY+DEsIgz4WilzURhutklErCz/OqiOzbBm1NpFJRJ323zpyf5Jt0Num0gfx8B3iM4ldjBO
 hS7hO+szMULYCvCgVFfPupd9PjGPYC/TI+4B5g4n/JFY4RrdR/vwc2dTRX44owZq2B1yftXE
 c7CKa6EVC9GYYw6nGveb7pMitcDm3FhrV4/sLimlnxLJ5LFPyXLIVrEWXPTBt0EAFSs/F+Ir
 o0BbpTSkH2ykoTWO0HqzGLaFnhSRVBTOHw8g5U/mjerLlU0FWc/JeXWxL99KYVpk74MzrXD/
 22nW18ew1363CWVJQKPY3FlSbXuQZcg8i5rYX1yZQ6liyo5fIKizKYDbJ9rL7Mpw/NukKxvR
 P4fdsTeXvkWEmbb+y4QZIXWpZB5cEj5nhqHOieoOWBtf5NpSwHT1MXjew/jqHsHAiat7JNsq
 Ly8zALLB5EEQl06XsrRbfuuyXK3vGQcx70uDxeZfIELdRy1ooZwKiH3gvsmGO02KE3OlmmAy
 gKbIRYEvu2R8YU7x8bE2PKfpICzHuogQkcDRzvH7ay7PDXx93a4xdMSS/6BeD3QWT+m+KimY
 ukJnfjwPOdewQRPuot4Vb1q0bg/953koLoDllZoG3DCblKKDLJ8IybZgZkT5/MVnrIJ6xGrX
 k+v+8VBPeTbMczoJ1cdOQ45Y7nRzvoTgDTTsaw4LUiSCPWbJ1ZbvZG+5yWxtRE=
IronPort-HdrOrdr: A9a23:soigNKER3fmr2WUopLqE5MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 eTdZUgpHvJYVkqOE3I9ertBEDiewK4yXcW2/hzAV7KZmCP0wHEEGgL1/qF/9SKIUzDH4Bmup
 uIC5IOauHNMQ==
X-IronPort-AV: E=Sophos;i="5.88,261,1635220800"; 
   d="scan'208";a="61276048"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/spec-ctrl: Fix default calculation of opt_srb_lock
Date: Tue, 4 Jan 2022 14:44:22 +0000
Message-ID: <20220104144422.29989-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Since this logic was introduced, opt_tsx has become more complicated and
shouldn't be compared to 0 directly.  While there are no buggy logic paths,
the correct expression is !(opt_tsx & 1) but the rtm_disabled boolean is
easier and clearer to use.

Fixes: 8fe24090d940 ("x86/cpuid: Rework HLE and RTM handling")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/spec_ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index a5569c7f2b3f..c18cc8aa493a 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -1245,7 +1245,7 @@ void __init init_speculation_mitigations(void)
          */
         if ( opt_srb_lock == -1 &&
              (caps & (ARCH_CAPS_MDS_NO|ARCH_CAPS_TAA_NO)) == ARCH_CAPS_MDS_NO &&
-             (!cpu_has_hle || ((caps & ARCH_CAPS_TSX_CTRL) && opt_tsx == 0)) )
+             (!cpu_has_hle || ((caps & ARCH_CAPS_TSX_CTRL) && rtm_disabled)) )
             opt_srb_lock = 0;
 
         val &= ~MCU_OPT_CTRL_RNGDS_MITG_DIS;
-- 
2.11.0


