Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0793C87EE27
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:56:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694951.1084342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHM-000540-84; Mon, 18 Mar 2024 16:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694951.1084342; Mon, 18 Mar 2024 16:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHL-0004zE-Hb; Mon, 18 Mar 2024 16:56:03 +0000
Received: by outflank-mailman (input) for mailman id 694951;
 Mon, 18 Mar 2024 16:56:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHJ-0002f9-BO
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:01 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 657dfe6c-e548-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:55:59 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-514a8259ec1so719867e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:55:59 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:55:58 -0700 (PDT)
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
X-Inumbo-ID: 657dfe6c-e548-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780959; x=1711385759; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HskY0/rWAkkufGRUO0YcZLuEXfDnS48xXAIqv0EwLpg=;
        b=vS/4wiK66x/6cLaBRMZXfUvkO/GS0JmziU31NoR+GqY1gasTCaLVimz5j4xHaElAIt
         roz0WVY35ID7XGC7SEvf9xojbHfTlgo8PZ95ouohfDAtWeQsmIXGRUsZSpS6OvT97uTq
         0Z9l45is0QCqqleKesSpDJQ1IxMrNENi1TOJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780959; x=1711385759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HskY0/rWAkkufGRUO0YcZLuEXfDnS48xXAIqv0EwLpg=;
        b=EC9Dx8fVp4sETflQHtJCLg4xpveV00SyeI64e8+iZKS+l/Bbn62sRjOki9h5pCagwL
         f2Ung7fbB/+uyvE9HV6FjsRoKf/gxXUsgLkoR9pMQkUckX6f5XqOn89e5nkRUD13YD16
         xeCOB603dd/BITIn/74+IC2eG65HaqBo5gBMt913XiGLPqCUfEZrNh01o+mnUU2A2D+1
         e7uqYg/OAdYsBGCGQS582fOQ821dzZVz5aAf3lDbHmrzL7Ay8Q5TzTs0VOq+45QsQKMp
         e4c8EKEycEwOnTk+BFENoMb5mzTHCzfyseEsGlrnSczcNVmynZmaPAkAqCogS3NG2dkX
         4/XA==
X-Gm-Message-State: AOJu0YweOBRDPZAjq1+/4gZMijm/5l9e8OhIdey84AUygi421pyUM20j
	EAVOy4UlBYyOs2/ZaaBYcrNcevAYwt0V/prBgOMc+EDT8ZL3A7fbBKnQuqBSuWbr247i5GoKX02
	H
X-Google-Smtp-Source: AGHT+IHissgjFavvd6I0K4K1XuCGNtvIVz2ecBEftkAlbPre0cCi0ljKz4wdjFPFtf1vPgXDoCXldA==
X-Received: by 2002:ac2:4985:0:b0:513:9f14:8f73 with SMTP id f5-20020ac24985000000b005139f148f73mr8121706lfl.36.1710780959342;
        Mon, 18 Mar 2024 09:55:59 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 10/36] preseed_create: Workaround fail grub-install on arndale
Date: Mon, 18 Mar 2024 16:55:19 +0000
Message-Id: <20240318165545.3898-11-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

grub-installer on arndale-* machine fails with Debian Bookworm. It
tries to install "grub-pc" which doesn't exist. Skip installation.

Somehow, cubietruck-* installation works fine.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 Osstest/Debian.pm | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index 36c05551..98b2fc86 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -1581,6 +1581,14 @@ chmod +x /target/$t
 END
     }
 
+    if ( $ho->{Flags}{'need-uboot-bootscr'} &&
+        $ho->{Suite} =~ m/bookworm/) {
+
+        # grub-installer fails on the arndale machine, it's trying to install
+        # "grub-pc" which doesn't exist. Skip installation.
+        $preseed_file .= "d-i grub-installer/skip boolean true\n";
+    }
+
     $preseed_file .= preseed_hook_cmds();
 
     if ($backports_kernel || $ho->{Flags}{'no-di-kernel'}) {
-- 
Anthony PERARD


