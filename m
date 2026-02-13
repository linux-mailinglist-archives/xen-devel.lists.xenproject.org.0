Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5DzVBWtTj2lqQQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:38:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DB61383A6
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:38:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231445.1536655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqwAz-0006rQ-LI; Fri, 13 Feb 2026 16:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231445.1536655; Fri, 13 Feb 2026 16:37:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqwAz-0006pH-Hi; Fri, 13 Feb 2026 16:37:53 +0000
Received: by outflank-mailman (input) for mailman id 1231445;
 Fri, 13 Feb 2026 16:37:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HtAj=AR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqw2s-0005Wn-B7
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 16:29:30 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a88587e-08f9-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 17:29:28 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-48069a48629so10260255e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 08:29:27 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5ebd1bsm303288185e9.6.2026.02.13.08.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 08:29:26 -0800 (PST)
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
X-Inumbo-ID: 2a88587e-08f9-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771000167; x=1771604967; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4f8nWiqSAdQ3ihvLKp54Tg1Gj2dyPRa9lPHwnTHLKUI=;
        b=hRVKykmP+1eW6FLGVDZFos+sRgUPV8M/N4S8hCTBzj9/kqLogBIRAh9etNbH/AwNzy
         +X9ENVSD4rWhMKrrOvmBL+vhIpb9gnobyy9RdsxQBR6cZg8020rKcmm7IbAmnJVZ6Ps6
         C4HWQyjU6kabX0/y+9A2HbgjHHtAvjLStKloLQ3EGPdfMtzlSuS1JPCpOMyDUpRy38/R
         QkG/94kv8xWLYzL6UoRlQsTfUWybYq0noU/QHK3ki3Mz26cWV7paLrjSj/EiWtY8kh5I
         M1qvBYMvVc8M/k/ylzWDYq/gok4568IGRcusbbKAdpIXMvzgN+XIaSPSVm/i+jgJFCT2
         lMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771000167; x=1771604967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4f8nWiqSAdQ3ihvLKp54Tg1Gj2dyPRa9lPHwnTHLKUI=;
        b=IrxqFbPQc35waE/Y8DXoX0JE7bQ+kAjKgTu7r75wbDQJidlf8SK1IwHY9vTvQ6v7iF
         Vn154xgdCWlIXi2IfC3Bvo2ifc3mi8dBdAqjLBAr3txT4wXx9BMwtmXH0BTuUDzrOkXh
         AumqSebiWqoSTBpLYzNdZh2K5xX7v86w2as7pPNdLaqXHBm3f+YlkuxGni+VWDz/zgEw
         TfJEk/EjHSOphMzyg8c6Fpf5QEi7t/cW4tEE2UmQPt+jqqeQDn1rsqXH+xz7vozm7w4e
         H0tn6meXv0oLOrtd2VWhVqM3Bs4LdpSeJSR0gKzGU25E4wqj4UA9E5KQ5PZ5xLshWGLL
         REvA==
X-Gm-Message-State: AOJu0Yzv5E5RvxInVkMNTl9NuaB+oZdZ7YGE7CHXZzIPN3gAe0ircawx
	I11ltVYzj1HWPic5sDRNdfUrD2vPhtqKHGmfUlYVwhI7HrjZW/K7vvBM6vWnh37F
X-Gm-Gg: AZuq6aLUPlkqdC2fvnNF2S9YQErenCPiL4Q7dpQzjo993EE9M+seaPCHlWoE5v3FpXO
	28OjXnvvwtRkdV4D7YjLSRFlqmrX7hxB9BsJf7TmLVujE+9kM/741KJoVTf3/Zu0gdgpshft+5y
	FSbI5iPu1qcFFOfvHVehXhGb44lyDOclRsxzhmL0I6sEq5jPnFyDt5OEuOU1z9iKNqirDogFd5i
	p4kT931lgXZ2qPRwq+kx4qAVJwAtM+LD4XHf9aokHC5VPnY6+NvTpSucVOI29lxm7ItSgon0EqC
	5ugy/gtHLre0hPTJ7AZAE6+4Zo5IHysCV3wyZAvUHx3SU9iXNq93UqvPXtL1BolEtHA0yG7cbas
	zaXpe5UxgUSC4gxhcnQz3uOzpPxDUz2FSeroAiqB4Duj9kxxhccFo8+ER7MS6zDkaedqAG+05ZO
	ShMJu4QK3d9DqToLGyf42RG5X76i+omVRefDNJk5wILwcyxcdz419D8GrHlpXVkqqpUw==
X-Received: by 2002:a05:600c:3e87:b0:480:32da:f338 with SMTP id 5b1f17b1804b1-48373a0f961mr38476305e9.14.1771000167050;
        Fri, 13 Feb 2026 08:29:27 -0800 (PST)
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
Subject: [PATCH v4 15/16] xen/riscv: init tasklet subsystem
Date: Fri, 13 Feb 2026 17:29:01 +0100
Message-ID: <3da393474a5a8e8cb8b3760ccdd134196f3f0b14.1770999383.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770999383.git.oleksii.kurochko@gmail.com>
References: <cover.1770999383.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: B1DB61383A6
X-Rspamd-Action: no action

As the tasklet subsystem is now initialized, it is necessary to implement
sync_local_execstate(), since it is invoked when something calls
tasklet_softirq_action(), which is registered in tasklet_subsys_init().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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
 xen/arch/riscv/setup.c |  3 +++
 xen/arch/riscv/stubs.c | 10 ----------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index dc469b49623f..5843609350aa 100644
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
@@ -152,6 +153,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
         panic("Booting using ACPI isn't supported\n");
     }
 
+    tasklet_subsys_init();
+
     init_IRQ();
 
     riscv_fill_hwcap();
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index cb7546558b8e..26434166acc6 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -91,16 +91,6 @@ void continue_running(struct vcpu *same)
     BUG_ON("unimplemented");
 }
 
-void sync_local_execstate(void)
-{
-    BUG_ON("unimplemented");
-}
-
-void sync_vcpu_execstate(struct vcpu *v)
-{
-    BUG_ON("unimplemented");
-}
-
 void startup_cpu_idle_loop(void)
 {
     BUG_ON("unimplemented");
-- 
2.52.0


