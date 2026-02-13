Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oA5zGtzzjmk5GAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 10:50:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2554134A80
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 10:50:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230414.1535885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqpoG-0001R1-1w; Fri, 13 Feb 2026 09:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230414.1535885; Fri, 13 Feb 2026 09:50:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqpoF-0001P5-VB; Fri, 13 Feb 2026 09:49:59 +0000
Received: by outflank-mailman (input) for mailman id 1230414;
 Fri, 13 Feb 2026 09:49:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bqff=AR=redhat.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1vqpoE-0001Na-Ct
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 09:49:58 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59a45184-08c1-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 10:49:56 +0100 (CET)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-204-UO1G8VWWM5-a0I864hO_Mw-1; Fri,
 13 Feb 2026 04:49:47 -0500
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4BFFD196C419; Fri, 13 Feb 2026 09:49:41 +0000 (UTC)
Received: from localhost (unknown [10.44.22.41])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 108D3195419A; Fri, 13 Feb 2026 09:49:39 +0000 (UTC)
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
X-Inumbo-ID: 59a45184-08c1-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770976194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IXmpt2l7PcSQ+AKwEbUfhSafyH2QKeY5bZPxnsfgnEU=;
	b=JcrdQ+styHtjuer3cHDC4cTK5ZH6zx4BofHqQU2hMdYFoh9t9Yzl9qaRSe+Tvc3PutxIzK
	ZI/g7Yn7vaIRElF2rSr2fLS6Gh7R9P02+jnPM1XR6ogePa/MGVMwEHnAy8I7U0dVkDln5r
	p5mB+C8NBVQb+1ls9RsDr4WNQxLt1Vc=
X-MC-Unique: UO1G8VWWM5-a0I864hO_Mw-1
X-Mimecast-MFC-AGG-ID: UO1G8VWWM5-a0I864hO_Mw_1770976184
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Anthony PERARD <anthony@xenproject.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PULL v2 00/15] Char patches
Date: Fri, 13 Feb 2026 10:49:19 +0100
Message-ID: <20260213094938.4074478-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: mh_euurqAZLu2kyuwWdAjTCNrM2_O1B_lYBjV1qNMpI_1770976184
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.32 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:alex.bennee@linaro.org,m:edgar.iglesias@gmail.com,m:berrange@redhat.com,m:eblake@redhat.com,m:armbru@redhat.com,m:paul@xen.org,m:anthony@xenproject.org,m:philmd@linaro.org,m:eduardo@habkost.net,m:pbonzini@redhat.com,m:marcandre.lureau@redhat.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:samuel.thibault@ens-lyon.org,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[marcandre.lureau@redhat.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,redhat.com,xen.org,xenproject.org,habkost.net,kernel.org,lists.xenproject.org,ens-lyon.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marcandre.lureau@redhat.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: F2554134A80
X-Rspamd-Action: no action

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The following changes since commit 4ed6a7f2fdc09d9fc3411e83e278da0085122016:

  Merge tag 'pull-block-jobs-2026-02-12' of https://gitlab.com/vsementsov/qemu into staging (2026-02-12 14:35:18 +0000)

are available in the Git repository at:

  https://gitlab.com/marcandre.lureau/qemu.git tags/char-pull-request

for you to fetch changes up to 98ba0e479771a391137119264156e9661508bbc7:

  baum: Add copy/paste bindings (2026-02-13 10:45:07 +0100)

----------------------------------------------------------------
chardev patches

----------------------------------------------------------------

Eric K (1):
  char-udp: Fix initial backend open status

Samuel Thibault (1):
  baum: Add copy/paste bindings

Vladimir Sementsov-Ogievskiy (13):
  ui/spice: Require spice-server >= 0.15.0
  ui/spice: drop SPICE_HAS_ATTACHED_WORKER macro
  chardev: ChardevClass: consistent naming for handlers
  chardev: consistent naming for ChardevClass handlers implementations
  chardev: .chr_open(): drop be_opened parameter
  chardev: .chr_open(): add boolean return value
  chardev/char-pty: store pty_name into PtyChardev state
  chardev: introduce .chr_get_pty_name() handler
  chardev: rework filename handling
  chardev/char: qemu_char_open(): add return value
  char: qemu_chr_write_log() use qemu_write_full()
  error-report: make real_time_iso8601() public
  chardev: add logtimestamp option

 meson.build                                   |   2 +-
 qapi/char.json                                |   6 +-
 include/chardev/char.h                        |  23 ++-
 include/qemu/error-report.h                   |   6 +
 include/ui/qemu-spice.h                       |   6 -
 chardev/baum.c                                |  50 ++++++-
 chardev/char-console.c                        |  10 +-
 chardev/char-fe.c                             |   8 +-
 chardev/char-file.c                           |  26 ++--
 chardev/char-hub.c                            |  27 ++--
 chardev/char-mux.c                            |  30 ++--
 chardev/char-null.c                           |   9 +-
 chardev/char-parallel.c                       |  41 +++---
 chardev/char-pipe.c                           |  30 ++--
 chardev/char-pty.c                            |  56 ++++---
 chardev/char-ringbuf.c                        |  20 +--
 chardev/char-serial.c                         |  39 ++---
 chardev/char-socket.c                         |  73 ++++------
 chardev/char-stdio.c                          |  30 ++--
 chardev/char-udp.c                            |  18 +--
 chardev/char-win-stdio.c                      |  25 ++--
 chardev/char.c                                | 137 ++++++++++++------
 chardev/msmouse.c                             |  13 +-
 chardev/spice.c                               |  52 +++----
 chardev/wctablet.c                            |  10 +-
 gdbstub/system.c                              |  12 +-
 hw/char/xen_console.c                         |   7 +-
 hw/display/qxl.c                              |  23 +--
 hw/misc/ivshmem-pci.c                         |   7 +-
 tests/unit/test-char.c                        |   2 +
 ui/console-vc.c                               |  12 +-
 ui/dbus-chardev.c                             |  16 +-
 ui/dbus.c                                     |   4 +-
 ui/gtk.c                                      |  14 +-
 ui/spice-app.c                                |  18 +--
 ui/spice-display.c                            |  19 +--
 ui/vdagent.c                                  |  17 +--
 util/error-report.c                           |   3 +-
 .../codeconverter/test_regexps.py             |   2 +-
 39 files changed, 473 insertions(+), 430 deletions(-)

-- 
2.52.0


