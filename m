Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3D4B39F43
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 15:44:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098894.1452845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urcvA-0000kH-JF; Thu, 28 Aug 2025 13:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098894.1452845; Thu, 28 Aug 2025 13:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urcvA-0000iR-FB; Thu, 28 Aug 2025 13:44:08 +0000
Received: by outflank-mailman (input) for mailman id 1098894;
 Thu, 28 Aug 2025 13:44:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kSDy=3I=bounce.vates.tech=bounce-md_30504962.68b05d24.v1-1a43149b149342c9b5eb50ae1b69afb3@srs-se1.protection.inumbo.net>)
 id 1urcv9-0000IL-Lc
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 13:44:07 +0000
Received: from mail187-26.suw11.mandrillapp.com
 (mail187-26.suw11.mandrillapp.com [198.2.187.26])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 105bc283-8415-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 15:44:05 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-26.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4cCN0h70QTzKsbkb5
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 13:44:04 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1a43149b149342c9b5eb50ae1b69afb3; Thu, 28 Aug 2025 13:44:04 +0000
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
X-Inumbo-ID: 105bc283-8415-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1756388645; x=1756658645;
	bh=749WZuQSD3RJ4fQfzKGkAT09RJssRy+QRzxpooPcevY=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Uiv9zFK7MT96K8N2iXAvWx7wEHEqWn/UbwTER7CsKtBQAgI7nPDah5c+aDuoqjfi7
	 Ze0UlSC/ePg1aSdmvaRRkyUk2ENJkXk0omXewMHydSMLtJcti5V/VjO1FOqHv5On1r
	 +BNFsrWFydX9/bL8vPuc1qIfjdPqVBwOxOfSvt8QpR1vX1N5+/WfW8pBx4V/ZVtBkn
	 XvlIs/mpMSEY1NVbRRpgHUpKLvGwx6haFyjNJsnw5cz55rIUIB88fgGmngNZb8tuZi
	 fWYtFi6YyhHV3COkSPNDNiJLmxPyEmr97NNCMWTA04WHIAOn08iK9+DtyxHUYEQwxs
	 0fzi9WICgLrXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1756388645; x=1756649145; i=teddy.astie@vates.tech;
	bh=749WZuQSD3RJ4fQfzKGkAT09RJssRy+QRzxpooPcevY=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=nWgWWhRAMxW6JDVZTSr5VP/7gFnXWdzjkrnd43MNCbcXSENODltKyYb+LofCEuEdQ
	 uWheI6yAlXhUmBfq27jRTbbhSY8yR+xIIh3xDla0JtgUBSQxK9J/ohYiPVwxOmjWVx
	 /lXspsxdkz4d4DvkSNGYSYK3uVqqCUREZH731d0wfmLulagfWancYtYRe8fFN/kgsH
	 Y6sy7xig/objdC0d1jIaJQS8+TvCgp1+NFyBzn5US6+UsS1uE3BnDfFA9q4mvElVXp
	 dWISAyO5XuUTZy+hjO9kzou7WKPbLrIJTrwb5OqEcHP0xJ0JgoZ9J/i+gFmQHYH+dk
	 psOudV28xzGqg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2=201/3]=20xen:=20Define=20xen=5Fdomain=5Fhandle=5Ft=20encoding=20and=20formatting?=
X-Mailer: git-send-email 2.50.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1756388642648
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <8c36ee844f69c59cf2c504b411e6cf9c5617511b.1756386004.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1756388405.git.teddy.astie@vates.tech>
References: <cover.1756388405.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1a43149b149342c9b5eb50ae1b69afb3?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250828:md
Date: Thu, 28 Aug 2025 13:44:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

xen_domain_handle_t is defined as a opaque 16-bytes blob, but is
commonly used by toolstack and guest as a big-endian encoded and
formatted UUID (alike RFC 9562).

Clarify the definition of the type to ensure the guest and toolstack
interprets this value correctly in a way consistent with existing users
(at least with XAPI, xl, libvirt, hvmloader and Linux).

Fixes: 30ce2a9295a5 ("Store an opaque handle (tools uuid) in the domain structure")
Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
v2:
 - introduced
---
 CHANGELOG.md             | 1 +
 xen/include/public/xen.h | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index cd34ea87b8..8c4435c181 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -11,6 +11,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
    - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
  - Linux based device model stubdomains are now fully supported.
+ - Clarify guest UUIDs as being big-endian encoded.
 
  - On x86:
    - Restrict the cache flushing done as a result of guest physical memory map
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index 82b9c05a76..a219ef870f 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -973,6 +973,13 @@ typedef struct dom0_vga_console_info {
 #define xen_vga_console_info dom0_vga_console_info
 #define xen_vga_console_info_t dom0_vga_console_info_t
 
+/*
+ * The domain handle is chosen by the toolstack, and intended to hold a UUID
+ * conforming to RFC 9562 (i.e. big endian).
+ *
+ * Certain cases (e.g. SMBios) transform it to a Microsoft GUID (little
+ * endian) for presentation to the guest.
+ */
 typedef uint8_t xen_domain_handle_t[16];
 
 __DEFINE_XEN_GUEST_HANDLE(uint8,  uint8_t);
-- 
2.50.1



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


