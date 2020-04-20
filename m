Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A191B0F18
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 16:59:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQXtH-0000iy-Sw; Mon, 20 Apr 2020 14:59:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=61/n=6E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jQXtG-0000it-Ds
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 14:59:18 +0000
X-Inumbo-ID: 81b123fa-8317-11ea-9e09-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81b123fa-8317-11ea-9e09-bc764e2007e4;
 Mon, 20 Apr 2020 14:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587394757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7k2KgyXK5WCQysFCR3M6CGIKNQrfmIps/JCUPxhQK84=;
 b=fuPrV/8gcQcGvGSKsP1nfQSAaP3Qz2zirdRU5L5h1/+ROLiK5+tMDL+u
 qqtaBTvpn5dPOqa9am8dTfP6iGPCHwlSI6J1K3hY4uEgScH6+lAgYjJCK
 cOxDwWGCXAoybMy7KSFMumzqXyklmow/K2gA8FxD++pVBS3ZV9jKjxiwu c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vwgPRJFnJJ5HqRLjWI1kNt/Q3Duw63WpHzn+qiHtkUT6j++6JPoEI0IarP9Lwtfke8lXvLX57x
 HZN62iud0ZAumQDQWfc5qdZuJhq/+Rx7vbhfwTG6D3vB4UXx8RCx2GhGqlmXykfIE3yAM5BmRy
 nRnZ8KGR/KMlRjRAlKJB5YsxiIC0fRfW2SxKhrXkMSrRFt7MmwW4iY9N1c+qYir45bb+Dcd6FG
 kE2afj2hZrrAArxk6xvJn4hSjhDpAxsKaDRIVm6NGiiAGUINqahCk8ugKJVOgvDKNu5xkTS9cg
 QGg=
X-SBRS: 2.7
X-MesageID: 15959931
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,406,1580792400"; d="scan'208";a="15959931"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 1/3] x86/S3: Use percpu_traps_init() rather than opencoding
 SYSCALL/SYSENTER restoration
Date: Mon, 20 Apr 2020 15:59:09 +0100
Message-ID: <20200420145911.5708-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200420145911.5708-1-andrew.cooper3@citrix.com>
References: <20200420145911.5708-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This make the S3 BSP path consistent with AP paths, and reduces the amount of
state needing stashing specially.  Also, it takes care of re-setting up Xen's
LBR configuration if requested, which was missing previously.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/acpi/suspend.c | 25 ++-----------------------
 1 file changed, 2 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/acpi/suspend.c b/xen/arch/x86/acpi/suspend.c
index 32d0f71ffd..1c2f1c470e 100644
--- a/xen/arch/x86/acpi/suspend.c
+++ b/xen/arch/x86/acpi/suspend.c
@@ -15,8 +15,6 @@
 #include <asm/xstate.h>
 #include <xen/hypercall.h>
 
-static unsigned long saved_lstar, saved_cstar;
-static unsigned long saved_sysenter_esp, saved_sysenter_eip;
 static unsigned long saved_fs_base, saved_gs_base, saved_kernel_gs_base;
 static uint64_t saved_xcr0;
 
@@ -25,14 +23,6 @@ void save_rest_processor_state(void)
     saved_fs_base = rdfsbase();
     saved_gs_base = rdgsbase();
     rdmsrl(MSR_SHADOW_GS_BASE, saved_kernel_gs_base);
-    rdmsrl(MSR_CSTAR, saved_cstar);
-    rdmsrl(MSR_LSTAR, saved_lstar);
-
-    if ( cpu_has_sep )
-    {
-        rdmsrl(MSR_IA32_SYSENTER_ESP, saved_sysenter_esp);
-        rdmsrl(MSR_IA32_SYSENTER_EIP, saved_sysenter_eip);
-    }
 
     if ( cpu_has_xsave )
         saved_xcr0 = get_xcr0();
@@ -46,24 +36,13 @@ void restore_rest_processor_state(void)
     /* Restore full CR4 (inc MCE) now that the IDT is in place. */
     write_cr4(mmu_cr4_features);
 
-    /* Recover syscall MSRs */
-    wrmsrl(MSR_LSTAR, saved_lstar);
-    wrmsrl(MSR_CSTAR, saved_cstar);
-    wrmsrl(MSR_STAR, XEN_MSR_STAR);
-    wrmsrl(MSR_SYSCALL_MASK, XEN_SYSCALL_MASK);
+    /* (re)initialise SYSCALL/SYSENTER state, amongst other things. */
+    percpu_traps_init();
 
     wrfsbase(saved_fs_base);
     wrgsbase(saved_gs_base);
     wrmsrl(MSR_SHADOW_GS_BASE, saved_kernel_gs_base);
 
-    if ( cpu_has_sep )
-    {
-        /* Recover sysenter MSRs */
-        wrmsrl(MSR_IA32_SYSENTER_ESP, saved_sysenter_esp);
-        wrmsrl(MSR_IA32_SYSENTER_EIP, saved_sysenter_eip);
-        wrmsr(MSR_IA32_SYSENTER_CS, __HYPERVISOR_CS, 0);
-    }
-
     if ( cpu_has_xsave && !set_xcr0(saved_xcr0) )
         BUG();
 
-- 
2.11.0


