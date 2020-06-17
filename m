Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4601FCD67
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 14:29:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlXBs-00070K-9b; Wed, 17 Jun 2020 12:29:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UiE7=76=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1jlXBr-00070A-E0
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 12:29:15 +0000
X-Inumbo-ID: 27ec9168-b096-11ea-b9d6-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 27ec9168-b096-11ea-b9d6-12813bfff9fa;
 Wed, 17 Jun 2020 12:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592396954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wUr9c1FJi7A1aTjG8v2DGsv6CTJYWqCn2CZCN7xc4cw=;
 b=BSg/OGnVFfzojhq5jt/hE4vfcjEikuNGZQ0Y+b6w955oH8E4MEW6dudDgnKyNX6YB7RnaF
 e6EuJmatv2gjCvvO7NRL6pSpkWn17KS8ZFnRzskUf4YreVY4kr5+UkuwV3OH5GXiD7xvFY
 Yj1M5MizUeRfR0ekJnGMsw2UuJ7WxkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-SRuNPBTVOlyeotJDUcrfYQ-1; Wed, 17 Jun 2020 08:29:13 -0400
X-MC-Unique: SRuNPBTVOlyeotJDUcrfYQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2D94107B472;
 Wed, 17 Jun 2020 12:29:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5782379302;
 Wed, 17 Jun 2020 12:29:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C7C0A9D8F; Wed, 17 Jun 2020 14:29:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] microvm: move virtio base to 0xfeb00000
Date: Wed, 17 Jun 2020 14:29:01 +0200
Message-Id: <20200617122901.13327-5-kraxel@redhat.com>
In-Reply-To: <20200617122901.13327-1-kraxel@redhat.com>
References: <20200617122901.13327-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Place virtio-mmio devices near the other mmio regions,
next ioapic is at @ 0xfec00000.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-id: 20200529073957.8018-5-kraxel@redhat.com
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


