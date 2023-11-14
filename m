Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4757EB4DC
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 17:32:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632944.987495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2wKd-0004tR-BP; Tue, 14 Nov 2023 16:32:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632944.987495; Tue, 14 Nov 2023 16:32:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2wKd-0004qS-7L; Tue, 14 Nov 2023 16:32:07 +0000
Received: by outflank-mailman (input) for mailman id 632944;
 Tue, 14 Nov 2023 16:32:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2wKb-0002h9-Pt
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 16:32:05 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5824a3dd-830b-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 17:32:04 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9bf86b77a2aso858902566b.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 08:32:04 -0800 (PST)
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 b11-20020a1709062b4b00b009b2b47cd757sm5740724ejg.9.2023.11.14.08.32.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Nov 2023 08:32:03 -0800 (PST)
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
X-Inumbo-ID: 5824a3dd-830b-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699979524; x=1700584324; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTlDtVgsnwcqvtsJBU/yKayNDVYOQAUQMToAEPEK6Gk=;
        b=Hso6voe26dqIr54LrcVEjXR3IxXoQDsKVtCYODMH80a6pcCVtpUS1oaNdpB4xuCcD3
         x0X0vcKbzXyjuC0ubiRBr4XS6ZvbHKNKJxX58LwndTgehim2H6ljA9U6Gtd8zk5q1kcK
         UpZqiv0pyvobXaQvxh6rhaNFpRscttC7FHJKMqIJ71E6fIDNmMDqiwm1ghcztcG4Wafb
         PQvLnKClXR8b63BZfS5WG2f13tWAFF3W9eX5WfzjX0/z3t6cHuWh30slLGq2C0d6yIO8
         x4HypwDyhQtCuyNK2S6o1G7xF57iLzFsd+RA3t7L35KUYrEzDCohmMojUM098/rP7U5P
         CTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699979524; x=1700584324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTlDtVgsnwcqvtsJBU/yKayNDVYOQAUQMToAEPEK6Gk=;
        b=riyKYJFAwITcpmpPmqzs9wSIcDC/04RKgLKD16k8JQT+LhD0Fldxf90wbvZWbeXONX
         FNlPze3ebV/aWMQ/yCw1bhdU7+WrL//SlI2rp4NlqiBs4wISSawWSIuEGWZJJf2Ucu0k
         QWeB2Me6QMIiEymMw4X8jX242czk08xVooMN8uIR2m29HNVfubBj9nxJ0DUpH8zpjRTu
         zeAAf0DVzkvcLHrcjb5llUSAYnknRSjhWflRg0aj3U3M6FIM79Lm9m8c3S7PYNKcJonh
         ea/TOxBi9qjRmZiWzaIknMTEQiOvFUDvlCzMFK5MAU7NBbQsgLswa/QlHKj759VeVWQY
         b55w==
X-Gm-Message-State: AOJu0YyYMVZYyKb6kqhgGozr+QgIM+P5rOP5HKTlK/XVlardAqW0GEeO
	3W/GZxL798ohWY26yY0OXd74qujw1JNgRWxBrXc=
X-Google-Smtp-Source: AGHT+IHt381u+VrZTF53LFbjgSQ6v/t56GRcLe7EuiK5Y6nqGj9R0LI6bw4MbxrPYnsq1mWw3maHWw==
X-Received: by 2002:a17:906:3458:b0:9dd:dc2a:eb8b with SMTP id d24-20020a170906345800b009dddc2aeb8bmr6116891ejb.41.1699979523898;
        Tue, 14 Nov 2023 08:32:03 -0800 (PST)
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: [RFC PATCH-for-9.0 6/9] hw/xen/hvm: Initialize xen_physmap QLIST in xen_read_physmap()
Date: Tue, 14 Nov 2023 17:31:20 +0100
Message-ID: <20231114163123.74888-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114163123.74888-1-philmd@linaro.org>
References: <20231114163123.74888-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xen_read_physmap() is the first function requiring
xen_physmap QLIST being initialized. Move the init
call there.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/xen/xen-hvm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 789779d02c..3b9c31c1c8 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -532,6 +532,8 @@ void xen_read_physmap(XenIOState *state)
     char path[80], *value = NULL;
     char **entries = NULL;
 
+    QLIST_INIT(&xen_physmap);
+
     snprintf(path, sizeof(path),
             "/local/domain/0/device-model/%d/physmap", xen_domid);
     entries = xs_directory(state->xenstore, 0, path, &num);
@@ -575,6 +577,7 @@ void xen_read_physmap(XenIOState *state)
 #else
 void xen_read_physmap(XenIOState *state)
 {
+    QLIST_INIT(&xen_physmap);
 }
 #endif
 
@@ -595,7 +598,6 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
 
     xen_register_ioreq(state, max_cpus, &xen_memory_listener);
 
-    QLIST_INIT(&xen_physmap);
     xen_read_physmap(state);
 
     suspend.notify = xen_suspend_notifier;
-- 
2.41.0


