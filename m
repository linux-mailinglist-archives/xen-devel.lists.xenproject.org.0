Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1421BB4E9
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 06:06:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTHUu-0000MD-6l; Tue, 28 Apr 2020 04:05:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vxmr=6M=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jTHUs-0000M8-3Q
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 04:05:26 +0000
X-Inumbo-ID: 7cea8480-8905-11ea-ae69-bc764e2007e4
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7cea8480-8905-11ea-ae69-bc764e2007e4;
 Tue, 28 Apr 2020 04:05:25 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id c23so15747159qtp.11
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 21:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4/7xFqOrb91eS4rpAZKI6VWcij3qXjaaQ78Xq4yTH7A=;
 b=mSZOcgl5dO6nLIWcecW4coY9gcxK2Tmt62F03Y66nsUaRLvy3c2aB7SWDRalFpZpCu
 NpDPptPits4/ACz8s9DtSianweoXTIXrFZQ1NQP3fgZG9ydpcrBrCuzQOfQcUaS6BdFQ
 V4iOgqFOVB5Fc/FJI6ZUgBd+sx5wQ9ktDe3gEgYphZ1T+G9nxrpHw1uIfiAD1EVvej/w
 qLiWXA5hr/DY/WwXLVF+3Q3j7Jmo1Q0UaV6yh8X/zcry8l2Y9CXGrCPXSYIh42ak3faw
 +ZUwDKwrjFJr+s8quWso1p+KYrGGr4ZkuWBXlpxqjZtZiofiFamei1jXd5ZNdHyQFt/D
 KISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4/7xFqOrb91eS4rpAZKI6VWcij3qXjaaQ78Xq4yTH7A=;
 b=hH4l4SBdlUrS0FHxGGo4/EbyUK7c+lL4GLYNFij46t3unxnxzSPEYHFhaNqKC4skg6
 tFbXju0SVnUGqHfo6pbfIT3N4xLPgocKN3hRPg17bo5HZG5gR/492DH7GwIKvboT4Ty8
 cZU+8zmzrQKVe+OB5ZveE/87OLP6ihSVHcCQj53pGI5Kv9Z7nBL3JfFiDBWmdbRLoNt2
 hfM8ER06pTr8Cxe4DrMSDKfVa4EQwlERbKQOh+oqBzol0HTjbfpP3kDFMwyVr0bdmFA6
 AoWCrRWIztFngifsSdzerI3eWQr77mTSbuJW1yIYQJxxNWDL453ls3W3DQCVFix+fDEY
 UmBA==
X-Gm-Message-State: AGi0Pub5y8P810L6DEhk3YU/GgTWuo9iZhmC+V5Nm4+xRiTqfl8w9k1y
 VuLzYEhMCOTX0SAAnhkz2kScRsNqTAc=
X-Google-Smtp-Source: APiQypItCpdAcvCLTTP23gV2A0RgbABCgaSFaHr8HjvJYzrouYh5nUtoCnxl4tyryN7Uj8OPhrqUeA==
X-Received: by 2002:ac8:1a8a:: with SMTP id x10mr26141504qtj.154.1588046724342; 
 Mon, 27 Apr 2020 21:05:24 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:f1d1:23b9:fc94:a1a9])
 by smtp.gmail.com with ESMTPSA id v2sm13445480qth.66.2020.04.27.21.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 21:05:23 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 00/21] Add support for qemu-xen runnning in a Linux-based
 stubdomain
Date: Tue, 28 Apr 2020 00:04:12 -0400
Message-Id: <20200428040433.23504-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Simon Gaiser <simon@invisiblethingslab.com>,
 Jan Beulich <jbeulich@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Eric Shelton <eshelton@pobox.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

In coordination with Marek, I'm making a submission of his patches for Linux
stubdomain device-model support.  I made a few of my own additions, but Marek
did the heavy lifting.  Thank you, Marek.

Below is mostly the v4 cover leter with a few additions.

General idea is to allow freely set device_model_version and
device_model_stubdomain_override and choose the right options based on this
choice.  Also, allow to specific path to stubdomain kernel/ramdisk, for greater
flexibility.

First two patches add documentation about expected toolstack-stubdomain-qemu
interface, both for MiniOS stubdomain and Linux stubdomain.

Initial version has no QMP support - in initial patches it is completely
disabled, which means no suspend/restore and no PCI passthrough.

Later patches add QMP over libvchan connection support. The actual connection
is made in a separate process. As discussed on Xen Summit 2019, this allows to
apply some basic checks and/or filtering (not part of this series), to limit
libxl exposure for potentially malicious stubdomain.

Jason's additions ensure the qmp-proxy (vchan-socket-proxy) processes and
sockets are cleaned up and add some documentation.

The actual stubdomain implementation is here:

    https://github.com/marmarek/qubes-vmm-xen-stubdom-linux
    (branch for-upstream, tag for-upstream-v3)

See readme there for build instructions.  Marek's version requires dracut.  I
have hacked up a version usable install with initramfs-tools:

   https://github.com/jandryuk/qubes-vmm-xen-stubdom-linux
   (branch initramfs-tools)

