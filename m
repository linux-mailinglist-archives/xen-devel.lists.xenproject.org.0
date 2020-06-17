Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A41021FCD68
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 14:29:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlXBt-00070b-Ir; Wed, 17 Jun 2020 12:29:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UiE7=76=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1jlXBr-00070F-W2
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 12:29:16 +0000
X-Inumbo-ID: 2826993a-b096-11ea-8496-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 2826993a-b096-11ea-8496-bc764e2007e4;
 Wed, 17 Jun 2020 12:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592396955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zb2O4LSZD2edy8bGwjrUcS/0sbskbMKnSoDc3GN7pZo=;
 b=L2pGyrMsf3p95xbE9KH3T3jhVNMsik0HSHZuDHhONqkZhAaGQq3onZE5apd6HRpUQYfBBk
 0jRoZ0aXtThVZRk0X5NeeEMvmOGsJy7hPoQDjp3/Be67nabdc06/2w9LHqOcUXTLngRgiV
 NwWFZlCW231584FXOvWsF7CPCAJ9upc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-_dMmP07cP0WQCOcEEX7-_A-1; Wed, 17 Jun 2020 08:29:13 -0400
X-MC-Unique: _dMmP07cP0WQCOcEEX7-_A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAE79134D5;
 Wed, 17 Jun 2020 12:29:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5291F5D9D3;
 Wed, 17 Jun 2020 12:29:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A32FE1750C; Wed, 17 Jun 2020 14:29:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] microvm: use 3G split unconditionally
Date: Wed, 17 Jun 2020 14:28:58 +0200
Message-Id: <20200617122901.13327-2-kraxel@redhat.com>
In-Reply-To: <20200617122901.13327-1-kraxel@redhat.com>
References: <20200617122901.13327-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Looks like the logic was copied over from q35.

q35 does this for backward compatibility, there is no reason to do this
on microvm though.  Also microvm doesn't need much mmio space, 1G is
more than enough.  Using an mmio window smaller than 1G is bad for
gigabyte alignment and hugepages though.  So split @ 3G unconditionally.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-id: 20200529073957.8018-2-kraxel@redhat.com
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


