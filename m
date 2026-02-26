Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHnFHeQzoGnyggQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 12:52:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 661C41A55D5
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 12:52:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241470.1542606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvZuD-0001AG-Qq; Thu, 26 Feb 2026 11:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241470.1542606; Thu, 26 Feb 2026 11:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvZuD-00016W-Fo; Thu, 26 Feb 2026 11:51:45 +0000
Received: by outflank-mailman (input) for mailman id 1241470;
 Thu, 26 Feb 2026 11:51:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Tft=A6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vvZuB-0006EH-Vt
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 11:51:43 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84475c12-1309-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 12:51:42 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-48336a6e932so4567215e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Feb 2026 03:51:42 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd68826asm220079295e9.0.2026.02.26.03.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 03:51:40 -0800 (PST)
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
X-Inumbo-ID: 84475c12-1309-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772106701; x=1772711501; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaQEBFzhV9Xkezeed5Ppkja6vI/PHHkt+nSsCnYzAYc=;
        b=Lh+wHAjidi/c6fhvmhBenkQmZCrY7dJf+E6qWE85oxqp/GAlwjF4Axq54RxctUQ3Ro
         ZqkRNxPjgn17XHzeKGOxdJc8hPzDhOUln1bCbcZPhN2+ZxPgdqACE237KJ7JGVNOGoLn
         4hxHa0LdyPTHtycsaRlIpOG6V5r0+F3Lst8wKunK3ngheQ0Z5FYnH7E684tiGnnZS8Z6
         qpDojKk/GFG567kFw+0hmk6qukWqcgYkfirlJMXFo8FdW6yAjZ2xkWOhGOTM5dtYVnhK
         YVU7A65smtY7263NV3oTLy88uVFucdIvL3FU0L3trvpOaXotudbfyReip8XU+hB+900m
         PjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772106701; x=1772711501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EaQEBFzhV9Xkezeed5Ppkja6vI/PHHkt+nSsCnYzAYc=;
        b=ZWExT6PVnh2Kfi+NLOsah7XjUoNsXF/hXM0C6iDJT92B+Pahgt5pH4b5NiGu71YWmU
         FOpee86pBhjmN+zJA72zJGB14ux7XZkp7XnOyE8I5Be1nhhGD75PR+nuKpPyzF2YYPZQ
         yIGDHzIHdj6GQSncfrkLTgDEPp5cG76rdaZLFEiXvDH7JNlbWYrmokRjDZz04+wp9KtA
         56F38BfR6LUe8+ivEN8YosytDoCMr9cSuObRODvS2lTjYCQm75VpQ+98EYsfcnj3Za5F
         68E3mWZv+7gP6xyLS5AjT4P6qI3fLzaaxrcgjTZ03V2g8/fF3lhk3t0yjOtM0loDTfBy
         7YQQ==
X-Gm-Message-State: AOJu0YzZpTzA1WdnYZzlAnNhYQXFo1VhlGAAdY5/PFNpsRstX4KDD9W+
	EeqgixRJX4Q6vmUcSEoqwEriAO99jAuOYiF3YXT4wFucbiir+wZqVdZ4BhcsiA==
X-Gm-Gg: ATEYQzyxt9KAl4OII3X68gTGu7ox14ggxW+F5ZJtYvrYwi8CE2fZnNnFtHMeUf3rSMc
	rMjA+oRHPbuO0yE8iwwaD8a1J2L6Xz3xvxr6PFcZsZbBr4EzSQZrtQQtwge9rKlpA2mR5zheh9i
	Cmu3JFlDQLJG9R5cJt7UH4yQVrOALVrTkIGbc5Yb+s5LqH13Gy69GQc0u19+44+xfXjcSb97G47
	gk+FW1ftijfJVDgOosPK6gmlX+HUagsAKCk/RZJbxZ3YmMQy9WAi8Vjr1KXUnAAWdS/DKkR/zuR
	VTxQEz1h2WSWBNO7DC+5In8y5odqBoWTDTgfPm1SHPgRJ/yx1UJFICDl1yim2yiSJIEPKyEZ4us
	kagi1FgxV2c6GXCKtl2HCMU3iwxZZODAbFYsVmuM7C4EtPR7BD9SBg3HmOhWQPi6HDsJsb1ccI0
	nwTUJUPyzBZr6m4j3g1w3i+ZAnAsz8SNtAyq5cqNKnj6q+j9R9UU+xfodZcI3KuMVDpdOQR61pB
	zZEzaYQ
X-Received: by 2002:a05:600c:8708:b0:483:a922:2e8d with SMTP id 5b1f17b1804b1-483c216ab55mr57972105e9.4.1772106701281;
        Thu, 26 Feb 2026 03:51:41 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 13/14] xen/riscv: init tasklet subsystem
Date: Thu, 26 Feb 2026 12:51:13 +0100
Message-ID: <f7841c1679225077b4f294dc1afa97fdec1e60f4.1772016457.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772016457.git.oleksii.kurochko@gmail.com>
References: <cover.1772016457.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.981];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 661C41A55D5
X-Rspamd-Action: no action

As the tasklet subsystem is now initialized, it is necessary to implement
sync_local_execstate(), since it is invoked when something calls
tasklet_softirq_action(), which is registered in tasklet_subsys_init().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v6:
 - Nothing changed. Only rebase.
---
Changes in v5:
 - It was something wrong with prev. rebase. So fix that and move
   removing of sync_local_execstate() and sync_vcpu_execstate() to the
   next patch.
---
Changes in v4:
 - Nothing changed. Only rebase.
---
Changes in v3:
 - add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - Update the commit message.
 - Move implementation of sync_vcpu_execstate() to separate commit
   as it doesn't connect to tasklet subsystem.
---
 xen/arch/riscv/setup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index bca6ca09eddd..cae49bb29626 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -12,6 +12,7 @@
 #include <xen/serial.h>
 #include <xen/shutdown.h>
 #include <xen/smp.h>
+#include <xen/tasklet.h>
 #include <xen/timer.h>
 #include <xen/vmap.h>
 #include <xen/xvmalloc.h>
@@ -133,6 +134,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
         panic("Booting using ACPI isn't supported\n");
     }
 
+    tasklet_subsys_init();
+
     init_IRQ();
 
     riscv_fill_hwcap();
-- 
2.53.0


