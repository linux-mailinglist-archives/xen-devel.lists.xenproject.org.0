Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLplOGrF8GloYQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:34:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 594F04870B1
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:34:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296346.1572835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjVm-0007nL-1e; Tue, 28 Apr 2026 14:34:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296346.1572835; Tue, 28 Apr 2026 14:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjVl-0007k0-Op; Tue, 28 Apr 2026 14:34:05 +0000
Received: by outflank-mailman (input) for mailman id 1296346;
 Tue, 28 Apr 2026 14:34:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wHjVj-0007G6-Bo
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 14:34:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHjVi-008eCF-N5
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 16:34:02 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69f0c54f-e002-0a2a0a5209dd-0a2a45029ad4-34
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:34:02 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69f0c55a-af86-0a2a45020019-d1558035cc99-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:34:02 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-48984d29fe3so139792575e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 07:34:02 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a774b6300sm19302145e9.16.2026.04.28.07.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 07:34:01 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1777386842; x=1777991642; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qE2dw8csXVresMQtos7iCpzGyvAdlUSDFRumCHhApSA=;
        b=HvTHYapeLwtKYIpfbs4BvHqpGe3CXF+GbDS7+Q7ykeQz2Suz1Nj1swHAegyyA9WMkc
         0pPafgzYzl0Vcm7DcmBNNm1YmOuNpQKzmiweQPpmRLkilpV99SETNZc50eH61F9ZXhqk
         1jUaqn1iOIhZI7B50JPtRZW32iRPf3cGTK6HDqqwTAU5/5/Lt6fod3uZIznCfoBhM3yB
         u5H8WiUAM7VZ5DWmSDA1iW8m88Ajzad8y8ND6HipCaiB88ZuJ7M0t2Zb8+dxanIX4BjZ
         Jo6gK75Zg469TNH2tJ/S3zXspEEL6di+NQ6b8y/hyjbgkVte5SASa7YQFy1qYngb62u7
         C0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386842; x=1777991642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qE2dw8csXVresMQtos7iCpzGyvAdlUSDFRumCHhApSA=;
        b=p59EDe7S+tNtlEwuWv8a6XQFTUlvSYAI83ZB8FG/KUAUQULqdKFKkMIP4bkmO+yfnN
         GAwBp4RnRJwn0qxGV4VW84ZIavUCQfvj8hD+f2PuPLn4CLFFsxOiOkvOobhV87dGrfvE
         xWYImEjevMCcMsQ1i1I1pyJlhTSpfmXtZUrBrxGhCThJLMnIUl/QzP1f4mHAik6s9yKZ
         rlZIebdu3MSTvrQbwElQkw3cDjBV+E3OhKx43JrwyJvNFYxq7GPPVlX2O4qLvgUtH9IJ
         OhQu3CTNdU7gQDBm9meSh40MS9eHIYJfjBPnV8x4a2oruQaR8Pq5kBdwO69x+kMYZBz6
         deaw==
X-Gm-Message-State: AOJu0Yxnig9nuM1e3M2jaW0b0twOe40ZP5vRrMP4csZ1zEG/0y5fqGUa
	Z3oOjLUwej6SgK05jKpnaeqTcWZq6ytZ+zk8YJ9E7F1V7mb0jaJEMBJm3Mteow==
X-Gm-Gg: AeBDieum++NpFILOwcqEoTvo958UBtcvWHePt4Viz2BB68rz70qe96LBdB6KpO69eqH
	/Gixz5iFrfhzx/VxWgPxvst5UKK6b34WI+2+PLg1ewDAIGZN7Q7Q55YZIyrEeDq+6OrCKhuaeSf
	e9N3Z0BEhycmnHGgJQ4ZjVJbZjevCV6sfFI0Q/7qcklIT9mpG6DGTUm4OPfX06w7ONXSk60t6eT
	L6EGGkyZEQSGzzDYFIwGjRcjYyxj45IW3/wjwimtY/IgXjajmlnQLHpo4F2vv52+iiSGncenEu1
	kPXMsiudLQYY25ophUNIyaH0hm5MGZPCWl6A25wCmsTYzsPd46Je9D6kOQ3llD/LVJ2XeYKxiKL
	ys/UxNgSSlJwJlcI9FRiXYCb7sGgCmhyHhJqEnrTOjx8yDWlajAhxHAy482xxc3v51K0ceCGFEx
	cJ9m9+t7TiQN5AAHvFlWl5l3F9rd8s2Fs4361fdwQNC/Bs8gL8b6Jm+yOcn+wrIoR+N8FlS+y2u
	0+6OBpLZCx1MYs=
