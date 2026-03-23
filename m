Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oF06CfxqwWnVSwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 17:31:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3432F841D
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 17:31:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259494.1552828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4iBv-0000Z8-3Q; Mon, 23 Mar 2026 16:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259494.1552828; Mon, 23 Mar 2026 16:31:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4iBu-0000Ve-Vx; Mon, 23 Mar 2026 16:31:46 +0000
Received: by outflank-mailman (input) for mailman id 1259494;
 Mon, 23 Mar 2026 16:31:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <oleksii.kurochko@gmail.com>) id 1w4iBt-0000Td-El
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 16:31:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4iBs-00BTb0-Qe
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 17:31:44 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69c16ac4-bab6-0a2a0a5309dd-0a2a45059858-42
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 17:31:44 +0100
Received: from [209.85.218.54] (helo=mail-ej1-f54.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69c16af0-5aeb-0a2a45050019-d155da36c08c-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 17:31:44 +0100
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b9795ca4e6dso669455066b.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 09:31:44 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f8be14sm536248166b.17.2026.03.23.09.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 09:31:40 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20230601 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774283504; x=1774888304; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOnbwZsaenaHLGEXyic0HWfKV8qdUJlJbBSFmXoP4Sk=;
        b=m+H6ifplzBgQ9/H0Ieq0R+G82U3LC+h1SOZDVVeqfKMOuEudZEIbq/9YJNfivAljHd
         9WVEsMH759Q4VsR9yd32OmU53IYno8vdJQcCfUTpaqlzaa1VEe0afW5v6FNpYOij2AuH
         4RbiIyhwGHRoyd/H+Yd4h0CPq+DsJgfxt/DiRXJBJvqlP9OvwqJIaOjdHqmxEX5brk1o
         K2OsnuoFVWEsxAnjuj/+WiOid9EDBAUTq7lWtHkZqNJ6V3L/TgqHSab/YX2hqaHaiWDT
         VU61K1JCnE6bV7kozvs7I+5CK0ithGuTvnCamukugUlMmDZUJw/AYucTaTLaJq5LzUWA
         K+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283504; x=1774888304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EOnbwZsaenaHLGEXyic0HWfKV8qdUJlJbBSFmXoP4Sk=;
        b=E7/W4bD790XCCGwdv4fS6Kc/XJiQCM4px0Tbb6BtCrnbnRS7C2MzCQZhN91fHK7UHX
         yri7mWdaRUNUcXL1Go6B6luTe2FIbFvbJaU+dEpqeJ2TXkRpqlWvz41tjXsGcoUUSMJi
         WiHxx/jp/Ka0PnuhAncxqsoyezlz3p7ci4C5//yaA+dHLeXmoYWjJoyqoSgPJHg6Sf2O
         WCP3cRpIoRLrIH7mtOVhB+QObbyRNmV6FpMmzLAjGIuOZIPiy89bLiwEXkoplmr6xuZ7
         eZLqUus1YDpuXJ1HbxD0Ai4QsldsFhWk0vbxxYRnOrVehY5qHSMwQI7Ds6Y0/7TYD5nH
         UF8A==
X-Gm-Message-State: AOJu0Yw0ZIMStjDucVlkiSuIYFw44BUe4tZ6D9h6Q6bso/6JYgFNdHyp
	3U3QduD+vRYxg43hEhtSgScheuczF3/e2gl4SXLFKq4dpVXGeM2i0RKq4BbIiQ==
X-Gm-Gg: ATEYQzzu2pc7VZPiruoKh6o58XyOImvJZYP4ewWB5w8uvOHXbaZmmTpy61P/xd6mpUL
	JNNEHaLdPqow2oF4IYglxmOIyaxWwnMf6BueGeSfFWI6QjK7xCn3V1m1CFXiO98AVmNCT49Ix37
	YQX300Kq4mPia/4jzAbn7nuIjG9bp2N9uygRf5UAj60RetlWBebsfFVOpqO6K39vuo0ntJHUNvU
	tMusQwfpYb6A6qmL86M6amhO55kID/ErNNwkIIr4+9D4FnuSZev6wjw8u7cl4+maar+VWAqjwit
	Mt8UuRNTD8OGvnaD2lPJ06L1ZCrUuwm/ROvTs+kHGkYYUi7nD2cpnpp/l9MKRNOdXElXvlQA3xN
	dtb0nf+p7ooBeRcZHXvt1m51v/7ceKj7/MQaRKYKdGUJaBY0XLiwbNwaN1APFKUn4HyRuoXM6Hy
	hcneqbXZPhcuky3DyafR/sLUSPddAgf+M9PpPleJkWp1qNlEOJeoATfJ8ltEn43ZSDTw==
X-Received: by 2002:a17:906:e07:b0:b96:e0b1:ccf4 with SMTP id a640c23a62f3a-b982f3976bbmr717098966b.47.1774283503806;
        Mon, 23 Mar 2026 09:31:43 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 10/11] xen/riscv: add definition of guest RAM banks
Date: Mon, 23 Mar 2026 17:29:51 +0100
Message-ID: <8278256f3d270b456d19cb9891b89b88a46548a5.1774281309.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774281309.git.oleksii.kurochko@gmail.com>
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1774283504-82F45488-BC60FBE2/0/0
X-purgate-type: clean
X-purgate-size: 2333
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BD3432F841D
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

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
 xen/include/public/arch-riscv.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/xen/include/public/arch-riscv.h b/xen/include/public/arch-riscv.h
index 360d8e6871ba..f14ff4c2d14e 100644
--- a/xen/include/public/arch-riscv.h
+++ b/xen/include/public/arch-riscv.h
@@ -50,6 +50,22 @@ typedef uint64_t xen_ulong_t;
 
 #if defined(__XEN__) || defined(__XEN_TOOLS__)
 
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
+#define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
+#define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
+
 struct vcpu_guest_context {
 };
 typedef struct vcpu_guest_context vcpu_guest_context_t;
-- 
2.53.0


