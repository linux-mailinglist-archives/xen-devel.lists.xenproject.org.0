Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F079D401ADE
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 14:03:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179710.326115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNDKu-0003yd-0a; Mon, 06 Sep 2021 12:02:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179710.326115; Mon, 06 Sep 2021 12:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNDKt-0003wi-Tq; Mon, 06 Sep 2021 12:02:51 +0000
Received: by outflank-mailman (input) for mailman id 179710;
 Mon, 06 Sep 2021 12:02:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PlzZ=N4=citrix.com=Jane.Malalane@srs-us1.protection.inumbo.net>)
 id 1mNDKs-0003wa-VD
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 12:02:50 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b13c8b2-0f0a-11ec-b0a0-12813bfff9fa;
 Mon, 06 Sep 2021 12:02:50 +0000 (UTC)
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
X-Inumbo-ID: 5b13c8b2-0f0a-11ec-b0a0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630929769;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FkKh25/O7W8PkkcqGWWAdNe03OfrUwvjmG6W/c0Qi7s=;
  b=W3ElB7tmteFnCQuGFTx74y3yUz8GDGPgoB9yFCsFHVPo9mQGLNc07aPW
   XymkO45suNTqXWM6cuc6MP4JmgndwHhebvaJYr0vE0siNTBYdWHGmtbN8
   G7zOkDZV09Mee+UbftjgiqVP6ONVyX1hTSk6wM4uIJqrApVHAxj6vWIWN
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: qrKOgZfF7Ems9LLXxm7kvfpwSlebblNmSCRhZv7CySQmC/DPOy38zO5mE/RFli4ZnmRNtzZr9x
 BWqzRjpQ5BRE+CSMLG6ubqdb+fH+OUZ8fP/RHhoTO+xaQ/ILxhOpSWjm4TuB7jIgZWOBsNJA+c
 oScgX0tH+LlH1e7V+z0Lh6axejXU7MInsGQ7xpNUr6fb61bjKl31Hp9DRyWvcL0oMNxqC6dsif
 +doS5jx0t+ejYRH6WwxbbUBcDN72QmFRYnXB2ZPpBc7fadylWDko9p00pVuySuBsTOjV1iYgS3
 g2oAW0DYiQQcU71Rb75DvvAs
X-SBRS: 5.1
X-MesageID: 51690423
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:B/PZD6/oXBQEQxBtr7Fuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re5cjztCWE7gr5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtBD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.85,272,1624334400"; 
   d="scan'208";a="51690423"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Wei Liu <wl@xen.org>, "Jan
 Beulich" <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Pu Wen
	<puwen@hygon.cn>, Andy Lutomirski <luto@kernel.org>
Subject: [PATCH v1 1/2] x86/cpuid: Expose NullSelectorClearsBase CPUID bit to guests
Date: Mon, 6 Sep 2021 13:00:03 +0100
Message-ID: <239f7624f3ac3793993dc045d451079aa555b90d.1630929059.git.jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1630929059.git.jane.malalane@citrix.com>
References: <cover.1630929059.git.jane.malalane@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

AMD Zen3 adds the NullSelectorClearsBase bit to indicate that loading
a NULL segment selector zeroes the base and limit fields, as well as
just attributes.

Expose bit to all guests.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Pu Wen <puwen@hygon.cn>
CC: Andy Lutomirski <luto@kernel.org>
---
 tools/libs/light/libxl_cpuid.c              | 1 +
 tools/misc/xen-cpuid.c                      | 1 +
 xen/include/public/arch-x86/cpufeatureset.h | 1 +
 3 files changed, 3 insertions(+)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index b2c673841a..d667c36f31 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -289,6 +289,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
         {"svm_pausefilt",0x8000000a, NA, CPUID_REG_EDX, 10,  1},
 
         {"lfence+",      0x80000021, NA, CPUID_REG_EAX,  2,  1},
+        {"nscb",         0x80000021, NA, CPUID_REG_EAX,  6,  1},
 
         {"maxhvleaf",    0x40000000, NA, CPUID_REG_EAX,  0,  8},
 
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 735bcf8f0e..d79e67ecfb 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -185,6 +185,7 @@ static const char *const str_7a1[32] =
 static const char *const str_e21a[32] =
 {
     [ 2] = "lfence+",
+    [ 6] = "nscb",
 };
 
 static const struct {
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 380b51b1b3..e5a7c94c78 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -285,6 +285,7 @@ XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */
 
 /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
 XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */
+XEN_CPUFEATURE(NSCB,               11*32+ 6) /*A  Null Selector Clears Base */
 
 #endif /* XEN_CPUFEATURE */
 
-- 
2.11.0


