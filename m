Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E279030A683
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 12:29:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79771.145289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6XOP-0002aY-Ky; Mon, 01 Feb 2021 11:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79771.145289; Mon, 01 Feb 2021 11:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6XOP-0002Zw-FP; Mon, 01 Feb 2021 11:29:17 +0000
Received: by outflank-mailman (input) for mailman id 79771;
 Mon, 01 Feb 2021 11:29:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUbX=HD=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1l6XON-0002Y2-BJ
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 11:29:15 +0000
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2826e767-af4e-40bf-875f-db97620a9052;
 Mon, 01 Feb 2021 11:29:14 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id o10so11297372wmc.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 03:29:14 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id f4sm26998449wrs.34.2021.02.01.03.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:29:13 -0800 (PST)
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
X-Inumbo-ID: 2826e767-af4e-40bf-875f-db97620a9052
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=donqcXl7R+CymjCL8vc7v5IAilQU7H4mg0fNs68sCzA=;
        b=e5igdUOKRu+nuBY0Zu2Ohn5JfnspcW8pqSPyZT4CaQx7HCrrRF6/uOf16FFra0u+BJ
         Ip2eqn5lYrT8So/ZzTJBuOK58LV2uQ5OvMNgRK5m2cMRvTX/49GjhKxORVzEa4eJrH74
         C4rzdb13gibI6wNTUMXHZhK73uON9FKBUZnBJhiYzLyhWkCmOv7h2ZqS35nM2cwMg30D
         FH5wZcwae4yATnosrM5VXNPMx3HwFM9aanKYq4QURPzWTywVp1ERBuFqs6BnMYJqn7N5
         PcaTnrymB0a7DiW8jS1VFjqewxxHRSRqy9WA89Acn/1D/R6X3o5X5PvPGCkMXM1ctXvg
         FHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=donqcXl7R+CymjCL8vc7v5IAilQU7H4mg0fNs68sCzA=;
        b=cztcXdWNGfHSeS6hA7wpeny0ZIAnxRsV+96Ja3ZGIcB4n5Mow0BDVkMojRXmc98x/W
         UYer16kpUOLYnlJCBMGbo75f0Rla3omsv8KD0IZnUDCa2V0VgKK+ooShR3XHSq/MO7qJ
         Cv8N614tMRCLjwPK3TEt+Ock6IvP5+H5CoPO7c/aVqtWMzIyYqfCkIuI6VX0V1+/XcCX
         ryd3h4QSK8xP2G0f6r9+1os90pn8KF+1DRvzjCCCMmA/GsQY/X7u+nAdQbUZEQUIZzqk
         RsKNMqWQF41w2zvQsXiasmxdk1PybtfNSLolKhSYF6I8eOTcqJEbBtAlSSTorlqpikTj
         Fe+Q==
X-Gm-Message-State: AOAM533p2qcePZH52MbzPVrZvToUk+7Qm7Sz2moy2aHgZktf02b+sleq
	HH4C5UeFJb6G5r9JReyc6OY=
X-Google-Smtp-Source: ABdhPJx1pElW3YJm/WsOQahhG2HH5xZse6fgcEBep2dVSJwz1qWS4aDb1550CqyGQkCPJFpsp90m2g==
X-Received: by 2002:a7b:c09a:: with SMTP id r26mr1225594wmh.60.1612178953873;
        Mon, 01 Feb 2021 03:29:13 -0800 (PST)
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
Subject: [PATCH v3 1/7] meson: Do not build Xen x86_64-softmmu on Aarch64
Date: Mon,  1 Feb 2021 12:28:59 +0100
Message-Id: <20210201112905.545144-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210201112905.545144-1-f4bug@amsat.org>
References: <20210201112905.545144-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Xen on ARM documentation only mentions the i386-softmmu
target. As the x86_64-softmmu doesn't seem used, remove it
to avoid wasting cpu cycles building it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index f00b7754fd4..97a577a7743 100644
--- a/meson.build
+++ b/meson.build
@@ -74,10 +74,10 @@
 endif
 
 accelerator_targets = { 'CONFIG_KVM': kvm_targets }
-if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
+if cpu in ['arm', 'aarch64']
   # i368 emulator provides xenpv machine type for multiple architectures
   accelerator_targets += {
-    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
+    'CONFIG_XEN': ['i386-softmmu'],
   }
 endif
 if cpu in ['x86', 'x86_64']
@@ -85,6 +85,7 @@
     'CONFIG_HAX': ['i386-softmmu', 'x86_64-softmmu'],
     'CONFIG_HVF': ['x86_64-softmmu'],
     'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
+    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
   }
 endif
 
-- 
2.26.2


