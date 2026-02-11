Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8N6RJmx2jGk6ogAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 13:30:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A15F124328
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 13:30:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227445.1533835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9MN-0001q0-Jg; Wed, 11 Feb 2026 12:30:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227445.1533835; Wed, 11 Feb 2026 12:30:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9MN-0001nq-Ga; Wed, 11 Feb 2026 12:30:23 +0000
Received: by outflank-mailman (input) for mailman id 1227445;
 Wed, 11 Feb 2026 12:30:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZeC=AP=redhat.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1vq9ML-0001nh-QF
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 12:30:21 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ca6f490-0745-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 13:30:19 +0100 (CET)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-373-31_9MFcgNwi-1OT-_RHVTg-1; Wed,
 11 Feb 2026 07:30:14 -0500
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6D5361800366; Wed, 11 Feb 2026 12:30:12 +0000 (UTC)
Received: from localhost (unknown [10.45.242.6])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C076619560A3; Wed, 11 Feb 2026 12:30:10 +0000 (UTC)
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
X-Inumbo-ID: 6ca6f490-0745-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770813018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kzn58S0lNfEjMqYO60adMvk7cCAhn0+RWpF0wuFs9kY=;
	b=H2FBtrXvoCOE51RxyId7/cIHCABPgYz8p6+CH54f6Ks8ZTfORimwjYST4vhn+FbfaDTOtA
	M+tYzdLSzhOEeml+ERTRbVtkRSQAxauJmPJd1CjxnxQaHm6d7GplyGMufWYrwhPIA/MCEv
	ZLugnt/BKiatdK9pn429+qixr+3RzRU=
X-MC-Unique: 31_9MFcgNwi-1OT-_RHVTg-1
X-Mimecast-MFC-AGG-ID: 31_9MFcgNwi-1OT-_RHVTg_1770813013
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Eric Blake <eblake@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 00/14] Char patches
Date: Wed, 11 Feb 2026 16:29:47 +0400
Message-ID: <20260211123007.3569932-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: j0U4zGGTPhwc0D8JHgOUYas0o2a1c6YcOeAOtEfDIzI_1770813013
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.32 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[marcandre.lureau@redhat.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:eduardo@habkost.net,m:xen-devel@lists.xenproject.org,m:berrange@redhat.com,m:edgar.iglesias@gmail.com,m:armbru@redhat.com,m:pbonzini@redhat.com,m:marcandre.lureau@redhat.com,m:anthony@xenproject.org,m:eblake@redhat.com,m:samuel.thibault@ens-lyon.org,m:alex.bennee@linaro.org,m:philmd@linaro.org,m:sstabellini@kernel.org,m:paul@xen.org,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[habkost.net,lists.xenproject.org,redhat.com,gmail.com,xenproject.org,ens-lyon.org,linaro.org,kernel.org,xen.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marcandre.lureau@redhat.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 1A15F124328
X-Rspamd-Action: no action

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The following changes since commit 0b91040d23dc8820724a60c811223b777f3bc6b7:

  Merge tag 'pull-loongarch-20260210' of https://github.com/gaosong715/qemu into staging (2026-02-10 09:12:38 +0000)

are available in the Git repository at:

  https://gitlab.com/marcandre.lureau/qemu.git tags/char-pull-request

for you to fetch changes up to 72913e8b8ef10071965d43349516d0e7f19a959d:

  chardev: add logtimestamp option (2026-02-11 16:27:18 +0400)

----------------------------------------------------------------
chardev patches

----------------------------------------------------------------

Eric K (1):
  char-udp: Fix initial backend open status

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
 chardev/baum.c                                |  12 +-
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
 39 files changed, 437 insertions(+), 428 deletions(-)

-- 
2.52.0


