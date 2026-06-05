Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fW6PKm3gImrLegEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 16:42:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4428F648EF9
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 16:42:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=naW08YQ9;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1329554.1593616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVVkb-0000bE-I2; Fri, 05 Jun 2026 14:42:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329554.1593616; Fri, 05 Jun 2026 14:42:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVVkb-0000YQ-FB; Fri, 05 Jun 2026 14:42:21 +0000
Received: by outflank-mailman (input) for mailman id 1329554;
 Fri, 05 Jun 2026 14:42:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wVVka-0000LL-Al
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 14:42:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVVkY-00BGpY-OE
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 16:42:18 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a22e02e-bab6-0a2a0a5309dd-0a2a4509b374-46
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 16:42:18 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a22e04a-2497-0a2a45090019-d155dd2fb9d9-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 16:42:18 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-4602e2a0372so1216938f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 07:42:18 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f3444fesm27983183f8f.20.2026.06.05.07.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 07:42:17 -0700 (PDT)
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
        d=citrix.com; s=google; t=1780670538; x=1781275338; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rWAhmwQucWE34LfQRYW6OuBb9le+XJUC1EZpZR1/Wv0=;
        b=naW08YQ9dEJ+hNki4bY8PvpiptF3U4SoURXxDGRb342ukoH5TlKmEe6oUuvE8BGClR
         6v0joYhUN0nUajaMO8YLxaD+oMej3UhQwHg/TqW7l7Kh3V9Tqua9EGIPLFCZyw9PnLzt
         YEZbE+YT+esyNxyEImXlo5zz3Dw4PAasQT8M8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780670538; x=1781275338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rWAhmwQucWE34LfQRYW6OuBb9le+XJUC1EZpZR1/Wv0=;
        b=S+JyD2zmch8DzqvekEZsQ0epOshFQgfjNHIQ9pNkXnGTag+YPZcEX1if5lXWkmpcLU
         HqWt7Y/2hHqAYnw2RzYWR+L678KF9QE39XvLVjOpG+Adf+9Vj6IFQvkoUKfpzqkFEt1n
         jorMbwoUf0NN2smyJL7AouY8r/VA1MqVZZ0clLlfIv6ah7NATOQf4u00UXNep4XBnfxc
         fMESOOBv5kCc6pbwF+ajMgVB2I+fCQkh9OdddH4AAMLZmb5r9AjAYCFdy6tsM9xv7mzX
         cm1j3gEDyn9mEShaw4U4m5GrS5vbmkWjhTxTBC+D3aLTEkonG3inYK6pne2y53Ip2szt
         uUBg==
X-Gm-Message-State: AOJu0Yz/IU4MM1H9CZHySKtGNKilphYJ8gRGZgjEg0XRumSvaZ7vXMz2
	zAqmmeBUoN08FaZ78758Kb3hIt/tWGeFXWVzyS0GkB2QPNBdG5cSTIfr7yeVX0w77Dq3VdXFHbI
	iJXFc
X-Gm-Gg: Acq92OFLhDz2VcHgQRAVhpTe/M1iB80HoE0Lq4SP+o+yO6XTRQ/99nv/N9puDYIoGfq
	njTcmA9bpoV4v22/apNWLlIC8MEPU0JmmYg7N4RMpcnYuAPjvTF3CnO0HPcenetiuN05kuqRtMl
	pxHDFyGcs0ICNRh6IDrb2CZ/jYJ6L1gIPRBppA33XxcOEGE6mey0H+j9kJh7aEk5fPL3wxpCjFI
	q4XgltS/C5hX1WYfmZgklUtswtUVguOaFJBDv4svTDK3oBGKqJEVq692KTjc4UMjwfv/yTH+O1n
	bl2kiGUYxjmF04rHVy0tKxkTwrc8EoMcdXJ/Q1Qgx8wH0EOcKvjAuRVAlNppjWiQ8s49h5Sk2sm
	peinW9BjCKkdKozcmOJv34fL/3GBJQVF3Xx+snFILAGCAsgnnYOKQhWwqW+hoZerA+d3KTdN4+N
	+iUgjgX5NGbJeh8R7DRcOAhHNxttsmquG6YnFOCLhcdsbMK+vvf6CDWhGRse+WbtqIuhUS2HKyZ
	+XEWxTCcbUGSSk=
X-Received: by 2002:adf:f78b:0:b0:460:1957:1b33 with SMTP id ffacd0b85a97d-460304ec1b8mr4748520f8f.3.1780670537824;
        Fri, 05 Jun 2026 07:42:17 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 1/6] CI: Drop test-artefacts/Makefile
Date: Fri,  5 Jun 2026 15:42:08 +0100
Message-Id: <20260605144213.2749656-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260605144213.2749656-1-andrew.cooper3@citrix.com>
References: <20260605144213.2749656-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1780670538-88B73A53-68F8B845/10/73395122804
X-purgate-type: spam
X-purgate-size: 1594
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,kernel.org,amd.com,cardoe.com,suse.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:roger.pau@citrix.com,m:jgross@suse.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.com:email,cardoe.com:email,gitlab.com:url,vates.tech:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4428F648EF9

This is unused since commit 3c0c177ff904 ("CI: Switch qemu-arm* jobs to using
the distro provided QEMU"), and wants never to return.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Juergen Gross <jgross@suse.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 automation/tests-artifacts/Makefile | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 automation/tests-artifacts/Makefile

diff --git a/automation/tests-artifacts/Makefile b/automation/tests-artifacts/Makefile
deleted file mode 100644
index 80a60a94f3f7..000000000000
--- a/automation/tests-artifacts/Makefile
+++ /dev/null
@@ -1,19 +0,0 @@
-
-# the base of where these containers will appear
-REGISTRY := registry.gitlab.com/xen-project/xen/tests-artifacts
-CONTAINERS = $(subst .dockerfile,,$(wildcard */*.dockerfile))
-
-help:
-	@echo "Containers to build and export tests artifacts."
-	@echo "To build one run 'make ARTIFACT/VERSION'. Available containers:"
-	@$(foreach file,$(sort $(CONTAINERS)),echo ${file};)
-	@echo "To push container builds, set the env var PUSH"
-
-%: %.dockerfile ## Builds containers
-	$(DOCKER_CMD) build --pull -t $(REGISTRY)/$(@D):$(@F) -f $< $(<D)
-	@if [ ! -z $${PUSH+x} ]; then \
-		$(DOCKER_CMD) push $(REGISTRY)/$(@D):$(@F); \
-	fi
-
-.PHONY: all
-all: $(CONTAINERS)
-- 
2.39.5


