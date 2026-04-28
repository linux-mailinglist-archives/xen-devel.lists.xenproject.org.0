Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIOjBWzF8GloYQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:34:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3A34870BF
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:34:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296333.1572786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjVd-0006Gn-RV; Tue, 28 Apr 2026 14:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296333.1572786; Tue, 28 Apr 2026 14:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjVd-0006Bs-Ls; Tue, 28 Apr 2026 14:33:57 +0000
Received: by outflank-mailman (input) for mailman id 1296333;
 Tue, 28 Apr 2026 14:33:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wHjVc-00062i-NF
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 14:33:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHjVc-008e9B-3B
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 16:33:56 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69f0c540-e002-0a2a0a5209dd-0a2a4503cd3a-32
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:33:56 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69f0c553-672d-0a2a45030019-d155802fe05a-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:33:56 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so196654425e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 07:33:56 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a774b6300sm19302145e9.16.2026.04.28.07.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 07:33:54 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1777386835; x=1777991635; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWmwHX2hyXMUT5t3JOczqjWzu0Tj+8NV1iDRnEin18E=;
        b=GAvp8BV4rpJIMW8uFSCIcbBHCkIP181mmOj1vfpaCNUETOTjab9daycXe232LaQ+2X
         vYNfuKDx0ksQjqzWrnNXle5qiV1+BYPxsrj1UA95arrQPITZfABEZqpwRJ0CFoBUH1Zx
         QLV2kg3wjRN99rLzMsXQbugeOwoOjn4c4s772jW+U4wGt/rLcrwTtF8XB7QqCAfxX1S/
         5V4t39/aDRkvZPtvjhdqsWKTubl9LpQLrUUV6hv77PoVF/jvv8p0OfqxiawP1KNUNF59
         UpUiAik63lt+T3N/DANobRcxcm5rk64NqaurYHs0ZClls6GvQKfL11E+TLPlAKmAavkp
         c3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386835; x=1777991635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iWmwHX2hyXMUT5t3JOczqjWzu0Tj+8NV1iDRnEin18E=;
        b=Fl+hTJO2r/N0lIk235iqwUdGLLjuxQ6vU2jdqPTqBut7Siod3L5f0Ekx8CrZF1QqhV
         3nhKft9MroBJJpMxLq2hZLzBWU2KD61+GDvojBT6INmamC0rqeD0/l0m2w7FpznMaXpK
         FhiBZ2uC6QbiaINoSSOF1YNICRKipZHq2GReFmdFhPR7Dn7JRu6TBe2ScUQPQFBFgiIV
         k6HnnJOarjSAUC2zhmKjYOVK40YPQdHFNToOs15VGA02af35zeGTJkyrjUPEGt27JBzi
         vgeHCMT7QzCvTalP6eMs7w2s+THhLNE15O6r0w2cic13gEbbpX4FdPO51etT6575lKgB
         Jqxg==
X-Gm-Message-State: AOJu0YwetycEwz0qpUHtkAyP/5G5i8JQ4aB9dt1KSAS5eTUMtQ1uKtT4
	iWejCPEyZyb0xEV6ERe2IrZVCyZZ76qyFu2oaw3AwK5a/wr7cr6qvu4g9sIkow==
X-Gm-Gg: AeBDieuZrhpPrmyM5mdEBiy5MqZIUsosM5jbgxIfMQebP4/0BO1TtrBS/2NEcIczOwA
	LJW8YVLGoL6efRWjNGWwKFL2RXIgIhPzohQkPBpUgbkiMl/4rsESbTfn9fiLTU32VAx7ppx5biI
	0lYGTLvCnboudG/cMT4KwH6UeJa1K2Ouqxycu8/mDegVDtvuv5jcAvMvit9sgHaE22r+Oady15K
	BG9NIWFL29dBImJrXt9TLe03PDjePlofhswyx/8l1AtMkUpN5Jf5yF40wghkbIlZ/c9VJFaegKI
	tDVTuUj95YiKG48mNHZ0eD1UsUJt5PhqHUFi9ZeS3PNrOgRE5y+jRucL/1K3FJzxreOstmA9pdo
	RMyoX08x54L81VeHIkK3qzS7p3h6t/vIlKa6BdjIFvuDd3ZK0XYhJxlZPiiBWx/Xt2OAN3/Fhfb
	IkxYAi3lRR++FICw9wmKcoQTcMwlIyeNbDdqBvS+Jhs6V/vh5gc7dEgVmbRu6dRSjvpWHIWUJS8
	geA
X-Received: by 2002:a05:600c:1d0a:b0:488:f453:b976 with SMTP id 5b1f17b1804b1-48a77b2051fmr57589655e9.27.1777386835182;
        Tue, 28 Apr 2026 07:33:55 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 05/11] xen: rename p2m_ipa_bits to p2m_gpa_bits
Date: Tue, 28 Apr 2026 16:33:34 +0200
Message-ID: <fcf48e61d270fd4665f14f43095b3659e528b376.1777303844.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777303844.git.oleksii.kurochko@gmail.com>
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1777386836-2957F938-F463B9D7/10/73395122804
X-purgate-type: spam
X-purgate-size: 1769
X-Rspamd-Queue-Id: CB3A34870BF
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,suse.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.209];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

The IPA terminology is Arm-specific, so rename p2m_ipa_bits to
p2m_gpa_bits to use architecture-neutral naming in
xen/common/device-tree/ code.

No functional changes.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - Nothing changed only rebase.
---
Changes in v3:
 - Introduce #define p2m_gpa_bits p2m_ipa_bits for Arm instead of
   renaming of p2m_ipa_bits to p2m_gpa_bits to keep Arm part of
   changes clearer and keep using Arm-specific terminolgy inside
   Arm code.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/arm/include/asm/p2m.h        | 2 ++
 xen/common/device-tree/domain-build.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 010ce8c9ebbd..7957dbd96e57 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -14,6 +14,8 @@
 /* Holds the bit size of IPAs in p2m tables.  */
 extern unsigned int p2m_ipa_bits;
 
+#define p2m_gpa_bits p2m_ipa_bits
+
 #define MAX_VMID_8_BIT  (1UL << 8)
 #define MAX_VMID_16_BIT (1UL << 16)
 
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index 6949203dacdc..2a760b007b57 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -221,7 +221,7 @@ int __init find_unallocated_memory(const struct kernel_info *kinfo,
     }
 
     start = 0;
-    end = (1ULL << p2m_ipa_bits) - 1;
+    end = (1ULL << p2m_gpa_bits) - 1;
     res = rangeset_report_ranges(unalloc_mem, PFN_DOWN(start), PFN_DOWN(end),
                                  cb, free_regions);
     if ( res )
-- 
2.53.0


