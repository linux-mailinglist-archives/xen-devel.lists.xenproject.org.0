Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C20589FF714
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 09:46:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863732.1275123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTGpw-0005ZC-AQ; Thu, 02 Jan 2025 08:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863732.1275123; Thu, 02 Jan 2025 08:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTGpw-0005WT-35; Thu, 02 Jan 2025 08:45:48 +0000
Received: by outflank-mailman (input) for mailman id 863732;
 Thu, 02 Jan 2025 08:45:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XVIC=T2=bounce.vates.tech=bounce-md_30504962.67765234.v1-8f8814d4b30a41adb33ecc6a9e833b61@srs-se1.protection.inumbo.net>)
 id 1tTGpu-0004rS-39
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 08:45:46 +0000
Received: from mail180-50.suw31.mandrillapp.com
 (mail180-50.suw31.mandrillapp.com [198.2.180.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f31ba6ce-c8e5-11ef-99a4-01e77a169b0f;
 Thu, 02 Jan 2025 09:45:43 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-50.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4YP0fD21KZzCfD7Mc
 for <xen-devel@lists.xenproject.org>; Thu,  2 Jan 2025 08:45:40 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8f8814d4b30a41adb33ecc6a9e833b61; Thu, 02 Jan 2025 08:45:40 +0000
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
X-Inumbo-ID: f31ba6ce-c8e5-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1735807540; x=1736068040;
	bh=pAHxWdtF5F+VmVe6AG5QRFQ7htoBqzkaXnBayvRsH38=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=sCGaJGcFBppRgs03cEtlCOCLOHlzZKqwDj4/K/CHee3G4z7HS3zIxXzCNS6U4wvmL
	 fH2QJw5ie5V0aiFoRNWQ0NgWWg/CqYT/kdcoKtM24AUHkXR/hSq6AHTXBDBMLD6P23
	 FdTgDZQce6mZybN3ZUWUqlgLxjiOMkyAtTi6D+YU8pXo/F3AxLUBbXBPnVRdCEBfDK
	 5QQJJqHLCYUz1FRrqnEOgKEts5s/n94/cBn42guFOJ8Us6kRTiGiyLTUBO0udj2+AK
	 pIhcMq3GeqyLKuFdD7cAmtBO/YeCx94iMO0wRekz4Qb1/4/oINWOieNoUfdhyU0bs5
	 e5ind8mh0o73g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1735807540; x=1736068040; i=ngoc-tu.dinh@vates.tech;
	bh=pAHxWdtF5F+VmVe6AG5QRFQ7htoBqzkaXnBayvRsH38=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=wKVy2yAvNOjQbLmYOqN5D9dTy5JW3Hcmw4706h6l5wzpo78PK4184mbr2qyVcNWr0
	 0DahWdqVMf+l8fHJtJ/+a8chQgLF+DksU0fbZBvMYnbobPd/flZMa6vS1dyLbXf8rU
	 i68vgWz10wVPucpBPDbimnP68jzdimdurL8oeU7OmalPubBI7sviN2VIySQZZ6uZz1
	 ebU0Cci3u5Qp8p2hHs7Wy5eHBJZbkIJ60pUE5KuE7IdI3nEMYDzw9xWZKqwysNhlfC
	 y72QZBp1h7qhFYxZX6nS5EuIfQl8Yc9RsziZRgRHbnYESgbB5ye58zARaQMA8ik2vY
	 xvZuaZOpQPByg==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v2=2003/10]=20tools:=20Add=20arch=20LBR=20feature=20bits?=
X-Mailer: git-send-email 2.43.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1735807539448
To: xen-devel@lists.xenproject.org
Cc: "Tu Dinh" <ngoc-tu.dinh@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <20250102084413.102-4-ngoc-tu.dinh@vates.tech>
In-Reply-To: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
References: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8f8814d4b30a41adb33ecc6a9e833b61?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250102:md
Date: Thu, 02 Jan 2025 08:45:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
---
 tools/libs/light/libxl_cpuid.c | 3 +++
 tools/misc/xen-cpuid.c         | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 063fe86eb7..05be36f258 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -342,6 +342,9 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
         CPUID_ENTRY(0x00000007,  1, CPUID_REG_EDX),
         MSR_ENTRY(0x10a, CPUID_REG_EAX),
         MSR_ENTRY(0x10a, CPUID_REG_EDX),
+        CPUID_ENTRY(0x0000001C, NA, CPUID_REG_EAX),
+        CPUID_ENTRY(0x0000001C, NA, CPUID_REG_EBX),
+        CPUID_ENTRY(0x0000001C, NA, CPUID_REG_ECX),
 #undef MSR_ENTRY
 #undef CPUID_ENTRY
     };
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 4c4593528d..4f0fb0a6ea 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -37,6 +37,9 @@ static const struct {
     { "CPUID 0x00000007:1.edx",     "7d1" },
     { "MSR_ARCH_CAPS.lo",         "m10Al" },
     { "MSR_ARCH_CAPS.hi",         "m10Ah" },
+    { "CPUID 0x0000001c.eax",       "1Ca" },
+    { "CPUID 0x0000001c.ebx",       "1Cb" },
+    { "CPUID 0x0000001c.ecx",       "1Cc" },
 };
 
 #define COL_ALIGN "24"
-- 
2.43.0



Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

