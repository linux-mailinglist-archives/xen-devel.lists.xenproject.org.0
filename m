Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 864B2836F89
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 19:17:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670054.1042650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRyrT-0002nJ-7G; Mon, 22 Jan 2024 18:17:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670054.1042650; Mon, 22 Jan 2024 18:17:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRyrT-0002ic-3f; Mon, 22 Jan 2024 18:17:31 +0000
Received: by outflank-mailman (input) for mailman id 670054;
 Mon, 22 Jan 2024 18:17:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EdLN=JA=citrix.com=prvs=74474809d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rRyrS-0002ee-7u
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 18:17:30 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80a42b0b-b952-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 19:17:29 +0100 (CET)
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
X-Inumbo-ID: 80a42b0b-b952-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1705947449;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HFRrMhhOeGY2Gr1UMSgwTgZBg4tGjjmtfbyh4y4EHqU=;
  b=OtOw3HJSyQn/Nkm+n/l9kJyUpbf4iF7iWP+pQL3WLw3RnlQJrXKe+AvC
   CRJe+S1zGgvahZF9DpAKyVMK9tRQeuYNTXnvWVmSJ8aCpwhUfgnb8t2fB
   Xco5j4Q8+UXk01lazepQ2y3w8Pg4AfpwE234yuHokJXSEi+Dx1i2i29mG
   8=;
X-CSE-ConnectionGUID: FCbAE902SjqaC0PT4u4YkQ==
X-CSE-MsgGUID: OnkEHIj2TSiL73DBDu9phg==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 132366780
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:PWfb4q/5HpDMyDNvy+UVDrUD3X6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 zNKXWmFbqyJZWr2fogkatmwpkoC7JDUnNRqGlQ4rn08E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ksy1BjOkGlA5ABmPKoS5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklg3
 vYxBWFVNCuBnuudmIqHFvQwt8caeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUWGPEUn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwOxB3G+
 D2WpwwVBDk9Mt+y6RuHqE6Xh8uQxg/RdJ9DDL23o6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0efBdDuk74wGl0bfP7kCSAW1sZiFFQMwrsokxXzNC/
 lyOmcngCXpwsbmWYXWH/7yQoHW5Pi19EIMZTXZaF01fuYCl+dxiyE2XJjp+LEKrpvPeExjdk
 mjQlyonjp5LtfJXyvmK/mmS1lpAuaP1oh4JChT/Bz39s1IjNND9OuSVBU7nAeGsxbt1r2VtX
 1BewqByFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf8Jd0AvmskdBkxbpZsldrVj
 Kj74F052XOuFCHyMf8fj3yZVazGMpQM5fy6D6uJP7Kik7B6dROd/TEGWHN8K1vFyRB2+YlmY
 MfzTCpZJSpCYUiR5GbsFrh1PH5C7nxW+F4/srinl0n6jODPNSD9pHVsGALmU93VJZis+G39m
 +uz/ePTo/mDeIUSuhXqzLM=
IronPort-HdrOrdr: A9a23:e3arv6HrG1oFJQ5tpLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5r
 mTdZUgpHnJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YZT0EUMrzN5DZB4voSmDPIceod/A==
X-Talos-CUID: 9a23:5SLJpWP203BX8e5DdgJt3WNFQpoecGTU5y/oHxOlVVdqcejA
X-Talos-MUID: =?us-ascii?q?9a23=3A8s9yQQ4L6miWseHlVPZB43alxoxP5aeDKGEPy6k?=
 =?us-ascii?q?9uu3bbgBaFyrMlDS4F9o=3D?=
X-IronPort-AV: E=Sophos;i="6.05,211,1701147600"; 
   d="scan'208";a="132366780"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 1/3] x86/entry: Fix ELF metadata for NMI and handle_ist_exception
Date: Mon, 22 Jan 2024 18:17:11 +0000
Message-ID: <20240122181714.1543738-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240122181714.1543738-1-andrew.cooper3@citrix.com>
References: <20240122181714.1543738-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

handle_ist_exception isn't part of the NMI handler, just like handle_exception
isn't part of #PF.

Fixes: b3a9037550df ("x86: annotate entry points with type and size")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/x86_64/entry.S | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 482c91d4f533..c3f6b667a72a 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -1023,7 +1023,9 @@ FUNC(entry_NMI)
         ENDBR64
         pushq $0
         movl  $X86_EXC_NMI, 4(%rsp)
-handle_ist_exception:
+END(entry_NMI)
+
+FUNC(handle_ist_exception)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         SAVE_ALL
 
@@ -1150,7 +1152,7 @@ handle_ist_exception:
         ASSERT_CONTEXT_IS_XEN
         jmp   restore_all_xen
 #endif
-END(entry_NMI)
+END(handle_ist_exception)
 
 FUNC(entry_MC)
         ENDBR64
-- 
2.30.2


