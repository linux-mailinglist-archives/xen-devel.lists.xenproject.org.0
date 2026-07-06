Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gA9lLq/QS2okawEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B87D712EC1
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Kxif4d4Z;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355495.1610340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliK-0008Tp-39; Mon, 06 Jul 2026 15:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355495.1610340; Mon, 06 Jul 2026 15:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliJ-0008P9-UY; Mon, 06 Jul 2026 15:58:31 +0000
Received: by outflank-mailman (input) for mailman id 1355495;
 Mon, 06 Jul 2026 15:58:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wgliI-0008Cm-Sz
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:58:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgliI-003COz-9x
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:58:30 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd092-2eae-0a2a0a5409dd-0a2a4502b80a-36
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:30 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0a5-5a27-0a2a45020019-d155802da869-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:30 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-493b27c7451so38128505e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:58:30 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce03fa1sm284910325e9.11.2026.07.06.08.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:58:28 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783353509; x=1783958309; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wM02Rzxvcnp+4y/YzfnnOgBpcuqxKShTB/HzBg0suo=;
        b=Kxif4d4ZbgeE+LO3yz9Jf6TvFIlb8nYwn6Ca67uTQi5JT+MBH6sMr8RwLVHOyX91Al
         o+V+90YG3bP3cX/Tzk6A/bgqeChP6QC+VLCPI4Ivg9KQy640XFUMVzSY6lCJeU7i3MqG
         GV5Edlw2NChMfjp3hWbZroB7gfr63MaZhojrT9dk0GUdVfLkE6GkLP128Fi+4lhVQ8vV
         gh5cR56LpwkGzLfaE6Zxw44YEjjM65V75eiwXIH8hu8ML5r7HO41FzXTh12CMAguJfQh
         2O/w6MmgvC66ma3lmKYnGt7LCHBBqRXJy3mEKeUOnq9sea915bITNMwE5dpMgcCjE1ZC
         TrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353509; x=1783958309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2wM02Rzxvcnp+4y/YzfnnOgBpcuqxKShTB/HzBg0suo=;
        b=eqnFq+qv/xbk7jslJpc/6ARwktns1aHbJC4q+S3fyuLlAuKBIqbTdWGNFX3G9N3D6j
         vZaC625TI9/kam1k3xcmmAFNkSmSvsVaNm7Ec5RqObBQamQo8+ADMp/9jomybBaaz4tH
         ucYAU/v2cbCb8tQ5gUNkzSD1uo6GEDDx6RDAecmAyJJoXJ/cjUJW6Rj1WHJ0nKLUzHWn
         rvZsLqbkXrtRGGBRDp0eBCH3uoLrrpjH0hczAwYNY88spv9sqUgDRSAafjfDPi9PEwWM
         KjO/HXnvgBYZObZVxXl7bmCF/WKeNW/gSE+5QZv9LD+D4+47jzOMZyXUxYWz8d1gwLKG
         s+PQ==
X-Gm-Message-State: AOJu0YzWunerHAOVh/jxMIopaDJ5W5cKe0zBTaDz+j3A9phr5KEvqN4t
	nDug6tWag0ebFiUhnDekO4l8MPbGXpKtxMOa5dcsJ0faV9z4ztjR5Z43pdWC7Q==
X-Gm-Gg: AfdE7cmvrGIPKjcU+Db6CHBb8JUYSBbE6ChAV6GSOfl6LazJv9I7X+XqVkHdN6QHe81
	/KsJP2rLQvBnboSLpGuIrpitf1g7fdMCuopfEBpvfl7Zscv2GbO1M9hUw5cYWRmXVnBLkEvUPbc
	i9WNrcHFpriHjTyJL9nRvlhTvRdUgLsE+46DLT1GCuqYpGgQXQOPbizKcWRLHRuGiPGC/JzaFhr
	3Oo45WyUK9hnbU8pF1BQCklGVnXtfyMPXI1RYx7evdR8Y6AmBMW4JNj0RhHXuRn444BRArdx9x0
	Y8cde9T0NMH3nVqE/yILnevR0KJFc/FJxbjVb0BZ7U0sM5NWgKdY1+n7F54mLNKN8776cuA/lmC
	5L0UKy7yr0ger0ZdmKipQ8j2UuWebJCeqNzeWMhC9mt7YEZn6fiKwJ1KXkwT1OsA4B6bol8qbVh
	9Gl9PfrbT39Wdqr6d99cLSl8LiY7Ty/+aJ0X+Kpc7j9DRBGJa2XJJ/BsoYaw==
X-Received: by 2002:a05:600c:811b:b0:490:af63:2cb1 with SMTP id 5b1f17b1804b1-493decbf15dmr15755415e9.7.1783353509335;
        Mon, 06 Jul 2026 08:58:29 -0700 (PDT)
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
Subject: [PATCH v5 08/26] xen/riscv: implement prerequisites for domain_create()
Date: Mon,  6 Jul 2026 17:57:49 +0200
Message-ID: <2e6d9e0283bf401ca698e72ddeb7c7f4feaa118e.1783331040.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783331040.git.oleksii.kurochko@gmail.com>
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1783353510-7791E7C5-04EB336F/10/73395122804
X-purgate-type: spam
X-purgate-size: 3039
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
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
X-Rspamd-Queue-Id: 6B87D712EC1

arch_domain_create() and arch_sanitise_domain_config() are prerequisites for
domain_create().

arch_sanitise_domain_config() currently returns 0, as there is no specific
work required at this stage.

arch_domain_create() performs basic initialization, such as setting up the P2M
and initializing of next unused phandle.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5:
 - Only review. Nothing changed.
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


