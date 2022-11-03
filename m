Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A800F617BEF
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 12:52:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436391.690517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqYm6-0002XH-JC; Thu, 03 Nov 2022 11:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436391.690517; Thu, 03 Nov 2022 11:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqYm6-0002TA-FO; Thu, 03 Nov 2022 11:52:46 +0000
Received: by outflank-mailman (input) for mailman id 436391;
 Thu, 03 Nov 2022 11:52:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=glJU=3D=citrix.com=prvs=299622fb7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oqYm4-0001eL-Of
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 11:52:44 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0638a22b-5b6e-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 12:52:43 +0100 (CET)
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
X-Inumbo-ID: 0638a22b-5b6e-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667476363;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qP6CbInANoKRmwMgk+a5Z5s50q5J3NmEB9ca9VSqoig=;
  b=GhcOvmGWf8KbDz1mtR5X6+MphckbK7vR5APn6Y5k4JGKPd6vCZXr+3wi
   0bsSezvUSsoWBXADLajiECe1g8D3JkOBjVQlVNfNQ90+nMXV7K4BK1X2m
   Zcx8//WQtCtWSqWtYXDWwC8q8KJ7SfDoOMn2nyHWqRFoEL1I5I2iHyZWz
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 84512867
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Jw8s9qytaORAv0jq+Xx6t+f6xirEfRIJ4+MujC+fZmUNrF6WrkUGm
 2RODGzVbv6PZWT3eooiPoi+oE8GucLUyt8yTQZqriAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U4HUMja4mtC5AVnPasT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KW5h2
 eQFBh1SUgKs1t2x6pbjdvZMv8t2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKQOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiFZkIxxzI+
 D2uE2LRXTQHE9+jmD259lWXo8Dhs3OiY4cePejtnhJtqALKnTFCYPEMbnObrP+jmwiBUtRQA
 0UO/2wlqq1a3E6hQ8T5Xha4iGWZpRNaUN1Ve8U49QWMx6z88wufQG8eQVZpd9gOpMIwAzsw2
 Tehj97vQDBirrCRYXac7auP6yO/PzAPKm0PbjNCShEKi/H4u506hB/LStdlEYa2g8fzFDW2x
 CqFxBXSnJ1K05RNjf/iuwma3XT8/fAlUzLZ+C3YcU698y1UO7K3SN2X7nL/tcpfDL+WGwzpU
 Gc/p+CS6+UHDJeonSOLQfkQELzB28tpIAEwknY0QcB/qm3FF2qLONkJvWogfBsB3tMsI2eBX
 aPFhe9GCHa/1lOOZLQ/XY++At9CIUPIRYW8DaC8gjajj/FMmO67EMNGPxP4M4PFyhJEfUQD1
 XCzKJ/EMJriIf47pAdavs9EuVPR+ggwxHnIWbfwxAm93LyVaRa9EOlbbwfXMrlisfna/205F
 uqz0OPTlX1ivBDWOHGLoeb/03hXRZTEOXwGg5MOLbPSSuaXMGogF+XQ0dscl39NxsxoehPz1
 ijkAidlJK/X3yKvxfOiNi8+M9sCnP9X8RoGAMDbFQz4gyR9Od3xsPh3mlleVeBPydGPBMVcF
 5EtE/hsyNwWItgb01zxtaXAkbE=
IronPort-HdrOrdr: A9a23:ucZH4a3CMXMd0Sk3HuyISQqjBLQkLtp133Aq2lEZdPRUGvb2qy
 nIpoV96faUskdpZJhOo7G90cW7LE80sKQFg7X5Xo3SODUO2lHJEGgK1+KLqFfd8m/Fh4tgPM
 9bAs5D4bbLY2SS4/yX3ODBKadC/OW6
X-IronPort-AV: E=Sophos;i="5.95,235,1661832000"; 
   d="scan'208";a="84512867"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: [XEN PATCH for-4.17 v2 4/6] xen: Add licence header to device_tree_defs.h
Date: Thu, 3 Nov 2022 11:52:02 +0000
Message-ID: <20221103115204.49610-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221103115204.49610-1-anthony.perard@citrix.com>
References: <20221103115204.49610-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This header have been created by moving code from other part of the
project and miss a licence header. The original source code was some
version of GPL or LGPL but we intend to have the public header to be
MIT so they can be included easily in other projects.

Part of device_tree_defs.h were moved from libxl_arm.c which is
LGPL-2.1-only. And part were moved from device_tree.h that is
GPL-2.0-only.

Part of the original code were added by Julien Grall @ Linaro in
commits c3ba52a84dd8 and 405c167f0ec9 and 886f34045bf0. The other part
were added by Ian Campbell @ Citrix, with commit 0c64527e7fc9.

Resolves: xen-project/xen#35
Fixes: 1c898a9fec7e ("xen/arm: move a few DT related defines to public/device_tree_defs.h")
Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---

Notes:
    Probably needs an ack from Linaro:
        https://lore.kernel.org/r/fad0265d-a736-5135-b5ea-3735a8bc72da@xen.org/
    
    v2:
    - ack from Citrix
    - rewrite message to say "Julian @ Linaro" instead of "Julian with a
      Linaro hat".

 xen/include/public/device_tree_defs.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/include/public/device_tree_defs.h b/xen/include/public/device_tree_defs.h
index 228daafe81..9e80d0499d 100644
--- a/xen/include/public/device_tree_defs.h
+++ b/xen/include/public/device_tree_defs.h
@@ -1,3 +1,9 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (c) 2013 Linaro Limited
+ * Copyright (c) 2015 Citrix Systems, Inc
+ */
+
 #ifndef __XEN_DEVICE_TREE_DEFS_H__
 #define __XEN_DEVICE_TREE_DEFS_H__
 
-- 
Anthony PERARD


