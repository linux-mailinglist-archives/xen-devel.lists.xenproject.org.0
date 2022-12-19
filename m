Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD7A650C58
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 14:02:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466032.724857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Fme-0006aH-LE; Mon, 19 Dec 2022 13:02:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466032.724857; Mon, 19 Dec 2022 13:02:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Fme-0006YW-IY; Mon, 19 Dec 2022 13:02:20 +0000
Received: by outflank-mailman (input) for mailman id 466032;
 Mon, 19 Dec 2022 13:02:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fa7U=4R=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1p7Fmc-0006YQ-Kl
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 13:02:19 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57137575-7f9d-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 14:02:07 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-8JV0muoNMwyA4rcqg3b1mQ-1; Mon, 19 Dec 2022 08:02:07 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F26F7810BD2;
 Mon, 19 Dec 2022 13:02:06 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FEE114152F6;
 Mon, 19 Dec 2022 13:02:06 +0000 (UTC)
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
X-Inumbo-ID: 57137575-7f9d-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671454935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QVqSB9wB2qrALRQPMZT6ihrQ0/2mf+IxHI35zGJFZFg=;
	b=cM0IpFyykyiogLFLz6X7DZRdy6Rkqu+QfPQjgUCx9xBbZVTgJoGMx9k5cgZXKboe2dnuyi
	56B5U04gKL7sA5azsgFCrSZn1/TTmT5+3wtHdCS2xlZ+f0PKtWRhxtyy1iYhjRmcstV8qd
	IYpxawX7T5FuH/BeigSXTFOzPlhFhks=
X-MC-Unique: 8JV0muoNMwyA4rcqg3b1mQ-1
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org,
	Laurent Vivier <lvivier@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	virtio-fs@redhat.com,
	Michael Roth <michael.roth@amd.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-block@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	John Snow <jsnow@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 0/6] enforce use of G_GNUC_PRINTF annotations
Date: Mon, 19 Dec 2022 08:01:59 -0500
Message-Id: <20221219130205.687815-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7

We've been very gradually adding G_GNUC_PRINTF annotations
to functions over years. This has been useful in detecting
certain malformed printf strings, or cases where we pass
user data as the printf format which is a potential security
flaw.

Given the inherant memory corruption danger in use of format
strings vs mis-matched variadic arguments, it is worth applying
G_GNUC_PRINTF to all functions using printf, even if we know
they are safe.

The compilers can reasonably reliably identify such places
with the -Wsuggest-attribute=format / -Wmissing-format-attribute
flags.

This series adds G_GNUC_PRINTF / G_GNUC_SCANF to allow the code
locations that the compilers highlight. Then it adds the above
warning flags to the build flags, to catch any future additions
of functions that take printf/scanf format strings.

Daniel P. Berrangé (6):
  disas: add G_GNUC_PRINTF to gstring_printf
  hw/xen: use G_GNUC_PRINTF/SCANF for various functions
  tools/virtiofsd: add G_GNUC_PRINTF for logging functions
  util/error: add G_GNUC_PRINTF for various functions
  tests: add G_GNUC_PRINTF for various functions
  enforce use of G_GNUC_PRINTF attributes

 configure                         |  2 ++
 disas.c                           |  1 +
 hw/xen/xen-bus.c                  |  1 +
 hw/xen/xen_pvdev.c                |  1 +
 include/hw/xen/xen-bus-helper.h   |  6 ++++--
 include/hw/xen/xen-bus.h          |  3 ++-
 tests/qtest/ahci-test.c           |  3 +++
 tests/qtest/arm-cpu-features.c    |  1 +
 tests/qtest/erst-test.c           |  2 +-
 tests/qtest/ide-test.c            |  3 ++-
 tests/qtest/ivshmem-test.c        |  4 ++--
 tests/qtest/libqmp.c              |  2 +-
 tests/qtest/libqos/libqos-pc.h    |  6 ++++--
 tests/qtest/libqos/libqos-spapr.h |  6 ++++--
 tests/qtest/libqos/libqos.h       |  6 ++++--
 tests/qtest/libqos/virtio-9p.c    |  1 +
 tests/qtest/migration-helpers.h   |  1 +
 tests/qtest/rtas-test.c           |  2 +-
 tests/qtest/usb-hcd-uhci-test.c   |  4 ++--
 tests/unit/test-qmp-cmds.c        | 13 +++++++++----
 tools/virtiofsd/fuse_log.c        |  1 +
 tools/virtiofsd/fuse_log.h        |  6 ++++--
 tools/virtiofsd/passthrough_ll.c  |  1 +
 util/error-report.c               |  1 +
 util/error.c                      |  1 +
 25 files changed, 55 insertions(+), 23 deletions(-)

-- 
2.38.1


