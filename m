Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C9B78B4E9
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 17:58:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591665.924123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaecA-0004cl-1v; Mon, 28 Aug 2023 15:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591665.924123; Mon, 28 Aug 2023 15:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaec9-0004bE-VX; Mon, 28 Aug 2023 15:57:17 +0000
Received: by outflank-mailman (input) for mailman id 591665;
 Mon, 28 Aug 2023 15:57:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Xqe=EN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qaec8-00047o-J3
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 15:57:16 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d6dafbf-45bb-11ee-9b0c-b553b5be7939;
 Mon, 28 Aug 2023 17:57:13 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4ff8cf11b90so5324683e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Aug 2023 08:57:13 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 t25-20020ac24c19000000b004fe8424c750sm1636027lfq.47.2023.08.28.08.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Aug 2023 08:57:11 -0700 (PDT)
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
X-Inumbo-ID: 8d6dafbf-45bb-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693238232; x=1693843032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9LMAk8n2gFjyPZaq/qFruo/ox6AcID4nckvvRxZxoI=;
        b=Jh1ReukhHDC5iS9VTzYKeDEAwMuhGCm4R1hud7ygxYYWxZffOiuiz/j/sAA5zrFvMS
         gevZ98lNIMe3DwhXV8NfHaMLLLRskYfCuNOVHPi3MTKN23tb5t5TQwGf+CqTO9+k83hQ
         4cpumKKMyhMVTc00olf0tucr8E5T3O3Wx+JtCjL4nq5Eo6E515o6Dn2AZFpXo7zjn6YR
         XeneTb/k8eBc314wLlGJ68MiRRrK7h83J6br1ZhWMN7LnoYC38+/Aw7F9rVkhMfZIQe3
         +3V8/fNQb9iNMYXP+sJO5oaGZpyTkuIi+dENQB2P4cMZAyQQfs8z7coTNpKZ1GzvD/xV
         bYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693238232; x=1693843032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9LMAk8n2gFjyPZaq/qFruo/ox6AcID4nckvvRxZxoI=;
        b=f+Fgc/ITZGAM/miMQX1NBv1mQx2AJ0+B/bW39OWTvmIQWgGXAsBEHWRXYHbW4NzBA+
         zZ82cmdTVunD9esLzVQWWmSVb0UzOKVCf3WQHMw026wHXH5eP4g1Jy2MZiuMnGG/k673
         TT1mugNDTSG6F2Oz4JsFo0BAkhcWhNBwNw1RdOnuxCWMkb4KGsWttQaSh/RJsEAgl94/
         5TaI76RfZAwAcIoT6KybwDJ7ZX5DRtvHsQLyEMcNJRxqyGyI6WUhp5H+WQmJeg+GHGKe
         Pf2bkZHYEOsqVxesk9IlzoGh14vzTr72vOTQYL5L7QQ5tnJ1S+pw+LrM0ps7jyMA8O+Y
         wwnA==
X-Gm-Message-State: AOJu0Yzo5os9o7SyLnGBpMkeHBuIToW2osDXWTuqbuldTHFmFb87oZoL
	lgJC7HVAOTNEFaV/j9sMrsUF7rN56HM=
X-Google-Smtp-Source: AGHT+IGMI1hX5W8fXEH1S5KzO/gocCLo7vwystoaT31+apxLvpvs2iro9SzkjBQkmFcC6ISmICftDQ==
X-Received: by 2002:a19:9158:0:b0:500:a2d3:3e65 with SMTP id y24-20020a199158000000b00500a2d33e65mr7601612lfj.23.1693238232043;
        Mon, 28 Aug 2023 08:57:12 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 1/2] xen: add stubs dir to include path
Date: Mon, 28 Aug 2023 18:57:07 +0300
Message-ID: <09fa701d2be02589cc9f63d8334082346b5c1702.1693235841.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1693235841.git.oleksii.kurochko@gmail.com>
References: <cover.1693235841.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

stubs dir will contain empty/stubs generic for all architectures
headers.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/Makefile b/xen/Makefile
index f57e5a596c..64c3542c84 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -438,6 +438,7 @@ ifdef building_out_of_srctree
 endif
 CFLAGS += -I$(srctree)/include
 CFLAGS += -I$(srctree)/arch/$(SRCARCH)/include
+CFLAGS += -I$(srctree)/include/stubs
 
 # Note that link order matters!
 ALL_OBJS-y                := common/built_in.o
-- 
2.41.0


