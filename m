Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDQlNhKGjGmfqAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 14:37:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F22B124D30
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 14:37:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227657.1534090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqAP3-0001yk-Lp; Wed, 11 Feb 2026 13:37:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227657.1534090; Wed, 11 Feb 2026 13:37:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqAP3-0001xB-Ik; Wed, 11 Feb 2026 13:37:13 +0000
Received: by outflank-mailman (input) for mailman id 1227657;
 Wed, 11 Feb 2026 13:37:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lkCz=AP=redhat.com=mlureau@srs-se1.protection.inumbo.net>)
 id 1vqAP1-0001Yd-VK
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 13:37:11 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c38b7fd6-074e-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 14:37:10 +0100 (CET)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-jAjlQM_xOkuukRqgi7Jbiw-1; Wed, 11 Feb 2026 08:37:07 -0500
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3545dbb7ee6so1711942a91.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 05:37:07 -0800 (PST)
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
X-Inumbo-ID: c38b7fd6-074e-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770817029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qd7nm8qxOkE+F9KPOP3qjaaC0X9mVSTZ4G3T8UhCNAU=;
	b=K0b8QwEpCL+Nb/MFTuuWCK9tGKx5jueKhY0XQFlqEGY3pXsMYqGzDfcuV0m2drfnfoVDZ6
	FzE8v64wJ4uzP1jrudoLNocUZR5rlU7k4aeY2SVfVyLNIxxxHsWr12fvdpRWS8RusD37My
	N9OArR2dAKUaJTkgRD92w3udVyFMwQ4=
X-MC-Unique: jAjlQM_xOkuukRqgi7Jbiw-1
X-Mimecast-MFC-AGG-ID: jAjlQM_xOkuukRqgi7Jbiw_1770817027
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770817026; x=1771421826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qd7nm8qxOkE+F9KPOP3qjaaC0X9mVSTZ4G3T8UhCNAU=;
        b=eanI+5hp9rekde5LxHvxZPwua+pvVaRKXyMe7a2+7ZPDyQNA7pzuUlV6LcmwvAe/3h
         fzxM+ZFQKC7/mUo9+irHhzOWnSsjJS47wx/41uJX3VjCo6GTgOrtfFBNuVboBknb4gai
         286JrKudJa1+Jvy+dGvtWjDdQITvoysX0LzW0NRhq6kY9VxVRjgDZaCyGgqfsQ8JBiu7
         MkoZn01dBapIHo9yHiQzTd6yIqEs7P1grCVLcyJRnKjqfRs1AkPPLem2Bq8qvi34rN2L
         ZpxWuXeVUN0rMmG/yDFhBm5W+9NwoLnVYe1t4T/HwVLYdSTuDrKT7SGnT9awKI4c4HJr
         wyOA==
X-Forwarded-Encrypted: i=1; AJvYcCUOyksqa54e4Xj4Md5t27Ds3yz9ToNblBhJ7nVXNuM5t1d0JRAQVJpvqy469DuEszARTgeZOrJLz1k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYdlHwLwW4UPr/pUojtVq7cUuQrYtQ30AE3qytOr1ni1Ya+l8d
	82A7YbsZIwC5QWzlBS1JnyO0PbWyd5rPxrTnIy+5DcgWKsNzUXCBFGd4zyYXtK1YOb9akh0S5G4
	fbYdaiQwEuFt/e5T6fUllVoNmROX7YsheO4l54Pw4Nz545SplXSTKY/P8JrWFTEspa8WW5cys4M
	f3qQJsOxL4jASMUFyGC3Z2Vavs9+h6UtECigagi9UbX94=
X-Gm-Gg: AZuq6aJXqW9vT27RutC9H4o1Oh7lssHiTewUx/9gFsk+vAcNChbQqSLXt1nNkAUoIHo
	Dp+MuTsq3bA+w/FiS66pM2CBHXo/vcNqfljd4PEJauN/BT6l9R63eZpF+68FW5X1f6j5sTyxXRD
	xfFkAif3j9DPwylQ1dovBlhH/pvKcNWPBRXyp1u4MWBaB7nFyBVAypzZhcVFEgp3lKfueWRPBc2
	dd5i4QZlq0nNdvMIKs1biwZSULSHAoy7T4KOQ==
X-Received: by 2002:a17:90b:4a08:b0:354:b2f6:b4e4 with SMTP id 98e67ed59e1d1-354b39da597mr13879213a91.0.1770817025651;
        Wed, 11 Feb 2026 05:37:05 -0800 (PST)
X-Received: by 2002:a17:90b:4a08:b0:354:b2f6:b4e4 with SMTP id
 98e67ed59e1d1-354b39da597mr13879193a91.0.1770817025223; Wed, 11 Feb 2026
 05:37:05 -0800 (PST)
