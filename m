Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FC3281436
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 15:40:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2125.6342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOLHp-0001y3-8t; Fri, 02 Oct 2020 13:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2125.6342; Fri, 02 Oct 2020 13:39:49 +0000
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
	id 1kOLHp-0001xA-2r; Fri, 02 Oct 2020 13:39:49 +0000
Received: by outflank-mailman (input) for mailman id 2125;
 Fri, 02 Oct 2020 13:39:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vuVU=DJ=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kOLHn-0001sI-8c
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 13:39:47 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 071378c0-3579-45d2-b599-f6a9d517486b;
 Fri, 02 Oct 2020 13:39:46 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-yxHcaOtHPt6Z8bCmYwWpEQ-1; Fri, 02 Oct 2020 09:39:44 -0400
Received: by mail-wm1-f71.google.com with SMTP id y83so538355wmc.8
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2020 06:39:43 -0700 (PDT)
Received: from localhost.localdomain (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id 13sm1358682wmk.30.2020.10.02.06.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 06:39:41 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=vuVU=DJ=redhat.com=philmd@srs-us1.protection.inumbo.net>)
	id 1kOLHn-0001sI-8c
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 13:39:47 +0000
X-Inumbo-ID: 071378c0-3579-45d2-b599-f6a9d517486b
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 071378c0-3579-45d2-b599-f6a9d517486b;
	Fri, 02 Oct 2020 13:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601645986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l++0FncV4p/balcOSro5u4OfFvevG6nmzhJ8fBAOs6w=;
	b=A62p7juO5/oCRzYcD+UnjZCgVl4O/baHfJCuA60JD6GY0wx84Vx9dEvMnYvJGn2W+Qb1Mh
	kcJ5wz9eJ0wfDaY2MNdFVa//r7G0kZPxYZABdbdemrzxAoJ7/kRg9K6WgUH0IL4k48XrRF
	LbpfmxnIzQ1ib2+dZkR0+o3fuWoa4VI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-yxHcaOtHPt6Z8bCmYwWpEQ-1; Fri, 02 Oct 2020 09:39:44 -0400
X-MC-Unique: yxHcaOtHPt6Z8bCmYwWpEQ-1
Received: by mail-wm1-f71.google.com with SMTP id y83so538355wmc.8
        for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2020 06:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l++0FncV4p/balcOSro5u4OfFvevG6nmzhJ8fBAOs6w=;
        b=psaPcu/UzDhKUJKdh55I2jd2eCCbEYKknfAo6zPTDG9+Zi1/ur7lQuSyHqAoUMYjyC
         /h7zKctrrz+GrC6U08CW/pKsZgT/KMUNfzRwZyNLe7JuniGdmOer1e8ebamSHO3aHJco
         wCCTC9sQkBUnz61ICzWEPHp4ZKj4+f1Xic6mX/MSWtcx2DJk9KUNhtwBAM/zzYinTZs+
         0cfIti12g2diov5PzXtZSkPI/fbZn7xzKq/ehqMd2lpDUQFJ25IoqCfBztGvOnaZ+S1N
         iAVkX5ci8PGLXFmDybgdaHPUn1kDCkRXViNboS3kRpyLsO4KNN8XvIaPQtDKBvIt8rFt
         Y0hg==
X-Gm-Message-State: AOAM5324HpPxBVLhdhXyEx1PkxtD7GJA3/yCcAac3QhLIFUSjTGYXx4I
	k9sp+v8BF4uSQKYCoWDI30CR9QgBnvvVnnfwh9g6W4/ShmgbIubU5ywAmPeMgaXbmrNlKW96l64
	naimJnnw0Fj0Egf6dfVWPh7K/5ng=
X-Received: by 2002:a1c:9a0c:: with SMTP id c12mr3069190wme.85.1601645982655;
        Fri, 02 Oct 2020 06:39:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytnflmvzG2NbHjeDXeHd5cEjLZ7ujLVl3vbAMVyGFRFjZMyWEyqKmjFZCL5TRb0S/3cpVZiw==
X-Received: by 2002:a1c:9a0c:: with SMTP id c12mr3069171wme.85.1601645982462;
        Fri, 02 Oct 2020 06:39:42 -0700 (PDT)
