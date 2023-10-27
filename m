Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 668007DA137
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 21:19:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624632.973231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwSMv-0002Ws-J0; Fri, 27 Oct 2023 19:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624632.973231; Fri, 27 Oct 2023 19:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwSMv-0002Uv-G4; Fri, 27 Oct 2023 19:19:41 +0000
Received: by outflank-mailman (input) for mailman id 624632;
 Fri, 27 Oct 2023 19:19:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cjdJ=GJ=citrix.com=prvs=657347611=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qwSMu-0002Up-99
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 19:19:40 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3c36ac7-74fd-11ee-98d6-6d05b1d4d9a1;
 Fri, 27 Oct 2023 21:19:38 +0200 (CEST)
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
X-Inumbo-ID: c3c36ac7-74fd-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698434378;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=27oIc6L47bBkCxsQsTDNa9J7x2KtqWWueihQZG3UFA4=;
  b=IFl0ZHXTRaxTg+069ZiLNaHMst5LP/IEdbEl7SYZmUTfHIkNTys4pZQW
   uODb2FxGD6z6rz9d3hsoENFtsTmsypEz4ZXmCUyk7lYs52Tc74MZ8MDp3
   bLcphC8FqVOW7RGkIO8Zmf1kMbEexOeCW/hWbOSjbafkKqMwk86WFCIK2
   I=;
X-CSE-ConnectionGUID: 4HsE3iLaT6K+1CkT5/cpqg==
X-CSE-MsgGUID: b46kcL+RQIi/13KeNh9/RA==
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 126748980
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:rGzvvqKNMGAGlOy1FE+RFJUlxSXFcZb7ZxGr2PjKsXjdYENS3jMOz
 WofUD+Ca/rfa2CkKtsiO43g8BhQscTXm9dnHANlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrYwP9TlK6q4mhB5gZhPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4rIXpjr
 v08IQxTTVParOGKnfWwUvBj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGspM0yojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXQG5oJzhfI/
 goq+UzzXk8ZP/jc8wOk8zX13czCuyOqH7g7QejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasnDQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBebSc22
 1GAmdSvHiBmurCRTXOb95+dqD/0Mi8QRUcSaCkFRE0f6tbiqY06jRXSZt9mHOi+ididJN3r6
 2nU9m5k3exV1JNakfrjlbzav96yjsTpVSNu5yHeYjyGrVpSZ7L4IIew8FeOuJ6sM72lokm9U
 GkswpbPvLtRUsHQxERhU81XQuv1uazt3Cn0xA43Rcd8rVxB7lb5JehtDCdCyFCF2yruURTue
 kbX8ThJ/p5VM2DCgURfONnpVJ1CIUQND73YuhHogjlmOMEZmPevpn0GWKJp9zmFfLIQua8+I
 4yHVs2nEGwXD69qpBLvGbZNjeRymn9kmjKNLXwe8/hB+eDGDJJyYe5aWGZik8hjtP/UyOkr2
 4o32zS2J+V3D7SlP3i/HX87JlEWN3krba0aWOQOHtNv1jFOQTl7Y9eImOtJU9U8w8xoehLgo
 yjVtrlwkwGk2xUq6GyiNxheVV8YdcYu8CtjZHFxYz5FGRELOO6S0UvWTLNvFZFPyQCp5acco
 yUtEylYPslydw==
IronPort-HdrOrdr: A9a23:5ZI0NqnmYgd8V441GH2f4X4IyS7pDfLc3DAbv31ZSRFFG/Fw9/
 rCoB17726StN91YhsdcL+7V5VoLUmzyXcx2/hzAV7AZniDhILLFuFfBOLZqlWNJ8S9zJ8+6U
 4JScND4bbLfD1HZKjBgTVRE7wbsaW6GKLDv5ag85+6JzsaFZ2J7G1Ce3em+lUdfnghOXKgfq
 DsnPauoVCbCA0qR/X+PFYpdc7ZqebGkZr3CCR2eiLOuGG1/EuVAKeRKWni4isj
