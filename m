Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mBGuJAefPmr+JAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA516CEA09
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IM3KPjID;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1346274.1604766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lb-0001PD-4J; Fri, 26 Jun 2026 15:46:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346274.1604766; Fri, 26 Jun 2026 15:46:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8la-0001NM-Vd; Fri, 26 Jun 2026 15:46:54 +0000
Received: by outflank-mailman (input) for mailman id 1346274;
 Fri, 26 Jun 2026 15:46:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd8lZ-00012B-2b
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 15:46:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd8lY-008hQp-Fj
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 17:46:52 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ee5-2eae-0a2a0a5409dd-0a2a450ba306-14
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:52 +0200
Received: from [209.85.208.169] (helo=mail-lj1-f169.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9eec-ac48-0a2a450b0019-d155d0a9b49f-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:52 +0200
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-396771119c4so10048591fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:46:52 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9cd5b232sm2612888e87.29.2026.06.26.08.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 08:46:51 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782488812; x=1783093612; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1J8DhFfVno1XP9itvPHGglKJyQAoP1V4ZHqNNB/X7RA=;
        b=IM3KPjIDxTSIgxlLDu+SU4AB+jzFx2YN5ImKALJl/Lp44iA+7NAbA0y6Wt5P70GnuW
         5R9d02NBpamESvuwCIK2UsEdNgFfiNLwD/I1/HlqZG+SMiFkMB+h5HwFYCPM2bvYksJz
         AdaCOxaMR6Av662r1f1eqXbbJ4xVp4yWaH2VoPC57zc5jrMGo79t0Yn1rNSTZ8MAnG3I
         lMV0fiFIGVJQQ/6bjxqehl2s3JseXrOeKmnNYjO5UX6VMbB1KJRUvn//Y1g09fOHT7E/
         Iaw1xVDRNxu2aVyDv0YV2ltm38/NI9c6zXP2uks/JHvSbkyYUkuwQTokbVYLB1m14jsy
         +2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488812; x=1783093612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1J8DhFfVno1XP9itvPHGglKJyQAoP1V4ZHqNNB/X7RA=;
        b=NXUamx/6e6lIDrMCWH05P+nfq9kLdYmupCm95OamnWl1yX77Abd3izhB3Gt0n7ODBm
         5mE1ikfQdbu8DRZHiCbPm8haaN0bH2oCQiHUH6AmKzxSICecVJ6hrCAaozrV8kQCUuYn
         bFn0keHxQ8NtosD8fbMKlJHGXHNNc+UkyIMYSqkdC7cBpSqKoohON1ltj4kVOJGQQ63V
         4zR2cU0b/3mnfsOPr7c9YjClvxj+HCvagRUXa2VQWfDBBU5anrXAH4Hy8JAr4r+tqZ9b
         LbNhZJCMbz0DrV+lTvCvhYs9VBIihg8XJbujofMHQfW5gpewkr5jeBD34CRF5vIHtcOy
         uwfA==
X-Gm-Message-State: AOJu0Yw3HhV0bpQLNHSWvpNlWmXaAYmprQIsgw2mol9IvBpB9AhpyUT9
	7xdqItaxCYdsJU5S19i44+jzkmAgqdIE5vRK/CBkokW91nTqqsjgjk30/qeNlg==
X-Gm-Gg: AfdE7cn0KhlfOd6hJA0aU9A8et8f5Mcb+V3WRFDCSu9RXZ7vDGeji1si95Mux77qB+2
	gleizDIn33ZZrQxLCkYWqfnHjClSeKbR0UlClDXEAC7MbpWlciEpuhUsQ2uFUutQZtTYumkUxO5
	cTH1aebzY6RzFnNNfef5bc4shF/5MXRb330lrJKIZTLd/SzJnOPzuLEKNWyBYb/juuh/ZJKAuc5
	c5uxSg6tQmeNRax/FA2cR5juBTSP3uW/HJ1DYt0efbuIe7aeF9QG1q+UKjtqDl5A/CST+Z1j+Gn
	uPJ6n8CbbKtQ4TKVrphhZxFb8EO8Mwf0OhPJb+q+Mx0K9p7QZ4NyvunLCLtgpuC3W+6/08jsvKO
	aC755Ai7XbiDODnPCkybAYj3fj+IaCA/ufejZJCMOD9W85qI9Syl2DXKDE9KiMzXl+V+kSZKOpS
	zlO6dCkkLk9ETF5OMDRagKuazz7uWwjeQ4B6HvctQkzGCnXHhglxXYVBFbOw==
X-Received: by 2002:a05:6512:484b:b0:5ae:a9ed:2499 with SMTP id 2adb3069b0e04-5aea9ed2520mr97120e87.58.1782488811630;
        Fri, 26 Jun 2026 08:46:51 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
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
Subject: [PATCH v4 07/25] xen/riscv: implement prerequisites for domain_create()
Date: Fri, 26 Jun 2026 17:46:16 +0200
Message-ID: <5ddc512315e870100dc6fcc97a8f6d4fbdaaac05.1782487661.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782487661.git.oleksii.kurochko@gmail.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1782488812-A5921220-811BBC9F/10/73395122804
X-purgate-type: spam
X-purgate-size: 2984
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,gmail.com,wdc.com,citrix.com,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EBA516CEA09

arch_domain_create() and arch_sanitise_domain_config() are prerequisites for
domain_create().

arch_sanitise_domain_config() currently returns 0, as there is no specific
work required at this stage.

arch_domain_create() performs basic initialization, such as setting up the P2M
and initializing of next unused phandle.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v3:
 - Move arch_domain_destroy() from stubs.c to domain.c next to arch_domain_create().
 - Drop d->is_dying = DOMDYING_dead from arch_domain_create()'s fail label as domain_create() already does it.
 - Replace BUG_ON("unimplemented") with printk() in arch_domain_destroy().
---
Changes in v2:
 - update the commit message.
 - Drop vcpu_switch_to_aarch64_mode() from riscv/stubs. It shouldn't be under
   riscv/ at all.
 - Drop next_phandle as it is now in common code.
---
---
 xen/arch/riscv/domain.c | 29 +++++++++++++++++++++++++++++
 xen/arch/riscv/stubs.c  | 17 -----------------
 2 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index c77be3b827eb..2819ff4e7c92 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -289,6 +289,35 @@ void sync_vcpu_execstate(struct vcpu *v)
     /* Nothing to do -- no lazy switching */
 }
 
