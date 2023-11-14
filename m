Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7646E7EB4DB
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 17:32:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632940.987485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2wKW-0004G9-3v; Tue, 14 Nov 2023 16:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632940.987485; Tue, 14 Nov 2023 16:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2wKV-0004Dy-Vn; Tue, 14 Nov 2023 16:31:59 +0000
Received: by outflank-mailman (input) for mailman id 632940;
 Tue, 14 Nov 2023 16:31:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2wKU-0002Oz-NA
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 16:31:58 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54908170-830b-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 17:31:58 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-507a98517f3so7716957e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 08:31:58 -0800 (PST)
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 c19-20020a50f613000000b00542d3e470f9sm5386152edn.10.2023.11.14.08.31.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Nov 2023 08:31:57 -0800 (PST)
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
X-Inumbo-ID: 54908170-830b-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699979518; x=1700584318; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3H+/pStoCerFaavD4+6+pbKHikmNIDPKszX2p8LZLs8=;
        b=o/OPdGQn4KcF5VVKQ0LWuogs5ExlPRxZPFqJXgi8kjyDO6uFoV6gH0FM2D+L0rzeVA
         gEBJHtbgMJFIyULkBjuydwU7v1Iuk1YWLqoKx4pmIJHYuR2nJSpiae1DBdeDSJ1R7niK
         9q4v352CJRZ2aLYTqZZnoB5SXq/MaRX5rKSNDzD3P7k8KdDfCftETxf0u6vCsaQ+ORCn
         piTOLlujWDch8XkYqWpOCRx1TYlx/2w/RRLgGQ5NPdVF8xarUIekU0zNESDOtOMpCWQP
         UAC1QNzXXTYwVUQjJWZ2RbLtvHYLcbxyxJUL2SuqLFNGcfX62o5vj3k+pXcjz2DxnWH/
         3z9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699979518; x=1700584318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3H+/pStoCerFaavD4+6+pbKHikmNIDPKszX2p8LZLs8=;
        b=P0xFNq5bo7XJS10wA4BV/FmEzedACuku6sxTSxlop6iigzlPYK7NDz6vFdsxSK1lN4
         EKe+jKeu3wjLoF+a1U38Y7Qd50eR8jgT0r7rWlLiWiu4TBYm3XwgBVmt3GemLnkOblCX
         c6ZAaH4uF2My4Gg3BZN+/A292ZVLq6avmKx35QwoJ0FKh9JFSURYOq2A33e9yN08qFqp
         A+CaMbJYDc3Ea1JFZ+JvvtkDW4+VO7ttOc6Ngp5fXtUTvQ6mLP+m8vBI+swnYtfyQhOs
         KmK7Py4L+SXsNoBrju3JsYFeI2rXO2oz6LKk59j7xZ2RZgBk4z9aqpHHlPC2Abs4raZR
         K60w==
X-Gm-Message-State: AOJu0YwV1NupNyMpOA4xw9fKyElm+ROzvElDf5n5qNxgai3o+gtBE5jW
	i5Ye4Ih299NBhExIWF8vzpsyqg==
X-Google-Smtp-Source: AGHT+IFU6wDkoylQ5/58cZgzmE5wfkRGyUxVY57V7J9SRhQ2EOS6zAeN62VBuenc3iIc8vTnT/LH0w==
X-Received: by 2002:a19:9103:0:b0:507:9f4c:b72 with SMTP id t3-20020a199103000000b005079f4c0b72mr5872272lfd.15.1699979517897;
        Tue, 14 Nov 2023 08:31:57 -0800 (PST)
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
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH-for-9.0 5/9] hw/xen/hvm: Expose xen_read_physmap() prototype
Date: Tue, 14 Nov 2023 17:31:19 +0100
Message-ID: <20231114163123.74888-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114163123.74888-1-philmd@linaro.org>
References: <20231114163123.74888-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In a pair of commit we are going to call xen_read_physmap()
out of hw/i386/xen/xen-hvm.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/xen/xen-hvm-common.h | 1 +
 hw/i386/xen/xen-hvm.c           | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
index 0fed15ed04..536712dc83 100644
--- a/include/hw/xen/xen-hvm-common.h
+++ b/include/hw/xen/xen-hvm-common.h
@@ -97,6 +97,7 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
 
 void cpu_ioreq_pio(ioreq_t *req);
 
+void xen_read_physmap(XenIOState *state);
 void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req);
 void xen_arch_set_memory(XenIOState *state,
                          MemoryRegionSection *section,
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index a65a96f0de..789779d02c 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -525,7 +525,7 @@ static void handle_vmport_ioreq(XenIOState *state, ioreq_t *req)
 }
 
 #ifdef XEN_COMPAT_PHYSMAP
-static void xen_read_physmap(XenIOState *state)
+void xen_read_physmap(XenIOState *state)
 {
     XenPhysmap *physmap = NULL;
     unsigned int len, num, i;
@@ -573,7 +573,7 @@ static void xen_read_physmap(XenIOState *state)
     free(entries);
 }
 #else
-static void xen_read_physmap(XenIOState *state)
+void xen_read_physmap(XenIOState *state)
 {
 }
 #endif
-- 
2.41.0


