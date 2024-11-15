Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E00AE9CDDD7
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 12:53:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837187.1253248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBut9-000224-Tg; Fri, 15 Nov 2024 11:53:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837187.1253248; Fri, 15 Nov 2024 11:53:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBut8-0001jT-MA; Fri, 15 Nov 2024 11:53:22 +0000
Received: by outflank-mailman (input) for mailman id 837187;
 Fri, 15 Nov 2024 11:53:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akm3=SK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tBut3-0005U9-Ro
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:53:17 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3217a713-a348-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 12:53:14 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aa4833e9c44so87785166b.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:53:14 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0860afsm173492766b.188.2024.11.15.03.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 03:53:13 -0800 (PST)
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
X-Inumbo-ID: 3217a713-a348-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzAiLCJoZWxvIjoibWFpbC1lajEteDYzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjMyMTdhNzEzLWEzNDgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjcxNTk0LjY3MzAwNywic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731671594; x=1732276394; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGLhEwTxqC5XGNE3vexdwFzRd1DT5gLHTbpiHQthKgs=;
        b=aixj6kqoggGMFmWTQOLTYZo28HbmjoTOUv6mtXu7yhF8zZQ24exlgiD032UhNZdvE2
         xv+g4h+uv0PUeVSNYWUPd11HUT5IdK8rFRHZdv66+AivLvzyes76gHnCT9+0D3VnH88x
         fQizSFh59Cci/UbfVGqo+Xbmc3bj7xencqLlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671594; x=1732276394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGLhEwTxqC5XGNE3vexdwFzRd1DT5gLHTbpiHQthKgs=;
        b=FtFVlTExfbODNE5jkyaZ/uKKeQ5zugGYWZ7ABO1rXW1WyxgGRFExpJrOKqn/2RZmNr
         CV24iZy27GjHf0bHpRbW6TEEaDA4FM0/8YP6UTJiuc3zEQRneBkUpKd00ye7dCe5t8YT
         FeDYydUEYca9OdmQ1WRkdu7gNuViLv6eUcpM19sPtjKiClrDYjXGwFjJID3fLdVFSbEt
         2QLX/xyttO724CtX35jf3NqI+Nlj4IWzHRg+XeS6TMhgNRoFojc5uPxpK1CbmzOqRQMs
         HDy5yTQppvwhq1KHiUvNWsc5rqAWsthP21C2Mh7AbOwpB6WaEZj0w44WaLwaPbP3rXzD
         Um2A==
X-Gm-Message-State: AOJu0YypNaQtQTYCdm1evDDU/R5WJ1LC/q3wsmmL/RFiFZOg3qhcwQET
	y3wgcDXikJTqKwZpZvdv+IyvkUV2L7QacBgpgpHAItf2JDp5JghYwKcDEJO9A7jEViSRwG8S8za
	0
X-Google-Smtp-Source: AGHT+IFlQzPLfoakEsrMGH/yEjfZGv9k2/KhyBMVLvwJK0oZD/d0ZH9yGyQOjD/yvsTZZkuoQv0fwg==
X-Received: by 2002:a17:907:3f03:b0:a9a:a891:b43e with SMTP id a640c23a62f3a-aa483555ef6mr204083366b.50.1731671593836;
        Fri, 15 Nov 2024 03:53:13 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH 18/25] xen/riscv: Replace empty xen_arch_domainconfig with autogenerated one
Date: Fri, 15 Nov 2024 11:51:47 +0000
Message-ID: <20241115115200.2824-19-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 .../xenbindgen/extra/arch-riscv/domainconfig.toml  |  4 ++++
 xen/include/public/arch-riscv.h                    |  3 ---
 xen/include/public/autogen/arch_riscv.h            | 14 ++++++++++++++
 3 files changed, 18 insertions(+), 3 deletions(-)
 create mode 100644 tools/rust/xenbindgen/extra/arch-riscv/domainconfig.toml
 create mode 100644 xen/include/public/autogen/arch_riscv.h

diff --git a/tools/rust/xenbindgen/extra/arch-riscv/domainconfig.toml b/tools/rust/xenbindgen/extra/arch-riscv/domainconfig.toml
new file mode 100644
index 000000000000..ecac1ae22b1c
--- /dev/null
+++ b/tools/rust/xenbindgen/extra/arch-riscv/domainconfig.toml
@@ -0,0 +1,4 @@
+[[structs]]
+name = "xen_arch_domainconfig"
+description = "riscv-specific domain settings."
+fields = []
diff --git a/xen/include/public/arch-riscv.h b/xen/include/public/arch-riscv.h
index 168263b92074..a199dbc6a15f 100644
--- a/xen/include/public/arch-riscv.h
+++ b/xen/include/public/arch-riscv.h
@@ -55,9 +55,6 @@ struct vcpu_guest_context {
 typedef struct vcpu_guest_context vcpu_guest_context_t;
 DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 
-struct xen_arch_domainconfig {
-};
-
 #endif
 
 /* TODO:  add a placeholder entry if no real ones surface */
diff --git a/xen/include/public/autogen/arch_riscv.h b/xen/include/public/autogen/arch_riscv.h
new file mode 100644
index 000000000000..e0d3aa681862
--- /dev/null
+++ b/xen/include/public/autogen/arch_riscv.h
@@ -0,0 +1,14 @@
+/*
+ * arch-riscv
+ *
+ * AUTOGENERATED. DO NOT MODIFY
+ */
+#ifndef __XEN_AUTOGEN_ARCH_RISCV_H
+#define __XEN_AUTOGEN_ARCH_RISCV_H
+
+/* riscv-specific domain settings. */
+struct xen_arch_domainconfig {
+};
+
+#endif /* __XEN_AUTOGEN_ARCH_RISCV_H */
+
-- 
2.47.0


