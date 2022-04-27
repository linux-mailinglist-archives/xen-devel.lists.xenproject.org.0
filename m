Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADD45116CC
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 14:34:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314968.533264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njgrI-00036N-DM; Wed, 27 Apr 2022 12:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314968.533264; Wed, 27 Apr 2022 12:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njgrI-000344-AM; Wed, 27 Apr 2022 12:33:28 +0000
Received: by outflank-mailman (input) for mailman id 314968;
 Wed, 27 Apr 2022 12:33:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nU4i=VF=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1njgrH-00033y-4C
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 12:33:27 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b3ffa49-c626-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 14:33:26 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-pUyrpyLNMPWNyG7PDLHo0Q-1; Wed, 27 Apr 2022 08:33:20 -0400
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B808803D4E;
 Wed, 27 Apr 2022 12:33:19 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CE5A5742F4;
 Wed, 27 Apr 2022 12:33:18 +0000 (UTC)
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
X-Inumbo-ID: 3b3ffa49-c626-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651062804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Qet0lokKOWtqzVKSO0FqVbZx/S8u2uKt2DstxZ7gIoo=;
	b=Yg8PmfxUVhjy+9RhBwDWjmzpdqmfZGHKlYMixnUlPDpogbqMayP0+fjOgZ5mwjOE8Gj2C7
	Y/UTqWAbyaS4lJIDhOE7DZ0x9so8mvylTINtpDYJ0oViSznRklfCvBP/tGPFTLnRTPV2ak
	orUzqvf+CO7GFAyVoJ0xHH4zIff1NXg=
X-MC-Unique: pUyrpyLNMPWNyG7PDLHo0Q-1
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kraxel@redhat.com,
	qemu-trivial@nongnu.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH] softmmu/vl: Fence 'xenfb' if Xen support is not compiled in
Date: Wed, 27 Apr 2022 14:33:16 +0200
Message-Id: <20220427123316.329312-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9

The 'xenfb' parameter for the '-vga' command line option is currently
always enabled unconditionally (since the xenfb is not a proper QOM
device that could be tested via its class name). That means it also
shows up if Xen is not enabled at all, e.g. like this:

 $ ./qemu-system-sparc -vga help
 none                 no graphic card
 xenfb                Xen paravirtualized framebuffer
 tcx                  TCX framebuffer (default)
 cg3                  CG3 framebuffer

Let's avoid this situation by fencing the parameter with the
CONFIG_XEN_BACKEND switch.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 softmmu/vl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 06a0e342fe..e26421b815 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -934,10 +934,12 @@ static const VGAInterfaceInfo vga_interfaces[VGA_TYPE_MAX] = {
         .name = "CG3 framebuffer",
         .class_names = { "cgthree" },
     },
+#ifdef CONFIG_XEN_BACKEND
     [VGA_XENFB] = {
         .opt_name = "xenfb",
         .name = "Xen paravirtualized framebuffer",
     },
+#endif
 };
 
 static bool vga_interface_available(VGAInterfaceType t)
-- 
2.27.0


