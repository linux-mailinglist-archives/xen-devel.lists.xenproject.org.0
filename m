Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A93571E770D
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 09:40:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeZcn-0007Ke-Mp; Fri, 29 May 2020 07:40:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3I2r=7L=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1jeZcn-0007KY-5T
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 07:40:17 +0000
X-Inumbo-ID: a184ad9e-a17f-11ea-a877-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a184ad9e-a17f-11ea-a877-12813bfff9fa;
 Fri, 29 May 2020 07:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590738013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FEpeW4hSXWUgbGj7HHo1jY8yfFQRooPvNkXyo34CA7s=;
 b=AClKcPqWlP5ohZSc4nTz35uVT1gx7Xd9QRO3Th2ZxfP9Xbm5ouirnqcBBJ2Mx5eFKkt+ER
 Ti/lT8e/FcXBCbZ9Z8ZuTW/y9VojnR1Bo+iJA3ATK/0w+Gs+k9DZEfsMDafKeVdf50LbmV
 sZliqI0mRVn3aVnZzsbILje1f8Ddc8Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-Q409k48zNK-msMJjsPcrfg-1; Fri, 29 May 2020 03:40:11 -0400
X-MC-Unique: Q409k48zNK-msMJjsPcrfg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30E79107ACCA;
 Fri, 29 May 2020 07:40:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6935A6298C;
 Fri, 29 May 2020 07:39:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3BB719DAD; Fri, 29 May 2020 09:39:57 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/4] microvm: use 3G split unconditionally
Date: Fri, 29 May 2020 09:39:54 +0200
Message-Id: <20200529073957.8018-2-kraxel@redhat.com>
In-Reply-To: <20200529073957.8018-1-kraxel@redhat.com>
References: <20200529073957.8018-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 imammedo@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Looks like the logic was copied over from q35.

q35 does this for backward compatibility, there is no reason to do this
on microvm though.  Also microvm doesn't need much mmio space, 1G is
more than enough.  Using an mmio window smaller than 1G is bad for
gigabyte alignment and hugepages though.  So split @ 3G unconditionally.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/microvm.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 937db10ae6a5..44f940813b07 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -170,23 +170,9 @@ static void microvm_memory_init(MicrovmMachineState *mms)
     MemoryRegion *ram_below_4g, *ram_above_4g;
     MemoryRegion *system_memory = get_system_memory();
     FWCfgState *fw_cfg;
-    ram_addr_t lowmem;
+    ram_addr_t lowmem = 0xc0000000; /* 3G */
     int i;
 
-    /*
-     * Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
-     * and 256 Mbytes for PCI Express Enhanced Configuration Access Mapping
-     * also known as MMCFG).
-     * If it doesn't, we need to split it in chunks below and above 4G.
-     * In any case, try to make sure that guest addresses aligned at
-     * 1G boundaries get mapped to host addresses aligned at 1G boundaries.
-     */
-    if (machine->ram_size >= 0xb0000000) {
-        lowmem = 0x80000000;
-    } else {
-        lowmem = 0xb0000000;
-    }
-
     /*
      * Handle the machine opt max-ram-below-4g.  It is basically doing
      * min(qemu limit, user limit).
-- 
2.18.4


