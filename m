Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A41C87EB4DA
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 17:32:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632938.987475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2wKQ-0003rH-Qe; Tue, 14 Nov 2023 16:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632938.987475; Tue, 14 Nov 2023 16:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2wKQ-0003pE-NC; Tue, 14 Nov 2023 16:31:54 +0000
Received: by outflank-mailman (input) for mailman id 632938;
 Tue, 14 Nov 2023 16:31:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2wKO-0002Oz-Tt
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 16:31:52 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51145ac1-830b-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 17:31:52 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-53de0d1dc46so9475907a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 08:31:52 -0800 (PST)
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 d17-20020aa7c1d1000000b0052febc781bfsm5327156edp.36.2023.11.14.08.31.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Nov 2023 08:31:51 -0800 (PST)
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
X-Inumbo-ID: 51145ac1-830b-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699979512; x=1700584312; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRnzgqjbzRTGqJ5jrYQJxW1BmP5r27YtuyDu1IVzHFA=;
        b=bsneDyKfYbpDwR3rGe0BtvHR/DdJGyarFuW8xGzMLja2PnMQX2lT56n287T6Oy+CDe
         0d4TMkq857BpgEg5HI48JauWFhCyhMLJNuM9xWdBJPWCRYDQ0r+gh3VPiF0zJjvbh9sK
         cTaCQJhwjtVNfbQh9Th8NAHXWnil6ercsK8xqDtxiks6gxCPZKHhzMKAiOzR0pN5ea+A
         dMPhEXbZ1vXp2hX4i/css0iM8asTlRN6Wote5KINbNl7SNTp5779ZHNmHoKys8TXLvZ1
         z1Y3+IzP58/Bxi/+B5RLl6Ixbn8dfYuUIQeOgjyMfXml+6HwRmcbm3fjBTcLzc6r4R8c
         nBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699979512; x=1700584312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRnzgqjbzRTGqJ5jrYQJxW1BmP5r27YtuyDu1IVzHFA=;
        b=X12z9V+M7NcU6ID1cb3X/3BAABv/BAbLrnIvXeXdjvTKdeRyikvQww7eSIGFawdOLL
         jmonxu9ngxOtp+ASCE8WXYGmhq8AVMvaHv3dFx/UMvvobHyuMiu8JPp1K1FCfmjCjbMQ
         2JRym7k6Jw5J2/s8OOYPTtK6VWORSt/oX0gkh9NfcPNW/qlb90pkMLMD0ss1l+v28ahI
         NwHOViML4TXo9FVWeFTGD54Mi+D4GgIM9dSJR8zhKW8WtsBv/+gigkHI+na7qljOn8CM
         b50m+qKn088si85PozhKD8xAmORL+C+QmPA9tF1NA/5uApnoCvTL3U3snx1+Lft9O66T
         aBPA==
X-Gm-Message-State: AOJu0Yy/qFhMsR7RmEoxK8JOtjXaxAf/EYj8miIIT5NN/kO2UmIlTpzM
	1yMxktosvu8bGrBDIDEtQzr9ig==
X-Google-Smtp-Source: AGHT+IE8/KnAMA1FjOTiA03DDYyTyNl6glp0CwMJ10smYv5ORjVAvozuUmjkzAh9auk1H2jVfOhg2Q==
X-Received: by 2002:a05:6402:3cf:b0:543:70c2:aa8d with SMTP id t15-20020a05640203cf00b0054370c2aa8dmr7379909edw.15.1699979511911;
        Tue, 14 Nov 2023 08:31:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH-for-9.0 4/9] hw/xen/hvm: Expose xen_memory_listener declaration
Date: Tue, 14 Nov 2023 17:31:18 +0100
Message-ID: <20231114163123.74888-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114163123.74888-1-philmd@linaro.org>
References: <20231114163123.74888-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There can only be a single xen_memory_listener definition
in a qemu-system binary.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/xen/xen-hvm-common.h | 1 +
 hw/arm/xen_arm.c                | 2 +-
 hw/i386/xen/xen-hvm.c           | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
index 83ed16f425..0fed15ed04 100644
--- a/include/hw/xen/xen-hvm-common.h
+++ b/include/hw/xen/xen-hvm-common.h
@@ -18,6 +18,7 @@
 extern MemoryRegion xen_memory;
 extern MemoryListener xen_io_listener;
 extern DeviceListener xen_device_listener;
+extern const MemoryListener xen_memory_listener;
 
 //#define DEBUG_XEN_HVM
 
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index b478d74ea0..39dcd74d07 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -38,7 +38,7 @@
 #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
 OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
 
-static const MemoryListener xen_memory_listener = {
+const MemoryListener xen_memory_listener = {
     .region_add = xen_region_add,
     .region_del = xen_region_del,
     .log_start = NULL,
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index b64204ea94..a65a96f0de 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -469,7 +469,7 @@ static void xen_log_global_stop(MemoryListener *listener)
     xen_in_migration = false;
 }
 
-static const MemoryListener xen_memory_listener = {
+const MemoryListener xen_memory_listener = {
     .name = "xen-memory",
     .region_add = xen_region_add,
     .region_del = xen_region_del,
-- 
2.41.0