MIME-Version: 1.0
References: <20260211123007.3569932-1-marcandre.lureau@redhat.com>
In-Reply-To: <20260211123007.3569932-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 11 Feb 2026 17:36:52 +0400
X-Gm-Features: AZwV_Qir2RaHBkpvZhNqpXRKdUvNAJhrkTkAMwaplDprCUWzZblhGrIatsOqekc
Message-ID: <CAMxuvay6yd0434Bv3id3gsKezxaX8C=s-RBHLR306hoE5B=SFw@mail.gmail.com>
Subject: Re: [PULL 00/14] Char patches
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, xen-devel@lists.xenproject.org, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Markus Armbruster <armbru@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Anthony PERARD <anthony@xenproject.org>, 
	Eric Blake <eblake@redhat.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3XT4d9cc_cFuo7GiZlpoMMOJRPm20nyBMH4cXHzW594_1770817027
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:eduardo@habkost.net,m:xen-devel@lists.xenproject.org,m:berrange@redhat.com,m:edgar.iglesias@gmail.com,m:armbru@redhat.com,m:pbonzini@redhat.com,m:anthony@xenproject.org,m:eblake@redhat.com,m:samuel.thibault@ens-lyon.org,m:alex.bennee@linaro.org,m:philmd@linaro.org,m:sstabellini@kernel.org,m:paul@xen.org,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[marcandre.lureau@redhat.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[habkost.net,lists.xenproject.org,redhat.com,gmail.com,xenproject.org,ens-lyon.org,linaro.org,kernel.org,xen.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid,gitlab.com:url,meson.build:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marcandre.lureau@redhat.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3F22B124D30
X-Rspamd-Action: no action

Hi

On Wed, Feb 11, 2026 at 4:30=E2=80=AFPM <marcandre.lureau@redhat.com> wrote=
:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit 0b91040d23dc8820724a60c811223b777f3bc6=
b7:
>
>   Merge tag 'pull-loongarch-20260210' of https://github.com/gaosong715/qe=
mu into staging (2026-02-10 09:12:38 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/marcandre.lureau/qemu.git tags/char-pull-request
>
> for you to fetch changes up to 72913e8b8ef10071965d43349516d0e7f19a959d:
>
>   chardev: add logtimestamp option (2026-02-11 16:27:18 +0400)
>
> ----------------------------------------------------------------
> chardev patches
>
> ----------------------------------------------------------------
>

self-nack, it failed win32 compilation:
https://gitlab.com/marcandre.lureau/qemu/-/jobs/13073244313

> Eric K (1):
>   char-udp: Fix initial backend open status
>
> Vladimir Sementsov-Ogievskiy (13):
>   ui/spice: Require spice-server >=3D 0.15.0
>   ui/spice: drop SPICE_HAS_ATTACHED_WORKER macro
>   chardev: ChardevClass: consistent naming for handlers
>   chardev: consistent naming for ChardevClass handlers implementations
>   chardev: .chr_open(): drop be_opened parameter
>   chardev: .chr_open(): add boolean return value
>   chardev/char-pty: store pty_name into PtyChardev state
>   chardev: introduce .chr_get_pty_name() handler
>   chardev: rework filename handling
>   chardev/char: qemu_char_open(): add return value
>   char: qemu_chr_write_log() use qemu_write_full()
>   error-report: make real_time_iso8601() public
>   chardev: add logtimestamp option
>
>  meson.build                                   |   2 +-
>  qapi/char.json                                |   6 +-
>  include/chardev/char.h                        |  23 ++-
>  include/qemu/error-report.h                   |   6 +
>  include/ui/qemu-spice.h                       |   6 -
>  chardev/baum.c                                |  12 +-
>  chardev/char-console.c                        |  10 +-
>  chardev/char-fe.c                             |   8 +-
>  chardev/char-file.c                           |  26 ++--
>  chardev/char-hub.c                            |  27 ++--
>  chardev/char-mux.c                            |  30 ++--
>  chardev/char-null.c                           |   9 +-
>  chardev/char-parallel.c                       |  41 +++---
>  chardev/char-pipe.c                           |  30 ++--
>  chardev/char-pty.c                            |  56 ++++---
>  chardev/char-ringbuf.c                        |  20 +--
>  chardev/char-serial.c                         |  39 ++---
>  chardev/char-socket.c                         |  73 ++++------
>  chardev/char-stdio.c                          |  30 ++--
>  chardev/char-udp.c                            |  18 +--
>  chardev/char-win-stdio.c                      |  25 ++--
>  chardev/char.c                                | 137 ++++++++++++------
>  chardev/msmouse.c                             |  13 +-
>  chardev/spice.c                               |  52 +++----
>  chardev/wctablet.c                            |  10 +-
>  gdbstub/system.c                              |  12 +-
>  hw/char/xen_console.c                         |   7 +-
>  hw/display/qxl.c                              |  23 +--
>  hw/misc/ivshmem-pci.c                         |   7 +-
>  tests/unit/test-char.c                        |   2 +
>  ui/console-vc.c                               |  12 +-
>  ui/dbus-chardev.c                             |  16 +-
>  ui/dbus.c                                     |   4 +-
>  ui/gtk.c                                      |  14 +-
>  ui/spice-app.c                                |  18 +--
>  ui/spice-display.c                            |  19 +--
>  ui/vdagent.c                                  |  17 +--
>  util/error-report.c                           |   3 +-
>  .../codeconverter/test_regexps.py             |   2 +-
>  39 files changed, 437 insertions(+), 428 deletions(-)
>
> --
> 2.52.0
>


