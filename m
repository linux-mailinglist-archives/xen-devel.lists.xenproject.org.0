Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D4B836F8A
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 19:17:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670055.1042664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRyrU-0003BN-IE; Mon, 22 Jan 2024 18:17:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670055.1042664; Mon, 22 Jan 2024 18:17:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRyrU-00039J-FA; Mon, 22 Jan 2024 18:17:32 +0000
Received: by outflank-mailman (input) for mailman id 670055;
 Mon, 22 Jan 2024 18:17:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EdLN=JA=citrix.com=prvs=74474809d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rRyrT-0002ee-8A
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 18:17:31 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 813a7f90-b952-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 19:17:30 +0100 (CET)
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
X-Inumbo-ID: 813a7f90-b952-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1705947450;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6dfsqszFswrxwOrMixowdJmK44p//CqfM9fyArS7Qeg=;
  b=V5Bo5kjpOnlXaew3m8eYrh8fSkSvlZJvQuIwKGAl+9i4KNsMi88Mbbk8
   tsviSbLUeULbEjUuidtfzf1zEV5h+iNQ0BMUl0DGLfQWCoNJzfQXfBV2o
   ELixMzpVikm4nMP9NpjSGzlc8Urdu1y7ZMVEMVuPtux8yxxip7mQ7ZaT6
   4=;
X-CSE-ConnectionGUID: FCbAE902SjqaC0PT4u4YkQ==
X-CSE-MsgGUID: yXgy9DN9QV6oaaiQlBjpxA==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 132366782
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:roncuaxofVltu9j6PzZ6t+dqxirEfRIJ4+MujC+fZmUNrF6WrkUGx
 mIdCjyGOqzZYWGmeoolbIqw9EJVuZTQytJkGwFlryAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8E4HUMja4mtC4gRnP6kT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KU9l/
 9U1eWhXVRKajsnu+I7nV7Vdhf12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyPVKfO3WjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJ4PxRjG+
 TKcl4j/KgAqO83O5RzUy0zygebGnBr/coAKBJTto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jY+cddNF+wx6CmW17HZpQ2eAwAsUTppeNEg8sgsSlQC1
 ViPhdrlQyNutL69TmiU/bOZ6zi1PEAowXQqPHFeC1Ffup+6/dB10Uqnostf/LCdoPb/MByhm
 2qxrjE3rO0rsZIWi5S4xAWS696znaQlXjLZ9y2OATr4v1kpOtb4D7FE/2Q3+hqpEWp4crVil
 CJd8yRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiH7INAOumsueh81Yq7onAMFh
 2eK52tsCGJ7ZiP2PcebnarvYyjV8UQQPYu8Da2FBja/SpNwaBWG7ElTWKJk5Ei0yBJEufhma
 f+mnTOEUS5y5VJPkGDnGI/wENYDmkgD+I8kbcyjkkn6i+vPOhZ4i94taTOzUwzw14vcyC29z
 jqVH5LiJ8l3OAEmXhTqzA==
IronPort-HdrOrdr: A9a23:OHXhxq6D3PYljILgEQPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HWoB17726TtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QC5SWY+eQMbEVt6nHCXGDYrQd/OU=
X-Talos-CUID: 9a23:wNHhH29hsSgmRGSfw4eVv2A/EOkIIyWH93XJKmTgMVo1VeGkSmbFrQ==
X-Talos-MUID: 9a23:1G9CMgrjcy/NGp8hRlIezyBSO9Y5z4L/MX5TlpwPuvCAHy5oKx7I2Q==
X-IronPort-AV: E=Sophos;i="6.05,211,1701147600"; 
   d="scan'208";a="132366782"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 2/3] x86/entry: Make #PF/NMI/INT0x82 more amenable to livepatching
Date: Mon, 22 Jan 2024 18:17:12 +0000
Message-ID: <20240122181714.1543738-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240122181714.1543738-1-andrew.cooper3@citrix.com>
References: <20240122181714.1543738-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

It is bad form to have inter-function fallthrough.  It only functions right
now because alignment padding bytes are NOPs.

However, it also interferes with livepatching binary diffs, because the
implicit grouping of the two functions isn't expressed in the ELF metadata.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/x86_64/compat/entry.S | 1 +
 xen/arch/x86/x86_64/entry.S        | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/xen/arch/x86/x86_64/compat/entry.S b/xen/arch/x86/x86_64/compat/entry.S
index 49811a56e965..4fbd89cea1a9 100644
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -29,6 +29,7 @@ FUNC(entry_int82)
 
         mov   %rsp, %rdi
         call  do_entry_int82
+        jmp   compat_test_all_events
 END(entry_int82)
 
 /* %rbx: struct vcpu */
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index c3f6b667a72a..fc64ef1fd460 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -723,7 +723,9 @@ END(common_interrupt)
 FUNC(entry_PF)
         ENDBR64
         movl  $X86_EXC_PF, 4(%rsp)
+        jmp   handle_exception
 END(entry_PF)
+
 /* No special register assumptions. */
 FUNC(handle_exception, 0)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
@@ -1023,6 +1025,7 @@ FUNC(entry_NMI)
         ENDBR64
         pushq $0
         movl  $X86_EXC_NMI, 4(%rsp)
+        jmp   handle_ist_exception
 END(entry_NMI)
 
 FUNC(handle_ist_exception)
-- 
2.30.2


