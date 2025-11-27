Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2C8C8EC36
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 15:32:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174015.1498995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOd2G-0006qK-9E; Thu, 27 Nov 2025 14:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174015.1498995; Thu, 27 Nov 2025 14:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOd2G-0006nf-6V; Thu, 27 Nov 2025 14:31:52 +0000
Received: by outflank-mailman (input) for mailman id 1174015;
 Thu, 27 Nov 2025 14:31:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XRBq=6D=bounce.vates.tech=bounce-md_30504962.692860cf.v1-8f6362d3c4404a0b9c52a02ad003c61c@srs-se1.protection.inumbo.net>)
 id 1vOd2E-0006nX-Lj
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 14:31:50 +0000
Received: from mail132-20.atl131.mandrillapp.com
 (mail132-20.atl131.mandrillapp.com [198.2.132.20])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc137c08-cb9d-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 15:31:45 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-20.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4dHJlg26Z7zFCWb4w
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 14:31:43 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8f6362d3c4404a0b9c52a02ad003c61c; Thu, 27 Nov 2025 14:31:43 +0000
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
X-Inumbo-ID: cc137c08-cb9d-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1764253903; x=1764523903;
	bh=c3uFUFR0gCzgbxeRaC8eh8AzjcagpaNHm32V69DFMH4=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=vmz2cRPZdHh8s6FzSaIANqDQ5robFCWbT+gQqfbhDftA4/nRWohnE2BIodKt0RbTm
	 TV9LM/GLl0p8OrISzJWGb1CxTQHogLYA8vwiuGUbdhcJiPZ9ymWVy1ctO2DtLhqVQz
	 hG/g+zxyOCsYIPKgbYEzjOElgR6GH8QDE2uiT1PFnpsACR98HdaynSpHEzpjMbYPET
	 rpW7RSJhHaLBavaEySukNodrH9RWHcWFuAT7At37pfVJmao4pU5ZU/A/Ev36Q9wFwp
	 fAWV6FgAdH2Ajv8jfEA/PRr5Vu/JYHnDgPqE3m2Ue5TKbTze/rN3CzZpvHULnSC7Po
	 Kj/c3ecv/xgVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1764253903; x=1764514403; i=julian.vetter@vates.tech;
	bh=c3uFUFR0gCzgbxeRaC8eh8AzjcagpaNHm32V69DFMH4=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=tTsz6tdXFqfJqoKID0gpMxa2eVw2LpjQYtk2xHWZCfA1j+TH30PHiSm/UiibC38yR
	 BLmvNowTmxZGN7UPjIpQdY84WhSRJA3ESfd0ZAdAsQ/6mSj4+SoO46lMWVk2bMAdcA
	 otIvwafiXXEkFK/6+yD4ulkpEECZCQUmoxCa5kVSjyE6oV6ad0MpfGh6E2cEQwkpFf
	 b8wphb7rgE/IyKn1Jw4Gq0v4x/edeTUSFGpXXg605rjT6FGhZiT2YuQ70pqE6SXhLi
	 83JVad10UoCQp5pESnzWs5WmWp53UvBIR6vHwJGepK/CeqTOMrfI9VuTvP8xh45/z0
	 z4e+ZL3EiXWiQ==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20x86/efi:=20Remove=20NX=20check=20from=20efi-boot.h?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1764253902022
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>, "Teddy Astie" <teddy.astie@vates.tech>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20251127143136.1598354-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8f6362d3c4404a0b9c52a02ad003c61c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251127:md
Date: Thu, 27 Nov 2025 14:31:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Currently Intel CPUs in EFI mode with the "Execute Disable Bit" disabled
and the 'CONFIG_REQUIRE_NX=y' fail to boot, because this check is
performed before trampoline_setup is called, which determines if NX is
supported or if it's hidden by 'MSR_IA32_MISC_ENABLE[34] = 1' (if so,
re-enables NX).

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
 xen/arch/x86/efi/efi-boot.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 0194720003..8dfd549f12 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -748,18 +748,6 @@ static void __init efi_arch_cpu(void)
     if ( (eax >> 16) == 0x8000 && eax > 0x80000000U )
     {
         caps[FEATURESET_e1d] = cpuid_edx(0x80000001U);
-
-        /*
-         * This check purposefully doesn't use cpu_has_nx because
-         * cpu_has_nx bypasses the boot_cpu_data read if Xen was compiled
-         * with CONFIG_REQUIRE_NX
-         */
-        if ( IS_ENABLED(CONFIG_REQUIRE_NX) &&
-             !boot_cpu_has(X86_FEATURE_NX) )
-            blexit(L"This build of Xen requires NX support");
-
-        if ( cpu_has_nx )
-            trampoline_efer |= EFER_NXE;
     }
 }
 
-- 
2.51.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


