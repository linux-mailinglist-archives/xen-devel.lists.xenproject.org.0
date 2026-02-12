Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNI0Dwz+jWm0+AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:21:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E819712F508
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:21:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229478.1535469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZRU-0007Ic-Ny; Thu, 12 Feb 2026 16:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229478.1535469; Thu, 12 Feb 2026 16:21:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZRU-0007E5-Il; Thu, 12 Feb 2026 16:21:24 +0000
Received: by outflank-mailman (input) for mailman id 1229478;
 Thu, 12 Feb 2026 16:21:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XV9D=AQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqZRT-0006Fi-Su
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 16:21:23 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de98d959-082e-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 17:21:22 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4834826e555so63095e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 08:21:22 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783e5c635sm13938426f8f.37.2026.02.12.08.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Feb 2026 08:21:21 -0800 (PST)
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
X-Inumbo-ID: de98d959-082e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770913281; x=1771518081; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqkKpGyCtGDJtDlBv21kLuTz5YLX6vjY9zkGw/p3/7Q=;
        b=i25PJeX/McznYKr9yMEgnKbH1u+cqRNWLOkqGkPsceVqbIQgPa4o46zjQSPLWFX43F
         WkpgpYM+vFHzapHp8mRdbNNpSTXWfjs7V/3SFHkiS+67kkFU5tWrVPE1tNO+yc+awaPv
         cCb6kVzz8DvWX+b3fNLaoZ+2H7Ca+fffaD2RVEBgaECgtxwaXmJUzohvN/AQv+cBLLgb
         mwkN3aJOKgAf0k18p07JWRjsNHzGdduqrbJbEgyjDcHT2/xD20AZSBct+rZDiv7EvvDY
         WZuyMWFHsnvcEgPE61A4/tyZm4pgYDWiZ8AhrLVJzWPUo/k7CYT/kHeT2zmmcOegJvKK
         UBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770913281; x=1771518081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iqkKpGyCtGDJtDlBv21kLuTz5YLX6vjY9zkGw/p3/7Q=;
        b=HwLyu9iPaT71gfKRGjUwAfk+qfgzDeO8Tr2MExis3cLHdTbpYV3YfY8q7DgJe5K4JI
         UouN7lDylYRzEdL4y10PWVaUJVFNeacuIJRhcvm9A/wKS6cn91Ox//AcXJZGGRKitUZ2
         PLHYgCYgUohXv5hghautU3eVnFzVbiexBzEYA/nLPvqujSknS/gmf8ANOC+ivUJzsrnI
         VLICQCeYuXWsIfpEOF+TbC3+F12Uc0IS2mNzSMVPOq200d6n4tgnns4gwiEf14MOMILL
         +qihmNAwnPrEUhkVKSoWdKwaZ0uGVnPRiVrHuCxK8bf61auOhHfQEnMmQyixoCH429sT
         zmaQ==
X-Gm-Message-State: AOJu0YzZCqiLjUzpJD2jUOWM3Lbu2kkwJuUVk0/kFTewcLUMzMLFsL2f
	LIKd5FISyAAoduZFaGs8VXSb5f0NR9BamVdBxDp47zbKLlChwL13+sT8F9U48ilw
X-Gm-Gg: AZuq6aJQ8edQSgwM4LJfKb/q/I7SM02W+tadraHigiUoDZMBQThUEXUwmKGEDl+mdiF
	IfXFLaSjgwqLDnO7rWtPNE+pF8U4K0gIkkvD7CU/f8Hdm0xGaEAbzum4VIg41rg5FH9efxAiReU
	R++PoPo5RuWD/h4oPgw+I+LeM1Vy2XAF58nmBJB8j0ySAmokdLYAqJXST4BOMdMKmrGiNhAXpjd
	mq6OtEc7FsqGqHQXjeCSCbUkDsu3eO8iZvPMDOOccc+Dq3gjT78Xkzg1QCXTKr4dNlC/Aau3AW4
	RQNEfM3mpPtqgzFh4mgQuKh3wALkb/RWdUpN950+MOORz3VW7InklmK7o5M6U2MT8cpL8vZsAhY
	A70DDikhaPSHRfJPHbuSJKCZsS8Xi2yzJD0RMUxatvVG1dBrTt1fjvxKVSuHyUXmkjDYAjOPkbz
	EMikPwadcr1nU5QmKg9QezVHRowASoBQwuVG+ig2lLRWbyGlrpbF8exSHY0lb9zrohiw==
X-Received: by 2002:a05:600c:35c9:b0:483:43da:6c87 with SMTP id 5b1f17b1804b1-4836571fd5emr54435805e9.33.1770913281356;
        Thu, 12 Feb 2026 08:21:21 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 5/6] xen: move domain_use_host_layout() to common header
Date: Thu, 12 Feb 2026 17:21:06 +0100
Message-ID: <678eb53c56bc4f6147feb0bbb6c1319197d0f0df.1770821989.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770821989.git.oleksii.kurochko@gmail.com>
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com];
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
X-Rspamd-Queue-Id: E819712F508
X-Rspamd-Action: no action

domain_use_host_layout() is generic enough to be moved to the
common header xen/domain.h.

Wrap domain_use_host_layout() with "#ifndef domain_use_host_layout"
to allow architectures to override it if needed.

No functional change.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/include/asm/domain.h | 14 --------------
 xen/include/xen/domain.h          | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 758ad807e461..1a04fe658c97 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -29,20 +29,6 @@ enum domain_type {
 #define is_64bit_domain(d) (0)
 #endif
 
-/*
- * Is the domain using the host memory layout?
- *
- * Direct-mapped domain will always have the RAM mapped with GFN == MFN.
- * To avoid any trouble finding space, it is easier to force using the
- * host memory layout.
- *
- * The hardware domain will use the host layout regardless of
- * direct-mapped because some OS may rely on a specific address ranges
- * for the devices.
- */
-#define domain_use_host_layout(d) (is_domain_direct_mapped(d) || \
-                                   is_hardware_domain(d))
-
 struct vtimer {
     struct vcpu *v;
     int irq;
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 93c0fd00c1d7..40487825ad91 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -62,6 +62,22 @@ void domid_free(domid_t domid);
 #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
 #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
 
+/*
+ * Is the domain using the host memory layout?
+ *
+ * Direct-mapped domain will always have the RAM mapped with GFN == MFN.
+ * To avoid any trouble finding space, it is easier to force using the
+ * host memory layout.
+ *
+ * The hardware domain will use the host layout regardless of
+ * direct-mapped because some OS may rely on a specific address ranges
+ * for the devices.
+ */
+#ifndef domain_use_host_layout
+# define domain_use_host_layout(d) (is_domain_direct_mapped(d) || \
+                                    is_hardware_domain(d))
+#endif
+
 /*
  * Arch-specifics.
  */
-- 
2.52.0


