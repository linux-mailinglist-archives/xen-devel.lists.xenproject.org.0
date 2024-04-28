Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E148B4CEA
	for <lists+xen-devel@lfdr.de>; Sun, 28 Apr 2024 18:53:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713705.1114610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s17lp-0006gF-Ap; Sun, 28 Apr 2024 16:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713705.1114610; Sun, 28 Apr 2024 16:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s17lp-0006aH-34; Sun, 28 Apr 2024 16:52:57 +0000
Received: by outflank-mailman (input) for mailman id 713705;
 Sun, 28 Apr 2024 16:52:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a4SJ=MB=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1s17ll-0006D5-K6
 for xen-devel@lists.xenproject.org; Sun, 28 Apr 2024 16:52:53 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c06b1a9c-057f-11ef-b4bb-af5377834399;
 Sun, 28 Apr 2024 18:52:52 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-34cc606b1b1so832710f8f.3
 for <xen-devel@lists.xenproject.org>; Sun, 28 Apr 2024 09:52:52 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a056000188c00b00347eb354b30sm27850921wri.84.2024.04.28.09.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Apr 2024 09:52:51 -0700 (PDT)
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
X-Inumbo-ID: c06b1a9c-057f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714323171; x=1714927971; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5idciq4z6LmfOUeSzwtHh7qUWkne+GPf19nH7mQTjs=;
        b=B3qMhSGfexztesEivmOOtbRap/SGTDXaKGfzgnfQ4ZuMedQ58psaXrPWremG2EkFQm
         h5SKO4KCW2on7aZ2Z7iXUbcRn+q4Q6E9gAnLWuURCyMTybtx90Rf4xkRL8ik/gb0d06Z
         wlGr3Th5CI2IvUHKxIsLEwopRvEEDIYJ//w3qklMjIus6AuDCxWsplvN4jKuMUincTeP
         Z73CxzeX8ggdXevT6SUKr330/0AEC5ueMmskxnHFqGQy5VaAl4gTiN+sdce8Vo5N6cuO
         bRPFFJTDy6WOazyeCtIDRhs4CF5aLp3DsZzGvHQzjudM1OkRSPdTDV9CQNkNFulX5xXc
         sT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714323171; x=1714927971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5idciq4z6LmfOUeSzwtHh7qUWkne+GPf19nH7mQTjs=;
        b=HcvM5/GyDSnpRzi2scmuXQjnXOrAeykqnvyGVYbhXBpV4hJj4gWH52ThJAYaYwKbAT
         fo+aPEfnUGSJs3xHvxmu+d5EIiQ2YWtX7KetBU3Asa0icJISC9iweLNAObkzKpFpe5yd
         SFmudR6DE8E2vKtcUSc1LLNRIimzFXfh/CKuzniBSmO8MhFXCNjUUggFPD43+xqCx92P
         anUZHHa6I+sPxI4J8kCde7btuufJnl96fADcqOHafZ+wi8Kjfuf9Cq/9qWIQHRhYBK1Q
         uHTFndWmeWYvNKv4U+Uhfx64cxsfTTuFAWqEoXS58SGB4JP4Jghf6kiCoVYaSyDleC+1
         pUqA==
X-Gm-Message-State: AOJu0YyEjJO0fTSppSxSejIuzV2b9ZQlXtmf5CFE+rBFpKeQgxUt5uZi
	Cuny5D/qQDKhnkpykh14L2m/kea5YQ/BAL0JVLY4j3TfrvpvK6ZVupoSF2Ii
X-Google-Smtp-Source: AGHT+IEerUPMQuOhFt+8q/PpyY6msCrrYCRJPyCUi6jzS2ozwfAnnPxmDPcjPTrxWpRzPO+vKOQpWQ==
X-Received: by 2002:a05:6000:4cc:b0:347:9e5a:3078 with SMTP id h12-20020a05600004cc00b003479e5a3078mr6708927wri.1.1714323171414;
        Sun, 28 Apr 2024 09:52:51 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: [PATCH v2 3/7] docs/man: Add max_altp2m parameter to the xl.cfg manual
Date: Sun, 28 Apr 2024 16:52:38 +0000
Message-Id: <9261df7a64aee4c09843ba99c182a65ec2057771.1714322424.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714322424.git.w1benny@gmail.com>
References: <cover.1714322424.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Update manual pages to include detailed information about the max_altp2m
configuration parameter.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 docs/man/xl.cfg.5.pod.in | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 8f2b375ce9..2d4ea35736 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2039,6 +2039,20 @@ a single guest HVM domain. B<This option is deprecated, use the option
 B<Note>: While the option "altp2mhvm" is deprecated, legacy applications for
 x86 systems will continue to work using it.
 
+=item B<max_altp2m=NUMBER>
+
+Specifies the maximum number of alternate-p2m views available to the guest.
+This setting is crucial in domain introspection scenarios that require
+multiple physical-to-machine (p2m) memory mappings to be established
+simultaneously.
+
+Enabling multiple p2m views may increase memory usage. It is advisable to
+review and adjust the B<shadow_memory> setting as necessary to accommodate
+the additional memory requirements.
+
+B<Note>: This option is ignored if B<altp2m> is disabled. The default value
+is 10.
+
 =item B<nestedhvm=BOOLEAN>
 
 Enable or disables guest access to hardware virtualisation features,
-- 
2.34.1


