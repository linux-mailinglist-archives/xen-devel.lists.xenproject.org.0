Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2E4AB5ACB
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 19:10:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983245.1369614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEt9M-0000ZX-Mc; Tue, 13 May 2025 17:10:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983245.1369614; Tue, 13 May 2025 17:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEt9M-0000W0-D2; Tue, 13 May 2025 17:10:40 +0000
Received: by outflank-mailman (input) for mailman id 983245;
 Tue, 13 May 2025 17:10:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dvFL=X5=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uEt5n-0003Uz-2u
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 17:06:59 +0000
Received: from 1.mo575.mail-out.ovh.net (1.mo575.mail-out.ovh.net
 [46.105.41.146]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad499f14-301c-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 19:06:57 +0200 (CEST)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.108.17.234])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4ZxjZ903vYz1sPK
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 17:06:56 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-frdbc (unknown [10.110.118.120])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 53D9C1FE02;
 Tue, 13 May 2025 17:06:56 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.114])
 by ghost-submission-5b5ff79f4f-frdbc with ESMTPSA
 id zV6+ADB8I2jomQcAYR2MaQ
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 13 May 2025 17:06:56 +0000
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
X-Inumbo-ID: ad499f14-301c-11f0-9ffb-bf95429c2676
Authentication-Results:garm.ovh; auth=pass (GARM-114S00879e9d5e9-aa55-4b5a-911e-f42410b055f4,
                    0F27B6D195039ACFBDF5EC7F2AC12BEA7E98F15C) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v2 12/22] x86/hvm: check for VMX in SMX if Slaunch is active
Date: Tue, 13 May 2025 20:05:49 +0300
Message-ID: <e9b026e7db3770544c989cccf59f6f7f0f056330.1747155790.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8948652463133537436
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdegieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepgeekffeiiedtveekhfdugeffveeigefgleegvdeghefftdetheefueeliedukedvnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukedurddujeekpdefjedrheelrddugedvrdduudegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheejhegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=QnIKAND7PaaYiBZpdm/P7GTarwHPzvaPJ5XCEeh+pOQ=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1747156017; v=1;
 b=VzxWWIYxhIyfqWtPHgEDUu+GFg49EFzsOGB3xjFxv8UTm08ad5Ir1uP3XX78Kfm7N/jGXYZC
 QWqrlcWUyU37SGZxEuJ72cF4Qq5sV169PW7JihtnDDOa2TZpwNdPSVo0f0JMU+ONlpP5EEwfYRt
 2fKUVM4uM5DKQUEy4CkUdHJoq6NnBpEJVzOZiAdCQv5L4+OJ4InKO1+UA2wk+MaQSHEAXIFDleN
 7N/bbyBR3nin47UZjjY53EVqHwpVd0RHkJOzZZ1xTAIf8TVl2l/u5SFAdRX9ZkB1eaOdN11XQli
 FN63Wo8gZetsyBPrmzNrZbERO/eersj7ia+9BYB2kWPpg==

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


