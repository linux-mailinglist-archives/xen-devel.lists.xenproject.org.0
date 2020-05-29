Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A425E1E770C
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 09:40:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeZcs-0007MH-V8; Fri, 29 May 2020 07:40:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3I2r=7L=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1jeZcs-0007M0-5k
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 07:40:22 +0000
X-Inumbo-ID: a1ef532c-a17f-11ea-a877-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a1ef532c-a17f-11ea-a877-12813bfff9fa;
 Fri, 29 May 2020 07:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590738013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4iqwU8K1xw7zSdeBIG54ZrsqaU3AB+FYUp1ncUWCyLA=;
 b=EcPIUYH0SZNAl1A5UfewodZ8bSbbiYcK59EymKOhYcDh/0M7ys0OyE4HxHn+vZvo7mRe5p
 To1FOrpwFYS1ux7y1zpsCllU9TjfDAiE8mDB/lqegPfIR3YixWlZy3Wwgnyrm28D2PuO+i
 Z50PuKPOOpA6nxJFLWpGc1c9Qy9S1fw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-Lmzt2jhAOjaXj-0gVVTj-g-1; Fri, 29 May 2020 03:40:11 -0400
X-MC-Unique: Lmzt2jhAOjaXj-0gVVTj-g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4272C461;
 Fri, 29 May 2020 07:40:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EBAA60C05;
 Fri, 29 May 2020 07:39:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 44EB19DAE; Fri, 29 May 2020 09:39:57 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/4] microvm: drop max-ram-below-4g support
Date: Fri, 29 May 2020 09:39:55 +0200
Message-Id: <20200529073957.8018-3-kraxel@redhat.com>
In-Reply-To: <20200529073957.8018-1-kraxel@redhat.com>
References: <20200529073957.8018-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Not useful for microvm and allows users to shoot themself
into the foot (make ram + mmio overlap).

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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