Few comments/questions about the stubdomain code:

1. There are extra patches for qemu that are necessary to run it in stubdomain.
While it is desirable to upstream them, I think it can be done after merging
libxl part. Stubdomain's qemu build will in most cases be separate anyway, to
limit qemu's dependencies (so the stubdomain size).

2. By default Linux hvc-xen console frontend is unreliable for data transfer
(qemu state save/restore) - it drops data sent faster than client is reading
it. To fix it, console device needs to be switched into raw mode (`stty raw
/dev/hvc1`). Especially for restoring qemu state it is tricky, as it would need
to be done before opening the device, but stty (obviously) needs to open the
device first. To solve this problem, for now the repository contains kernel
patch which changes the default for all hvc consoles. Again, this isn't
practical problem, as the kernel for stubdomain is built separately. But it
would be nice to have something working with vanilla kernel. I see those
options:
  - convert it to kernel cmdline parameter (hvc_console_raw=1 ?)
  - use channels instead of consoles (and on the kernel side change the default
    to "raw" only for channels); while in theory better design, libxl part will
    be more complex, as channels can be connected to sockets but not files, so
    libxl would need to read/write to it exactly when qemu write/read the data,
    not before/after as it is done now

3. Mini-OS stubdoms use dmargs xenstore key as a string.  Linux stubdoms use
dmargs as a directory for numbered entries.  Should they be different names?

Remaining parts for eliminating dom0's instance of qemu:
 - do not force QDISK backend for CDROM
 - multiple consoles support in xenconsoled

Changes in v2:
 - apply review comments by Jason Andryuk
Changes in v3:
 - rework qemu arguments handling (separate xenstore keys, instead of \x1b separator)
 - add QMP over libvchan, instead of console
 - add protocol documentation
 - a lot of minor changes, see individual patches for full changes list
 - split xenconsoled patches into separate series
Changes in v4:
 - extract vchan connection into a separate process
 - rebase on master
 - various fixes
Changes in v5:
 - Marek: apply review comments from Jason Andryuk
 - Jason: Clean up qmp-proxy processes and sockets

Cc: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>
Cc: Eric Shelton <eshelton@pobox.com>
Cc: Ian Jackson <ian.jackson@citrix.com>
Cc: Wei Liu <wl@xen.org>

Eric Shelton (1):
  libxl: Handle Linux stubdomain specific QEMU options.

Jason Andryuk (5):
  docs: Add device-model-domid to xenstore-paths
  libxl: Check stubdomain kernel & ramdisk presence
  libxl: Refactor kill_device_model to libxl__kill_xs_path
  libxl: Kill vchan-socket-proxy when cleaning up qmp
  tools: Clean up vchan-socket-proxy socket

Marek Marczykowski-Górecki (15):
  Document ioemu MiniOS stubdomain protocol
  Document ioemu Linux stubdomain protocol
  libxl: fix qemu-trad cmdline for no sdl/vnc case
  libxl: Allow running qemu-xen in stubdomain
  libxl: write qemu arguments into separate xenstore keys
  xl: add stubdomain related options to xl config parser
  tools/libvchan: notify server when client is connected
  libxl: add save/restore support for qemu-xen in stubdomain
  tools: add missing libxenvchan cflags
  tools: add simple vchan-socket-proxy
  libxl: use vchan for QMP access with Linux stubdomain
  Regenerate autotools files
  libxl: require qemu in dom0 even if stubdomain is in use
  libxl: ignore emulated IDE disks beyond the first 4
  libxl: consider also qemu in stubdomain in libxl__dm_active check

 .gitignore                          |   1 +
 configure                           |  14 +-
 docs/configure                      |  14 +-
 docs/man/xl.cfg.5.pod.in            |  27 +-
 docs/misc/stubdom.txt               | 103 ++++++
 docs/misc/xenstore-paths.pandoc     |   5 +
 stubdom/configure                   |  14 +-
 tools/Rules.mk                      |   2 +-
 tools/config.h.in                   |   3 +
 tools/configure                     |  46 ++-
 tools/configure.ac                  |   9 +
 tools/libvchan/Makefile             |   8 +-
 tools/libvchan/init.c               |   3 +
 tools/libvchan/vchan-socket-proxy.c | 500 ++++++++++++++++++++++++++++
 tools/libxl/libxl_aoutils.c         |  32 ++
 tools/libxl/libxl_create.c          |  46 ++-
 tools/libxl/libxl_dm.c              | 484 +++++++++++++++++++++------
 tools/libxl/libxl_domain.c          |   7 +
 tools/libxl/libxl_internal.h        |  22 ++
 tools/libxl/libxl_mem.c             |   6 +-
 tools/libxl/libxl_qmp.c             |  27 +-
 tools/libxl/libxl_types.idl         |   3 +
 tools/xl/xl_parse.c                 |   7 +
 23 files changed, 1205 insertions(+), 178 deletions(-)
 create mode 100644 tools/libvchan/vchan-socket-proxy.c

-- 
2.20.1


