Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F93F8903ED
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 16:55:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699005.1091370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps5c-00075m-KP; Thu, 28 Mar 2024 15:54:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699005.1091370; Thu, 28 Mar 2024 15:54:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps5c-00072H-HI; Thu, 28 Mar 2024 15:54:52 +0000
Received: by outflank-mailman (input) for mailman id 699005;
 Thu, 28 Mar 2024 15:54:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps5b-00071m-A6
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:54:51 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81b0bf09-ed1b-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 16:54:49 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a468226e135so141646566b.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:54:49 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 f13-20020a1709062c4d00b00a4df82aa6a7sm882455ejh.219.2024.03.28.08.54.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:54:48 -0700 (PDT)
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
X-Inumbo-ID: 81b0bf09-ed1b-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641289; x=1712246089; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xoyjiIw561YlGIaQRdLbxciG2dWfen0yY52crHbWn0=;
        b=zvuhEkeh0L+78tpAIgLDZI5zyApCsWNLjhpa8HgahhVcrSjd3yi1t1APPfZscnn1Ba
         6AVNjgIYYbxAP9HyGRau26VeodkgTpHY0DoihcFFxheZn8ry0Q4Y0og5toGSK0QBZBRJ
         AoqmPobglXRz/WBAwNYxvChm3i9DHMeFTNEsvHIoAdkoMpwvAIWUakmZG/IXJjKoh+8v
         jrKtmZinG4bXx/72lab40FPvUOtybeoMtvANIHlcQqRfxw+6lNGP8lnuG8Vq5i9XEOsB
         0ZWhfg8fkKkd/PE8ssHH5JvB4zlz8n1ab2z+zUBU2kcJzLcC/RBgypZJ8sjwdnKviqMO
         yJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641289; x=1712246089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xoyjiIw561YlGIaQRdLbxciG2dWfen0yY52crHbWn0=;
        b=sCbO5tkDckaLljRkDbTj2wVO3s2eTbT9MqoYlm5Wg29jNgHGdf4FqRAttfjs9npUwg
         38icl65Of2WcoruYQ7Duc5S9jSjerZji1iepAq+29sTNrKfP/IyZMbp3QClFNcqsoJ88
         GXKQeye6Q9tXyM/7x0e2FnN3Yj7EJyReBDAph6P77QRYjoP7+Hi+Cwckwwg4m2zrCAVX
         HjmP8doxAZuVEzR7AFTzAD+ZsRdhsbevRtfxImFyu7A2Pz4PTVcP1yU/nJrSSL5We5UX
         t7iogU0IENShjVweD/ZeOV4aXmqxdmLyXJmACfKP3DFKjdjKzRK6HNqlJjMBVAbDU3a9
         n8HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdIo2dn7PQ1zb3kV2i6xRPRWgbkJsbFYFW0by6UEKaz64FzZadBOcNQdr5ZPGyDE6NaTU2gY47cXZr2DmVrBrefX6d1+DHLguxmZvme0A=
X-Gm-Message-State: AOJu0YxBIccQnsS9r2qjDUY4vEI36R3UiN+Azth+3SyCGhTWkJGUtU32
	T7GxiqZ5T2UF0ktjCo07py1WSD/6Oa6w28QmEDg6StKD4mAbbE7dCSnuMA/xlxw=
X-Google-Smtp-Source: AGHT+IF5nPNNk6iWv9K9gmp+zF28jumHMVCID22KWO3BYQCYDbLztVinN6sDOrMp2q9Gec/eNpwGrA==
X-Received: by 2002:a17:906:4892:b0:a47:3664:1b98 with SMTP id v18-20020a170906489200b00a4736641b98mr2095599ejq.7.1711641288815;
        Thu, 28 Mar 2024 08:54:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Bernhard Beschow <shentey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Ani Sinha <anisinha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-9.1 01/29] hw/i386/pc: Declare CPU QOM types using DEFINE_TYPES() macro
Date: Thu, 28 Mar 2024 16:54:09 +0100
Message-ID: <20240328155439.58719-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When multiple QOM types are registered in the same file,
it is simpler to use the the DEFINE_TYPES() macro. In
particular because type array declared with such macro
are easier to review.

In few commits we are going to add more types, so replace
the type_register_static() to ease further reviews.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 0be8f08c47..2c41b08478 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1810,23 +1810,20 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
         pc_machine_set_fd_bootchk);
 }
 
-static const TypeInfo pc_machine_info = {
-    .name = TYPE_PC_MACHINE,
-    .parent = TYPE_X86_MACHINE,
-    .abstract = true,
-    .instance_size = sizeof(PCMachineState),
-    .instance_init = pc_machine_initfn,
-    .class_size = sizeof(PCMachineClass),
-    .class_init = pc_machine_class_init,
-    .interfaces = (InterfaceInfo[]) {
-         { TYPE_HOTPLUG_HANDLER },
-         { }
+static const TypeInfo pc_machine_types[] = {
+    {
+        .name           = TYPE_PC_MACHINE,
+        .parent         = TYPE_X86_MACHINE,
+        .abstract       = true,
+        .instance_size  = sizeof(PCMachineState),
+        .instance_init  = pc_machine_initfn,
+        .class_size     = sizeof(PCMachineClass),
+        .class_init     = pc_machine_class_init,
+        .interfaces     = (InterfaceInfo[]) {
+             { TYPE_HOTPLUG_HANDLER },
+             { }
+        },
     },
 };
 
-static void pc_machine_register_types(void)
-{
-    type_register_static(&pc_machine_info);
-}
-
-type_init(pc_machine_register_types)
+DEFINE_TYPES(pc_machine_types)
-- 
2.41.0


