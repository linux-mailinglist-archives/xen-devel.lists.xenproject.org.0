Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 414E059F845
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 13:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392410.630783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQo7F-0003cj-90; Wed, 24 Aug 2022 11:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392410.630783; Wed, 24 Aug 2022 11:00:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQo7F-0003Xe-1n; Wed, 24 Aug 2022 11:00:09 +0000
Received: by outflank-mailman (input) for mailman id 392410;
 Wed, 24 Aug 2022 11:00:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ebS+=Y4=citrix.com=prvs=22883313c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oQo7D-00037e-0D
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 11:00:07 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e720f3d0-239b-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 13:00:04 +0200 (CEST)
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
X-Inumbo-ID: e720f3d0-239b-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1661338804;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+3yzR7H1mL4yzkhNJhzHDkUHVl2/a/svrgKmQFfjl8g=;
  b=YfMufqev0+WQ0VT4ib3RqkxJO0loxDykiylJGIffR9svGNlSfUNimuP5
   40F4et5unznJ+uVTApSEdviwFlVJopNM4IZ3Hh5Dsjl9Gri47CmrLx17g
   K2FGq2kKtd/4/uXet87Po5G2PrrdItrw3lXnadEmjIJUKHAUrHRdFbyz0
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78524460
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CG5Xqav4KO1Vsg2efdvwCc1eF+fnVDReMUV32f8akzHdYApBsoF/q
 tZmKW3UPPuCZjTwfIx+aY+z8RkD7ZTRmt9mGgI6rHwxRXsb+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzl8B56r8ks15qyi4m9A5zTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FYgdweNxPE9nz
 8A/Di0vNTDf38Ks2ZvuH4GAhux7RCXqFIYWu3UmxjDFF/c2B5vERs0m5/cBgm123JoXW6+DO
 YxJMlKDbzyZC/FLEn4RBIgzg6GDgX7nficDgFmUubA28y7YywkZPL3Fb4qIIIDWG509ckCwl
 jLHxUn7BAkmHcHOzRnV1WOFgMbhtHauMG4VPOLhraM76LGJ/UQMDDUGWF39puO24maccd9CL
 00f+gI1sLM/skesS7HVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAOHKr+dvG2Zsj
 AXQ2Yq0W3o/69V5VE5x6J+RqAi3PxU7BFU+QgkZb1Alv4HDupga20enoslYLEKlsjHkMWiun
 WnQ9Xlu2+h7Yd0jjPviow2e6964jt2QF1NuuF2KNo6wxlkhDLNJcbBE/rQyARxoCI+CBmeMs
 3Ef8yR1xLBfVMrd/MBhrQhkIV1I2xpmGGeF6bKXN8N9nwlBAlb6FWyq3BlwJV1yLuEPciLzb
 UnYtGt5vcENZSH1PP4tPdnhW6zGKJQM8vy0Ps04k/IUOsQhHON51HsGibGsM5DFzxF3zPBX1
 WazesewF3cKYZlaIM6Nb75EidcWKtUWnzy7qWbTk0v6itJzpRe9Fd84Dbd5Rrpgt/zf/V+Nq
 o832gnj40w3bdASqxL/qeY7RW3m51BiXfgad+Q/mja/Hzdb
IronPort-HdrOrdr: A9a23:J+u2rqy7b51f+juquuryKrPwFr1zdoMgy1knxilNoRw8SK2lfq
 eV7YwmPH7P+U8ssR4b6LO90cW7Lk80sKQFhbX5Xo3SOjUO2lHYTr2KhLGKq1aLdkHDH6xmpM
 BdmsBFeabN5DNB7foSjjPXLz9Z+qjjzJyV
X-IronPort-AV: E=Sophos;i="5.93,260,1654574400"; 
   d="scan'208";a="78524460"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/4] x86/hvmloader: Don't override stddef.h
Date: Wed, 24 Aug 2022 11:59:14 +0100
Message-ID: <20220824105915.32127-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220824105915.32127-1-andrew.cooper3@citrix.com>
References: <20220824105915.32127-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Since c/s 73b13705af7c ("firmware: provide a stand alone set of headers"),
we've had an implementation of offsetof() which isn't undefined behaviour.
Actually use it.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/firmware/hvmloader/util.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
index 8d95eab28a65..ac7ff264e247 100644
--- a/tools/firmware/hvmloader/util.h
+++ b/tools/firmware/hvmloader/util.h
@@ -28,12 +28,6 @@ enum {
 #define SEL_DATA32          0x0020
 #define SEL_CODE64          0x0028
 
-#undef offsetof
-#define offsetof(t, m) ((unsigned long)&((t *)0)->m)
-
-#undef NULL
-#define NULL ((void*)0)
-
 void __assert_failed(const char *assertion, const char *file, int line)
     __attribute__((noreturn));
 #define ASSERT(p) \
-- 
2.11.0


