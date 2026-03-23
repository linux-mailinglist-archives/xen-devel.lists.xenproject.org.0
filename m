Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHlGItxqwWnVSwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 17:31:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C082F83D9
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 17:31:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259467.1552791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4iBS-0007By-10; Mon, 23 Mar 2026 16:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259467.1552791; Mon, 23 Mar 2026 16:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4iBR-0007AF-Tj; Mon, 23 Mar 2026 16:31:17 +0000
Received: by outflank-mailman (input) for mailman id 1259467;
 Mon, 23 Mar 2026 16:31:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n/J7=BX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w4iBP-0005Bu-RA
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 16:31:15 +0000
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b57c5884-26d5-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Mar 2026 17:31:14 +0100 (CET)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-668d70fabc4so918967a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 09:31:14 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f8be14sm536248166b.17.2026.03.23.09.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 09:31:04 -0700 (PDT)
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
X-Inumbo-ID: b57c5884-26d5-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774283473; x=1774888273; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2oiQiadx4Uzkzg4GkPGtpylDejjc26OKeIIBZzzhoMQ=;
        b=iu1ZTKd4IwRKr6sJvb1TgmxMfWaUCVfkeMp06T8bKnSxnhDGRCRZRW/xjvpFpcoSAe
         NSqzuNBYAmZIdlZiQAioZAxrX2JcaAxoiYUBsPHyhAEI42XtESnb4hkyUvMe+8y5qdLE
         5LHOLlOJIzxwv8e2Y1/164ZU0EtjNc/6oc83DdoBW4VPiyZnWmxOSFCaoB8/OAaJXb0s
         XdVDuOSrHfuFgiwOita+uf++aHy7scBWYV/doaZ5lY5KiMORTpA1Na2XIqFnG8P28FGG
         jvA9pRECVRjVXjdxwarBDexov0qW3QJ5EWDWQmUPuWgEDNcvcuCGvvL+pVESLisnV5H+
         F9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283473; x=1774888273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2oiQiadx4Uzkzg4GkPGtpylDejjc26OKeIIBZzzhoMQ=;
        b=O4HyYlQbRKk129hAkjmwVYC7waWCZqPMmjsdI+fpSAnjDsBPKVBZokVZwlbVwInEgG
         3HMRebc+PApk7AleDq9eUQp10i/eS6uJcUT7lDDjYPXaZlakmCcrx1TnduAP1fs7ILDK
         /x8kTb3HjKSzQeWjn7TdiZaye7JHndQuALyvo8RVWR6j8N3D4dl4K+k+v7GgzoBebqAQ
         RvvEWmlJb3+PqDbLDWlKXO6g2sYc3RKIrtNZnfFXZFJf5FJ0GL0xEJ8Pz0HzEhDaSS2l
         F709u0hh4rCqDuupj76utxCFZ9GYb98ktDeLJ4QcJQHjfeng0MIghc/L/KzbTgApzKwZ
         mbUw==
X-Gm-Message-State: AOJu0YyV6D54uv/gZtqUZEh2qxpkXtjeCJRaN8pV063jwN2rg/BW1APK
	HZd5rkis+Jb/uwKBbFMjVoT+xuYrrWENzqBXlZ+GUDHco4wKERzP+K0bzPbgSA==
X-Gm-Gg: ATEYQzwLDv20xdNRRs9c5os/b2ALJRI/eXBfKkWvOrPhkvEjawrtnRf08Je4Aj1Cp8f
	wlCanmxIinccMSkZFpIaGUf7TriBhGIIwOQXl8MMrUZFyoAveUEZAMCvvZvMBh4uhRRRFoPwLzG
	MCSZVKPbWnFVSTUxLe4y74rvXpT8/w8J1H8qHOBkGIAHRV2VNXHOfN5X0hSmTd2NndTcdCmW5rF
	ZlsoX4FOq/2Gk7yMCIZInbUyKsMkqZReijY0BMl27jyoVbGddunOtHAKkY+mlYyEVkMNVc10GUQ
	TmeIdwidnoySxdcXuG9tOef8A96qxhk0+2PkafCVsuKqhun+kF04KNfU5m7WqfNx/UqYSt3mf5p
	Tr8xO7O9VB0U54YgGx/OBKg8OqiPHwNZHx0gjAQ16qZg6RS2SOCMH25xiJNnsChoS7dcRkJwTJe
	HVTIGmhjitFOPp5K/iCzu8ReOlCi3n2DtYjrqJAn7xYMQw1grrpxnu5K++4BNbgwsKpw==
X-Received: by 2002:a17:907:7ba2:b0:b98:4156:8787 with SMTP id a640c23a62f3a-b9841568882mr783750666b.49.1774283473196;
        Mon, 23 Mar 2026 09:31:13 -0700 (PDT)
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
Subject: [PATCH v2 06/11] xen: move declaration of fw_unreserved_regions() to common header
Date: Mon, 23 Mar 2026 17:29:47 +0100
Message-ID: <7e6cb7450372f17b00c1fd360ef1ef239a825c9e.1774281309.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774281309.git.oleksii.kurochko@gmail.com>
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 72C082F83D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since the implementation of fw_unreserved_regions() is in common code, move
its declaration to xen/bootinfo.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
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


