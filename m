Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A3BA97016
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:11:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962912.1354061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FHg-0001nS-1A; Tue, 22 Apr 2025 15:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962912.1354061; Tue, 22 Apr 2025 15:11:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FHf-0001kE-US; Tue, 22 Apr 2025 15:11:39 +0000
Received: by outflank-mailman (input) for mailman id 962912;
 Tue, 22 Apr 2025 15:11:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BiSK=XI=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1u7FDy-0008SP-56
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:07:50 +0000
Received: from 1.mo576.mail-out.ovh.net (1.mo576.mail-out.ovh.net
 [178.33.251.173]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89296b44-1f8b-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 17:07:41 +0200 (CEST)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.148.79])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4ZhlwD2hlvz2D5X
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 15:07:40 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-fbc5b (unknown [10.110.113.124])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C4B0F1FEB5;
 Tue, 22 Apr 2025 15:07:39 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.113])
 by ghost-submission-5b5ff79f4f-fbc5b with ESMTPSA
 id k7jPJruwB2hGLQgAnYYF5A
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 22 Apr 2025 15:07:39 +0000
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
X-Inumbo-ID: 89296b44-1f8b-11f0-9ffb-bf95429c2676
Authentication-Results:garm.ovh; auth=pass (GARM-113S0071813dc17-e6f0-4e43-af1d-cc6a0fd55999,
                    7E508E014E7E7C169EB13C6E22C3C4EBF1F0FDD7) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH 13/21] x86/hvm: Check for VMX in SMX when slaunch active
Date: Tue, 22 Apr 2025 18:06:47 +0300
Message-ID: <c8d9306577b1f3bac28c2534c1b9196ff6b87639.1745172094.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12735053849832436892
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepgeekffeiiedtveekhfdugeffveeigefgleegvdeghefftdetheefueeliedukedvnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukedurddujeekpdefjedrheelrddugedvrdduudefnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheejiegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=QnIKAND7PaaYiBZpdm/P7GTarwHPzvaPJ5XCEeh+pOQ=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745334460; v=1;
 b=Ob2XXwnh0Oj98vogXenJ8/EWMgUpQW3+GA5zPSWUc5+XX34PxAcT1hozWlaBYkR9pkRbl/7F
 LD3HA30FU/FaXL4cvLtEyTdtn/927e53xOMGzw3yYVzhRDE58doLrEUd/MWaUUoyNdtGI0jtNPp
 iWc5nYsM03154Sbost0vQ5U1cYGnnZMrDkma7AuWI6JBigzGmOoOFNEFKrIR2acpVM6pBRS+hxm
 FU3AUh+bqzncY7pzbEO5ZInWDq1Bbie4Rb9N9db8a0gOxgzifIZPqTKurpgd6QH22blQapgdvHp
 uB7J2RZ5EAG9dD5cqVgBFruCqcM8x++806RwMaRvY/aWQ==

From: Michał Żygowski <michal.zygowski@3mdeb.com>

Check whther IA32_FEATURE_CONTROL has the proper bits enabled to run
VMX in SMX when slaunch is active.

Signed-off-by: Michał Żygowski <michal.zygowski@3mdeb.com>
---
 xen/arch/x86/hvm/vmx/vmcs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index a44475ae15..ef38903775 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -30,6 +30,7 @@
 #include <asm/msr.h>
 #include <asm/processor.h>
 #include <asm/shadow.h>
+#include <asm/slaunch.h>
 #include <asm/spec_ctrl.h>
 #include <asm/tboot.h>
 #include <asm/xstate.h>
@@ -724,7 +725,7 @@ static int _vmx_cpu_up(bool bsp)
     bios_locked = !!(eax & IA32_FEATURE_CONTROL_LOCK);
     if ( bios_locked )
     {
-        if ( !(eax & (tboot_in_measured_env()
+        if ( !(eax & (tboot_in_measured_env() || slaunch_active
                       ? IA32_FEATURE_CONTROL_ENABLE_VMXON_INSIDE_SMX
                       : IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX)) )
         {
-- 
2.49.0


