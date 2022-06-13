Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8835484EE
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 13:38:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348022.574443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0iOr-0004C8-Ch; Mon, 13 Jun 2022 11:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348022.574443; Mon, 13 Jun 2022 11:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0iOr-00049T-9l; Mon, 13 Jun 2022 11:38:29 +0000
Received: by outflank-mailman (input) for mailman id 348022;
 Mon, 13 Jun 2022 11:38:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SJWo=WU=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1o0iNh-0003eY-8B
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 11:37:17 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c35fb1a-eb0d-11ec-bd2c-47488cf2e6aa;
 Mon, 13 Jun 2022 13:37:15 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-5G3LNvV0Mv2PeFSjsuQA_Q-1; Mon, 13 Jun 2022 07:37:12 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78034100BADB;
 Mon, 13 Jun 2022 11:37:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1812F2166B26;
 Mon, 13 Jun 2022 11:37:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D761818009AC; Mon, 13 Jun 2022 13:36:56 +0200 (CEST)
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
X-Inumbo-ID: 2c35fb1a-eb0d-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655120235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TCo33ax1Q4GDO812+rq/YD1R1Ny1sNrWx6I6aptpWo8=;
	b=OwdDXeOKhnSy0uao4RqpTaBfiLfIApt0tgW+fkB8TAMdg9UT4t2uGNClnqm5S38eyhPvKb
	TP6RoO9H6VnGr5dYg+906gUZr3X2gN44gUk9tv20CqEa3lLVKu+KZrOsLLjqVxTZPMiK16
	jBD7MDI2RdMRNGL3fqal6jFcixaJkuc=
X-MC-Unique: 5G3LNvV0Mv2PeFSjsuQA_Q-1
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	xen-devel@lists.xenproject.org,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Canokeys.org" <contact@canokeys.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 16/16] ui: move 'pc-bios/keymaps' to 'ui/keymaps'
Date: Mon, 13 Jun 2022 13:36:55 +0200
Message-Id: <20220613113655.3693872-17-kraxel@redhat.com>
In-Reply-To: <20220613113655.3693872-1-kraxel@redhat.com>
References: <20220613113655.3693872-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6

From: Daniel P. Berrangé <berrange@redhat.com>

The 'keymaps' directory contents is nothing to do with the firmware
blobs. The 'pc-bios/keymaps' directory appears to have been used
previously as a convenience for getting the files installed into
a subdir of the firmware install dir, as well as to make it easier
to launch QEMU directly from the build tree. These requirements
do not need to be reflected in the source tree arrangement. The
keymaps logically belong with the UI code, and meson can install
them into the right place. For in-tree execution, we merely need
a suitable symlink from the source tree to the build tree.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220613084456.470068-1-berrange@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 configure                           | 4 ++++
 pc-bios/meson.build                 | 1 -
 {pc-bios => ui}/keymaps/ar          | 0
 {pc-bios => ui}/keymaps/bepo        | 0
 {pc-bios => ui}/keymaps/cz          | 0
 {pc-bios => ui}/keymaps/da          | 0
 {pc-bios => ui}/keymaps/de          | 0
 {pc-bios => ui}/keymaps/de-ch       | 0
 {pc-bios => ui}/keymaps/en-gb       | 0
 {pc-bios => ui}/keymaps/en-us       | 0
 {pc-bios => ui}/keymaps/es          | 0
 {pc-bios => ui}/keymaps/et          | 0
 {pc-bios => ui}/keymaps/fi          | 0
 {pc-bios => ui}/keymaps/fo          | 0
 {pc-bios => ui}/keymaps/fr          | 0
 {pc-bios => ui}/keymaps/fr-be       | 0
 {pc-bios => ui}/keymaps/fr-ca       | 0
 {pc-bios => ui}/keymaps/fr-ch       | 0
 {pc-bios => ui}/keymaps/hr          | 0
 {pc-bios => ui}/keymaps/hu          | 0
 {pc-bios => ui}/keymaps/is          | 0
 {pc-bios => ui}/keymaps/it          | 0
 {pc-bios => ui}/keymaps/ja          | 0
 {pc-bios => ui}/keymaps/lt          | 0
 {pc-bios => ui}/keymaps/lv          | 0
 {pc-bios => ui}/keymaps/meson.build | 0
 {pc-bios => ui}/keymaps/mk          | 0
 {pc-bios => ui}/keymaps/nl          | 0
 {pc-bios => ui}/keymaps/no          | 0
 {pc-bios => ui}/keymaps/pl          | 0
 {pc-bios => ui}/keymaps/pt          | 0
 {pc-bios => ui}/keymaps/pt-br       | 0
 {pc-bios => ui}/keymaps/ru          | 0
 {pc-bios => ui}/keymaps/sl          | 0
 {pc-bios => ui}/keymaps/sv          | 0
 {pc-bios => ui}/keymaps/th          | 0
 {pc-bios => ui}/keymaps/tr          | 0
 ui/meson.build                      | 1 +
 38 files changed, 5 insertions(+), 1 deletion(-)
 rename {pc-bios => ui}/keymaps/ar (100%)
 rename {pc-bios => ui}/keymaps/bepo (100%)
 rename {pc-bios => ui}/keymaps/cz (100%)
 rename {pc-bios => ui}/keymaps/da (100%)
 rename {pc-bios => ui}/keymaps/de (100%)
 rename {pc-bios => ui}/keymaps/de-ch (100%)
 rename {pc-bios => ui}/keymaps/en-gb (100%)
 rename {pc-bios => ui}/keymaps/en-us (100%)
 rename {pc-bios => ui}/keymaps/es (100%)
 rename {pc-bios => ui}/keymaps/et (100%)
 rename {pc-bios => ui}/keymaps/fi (100%)
 rename {pc-bios => ui}/keymaps/fo (100%)
 rename {pc-bios => ui}/keymaps/fr (100%)
 rename {pc-bios => ui}/keymaps/fr-be (100%)
 rename {pc-bios => ui}/keymaps/fr-ca (100%)
 rename {pc-bios => ui}/keymaps/fr-ch (100%)
 rename {pc-bios => ui}/keymaps/hr (100%)
 rename {pc-bios => ui}/keymaps/hu (100%)
 rename {pc-bios => ui}/keymaps/is (100%)
 rename {pc-bios => ui}/keymaps/it (100%)
 rename {pc-bios => ui}/keymaps/ja (100%)
 rename {pc-bios => ui}/keymaps/lt (100%)
 rename {pc-bios => ui}/keymaps/lv (100%)
 rename {pc-bios => ui}/keymaps/meson.build (100%)
 rename {pc-bios => ui}/keymaps/mk (100%)
 rename {pc-bios => ui}/keymaps/nl (100%)
 rename {pc-bios => ui}/keymaps/no (100%)
 rename {pc-bios => ui}/keymaps/pl (100%)
 rename {pc-bios => ui}/keymaps/pt (100%)
 rename {pc-bios => ui}/keymaps/pt-br (100%)
 rename {pc-bios => ui}/keymaps/ru (100%)
 rename {pc-bios => ui}/keymaps/sl (100%)
 rename {pc-bios => ui}/keymaps/sv (100%)
 rename {pc-bios => ui}/keymaps/th (100%)
 rename {pc-bios => ui}/keymaps/tr (100%)

