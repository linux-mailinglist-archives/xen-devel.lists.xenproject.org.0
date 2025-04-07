Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D191CA7D90D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 11:10:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939376.1339490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1iUy-0001c3-Qr; Mon, 07 Apr 2025 09:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939376.1339490; Mon, 07 Apr 2025 09:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1iUy-0001ab-Ma; Mon, 07 Apr 2025 09:10:32 +0000
Received: by outflank-mailman (input) for mailman id 939376;
 Mon, 07 Apr 2025 09:10:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QTTe=WZ=bounce.vates.tech=bounce-md_30504962.67f3967b.v1-195b7146c3954566ad5414a0ab3af972@srs-se1.protection.inumbo.net>)
 id 1u1iUw-0001aP-Qh
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 09:10:30 +0000
Received: from mail186-2.suw21.mandrillapp.com
 (mail186-2.suw21.mandrillapp.com [198.2.186.2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 216d8640-1390-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 11:10:21 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-2.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4ZWNhq6lyszS62H0K
 for <xen-devel@lists.xenproject.org>; Mon,  7 Apr 2025 09:10:19 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 195b7146c3954566ad5414a0ab3af972; Mon, 07 Apr 2025 09:10:19 +0000
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
X-Inumbo-ID: 216d8640-1390-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1744017019; x=1744287019;
	bh=3mj+1l3uD/Tj6ZfpS4cBiMYot52BcXKtmM6A5duhFng=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=wKTVV0KaFNAdyr5X5UAuTO5htsnb0JK/mO+1+bnCs75X78OBzh27aBSFe+5964YkF
	 oBaRdtvNjbAwZcxD1YGlfkK8O4kph8OchqKOHub9LWftN2Prbk7IJq3KXNJfST0qD1
	 qm5c7wJPsBzUOtGSTSBGQVmb6OL74bAtVxOVRLKuJn+pLsEpsNqm7P48VI9VHMajhK
	 eMjWdXh16gNLde3eZsIlZfzXLJZa+lR+TjVEb0r5ikngM6QtEZD9TcvOWyzzvXa0dO
	 F5k/eu1YOgpKdUwhxHwOSo0Ko3ggraWtL/7AX/Wcz7V/jclamapi09dS8sVDmz5YjZ
	 Cbu48nW0P8OEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1744017019; x=1744277519; i=teddy.astie@vates.tech;
	bh=3mj+1l3uD/Tj6ZfpS4cBiMYot52BcXKtmM6A5duhFng=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=jq7ZJMm9Yzq74QVbliGEldRiHzHVJWb6I9FV1Hc7prY4It8DqqdE/DQgEmd9xlYja
	 GfapP1Sd+EX5sgkYofPkfEJsEH9ik+6jB4mzuvP3OnkIpxryzEciAzoAsWhtzGVV4K
	 VbBWIpnqV/vi/gqx1Uu+gmmtl1nnOZvba859QkS7UJugYDKXFnvS/XcToRIZ9cquG6
	 QFnb3ATJcw678XWov5z//ddj1DX9uiALIYF5NYGXIOYTW46gUWiH4U3DKJjZenwg3R
	 QNq5gYeITujiJUexKwE6cfwudOpa6maiRJEFNQG0gftEEE+5lZ84x3GcCrnvCrTtV3
	 mv1lppYtdHasg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v3.1=202/2]=20x86/amd:=20Enable=20TCE=20in=20Xen?=
X-Mailer: git-send-email 2.47.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1744017019020
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <79b08632b74dc13b8c399003eb76d198cb73ac32.1743771654.git.teddy.astie@vates.tech>
In-Reply-To: <2bac0ded3456e04b49b48cf0808203e76fc6a622.1743771654.git.teddy.astie@vates.tech>
References: <2bac0ded3456e04b49b48cf0808203e76fc6a622.1743771654.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.195b7146c3954566ad5414a0ab3af972?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250407:md
Date: Mon, 07 Apr 2025 09:10:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Aside exposing this flag to guests, Xen can also make use of it to reduce the cost of
some TLB flushes. Enable this flag if supported by hardware.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
v2:
 - Add changelog entry
 - use trampoline_efer
 - use cpu_has_tce instead of opencoded boot_cpu_has(X86_FEATURE_TCE)
v3:
 - drop message
 - use bootsym for modifying trampoline_efer
---
 CHANGELOG.md                          | 2 +-
 xen/arch/x86/include/asm/cpufeature.h | 1 +
 xen/arch/x86/setup.c                  | 6 ++++++
 3 files changed, 8 insertions(+), 1 deletion(-)

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
index d70abb7e0c..9b1924ad05 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2008,6 +2008,12 @@ void asmlinkage __init noreturn __start_xen(void)
     if ( cpu_has_pku )
         set_in_cr4(X86_CR4_PKE);
 
+    if ( cpu_has_tce )
+    {
+        write_efer(read_efer() | EFER_TCE);
+        bootsym(trampoline_efer) |= EFER_TCE;
+    }
+
     if ( opt_invpcid && cpu_has_invpcid )
         use_invpcid = true;
 
-- 
2.47.2



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


