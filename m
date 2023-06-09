Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1BD729669
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 12:11:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545814.852417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Z5P-000814-Lz; Fri, 09 Jun 2023 10:11:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545814.852417; Fri, 09 Jun 2023 10:11:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Z5P-0007zj-Ig; Fri, 09 Jun 2023 10:11:15 +0000
Received: by outflank-mailman (input) for mailman id 545814;
 Fri, 09 Jun 2023 10:11:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H16Y=B5=citrix.com=prvs=5170a5cbe=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q7Z5N-0007wv-Ph
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 10:11:13 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f473c19e-06ad-11ee-8611-37d641c3527e;
 Fri, 09 Jun 2023 12:11:10 +0200 (CEST)
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
X-Inumbo-ID: f473c19e-06ad-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686305471;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fTKAHh/rmBdxwsIm4/S0Fz5U5kFl6UH8k2F7EeisTpk=;
  b=JXHw/q1UM4yMWKQJhP+FQh9UB0uUd0+sB+vseJF+ho/gbnmdz2tdCWlp
   +bmkO2HZfyoC/BE4JIU3CCecsqJj9d1HyU9uoAoet730HZtf2ijW0rCW6
   Byl5bRzy7Aq6209Hv+DhlmlYv8C12AyD7x+VLcwHt9BZH6SmCbvhTesGc
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 114708932
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:S0Bu5qBOOofroRVW/xnjw5YqxClBgxIJ4kV8jS/XYbTApDh0gzxSn
 2tOCGyEaKyDYmT0Lot3O43j8hxS7MDWm9VhQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G1A7gRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwxshvGHNJ8
 P4jFyEVXgmag7P1+u6qRbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4XWGp0Fzx3Cz
 o7A11ipCRQYENmt8CS6zULrjdHslyDEe7tHQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaAoxUVHdRZFeY37AWQ4qPO5kCSAW1sZjxOcts9r+ctWCcnk
 FSOmrvBJxZirbmUQnK17aqPoHW5Pi19BXAGTT8JS00C+daLnW0opkuRFJA5Svfz14CrX2iqm
 FhmsRTSmZ0vo9YSxaK+/2v4kiqcv4HNH00PuhTYCzfNAhxCWKapYImh6F7+5PlGLZqEQlTpg
 EXoi/Ry/8hVU8jTyXXlrPElWejwuq3baGG0bUtHRcFJyti7x5K0kWm8ChlaLVwhDMsLcCSBj
 KT76VIIv8870JdHgMZKj2ON5ycCl/KI+THZuhf8MLJzjmBZLlPvwc2XTRf4M5rRuEYti7ojH
 pyQbNyhC30XYYw+kmroHbtMi+V2mXturY82eXwc507+uYdymVbPEetVWLdwRr1RAFy4TPX9r
 I8EapriJ+R3W+zieCjHmbP/3nhTRUXX8ave8pQNHsbae1oOJY3UI6OJqV/XU9A/zvs9eyah1
 i3VZ3K0P3Kl1SCfcFTSOyA7AF4tNL4mxU8G0eUXFQ7A8xAejUyHts/zq7NfkWEbydFe
IronPort-HdrOrdr: A9a23:i91QbaqZLL1iNNxifAqDNsAaV5v+LNV00zEX/kB9WHVpm5Oj+f
 xGzc516farslossSkb6Ky90KnpewK5yXcH2/hvAV7CZniqhILMFusC0WKM+UyZJ8STzJ8+6U
 4kSdkCNDSSNyk3sS+Z2njCLz9I+rDum83J9ITjJjVWPHtXgspbnmBE43OgYzRLrX59dPwE/f
 Snl696jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDKw875BKIhTaI7qe/NxSDxB8RXx5G3L9nqA
 H+4kLEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJptkJJi7qggOIYp0kf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDy6IiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ/O1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh7rD3vXklUqvoLhiKrLzPI9
 MeS/00I8wmN29yWkqp+1WHBubcB0jbUC32GnTq8fblrQS+1EoJvnfwgvZv30soxdYFUJ9D6P
 3DMqN00J9zbuJ+V9MnOM4xBfKtDGrDWBTNN3/XB2/GOuUoB1LhwqSHuoncwomRCcA1JV8J6c
 n8eUIdumgod030D8qSmJVN7xDWWW24GS/g08dE+vFCy/XBrRXQQFi+oX0V4r2dSs8kc4Tmcu
 f2PIgTD+7oLGPoF4oM1wriW4NKIX1bVMEOoN40V1+Hv8qOc+TRx6bmWeeWIKCoHScvW2v5DH
 dGVD/vJN9Y5kTuXnPjmhDeV37kZ0S695NtF6rR+fQV1eE2R8ZxmxlQjU786tCAKDVEvKBzdE
 xiIKn/mqf+vmWy9Xag1RQfBvOcNDcg3FzNaQI5meZRCTKFTV8qgaTtRVxv
X-Talos-CUID: =?us-ascii?q?9a23=3ALAR+e2lPX4flxkJnAyWr7kLbr+DXOUHz1G7CJEq?=
 =?us-ascii?q?6Mll4UI2MUFvBu5k4gsU7zg=3D=3D?=
X-Talos-MUID: 9a23:zF7hmQmtwzZ4EEuyAEdwdnpeZMxt4YCrOnkTrqo2/MK6FiZzBBSk2WE=
X-IronPort-AV: E=Sophos;i="6.00,228,1681185600"; 
   d="scan'208";a="114708932"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Luca Fancellu
	<luca.fancellu@arm.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH] tools: Move MASK_INSR to common-macros.h
Date: Fri, 9 Jun 2023 11:11:05 +0100
Message-ID: <20230609101105.2585951-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

MASK_EXTR() and MASK_INSR() are a matching pair.  Keep them together.

Drop the pair from x86-emulate.h which includes common-macros.h.

Fixes: 56a7aaa16bfe ("tools: add physinfo arch_capabilities handling for Arm")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>
CC: Luca Fancellu <luca.fancellu@arm.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Drop from x86-emulate.h too.
---
 tools/include/xen-tools/common-macros.h | 1 +
 tools/libs/light/libxl_internal.h       | 2 --
 tools/tests/x86_emulator/x86-emulate.h  | 3 ---
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
index d53b88182560..168691be0e93 100644
--- a/tools/include/xen-tools/common-macros.h
+++ b/tools/include/xen-tools/common-macros.h
@@ -73,6 +73,7 @@
 #endif
 
 #define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
+#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
 
 #ifndef __must_check
 #define __must_check __attribute__((__warn_unused_result__))
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 8aba3e138909..61f4fe1dec55 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -132,8 +132,6 @@
 
 #define DIV_ROUNDUP(n, d) (((n) + (d) - 1) / (d))
 
-#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
-
 #define LIBXL__LOGGING_ENABLED
 
 #ifdef LIBXL__LOGGING_ENABLED
diff --git a/tools/tests/x86_emulator/x86-emulate.h b/tools/tests/x86_emulator/x86-emulate.h
index de1f82668010..aa1ed75ec890 100644
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -51,9 +51,6 @@
 #define DEFINE_PER_CPU(type, var) type per_cpu_##var
 #define this_cpu(var) per_cpu_##var
 
-#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
-#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
-
 #define __init
 #define __maybe_unused __attribute__((__unused__))
 
-- 
2.30.2


