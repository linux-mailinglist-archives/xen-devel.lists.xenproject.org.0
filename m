Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HZphAqr2/WlilQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:43:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 903C94F7F4A
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:43:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303738.1577023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQd-0005bB-6M; Fri, 08 May 2026 14:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303738.1577023; Fri, 08 May 2026 14:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQc-0005Zn-W9; Fri, 08 May 2026 14:43:47 +0000
Received: by outflank-mailman (input) for mailman id 1303738;
 Fri, 08 May 2026 14:43:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLMQb-0005KE-72
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:43:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMQa-00A8wX-KC
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:43:44 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf692-bab6-0a2a0a5309dd-0a2a4503938a-12
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:44 +0200
Received: from [209.85.208.46] (helo=mail-ed1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6a0-672d-0a2a45030019-d155d02ef00b-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:44 +0200
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-67929ff6dbfso3147676a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:43:44 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac4942068sm90736166b.62.2026.05.08.07.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 07:43:43 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778251424; x=1778856224; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ON68LWIVt0veSgG+MTTW1fAvzyX9osSH7edZs0haa/c=;
        b=ojY1+tG8NNYEKp3zbp7ZDYfpS4oprGUt5PmSK/6ClXNHLVQqfeTMkBdCQi1YSVThur
         QZ78RPLe/2zzPjuRxXVb2Wyx4fHUwhEZXun/dkVP82KIUfJT824Z9YOcJCxx0edJ69gV
         VREtYZ4FggqCYzYnEFrpO3Bm6DU2DMY5+JmpvJ5DW/Otmowl5rrI3M2blHcYsk/ob/aC
         cICsQK8ZiVZ4LWObBvyggAdT8sZ8sLBU/EZ4F/rP5WbCgoBRFi1PRQhjFv3Fa2faohsw
         UUWaTly+K3PdPbqf6ovRYpMcjl0HJLNYWRNtb3p19hmSFnShT2NHYJPr/nDZ7eUFqERW
         lovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251424; x=1778856224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ON68LWIVt0veSgG+MTTW1fAvzyX9osSH7edZs0haa/c=;
        b=fDlkEB4+qh/4x3rcrOO7vr1bkxuouAyufYenhhmndbf9wQ9taeGEIeWd1Uyo6JTs/5
         LlB1RPWyjMtCcCtoBNrue1dlzLGNF0LwwIYxJFD3lISNcRd45BrQF3zYjJo/FsL/UGOi
         VOFRnptptal18Di8monwDZE7BKZzBg9o6pVvguGHfdhu2ffNcg7zMXX1G2TGMEgQtUYP
         NTfrU+3A7hUh00eQ4HYpKknY3FIF0ytRvST5e4q3L9g+4x+MzJcZgxRUofSLofsrMh2N
         OdY/EzZPQudfdKkJI+L31zjVaT8JIukZBIvAShZZwKpDTYoR49uXj8vD/jxeNsJ1hRXX
         EZkQ==
X-Gm-Message-State: AOJu0YwhW0r65UvZwAlvVn5wDs5ImVCB2fnKfyWEX6pcYVqX0WfStWgH
	4fBCXL2ja3+xjVbiVPBNLZmBI1dPOoFSUxn1FCSSRLHRNCEIdp2TtmJH30gf6w==
X-Gm-Gg: Acq92OGsNg34BuMel2BOa3QcrFRSaZxMbOA87IfqnBSxHuHMow7bcJ/36aZkwFY+AJ0
	2dHWEg7tdHIv88tkDX4XWRSXJq2BhrHMf4D1NMnw3X2loLdrGpht8oM4kdYzlDGjK3J6B6metCc
	VHIC1dK5WxBUQ0tZng8IgjXmWWl9bc4yyc1JreF4rRbtCjS+QOpktS3t7YBHhJZms5AcLV3s9Uc
	hWxzFjeXKBW4CMoVULcv2//mFjGLBaiOuG+symLO1BTvCSy9VEqI6iJ/6RyDT/xFp3DwRsDiqun
	oO+zA9tlfsx2u86Iuv/5ZwxRmTKWrqa6Evb2I6v9e5G1H8yv6GG6cO4AY3J2VlPNulMYxRcg3yo
	IZwGHktnszogG8h0Wg9qaZDoNDOM8WclYJ3m6L6GrO9OWWliKTnu1x2nFfdoLi2efZZHhUoi+jE
	bvkVKUjyUrH/i7t5teoChHHM6ZPKqnWk9siSb6vk4jwM4gvtrM54RpyVFt25/wF0LAnGVQ9tu9m
	5tN
X-Received: by 2002:a17:906:209a:b0:bc5:f94d:97ec with SMTP id a640c23a62f3a-bc5f94d99d0mr432108466b.45.1778251423727;
        Fri, 08 May 2026 07:43:43 -0700 (PDT)
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
Subject: [PATCH v2 04/26] xen/riscv: implement prerequisites for domain_create()
Date: Fri,  8 May 2026 16:43:06 +0200
Message-ID: <e4d6f36bcdf13e8fc12e8769dd965954c5f45b97.1778250616.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778250616.git.oleksii.kurochko@gmail.com>
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1778251424-39B7C938-AB56FE88/10/73395122804
X-purgate-type: spam
X-purgate-size: 2301
X-Rspamd-Queue-Id: 903C94F7F4A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

arch_domain_create() and arch_sanitise_domain_config() are prerequisites for
domain_create().

arch_sanitise_domain_config() currently returns 0, as there is no specific
work required at this stage.

arch_domain_create() performs basic initialization, such as setting up the P2M
and initializing of next unused phandle.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - update the commit message.
 - Drop vcpu_switch_to_aarch64_mode() from riscv/stubs. It shouldn't be under
   riscv/ at all.
 - Drop next_phandle as it is now in common code.
---
 xen/arch/riscv/domain.c | 25 +++++++++++++++++++++++++
 xen/arch/riscv/stubs.c  | 12 ------------
 2 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index c77be3b827eb..669dd27d79a3 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -289,6 +289,31 @@ void sync_vcpu_execstate(struct vcpu *v)
     /* Nothing to do -- no lazy switching */
 }
 
+int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
+{
+    return 0;
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
+    d->is_dying = DOMDYING_dead;
+    arch_domain_destroy(d);
+    return rc;
+}
+
 static void __init __maybe_unused build_assertions(void)
 {
     /*
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index acbb5b9123ea..cfb12d51d00b 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -101,18 +101,6 @@ void dump_pageframe_info(struct domain *d)
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
-- 
2.54.0


