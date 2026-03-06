Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIH5C/cBq2m4ZQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:33:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C04224FBE
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:33:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247979.1546382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7c-0004nb-Hb; Fri, 06 Mar 2026 16:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247979.1546382; Fri, 06 Mar 2026 16:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7c-0004jR-69; Fri, 06 Mar 2026 16:33:52 +0000
Received: by outflank-mailman (input) for mailman id 1247979;
 Fri, 06 Mar 2026 16:33:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAjd=BG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vyY7a-0003HN-Ky
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 16:33:50 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40cb5aa9-197a-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Mar 2026 17:33:49 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-439b7c2788dso4198654f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2026 08:33:49 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae57c05sm4406550f8f.39.2026.03.06.08.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:33:47 -0800 (PST)
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
X-Inumbo-ID: 40cb5aa9-197a-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772814828; x=1773419628; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFH/mmXdjfsZGFnjZSa+nYBoxFRy8PjJpaEBRZ8E9iE=;
        b=mGyH7Ltb7HzT21mf4u7CIsGbzU3dLFfqETGZxzOcmwbN2DvFbZI7Uzt8DnkzFvRoO1
         RHpCxOY3iooonWlzboWyr0uT7kj0iITxiCeS8547vuEfs6D8twvvL5+qbaWkrDKddftT
         2bymNKy6xJvAl9W+mfNDeqkXQQt4A+8yCeL7jOO4IRvsR+gRw6pcoTTidtrXQZAgXlIb
         DALyIkqcUUAxbAO2OGDVCIILCq2CElw75kvCBKj/O9UyOIVhK5BgO5INmBec5rGExDAP
         LuVveeQohkjubaJeoEkPvBkhmECuBAshwcoUJdi5bKYyR4PGb3BuP53hhLmPAKsg7CNy
         0YqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772814828; x=1773419628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AFH/mmXdjfsZGFnjZSa+nYBoxFRy8PjJpaEBRZ8E9iE=;
        b=sDuSD2nQ7giepTdu0VEG7zNHmwUs3OUXLvSdT1zKS1sWTfF1Tu//dupja6CAu5ME5x
         M25koQy/3uzepG4TnJinCCz0HpddNnMpFEhjsUJPgDh1/i7HSUOsmPybYOf6QMcExVVJ
         bS+iKA9fNcrC0laMN5P4o4HufIJZ0/RdlnXvSTnVrHKlsak+vh0posnWOHE0nPssfhZb
         4rX30UrggqQ3pxo5pVJVkhykgL4aOj0pqlkdqtZEvLWTs3WAE+KpBdyThB+ctqCMwR/+
         3ovFM63kG9+OY/nvOjUsBIKfd+UK94M23DKiqPVsIwch7L53B50cAC+jfhRQJZzZOpwt
         Qotg==
X-Gm-Message-State: AOJu0YwY/LMAY87g8+4+Vl33Wd21d83AOZmGISBH2XRiaEpBkjgTnAiY
	iswxGRtvSBX+EyaT6+h+wAix3p2C/Wu2/wmFSOsP1nSePh7lX3OEe8ge428FOg==
X-Gm-Gg: ATEYQzwhAeO6pTKSox6R8h4WekX8XQjzTbCNy0glT29rjqT510eInDyL00ztP0zBI5D
	R4BY9mL7OTXptc0gmwY7cGVQ1C7GTsVveGH8r2MUWDIHNq5NylL/xg48RHuEO2IRrSDlD+J8o0Y
	ebXlEv9S2b+Q3bDribKExQtGrz9AJf9AiykIwjp1GYLN9q4QZLjoP/Ggvuo8Q2rdX4nR1HmB9/Y
	3au3yzwHZIqUMq4aqbxDs/s7zk6y6gtSmFcHpFZXZJYjM2cKcFzyn4tUzDaMYBjopk0r4JJfQeD
	evJeMZyfolOKet/znotbe2m0TjadjfxJMkYgG7U1VZkZMHILUHmAkWSNLpUQ1FGM9AFU2eQm6pq
	rmCJieqdy7HfSkNMY+9EQNCN2JscCZNuKLVv5WERYj7uqIzGVzGsaRX3ytjXYAQlQj+3ZGeQHDT
	RXzlMV9MTUezFMbZUHLLGY6009rAxtWqZW2aROWeT5exdZePY+NL1ZOz4vOEHxCJEphg+13DcW6
	y+s
X-Received: by 2002:a05:6000:2506:b0:439:aef4:944b with SMTP id ffacd0b85a97d-439da351a36mr4504521f8f.19.1772814828144;
        Fri, 06 Mar 2026 08:33:48 -0800 (PST)
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
Subject: [PATCH v7 08/14] xen/riscv: implement SBI legacy SET_TIMER support for guests
Date: Fri,  6 Mar 2026 17:33:25 +0100
Message-ID: <888b2d5a4a3ee9a83de4568b17253f865febaf9f.1772814110.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772814110.git.oleksii.kurochko@gmail.com>
References: <cover.1772814110.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 27C04224FBE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Add handling of the SBI_EXT_0_1_SET_TIMER function ID to the legacy
extension ecall handler. The handler now programs the vCPU’s virtual
timer via vtimer_set_timer() and returns SBI_SUCCESS.

This enables guests using the legacy SBI timer interface to schedule
timer events correctly.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3-v7:
 - Nothing changed. Only rebase.
---
Changes in v2:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
 xen/arch/riscv/vsbi/legacy-extension.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/riscv/vsbi/legacy-extension.c b/xen/arch/riscv/vsbi/legacy-extension.c
index 2e8df191c295..090c23440cea 100644
--- a/xen/arch/riscv/vsbi/legacy-extension.c
+++ b/xen/arch/riscv/vsbi/legacy-extension.c
@@ -7,6 +7,7 @@
 
 #include <asm/processor.h>
 #include <asm/vsbi.h>
+#include <asm/vtimer.h>
 
 static void vsbi_print_char(char c)
 {
@@ -44,6 +45,11 @@ static int vsbi_legacy_ecall_handler(unsigned long eid, unsigned long fid,
         ret = SBI_ERR_NOT_SUPPORTED;
         break;
 
+    case SBI_EXT_0_1_SET_TIMER:
+        vtimer_set_timer(&current->arch.vtimer, regs->a0);
+        regs->a0 = SBI_SUCCESS;
+        break;
+
     default:
         /*
          * TODO: domain_crash() is acceptable here while things are still under
-- 
2.53.0


