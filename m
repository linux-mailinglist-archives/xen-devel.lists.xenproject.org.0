Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF37A7BA39
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 11:50:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937999.1338830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0dgD-0004ra-KY; Fri, 04 Apr 2025 09:49:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937999.1338830; Fri, 04 Apr 2025 09:49:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0dgD-0004pP-Ho; Fri, 04 Apr 2025 09:49:41 +0000
Received: by outflank-mailman (input) for mailman id 937999;
 Fri, 04 Apr 2025 09:49:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v+ht=WW=bounce.vates.tech=bounce-md_30504962.67efab2e.v1-f03623a9eced4d44ae0eb291817b55b0@srs-se1.protection.inumbo.net>)
 id 1u0dgB-0004pH-CZ
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 09:49:39 +0000
Received: from mail186-2.suw21.mandrillapp.com
 (mail186-2.suw21.mandrillapp.com [198.2.186.2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1dbb78f5-113a-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 11:49:36 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-2.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4ZTYjV4bv4zS62NM1
 for <xen-devel@lists.xenproject.org>; Fri,  4 Apr 2025 09:49:34 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f03623a9eced4d44ae0eb291817b55b0; Fri, 04 Apr 2025 09:49:34 +0000
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
X-Inumbo-ID: 1dbb78f5-113a-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1743760174; x=1744030174;
	bh=Zgls6Ay5FbMmCHdU+8uvrNvgwqWBCQyFngTdRnG5GHY=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=YQVMQWUwLvPQN2HBZ0434bwGajPluosCSXTILPhZMJPJEMNPphv5gpNBP4t75rWlV
	 UEPSWKd5WWF+HSLzLT0Wg98u1KUfkvgrYni9qBrPwvHZOKH2Gw4FClXRWM0CZPDr9+
	 guheX5oLqF3HXrVufElvKyHCVAS7Vv2p15ftigYaofHw/CpJYUQzEtuqR+SvPtUMeN
	 E3JRNXdHJg1nL5iUMd7xboeZXcVwMIl58mlqggKenDDZsnqvc5F44umXHRXZcK/kvb
	 eUl1DAUB3j20hWNKXXmcWducyZ/dOflFiDWEgwAQY7eXp9Lid3bdumk80/JRRDpYkH
	 nLQIKVIpa7G0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1743760174; x=1744020674; i=teddy.astie@vates.tech;
	bh=Zgls6Ay5FbMmCHdU+8uvrNvgwqWBCQyFngTdRnG5GHY=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=js6ay4DCZJsxIs51OKZgDpMpf6EtEvGbxwoPUfIOKbm7plNYE2KQQxQ0QxOfxzZsw
	 m1YqG0rCDj75zk3kUjNOSowg9tbmB1YJWZb6lAYLxAtciTzBWyNlxqF2JNv8REKFqU
	 iK8gghvqyzg1sma0CYGyflrEfria2VM4440JLLl92DHaCSkpWYC0tTHHls2xhO1i+6
	 fIGGLlBEwK3GcGx9y4vWUDEo99VOKWqXBgvgVWFamKAayM+furmYhlmnqZ3o5c6Cay
	 dEzsndhgeDLchiNhOU+vRsD8/Ru6TpfvgXETHF3mC6K4NUV/9kVrJ9tbSQWHTTMJno
	 Tu5J6as5MEjhw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2=202/2]=20x86/amd:=20Enable=20TCE=20in=20Xen?=
X-Mailer: git-send-email 2.47.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1743760173717
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <460c58c78e956ca62cc80356536dbdb45fa73779.1743756934.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1743756934.git.teddy.astie@vates.tech>
References: <cover.1743756934.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f03623a9eced4d44ae0eb291817b55b0?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250404:md
Date: Fri, 04 Apr 2025 09:49:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Aside exposing this flag to guests, Xen can also make use of it
to reduce the cost of some TLB flushes. Enable this flag if supported
by hardware.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
v2:
 - Add changelog entry
 - use trampoline_efer
 - use cpu_has_tce instead of opencoded boot_cpu_has(X86_FEATURE_TCE)
---
 CHANGELOG.md                          | 2 +-
 xen/arch/x86/include/asm/cpufeature.h | 1 +
 xen/arch/x86/setup.c                  | 8 ++++++++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index dbfecefbd4..375905e68a 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -18,7 +18,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Support PCI passthrough for HVM domUs when dom0 is PVH (note SR-IOV
      capability usage is not yet supported on PVH dom0).
    - Smoke tests for the FreeBSD Xen builds in Cirrus CI.
-   - Guest support for AMD Translation Cache Extension feature.
+   - Guest and Xen support for AMD Translation Cache Extension feature.
 
 ### Removed
 
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 05399fb9c9..ab6d07b767 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -114,6 +114,7 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_xop             boot_cpu_has(X86_FEATURE_XOP)
 #define cpu_has_skinit          boot_cpu_has(X86_FEATURE_SKINIT)
 #define cpu_has_fma4            boot_cpu_has(X86_FEATURE_FMA4)
+#define cpu_has_tce             boot_cpu_has(X86_FEATURE_TCE)
 #define cpu_has_tbm             boot_cpu_has(X86_FEATURE_TBM)
 
 /* CPUID level 0x0000000D:1.eax */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index d70abb7e0c..0e2e7d012f 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2008,6 +2008,14 @@ void asmlinkage __init noreturn __start_xen(void)
     if ( cpu_has_pku )
         set_in_cr4(X86_CR4_PKE);
 
+    if ( cpu_has_tce )
+    {
+        printk("Enabling AMD TCE\n");
+
+        write_efer(read_efer() | EFER_TCE);
+        trampoline_efer |= EFER_TCE;
+    }
+
     if ( opt_invpcid && cpu_has_invpcid )
         use_invpcid = true;
 
-- 
2.47.2



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


