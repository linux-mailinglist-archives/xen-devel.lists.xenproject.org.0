Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KwgDPgQimlrGAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:53:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB746112B33
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:53:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225786.1532376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUVA-0007xU-1s; Mon, 09 Feb 2026 16:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225786.1532376; Mon, 09 Feb 2026 16:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUV9-0007tr-Tw; Mon, 09 Feb 2026 16:52:43 +0000
Received: by outflank-mailman (input) for mailman id 1225786;
 Mon, 09 Feb 2026 16:52:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zC3u=AN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vpUV8-0007Zo-Ja
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:52:42 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf2bce51-05d7-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 17:52:41 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-64bea6c5819so6739199a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 08:52:40 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8edacf1564sm415776866b.52.2026.02.09.08.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 08:52:39 -0800 (PST)
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
X-Inumbo-ID: bf2bce51-05d7-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770655960; x=1771260760; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q13SfGkfAmGOcNIHPBnLiB5Lf3crQ10q+6piREbgcus=;
        b=JJQcTvpghBmg+G46LfvQrwDma7uWBK3+q4Pxq/lcG3gVNxaqczJ3VfP6Z8mwWtw37U
         jlAzBJvmk0N6xIFy/qgRO76HtF+xiFpetH49DVA6X6//uxnHVtHA7PmNM5n3j5a7PxoS
         Jx15Ciighbk9yqoibGxJzt74KLqvI2UUtELXIC2vwAMMD71mBOy2Ph3WYEeZZFbC1Jcs
         mZ0skXEeEJi5MZZ7mnwNMHBe8jpU59VGB7yidMtDFh2Fg9FHgJcGw90R9StDPN5acbHv
         BhIxxtUSRCLMYNftWfGc9UcynKPGATb5iZwDU25utib48sLBpkAVHeqLnxQXAzLwRHp2
         fN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770655960; x=1771260760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q13SfGkfAmGOcNIHPBnLiB5Lf3crQ10q+6piREbgcus=;
        b=YCcfCG/2+ml9LKMTfrz1Rl0D53bETmpojrweadFBdx6iUKoxvy/JXruB9+ETzQUMFF
         t0XjuyrTUVez5I3eSKrUIqomIAp4kRmQzZbuxx3PU967UsonzQtHfpR+6tNttoTtfsRd
         hccal0RZWd4c5uZdms6B7mnVJQvIUC7TCOj2bFYR0DRrMz/d7OtJ0lupGqIbZY0ZXZJB
         fxXoRdEx/FZYlaNqg3nhuwhvc7LhJEO5EUuW4z8Zn0YC6rsvev37VwFg90GFbPfQgBlO
         7waksulpb/ybD4rN4tst6jWmmCSs4Z+1ihnAFOGxFxXPrKGhZXMbrxvTvaEdMDII//h5
         JQ6A==
X-Gm-Message-State: AOJu0YyELK+Fho2EmVEZYDUkcIkJ6DP1u7s9LZ+B8G7xgFpHsPy/poUk
	jWeKJNz7TeN7tqpdrXR6//r3LgNWmYIUsWZeGmB2An7djD7FUp8RaCElx7GrjBEp
X-Gm-Gg: AZuq6aKYlC1lZJrp5V2Hlku8T1nOAciE6C9IasOHenLy9DXVIgyWicEMFJqiDftmWd6
	DROh+AnYrDXb374Yt8e7a8c3qo28CorM4RqGJ0Pu9m3NapytWhMWZ/pt5wMcHIDDSDzCekfq46v
	UpKLis1ujJAHvsKNAjQEYGr/Lpd7g2wwawWnYvd9nLooP7enzpqXx60l5/sMNm03XpPLkIPvKEX
	+hO62a4ZZVnweqwLiVf+S/FAv2GcUHh+QkqqEQGnQalivScLMcnmZVtD7pxq+0cRhDwS0bIuTvx
	F+xeKYUDgistdydUBymZlf2NZRAIu5Qm9zR69hVr5BVMW6a+sVnOoYYpJC8kameILHnrzHdE7XK
	lBW5RB/W+cUm3ze4PyYZ9R8aJNnPoUv9vKMu1lXtvyEBUS6YaHX17XP1h4V0Ywd4bUxkm0fNvlj
	Co8HdPaj68toljlbrdSYzN4ZvHUl5FxCDW1PQU0WZE6ZCLKpArYBL6Ug==
