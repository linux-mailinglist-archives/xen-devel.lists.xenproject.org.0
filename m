Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AED16309CA3
	for <lists+xen-devel@lfdr.de>; Sun, 31 Jan 2021 15:18:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79302.144413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6DYs-00019V-KB; Sun, 31 Jan 2021 14:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79302.144413; Sun, 31 Jan 2021 14:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6DYs-000192-Fu; Sun, 31 Jan 2021 14:18:46 +0000
Received: by outflank-mailman (input) for mailman id 79302;
 Sun, 31 Jan 2021 14:18:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jslU=HC=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1l6DYq-0000yx-T3
 for xen-devel@lists.xenproject.org; Sun, 31 Jan 2021 14:18:44 +0000
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1515c68e-53c1-4ef7-b8d8-07d09c37544f;
 Sun, 31 Jan 2021 14:18:34 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id l12so13765813wry.2
 for <xen-devel@lists.xenproject.org>; Sun, 31 Jan 2021 06:18:34 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id f6sm17336054wmq.33.2021.01.31.06.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 06:18:33 -0800 (PST)
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
X-Inumbo-ID: 1515c68e-53c1-4ef7-b8d8-07d09c37544f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bpE49BEtsLvWxkhWr13s7VhmI0D2sTc2+XCVF2CidCI=;
        b=uB/QGQwWtY9HopBuQfnKGc8IoPYcwdRiDY8JENXg7F5rHTduc/rXPl2X15wehao8fc
         clzsOH0l3BXkgtEsAvCcm0CmbqL4PYIdJV3nlV795c7Sn+Toknlt8PmMR9jaLcjgjoSN
         rxxhu3m0m/nb4UG3X/c18DCJktzOfcvXA+PE/VOi5MbKI6oU99oH8H6Dpmn8RdhMPew1
         esmKhjtI0o8eULRI2f+rYDI0iN95yB3B9A0te+uZ27ixRpnuKjvurD+xDkSmgs9N3L5y
         vaChQQszCKo3Q7GHJYppWvxjO0AKCWKCdC/UXcAnKk6G9+SYEHLOoZkMv92Re0LtG537
         K/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=bpE49BEtsLvWxkhWr13s7VhmI0D2sTc2+XCVF2CidCI=;
        b=iDMruYcWUIa2+ECp04s0Ya4DwPODxx5W95McwXi0o9aoGKZUQ02P1LtyVjJ9NTLLc+
         Yt/36SO7lYY65YAoOw+ijKeYlM3Np7iVlyk3ZA+AQcCyEAVyWo0ayUaiH7ZuM/rjlukR
         QD7w4n+xWyxooMr0IE+tKZBE52Z4pEVQAfhAZI0HgsdETx+DJzrPfEUA7WMVnkptDv8E
         25wmQ/MClVkr2LSOzTamvOEARwQMNAObW+k0Hd6VQ2ZMvHA0SHYZgMnz9YRmJNcbUhKd
         DWLUgu3+a3JUdWUoO6uqE9JjcV+cXSUg4zoQNwSW5OeFqLsXEt6TeVmMD6K6O3zbvIif
         mXKg==
X-Gm-Message-State: AOAM530zFCyLxsEyRWb9G/zZaRLHm11RuYqnlaU3RyqniTaSLFodbEQO
	qTj2eZPgVKSg7C8v0/GLK0M=
X-Google-Smtp-Source: ABdhPJzBBMSzW943tZ4qLPuA4oOpVGF9ccuNzluW2ORJmII35xSc9H/h7zo0dFzJWsCEQT7NVhwseA==
X-Received: by 2002:a5d:4a4e:: with SMTP id v14mr13826806wrs.80.1612102713947;
        Sun, 31 Jan 2021 06:18:33 -0800 (PST)
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
Subject: [PATCH v2 4/4] hw/xen: Have Xen machines select 9pfs
Date: Sun, 31 Jan 2021 15:18:10 +0100
Message-Id: <20210131141810.293186-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131141810.293186-1-f4bug@amsat.org>
References: <20210131141810.293186-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

9pfs is not an accelerator feature but a machine one,
move the selection on the machine Kconfig (in hw/).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/Kconfig       | 1 -
 hw/i386/xen/Kconfig | 1 +
 hw/xen/Kconfig      | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/accel/Kconfig b/accel/Kconfig
index 461104c7715..b9e9a2d35b0 100644
--- a/accel/Kconfig
+++ b/accel/Kconfig
@@ -15,4 +15,3 @@ config KVM
 
 config XEN
     bool
-    select FSDEV_9P if VIRTFS
diff --git a/hw/i386/xen/Kconfig b/hw/i386/xen/Kconfig
index ad9d774b9ea..4affd842f28 100644
--- a/hw/i386/xen/Kconfig
+++ b/hw/i386/xen/Kconfig
@@ -3,3 +3,4 @@ config XEN_FV
     default y if XEN
     depends on XEN
     select I440FX
+    select FSDEV_9P if VIRTFS
diff --git a/hw/xen/Kconfig b/hw/xen/Kconfig
index 0b8427d6bd1..825277969fa 100644
--- a/hw/xen/Kconfig
+++ b/hw/xen/Kconfig
@@ -5,3 +5,4 @@ config XEN_PV
     select PCI
     select USB
     select IDE_PIIX
+    select FSDEV_9P if VIRTFS
-- 
2.26.2


