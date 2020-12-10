Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C3B2D5C34
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 14:49:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49239.87047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMIr-0006Mm-9v; Thu, 10 Dec 2020 13:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49239.87047; Thu, 10 Dec 2020 13:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMIr-0006MN-6K; Thu, 10 Dec 2020 13:48:17 +0000
Received: by outflank-mailman (input) for mailman id 49239;
 Thu, 10 Dec 2020 13:48:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nlUt=FO=redhat.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
 id 1knMIp-0006MI-2X
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 13:48:15 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 9b677d54-238b-4520-a7da-6b7d44d251e6;
 Thu, 10 Dec 2020 13:48:13 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-p-pu4U4xNmybGAAj8pkIRQ-1; Thu, 10 Dec 2020 08:48:09 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A6141005E48;
 Thu, 10 Dec 2020 13:48:07 +0000 (UTC)
Received: from localhost (unknown [10.36.110.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 521085D9DD;
 Thu, 10 Dec 2020 13:47:55 +0000 (UTC)
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
X-Inumbo-ID: 9b677d54-238b-4520-a7da-6b7d44d251e6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607608093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=anpnx/tw5p62yFhBITy05bzKP3wcJQGVw5OZrWMts1E=;
	b=BAwICLTLxv0oGQhFhA1ceAn2wOYQBQX0BSZEsKBi36D0gnUw4vGL1QXL+t2JTxsqurA7Mu
	NDe4KM0SWPygZUlWjPq0hXrbszlrRKnJgfBFebiKk9b9rb4fN8cGaQOciYHsFtV87YCsta
	GuB8aWhiOmTcO65pBV24OkHYXvCoQPg=
X-MC-Unique: p-pu4U4xNmybGAAj8pkIRQ-1
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: philmd@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 00/13] Remove GCC < 4.8 checks
Date: Thu, 10 Dec 2020 17:47:39 +0400
Message-Id: <20201210134752.780923-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
Since commit efc6c07 ("configure: Add a test for the minimum compiler versi=
on"),=0D
QEMU explicitely depends on GCC >=3D 4.8.=0D
=0D
v3:=0D
 - drop first patch replacing QEMU_GNUC_PREREQ with G_GNUC_CHECK_VERSION=0D
 - add last patch to remove QEMU_GNUC_PREREQ=0D
 - tweak commit messages to replace clang 3.8 with clang 3.4=0D
 - fix some extra coding style=0D
 - collect r-b/a-b tags=0D
=0D
v2:=0D
 - include reviewed Philippe earlier series=0D
 - drop problematic patch to replace GCC_FMT_ATTR, but tweak the check to b=
e clang=0D
 - replace QEMU_GNUC_PREREQ with G_GNUC_CHECK_VERSION=0D
 - split changes=0D
 - add patches to drop __GNUC__ checks (clang advertizes itself as 4.2.1, u=
nless=0D
   -fgnuc-version=3D0)=0D
=0D
Marc-Andr=C3=A9 Lureau (11):=0D
  compiler.h: remove GCC < 3 __builtin_expect fallback=0D
  qemu-plugin.h: remove GCC < 4=0D
  tests: remove GCC < 4 fallbacks=0D
  virtiofsd: replace _Static_assert with QEMU_BUILD_BUG_ON=0D
  compiler.h: explicit case for Clang printf attribute=0D
  audio: remove GNUC & MSVC check=0D
  poison: remove GNUC check=0D
  xen: remove GNUC check=0D
  compiler: remove GNUC check=0D
  linux-user: remove GNUC check=0D
  compiler.h: remove QEMU_GNUC_PREREQ=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  qemu/atomic: Drop special case for unsupported compiler=0D
  accel/tcg: Remove special case for GCC < 4.6=0D
=0D
 include/exec/poison.h              |  2 --=0D
 include/hw/xen/interface/io/ring.h |  9 ------=0D
 include/qemu/atomic.h              | 17 -----------=0D
 include/qemu/compiler.h            | 45 ++++++++----------------------=0D
 include/qemu/qemu-plugin.h         |  9 ++----=0D
 scripts/cocci-macro-file.h         |  1 -=0D
 tools/virtiofsd/fuse_common.h      | 11 +-------=0D
 accel/tcg/cpu-exec.c               |  2 +-=0D
 audio/audio.c                      |  8 +-----=0D
 linux-user/strace.c                |  4 ---=0D
 tests/tcg/arm/fcvt.c               |  8 ++----=0D
 11 files changed, 20 insertions(+), 96 deletions(-)=0D
=0D
--=20=0D
2.29.0=0D
=0D


