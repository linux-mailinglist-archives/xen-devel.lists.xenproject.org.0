Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5O/hFauCMmrb1AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:19:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9F7698F87
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:19:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=GV2RUKWy;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1340113.1601249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoID-0007Yf-Uw; Wed, 17 Jun 2026 11:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340113.1601249; Wed, 17 Jun 2026 11:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoIC-0007Lz-EQ; Wed, 17 Jun 2026 11:18:48 +0000
Received: by outflank-mailman (input) for mailman id 1340113;
 Wed, 17 Jun 2026 11:18:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoHq-00043m-4g
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:18:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoHp-000VOC-E1
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:18:25 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a32827e-e002-0a2a0a5209dd-0a2a4506cf32-18
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:25 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328281-7371-0a2a45060019-d155dd32f128-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:25 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-4629d80fa08so589791f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:18:25 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa3a8efsm151319985e9.2.2026.06.17.04.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 04:18:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781695105; x=1782299905; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swvk0YgzHz2ARgtgQlFZIpC4f1vcSxqdtw9lrbDzreY=;
        b=GV2RUKWy1Iv6qTRnIEKQbQvnykh2HniTK9uiiBJYPGUkKgvEUI8eqWAV/g7Es/3GCk
         yqk8+IhvdmfxwINOw9ydEXXJgHt3SjDC6v61ZtvtiztJMBaTWw8x5nkOFhaJYwT7RDIJ
         nYZSd2191G+7i2cAm1HbiNo46jiKl6ipSGcNHVjSjbgL1KSbx2+G9BozphGJf9AUjfOc
         3H3ShzQNpQ3zypgS3PXIEf795ITGetLdJ1NHVPdZl8YGOhEsSMIGSnhvAVq7EWz/gq9M
         gTYfm3cQ6PrdNrfspj7dzMZIgx7ZjN+mJr8fR1jEiaDr+eZQSfGcUiDS9hWNH1LPOFPM
         Ptfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695105; x=1782299905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=swvk0YgzHz2ARgtgQlFZIpC4f1vcSxqdtw9lrbDzreY=;
        b=Ibci7jCi+zdq9cIJafdQZWEEXFv46qYVlCzMcu+DJghjzQ2XZEdcSCTteU2BJ/Hob3
         qxMPOp6+LWnGJVTMzBPIxAhLKHWkyNro+Z2i1atRLtJnh3KZsOS88BbGLi3HsYux1Gml
         bevAqtSAZwazbl9GePYar8e/qgkUKTkHqLAq+CXcAUIilrcAmBFniLjHt5IuH6e73RZY
         WYn7oqcxOQQS9Y0tOYJJelVVBQWK2eepdssf/5FRUn1M/Ze9WprACioz+NnhLBgX7yQs
         DYKKwzhOy6T2TbAPChDa6IZxC1VnBFYbXOzbuaPGoDm/jiSzYEWnxox3290ihMG2WMrz
         lvbQ==
X-Gm-Message-State: AOJu0YzsIao9G1TptQg92vpkFKqxpqkTcsPQDip1jmJ/Zcym0OH4I3CW
	hwuoStumLQ1x5WtZMgwHmgUgSPm7/nwa3TL/+eDgv4Q2bUl/HojQfc3BCrZAug==
X-Gm-Gg: Acq92OGXy/XXFZiLDnfCo5MUdtZp7AzhHJa30NsHHUEkJscEM043E9WHOAj5sgRt8Pg
	llZFFh3mMC7aYcsXcNJJ0nEjC1RAxWEB9eRfZhimtSi7g8AGhJQAJcBX2qC7uDQqvSTNVGFPZE0
	KcwJTbFaVIkSD0GM8Ls1e5x1fXxg1lAmAPTPTZR3P+PD5nV2KsktkS6VEFWwRNn+Dkr7QlHTNq/
	6I44bj87fCe9mkghn9vl8pyUGNKfquQrdAe0oMjLEsIireuRPl/Yvf+TezbGoXPWlnp4abpyZ0M
	s875CzNITBnV3QuPmfdNO+zxda5nX5zo4Q58ZijgvB1Bq0NhYsxcDyQi7gAHp55YYKIqmnvT5Hr
	br/lp4Kfm77KUeuqkTr9a2bNDHJo2yN4ML5fTMrbJGPVLFCu05uemJRBVEO7a2bU5dlIGa3nAtN
	bwczJ459rZS1CduuTO0VNmtTWdrIS6k+88SfnzrTX6Ef5aGtBkpLDUKzmSDcoUYGnSk5WH
X-Received: by 2002:a05:600d:84ca:20b0:492:3071:1db7 with SMTP id 5b1f17b1804b1-492333d8b49mr43245255e9.28.1781695104510;
        Wed, 17 Jun 2026 04:18:24 -0700 (PDT)
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
Subject: [PATCH v3 21/23] xen/riscv: provide init_vuart()
Date: Wed, 17 Jun 2026 13:17:49 +0200
Message-ID: <401b93509df2e9f8682c1de13de32114279ad3de.1781693963.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1781693963.git.oleksii.kurochko@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1781695105-8D982D75-C449A61C/10/73395122804
X-purgate-type: spam
X-purgate-size: 1333
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
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email];
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
X-Rspamd-Queue-Id: 1F9F7698F87

For debug purpose is enough to have only print messages from guest what is
now implemented in vsbi_legacy_ecall_handler().

For full guesst console support it will better to have something similar to
[1], thereby there is nothing specific should be done, at least, for now
and init_vuart() is provided to make dom0less code buildable.

[1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop/

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v2:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
---
 xen/arch/riscv/dom0less-build.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/riscv/dom0less-build.c b/xen/arch/riscv/dom0less-build.c
index a1fa51b996a7..d1a51b92936a 100644
--- a/xen/arch/riscv/dom0less-build.c
+++ b/xen/arch/riscv/dom0less-build.c
@@ -8,6 +8,14 @@
 
 #include <asm/p2m.h>
 
+int __init init_vuart(struct domain *d, struct kernel_info *kinfo,
+                      const struct dt_device_node *node)
+{
+    /* Nothing to do at the moment */
+
+    return 0;
+}
+
 int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,
                              const int node_next, const void *pfdt)
 {
-- 
2.54.0


