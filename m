Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 333B4281439
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 15:40:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2122.6305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOLHg-0001or-0Y; Fri, 02 Oct 2020 13:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2122.6305; Fri, 02 Oct 2020 13:39:39 +0000
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
	id 1kOLHf-0001oL-Sa; Fri, 02 Oct 2020 13:39:39 +0000
Received: by outflank-mailman (input) for mailman id 2122;
 Fri, 02 Oct 2020 13:39:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vuVU=DJ=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kOLHe-0001o1-BS
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 13:39:38 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 65ec9fd5-b877-4355-ae15-291e198d59bc;
 Fri, 02 Oct 2020 13:39:35 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-DSmf6SVhOiOntOuoPZ_fqA-1; Fri, 02 Oct 2020 09:39:33 -0400
Received: by mail-wr1-f69.google.com with SMTP id l9so554526wrq.20
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2020 06:39:33 -0700 (PDT)
Received: from localhost.localdomain (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id 91sm1979455wrq.9.2020.10.02.06.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 06:39:31 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=vuVU=DJ=redhat.com=philmd@srs-us1.protection.inumbo.net>)
	id 1kOLHe-0001o1-BS
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 13:39:38 +0000
X-Inumbo-ID: 65ec9fd5-b877-4355-ae15-291e198d59bc
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 65ec9fd5-b877-4355-ae15-291e198d59bc;
	Fri, 02 Oct 2020 13:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601645975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iLAVKEu0s8buMQigPSDDQRm3nwhcH7vFMDI5aBMruk4=;
	b=Z6DK7UlR9jzeTDWaDTeu0zBR6OjAZvmi4ldqzQlM7EUa0/VtQVTZ2c6ap5A/xQeV59MsZm
	d6X+Do8ZcgkfOInXJC6Gh3l7oILwJ5N3R4nCHN4Vi2hA2yM1sr2CbqKBgh09jVej7Cp0xm
	L1mtKfoRAJjKKGpDZQE7wKjr1xHVAx0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-DSmf6SVhOiOntOuoPZ_fqA-1; Fri, 02 Oct 2020 09:39:33 -0400
X-MC-Unique: DSmf6SVhOiOntOuoPZ_fqA-1
Received: by mail-wr1-f69.google.com with SMTP id l9so554526wrq.20
        for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2020 06:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iLAVKEu0s8buMQigPSDDQRm3nwhcH7vFMDI5aBMruk4=;
        b=qvzefYhpkF7n6MMR4XIkxvhtD2H+CTP0Ot9/REeG70SLmktzCVki+qeOIHps/066pF
         /LCcxR6DzDKIEWQR3tNow4C4W4t54SD2neNhO9foUwURzOM4lJUPUi661ZSvtNAl0zuF
         p8leW8pmNDYF8NFi6eMRNUbvPziBrwVxzPizZPZCrb+EHTYsyXUx9VlPb6hm9IhziyMJ
         Dipxvx/f4hPRqGFS7HFkxRS6gXCZArBGzj2dhehibUKNyf7/Q2yFHFnsmjzJr8MwWYBw
         ryzxsO6sQei/wNcy9uonhV8y1QzMjGHtALZqqJzyeQ1RY0FHFmxMAfbY/EosuYSqP4W9
         Ulkg==
X-Gm-Message-State: AOAM530l6iD3jWmhdbyGVixljgzy8/JeN16MzQ/h3EP5Cdfeh0zssPrl
	JbKbVV9+dkFvYHpaujXdQrzOh2BiV5kjDH+buJ4wP8vuHy45Q8yN16JcFYwNg1/CxCHNqzTV6mO
	x5Wk1PzLUItwVyjcUgLuhNOTXNrY=
X-Received: by 2002:a7b:cc02:: with SMTP id f2mr2894069wmh.1.1601645972085;
        Fri, 02 Oct 2020 06:39:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqQv1qlyQpjgjGTEtLJvUYyUltyIpiDUFPSX1enMbbtlK6dt49SmY4VWfHBJPv80MAhGkeEw==
X-Received: by 2002:a7b:cc02:: with SMTP id f2mr2894034wmh.1.1601645971831;
        Fri, 02 Oct 2020 06:39:31 -0700 (PDT)
Received: from localhost.localdomain (74.red-83-53-161.dynamicip.rima-tde.net. [83.53.161.74])
        by smtp.gmail.com with ESMTPSA id 91sm1979455wrq.9.2020.10.02.06.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 06:39:31 -0700 (PDT)
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
Subject: [PATCH 1/5] qapi: Restrict 'inject-nmi' command to machine code
Date: Fri,  2 Oct 2020 15:39:19 +0200
Message-Id: <20201002133923.1716645-2-philmd@redhat.com>
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

Restricting 'inject-nmi' to machine.json pulls slightly
less QAPI-generated code into user-mode and tools.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/machine.json | 20 ++++++++++++++++++++
 qapi/misc.json    | 20 --------------------
 softmmu/cpus.c    |  1 +
 3 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 756dacb06f..073b1c98b2 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -484,6 +484,26 @@
 { 'enum': 'LostTickPolicy',
   'data': ['discard', 'delay', 'slew' ] }
 
+##
+# @inject-nmi:
+#
+# Injects a Non-Maskable Interrupt into the default CPU (x86/s390) or all CPUs (ppc64).
+# The command fails when the guest doesn't support injecting.
+#
+# Returns:  If successful, nothing
+#
+# Since:  0.14.0
+#
+# Note: prior to 2.1, this command was only supported for x86 and s390 VMs
+#
+# Example:
+#
+# -> { "execute": "inject-nmi" }
+# <- { "return": {} }
+#
+##
+{ 'command': 'inject-nmi' }
+
 ##
 # @NumaOptionsType:
 #
diff --git a/qapi/misc.json b/qapi/misc.json
index 694d2142f3..37b3e04cec 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -341,26 +341,6 @@
 ##
 { 'command': 'system_wakeup' }
 
-##
-# @inject-nmi:
-#
-# Injects a Non-Maskable Interrupt into the default CPU (x86/s390) or all CPUs (ppc64).
-# The command fails when the guest doesn't support injecting.
-#
-# Returns:  If successful, nothing
-#
-# Since:  0.14.0
-#
-# Note: prior to 2.1, this command was only supported for x86 and s390 VMs
-#
-# Example:
-#
-# -> { "execute": "inject-nmi" }
-# <- { "return": {} }
-#
-##
-{ 'command': 'inject-nmi' }
-
 ##
 # @human-monitor-command:
 #
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index ac8940d52e..bd040d6cdd 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -29,6 +29,7 @@
 #include "migration/vmstate.h"
 #include "monitor/monitor.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-events-run-state.h"
 #include "qapi/qmp/qerror.h"
-- 
2.26.2


