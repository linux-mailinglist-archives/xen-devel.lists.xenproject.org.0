Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B512E9849E1
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 18:42:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803180.1213681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8cc-0007yE-Sr; Tue, 24 Sep 2024 16:42:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803180.1213681; Tue, 24 Sep 2024 16:42:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8cc-0007tE-PP; Tue, 24 Sep 2024 16:42:42 +0000
Received: by outflank-mailman (input) for mailman id 803180;
 Tue, 24 Sep 2024 16:42:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vi3U=QW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1st8cb-0006ag-0C
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 16:42:41 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0361a052-7a94-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 18:42:40 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a8a837cec81so414400966b.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 09:42:40 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4972f8sm925880a12.36.2024.09.24.09.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 09:42:39 -0700 (PDT)
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
X-Inumbo-ID: 0361a052-7a94-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727196160; x=1727800960; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bp9beghPA+jXcegEyvP7wMfnc3wLxaxw+ebFwbltls0=;
        b=MqBhHdmd9HNroHBiJ1uP5E0+j8eUyIKYqrgbGj2AIcR+xy8zlVewn4I5D/JSHqmINv
         y7mbuAeVTGlyM5Eo9N8RGbXbb+jSgnyhBdwTcFuwEFiF8Pup8IrNJnCFelA1J0FN7rks
         fHtP/iW4bSCJntSdmLXyZiWRC6qzn8bkxPLi/mnhZfq0PkFZj973zU1WcjAKu8dqfocn
         jseUU8RaL2tzm9bqSeBWLwQZZUQ2nVPT3dFgQ/mJl0B8JaJN1Rr7cuZ39YGni4sNmH6l
         OY8XAfVRvJ+IG/cx2ykfjYSkpbDN5ES/IiedJ8Rlhzp7LfKFP75MyHtwp+N4kXXSJRL7
         DjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727196160; x=1727800960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bp9beghPA+jXcegEyvP7wMfnc3wLxaxw+ebFwbltls0=;
        b=k72KmiWsH9sCspiTfPaxHa01sx4HbKq/ohaZk2IhiDdjBL/Ez/SFsXdkxHwkrnPPiw
         sljY1AuzKoRIXNj+Tpu1oq2v972WGiJiabxuEtfvR3u7XLXbwx2SFTGuKCW109NYSW8k
         n7YWAlPgTL3Y4GedDSTbYoTnjhHil3THYz/U3z9PmaTI3ITehPUoghy+/0m4YcPj/q5W
         VLTmKdT2vMqdXRXvF3Aliif3gaZhsrzFLt4o53VOEK4/BQ36MIKHYz68Cu9zIUvV6TB/
         VyzuEctRxvxULuICo2QhxEVO3/qdIlibFdSR2xwLLc8nPa5UHidhTj5UT0exzTChGLSs
         cZYQ==
X-Gm-Message-State: AOJu0YzIpy2LG4WtnqMswDdzUECdD2ve47UHpCT5f5ilLFUOeTbtDihL
	11IUvAwvW5ScMuOAMxg9xpdsjmiCh9Aob8Wy1pJq02KdHgRTnr7bWRirBQ==
X-Google-Smtp-Source: AGHT+IErM9Jc+846ggvulOl9WQ5PnxMxUZ+z+bT4bDXhTwwPZuew0fVwvbcBssDODwgsuNO/yRML+g==
X-Received: by 2002:a05:6402:2753:b0:5c5:c1dc:9028 with SMTP id 4fb4d7f45d1cf-5c5c1dc9175mr8261128a12.33.1727196159539;
        Tue, 24 Sep 2024 09:42:39 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 2/5] xen/arm: use {DT,ACPI}_DEV_INFO for device info sections
Date: Tue, 24 Sep 2024 18:42:31 +0200
Message-ID: <1533aa9fe0a4464bd97a44fc1f68cac0a670640c.1727193766.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727193766.git.oleksii.kurochko@gmail.com>
References: <cover.1727193766.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor arm/xen.lds.S by replacing the inline definitions for
device info sections with the newly introduced {DT,ACPI}_DEV_INFO
macros from xen/xen.lds.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - use refactored ADEV_INFO and DT_DEV_INFO macros.
---

 xen/arch/arm/xen.lds.S | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index bd884664ad..7317851871 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -126,19 +126,13 @@ SECTIONS
 
   . = ALIGN(8);
   .dev.info : {
-      _sdevice = .;
-      *(.dev.info)
-      _edevice = .;
+     DT_DEV_INFO
   } :text
 
-#ifdef CONFIG_ACPI
   . = ALIGN(8);
   .adev.info : {
-      _asdevice = .;
-      *(.adev.info)
-      _aedevice = .;
+     ADEV_INFO
   } :text
-#endif
 
   . = ALIGN(8);
   .teemediator.info : {
-- 
2.46.1


