Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULbCIl5JzmlQmgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:47:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EE8387DC3
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:47:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271535.1559720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8FaO-0006RJ-Ri; Thu, 02 Apr 2026 10:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271535.1559720; Thu, 02 Apr 2026 10:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8FaO-0006M9-Ci; Thu, 02 Apr 2026 10:47:40 +0000
Received: by outflank-mailman (input) for mailman id 1271535;
 Thu, 02 Apr 2026 10:47:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w8FaM-00064W-Hd
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 10:47:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8FaL-00Ej0u-T9
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 12:47:37 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ce4947-2eae-0a2a0a5409dd-0a2a4505b638-10
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:47:37 +0200
Received: from [209.85.218.51] (helo=mail-ej1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ce4949-3760-0a2a45050019-d155da33c8ee-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:47:37 +0200
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b97e6e48b24so109055566b.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 03:47:37 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9c3d028955sm76392366b.61.2026.04.02.03.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2026 03:47:35 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775126857; x=1775731657; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wn2YE/N1073l2aBvkRQ/5nSVLZsSRqqVHeilL+wTO7s=;
        b=i476hIDYFm4HFhwljw3XbCq42pjM+Ftx25bW+E5ROSF0ZOBHy5bckqYeb9vMLbe5Mq
         E2xZoYvjukoeowBDIWrlL3enDj5XHGcUwxnWH3Psvg3B4MWZUHybgUrNWVC//xWUg/u4
         O8waZZ1Jl6JzxQMAJiikWW7I7Pjfz2iHJOwi43c2Ful9L2DJhZLhEQl1PSqWEgtoC9KI
         REEHmSd7O0b5Xi1VVvH1pnn3JkNP1fSB4bmAb8bche0tCosJIy1DgLKrBQz9kDLLzHXA
         A6cSWnArndeqoUAfh3CKVpMiPewpufAqiKfNZ+tYC9S4PqI//d42Hela85Jols7f7rR7
         +mBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775126857; x=1775731657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wn2YE/N1073l2aBvkRQ/5nSVLZsSRqqVHeilL+wTO7s=;
        b=kbrlyWWDW3NVU5PQTeutWPAwx9pM+QX1ZflYsPnI0CT2s8DU2go050bUK8sckq2TDB
         OuGQKkzRKX35dBFwY9I4l1lKb5OksSaVmSB6jGsmhEi63N8/ddozVb5+Co14O4IEmTF+
         p9g/coRPWqBGHFy53FM0JILVDsr+LoDAcLiAgQS2TaiBK6zTPlVvah388Gj9SEq1CQ+C
         cixCw0Ejbrr0SzZPeM3emJ3f+d4+HrwhWifo0IqpE9gCZWT1bLQ096AqCzzHTCW2wTV5
         WBn9F4h2TE0RTDnVcftt8dVEIgsx4pw0x9AiaErKG8hwDWzPxvAWnSedpMLZhb8WScFH
         fnew==
X-Gm-Message-State: AOJu0YwAmA+uoZy8ssgWoPlOSrewkOb9JGcd/JMVp9bd+F7hRe8Ue9bE
	WpROyS3tgTtU2fUot4egjnZixRv65rNwOcCr+K+4IjvxXc3cLmsuok/wWiiWR4Si
X-Gm-Gg: ATEYQzzHkIkMKvnF/cyPy/hY/HlxnjnmqFi1tSjOQqHSyKbsBqGRla9QAOCmtbzYaKC
	8bd82D26v0zR8Q5dhEbfLU+GP6JoBcVdjsNEvL33P1ABfX+U2tUW5xbS4kq5guXZaWLOtKgHccU
	L1BRzPuwSSd+qiJrPyHY2deRfsWc+1eb0dmkwDtyCL2p4TOXn+yNSBKkGxffCSq9URxAJhcsoMK
	o625QSAkrh3tZ0YQmiIpjEc2rp9NyG5Ua9WB3695v9E5m0eQu5gG38g2YWSTBEhxUajgB2wpa8E
	GmeIID5aa0U+pas56tVqgBeiFcceAAsPdP5zpjCYz9AxywKR/6X50UBocfsNM+uSvEw7r7AVd5m
	vTiqH2wGmVLEaTSFZ5LOKYPTNdADZiYfppM8Rd99dEpRLAMQmRZp+KWJA3Z5r18ueglkd0D07yP
	z/6O6hRDHWbqRhS8sGdJPOSyPrLakFzLY07Vjb
X-Received: by 2002:a17:907:86a5:b0:b98:6984:6630 with SMTP id a640c23a62f3a-b9c137b3ccdmr462677366b.8.1775126856213;
        Thu, 02 Apr 2026 03:47:36 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v8 10/13] xen/arm: Resume memory management on Xen resume
Date: Thu,  2 Apr 2026 13:45:11 +0300
Message-ID: <02b55a02f329d09c9f8b15d97ca9176b3c33017a.1775125380.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775125380.git.mykola_kvach@epam.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1775126857-3959396F-ED9056AE/0/0
X-purgate-type: clean
X-purgate-size: 1771
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,aggios.com:email];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 84EE8387DC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mirela Simonovic <mirela.simonovic@aggios.com>

The MMU must be enabled during the resume path before restoring context,
as virtual addresses are used to access the saved context data.

This patch adds MMU setup during resume by reusing the existing
enable_secondary_cpu_mm function, which enables data cache and the MMU.
Before the MMU is enabled, the content of TTBR0_EL2 is changed to point
to init_ttbr (page tables used at runtime).

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v7:
- no functional changes, just moved commit
---
 xen/arch/arm/arm64/head.S | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 72c7b24498..596e960152 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -561,6 +561,30 @@ END(efi_xen_start)
 
 #endif /* CONFIG_ARM_EFI */
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+FUNC(hyp_resume)
+        /* Initialize the UART if earlyprintk has been enabled. */
+#ifdef CONFIG_EARLY_PRINTK
+        bl    init_uart
+#endif
+        PRINT_ID("- Xen resuming -\r\n")
+
+        bl    check_cpu_mode
+        bl    cpu_init
+
+        ldr   x0, =start
+        adr   x20, start             /* x20 := paddr (start) */
+        sub   x20, x20, x0           /* x20 := phys-offset */
+        ldr   lr, =mmu_resumed
+        b     enable_secondary_cpu_mm
+
+mmu_resumed:
+        b .
+END(hyp_resume)
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 /*
  * Local variables:
  * mode: ASM
-- 
2.43.0


