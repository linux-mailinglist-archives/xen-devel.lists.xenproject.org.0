Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB96281438
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 15:40:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2123.6318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOLHk-0001rt-HB; Fri, 02 Oct 2020 13:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2123.6318; Fri, 02 Oct 2020 13:39:44 +0000
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
	id 1kOLHk-0001rJ-Cn; Fri, 02 Oct 2020 13:39:44 +0000
Received: by outflank-mailman (input) for mailman id 2123;
 Fri, 02 Oct 2020 13:39:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vuVU=DJ=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kOLHj-0001o1-7l
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 13:39:43 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id bfb246c0-b6fd-40ae-bcf1-97b5a21e218e;
 Fri, 02 Oct 2020 13:39:40 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-8QquVv6XN-WG38wS1ghzDg-1; Fri, 02 Oct 2020 09:39:38 -0400
Received: by mail-wm1-f69.google.com with SMTP id i9so95878wml.2
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2020 06:39:38 -0700 (PDT)
Received: from localhost.localdomain (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id r19sm1784306wmh.7.2020.10.02.06.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 06:39:36 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=vuVU=DJ=redhat.com=philmd@srs-us1.protection.inumbo.net>)
	id 1kOLHj-0001o1-7l
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 13:39:43 +0000
X-Inumbo-ID: bfb246c0-b6fd-40ae-bcf1-97b5a21e218e
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id bfb246c0-b6fd-40ae-bcf1-97b5a21e218e;
	Fri, 02 Oct 2020 13:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601645980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kbK1m63mIh7G9YoSTt+lY9Rt1IngmCv52ys5F1Xv+Ck=;
	b=Uu3UBB/eBIZLRBxr/GKPc14VcSn2csCaxmXks06WflkrmIpYV2LU+DmKnQ+akzhTI+nipx
	QuR9bXjyODJjqrv8WyqmIQw0oopDoIHWDh/3k5bJcmDoTSjvROhQFa82GfXqqxp+Vhecey
	Cff8hZKjnDACwarcTk8YZGmgaNWQclc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-8QquVv6XN-WG38wS1ghzDg-1; Fri, 02 Oct 2020 09:39:38 -0400
X-MC-Unique: 8QquVv6XN-WG38wS1ghzDg-1
Received: by mail-wm1-f69.google.com with SMTP id i9so95878wml.2
        for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2020 06:39:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kbK1m63mIh7G9YoSTt+lY9Rt1IngmCv52ys5F1Xv+Ck=;
        b=lc4bklQB/9mlIdD253n0ziNqrLJ2/OXTx8wk1FNM0UB8xR8mE5kkizU8f4WKYl5Z+Z
         NfUleXm6S6/fC3lNQADHNgAjJpGBhBGVJLvn85c0cSt39f2qL6epWwDHGmoKTb2hEzCB
         akkgxtMTth+KUrVtQoUZM5NGb6ACWU0UMHtYrWNDHRHFL70fBeR+/+dzqDDJ/HSyX6Ei
         VqZMOIA56UXy75fYOXQukbN4s5mGg2psRTw/EnDtMAY3t7yt3ERq0GIEv+ivZtIuG6wY
         lS1uqfh7fAg8qtqXW9/N16Czv1r81PaIeYFeUp1S5c/piN01cAn/XEFHbvRXajBIYgzK
         aqWQ==
X-Gm-Message-State: AOAM531w7h/gP5lYIIlEgiBEMsikbjCDKksU3W9wGaz4CEvXR0wB7PJW
	z1oQrvyG74XwsS9l+9oiVO5ZfAffeTjaTAfgFSMLL+R3tVljx6Pj1+o0qRnCCCsKZ7dHjQHoT/U
	jXS8osdorQHDwCdBEwF1sKeCoZ4A=
X-Received: by 2002:a1c:63c1:: with SMTP id x184mr3042796wmb.138.1601645977326;
        Fri, 02 Oct 2020 06:39:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwD/heYmqaLVMQtumsMQOWyseI2hOgaXTBn2HXZs+0th/9VfQZ/6fqWSoQPr8a9Q2Va+FrerA==
X-Received: by 2002:a1c:63c1:: with SMTP id x184mr3042765wmb.138.1601645977099;
        Fri, 02 Oct 2020 06:39:37 -0700 (PDT)
Received: from localhost.localdomain (74.red-83-53-161.dynamicip.rima-tde.net. [83.53.161.74])
        by smtp.gmail.com with ESMTPSA id r19sm1784306wmh.7.2020.10.02.06.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 06:39:36 -0700 (PDT)
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
Subject: [PATCH 2/5] qapi: Restrict 'system wakeup/reset/powerdown' commands to machine.json
Date: Fri,  2 Oct 2020 15:39:20 +0200
Message-Id: <20201002133923.1716645-3-philmd@redhat.com>
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

