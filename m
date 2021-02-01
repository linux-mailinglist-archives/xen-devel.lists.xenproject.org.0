Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C88830A685
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 12:29:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79774.145325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6XOf-0002qi-LU; Mon, 01 Feb 2021 11:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79774.145325; Mon, 01 Feb 2021 11:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6XOf-0002pj-Gl; Mon, 01 Feb 2021 11:29:33 +0000
Received: by outflank-mailman (input) for mailman id 79774;
 Mon, 01 Feb 2021 11:29:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUbX=HD=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1l6XOe-0002mv-1S
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 11:29:32 +0000
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29a3a60d-7caa-4bd4-ba58-bd1247de4c2d;
 Mon, 01 Feb 2021 11:29:31 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id l12so16189174wry.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 03:29:31 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id o124sm21363300wmb.5.2021.02.01.03.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:29:30 -0800 (PST)
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
X-Inumbo-ID: 29a3a60d-7caa-4bd4-ba58-bd1247de4c2d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TsrsxDQVz5tygrPJnMSHXRKo3FHIhV5VlahOLojrTSs=;
        b=tdY/GT4s+Svs7EsgQ8L7VZEN1EU3auIv2pg9z7H40kDst9zeyUzRC0p5gOsl8bvrpe
         YEfky/hcCoc8afoXnaLPVYRZxcU/v8rs/k6MaSMzq+ctcEKeAEQchfrjelV4MrfHwi0D
         eC1Rwq0VU0EF2HasdLW5V7eFRpwPFIhTKRmnxU3el+nAOKtdZ98sCrKCVIybhaq+xOC2
         W1yQWSaG7E6lhP016iJy6W+p1SEDmo8wCHivGUSQQBQIjoJ5GdDEc2vIbE170r2MxnPF
         gPKC/tKyGsVI8pq30CfaNfuu6QhMNJ6IKY0QfXPEW0jFuOpChYSTPDJDreWcOvCxTkpk
         arbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=TsrsxDQVz5tygrPJnMSHXRKo3FHIhV5VlahOLojrTSs=;
        b=ill1FsUN/50ORfYoW2yWZQN/GStXFjWrvEDvR5sj9hwAgfKcSr0kfjYPUOI6wutlZP
         Mn0pAQJsAD0XMZYQMNv4KAgZAqTFcrdSt83p7lkkiHsXbwfO/wvgh+GHJLhgvGwJyGr7
         CRW+1xhuAke233/zuxtMGMlibozOR1WySofhkat9UoEApHKCpJReQiwr3QtM0osd4B55
         33QkpoKjqdj7i5G7SbqTC9rbzu9+Pe7EBNiXcpFXapIaF5htr5l18qQTSFDH2CWHbsnY
         0MfDVEN4XGffR3ojYbpOF0l/QXKu0VLMM3b+miAe5k91i93w6NFkWVAc+jqjpfC/dn9u
         d9Yw==
X-Gm-Message-State: AOAM5313DvY5v5z02cwWV/Q5uhYkkhNmJj/JoyL9RNhb+KsMueAJo/vt
	jNg5BBGJWKn9kh9Bn1RwaDs=
X-Google-Smtp-Source: ABdhPJyJ59H9X2zflNDtn/k6K0IuGMyavaSeLpb40ogb98MM80P8GyEJQcxbrbHoCIm5tQ98H9B8gw==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr17953783wrd.296.1612178970576;
        Mon, 01 Feb 2021 03:29:30 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 4/7] hw/i386/xen: Introduce XEN_FV Kconfig
Date: Mon,  1 Feb 2021 12:29:02 +0100
Message-Id: <20210201112905.545144-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210201112905.545144-1-f4bug@amsat.org>
References: <20210201112905.545144-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce XEN_FV to differency the machine from the accelerator.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/Kconfig         | 2 ++
 hw/i386/xen/Kconfig     | 5 +++++
 hw/i386/xen/meson.build | 2 +-
 3 files changed, 8 insertions(+), 1 deletion(-)
 create mode 100644 hw/i386/xen/Kconfig

diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 7f91f30877f..b4c8aa5c242 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -1,3 +1,5 @@
+source xen/Kconfig
+
 config SEV
     bool
     depends on KVM
diff --git a/hw/i386/xen/Kconfig b/hw/i386/xen/Kconfig
new file mode 100644
index 00000000000..ad9d774b9ea
--- /dev/null
+++ b/hw/i386/xen/Kconfig
@@ -0,0 +1,5 @@
+config XEN_FV
+    bool
+    default y if XEN
+    depends on XEN
+    select I440FX
diff --git a/hw/i386/xen/meson.build b/hw/i386/xen/meson.build
index 2fcc46e6ca1..37716b42673 100644
--- a/hw/i386/xen/meson.build
+++ b/hw/i386/xen/meson.build
@@ -1,4 +1,4 @@
-i386_ss.add(when: 'CONFIG_XEN', if_true: files(
+i386_ss.add(when: 'CONFIG_XEN_FV', if_true: files(
   'xen-hvm.c',
   'xen_apic.c',
   'xen_platform.c',
-- 
2.26.2


