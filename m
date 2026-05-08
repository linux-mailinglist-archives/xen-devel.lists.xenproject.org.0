Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIn2Lsz2/WlilQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0B44F8004
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303819.1577184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMRB-00046t-PL; Fri, 08 May 2026 14:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303819.1577184; Fri, 08 May 2026 14:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMRA-0003jz-D7; Fri, 08 May 2026 14:44:20 +0000
Received: by outflank-mailman (input) for mailman id 1303819;
 Fri, 08 May 2026 14:44:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLMR3-0002WB-Cl
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:44:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMR2-005krU-OQ
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:44:12 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6a6-bab6-0a2a0a5309dd-0a2a450581d0-44
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:44:12 +0200
Received: from [209.85.208.45] (helo=mail-ed1-f45.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6bc-aaa8-0a2a45050019-d155d02dd96c-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:44:12 +0200
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-67c566cb519so3921629a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:44:12 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac4942068sm90736166b.62.2026.05.08.07.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 07:44:11 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778251452; x=1778856252; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4BfOntXbfM6hbvWE7lSKCrx+ZAzvsim2jXEiAgi4uM=;
        b=Eli6dke/Yb1Gcx949CcdjOP/2aG8KObUrHpa74thBJonYsWK0lmZdCz10zCyVbs0OL
         g8T49CwCiG+HORGXrs3QvN3SnVaKPknMXjMPDq+Ho2wmcAqsu08iS0B1cyVAMFWfpOAx
         XdRvTdL82LLAuUDOuv/ei2xPJIWOaGSm+hSNfbQGmTtFtx20hAon6M44Chek5szhz9US
         y5qiiFi8s9e/qP5DpudNgiGlJvW31bNAiaYC0Gw+UhCPkyffXdxfDZxOTImnrynLigqG
         b7yGNqPizXf4bJWJmZJRp2jWiIR/hHvzSBZRMDgjb8JC9uowcXJRWZVqSLq6pK8ouppN
         hCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251452; x=1778856252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E4BfOntXbfM6hbvWE7lSKCrx+ZAzvsim2jXEiAgi4uM=;
        b=k6Q5rP11QqPQaRKYS5Gpoaf6SbgR6xWANhrbDyMXpam74dKz6rRQouKptyZcUjomeA
         xA22rJbIl/kwwNvKPnUDC/nt/5/trgAjMDExmiSZxSMBVmhN7FnC38PKpbSFhbvr/DoW
         9wqSOpwy3ni6KX2sPLOi+EiebjvsB2PiaTs94EE5qWdaTIeoLRbUghecjDuYM8SaOgU6
         OFC31otNMRzAcHnRuvbVr4Y2bF5ksB6fZIRgNAYFO4OrOuPFHavOfKBWpe5fdsoDsg+v
         elM3FuOyRQyrYpuIsiEq7r8s3Fdmv8+HD8yXBjtuwe6Kllv7nO9yFimubfujXMAp44W3
         rCfQ==
X-Gm-Message-State: AOJu0Yz/vZC9r9z4E5bGUTQa+kKxCUy10SLKOuZArZB6JKX5d6E5RyOq
	tegLz5pM+2J+7u92E3wwdZNgcR43W8QO22sV8CXUIlyDsupio5J6UzMnQBoshw==
X-Gm-Gg: AeBDievk4hZXhKw8B/jXBAL+sHW8T8GTXc12tLrfob/2qAxNtmvGN6xzwL+bX5+yGog
	p1aJ7MDA2it0kOYlBC5FDCWjyrwnOTwTCOmqn1WbT8dZCvCSpda1ujC9KOPOOKFP+mYOX01K3q8
	F19uwtcAsk1wmDcmWRkqAd/P4ak5oi0bsh0EN4J+HkDm5LqtF1dCNXFyz2TOIbbtz7scfNfeLOv
	lc/2Tl+oRxZBpxfV7F+0Dv2w99PH3jIvtZO8zLHzZHGTQQPjHXEUae3Fss41WxU+HoT8vSwRv02
	a6OvMSKttI7+WSB27F5X68kJAFmUwf9j8x2yu79EitJl+B2fHkqeE7LmN6k9TKlXTN9MmQkFqGK
	Aeb/ADpF+ORLfE3sR3/EkowGRxFUnrJnIahPs+CO6lOT9FrhpwBEaRvhbjKj7yNsw/1UcT1t78k
	EoKx1jjaXgDWGtaobgCyp8le5/mvAh7uKadfxxw+U740n5chIAJ7OxQ6gsdoEUphXxZw==
X-Received: by 2002:a17:907:1c97:b0:bc5:284:4abc with SMTP id a640c23a62f3a-bc56e602671mr783846766b.45.1778251451674;
        Fri, 08 May 2026 07:44:11 -0700 (PDT)
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
Subject: [PATCH v2 24/26] xen/riscv: provide init_vuart()
Date: Fri,  8 May 2026 16:43:26 +0200
Message-ID: <6cf8cb552c146629375294861450b0e9619043d7.1778250616.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778250616.git.oleksii.kurochko@gmail.com>
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1778251452-DAF6E443-554099D4/10/73395122804
X-purgate-type: spam
X-purgate-size: 1328
X-Rspamd-Queue-Id: 8A0B44F8004
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.992];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

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


