Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 482FD309CA0
	for <lists+xen-devel@lfdr.de>; Sun, 31 Jan 2021 15:18:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79295.144390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6DYY-0000vB-0g; Sun, 31 Jan 2021 14:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79295.144390; Sun, 31 Jan 2021 14:18:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6DYX-0000uc-SK; Sun, 31 Jan 2021 14:18:25 +0000
Received: by outflank-mailman (input) for mailman id 79295;
 Sun, 31 Jan 2021 14:18:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jslU=HC=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1l6DYW-0000oq-VR
 for xen-devel@lists.xenproject.org; Sun, 31 Jan 2021 14:18:25 +0000
Received: from mail-wr1-x430.google.com (unknown [2a00:1450:4864:20::430])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7526a496-1d60-4df7-88f8-b9278fb80465;
 Sun, 31 Jan 2021 14:18:24 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id c12so13756284wrc.7
 for <xen-devel@lists.xenproject.org>; Sun, 31 Jan 2021 06:18:24 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id j11sm7388979wrt.26.2021.01.31.06.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 06:18:22 -0800 (PST)
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
X-Inumbo-ID: 7526a496-1d60-4df7-88f8-b9278fb80465
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8/C2wBPkOLksivQ3Qh5cM4Cv3DQhSM0tZyYKABIck3A=;
        b=Abi8vCCCegDWl0lzMRTsGHNbIjQZXLt7yDGK2fASYSfw1gYXYjzbtqPOq5/vFrtHBd
         wh+SKn4jnxhP9ASHbizjj6/R4j+Ft6eu9a86eox88G7VBG2l1qll1eYHrsKYO96CJeA6
         rrbf1my24DwKlk1dN/C4NYJGjm9UvCnTi2X/DzhEoV04wxiM4iVr8aCBCmaAO3mcyE+7
         LouxVucmK9u5Ejp8A8oC+jgZNA3fPSQhhIFgR4Ptxrddoi9MTCt8jqgAXmibqjnp4OML
         pEOGI8G+YEzTQzSdnt6oyN4sq+DmwcEQitTu/+ocEkiKUkYM/die06S1JGnZUKGLyD6F
         JnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=8/C2wBPkOLksivQ3Qh5cM4Cv3DQhSM0tZyYKABIck3A=;
        b=ekfmNc2xTxtDpjYyZmuupCCyppaEkJRoH2cMTjACWRILntt5C1iZxXdtVcCWsKN5Nk
         vuhn1vuqz8wJ++00WkGTjcFHjHlQzGUtFgnx1moCQBB1uQK/zsiTGmaUP++KuvWIh/4u
         7YZ5Md/UX6gub4xUTBYItOBskQHmEHZMTXC21xRC3N0OlXTwBurX6HWZa8zHLH/Cg5u9
         h4eq4n4qsNJ+skARZXVAy5ExWHSHJlinB+qXdksRPzAZfRpLhrkQPqAMJSAHGVRBgph/
         meuo0uGuAhjcR6yyAhLpkhxLXhZE3J6reaWCwjnTjY1kt6HoNY0VkioUBHZTjP4IYJew
         zTcA==
X-Gm-Message-State: AOAM530NGWKrho5jVZ/xHvbsSnr+j4qSbTEPG+5R6l4Z0BDAPUCLeGxc
	BUYkYfl609w0QJi0o/pp1IQ=
X-Google-Smtp-Source: ABdhPJwK6oVXD4xaBk7Pk7+dbYCtqWB53ps7AVQjh+jJoJfZDiB1Zi72R8clzFa9uSxh2oxJ3CzJHg==
X-Received: by 2002:adf:f905:: with SMTP id b5mr13340084wrr.129.1612102703525;
        Sun, 31 Jan 2021 06:18:23 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Anthony Perard <anthony.perard@citrix.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 2/4] hw/i386/xen: Introduce XEN_FV Kconfig
Date: Sun, 31 Jan 2021 15:18:08 +0100
Message-Id: <20210131141810.293186-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131141810.293186-1-f4bug@amsat.org>
References: <20210131141810.293186-1-f4bug@amsat.org>
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
index be84130300c..082d0f02cf3 100644
--- a/hw/i386/xen/meson.build
+++ b/hw/i386/xen/meson.build
@@ -1,4 +1,4 @@
-i386_ss.add(when: 'CONFIG_XEN', if_true: files(
+i386_ss.add(when: 'CONFIG_XEN_FV', if_true: files(
   'xen-hvm.c',
   'xen-mapcache.c',
   'xen_apic.c',
-- 
2.26.2


