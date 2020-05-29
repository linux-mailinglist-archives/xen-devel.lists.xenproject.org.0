Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DCC1E770E
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 09:40:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeZck-0007Jp-6n; Fri, 29 May 2020 07:40:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3I2r=7L=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1jeZci-0007Jk-Ah
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 07:40:12 +0000
X-Inumbo-ID: a02a850c-a17f-11ea-a877-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a02a850c-a17f-11ea-a877-12813bfff9fa;
 Fri, 29 May 2020 07:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590738010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=ssGDGVmdYGoZoZzLhx8dAk7n43EOoBPZwcr8nrwVXFM=;
 b=BSwN0RYN/l0QxejSfnU1qCsKqZczhSsM5ek7vW28DsJabwLtrAi/IUcfpeaCOr799dxeEC
 yBgXc+byZ9uoSZZSB61ewFdPvVZZvWa66FVzTjY46Zj/YT5KbiaBKsIukkqD0O5RJI5oHg
 bcFLObFkUyZ1ucS4Uk7ZbKMUqEhRTJE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-9Zu2jfIcPd2yPb2z-z5D6w-1; Fri, 29 May 2020 03:40:08 -0400
X-MC-Unique: 9Zu2jfIcPd2yPb2z-z5D6w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98693107ACF2;
 Fri, 29 May 2020 07:40:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FDFE10013DB;
 Fri, 29 May 2020 07:39:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6100F9DB0; Fri, 29 May 2020 09:39:57 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/4] microvm: move virtio base to 0xfeb00000
Date: Fri, 29 May 2020 09:39:57 +0200
Message-Id: <20200529073957.8018-5-kraxel@redhat.com>
In-Reply-To: <20200529073957.8018-1-kraxel@redhat.com>
References: <20200529073957.8018-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 imammedo@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Place virtio-mmio devices near the other mmio regions,
next ioapic is at @ 0xfec00000.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/i386/microvm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
index ba68d1f22bb3..fd34b78e0d2a 100644
--- a/include/hw/i386/microvm.h
+++ b/include/hw/i386/microvm.h
@@ -26,7 +26,7 @@
 #include "hw/i386/x86.h"
 
 /* Platform virtio definitions */
-#define VIRTIO_MMIO_BASE      0xc0000000
+#define VIRTIO_MMIO_BASE      0xfeb00000
 #define VIRTIO_IRQ_BASE       5
 #define VIRTIO_NUM_TRANSPORTS 8
 #define VIRTIO_CMDLINE_MAXLEN 64
-- 
2.18.4


