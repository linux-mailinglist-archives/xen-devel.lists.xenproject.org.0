Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C12F2C4966
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 21:57:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38065.70687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ki1qb-0008UE-R8; Wed, 25 Nov 2020 20:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38065.70687; Wed, 25 Nov 2020 20:57:05 +0000
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
	id 1ki1qb-0008Tq-NL; Wed, 25 Nov 2020 20:57:05 +0000
Received: by outflank-mailman (input) for mailman id 38065;
 Wed, 25 Nov 2020 20:57:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yzfx=E7=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1ki1qa-0008Tl-9o
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 20:57:04 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 38c23258-97bd-4ad7-908c-1465e61840fc;
 Wed, 25 Nov 2020 20:57:03 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-AaIHiFkGOLqrKW3-qBNNqg-1; Wed, 25 Nov 2020 15:56:58 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 938AF1005D62;
 Wed, 25 Nov 2020 20:56:56 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4230F60854;
 Wed, 25 Nov 2020 20:56:56 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Yzfx=E7=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
	id 1ki1qa-0008Tl-9o
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 20:57:04 +0000
X-Inumbo-ID: 38c23258-97bd-4ad7-908c-1465e61840fc
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 38c23258-97bd-4ad7-908c-1465e61840fc;
	Wed, 25 Nov 2020 20:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606337822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kcyTO1EndQuMSTqqIVsGvEARRbZE17kEQ/mI/5TZMqc=;
	b=dIPPZrOk2/l4Uh/CP/fTOkVRa7VJIIQixF7ocsHcarqTk2TvDYFtVPe6Nfcc9juwSxi3Ne
	ONjAL3u+NctLrS9I7e86U493VeV2XXQgchRbWlXwwACnn8TM+7YfSue5IXgQYUFS1X+yQr
	ACRNQ+kJZmqAkmpUWZAOrId/F07ftPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-AaIHiFkGOLqrKW3-qBNNqg-1; Wed, 25 Nov 2020 15:56:58 -0500
X-MC-Unique: AaIHiFkGOLqrKW3-qBNNqg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 938AF1005D62;
	Wed, 25 Nov 2020 20:56:56 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4230F60854;
	Wed, 25 Nov 2020 20:56:56 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Claudio Fontana <cfontana@suse.de>,
	Roman Bolshakov <r.bolshakov@yadro.com>
Subject: [PATCH v2 4/6] xen: Delete xen_available() function
Date: Wed, 25 Nov 2020 15:56:34 -0500
Message-Id: <20201125205636.3305257-5-ehabkost@redhat.com>
In-Reply-To: <20201125205636.3305257-1-ehabkost@redhat.com>
References: <20201125205636.3305257-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

The function can be replaced with accel_available("xen").

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Claudio Fontana <cfontana@suse.de>
Cc: Roman Bolshakov <r.bolshakov@yadro.com>
---
 include/sysemu/arch_init.h | 2 --
 softmmu/arch_init.c        | 9 ---------
 softmmu/vl.c               | 6 +++---
 3 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index b32ce1afa9..40ac8052b7 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -32,6 +32,4 @@ enum {
 
 extern const uint32_t arch_type;
 
-int xen_available(void);
-
 #endif
diff --git a/softmmu/arch_init.c b/softmmu/arch_init.c
index 79383c8db8..f4770931f5 100644
--- a/softmmu/arch_init.c
+++ b/softmmu/arch_init.c
@@ -49,12 +49,3 @@ int graphic_depth = 32;
 
 
 const uint32_t arch_type = QEMU_ARCH;
-
-int xen_available(void)
-{
-#ifdef CONFIG_XEN
-    return 1;
-#else
-    return 0;
-#endif
-}
diff --git a/softmmu/vl.c b/softmmu/vl.c
index e6e0ad5a92..74b6ebf1e4 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3667,21 +3667,21 @@ void qemu_init(int argc, char **argv, char **envp)
                 has_defaults = 0;
                 break;
             case QEMU_OPTION_xen_domid:
-                if (!(xen_available())) {
+                if (!(accel_available("xen"))) {
                     error_report("Option not supported for this target");
                     exit(1);
                 }
                 xen_domid = atoi(optarg);
                 break;
             case QEMU_OPTION_xen_attach:
-                if (!(xen_available())) {
+                if (!(accel_available("xen"))) {
                     error_report("Option not supported for this target");
                     exit(1);
                 }
                 xen_mode = XEN_ATTACH;
                 break;
             case QEMU_OPTION_xen_domid_restrict:
-                if (!(xen_available())) {
+                if (!(accel_available("xen"))) {
                     error_report("Option not supported for this target");
                     exit(1);
                 }
-- 
2.28.0