Restricting system_wakeup/system_reset/system_powerdown to
machine.json pulls slightly less QAPI-generated code into
user-mode and tools.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/machine.json | 57 +++++++++++++++++++++++++++++++++++++++++++++++
 qapi/misc.json    | 57 -----------------------------------------------
 ui/gtk.c          |  1 +
 ui/cocoa.m        |  1 +
 4 files changed, 59 insertions(+), 57 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 073b1c98b2..55328d4f3c 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -452,6 +452,63 @@
 ##
 { 'command': 'query-vm-generation-id', 'returns': 'GuidInfo' }
 
+##
+# @system_reset:
+#
+# Performs a hard reset of a guest.
+#
+# Since: 0.14.0
+#
+# Example:
+#
+# -> { "execute": "system_reset" }
+# <- { "return": {} }
+#
+##
+{ 'command': 'system_reset' }
+
+##
+# @system_powerdown:
+#
+# Requests that a guest perform a powerdown operation.
+#
+# Since: 0.14.0
+#
+# Notes: A guest may or may not respond to this command.  This command
+#        returning does not indicate that a guest has accepted the request or
+#        that it has shut down.  Many guests will respond to this command by
+#        prompting the user in some way.
+# Example:
+#
+# -> { "execute": "system_powerdown" }
+# <- { "return": {} }
+#
+##
+{ 'command': 'system_powerdown' }
+
+##
+# @system_wakeup:
+#
+# Wake up guest from suspend. If the guest has wake-up from suspend
+# support enabled (wakeup-suspend-support flag from
+# query-current-machine), wake-up guest from suspend if the guest is
+# in SUSPENDED state. Return an error otherwise.
+#
+# Since:  1.1
+#
+# Returns:  nothing.
+#
+# Note: prior to 4.0, this command does nothing in case the guest
+#       isn't suspended.
+#
+# Example:
+#
+# -> { "execute": "system_wakeup" }
+# <- { "return": {} }
+#
+##
+{ 'command': 'system_wakeup' }
+
 ##
 # @LostTickPolicy:
 #
diff --git a/qapi/misc.json b/qapi/misc.json
index 37b3e04cec..cce2e71e9c 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -177,40 +177,6 @@
 ##
 { 'command': 'stop' }
 
-##
-# @system_reset:
-#
-# Performs a hard reset of a guest.
-#
-# Since: 0.14.0
-#
-# Example:
-#
-# -> { "execute": "system_reset" }
-# <- { "return": {} }
-#
-##
-{ 'command': 'system_reset' }
-
-##
-# @system_powerdown:
-#
-# Requests that a guest perform a powerdown operation.
-#
-# Since: 0.14.0
-#
-# Notes: A guest may or may not respond to this command.  This command
-#        returning does not indicate that a guest has accepted the request or
-#        that it has shut down.  Many guests will respond to this command by
-#        prompting the user in some way.
-# Example:
-#
-# -> { "execute": "system_powerdown" }
-# <- { "return": {} }
-#
-##
-{ 'command': 'system_powerdown' }
-
 ##
 # @memsave:
 #
@@ -318,29 +284,6 @@
 ##
 { 'command': 'x-exit-preconfig', 'allow-preconfig': true }
 
-##
-# @system_wakeup:
-#
-# Wake up guest from suspend. If the guest has wake-up from suspend
-# support enabled (wakeup-suspend-support flag from
-# query-current-machine), wake-up guest from suspend if the guest is
-# in SUSPENDED state. Return an error otherwise.
-#
-# Since:  1.1
-#
-# Returns:  nothing.
-#
-# Note: prior to 4.0, this command does nothing in case the guest
-#       isn't suspended.
-#
-# Example:
-#
-# -> { "execute": "system_wakeup" }
-# <- { "return": {} }
-#
-##
-{ 'command': 'system_wakeup' }
-
 ##
 # @human-monitor-command:
 #
diff --git a/ui/gtk.c b/ui/gtk.c
index b11594d817..a752aa22be 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -33,6 +33,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-control.h"
+#include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qemu/cutils.h"
 
diff --git a/ui/cocoa.m b/ui/cocoa.m
index 0910b4a716..f32adc3074 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -35,6 +35,7 @@
 #include "sysemu/cpu-throttle.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-block.h"
+#include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-misc.h"
 #include "sysemu/blockdev.h"
 #include "qemu-version.h"
-- 
2.26.2