Received: from localhost.localdomain (74.red-83-53-161.dynamicip.rima-tde.net. [83.53.161.74])
        by smtp.gmail.com with ESMTPSA id 13sm1358682wmk.30.2020.10.02.06.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 06:39:41 -0700 (PDT)
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
Subject: [PATCH 3/5] qapi: Restrict '(p)memsave' command to machine code
Date: Fri,  2 Oct 2020 15:39:21 +0200
Message-Id: <20201002133923.1716645-4-philmd@redhat.com>
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

Restricting memsave/pmemsave to machine.json pulls slightly
less QAPI-generated code into user-mode and tools.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/machine.json | 61 +++++++++++++++++++++++++++++++++++++++++++++++
 qapi/misc.json    | 61 -----------------------------------------------
 2 files changed, 61 insertions(+), 61 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 55328d4f3c..5a3bbcae01 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -887,6 +887,67 @@
 { 'enum': 'HostMemPolicy',
   'data': [ 'default', 'preferred', 'bind', 'interleave' ] }
 
+##
+# @memsave:
+#
+# Save a portion of guest memory to a file.
+#
+# @val: the virtual address of the guest to start from
+#
+# @size: the size of memory region to save
+#
+# @filename: the file to save the memory to as binary data
+#
+# @cpu-index: the index of the virtual CPU to use for translating the
+#             virtual address (defaults to CPU 0)
+#
+# Returns: Nothing on success
+#
+# Since: 0.14.0
+#
+# Notes: Errors were not reliably returned until 1.1
+#
+# Example:
+#
+# -> { "execute": "memsave",
+#      "arguments": { "val": 10,
+#                     "size": 100,
+#                     "filename": "/tmp/virtual-mem-dump" } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'memsave',
+  'data': {'val': 'int', 'size': 'int', 'filename': 'str', '*cpu-index': 'int'} }
+
+##
+# @pmemsave:
+#
+# Save a portion of guest physical memory to a file.
+#
+# @val: the physical address of the guest to start from
+#
+# @size: the size of memory region to save
+#
+# @filename: the file to save the memory to as binary data
+#
+# Returns: Nothing on success
+#
+# Since: 0.14.0
+#
+# Notes: Errors were not reliably returned until 1.1
+#
+# Example:
+#
+# -> { "execute": "pmemsave",
+#      "arguments": { "val": 10,
+#                     "size": 100,
+#                     "filename": "/tmp/physical-mem-dump" } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'pmemsave',
+  'data': {'val': 'int', 'size': 'int', 'filename': 'str'} }
+
 ##
 # @Memdev:
 #
diff --git a/qapi/misc.json b/qapi/misc.json
index cce2e71e9c..2a5d03a69e 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -177,67 +177,6 @@
 ##
 { 'command': 'stop' }
 
-##
-# @memsave:
-#
-# Save a portion of guest memory to a file.
-#
-# @val: the virtual address of the guest to start from
-#
-# @size: the size of memory region to save
-#
-# @filename: the file to save the memory to as binary data
-#
-# @cpu-index: the index of the virtual CPU to use for translating the
-#             virtual address (defaults to CPU 0)
-#
-# Returns: Nothing on success
-#
-# Since: 0.14.0
-#
-# Notes: Errors were not reliably returned until 1.1
-#
-# Example:
-#
-# -> { "execute": "memsave",
-#      "arguments": { "val": 10,
-#                     "size": 100,
-#                     "filename": "/tmp/virtual-mem-dump" } }
-# <- { "return": {} }
-#
-##
-{ 'command': 'memsave',
-  'data': {'val': 'int', 'size': 'int', 'filename': 'str', '*cpu-index': 'int'} }
-
-##
-# @pmemsave:
-#
-# Save a portion of guest physical memory to a file.
-#
-# @val: the physical address of the guest to start from
-#
-# @size: the size of memory region to save
-#
-# @filename: the file to save the memory to as binary data
-#
-# Returns: Nothing on success
-#
-# Since: 0.14.0
-#
-# Notes: Errors were not reliably returned until 1.1
-#
-# Example:
-#
-# -> { "execute": "pmemsave",
-#      "arguments": { "val": 10,
-#                     "size": 100,
-#                     "filename": "/tmp/physical-mem-dump" } }
-# <- { "return": {} }
-#
-##
-{ 'command': 'pmemsave',
-  'data': {'val': 'int', 'size': 'int', 'filename': 'str'} }
-
 ##
 # @cont:
 #
-- 
2.26.2


