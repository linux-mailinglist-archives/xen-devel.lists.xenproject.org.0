Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F5F30A681
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 12:29:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79770.145277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6XOK-0002YU-B2; Mon, 01 Feb 2021 11:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79770.145277; Mon, 01 Feb 2021 11:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6XOK-0002Y7-7S; Mon, 01 Feb 2021 11:29:12 +0000
Received: by outflank-mailman (input) for mailman id 79770;
 Mon, 01 Feb 2021 11:29:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUbX=HD=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1l6XOI-0002Y2-Ad
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 11:29:10 +0000
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39cf8ec7-362d-469c-bcbd-fa41da21f339;
 Mon, 01 Feb 2021 11:29:09 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v15so16201879wrx.4
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 03:29:09 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id x81sm21819860wmg.40.2021.02.01.03.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:29:07 -0800 (PST)
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
X-Inumbo-ID: 39cf8ec7-362d-469c-bcbd-fa41da21f339
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TX4T29tQMNqmDsICQt4DTx558hzr8lARDzNE3099YzQ=;
        b=cmfFtwCA+tgOSGKlnimSvXFLT15H8AxoX9KZP875N9P3SFSZc5jw8QxAHtF0UpmvUp
         i8mAwIklyL85PQE2+TqNbKMxp9S7e/K724ACw4np3/cgi/SLI/BsS1zMw9WR5WjX+/Ok
         RpgyUVbzxhIWeOdfC7lBP+BW38aXonPfyMCw2MLBDvP02Ef6Ha/PE/wKb0Wj9USH976u
         3hO+qiXXjTmtrkTcN6AfzSrqUWoX0uIQP9VpV+e4TmKLu4b6kC8BTgKzr6IVeGdaDKvH
         8L9LqVl3FU/ilIjd41mGqsykj/EcDtipVF4VsJ5uh0sHjamWoKv+CZU+tRMQfUBmuosN
         Fb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=TX4T29tQMNqmDsICQt4DTx558hzr8lARDzNE3099YzQ=;
        b=fBkxIojzL5XJDvcvrCOahMaajIbmeWdy/BYxoMKFJsvaYszCc3k46lEWYY3nqFpCM4
         n9CjRbgXy3qgbiKGMTIWqcOcLWttOacQcJMUxC+boptG132o1+Ghc0VFnVeASiB7hrq1
         SOWoHXMUACSgsqyCe5A+uS+X+r/8+xlju/9piD/jVDKfBr1qzE9yCXHdLK82/xPuJ4DD
         +6uEw6FQZ8BT6/JbLBLNJEFOWSZTcKDAG4beJvMY5I7+MMPySPFi6U61MM0KueXLSTLp
         k0ohK92NOf3CvzXm/2/uPlPGZ4JIxjOPIqnyWXUv2edIRidJVadBu5mc5grjGUJ8uShj
         6nYg==
X-Gm-Message-State: AOAM531ZL5RIrYuKv+JbI/HqSbXnBroT7EGZh32hU7cKKaqxPvYL7lVn
	kqlf5gGY3U3vBNK0xhHIIuE=
X-Google-Smtp-Source: ABdhPJw0nJTtf9Bc1689UuS28OIRlRbCYYGpd67R1WBnjeVFdvngEGU5yH3pxA6EJNWEunMJWx8L4w==
X-Received: by 2002:adf:f452:: with SMTP id f18mr17213716wrp.11.1612178948626;
        Mon, 01 Feb 2021 03:29:08 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 0/7] hw/xen: Introduce XEN_FV/XEN_PV Kconfig
Date: Mon,  1 Feb 2021 12:28:58 +0100
Message-Id: <20210201112905.545144-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Sort the Xen buildsys glue a bit.=0D
=0D
The first patches are probably ready now.=0D
=0D
Since v2:=0D
- Addressed some of Paolo's comments=0D
- More fixes=0D
- XEN_PV still not buildable alone -> postponed=0D
=0D
v2: Considered Paolo's comments from v1=0D
=0D
Philippe Mathieu-Daud=C3=A9 (7):=0D
  meson: Do not build Xen x86_64-softmmu on Aarch64=0D
  hw/xen: Relax dependency on FSDEV_9P=0D
  accel/xen: Incorporate xen-mapcache.c=0D
  hw/i386/xen: Introduce XEN_FV Kconfig=0D
  hw/xen: Make xen_shutdown_fatal_error() available out of X86 HVM=0D
  hw/xen: Make qmp_xen_set_global_dirty_log() available out of X86 HVM=0D
  NOTFORMERGE hw/xen/Kconfig: Introduce XEN_PV config=0D
=0D
 meson.build                           |  8 ++++++--=0D
 accel/xen/trace.h                     |  1 +=0D
 {hw/i386 =3D> accel}/xen/xen-mapcache.c |  0=0D
 hw/i386/xen/xen-hvm.c                 | 24 ------------------------=0D
 hw/xen/xen-legacy-backend.c           |  3 ++-=0D
 hw/xen/xen-migration.c                | 22 ++++++++++++++++++++++=0D
 hw/xen/xen-utils.c                    | 25 +++++++++++++++++++++++++=0D
 accel/Kconfig                         |  2 +-=0D
 accel/xen/meson.build                 |  5 ++++-=0D
 accel/xen/trace-events                | 10 ++++++++++=0D
 hw/Kconfig                            |  1 +=0D
 hw/i386/Kconfig                       |  2 ++=0D
 hw/i386/xen/Kconfig                   |  5 +++++=0D
 hw/i386/xen/meson.build               |  3 +--=0D
 hw/i386/xen/trace-events              |  6 ------=0D
 hw/xen/Kconfig                        |  7 +++++++=0D
 hw/xen/meson.build                    |  4 +++-=0D
 17 files changed, 90 insertions(+), 38 deletions(-)=0D
 create mode 100644 accel/xen/trace.h=0D
 rename {hw/i386 =3D> accel}/xen/xen-mapcache.c (100%)=0D
 create mode 100644 hw/xen/xen-migration.c=0D
 create mode 100644 hw/xen/xen-utils.c=0D
 create mode 100644 accel/xen/trace-events=0D
 create mode 100644 hw/i386/xen/Kconfig=0D
 create mode 100644 hw/xen/Kconfig=0D
=0D
-- =0D
2.26.2=0D
=0D

