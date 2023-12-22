Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF47581CC2B
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:26:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659568.1029293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhPy-0000r4-Tt; Fri, 22 Dec 2023 15:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659568.1029293; Fri, 22 Dec 2023 15:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhPy-0000ng-Qj; Fri, 22 Dec 2023 15:26:30 +0000
Received: by outflank-mailman (input) for mailman id 659568;
 Fri, 22 Dec 2023 15:26:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDa-0007Ie-Ti
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:42 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b15ed366-a0dc-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 16:13:42 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50e616ef769so1939112e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:42 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:40 -0800 (PST)
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
X-Inumbo-ID: b15ed366-a0dc-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258022; x=1703862822; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsRI46wZmV7QzWwBsGNKu5RrZ1i3flyRhG3d/tOeeu8=;
        b=nW4d6QNqug3UGjeyauCPLZdKPquMJT8I1WAm7hBhhsTxNKTeanzRt2ibyiAM20e183
         GXxxl4ss4cMpejPtZJbG2hCjUImotATzzeLFWdOddFkCP5PUHpWc/vBLz0YNdcJzL4TX
         aWUTC8kghTghiz5Hl/PgLIMG41cak2xFTuZKj0uHdDqFczoIRFaOEISiOsMBW4q1k/xJ
         v5wXvhYk39CXlW6/YyjK9UIY8owZIOLYKpjZvW4YzLvi7t/V/J0AVKtQI+YhnJyazyET
         CXm28/dcDdGYrgueleYJmvqQjC4hOSC2YChIih0fKkeyAfHD1nX6nVw4Qg34+J8t/R7L
         92iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258022; x=1703862822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KsRI46wZmV7QzWwBsGNKu5RrZ1i3flyRhG3d/tOeeu8=;
        b=ekc+x1XcFLrNnn/HAPyWGr/wLOz2v0IgdhwAPWG/8e2PJe59cwmG1or0cRoa5oRX/P
         HXnRyUMC5TNC+n7kGj/a05DTWyrh9LcSjMFutQ2aoT2G4v0FgXWALQbWemhrx8QgWCsx
         B1CqPGG9+EhAQxZzN8valxsROgrVQX+5QELm1t/k255a9XMoqOf/3EbGzpq/S1lfpAJL
         7mT7S0zfHa8n9GwC2EwYAZBAfftr1J82xKsjy9e9kcFu6Ja5xyWMW67MFdXjzfohte3q
         fcb5VUPvKt7qs1oTNrgJ6/ZLuZ6eHRBAHKlzLCdbBPE0/WXhV2QNciqAGeZHqIF69vY4
         i8pQ==
X-Gm-Message-State: AOJu0Yxbv16F8RFDk7zazTQNHqVxGRJL27tOR5nEuoTbpz93bvRQhSdn
	v2NV0ZqQ63ehaP9mT/XH7YN5KEybOQE=
X-Google-Smtp-Source: AGHT+IFlGQmXzmVfOXR0M0kbrxMry5b4Z+NVHtRbuBIaVdo0Vz2PdB49KFYEt3Fb6KoSX9w9prY/Sg==
X-Received: by 2002:ac2:5508:0:b0:50e:6ee7:2727 with SMTP id j8-20020ac25508000000b0050e6ee72727mr112082lfk.42.1703258021820;
        Fri, 22 Dec 2023 07:13:41 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 17/34] xen/riscv: add compilation of generic find-next-bit.c
Date: Fri, 22 Dec 2023 17:13:01 +0200
Message-ID: <ec65601717af89e2ebcdea01b947cccc05d20bbb.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - new patch
---
 xen/arch/riscv/Kconfig                  | 1 +
 xen/arch/riscv/configs/tiny64_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index f382b36f6c..b8f8c083dc 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -4,6 +4,7 @@ config RISCV
 config RISCV_64
 	def_bool y
 	select 64BIT
+	select GENERIC_FIND_NEXT_BIT
 
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/arch/riscv/configs/tiny64_defconfig b/xen/arch/riscv/configs/tiny64_defconfig
index 35915255e6..399128be02 100644
--- a/xen/arch/riscv/configs/tiny64_defconfig
+++ b/xen/arch/riscv/configs/tiny64_defconfig
@@ -29,3 +29,4 @@ CONFIG_RISCV_64=y
 CONFIG_DEBUG=y
 CONFIG_DEBUG_INFO=y
 CONFIG_EXPERT=y
+CONFIG_GENERIC_FIND_NEXT_BIT=y
-- 
2.43.0


