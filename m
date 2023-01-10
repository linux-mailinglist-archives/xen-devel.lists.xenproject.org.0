Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B795D66473F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 18:19:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474875.736287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFIH2-0003ZV-Ik; Tue, 10 Jan 2023 17:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474875.736287; Tue, 10 Jan 2023 17:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFIH2-0003Ur-E1; Tue, 10 Jan 2023 17:18:56 +0000
Received: by outflank-mailman (input) for mailman id 474875;
 Tue, 10 Jan 2023 17:18:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dQxz=5H=citrix.com=prvs=367c7493a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pFIH1-0003S0-01
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 17:18:55 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dab2f6fd-910a-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 18:18:53 +0100 (CET)
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
X-Inumbo-ID: dab2f6fd-910a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673371133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eCREFamTt0EoYJNm1E/bfKdghUubXSF6+VcYofNVBO0=;
  b=Y4HzCWa3dNjZ8nxtp9pKn19MxQtoCOFlnOVfbf91miE0xYt0OBdnuYED
   8fs3uZeiaJ58vRpQCII3FnCMDgHcAynLeXWJId7RivDyRbDRoRwkxKQyE
   WyVXlfaWKtu+T/HWI0hcdfpQJF8aZV6n4nAHCvHAu3ycgam7XSrgtQzQQ
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 90908184
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HlOFja6Ym/vZ55ltzfpHKgxRtCvHchMFZxGqfqrLsTDasY5as4F+v
 jFNX2rQPanbMDDzKdp0OYni8UlSu5XSyIBhGwtk/i40Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZlPakS5AeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m6
 NwkEiJWUw+/gLyV+ZSaQKpXh/8uI5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJU0UUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0ExhfA9
 juWowwVBDkhHs7B0iOU0kixubGMsTzjCaxNBuOno6sCbFq7mTVIVUx+uUGAiea9ol6zXZRYM
 UN80jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcL8wSyUG2wFRT5pc8E9uYk9QjlC6
 7OSt4q3X3o16uTTEC/DsOfPxd+vBcQLBXIiWRUWFjYa3969g7gVrxiMdddYHaHg27UZBgrM6
 zyNqSE/gZAagsgKy7i38Dj7vt68mnTaZlVrv1uKBwpJ+is8Pdf4PNLwtTA3+N4adO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGVb5Jui8Axkkfi+F1/ronhe3C
 HI/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvK1TdrHA2OhPNhjqFfK0QfUcXY
 8/znSGEVChyNEia5GDuG7d1PUEDmkjSOl8/tbiklk/6gNJylVaeSKsfMUvmUwzKxPrsnekhy
 P4Gb5Hi40wGAIXDjtz/rdZ7waYicSJqWvgbaqV/Koa+H+aRMDp9V66AkO58JdcNcmY8vr6gw
 0xRk3RwkDLX7UAr4y3WApy/QNsDhapCkE8=
IronPort-HdrOrdr: A9a23:VNaTBao4kH69+E0mjWyyoxkaV5oleYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5NEtPpTnjAsm9qALnlKKdiLN5Vd3OYOCMghrKEGgN1/qG/xTQXwH46+5Bxe
 NBXsFFebnN5IFB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.96,315,1665460800"; 
   d="scan'208";a="90908184"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/8] x86/boot: Sanitise PKRU on boot
Date: Tue, 10 Jan 2023 17:18:38 +0000
Message-ID: <20230110171845.20542-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230110171845.20542-1-andrew.cooper3@citrix.com>
References: <20230110171845.20542-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

While the reset value of the register is 0, it might not be after kexec/etc.
If PKEY0.{WD,AD} have leaked in from an earlier context, construction of a PV
dom0 will explode.

Sequencing wise, this must come after setting CR4.PKE, and before we touch any
user mappings.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

For sequencing, it could also come after setting XCR0.PKRU too, but then we'd
need to construct an empty XSAVE area to XRSTOR from, and that would be even
more horrible to arrange.
---
 xen/arch/x86/cpu/common.c             | 3 +++
 xen/arch/x86/include/asm/cpufeature.h | 1 +
 xen/arch/x86/setup.c                  | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 0412dbc915e5..fe92f29c2dc6 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -936,6 +936,9 @@ void cpu_init(void)
 	write_debugreg(6, X86_DR6_DEFAULT);
 	write_debugreg(7, X86_DR7_DEFAULT);
 
+	if (cpu_has_pku)
+		wrpkru(0);
+
 	/*
 	 * If the platform is performing a Secure Launch via SKINIT, GIF is
 	 * clear to prevent external interrupts interfering with Secure
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index a3ad9ebee4e9..044cfd9f882d 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -109,6 +109,7 @@
 
 /* CPUID level 0x00000007:0.ecx */
 #define cpu_has_avx512_vbmi     boot_cpu_has(X86_FEATURE_AVX512_VBMI)
+#define cpu_has_pku             boot_cpu_has(X86_FEATURE_PKU)
 #define cpu_has_avx512_vbmi2    boot_cpu_has(X86_FEATURE_AVX512_VBMI2)
 #define cpu_has_gfni            boot_cpu_has(X86_FEATURE_GFNI)
 #define cpu_has_vaes            boot_cpu_has(X86_FEATURE_VAES)
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 566422600d94..6deadcf74763 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1798,7 +1798,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     if ( boot_cpu_has(X86_FEATURE_FSGSBASE) )
         set_in_cr4(X86_CR4_FSGSBASE);
 
-    if ( boot_cpu_has(X86_FEATURE_PKU) )
+    if ( cpu_has_pku )
         set_in_cr4(X86_CR4_PKE);
 
     if ( opt_invpcid && cpu_has_invpcid )
-- 
2.11.0


