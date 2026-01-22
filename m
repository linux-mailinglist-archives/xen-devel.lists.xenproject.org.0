Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNm1HWRXcmkpiwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:59:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC116A8B7
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:59:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211542.1523088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viy1V-0002qu-EV; Thu, 22 Jan 2026 16:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211542.1523088; Thu, 22 Jan 2026 16:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viy1V-0002oL-Bi; Thu, 22 Jan 2026 16:59:09 +0000
Received: by outflank-mailman (input) for mailman id 1211542;
 Thu, 22 Jan 2026 16:59:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcaL=73=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vixqj-0007Id-NY
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 16:48:01 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b2afd50-f7b2-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 17:47:58 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b86ed375d37so142095166b.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 08:47:58 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b879513e951sm1686014966b.7.2026.01.22.08.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 08:47:56 -0800 (PST)
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
X-Inumbo-ID: 1b2afd50-f7b2-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769100477; x=1769705277; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcpUeXukHvpe2V8ajAwhudISERtpAWc83oml7NTTtzQ=;
        b=FrOljl7VtmHeX3Mr3lRguhO6SiLEoduNjNLKWcrngyVMRLxijP6gQJuo7sRa2WTTqZ
         NVK49joXFKzOEIC4/xoYH0v4xrqXaxXRvtzDIM06Jno8gX7uAj9nV38GTOTgzKY9z3E1
         Oioq2WrKh0sNPDCTbbMa066VkFYfXKtuUepf324XucmUHpI/B55aWu/Go/pj6FzJnUvJ
         sAr5zR166DCJVpUp2JYUS4e/LzSydgKkdvqYEFYL2GO2mRX80mr9eDAoZowjgDgfNXzx
         6Gg19MS7vmz39f8njfdTRmVeCb9+6exp6crWUw5oIqjFUCMfukAFT5fc4p24O/zdUTjK
         szzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100477; x=1769705277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dcpUeXukHvpe2V8ajAwhudISERtpAWc83oml7NTTtzQ=;
        b=ErE/rtaikJrJEzQsTa7I3FDtPADv4WjzETVrXv2TfpXNINizcw8Sqi0M7dSqE3vk1J
         gGi3bYb1GB5AyZJzeCK49TLa3zd1SIeoi0KS5L9CVKbaycZdOiaSY2GSO+ZV9aO4/ZCl
         XYF+wlTBkgpNPu71FEMY5Wug5+FFQTaWyC2oOtxA2ZDCjLToHuvJcu/QrBxT84ktOa4k
         yxa1ic9YEAbAOxiuubUeA1dv98Hd+ESNStAIi9EFS5klN/OrKS7FK/qR266hn1XP16+w
         Xv94KjyaFGyw2iHaxdKcbGmqxNKiE6m/8wJErE638V4lo6oILNd612Ce3X6nJZQ/fEWi
         v1hQ==
X-Gm-Message-State: AOJu0YwehBmuUk10gpOlZzECWhn3EBL+OQZTdnyPY3BfuUj7u3safAV6
	E5AMwyp/rwLnymzWsObdHA5pb9IlamSUe92VLKJlr6x1Vuxn3lfEEF8hAXHwmw==
X-Gm-Gg: AZuq6aJ8J3uy0dySaEVXIlCIEkWXI2t5ozLanitVN6VZiaPbtYdh+8CX9Z8458YnRH6
	hiOs3dwqLCh9+iq+5EnBLKVeEXv5oBk9P41Badx6MPKZJlja6QPEn5H170LqviWSjxaRfGlkRpl
	1qFfa1XsND9kG3m3yhnQzxIGxI0sYOSipsmT9XMkc8c86PYqIdURMc+Cm23Vx4v1Fs+RzZD6C4Y
	4PdstDK/Hi+D7/taqpBaog5dFMtfcypLeBI5+4lhw+vH40DbGJaM7F957Lh3aYUIpMenUMNpYch
	HPsPeYyma98H2M8O1CpQwEaNhhaHgOsq9rgjCp7tYncS1/qFNkbA5uZT+S6Ijc0MqEt7LGXHTBi
	72ZcGZnNb/oRxB+nNs0DjiWhCQnirmThxwfSj+gwbhx0E3Gw9osMWDrZbgPFIfzh7URbUFCZy3+
	Skuu3FZ3HPbAfhLMw4K580sJ3OQIRJBOAWzuoBaJPqtvBNSChEN07GJg==
X-Received: by 2002:a17:907:3f8d:b0:b7a:2ba7:197e with SMTP id a640c23a62f3a-b8800449ffdmr703667866b.29.1769100477230;
        Thu, 22 Jan 2026 08:47:57 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Romain Caritey <Romain.Caritey@microchip.com>
Subject: [PATCH v2 15/16] xen/riscv: init tasklet subsystem
Date: Thu, 22 Jan 2026 17:47:30 +0100
Message-ID: <36c05146c82f20f7760ec7f1de9700a2f1c698d8.1769099885.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769099883.git.oleksii.kurochko@gmail.com>
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
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
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,microchip.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5FC116A8B7
X-Rspamd-Action: no action

As the tasklet subsystem is now initialized, it is necessary to implement
sync_local_execstate(), since it is invoked when something calls
tasklet_softirq_action(), which is registered in tasklet_subsys_init().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Update the commit message.
 - Move implementation of sync_vcpu_execstate() to separate commit
   as it doesn't connect to tasklet subsystem.
---
 xen/arch/riscv/domain.c | 5 +++++
 xen/arch/riscv/setup.c  | 3 +++
 xen/arch/riscv/stubs.c  | 5 -----
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 13ac384c4b76..1458902aff82 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -254,3 +254,8 @@ void vcpu_kick(struct vcpu *v)
         smp_send_event_check_mask(cpumask_of(v->processor));
     }
 }
+
+void sync_local_execstate(void)
+{
+    /* Nothing to do -- no lazy switching */
+}
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 9b4835960d20..e8dbd55ce79e 100644
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
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index cb7546558b8e..c912d46f1e42 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -91,11 +91,6 @@ void continue_running(struct vcpu *same)
     BUG_ON("unimplemented");
 }
 
-void sync_local_execstate(void)
-{
-    BUG_ON("unimplemented");
-}
-
 void sync_vcpu_execstate(struct vcpu *v)
 {
     BUG_ON("unimplemented");
-- 
2.52.0


