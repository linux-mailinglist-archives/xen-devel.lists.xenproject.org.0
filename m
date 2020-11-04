Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD142A63BC
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 12:58:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19047.44244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaHPq-000644-Bk; Wed, 04 Nov 2020 11:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19047.44244; Wed, 04 Nov 2020 11:57:26 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaHPq-00063f-8k; Wed, 04 Nov 2020 11:57:26 +0000
Received: by outflank-mailman (input) for mailman id 19047;
 Wed, 04 Nov 2020 11:57:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ed9z=EK=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kaHPo-00063a-Uv
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 11:57:24 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 9e9b505c-a2b5-4078-b703-916355afe2e0;
 Wed, 04 Nov 2020 11:57:22 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-lXrsdjXUNr6oVqL82Kh_Qw-1; Wed, 04 Nov 2020 06:57:21 -0500
Received: by mail-wm1-f72.google.com with SMTP id z62so1075200wmb.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2020 03:57:20 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id a15sm2226651wrn.75.2020.11.04.03.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 03:57:19 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ed9z=EK=redhat.com=philmd@srs-us1.protection.inumbo.net>)
	id 1kaHPo-00063a-Uv
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 11:57:24 +0000
X-Inumbo-ID: 9e9b505c-a2b5-4078-b703-916355afe2e0
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 9e9b505c-a2b5-4078-b703-916355afe2e0;
	Wed, 04 Nov 2020 11:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604491042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vFU0pp+sAaUJV7Uz07XCo0kf/Xpwz4nVfgdLF0eVzjo=;
	b=A2Q5cLB16LgatLO82KUyTVd0znum1wT4xpXBjREVW5nYKlnuqjjFZt0+7V/vyR7266AFAQ
	pUS4ZspjH/xuiM2ku8YpJvnrAxSa9MYu7BEUgrm4bdl9BLXeWHhVuRSKQ0zncnlT4zZ/Nb
	MTwjTitggtTT6nbXdQdktYxbL1qTMS0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-lXrsdjXUNr6oVqL82Kh_Qw-1; Wed, 04 Nov 2020 06:57:21 -0500
X-MC-Unique: lXrsdjXUNr6oVqL82Kh_Qw-1
Received: by mail-wm1-f72.google.com with SMTP id z62so1075200wmb.1
        for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2020 03:57:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vFU0pp+sAaUJV7Uz07XCo0kf/Xpwz4nVfgdLF0eVzjo=;
        b=Zw+CDmgVJ+lngKkQWpBI2cjtNXltnLgouh7vzcrvoixLgDbOT+CCMt7JKSBMK+S3fr
         BYdXeyTWwN6bgrVzZ/PXwM9oPwByN5utUz2jZw7DlY6wt+u4G/QckLoIBZ0+40oiYeaq
         kyHTbQpz9MRaJ9xJ5pkB4H+uONWolnPi++8KssBcEW2HwVDbAKOgblEqwfHsatzSRFLN
         p9C6rglMeM3krFBFE9MDOrdC1I5mgMltSchnPbkqprbyVkHnhOBbHXf1pOvYIeao5XHO
         05pu3Hp8EcK31/FBfHVeiuhsDJpv7Wk6sfzxnn7bxZirv+AIICXkIcBltykOaLURbxCQ
         +77Q==
X-Gm-Message-State: AOAM530AkhZEpXbn3OQxweTXBS6auHahdZ1cmtYeOXWgPnx2Kl8spL77
	NAS7hiqKMATh1++Ecuvy68uZ+X79Rp+70OtPxUowwM/w72TFbGjCjdyIOgyKTtmk7zviGT447xw
	JiZigue0R54F9eLUuoc3lVPMw2gI=
X-Received: by 2002:adf:f20e:: with SMTP id p14mr30747724wro.376.1604491039884;
        Wed, 04 Nov 2020 03:57:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6O/flHIYR/UleClnQnn4DXbprA02Qdr+LmWU88GsHun8X3K1oAsLw14FXKYMM+joIbNDW6A==
X-Received: by 2002:adf:f20e:: with SMTP id p14mr30747702wro.376.1604491039757;
        Wed, 04 Nov 2020 03:57:19 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.234])
        by smtp.gmail.com with ESMTPSA id a15sm2226651wrn.75.2020.11.04.03.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 03:57:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Thomas Huth <thuth@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Fam Zheng <fam@euphon.net>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Greg Kurz <groug@kaod.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH-for-5.2 v3 2/4] hw/9pfs: Fix Kconfig dependency problem between 9pfs and Xen
Date: Wed,  4 Nov 2020 12:57:04 +0100
Message-Id: <20201104115706.3101190-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201104115706.3101190-1-philmd@redhat.com>
References: <20201104115706.3101190-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit b2c00bce54c ("meson: convert hw/9pfs, cleanup") introduced
CONFIG_9PFS (probably a wrong conflict resolution). This config is
not used anywhere. Backends depend on CONFIG_FSDEV_9P which itself
depends on CONFIG_VIRTFS.

Remove the invalid CONFIG_9PFS and use CONFIG_FSDEV_9P instead, to
fix the './configure --without-default-devices --enable-xen' build:

  /usr/bin/ld: libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in function `xen_be_register_common':
  hw/xen/xen-legacy-backend.c:754: undefined reference to `xen_9pfs_ops'
  /usr/bin/ld: libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x8): undefined reference to `local_ops'
  /usr/bin/ld: libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x20): undefined reference to `synth_ops'
  /usr/bin/ld: libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x38): undefined reference to `proxy_ops'
  collect2: error: ld returned 1 exit status

Fixes: b2c00bce54c ("meson: convert hw/9pfs, cleanup")
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: Greg Kurz <groug@kaod.org>
Tested-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2: Reworded description (Greg)

Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org
Cc: Greg Kurz <groug@kaod.org>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/Kconfig     | 4 ----
 hw/9pfs/meson.build | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/hw/9pfs/Kconfig b/hw/9pfs/Kconfig
index d3ebd737301..3ae57496613 100644
--- a/hw/9pfs/Kconfig
+++ b/hw/9pfs/Kconfig
@@ -2,12 +2,8 @@ config FSDEV_9P
     bool
     depends on VIRTFS
 
-config 9PFS
-    bool
-
 config VIRTIO_9P
     bool
     default y
     depends on VIRTFS && VIRTIO
     select FSDEV_9P
-    select 9PFS
diff --git a/hw/9pfs/meson.build b/hw/9pfs/meson.build
index cc094262122..99be5d91196 100644
--- a/hw/9pfs/meson.build
+++ b/hw/9pfs/meson.build
@@ -15,6 +15,6 @@
   'coxattr.c',
 ))
 fs_ss.add(when: 'CONFIG_XEN', if_true: files('xen-9p-backend.c'))
-softmmu_ss.add_all(when: 'CONFIG_9PFS', if_true: fs_ss)
+softmmu_ss.add_all(when: 'CONFIG_FSDEV_9P', if_true: fs_ss)
 
 specific_ss.add(when: 'CONFIG_VIRTIO_9P', if_true: files('virtio-9p-device.c'))
-- 
2.26.2


