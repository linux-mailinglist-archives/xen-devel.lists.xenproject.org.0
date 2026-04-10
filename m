Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULXdIXYd2WnVmQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:55:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAD53D9E3B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:55:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279434.1563930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBECc-00014q-DE; Fri, 10 Apr 2026 15:55:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279434.1563930; Fri, 10 Apr 2026 15:55:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBECc-00010H-2u; Fri, 10 Apr 2026 15:55:26 +0000
Received: by outflank-mailman (input) for mailman id 1279434;
 Fri, 10 Apr 2026 15:55:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wBECZ-0000go-Vt
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 15:55:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBECZ-00Cgsb-BJ
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 17:55:23 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d91d6a-e002-0a2a0a5209dd-0a2a4507c022-4
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:55:23 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d91d6b-ba2d-0a2a45070019-d155802ac91f-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:55:23 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so15801995e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 08:55:23 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5b3c597sm78285605e9.12.2026.04.10.08.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 08:55:22 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775836522; x=1776441322; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/LD+Q0Pk+2kpOMYSoWm4Kl0NPbf+mdTSKTiw89GJZY=;
        b=NS3KKP6d9Lf0fLcTNYe9rrRWHhAl/mMHQNBT30DY00SlZK9DezZLP4xT+2fzpjjxLi
         sAhWQZYF046B74ioVBvGtEiET7fBNm80/IYzswi5EWhBxtz8VG5n6jTLFrU82xhdGVSc
         yFu4fmEAPSGM5yxLJBth/1NYXq0tK9Ty/SPBLJVPV5M5EclwEPfniJ4qcp2SPLHWGy1v
         uZ9Y7bcGIzoT1vmPLP9IZ2KHV/2ppkIKc9+Uo6lj03G1QFoZJ2O0BwB8diRHAdWiomsk
         Beq58GP7deZd9O1QmMXZRKmemYCEgn6vFeq75bf1bm8cvGjMsWfAxuWPzQiEeUknxU9q
         hviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836522; x=1776441322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j/LD+Q0Pk+2kpOMYSoWm4Kl0NPbf+mdTSKTiw89GJZY=;
        b=mwyL6u975ZoORfknTgQKadglSUE0RjfMh+6osljlQU8/pq6D17QFI7XqCGA1gWKMO8
         NFN/BJq/Cyu8Pr2bEHyfOYzrsw3D3QFL9xlUEJ/2qEiN0zB5KwGOIkHMQS7wWoZWTx60
         MfgK1eNmjcylc7Ja4vtdOqtfsaYaHnYu6fzgLprAOxqU9Lq2AuJPg9N/bEgg8fJ8gcTx
         7HVzqVVJvXIs4k8C1V4jM7uLSfa1w4lqNE+Lr5RQvUzSroWB5YoxNA0Zybu5DcyZoTzc
         VLOmdQVo5spqv7OuyoJIUiA3hnHtdsHHXxyPhCfvyjuCr5YVL6aDN6p/y+9NhQme1gzc
         B60A==
X-Gm-Message-State: AOJu0YxvBFAhG9137LLKdRy0iV8ScdXOcwWAlVEABEejqxQ1NJ1jCbB5
	ziMxkRpTKvDfDsxTDJybK8gO+OEEgxqlB0fXJac9kHL8gI6+5yCfmJ/PbShLeA==
X-Gm-Gg: AeBDiet7w8Bp3XDzJYLynH8UB8BwSDyDDEVd/JW4ozupOA8nx3UafKDgzheJnQ4+sY9
	kEUomgl/n0/Yph/kRKpq3jsQjKPlbbOsYlCvNBYJs/IHwgdQNqkzni42Y24P1hlgLwYmnNkQBAw
	z/GAeEtIkK5lh289XCsTvh6YOyktnnn2mSIGAwcF7kcLaVHOpsCO7KOWXO3FPRoBD39KcfBlIeu
	rMonk0thhf25ifK7/3rUDbdhL88IkXysr5P+tSCqGnvnBvk/mvbT0bek36XJz8by20nEFNGXj+F
	1XUA8y75jKkyrWKk2ZDCoqTbkXD89J0C0DlAPkY4vwGXaSxEZ4RNVnkDX/qbybloPthCAmV9tF5
	KBXwNGhPIeQR53CT2LoQTiD1/tGykFWZdxQDgtFIZf/vd5wHXec7lhkhyRrirAMbbMpONOBw3g7
	sL0ieorlPsx4tS0xUZVP2UKSQx0EPTvonwSzvEaSpeRJaeb2Dd18NnNhr9usqhXqiqPw==
X-Received: by 2002:a05:600c:8907:b0:488:ab1d:dcc5 with SMTP id 5b1f17b1804b1-488d6ac1bafmr31367345e9.27.1775836522434;
        Fri, 10 Apr 2026 08:55:22 -0700 (PDT)
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
Subject: [PATCH v3 11/12] xen/riscv: add definition of guest RAM banks
Date: Fri, 10 Apr 2026 17:54:57 +0200
Message-ID: <8280fe1a5effacd595d3dd69b2b11e06226411b2.1775836193.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1775836193.git.oleksii.kurochko@gmail.com>
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1775836523-8955341E-457CF58A/10/73395122804
X-purgate-type: spam
X-purgate-size: 3066
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EAAD53D9E3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
---
Changes in v3:
 - Move GUEST_RAM*-related defines to asm/p2m.h instead of public header.
---
Changes in v2:
 - New patch.
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


