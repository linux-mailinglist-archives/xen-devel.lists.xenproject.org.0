Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPPyJXAd2WnVmQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:55:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD8A3D9E18
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:55:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279420.1563886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBECV-000842-KP; Fri, 10 Apr 2026 15:55:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279420.1563886; Fri, 10 Apr 2026 15:55:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBECV-00080C-Dr; Fri, 10 Apr 2026 15:55:19 +0000
Received: by outflank-mailman (input) for mailman id 1279420;
 Fri, 10 Apr 2026 15:55:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wBECU-0007kD-06
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 15:55:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBECT-00DRfX-CL
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 17:55:17 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d91d5e-5cb7-0a2a0a5109dd-0a2a450183fa-12
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:55:17 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d91d65-6fc9-0a2a45010019-d1558029c9ce-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:55:17 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so15800415e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 08:55:17 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5b3c597sm78285605e9.12.2026.04.10.08.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 08:55:16 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775836517; x=1776441317; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jesQc90kE0KVLHrdzzOKKDZHPJckxKYzRoNevvlkGgU=;
        b=mayyM5qlzM//SwrYlQ1Kzb40LKMWwYnfzPJERr22dj6S5bwEdYdASQ6LDwfoZURrW2
         vTqI395p6uEMTwrhf9Ix31V1H/c5BtWFxU48lyekTQJvHJPBY3Skae2T1NQ0fnE0EtvH
         lMR/tRUWAnvc6KKRgneOH4XsDdEwFJCjzXnElsqeMdj6+wzX0PR+3DtpGkyI04HXrBNN
         76c00vtHn2AEzY8Vr8ucr5Sm8h797Zzwl9sPKpiloan38CfyQaIDnsDzK7FB6F+CPdDn
         JlzaatcHSOLFLScbCzkQf++elg2pvocNxPGoS1PDKCKo8138h3zVOziL49ArD9HDhczY
         hVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836517; x=1776441317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jesQc90kE0KVLHrdzzOKKDZHPJckxKYzRoNevvlkGgU=;
        b=A0GbsWhKoPYabwdRP2Ii25zn8TCaiC/Wf/teB7phvYfCQ4OUOTm6KDsLHrIWMDOuqO
         QkX7SmWDCJ6DmMWn6yYm1r5mXhhF95F8abJOwb8VavanljNqKE/fLZNDvrbMRslLzLm1
         2tYOGBRMJJCTOcOalD3B1Xpe8PWIUWLs5csSbVMk6lGUtFLBpY6TUo8HaZSq6mLmUlqq
         Y7HSlZPE2t3GPyuKXXgyUpY50C63tWL9N4VomaT3cwFl6dlrEIqp3Qm59h67cdOxwhab
         iTmepCg92hRbg8h1C9ELySuJWdmRXejIxikRR0jiBFkvpwGw+ZRMmuwstjOBQc5YoIcF
         7pyQ==
X-Gm-Message-State: AOJu0YyCuACEDO/dyFxuQJSE1c+9nHV4qyWdoGrsJ/Fo/IVxl0vhQKmq
	3MuDa8KSFmbjGYrpyRutK/0ID4yL4ko+qA1DydCyFsWcvWIY9G1ymGG4Wxezbg==
X-Gm-Gg: AeBDieu7HkCf+U9rebNZMpt1/OD0ZWhvMUIieFw9TVPJOxauV2Fd89lKAB5P7wscZ4p
	6vPFsQF40NIHkSZt8GD6GczvB6bICLldlMAUq1vVbrHu0m4mf8ly/5ydgC1y3KCuZvSN4kWqJIQ
	lxx5g/LhN1cv7utAhd5toABEX0dJ0Ggf47ubkTBmR8qQNp61HIaBrTWbVN4OXUqBMGLNrDqTbnv
	DdKgitEopNIXEiy1MMi0iBVLTPjZu53YDbMwVx+TlNOnOYwyKefbZ1qXqHvjZppSZmzleEVcGQC
	riyIRZfF+L4B+uakCGgBgWQVnX0FWiw9DnnOjDWqXlRjwYnhIvc5J9GEOy6TiY3uKdZaxEPaYaz
	Y6YkTbPMOY3OdqpX9PbxKFhg5umnA3OTjOcZYceUMsOkRNLYokE7SJFSf3BKCkHwWflC6jDHPHF
	XRApIv9ohoIOxv4jUb4Ejorq4H50gr0hAc0lTDkGZ2oWf38qxBlxMgfUiitOZY2mxSKw==
X-Received: by 2002:a05:600c:a105:b0:486:af22:4a2a with SMTP id 5b1f17b1804b1-488d681f281mr33975715e9.7.1775836516480;
        Fri, 10 Apr 2026 08:55:16 -0700 (PDT)
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
Subject: [PATCH v3 06/12] xen: move declaration of fw_unreserved_regions() to common header
Date: Fri, 10 Apr 2026 17:54:52 +0200
Message-ID: <fda4e7d9cdb8eb197d7e61c100ca4f7d1aac7b2c.1775836193.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1775836193.git.oleksii.kurochko@gmail.com>
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1775836517-B4967185-119067A8/10/73395122804
X-purgate-type: spam
X-purgate-size: 1452
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8DD8A3D9E18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since the implementation of fw_unreserved_regions() is in common code, move
its declaration to xen/bootinfo.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2-v3:
 - Nothing changed. Only rebase.
---
 xen/arch/arm/include/asm/setup.h | 3 ---
 xen/include/xen/bootinfo.h       | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 899e33925ca4..0d29b46ea52b 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -43,9 +43,6 @@ int acpi_make_efi_nodes(void *fdt, struct membank tbl_add[]);
 void create_dom0(void);
 
 void discard_initial_modules(void);
-void fw_unreserved_regions(paddr_t s, paddr_t e,
-                           void (*cb)(paddr_t ps, paddr_t pe),
-                           unsigned int first);
 
 void init_pdx(void);
 void setup_mm(void);
diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
index f834f1957155..dbf492c2e36e 100644
--- a/xen/include/xen/bootinfo.h
+++ b/xen/include/xen/bootinfo.h
@@ -210,4 +210,8 @@ static inline struct membanks *membanks_xzalloc(unsigned int nr,
     return banks;
 }
 
+void fw_unreserved_regions(paddr_t s, paddr_t e,
+                           void (*cb)(paddr_t ps, paddr_t pe),
+                           unsigned int first);
+
 #endif /* XEN_BOOTINFO_H */
-- 
2.53.0


