Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 087DA54B062
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 14:18:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348907.575184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o15V7-0006Ff-JA; Tue, 14 Jun 2022 12:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348907.575184; Tue, 14 Jun 2022 12:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o15V7-0006Cn-Dm; Tue, 14 Jun 2022 12:18:29 +0000
Received: by outflank-mailman (input) for mailman id 348907;
 Tue, 14 Jun 2022 12:18:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hf0K=WV=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1o15TA-0008Ek-VC
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 12:16:29 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf5a055f-ebdb-11ec-bd2c-47488cf2e6aa;
 Tue, 14 Jun 2022 14:16:26 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-ShlgDFknNeqfm4GcSjjXPw-1; Tue, 14 Jun 2022 08:16:21 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF5B0185A7B2;
 Tue, 14 Jun 2022 12:16:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 737951121319;
 Tue, 14 Jun 2022 12:16:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7B3B1180062F; Tue, 14 Jun 2022 14:16:11 +0200 (CEST)
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
X-Inumbo-ID: cf5a055f-ebdb-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655208984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=obSiKgR2g439N1NCymTkGuD5ZtC+AWQDUPf1CsA55V4=;
	b=QiDiqnXQIkJSVpc0dFJ8BUa3AsWf4q0hc1vNipk51ZxvPoiRIOsRJRGjp/Bi9wu0jCAqWE
	Mt9FOo6nf3ebpyILAmKPa13btdAPHrus2vDeIqoIILmuV4oe51iMqUhBa84SXu3xGKdYdl
	NTyUQF788Fn744Sqp3V8x5qrpwPtsus=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655208984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=obSiKgR2g439N1NCymTkGuD5ZtC+AWQDUPf1CsA55V4=;
	b=QiDiqnXQIkJSVpc0dFJ8BUa3AsWf4q0hc1vNipk51ZxvPoiRIOsRJRGjp/Bi9wu0jCAqWE
	Mt9FOo6nf3ebpyILAmKPa13btdAPHrus2vDeIqoIILmuV4oe51iMqUhBa84SXu3xGKdYdl
	NTyUQF788Fn744Sqp3V8x5qrpwPtsus=
X-MC-Unique: ShlgDFknNeqfm4GcSjjXPw-1
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	xen-devel@lists.xenproject.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"Canokeys.org" <contact@canokeys.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Arnout Engelen <arnout@bzzt.net>
Subject: [PULL 10/15] hw/usb/hcd-ehci: fix writeback order
Date: Tue, 14 Jun 2022 14:16:05 +0200
Message-Id: <20220614121610.508356-11-kraxel@redhat.com>
In-Reply-To: <20220614121610.508356-1-kraxel@redhat.com>
References: <20220614121610.508356-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3

From: Arnout Engelen <arnout@bzzt.net>

The 'active' bit passes control over a qTD between the guest and the
controller: set to 1 by guest to enable execution by the controller,
and the controller sets it to '0' to hand back control to the guest.

ehci_state_writeback write two dwords to main memory using DMA:
the third dword of the qTD (containing dt, total bytes to transfer,
cpage, cerr and status) and the fourth dword of the qTD (containing
the offset).

This commit makes sure the fourth dword is written before the third,
avoiding a race condition where a new offset written into the qTD
by the guest after it observed the status going to go to '0' gets
overwritten by a 'late' DMA writeback of the previous offset.

This race condition could lead to 'cpage out of range (5)' errors,
and reproduced by:

./qemu-system-x86_64 -enable-kvm -bios $SEABIOS/bios.bin -m 4096 -device usb-ehci -blockdev driver=file,read-only=on,filename=/home/aengelen/Downloads/openSUSE-Tumbleweed-DVD-i586-Snapshot20220428-Media.iso,node-name=iso -device usb-storage,drive=iso,bootindex=0 -chardev pipe,id=shell,path=/tmp/pipe -device virtio-serial -device virtconsole,chardev=shell -device virtio-rng-pci -serial mon:stdio -nographic

(press a key, select 'Installation' (2), and accept the default
values. On my machine the 'cpage out of range' is reproduced while
loading the Linux Kernel about once per 7 attempts. With the fix in
this commit it no longer fails)

This problem was previously reported as a seabios problem in
https://mail.coreboot.org/hyperkitty/list/seabios@seabios.org/thread/OUTHT5ISSQJGXPNTUPY3O5E5EPZJCHM3/
and as a nixos CI build failure in
https://github.com/NixOS/nixpkgs/issues/170803

Signed-off-by: Arnout Engelen <arnout@bzzt.net>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-ehci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index 33a8a377bd95..d4da8dcb8d15 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -2011,7 +2011,10 @@ static int ehci_state_writeback(EHCIQueue *q)
     ehci_trace_qtd(q, NLPTR_GET(p->qtdaddr), (EHCIqtd *) &q->qh.next_qtd);
     qtd = (uint32_t *) &q->qh.next_qtd;
     addr = NLPTR_GET(p->qtdaddr);
-    put_dwords(q->ehci, addr + 2 * sizeof(uint32_t), qtd + 2, 2);
+    /* First write back the offset */
+    put_dwords(q->ehci, addr + 3 * sizeof(uint32_t), qtd + 3, 1);
+    /* Then write back the token, clearing the 'active' bit */
+    put_dwords(q->ehci, addr + 2 * sizeof(uint32_t), qtd + 2, 1);
     ehci_free_packet(p);
 
     /*
-- 
2.36.1


