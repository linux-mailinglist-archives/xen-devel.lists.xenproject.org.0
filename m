Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 080B6415335
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 00:11:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193128.343994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTASr-0006Bk-N8; Wed, 22 Sep 2021 22:11:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193128.343994; Wed, 22 Sep 2021 22:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTASr-00069w-JO; Wed, 22 Sep 2021 22:11:41 +0000
Received: by outflank-mailman (input) for mailman id 193128;
 Wed, 22 Sep 2021 22:11:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6HN=OM=greensocs.com=damien.hedde@srs-us1.protection.inumbo.net>)
 id 1mTASq-00069k-0k
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 22:11:40 +0000
Received: from beetle.greensocs.com (unknown [5.135.226.135])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e48a7ee-1bf2-11ec-b9ee-12813bfff9fa;
 Wed, 22 Sep 2021 22:11:38 +0000 (UTC)
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 89D1B21ED5;
 Wed, 22 Sep 2021 16:16:01 +0000 (UTC)
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
X-Inumbo-ID: 0e48a7ee-1bf2-11ec-b9ee-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1632327362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V/wXO8Fw46s42gvXscl9fDzKCmjnZalAaCkoeLW9idc=;
	b=fzmPX4ObaVsIGjwR4GzoY/SbGumd3hE8zzTj5wQNt93NX3hZr8kYnEk/i6a/ahRb3BcyzH
	r4OPUKes6fAREsZ6M/d6oRgJNM/rLp/UW1rGVvosF72Xhv4ZT3ZMvT7X96ovqsT8bIwjFg
	MzDwJiVoSLVcg/Nq1RzI5wAN8p9MecQ=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: Damien Hedde <damien.hedde@greensocs.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Ani Sinha <ani@anisinha.ca>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	qemu-riscv@nongnu.org,
	xen-devel@lists.xenproject.org,
	mark.burton@greensocs.com,
	mirela.grujic@greensocs.com,
	edgari@xilinx.com,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH v2 15/16] hw/char/ibex_uart: set user_creatable
Date: Wed, 22 Sep 2021 18:14:04 +0200
Message-Id: <20210922161405.140018-16-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922161405.140018-1-damien.hedde@greensocs.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes

This patch allows to create the device using device_add
using -preconfig mode. This sysbus device still needs to
be allowed by a machine to be created after preconfig is done.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

Depending on chosen condition for a device to be added, this commit
may change.
---
 hw/char/ibex_uart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
index 9b0a817713..b1646422c0 100644
--- a/hw/char/ibex_uart.c
+++ b/hw/char/ibex_uart.c
@@ -546,6 +546,7 @@ static void ibex_uart_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->user_creatable = true;
     dc->reset = ibex_uart_reset;
     dc->realize = ibex_uart_realize;
     dc->vmsd = &vmstate_ibex_uart;
-- 
2.33.0