X-Received: by 2002:a05:600c:4745:b0:488:9bf8:7f17 with SMTP id 5b1f17b1804b1-48a77b054d8mr48581005e9.14.1777386841814;
        Tue, 28 Apr 2026 07:34:01 -0700 (PDT)
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
Subject: [PATCH v4 10/11] xen/riscv: add definition of guest RAM banks
Date: Tue, 28 Apr 2026 16:33:39 +0200
Message-ID: <b98f1202008ee2ed223f91c4d4b1e7b16ff08d0e.1777303844.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777303844.git.oleksii.kurochko@gmail.com>
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1777386842-83F66161-9CF0018E/10/73395122804
X-purgate-type: spam
X-purgate-size: 3186
X-Rspamd-Queue-Id: 594F04870B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.914];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

The dom0less solution uses defined RAM banks as compile-time constants,
so introduce macros to describe guest RAM banks.

The reason for 2 banks is that there is typically always a use case for
low memory under 4 GB, but the bank under 4 GB ends up being small because
there are other things under 4 GB it can conflict with (interrupt
controller, PCI BARs, etc.). So a second bank is added above that MMIO
region (starting at 8 GiB) to provide the remaining RAM; the gap between
the two banks also exercises code paths handling discontiguous memory.
For Sv32 guests (34-bit GPA, 16 GiB addressable), bank0 provides 2 GB
(2–4 GB) and the first 8 GB of bank1 (8–16 GB) is accessible.

Extended regions are useful for RISC-V: they could be used to provide a
"space" for Linux to map grant mappings.

Despite the fact that for every guest MMU mode the GPA could be up
to 56 bits wide (except Sv32 whose GPA is 34 bits), the combined size
of both banks is limited to 1018 GB as it is more than enough for most
use cases.

Add inclusion of asm/guest-layout.h to asm/domain.h to make dom0less
common code build happy.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v3:
 - Move GUEST_RAM*-related defines to asm/p2m.h instead of public header.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/include/asm/domain.h       |  1 +
 xen/arch/riscv/include/asm/guest-layout.h | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/guest-layout.h

diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 6c48bf13111d..6044ce0feee0 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -7,6 +7,7 @@
 #include <xen/xmalloc.h>
 #include <public/hvm/params.h>
 
+#include <asm/guest-layout.h>
 #include <asm/p2m.h>
 #include <asm/vtimer.h>
 
diff --git a/xen/arch/riscv/include/asm/guest-layout.h b/xen/arch/riscv/include/asm/guest-layout.h
new file mode 100644
index 000000000000..68d95a09394c
--- /dev/null
+++ b/xen/arch/riscv/include/asm/guest-layout.h
@@ -0,0 +1,23 @@
+#ifndef ASM_RISCV_GUEST_LAYOUT_H
+#define ASM_RISCV_GUEST_LAYOUT_H
+
+#include <public/xen.h>
+
+#define GUEST_RAM_BANKS   2
+
+/*
+ * The way to find the extended regions (to be exposed to the guest as unused
+ * address space) relies on the fact that the regions reserved for the RAM
+ * below are big enough to also accommodate such regions.
+ */
+#define GUEST_RAM0_BASE   xen_mk_ullong(0x80000000) /* 2GB of low RAM @ 2GB */
+#define GUEST_RAM0_SIZE   xen_mk_ullong(0x80000000)
+
+#define GUEST_RAM1_BASE   xen_mk_ullong(0x0200000000) /* 1016 GB of RAM @ 8GB */
+#define GUEST_RAM1_SIZE   xen_mk_ullong(0xFE00000000)
+
+/* TODO: allocate these all dynamically */
+#define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
+#define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
+
+#endif /* ASM_RISCV_GUEST_LAYOUT_H */
-- 
2.53.0


