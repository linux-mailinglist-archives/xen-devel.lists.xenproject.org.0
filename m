Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F93528143D
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 15:40:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2127.6366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOLI0-0002CM-9A; Fri, 02 Oct 2020 13:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2127.6366; Fri, 02 Oct 2020 13:40:00 +0000
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
	id 1kOLI0-0002BS-3o; Fri, 02 Oct 2020 13:40:00 +0000
Received: by outflank-mailman (input) for mailman id 2127;
 Fri, 02 Oct 2020 13:39:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vuVU=DJ=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kOLHy-0002AB-Hy
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 13:39:58 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 23309c66-c2e2-446e-8bd4-41bf2412830e;
 Fri, 02 Oct 2020 13:39:57 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-8CPeljkbOza0gEeRdeNhlA-1; Fri, 02 Oct 2020 09:39:55 -0400
Received: by mail-wm1-f69.google.com with SMTP id 13so437872wmf.0
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2020 06:39:55 -0700 (PDT)
Received: from localhost.localdomain (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id f6sm1818116wro.5.2020.10.02.06.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 06:39:52 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=vuVU=DJ=redhat.com=philmd@srs-us1.protection.inumbo.net>)
	id 1kOLHy-0002AB-Hy
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 13:39:58 +0000
X-Inumbo-ID: 23309c66-c2e2-446e-8bd4-41bf2412830e
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 23309c66-c2e2-446e-8bd4-41bf2412830e;
	Fri, 02 Oct 2020 13:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601645997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8IRn/Y0aJt1eGijTbQmkn/6JoyPalvnCOEAPCHm0k58=;
	b=I7tw93m2OGcrMYGGWQLAFY0xbZJnomqp+6GXbHzFOIipZtec+FuqDQUVgXrsLshYvZ6r9C
	LvjkQDUVl9gAR6Fw3k9JNT7UnC5z/lrt/p4EaQsratPdhuE8jU12H2scPyePYlHFBYZOD6
	WbXFW7Os8Qn3R2hwv99SAJSbTy0At7E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-8CPeljkbOza0gEeRdeNhlA-1; Fri, 02 Oct 2020 09:39:55 -0400
X-MC-Unique: 8CPeljkbOza0gEeRdeNhlA-1
Received: by mail-wm1-f69.google.com with SMTP id 13so437872wmf.0
        for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2020 06:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8IRn/Y0aJt1eGijTbQmkn/6JoyPalvnCOEAPCHm0k58=;
        b=PwZzHvpZk/1VvvaYlJkBaea/N/LqGBLLcVNb+VY1UKJ+mbca3e1qjISqOKDxAfFlDI
         PwcCVUpl8gnLu9WYRs6DVfwZdAgvQ+JdE5l7paN85nf0xdx394t5Kh1/VhXGfnkoYPN+
         ztnLTmCCCbxrlzOCwDLj8sIBBZSONf5O8X2ufGUcUa97siliXFwvqUAj859cg2kROe2y
         kX+YdGFQA1ztPkPXLMmcOqIgZhpXeDQX/MSUGHqrBl1qcfHrbh8AFViRse34LqcVM62f
         1Gt0lZe4mVgCT0cw4vPF015aR5lAG0kucP4QAtGHXUWJTTxSj1HLcF7gxEGcNhfdiyNL
         pgHg==
X-Gm-Message-State: AOAM5300aRY+Bbj+0og9u66Lf3/SNTuqmnuCFrkN2tKMglBb7WNoAV42
	i8TRxzLojydRJ/fbh5psuIsbZw5rVho68zMsKhJdz5oz/qIqdr7XrRGh6C9dFokPHL8ojVLpC49
	VGaYsUp6ZYx95/oc+PujAZ5rvoms=
X-Received: by 2002:a5d:43cf:: with SMTP id v15mr3203831wrr.269.1601645993157;
        Fri, 02 Oct 2020 06:39:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrtjDxbvNT2qZx2AnpZX/U8SDHXTxctCni5ZD+jg0EWfaGOVq2AOPJli+/iQHk1imFPhnyVw==
X-Received: by 2002:a5d:43cf:: with SMTP id v15mr3203803wrr.269.1601645992898;
        Fri, 02 Oct 2020 06:39:52 -0700 (PDT)
Received: from localhost.localdomain (74.red-83-53-161.dynamicip.rima-tde.net. [83.53.161.74])
        by smtp.gmail.com with ESMTPSA id f6sm1818116wro.5.2020.10.02.06.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 06:39:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	xen-devel@lists.xenproject.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Eric Blake <eblake@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 5/5] qapi: Restrict Xen migration commands to migration.json
