Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B0097B2DC
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2024 18:16:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800026.1209969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqas0-000263-Ib; Tue, 17 Sep 2024 16:16:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800026.1209969; Tue, 17 Sep 2024 16:16:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqas0-000243-Ec; Tue, 17 Sep 2024 16:16:04 +0000
Received: by outflank-mailman (input) for mailman id 800026;
 Tue, 17 Sep 2024 16:16:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fqUh=QP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sqary-0001Pu-9U
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2024 16:16:02 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20b7a653-7510-11ef-99a2-01e77a169b0f;
 Tue, 17 Sep 2024 18:16:00 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5365d3f9d34so5144265e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Sep 2024 09:16:00 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5368704da27sm1234574e87.83.2024.09.17.09.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 09:15:58 -0700 (PDT)
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
X-Inumbo-ID: 20b7a653-7510-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726589759; x=1727194559; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOR0qHhttHkehBXUQHlKkxROPlwujDM7oNt3V6O5xi0=;
        b=Q0mnpRLIPkJrBplcjbJM78M6lf1t4mqS3hgeEWDaadqHQupo3fnCY5wx41V37MT+oQ
         IXvqWvv8rhhUjLswJAnbWfplh7YeL/VXUvyKgpahFl/2/J8FSUTnA4zxu/Tl8X/spgg4
         xnOtbbnhKfCKvHFGKXuDhgNb6QrWgNmeNi0FTTHu7LpXWUeAD95UNbG6Esa4pbNV4wjm
         3wIo+NTqsgZpMAjyABC8nCV5vAzoGRpdu3pRfWmC0FCvLfzprQnIFWLaNZfj4aBnWZLm
         XlO7FdWRw78Gnx04HaNoiz2JxuricQQiEKZa7Ld9DqeSh0CNrMBasElYzyeBLHpi83Kp
         sYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726589759; x=1727194559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AOR0qHhttHkehBXUQHlKkxROPlwujDM7oNt3V6O5xi0=;
        b=FGUZnrSg4n2NwZh2+fe/48kiK5T1vffM5JwVxxrzmh7fuDxKVJUjbC3aZmdkz6xpkQ
         WtSMlet5TqNRL1v4Ujlxnw1bR9A0HE10tClu4bVfvy+1o22dT10il51OHsNJjCG01vZk
         pNVAbCWuVeFyQr8lqBD2DHi8Us81G3SftC7kz3jBQkDk2VJ/h8KkCFe0jL4bJfU5V7l5
         hnvAcw2Jdnvyw1ZUuO6W+Rdgh+1qwgMtmv75x/AdExb70YwBDwpYamjPyodewvYu3GIy
         ffjYcQ86li6bs5Cc8trqXpEjY8eQGAfQshTx/uWu3cKwG24dC2mUOmzywLaUnSRIWm/j
         Hn0w==
X-Gm-Message-State: AOJu0YwjNuyg1bMCaBsmCmxM/v2gVITjh5hKKG0DCzA4WhOUwmsNLZ8B
	YdH7C1wuOYud0H8bU2Qia1eRbOp+ABHE7tlwDuJUHTT5+Os50tTlZtt7Dg==
X-Google-Smtp-Source: AGHT+IGbAPsJS9DuEOO/ZAh3D5ibK1ZkH80MPxeL6eFSY0yxjPSTWmiIo2sjh1r/TrDG02dzb7azYw==
X-Received: by 2002:a05:6512:a90:b0:535:3dae:a14b with SMTP id 2adb3069b0e04-5367feba05emr7972209e87.2.1726589759293;
        Tue, 17 Sep 2024 09:15:59 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 2/5] xen/arm: use {DT,ACPI}_DEV_INFO for device info sections
Date: Tue, 17 Sep 2024 18:15:52 +0200
Message-ID: <19096a1113dc4c76af7f869f095e4d18b8f58375.1726579819.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726579819.git.oleksii.kurochko@gmail.com>
References: <cover.1726579819.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor arm/xen.lds.S by replacing the inline definitions for
device info sections with the newly introduced {DT,ACPI}_DEV_INFO
macros from xen/xen.lds.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - New patch.
---
 xen/arch/arm/xen.lds.S | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index bd884664ad..940ff7819a 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -125,20 +125,10 @@ SECTIONS
   } :text
 
   . = ALIGN(8);
-  .dev.info : {
-      _sdevice = .;
-      *(.dev.info)
-      _edevice = .;
-  } :text
+  DT_DEV_INFO_SEC(.dev.info, NOUSE_DECL_SECTION)
 
-#ifdef CONFIG_ACPI
   . = ALIGN(8);
-  .adev.info : {
-      _asdevice = .;
-      *(.adev.info)
-      _aedevice = .;
-  } :text
-#endif
+  ACPI_DEV_INFO_SEC(.adev.info, NOUSE_DECL_SECTION)
 
   . = ALIGN(8);
   .teemediator.info : {
-- 
2.46.0


