Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C364C2A5FD0
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 09:44:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18891.43972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaEOQ-00041E-MZ; Wed, 04 Nov 2020 08:43:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18891.43972; Wed, 04 Nov 2020 08:43:46 +0000
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
	id 1kaEOQ-00040p-JE; Wed, 04 Nov 2020 08:43:46 +0000
Received: by outflank-mailman (input) for mailman id 18891;
 Wed, 04 Nov 2020 08:43:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ed9z=EK=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kaEOP-00040k-Ky
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 08:43:45 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 68352186-03c0-4acc-91a3-a38114ed8126;
 Wed, 04 Nov 2020 08:43:44 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-RJP7EuIzPaOQZilfVSpIUQ-1; Wed, 04 Nov 2020 03:43:42 -0500
Received: by mail-wr1-f71.google.com with SMTP id p12so1453748wrx.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2020 00:43:42 -0800 (PST)
Received: from localhost.localdomain (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id u5sm1311657wml.13.2020.11.04.00.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 00:43:40 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ed9z=EK=redhat.com=philmd@srs-us1.protection.inumbo.net>)
	id 1kaEOP-00040k-Ky
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 08:43:45 +0000
X-Inumbo-ID: 68352186-03c0-4acc-91a3-a38114ed8126
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 68352186-03c0-4acc-91a3-a38114ed8126;
	Wed, 04 Nov 2020 08:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604479424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AINBmnp1bWLA1LEpK/rcM7CoffR1YWyCikg181rfSi4=;
	b=JlOwjAsBoxX4KdjWUg+aAwhAOsmaDxiv5iMXa7iMHzscaHs6ktPZv0PLMXhj3YIWPQAgFe
	JKTBnlHNknkrG+1/5NffNkmMm+jf7KYPp2MrZOp6/dThVfZ+gREr8rReCfiD2ugFAuit3B
	7qBOFg4YntVyxXIirTBD8Wzm8DH9xBs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-RJP7EuIzPaOQZilfVSpIUQ-1; Wed, 04 Nov 2020 03:43:42 -0500
X-MC-Unique: RJP7EuIzPaOQZilfVSpIUQ-1
Received: by mail-wr1-f71.google.com with SMTP id p12so1453748wrx.3
        for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2020 00:43:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AINBmnp1bWLA1LEpK/rcM7CoffR1YWyCikg181rfSi4=;
        b=b0wDPtauIvQG5ODGzeD11rOdnmZu03SCZWvs9rsWlgVs6qD6jlcDxbaVVeaaK5t47E
         w2ASsy8p/lKJVIp26Rb/Ur5BDpKadeCDsWYH12uYkDreLG0eKpkneODVaGkMwy+0MJkz
         BC+jiMaMq/BATCyelTJCnGo+/SgiBCJ0e58j1k/XJZJUONmBmMECbaBfi6bK4hOkngRq
         nKgIhtyiQ1kNni44wli5Qqdyti/vHHXisCEMmNq5b6UtB7M8gM/Za/DlVulzPfmT+Tza
         qu8Dbj8AY+yvM+hZlynMrm2nWobx0XlRMuPravOGNb6decsHtoT7CLV441mh3QRqz7K8
         2dFA==
X-Gm-Message-State: AOAM532aHFpx5fPjazEi5WA8FyCDGBliOBIBub3RddYD5C+fOfubmMV9
	Elrm/E0B/kJ4roGEGVMTmZmHxYuNjgZT4wzOd8ZsOvD7etEJOvpFSD7w32zRa3J1SRSq/XAlS+Q
	NOZwiZLCZOLk1TJQTdHkpTnevPKY=
X-Received: by 2002:a1c:6782:: with SMTP id b124mr3528113wmc.117.1604479421393;
        Wed, 04 Nov 2020 00:43:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyO4zhDM8ZE9YI+Bb3lljj4jjXBr4C5MlBdNUU1BGAXUMIJaqRRVxrwdwAf4OskguQTBvWGag==
X-Received: by 2002:a1c:6782:: with SMTP id b124mr3528078wmc.117.1604479421239;
        Wed, 04 Nov 2020 00:43:41 -0800 (PST)
Received: from localhost.localdomain (234.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.234])
        by smtp.gmail.com with ESMTPSA id u5sm1311657wml.13.2020.11.04.00.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 00:43:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
	Greg Kurz <groug@kaod.org>,
	Fam Zheng <fam@euphon.net>,
	Richard Henderson <rth@twiddle.net>,
	Cornelia Huck <cohuck@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	qemu-s390x@nongnu.org,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH-for-5.2 v2 2/4] hw/9pfs: Fix Kconfig dependency problem between 9pfs and Xen
Date: Wed,  4 Nov 2020 09:43:25 +0100
Message-Id: <20201104084327.3010593-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201104084327.3010593-1-philmd@redhat.com>
References: <20201104084327.3010593-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes './configure --without-default-devices --enable-xen' build:

  /usr/bin/ld: libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in function `xen_be_register_common':
  hw/xen/xen-legacy-backend.c:754: undefined reference to `xen_9pfs_ops'
  /usr/bin/ld: libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x8): undefined reference to `local_ops'
  /usr/bin/ld: libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x20): undefined reference to `synth_ops'
  /usr/bin/ld: libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x38): undefined reference to `proxy_ops'
  collect2: error: ld returned 1 exit status

Fixes: b2c00bce54c ("meson: convert hw/9pfs, cleanup")
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
I'm not sure b2c00bce54c is the real culprit

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