X-Received: by 2002:a17:907:3d0c:b0:b8e:a1ae:8054 with SMTP id a640c23a62f3a-b8edf178627mr705971366b.2.1770655959738;
        Mon, 09 Feb 2026 08:52:39 -0800 (PST)
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
Subject: [PATCH v3 02/16] xen/riscv: avoid reading hstateen0 when Smstateen is not implemented
Date: Mon,  9 Feb 2026 17:52:15 +0100
Message-ID: <d26b9103def3ff86524e1306c63cd84e217c8f11.1770650552.git.oleksii.kurochko@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CB746112B33
X-Rspamd-Action: no action

If the Smstateen extension is not implemented, the hstateen0 CSR is
considered non-existent. Any attempt to access it will raise an
illegal-instruction exception.

Guard the hstateen0 dump with a runtime check for Smstateen support to
avoid triggering traps when dumping CSRs on systems that do not
implement this extension.

Fixes: 3babc8d2e546 ("xen/riscv: dump GPRs and CSRs on unexpected traps")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - New patch
---
 xen/arch/riscv/cpufeature.c             | 1 +
 xen/arch/riscv/include/asm/cpufeature.h | 1 +
 xen/arch/riscv/traps.c                  | 8 +++++++-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 02b68aeaa49f..03e27b037be0 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -137,6 +137,7 @@ const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
     RISCV_ISA_EXT_DATA(zbb),
     RISCV_ISA_EXT_DATA(zbs),
     RISCV_ISA_EXT_DATA(smaia),
+    RISCV_ISA_EXT_DATA(smstateen),
     RISCV_ISA_EXT_DATA(ssaia),
     RISCV_ISA_EXT_DATA(svade),
     RISCV_ISA_EXT_DATA(svpbmt),
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
index b69616038888..ef02a3e26d2c 100644
--- a/xen/arch/riscv/include/asm/cpufeature.h
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -36,6 +36,7 @@ enum riscv_isa_ext_id {
     RISCV_ISA_EXT_zbb,
     RISCV_ISA_EXT_zbs,
     RISCV_ISA_EXT_smaia,
+    RISCV_ISA_EXT_smstateen,
     RISCV_ISA_EXT_ssaia,
     RISCV_ISA_EXT_svade,
     RISCV_ISA_EXT_svpbmt,
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 34920f4e5693..c81a4f79a0d2 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -11,6 +11,7 @@
 #include <xen/nospec.h>
 #include <xen/sched.h>
 
+#include <asm/cpufeature.h>
 #include <asm/intc.h>
 #include <asm/processor.h>
 #include <asm/riscv_encoding.h>
@@ -144,7 +145,12 @@ static void dump_csrs(const char *ctx)
       (v & HSTATUS_SPV)  ? " SPV"  : "",
       (v & HSTATUS_GVA)  ? " GVA"  : "");
     X(hgatp, CSR_HGATP, "\n");
-    X(hstateen0, CSR_HSTATEEN0, "\n");
+
+    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
+    {
+        X(hstateen0, CSR_HSTATEEN0, "\n");
+    }
+
     X(stvec, CSR_STVEC, " "); X(vstvec, CSR_VSTVEC, "\n");
     X(sepc, CSR_SEPC, " "); X(vsepc, CSR_VSEPC, "\n");
     X(stval, CSR_STVAL, " "); X(vstval, CSR_VSTVAL, "\n");
-- 
2.52.0


