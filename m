Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0G8oLsb2/WlilQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0F74F7FE8
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303793.1577154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMR4-0002Xs-F2; Fri, 08 May 2026 14:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303793.1577154; Fri, 08 May 2026 14:44:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMR3-0002CY-0b; Fri, 08 May 2026 14:44:13 +0000
Received: by outflank-mailman (input) for mailman id 1303793;
 Fri, 08 May 2026 14:44:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLMQx-0001ON-PM
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:44:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMQx-005krU-5P
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:44:07 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6b7-bab6-0a2a0a5309dd-0a2a4507e0c2-0
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:44:07 +0200
Received: from [209.85.218.47] (helo=mail-ej1-f47.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6b7-229c-0a2a45070019-d155da2fbd41-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:44:07 +0200
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-bc1f0f48351so335363166b.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:44:07 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac4942068sm90736166b.62.2026.05.08.07.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 07:44:05 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778251446; x=1778856246; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+FxagSDdgrsLo5AXSdCU3JK7SOuU6ZhFjOmJK7bJpIQ=;
        b=Atxru7vTqxSEynVdkYkJYvhIcriXjIBzStCSnxcuF0gvfnJKoc8YNxufbr9ad4VZum
         6YIvNiXlVfFxpYnsEZXP5LL9vb++BzKRf1nDNMsczXqwyMxkUmBU0bfr8WexYtq+JMy5
         PwYXWOfKJnnWEYpAKczCk9snAIwCiVIlS0wvkSMg9NxeONaJncYNWmWdMB1vYzQyCRYf
         ilouPAuX7b+/nZ44QoCXhH7xnhaK1RnGdOfrgs3K3WQLfceOUQ5rkaRZUYq74uCZ/dWf
         nTGxvt3irAQcufQjacuEXbcN8amXXVqTtta76OMlU9JeMMw8sS3Xqd8JbunUj0ZCC7Ut
         KfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251446; x=1778856246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+FxagSDdgrsLo5AXSdCU3JK7SOuU6ZhFjOmJK7bJpIQ=;
        b=AsWiLvD0MOYnLHbL7g3cMeicxila+XZ7yUZHWXeSIC2SgNJi88epo14CNFVkLPdFV0
         uDcXVjP+xZKMY3Lw5SQdYKeyStw18BhSU7lgox9ZLGf5MZHUFWDZ1Nk4YolfRwrQGdME
         E9ygYSbTmSsymnIc1cSK+JVIhHdHjQV/1ZI8vSI6lYhj0+A5SGSqZf6yODbTzsfpsFWD
         2NDfU9eVKBAdTmoRfBt/CxoyG3Y5isQLZQqXzzObHL3Oa15WzeSt82pJqOOaCupCznOZ
         xwdbB6HMOeGZhnvZNTDYetT8VJtlUO1FJjc9EFqTzLU4HH7tNlL4NTLZnReyuoLBfV8/
         F4Xg==
X-Gm-Message-State: AOJu0YzyixuTw/OFIEt+PM8WJ8MR69MuphtEfrZjGe/z4Fm6lPryMH8R
	rHv8IlN080NLw+8szz/JQIXfNQOLA9v4IzqQfFh2qJHmtJ8C/6lInBDbIACvaw==
X-Gm-Gg: Acq92OE8tHbzAhNnl+WqMbO0HyrVm5n2NFNXYkS8mQnJ9BUOEXpXhjuv9XI59sr+sK0
	MJCZ5n5agbRR9GnSE9MDYRUl75qboOwuaeIEWXq4mm74jj+lVHLXk5jaBlHb8A0caalZJwrGSC6
	is7yQ5etGsHZuLyYyAltxfNDS6Ak0AfrqIaGtE8MIonTX25fQg1BjQlhLFo56Lpj1ifC7BqEQBH
	y+1H2+/52TA/AoY8jRA+znKCBJYKTNsEAOtySoMMJh7JxNqI+Uf7tM+fAzFyU5y8K9L5TRWXr5D
	/RbUVEHzZwTbiqbxW6Eo8FfRmO5A541d6orp4qCp8sZd++ZJWbaezdcYNsj101XVV0Lyu9zYa5j
	RSbetNUQZfe04j8pbZBP+UWoZ0vGJOlJq7qGFAQV2rdq621Gdd/AcwlQtEzIwM2n3N9HtRcmmFp
	GMTENGnFwYT3mF+K2PlS7HnA/i2SJt8QI/ztQJZtMbT5ohciPzilOUSIBxajuNVyykyQ==
X-Received: by 2002:a17:907:709:b0:bb7:beb9:b6d5 with SMTP id a640c23a62f3a-bc56da16349mr853129766b.39.1778251446224;
        Fri, 08 May 2026 07:44:06 -0700 (PDT)
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
Subject: [PATCH v2 20/26] xen/riscv: add missing APLIC register offsets, masks to asm/aplic.h.
Date: Fri,  8 May 2026 16:43:22 +0200
Message-ID: <736349477470f316da7020c4c1c7e92e37470d31.1778250616.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778250616.git.oleksii.kurochko@gmail.com>
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1778251447-28678C48-FCBD3EF2/10/73395122804
X-purgate-type: spam
X-purgate-size: 2205
X-Rspamd-Queue-Id: 4F0F74F7FE8
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,microchip.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

These definitions are required for correct decoding of APLIC MMIO
accesses and target configuration, and will be used by both the
physical and virtual APLIC implementations.

No functional change is intended by this patch; it only centralises
hardware definitions that were previously missing.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/aplic.h | 35 ++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index b42b159496b8..e418fc53433b 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -15,6 +15,11 @@
 
 #include <asm/imsic.h>
 
+#define APLIC_REG_OFFSET_MASK   0x3fff
+#define APLIC_TARGET_IPRIO_MASK 0xff
+#define APLIC_TARGET_GUEST_IDX_SHIFT 12
+#define APLIC_TARGET_EIID_MASK  0x7ff
+
 #define APLIC_DOMAINCFG_RO80    (0x80U << 24)
 #define APLIC_DOMAINCFG_IE      BIT(8, U)
 #define APLIC_DOMAINCFG_DM      BIT(2, U)
@@ -26,6 +31,36 @@
 #define APLIC_SOURCECFG_SM_LEVEL_HIGH   0x6
 #define APLIC_SOURCECFG_SM_LEVEL_LOW    0x7
 
+#define APLIC_DOMAINCFG         0x0000
+#define APLIC_SOURCECFG_BASE    0x0004
+#define APLIC_SOURCECFG_LAST    0x0ffc
+
+#define APLIC_SMSICFGADDR       0x1bc8
+#define APLIC_SMSICFGADDRH      0x1bcc
+
+#define APLIC_SETIP_BASE        0x1c00
+#define APLIC_SETIP_LAST        0x1c7c
+#define APLIC_SETIPNUM          0x1cdc
+
+#define APLIC_CLRIP_BASE        0x1d00
+#define APLIC_CLRIP_LAST        0x1d7c
+#define APLIC_CLRIPNUM          0x1ddc
+
+#define APLIC_SETIE_BASE        0x1e00
+#define APLIC_SETIE_LAST        0x1e7c
+#define APLIC_SETIENUM          0x1edc
+
+#define APLIC_CLRIE_BASE        0x1f00
+#define APLIC_CLRIE_LAST        0x1f7c
+#define APLIC_CLRIENUM          0x1fdc
+
+#define APLIC_SETIPNUM_LE       0x2000
+
+#define APLIC_GENMSI            0x3000
+
+#define APLIC_TARGET_BASE       0x3004
+#define APLIC_TARGET_LAST       0x3ffc
+
 #define APLIC_TARGET_HART_IDX_SHIFT 18
 
 #define APLIC_IDC_SIZE          32
-- 
2.54.0


