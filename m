Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 358E71FCD69
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 14:29:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlXBy-00072O-5g; Wed, 17 Jun 2020 12:29:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UiE7=76=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1jlXBw-00070F-Tk
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 12:29:20 +0000
X-Inumbo-ID: 28402c42-b096-11ea-8496-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 28402c42-b096-11ea-8496-bc764e2007e4;
 Wed, 17 Jun 2020 12:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592396955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YPFJFaMrpuHpn0jwnWZgZ+54i5WkkV9FY9G9bgKap2I=;
 b=ddlMiZ/4277tMrCbFJW8EiK5LL4Cuafv1OgLSBJYQcHRMArt9uNqiQLAfjk4en314a2xZk
 zWZ/0Cmt/G+FtnPoqSJJjCeC6WH4xZVqX4ZOnUuvTDYhclNucAFTC/LXJnWiuOVjKI0VSc
 IpBaddoxftIlPTW4tJPu5bvV9Ea1sjs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-dhvMQHhgMGCBolP3iquecA-1; Wed, 17 Jun 2020 08:29:13 -0400
X-MC-Unique: dhvMQHhgMGCBolP3iquecA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C31421009625;
 Wed, 17 Jun 2020 12:29:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CA177BA14;
 Wed, 17 Jun 2020 12:29:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AC3581753C; Wed, 17 Jun 2020 14:29:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] microvm: drop max-ram-below-4g support
Date: Wed, 17 Jun 2020 14:28:59 +0200
Message-Id: <20200617122901.13327-3-kraxel@redhat.com>
In-Reply-To: <20200617122901.13327-1-kraxel@redhat.com>
References: <20200617122901.13327-1-kraxel@redhat.com>
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
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Not useful for microvm and allows users to shoot themself
into the foot (make ram + mmio overlap).

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-id: 20200529073957.8018-3-kraxel@redhat.com
---
 hw/i386/microvm.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 44f940813b07..5e931975a06d 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -173,25 +173,6 @@ static void microvm_memory_init(MicrovmMachineState *mms)
     ram_addr_t lowmem = 0xc0000000; /* 3G */
     int i;
 
-    /*
-     * Handle the machine opt max-ram-below-4g.  It is basically doing
-     * min(qemu limit, user limit).
-     */
-    if (!x86ms->max_ram_below_4g) {
-        x86ms->max_ram_below_4g = 4 * GiB;
-    }
-    if (lowmem > x86ms->max_ram_below_4g) {
-        lowmem = x86ms->max_ram_below_4g;
-        if (machine->ram_size - lowmem > lowmem &&
-            lowmem & (1 * GiB - 1)) {
-            warn_report("There is possibly poor performance as the ram size "
-                        " (0x%" PRIx64 ") is more then twice the size of"
-                        " max-ram-below-4g (%"PRIu64") and"
-                        " max-ram-below-4g is not a multiple of 1G.",
-                        (uint64_t)machine->ram_size, x86ms->max_ram_below_4g);
-        }
-    }
-
     if (machine->ram_size > lowmem) {
         x86ms->above_4g_mem_size = machine->ram_size - lowmem;
         x86ms->below_4g_mem_size = lowmem;
-- 
2.18.4


