Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D98649D20D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 19:48:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261069.451645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCnLC-0002Dp-8p; Wed, 26 Jan 2022 18:48:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261069.451645; Wed, 26 Jan 2022 18:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCnLC-0002Bi-4b; Wed, 26 Jan 2022 18:48:22 +0000
Received: by outflank-mailman (input) for mailman id 261069;
 Wed, 26 Jan 2022 18:48:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DU/T=SK=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nCnLA-0002Bb-GK
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 18:48:20 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85c0d782-7ed8-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 19:48:18 +0100 (CET)
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
X-Inumbo-ID: 85c0d782-7ed8-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643222898;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vTsUGjjgoZdTVleQofvCUKv4H+hxdrPveKZIhytqiBg=;
  b=hRYI6xT+mhPrm6omHlQXWWlFTl4I/H7V4SJJ/j6sitz4qT3W05+8uXmf
   dXs8yPBjc1xNHlLTU5RHl/8MrNXj68TCvwHXMdbidV/eY/t0FdOPAMR82
   8ZK2YBvhRjlw13FGdFy+4R/ZZ/kLm5ekZOg9gUw4YdcHgmX8TEOamt2NE
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: w66HdRdAIAZXTcqROOvHxpGZQcw4CSeZMAeuTovkgAWfLyPFsua/cEto8JT9qCQp28qz4+pAhX
 flRaAUScUFrqodAjIsTeIJCqZsYE9yvrN7iggTEvUiUok9he7hKTnX0WatCCIEJnsG0kjAY/D1
 3hTLKyu5hRXaPHDuxxIO6678XoiNAuMv7pGLTCTbes9BQ0vmerLH1j1LQv926tDTbCQEEMCf7u
 Z+YOZEq52atY/qQgzhyS9wVL+v29kr7dYQxDu7jUWAxtTk15jhC8s5ztjdyUk6XcevT0dLdr7w
 C6pqpK0ImAfETX8k3JcgDBy3
X-SBRS: 5.2
X-MesageID: 62295711
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:iI2eC6O5BuzpZb/vrR1xkMFynXyQoLVcMsEvi/4bfWQNrUol0zRVx
 mdMCGzUaPeCMTf3f4sjOty2pBxQsMfSztdjTgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En150Eg9w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoxyS2MB82
 NlhjsWLRlwANZzwpO0cTzANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgm1q150RRK+2i
 8wxdR9/TQ/heCB2PV4vJ6xknuf4hV7CSmgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m66j
 G/b+2XyAjkBKceSjzGC9xqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlatpVkMVspcP9Zj0w7W46Hl3zqQB3QtG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnE447eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl8oDGJGT9bxgbQ+0RqmBNzIJrVml
 CNc8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9IdsJu2wgeBs0YplsldrVj
 Kn741I5CHh7ZyPCUEOKS9jpV5RCIVbISLwJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2mHxW7T6NFPjTkkT2uZLDNSX9YepUbzOzghURsfnsTPP9q
 YgPbqNnCnx3DYXDX8Ug2ddDdA9RdSliW8meRg4+XrfrHzeK0VoJU5f5qY7NsaQ890iMvuuXr
 Hy7RGFCz1/z2S/OJQmQMygxY7LzR5dv63k8OHV0b1qv3nEiZ6ep7bseKMRrLeV2qrQ7wK4mV
 eQBduWBHu9LFmbN9QMCYMSvt4dlbhmq216DZnL3fDglcpd8bAXV4du4LBD3/SwDA3Pv58szq
 rGtzC3BRp8HS1gwBcracqv3nViwoWIciKR5WE6Reotff0Dl8Y5LLS3tj6Bof5FQeEubnjbDj
 lSYGxYVo+XJsrQZytiRiPDWtZqtHst/AlFeQzvR44GpOHSI5WGk24JBDrqFJGiPSGPu9ay+T
 uxJ1PWgYuYflVNHvocgQbZmyaUyu4nmq7NAl1k2GXzKaxKgC696I2nA1s5K7/UfyrhcsAqwe
 0SO5tgFZunZZJK7SAYcdFg/c+CO9fAIgT2Dv/06LXLz6DJz4LfaA15ZOAOBiXAFIbZ4WG//L
 TzNZCLCB9SDtycX
IronPort-HdrOrdr: A9a23:/gl1+KPKLbht0sBcTs2jsMiBIKoaSvp037Eqv3oedfUzSL3+qy
 nOpoV+6faaslYssR0b9exoW5PwJE80l6QFgrX5VI3KNGKN1VdARLsSi7cKqAeAJ8SRzIFgPN
 9bAspDNOE=
X-IronPort-AV: E=Sophos;i="5.88,318,1635220800"; 
   d="scan'208";a="62295711"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/decode: Decode remaining TigerLake features
Date: Wed, 26 Jan 2022 18:47:58 +0000
Message-ID: <20220126184758.15902-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

These are the two remaining TGL features which xen-cpuid doesn't know yet.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/libs/light/libxl_cpuid.c | 2 ++
 tools/misc/xen-cpuid.c         | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index e1acf6648db4..28c2fa6a0350 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -208,8 +208,10 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
         {"vpclmulqdq",   0x00000007,  0, CPUID_REG_ECX, 10,  1},
         {"avx512-vnni",  0x00000007,  0, CPUID_REG_ECX, 11,  1},
         {"avx512-bitalg",0x00000007,  0, CPUID_REG_ECX, 12,  1},
+        {"tme",          0x00000007,  0, CPUID_REG_ECX, 13,  1},
         {"avx512-vpopcntdq",0x00000007,0,CPUID_REG_ECX, 14,  1},
         {"rdpid",        0x00000007,  0, CPUID_REG_ECX, 22,  1},
+        {"keylocker",    0x00000007,  0, CPUID_REG_ECX, 23,  1},
         {"cldemote",     0x00000007,  0, CPUID_REG_ECX, 25,  1},
 
         {"avx512-4vnniw",0x00000007,  0, CPUID_REG_EDX,  2,  1},
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index a3003245f12a..28842f56fcb2 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -127,10 +127,10 @@ static const char *const str_7c0[32] =
     [ 6] = "avx512-vbmi2",     [ 7] = "cet-ss",
     [ 8] = "gfni",             [ 9] = "vaes",
     [10] = "vpclmulqdq",       [11] = "avx512-vnni",
-    [12] = "avx512-bitalg",
+    [12] = "avx512-bitalg",    [13] = "tme",
     [14] = "avx512-vpopcntdq",
 
-    [22] = "rdpid",
+    [22] = "rdpid",            [23] = "keylocker",
     /* 24 */                   [25] = "cldemote",
     /* 26 */                   [27] = "movdiri",
     [28] = "movdir64b",        [29] = "enqcmd",
-- 
2.11.0