diff --git a/configure b/configure
index e69537c7566c..77c68642514b 100755
--- a/configure
+++ b/configure
@@ -2226,6 +2226,10 @@ for f in $LINKS ; do
     fi
 done
 
+# Keymaps needs slightly different location in build
+# dir as we are simulating the installed data dir layout
+symlink "$source_path/ui/keymaps" "pc-bios/keymaps"
+
 # Mac OS X ships with a broken assembler
 roms=
 probe_target_compilers i386 x86_64
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 41ba1c0ec7ba..e49c0e5f56de 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -97,4 +97,3 @@ foreach f : blobs
 endforeach
 
 subdir('descriptors')
-subdir('keymaps')
diff --git a/pc-bios/keymaps/ar b/ui/keymaps/ar
similarity index 100%
rename from pc-bios/keymaps/ar
rename to ui/keymaps/ar
diff --git a/pc-bios/keymaps/bepo b/ui/keymaps/bepo
similarity index 100%
rename from pc-bios/keymaps/bepo
rename to ui/keymaps/bepo
diff --git a/pc-bios/keymaps/cz b/ui/keymaps/cz
similarity index 100%
rename from pc-bios/keymaps/cz
rename to ui/keymaps/cz
diff --git a/pc-bios/keymaps/da b/ui/keymaps/da
similarity index 100%
rename from pc-bios/keymaps/da
rename to ui/keymaps/da
diff --git a/pc-bios/keymaps/de b/ui/keymaps/de
similarity index 100%
rename from pc-bios/keymaps/de
rename to ui/keymaps/de
diff --git a/pc-bios/keymaps/de-ch b/ui/keymaps/de-ch
similarity index 100%
rename from pc-bios/keymaps/de-ch
rename to ui/keymaps/de-ch
diff --git a/pc-bios/keymaps/en-gb b/ui/keymaps/en-gb
similarity index 100%
rename from pc-bios/keymaps/en-gb
rename to ui/keymaps/en-gb
diff --git a/pc-bios/keymaps/en-us b/ui/keymaps/en-us
similarity index 100%
rename from pc-bios/keymaps/en-us
rename to ui/keymaps/en-us
diff --git a/pc-bios/keymaps/es b/ui/keymaps/es
similarity index 100%
rename from pc-bios/keymaps/es
rename to ui/keymaps/es
diff --git a/pc-bios/keymaps/et b/ui/keymaps/et
similarity index 100%
rename from pc-bios/keymaps/et
rename to ui/keymaps/et
diff --git a/pc-bios/keymaps/fi b/ui/keymaps/fi
similarity index 100%
rename from pc-bios/keymaps/fi
rename to ui/keymaps/fi
diff --git a/pc-bios/keymaps/fo b/ui/keymaps/fo
similarity index 100%
rename from pc-bios/keymaps/fo
rename to ui/keymaps/fo
diff --git a/pc-bios/keymaps/fr b/ui/keymaps/fr
similarity index 100%
rename from pc-bios/keymaps/fr
rename to ui/keymaps/fr
diff --git a/pc-bios/keymaps/fr-be b/ui/keymaps/fr-be
similarity index 100%
rename from pc-bios/keymaps/fr-be
rename to ui/keymaps/fr-be
diff --git a/pc-bios/keymaps/fr-ca b/ui/keymaps/fr-ca
similarity index 100%
rename from pc-bios/keymaps/fr-ca
rename to ui/keymaps/fr-ca
diff --git a/pc-bios/keymaps/fr-ch b/ui/keymaps/fr-ch
similarity index 100%
rename from pc-bios/keymaps/fr-ch
rename to ui/keymaps/fr-ch
diff --git a/pc-bios/keymaps/hr b/ui/keymaps/hr
similarity index 100%
rename from pc-bios/keymaps/hr
rename to ui/keymaps/hr
diff --git a/pc-bios/keymaps/hu b/ui/keymaps/hu
similarity index 100%
rename from pc-bios/keymaps/hu
rename to ui/keymaps/hu
diff --git a/pc-bios/keymaps/is b/ui/keymaps/is
similarity index 100%
rename from pc-bios/keymaps/is
rename to ui/keymaps/is
diff --git a/pc-bios/keymaps/it b/ui/keymaps/it
similarity index 100%
rename from pc-bios/keymaps/it
rename to ui/keymaps/it
diff --git a/pc-bios/keymaps/ja b/ui/keymaps/ja
similarity index 100%
rename from pc-bios/keymaps/ja
rename to ui/keymaps/ja
diff --git a/pc-bios/keymaps/lt b/ui/keymaps/lt
similarity index 100%
rename from pc-bios/keymaps/lt
rename to ui/keymaps/lt
diff --git a/pc-bios/keymaps/lv b/ui/keymaps/lv
similarity index 100%
rename from pc-bios/keymaps/lv
rename to ui/keymaps/lv
diff --git a/pc-bios/keymaps/meson.build b/ui/keymaps/meson.build
similarity index 100%
rename from pc-bios/keymaps/meson.build
rename to ui/keymaps/meson.build
diff --git a/pc-bios/keymaps/mk b/ui/keymaps/mk
similarity index 100%
rename from pc-bios/keymaps/mk
rename to ui/keymaps/mk
diff --git a/pc-bios/keymaps/nl b/ui/keymaps/nl
similarity index 100%
rename from pc-bios/keymaps/nl
rename to ui/keymaps/nl
diff --git a/pc-bios/keymaps/no b/ui/keymaps/no
similarity index 100%
rename from pc-bios/keymaps/no
rename to ui/keymaps/no
diff --git a/pc-bios/keymaps/pl b/ui/keymaps/pl
similarity index 100%
rename from pc-bios/keymaps/pl
rename to ui/keymaps/pl
diff --git a/pc-bios/keymaps/pt b/ui/keymaps/pt
similarity index 100%
rename from pc-bios/keymaps/pt
rename to ui/keymaps/pt
diff --git a/pc-bios/keymaps/pt-br b/ui/keymaps/pt-br
similarity index 100%
rename from pc-bios/keymaps/pt-br
rename to ui/keymaps/pt-br
diff --git a/pc-bios/keymaps/ru b/ui/keymaps/ru
similarity index 100%
rename from pc-bios/keymaps/ru
rename to ui/keymaps/ru
diff --git a/pc-bios/keymaps/sl b/ui/keymaps/sl
similarity index 100%
rename from pc-bios/keymaps/sl
rename to ui/keymaps/sl
diff --git a/pc-bios/keymaps/sv b/ui/keymaps/sv
similarity index 100%
rename from pc-bios/keymaps/sv
rename to ui/keymaps/sv
diff --git a/pc-bios/keymaps/th b/ui/keymaps/th
similarity index 100%
rename from pc-bios/keymaps/th
rename to ui/keymaps/th
diff --git a/pc-bios/keymaps/tr b/ui/keymaps/tr
similarity index 100%
rename from pc-bios/keymaps/tr
rename to ui/keymaps/tr
diff --git a/ui/meson.build b/ui/meson.build
index e9f48c531588..25c9a5ff8cd9 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -170,6 +170,7 @@ if have_system or xkbcommon.found()
 endif
 
 subdir('shader')
+subdir('keymaps')
 
 if have_system
   subdir('icons')
-- 
2.36.1


