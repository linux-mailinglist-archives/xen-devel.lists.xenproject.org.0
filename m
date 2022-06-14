Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD50454B041
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 14:16:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348871.575131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o15TB-0001ri-Nw; Tue, 14 Jun 2022 12:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348871.575131; Tue, 14 Jun 2022 12:16:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o15TB-0001e8-9u; Tue, 14 Jun 2022 12:16:29 +0000
Received: by outflank-mailman (input) for mailman id 348871;
 Tue, 14 Jun 2022 12:16:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hf0K=WV=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1o15T8-0008Ek-Vy
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 12:16:27 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce949b87-ebdb-11ec-bd2c-47488cf2e6aa;
 Tue, 14 Jun 2022 14:16:24 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-D6qPa_PhO0qFlLmH-rztdw-1; Tue, 14 Jun 2022 08:16:18 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CD253C025CE;
 Tue, 14 Jun 2022 12:16:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43577C53360;
 Tue, 14 Jun 2022 12:16:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 48BBC1800620; Tue, 14 Jun 2022 14:16:11 +0200 (CEST)
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
X-Inumbo-ID: ce949b87-ebdb-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655208983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HZ4OtpGl92/4vTO64NR8x1+3AJHChGb6d9Bq7oyIeKQ=;
	b=AEZGA9QmHFlvx96HFAhkp4w+MXKeuVWO/cWRX1D9/uUfwUdL6iuXNbIhL/vyA8kYzENQ+v
	F7lNqB0NKc/SZe8h5h5sNc7I6RE34HSxJgJDFN7rBm4h2AeKqw+rCV9feDunPxryvBYinA
	/+2JN/7NhRd1iVg6TJq/SAFwariEVHY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655208983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HZ4OtpGl92/4vTO64NR8x1+3AJHChGb6d9Bq7oyIeKQ=;
	b=AEZGA9QmHFlvx96HFAhkp4w+MXKeuVWO/cWRX1D9/uUfwUdL6iuXNbIhL/vyA8kYzENQ+v
	F7lNqB0NKc/SZe8h5h5sNc7I6RE34HSxJgJDFN7rBm4h2AeKqw+rCV9feDunPxryvBYinA
	/+2JN/7NhRd1iVg6TJq/SAFwariEVHY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655208983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HZ4OtpGl92/4vTO64NR8x1+3AJHChGb6d9Bq7oyIeKQ=;
	b=AEZGA9QmHFlvx96HFAhkp4w+MXKeuVWO/cWRX1D9/uUfwUdL6iuXNbIhL/vyA8kYzENQ+v
	F7lNqB0NKc/SZe8h5h5sNc7I6RE34HSxJgJDFN7rBm4h2AeKqw+rCV9feDunPxryvBYinA
	/+2JN/7NhRd1iVg6TJq/SAFwariEVHY=
X-MC-Unique: D6qPa_PhO0qFlLmH-rztdw-1
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	xen-devel@lists.xenproject.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"Canokeys.org" <contact@canokeys.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 06/15] meson: Add CanoKey
Date: Tue, 14 Jun 2022 14:16:01 +0200
Message-Id: <20220614121610.508356-7-kraxel@redhat.com>
In-Reply-To: <20220614121610.508356-1-kraxel@redhat.com>
References: <20220614121610.508356-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8

From: "Hongren (Zenithal) Zheng" <i@zenithal.me>

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
Message-Id: <YoY6YRD6cxH21mms@Sun>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 meson_options.txt             | 2 ++
 hw/usb/Kconfig                | 5 +++++
 hw/usb/meson.build            | 5 +++++
 meson.build                   | 6 ++++++
 scripts/meson-buildoptions.sh | 3 +++
 5 files changed, 21 insertions(+)

diff --git a/meson_options.txt b/meson_options.txt
index 2de94af03712..0e8197386b99 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -189,6 +189,8 @@ option('spice_protocol', type : 'feature', value : 'auto',
        description: 'Spice protocol support')
 option('u2f', type : 'feature', value : 'auto',
        description: 'U2F emulation support')
+option('canokey', type : 'feature', value : 'auto',
+       description: 'CanoKey support')
 option('usb_redir', type : 'feature', value : 'auto',
        description: 'libusbredir support')
 option('l2tpv3', type : 'feature', value : 'auto',
diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index 53f8283ffdc1..ce4f4339763e 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -119,6 +119,11 @@ config USB_U2F
     default y
     depends on USB
 
+config USB_CANOKEY
+    bool
+    default y
+    depends on USB
+
 config IMX_USBPHY
     bool
     default y
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index de853d780dd8..793df42e2127 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -63,6 +63,11 @@ if u2f.found()
   softmmu_ss.add(when: 'CONFIG_USB_U2F', if_true: [u2f, files('u2f-emulated.c')])
 endif
 
+# CanoKey
+if canokey.found()
+  softmmu_ss.add(when: 'CONFIG_USB_CANOKEY', if_true: [canokey, files('canokey.c')])
+endif
+
 # usb redirect
 if usbredir.found()
   usbredir_ss = ss.source_set()
diff --git a/meson.build b/meson.build
index 21cd949082dc..0c2e11ff0715 100644
--- a/meson.build
+++ b/meson.build
@@ -1408,6 +1408,12 @@ if have_system
                    method: 'pkg-config',
                    kwargs: static_kwargs)
 endif
+canokey = not_found
+if have_system
+  canokey = dependency('canokey-qemu', required: get_option('canokey'),
+                   method: 'pkg-config',
+                   kwargs: static_kwargs)
+endif
 usbredir = not_found
 if not get_option('usb_redir').auto() or have_system
   usbredir = dependency('libusbredirparser-0.5', required: get_option('usb_redir'),
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 00ea4d8cd169..1fc1d2e2c362 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -73,6 +73,7 @@ meson_options_help() {
   printf "%s\n" '  bpf             eBPF support'
   printf "%s\n" '  brlapi          brlapi character device driver'
   printf "%s\n" '  bzip2           bzip2 support for DMG images'
+  printf "%s\n" '  canokey         CanoKey support'
   printf "%s\n" '  cap-ng          cap_ng support'
   printf "%s\n" '  capstone        Whether and how to find the capstone library'
   printf "%s\n" '  cloop           cloop image format support'
@@ -204,6 +205,8 @@ _meson_option_parse() {
     --disable-brlapi) printf "%s" -Dbrlapi=disabled ;;
     --enable-bzip2) printf "%s" -Dbzip2=enabled ;;
     --disable-bzip2) printf "%s" -Dbzip2=disabled ;;
+    --enable-canokey) printf "%s" -Dcanokey=enabled ;;
+    --disable-canokey) printf "%s" -Dcanokey=disabled ;;
     --enable-cap-ng) printf "%s" -Dcap_ng=enabled ;;
     --disable-cap-ng) printf "%s" -Dcap_ng=disabled ;;
     --enable-capstone) printf "%s" -Dcapstone=enabled ;;
-- 
2.36.1