Date: Fri,  2 Oct 2020 15:39:23 +0200
Message-Id: <20201002133923.1716645-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201002133923.1716645-1-philmd@redhat.com>
References: <20201002133923.1716645-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Restricting xen-set-global-dirty-log and xen-load-devices-state
commands migration.json pulls slightly less QAPI-generated code
into user-mode and tools.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/migration.json    | 41 +++++++++++++++++++++++++++++++++++++++++
 qapi/misc.json         | 41 -----------------------------------------
 accel/stubs/xen-stub.c |  2 +-
 hw/i386/xen/xen-hvm.c  |  2 +-
 migration/savevm.c     |  1 -
 5 files changed, 43 insertions(+), 44 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 7f5e6fd681..cb30f4c729 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1551,6 +1551,47 @@
 { 'command': 'xen-save-devices-state',
   'data': {'filename': 'str', '*live':'bool' } }
 
+##
+# @xen-set-global-dirty-log:
+#
+# Enable or disable the global dirty log mode.
+#
+# @enable: true to enable, false to disable.
+#
+# Returns: nothing
+#
+# Since: 1.3
+#
+# Example:
+#
+# -> { "execute": "xen-set-global-dirty-log",
+#      "arguments": { "enable": true } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'xen-set-global-dirty-log', 'data': { 'enable': 'bool' } }
+
+##
+# @xen-load-devices-state:
+#
+# Load the state of all devices from file. The RAM and the block devices
+# of the VM are not loaded by this command.
+#
+# @filename: the file to load the state of the devices from as binary
+#            data. See xen-save-devices-state.txt for a description of the binary
+#            format.
+#
+# Since: 2.7
+#
+# Example:
+#
+# -> { "execute": "xen-load-devices-state",
+#      "arguments": { "filename": "/tmp/resume" } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'xen-load-devices-state', 'data': {'filename': 'str'} }
+
 ##
 # @xen-set-replication:
 #
diff --git a/qapi/misc.json b/qapi/misc.json
index 9813893269..afe936b45b 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -287,26 +287,6 @@
   'data': {'device': 'str', 'target': 'str', '*arg': 'str'},
   'features': [ 'deprecated' ] }
 
-##
-# @xen-set-global-dirty-log:
-#
-# Enable or disable the global dirty log mode.
-#
-# @enable: true to enable, false to disable.
-#
-# Returns: nothing
-#
-# Since: 1.3
-#
-# Example:
-#
-# -> { "execute": "xen-set-global-dirty-log",
-#      "arguments": { "enable": true } }
-# <- { "return": {} }
-#
-##
-{ 'command': 'xen-set-global-dirty-log', 'data': { 'enable': 'bool' } }
-
 ##
 # @getfd:
 #
@@ -606,24 +586,3 @@
 ##
 { 'enum': 'ReplayMode',
   'data': [ 'none', 'record', 'play' ] }
-
-##
-# @xen-load-devices-state:
-#
-# Load the state of all devices from file. The RAM and the block devices
-# of the VM are not loaded by this command.
-#
-# @filename: the file to load the state of the devices from as binary
-#            data. See xen-save-devices-state.txt for a description of the binary
-#            format.
-#
-# Since: 2.7
-#
-# Example:
-#
-# -> { "execute": "xen-load-devices-state",
-#      "arguments": { "filename": "/tmp/resume" } }
-# <- { "return": {} }
-#
-##
-{ 'command': 'xen-load-devices-state', 'data': {'filename': 'str'} }
diff --git a/accel/stubs/xen-stub.c b/accel/stubs/xen-stub.c
index 7ba0b697f4..7054965c48 100644
--- a/accel/stubs/xen-stub.c
+++ b/accel/stubs/xen-stub.c
@@ -7,7 +7,7 @@
 
 #include "qemu/osdep.h"
 #include "sysemu/xen.h"
-#include "qapi/qapi-commands-misc.h"
+#include "qapi/qapi-commands-migration.h"
 
 bool xen_allowed;
 
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index f3ababf33b..9519c33c09 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -24,7 +24,7 @@
 #include "hw/xen/xen-bus.h"
 #include "hw/xen/xen-x86.h"
 #include "qapi/error.h"
-#include "qapi/qapi-commands-misc.h"
+#include "qapi/qapi-commands-migration.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/range.h"
diff --git a/migration/savevm.c b/migration/savevm.c
index 34e4b71052..1fdf3f76c2 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -42,7 +42,6 @@
 #include "postcopy-ram.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-migration.h"
-#include "qapi/qapi-commands-misc.h"
 #include "qapi/qmp/qerror.h"
 #include "qemu/error-report.h"
 #include "sysemu/cpus.h"
-- 
2.26.2