+int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
+{
+    return 0;
+}
+
+void arch_domain_destroy(struct domain *d)
+{
+    printk(XENLOG_WARNING "%s: unimplemented\n", __func__);
+}
+
+int arch_domain_create(struct domain *d,
+                       struct xen_domctl_createdomain *config,
+                       unsigned int flags)
+{
+    int rc = 0;
+
+    if ( is_idle_domain(d) )
+        return 0;
+
+    if ( (rc = p2m_init(d, config)) != 0)
+        goto fail;
+
+    return rc;
+
+ fail:
+    arch_domain_destroy(d);
+    return rc;
+}
+
 static void __init __maybe_unused build_assertions(void)
 {
     /*
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index acbb5b9123ea..3a7953593d93 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -101,28 +101,11 @@ void dump_pageframe_info(struct domain *d)
     BUG_ON("unimplemented");
 }
 
-int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
-{
-    BUG_ON("unimplemented");
-}
-
-int arch_domain_create(struct domain *d,
-                       struct xen_domctl_createdomain *config,
-                       unsigned int flags)
-{
-    BUG_ON("unimplemented");
-}
-
 int arch_domain_teardown(struct domain *d)
 {
     BUG_ON("unimplemented");
 }
 
-void arch_domain_destroy(struct domain *d)
-{
-    BUG_ON("unimplemented");
-}
-
 void arch_domain_shutdown(struct domain *d)
 {
     BUG_ON("unimplemented");
-- 
2.54.0


