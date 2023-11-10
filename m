Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0F07E7DCA
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:31:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630615.983693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPO-0007B5-4T; Fri, 10 Nov 2023 16:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630615.983693; Fri, 10 Nov 2023 16:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPN-00074G-TH; Fri, 10 Nov 2023 16:31:01 +0000
Received: by outflank-mailman (input) for mailman id 630615;
 Fri, 10 Nov 2023 16:31:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zww5=GX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r1UPM-0005Bj-Gv
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:31:00 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87933319-7fe6-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 17:30:59 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9d2d8343dc4so376420666b.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Nov 2023 08:30:59 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 lv19-20020a170906bc9300b009a9fbeb15f5sm4128966ejb.46.2023.11.10.08.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 08:30:58 -0800 (PST)
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
X-Inumbo-ID: 87933319-7fe6-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699633858; x=1700238658; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbj4r6F42J2p6p5PO7TAcYWIgSd4H4ZMKYzy5fPGOm8=;
        b=aBrrTrEjqbJkH/R30lwOjUTrQf73ahtP9pxuC5taXNv76jkBbknpRK/T68q6qSGgNH
         3N+cx1n7flfO7WfZeXkquheN/NhZeiS83tGcTo5Km/bv1y8Ew3Xp4JV/1CJvNIndhDb0
         FKgfKafYFgRW7TuPZMZKKlXkXB0N5zHCOGITAxdwquwyVtfukZ0eg0KgRyFc7PU6C77J
         MnQPg6cd7Du4nsbTHSlpTdZS+4jGKWFe1z9E369IfFEBQ+sgALJ1bpsBpb6KgbeAsnkO
         PUoHzNa0yBGOPAgOWFA2f17tWV/VYq8JLUmyZTWfTWlyl5oFOimQH1j2z6UPmKl9B2xK
         p09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699633858; x=1700238658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbj4r6F42J2p6p5PO7TAcYWIgSd4H4ZMKYzy5fPGOm8=;
        b=MGAK+IbTiBQ7smioj9QWsv62uEEW3YBB5LVMC0oFxDdgR2Bop8C9Qtq6PkusCnDIqX
         Hl46m8miNuIS5KykhpDmn9rR2C0jK0Nw7lLtGJ8Tu+uSn+MViGLhwN1ytsOirXud/oK2
         f/rJKtHx22L40ZQz/EiNFebl08gjivtKGSIUNwFxMcSzK3A9mozSmwfRE2Hp/61PXk0x
         75TZ0BmKY3tOo3s5pBv6ai3A7haLTY4dyaGIhSG8cQjsAVMcLZvN1fPqlUUI3imy8d75
         +brdmZyPAHiiUmRDvxUKtGi91K2wNI4e+Z0Dq9Fd5BsdQpP5erP/Y0Bw3M/YzX6J6gfM
         4Lvw==
X-Gm-Message-State: AOJu0Yxc+u5tLeWYAetPVb+x+oyKAXMZvtVqBna4B0ayhRwFnIB2V6ZI
	L3itVkQz7Q7t4L8Y19owNq9pj9EcRp4=
X-Google-Smtp-Source: AGHT+IGsa8twXDGG2hoSMFk+2SIC+kfI+GZb2IA+wGpfAFJqj9EPCHGgl6OdoxHMLEnrPXHAOyVEFg==
X-Received: by 2002:a17:906:4fc7:b0:9ad:8aac:362b with SMTP id i7-20020a1709064fc700b009ad8aac362bmr7968848ejw.23.1699633858309;
        Fri, 10 Nov 2023 08:30:58 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 07/15] xen/asm-generic: introduce stub header <asm/random.h>
Date: Fri, 10 Nov 2023 18:30:33 +0200
Message-ID: <2464c6b984d187207fe76453bd05502d288af4f9.1699633310.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699633310.git.oleksii.kurochko@gmail.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<asm/random.h> is common for Arm, PPC and RISC-V thereby it
is moved to asm-generic.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - update the commit messages
---
 xen/include/asm-generic/random.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 xen/include/asm-generic/random.h

diff --git a/xen/include/asm-generic/random.h b/xen/include/asm-generic/random.h
new file mode 100644
index 0000000000..cd2307e70b
--- /dev/null
+++ b/xen/include/asm-generic/random.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_RANDOM_H__
+#define __ASM_GENERIC_RANDOM_H__
+
+static inline unsigned int arch_get_random(void)
+{
+    return 0;
+}
+
+#endif /* __ASM_GENERIC_RANDOM_H__ */
+
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: BSD
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.41.0