X-Talos-CUID: 9a23:embQrmxgA2YJygmKONO2BgVIOtsIKXz5xUuOAAzhImVVFfqeUUafrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3Ajbd5ag7Eaew14vZnDdhNs0OUxoxiv/qtA2ROq6w?=
 =?us-ascii?q?nuo7dbg99HTfMyw6eF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.03,257,1694750400"; 
   d="scan'208";a="126748980"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Alejandro Vallejo
	<alejandro.vallejo@cloud.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: [PATCH v2.5 2/2] x86/Kconfig: Introduce CONFIG_{AMD,INTEL} and conditionalise ucode
Date: Fri, 27 Oct 2023 20:19:26 +0100
Message-ID: <20231027191926.3283871-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <ZTu_WxdWTrthCs4m@macbook>
References: <ZTu_WxdWTrthCs4m@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We eventually want to be able to build a stripped down Xen for a single
platform.  Make a start with CONFIG_{AMD,INTEL} (hidden behind EXPERT, but
available to randconfig), and adjust the microcode logic.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
CC: Stefano Stabellini <stefano.stabellini@amd.com>
CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>

I've intentionally ignored the other vendors for now.  They can be put into
Kconfig by whomever figures out the actual dependencies between their init
routines.

v2:
 * Tweak text
v2.5:
 * Fix indentation
 * Rename with _CPU suffixes as requested
---
 xen/arch/x86/Kconfig                 |  2 ++
 xen/arch/x86/Kconfig.cpu             | 22 ++++++++++++++++++++++
 xen/arch/x86/cpu/microcode/Makefile  |  4 ++--
 xen/arch/x86/cpu/microcode/private.h |  9 +++++++++
 4 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/x86/Kconfig.cpu

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index eac77573bd75..d9eacdd7e0fa 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -49,6 +49,8 @@ config HAS_CC_CET_IBT
 
 menu "Architecture Features"
 
+source "arch/x86/Kconfig.cpu"
+
 source "arch/Kconfig"
 
 config PV
diff --git a/xen/arch/x86/Kconfig.cpu b/xen/arch/x86/Kconfig.cpu
new file mode 100644
index 000000000000..b68c41977a3b
--- /dev/null
+++ b/xen/arch/x86/Kconfig.cpu
@@ -0,0 +1,22 @@
+menu "Supported CPU vendors"
+	visible if EXPERT
+
+config AMD_CPU
+	bool "AMD"
+	default y
+	help
+	  Detection, tunings and quirks for AMD platforms.
+
+	  May be turned off in builds targetting other vendors.  Otherwise,
+	  must be enabled for Xen to work suitably on AMD platforms.
+
+config INTEL_CPU
+	bool "Intel"
+	default y
+	help
+	  Detection, tunings and quirks for Intel platforms.
+
+	  May be turned off in builds targetting other vendors.  Otherwise,
+	  must be enabled for Xen to work suitably on Intel platforms.
+
+endmenu
diff --git a/xen/arch/x86/cpu/microcode/Makefile b/xen/arch/x86/cpu/microcode/Makefile
index aae235245b06..194ddc239ee3 100644
--- a/xen/arch/x86/cpu/microcode/Makefile
+++ b/xen/arch/x86/cpu/microcode/Makefile
@@ -1,3 +1,3 @@
-obj-y += amd.o
+obj-$(CONFIG_AMD_CPU) += amd.o
 obj-y += core.o
-obj-y += intel.o
+obj-$(CONFIG_INTEL_CPU) += intel.o
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index b58611e908aa..bb329933ac89 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -70,7 +70,16 @@ struct microcode_ops {
  * support available) and (not) ops->apply_microcode (i.e. read only).
  * Otherwise, all hooks must be filled in.
  */
+#ifdef CONFIG_AMD_CPU
 void ucode_probe_amd(struct microcode_ops *ops);
+#else
+static inline void ucode_probe_amd(struct microcode_ops *ops) {}
+#endif
+
+#ifdef CONFIG_INTEL_CPU
 void ucode_probe_intel(struct microcode_ops *ops);
+#else
+static inline void ucode_probe_intel(struct microcode_ops *ops) {}
+#endif
 
 #endif /* ASM_X86_MICROCODE_PRIVATE_H */
-- 
2.30.2


