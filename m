Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E37639FC47
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 18:21:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138578.256470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqeTM-0001vF-2I; Tue, 08 Jun 2021 16:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138578.256470; Tue, 08 Jun 2021 16:21:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqeTL-0001sp-VW; Tue, 08 Jun 2021 16:20:59 +0000
Received: by outflank-mailman (input) for mailman id 138578;
 Tue, 08 Jun 2021 16:20:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AOFJ=LC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lqeTK-0001sj-78
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 16:20:58 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f32f43c-1787-4252-b3d6-31beea1c021c;
 Tue, 08 Jun 2021 16:20:56 +0000 (UTC)
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
X-Inumbo-ID: 9f32f43c-1787-4252-b3d6-31beea1c021c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623169256;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D27eqjDhlfxlV8ZkEkb2PBFocv0/RKZBPYjWwSqnb1A=;
  b=ZBdk2Ze0OIySzZ8Xg5h5ncG1m0WoI3b8JF8i+yYfpue5ui6N+/aWVFTR
   nJ/CfJN+I5WTnIaP4Ivra+vrVyjXnVk1Ad5djisINcSlcojj1HhaJ18aD
   +N4+n8yc1LhpuQQBjBk+w1QhH0edtaCl9lyePMYvpCOp/HPfvQkIkutco
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: g3FRmaIpO0D+TVKbxTrl0zqm/Y0UhMpAVeVB5MVKkvNUNMfT1bItSwsiPfIXCafrlknXmrct02
 vucAmrrtKHCNmQAylpIHMSYSN0g8D0jtSvbfLo/OXsb14y67kMcpwYemKwz8l7KhZkmnJjTwYd
 uz9sz7QbygzZUCo4sLCCJAog4Mm/9APaw9D/QapmHV4739z+ciwumYph6wJMtz+qeI1stkoiDv
 nKqrQ/oJOk59i5XmYkEaFO0VChBEg4wKuYjOqwdpRJsQdGqS0fdsoZ4y8kggBrp8O/toFUMP7y
 pXI=
X-SBRS: 5.1
X-MesageID: 45401988
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:BAyZOqCTTR7UTv3lHemg55DYdb4zR+YMi2TC1yhKJyC9Ffbo8P
 xG/c5rsSMc5wxwZJhNo7y90cq7MBbhHPxOkOos1N6ZNWGM0gaVxelZnO3fKlbbehEWmNQz6U
 4ZSdkdNOHN
X-IronPort-AV: E=Sophos;i="5.83,258,1616472000"; 
   d="scan'208";a="45401988"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Sander Eikelenboom
	<linux@eikelenboom.it>
Subject: [PATCH] x86/cpuid: Half revert "x86/cpuid: Drop special_features[]"
Date: Tue, 8 Jun 2021 17:19:01 +0100
Message-ID: <20210608161901.1894-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

xen-cpuid does print out the list of special features, and this is helpful to
keep.

Fixes: ba6950fb070 ("x86/cpuid: Drop special_features[]")
Reported-by: Jan Beulich <JBeulich@suse.com>
Reported-by: Sander Eikelenboom <linux@eikelenboom.it>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Sander Eikelenboom <linux@eikelenboom.it>

Note - this deliberately doesn't insert ifdefary, because it is pointless.  It
adds to constructing/parsing time, and nothing in Xen can gain access to this
without an explicit introduction of INIT_SPECIAL_FEATURES again, which will be
obvious during code review.
---
 xen/tools/gen-cpuid.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index c6b5056a8d..b953648b65 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -362,6 +362,8 @@ def write_results(state):
 
 #define INIT_KNOWN_FEATURES { \\\n%s\n}
 
+#define INIT_SPECIAL_FEATURES { \\\n%s\n}
+
 #define INIT_PV_DEF_FEATURES { \\\n%s\n}
 
 #define INIT_PV_MAX_FEATURES { \\\n%s\n}
@@ -382,6 +384,7 @@ def write_results(state):
 """ % (state.nr_entries,
        next(featureset_to_uint32s(state.common_1d, 1)),
        format_uint32s(state, state.names.keys(), 4),
+       format_uint32s(state, state.raw['!'], 4),
        format_uint32s(state, state.pv_def, 4),
        format_uint32s(state, state.pv_max, 4),
        format_uint32s(state, state.hvm_shadow_def, 4),
-- 
2.11.0


