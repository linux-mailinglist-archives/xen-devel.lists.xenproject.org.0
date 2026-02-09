Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFJ7APcQimlrGAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:53:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 833F1112B20
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:53:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225802.1532499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUVP-00031V-80; Mon, 09 Feb 2026 16:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225802.1532499; Mon, 09 Feb 2026 16:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUVO-0002tp-Vn; Mon, 09 Feb 2026 16:52:58 +0000
Received: by outflank-mailman (input) for mailman id 1225802;
 Mon, 09 Feb 2026 16:52:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zC3u=AN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vpUVM-0007Zd-7g
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:52:56 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c74ddf33-05d7-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 17:52:54 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b86ed375d37so551166166b.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 08:52:54 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8edacf1564sm415776866b.52.2026.02.09.08.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 08:52:53 -0800 (PST)
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
X-Inumbo-ID: c74ddf33-05d7-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770655974; x=1771260774; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twQjmhb1zGscONCfiElutibwq+HGssUs2R5xhfNZcQQ=;
        b=I/x/SQUjwZA25OzPp9tKGqPIoJ4xmFqjuPQUs0VasVYIT/gSY4GWjKIuUsgDbFmkNg
         y9Wu7ybY0br0wJDljdus3PfUrFYJ8zNbMo0P6r5b7QtbaCIef4gOPq8hZ4WNSkyiROiQ
         +sh4hnriKmSjUWUKM1XY2e7/b69YND1JFYKRDqhNWd94xf7ljwcm5LDoAM7naO5GZzYa
         YOYYl9k2FV4HfhulqqYv/lqyyCBIaFXb40L78l1EJRAjDFKxfnO73c2RegeVfr47Bt9l
         lyloHKpKaBZCSk+4IGL/NjnHsYxwZAWNzAB7+TyX+fZI80zPtJtR0axNmpjxzSqVWEVf
         Tnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770655974; x=1771260774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=twQjmhb1zGscONCfiElutibwq+HGssUs2R5xhfNZcQQ=;
        b=uHpqvtZa5xNKdC7lCRNDkHDDn2rhHM80byCbKO3RU8KwHYpzEUkEhCWKSn9AR9HraW
         R1SZEUH7Ocj8IY4KjjkA/DH9xPidDkUK6krlvf0SENZMIAhGdKeX3VaTKANo2s7cQ0QJ
         Rip8A7k3RVxyBrq0LCSq2gON7PMrmQEDzxKGBuxyFJ659liqNgWvUG5Gnxew1LyqjADe
         NlAG9FmHzXFr5TCj+P/XHfC7Fm9gGC3ll3vgTu+7NGzFulwWfIy89s5pwnsVY7+UgwPS
         MByFX0iGQC5/CALSk6DMgCA6nh2glAWvuBfBHtl4LypHOjDifVwF/eWR7rV/ubcs0ISC
         RGhg==
X-Gm-Message-State: AOJu0YzE8cEn7kzy2clyYveELdwC835+D5Pod+mv/zMW2jC2/NdDrerg
	GdzqSXvY67biDbR+Et1xj8zQEgqRIiLl5l/AGvoHTvhVn5GaKN9kAv1poes984Ex
X-Gm-Gg: AZuq6aLMhIOrvEvzXmm8UejQALI/X0Xy6Pm214+sh91mfCQxqjeAEMKQSwYccn652yx
	MeY8LU0yQwUj1+tiejRNTRzjsm+unIMU7WFI2TtQngJHAAoW0t20PJLcbbV5XMpdlpndisSzzeF
	d0WSZPwNoE3PxW6AEfVXGOAKMqMrwzAEBpwECKwXadaRfJ/iVXmZjXN6EwIhTR1+90JtZylsMZS
	VnaRHpDmBsgiefWOFCJShCErmJr5TdeHvNG43HkcQ2PhODIC6v+FhwYNLA7luaR0yqZ15JoosDJ
	LAQtYFN5oL4rL7vWZH+J8UWKrVi2AsGahOZkk9yO82e/2L70r/Q1lIA+nIZqQGC7IRCAEahhe6H
	SS0pH8d74pDmUkhZRgW4gP2Go+o/WILotkpIoc3easgUJxS80+TQXojn7azwmYchxBe7oTYnpfQ
	x0glGDoD5nECwh3rDRd9604nmBqnePH+lNkg6U1IL9+mVKBudZZ9w0NA/eokCbsLJx
X-Received: by 2002:a17:906:c10a:b0:b87:1839:2601 with SMTP id a640c23a62f3a-b8edf344219mr692780266b.40.1770655973617;
        Mon, 09 Feb 2026 08:52:53 -0800 (PST)
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
Subject: [PATCH v3 15/16] xen/riscv: init tasklet subsystem
Date: Mon,  9 Feb 2026 17:52:28 +0100
Message-ID: <8a433116ed15cb52bd1e241960741963d287f592.1770650552.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770650552.git.oleksii.kurochko@gmail.com>
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
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
X-Rspamd-Queue-Id: 833F1112B20
X-Rspamd-Action: no action

As the tasklet subsystem is now initialized, it is necessary to implement
sync_local_execstate(), since it is invoked when something calls
tasklet_softirq_action(), which is registered in tasklet_subsys_init().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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
index 010489f0b713..0cea1435ff32 100644
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
@@ -157,6 +158,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
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


