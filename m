Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F87AB5ADB
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 19:12:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983344.1369733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEtAt-0007RE-M5; Tue, 13 May 2025 17:12:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983344.1369733; Tue, 13 May 2025 17:12:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEtAt-0007LN-EB; Tue, 13 May 2025 17:12:15 +0000
Received: by outflank-mailman (input) for mailman id 983344;
 Tue, 13 May 2025 17:12:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dvFL=X5=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uEt61-0003Mm-BQ
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 17:07:13 +0000
Received: from 12.mo581.mail-out.ovh.net (12.mo581.mail-out.ovh.net
 [178.33.107.167]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b64bdc9d-301c-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 19:07:12 +0200 (CEST)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.108.9.185])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4ZxjZS26L1z1JCW
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 17:07:12 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-rmfj9 (unknown [10.110.101.129])
 by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9C3241FE6E;
 Tue, 13 May 2025 17:07:11 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.106])
 by ghost-submission-5b5ff79f4f-rmfj9 with ESMTPSA
 id CmLADj98I2joPwEAsHcBfw
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 13 May 2025 17:07:11 +0000
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
X-Inumbo-ID: b64bdc9d-301c-11f0-9eb6-5ba50f476ded
Authentication-Results:garm.ovh; auth=pass (GARM-106R006702d9b2a-3705-4bfd-8582-94ee596064ad,
                    0F27B6D195039ACFBDF5EC7F2AC12BEA7E98F15C) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v2 17/22] x86/acpi: disallow S3 on Secure Launch boot
Date: Tue, 13 May 2025 20:05:54 +0300
Message-ID: <557fece168d8c9688338c2e69f96a8c5177ba9de.1747155790.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8953156063255704732
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdegieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpefhheefheduieelieekfffgfffgfedutdevleevvdfhfffgledvgfdtuddtheefieenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekuddrudejkedpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehkedumgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=EAvtKdu2xXjGkeSU2J30LIKYMel3gMLXJ7rp7XGeIao=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1747156032; v=1;
 b=ZJvibAp/RP9cf3TbjTIQQpOXSD9rb/ppPXWSRc3YtELtSZMY6AjO6AkscSSNgPlqguJw6Bp4
 Xmc0sDhAPzS8Nsjy7sw+rrfjAajIWSp2bvxQ8UwZXsLnnjIBawDNGOeJNrqAWvGTzQgRPI31sH1
 K6APWlpripYgo3KztHzq/9ySVKUUN1NKoUOG1UxwW3RBAJTkmAc+mmT/hsH+51Gs6TXpw7av/IF
 1ODm5Gafsb1DXcuNKcEv58ate3KnNfnW+9PvB7r9SyGhJ8F3dvDrAbX3oHnuJkph2JZsGiaiOov
 AFK0vS+0NKA6cEvDVGf5Co1GlWVyAzSX38nsqDDySBAPQ==

Secure Launch won't initiate DRTM on S3 resume (the code for starting
DRTM is not part of Xen), so abort a request to perform S3 suspend to
not lose the state of DRTM PCRs.

Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 xen/arch/x86/acpi/power.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index 3196a33b19..81eb8f705a 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -28,6 +28,7 @@
 #include <asm/irq.h>
 #include <asm/microcode.h>
 #include <asm/prot-key.h>
+#include <asm/slaunch.h>
 #include <asm/spec_ctrl.h>
 #include <asm/tboot.h>
 #include <asm/trampoline.h>
@@ -357,6 +358,13 @@ int acpi_enter_sleep(const struct xenpf_enter_acpi_sleep *sleep)
            PAGE_SIZE - acpi_sinfo.vector_width / 8)) )
         return -EOPNOTSUPP;
 
+    /* Secure Launch won't initiate DRTM on S3 resume, so abort S3 suspend. */
+    if ( sleep->sleep_state == ACPI_STATE_S3 && slaunch_active )
+    {
+        printk(XENLOG_INFO "SLAUNCH: refusing switching into ACPI S3 state.\n");
+        return -EPERM;
+    }
+
     if ( sleep->flags & XENPF_ACPI_SLEEP_EXTENDED )
     {
         if ( !acpi_sinfo.sleep_control.address ||
-- 
2.49.0


