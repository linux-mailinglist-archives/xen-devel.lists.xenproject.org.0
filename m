Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F2028143B
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 15:40:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2126.6354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOLHt-000241-SV; Fri, 02 Oct 2020 13:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2126.6354; Fri, 02 Oct 2020 13:39:53 +0000
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
	id 1kOLHt-000236-Mb; Fri, 02 Oct 2020 13:39:53 +0000
Received: by outflank-mailman (input) for mailman id 2126;
 Fri, 02 Oct 2020 13:39:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vuVU=DJ=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kOLHs-000223-FI
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 13:39:52 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0514069d-5379-4000-bbbf-b4a2b6d0123c;
 Fri, 02 Oct 2020 13:39:51 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-vfdZeNnmMf-TehhOv5_q6A-1; Fri, 02 Oct 2020 09:39:50 -0400
Received: by mail-wr1-f72.google.com with SMTP id r16so554198wrm.18
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2020 06:39:50 -0700 (PDT)
Received: from localhost.localdomain (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id d18sm1779795wrm.10.2020.10.02.06.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 06:39:46 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=vuVU=DJ=redhat.com=philmd@srs-us1.protection.inumbo.net>)
	id 1kOLHs-000223-FI
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 13:39:52 +0000
X-Inumbo-ID: 0514069d-5379-4000-bbbf-b4a2b6d0123c
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 0514069d-5379-4000-bbbf-b4a2b6d0123c;
	Fri, 02 Oct 2020 13:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601645991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tvVXKSfjWkoZJFhCHk1dGuX00kfrmBZkcI+Ka1f3ccA=;
	b=Y9UNoL+P7MRObMQELlSDzu+JhTudkEbGjlHpGCFRvvloKQZNg78znvFafm/XjHFhgLtM5w
	JWIeRVQnOL7dZqbgLLEcrun1643CiEcltViAa7G+pdmKJw+sRiQIo1gQHq3/lU24i3PuNt
	kQDUv8x4Iq3rIeUWVVybXptUDd1UkQE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-vfdZeNnmMf-TehhOv5_q6A-1; Fri, 02 Oct 2020 09:39:50 -0400
X-MC-Unique: vfdZeNnmMf-TehhOv5_q6A-1
Received: by mail-wr1-f72.google.com with SMTP id r16so554198wrm.18
        for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2020 06:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tvVXKSfjWkoZJFhCHk1dGuX00kfrmBZkcI+Ka1f3ccA=;
        b=YtcOiJ5f2FZZhMGhjzYpYlsciTMrkFzBnT0/L9b+vPhFpHqL8I+4arbPA/VA7JBAAI
         90rY0EBA4IVWzhi/sFeMedQl6nmQDTIngXkMEQaY0Oj37HO4R8ZYsb26mFbeuAHx96J4
         y7zhO6LzkGVpyy1jZ2qtQPm87fjkAXH0UftLm4GfyWhhYY25eagcEcaCYQs/BTp0RkTa
         M23mGQ07bHgJKyGieJ8J3MqIl6JkSuhu9YhK/0lP0wL5+n/IsB/4lr9XQEyrVjp2CERF
         wyiuyYbDcV/Mu9ObX1LMIZLXz082oJZiu+0+LnvgPUQjmIz1yCwua2N67OW3GOpIWDaj
         4/rQ==
X-Gm-Message-State: AOAM530GkqkUIdDhqexjKHi2obhXUFWrN8S+rFZ7j1xBYortsVEtVNyI
	cy40MXQXRS4U2RFhBWKwPc12dXosmBlNKehULdgnstSq4kDivIzQqwg9mVq7cawasnUr7dkjSjD
	VtNE/pM106XhsulTIOaJx7Berrzw=
X-Received: by 2002:adf:9bcf:: with SMTP id e15mr3075488wrc.93.1601645987716;
        Fri, 02 Oct 2020 06:39:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXZ0DUtM8ag+Gzw12Jr6+YpFZwVTHU0tycGVTY/5KbE5Wb3wWL4PNJqnB0Xi/zQrZCrmxEzA==
X-Received: by 2002:adf:9bcf:: with SMTP id e15mr3075463wrc.93.1601645987503;
        Fri, 02 Oct 2020 06:39:47 -0700 (PDT)
Received: from localhost.localdomain (74.red-83-53-161.dynamicip.rima-tde.net. [83.53.161.74])
        by smtp.gmail.com with ESMTPSA id d18sm1779795wrm.10.2020.10.02.06.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 06:39:46 -0700 (PDT)
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
Subject: [PATCH 4/5] qapi: Restrict 'query-kvm' command to machine code
Date: Fri,  2 Oct 2020 15:39:22 +0200
Message-Id: <20201002133923.1716645-5-philmd@redhat.com>
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

Restricting query-kvm to machine.json pulls slightly
less QAPI-generated code into user-mode and tools.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/machine.json | 30 ++++++++++++++++++++++++++++++
 qapi/misc.json    | 30 ------------------------------
 2 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 5a3bbcae01..7c9a263778 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -561,6 +561,36 @@
 ##
 { 'command': 'inject-nmi' }
 
+##
+# @KvmInfo:
+#
+# Information about support for KVM acceleration
+#
+# @enabled: true if KVM acceleration is active
+#
+# @present: true if KVM acceleration is built into this executable
+#
+# Since: 0.14.0
+##
+{ 'struct': 'KvmInfo', 'data': {'enabled': 'bool', 'present': 'bool'} }
+
+##
+# @query-kvm:
+#
+# Returns information about KVM acceleration
+#
+# Returns: @KvmInfo
+#
+# Since: 0.14.0
+#
+# Example:
+#
+# -> { "execute": "query-kvm" }
+# <- { "return": { "enabled": true, "present": true } }
+#
+##
+{ 'command': 'query-kvm', 'returns': 'KvmInfo' }
+
 ##
 # @NumaOptionsType:
 #
diff --git a/qapi/misc.json b/qapi/misc.json
index 2a5d03a69e..9813893269 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -68,36 +68,6 @@
 ##
 { 'command': 'query-name', 'returns': 'NameInfo', 'allow-preconfig': true }
 
-##
-# @KvmInfo:
-#
-# Information about support for KVM acceleration
-#
-# @enabled: true if KVM acceleration is active
-#
-# @present: true if KVM acceleration is built into this executable
-#
-# Since: 0.14.0
-##
-{ 'struct': 'KvmInfo', 'data': {'enabled': 'bool', 'present': 'bool'} }
-
-##
-# @query-kvm:
-#
-# Returns information about KVM acceleration
-#
-# Returns: @KvmInfo
-#
-# Since: 0.14.0
-#
-# Example:
-#
-# -> { "execute": "query-kvm" }
-# <- { "return": { "enabled": true, "present": true } }
-#
-##
-{ 'command': 'query-kvm', 'returns': 'KvmInfo' }
-
 ##
 # @IOThreadInfo:
 #
-- 
2.26.2


