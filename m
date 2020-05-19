Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD221D8D54
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 03:56:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jarTw-00008f-VF; Tue, 19 May 2020 01:55:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Ytr=7B=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jarTv-00008a-Sv
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 01:55:48 +0000
X-Inumbo-ID: db523602-9973-11ea-b07b-bc764e2007e4
Received: from mail-qv1-xf41.google.com (unknown [2607:f8b0:4864:20::f41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db523602-9973-11ea-b07b-bc764e2007e4;
 Tue, 19 May 2020 01:55:46 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id dh1so1897285qvb.13
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 18:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dndjkB/v6249FZfKgtSAdCSkLVLnrD4llGZxAa+VIaY=;
 b=p8hAfAqVZ2oIYQWHF5VrpKZN6Ck+5KROmUJRR1VoEcqhb75D1dYZMOGnkqeoxV3azE
 AaSq4HeZLfRGrY+xevt59l8DCxvvvx94rF2rmeZszPrFlpcYIIXVwUL8w2608dUeX9JS
 26QZWk4st/XUq20sIG9f8AKtrCqPeSWEzGPgk5+0dY3HDKBcF+Uq8e5NAh0IpqkyFb62
 pbneRKvln9DyUZJL2DxPVvywBW7qRsR8uP1jf/4qT7XUTd5tEP9P8XZz6ZTfJslZ1NuX
 z6C2CJCxy72JYrVRUiyFnGxjzohXKvrkWYVVAQOuqFPbij+HC8goo9btkV8HK72ovflZ
 tplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dndjkB/v6249FZfKgtSAdCSkLVLnrD4llGZxAa+VIaY=;
 b=UNIOc9a9ZL/tCvraPRqsWcKkjk6Znq7mc5PEsZMipMtLLrPJbdazCUAcL7Sr6sfjKu
 vAAUSS2/mUZZH/uS6Xgl+/lsy0LPAaDmgEM2u2VbpY+gClFtOzkohOi0nbzVIKWs7rvp
 /u+njrlRsUdy7vSjXYiJ6qLNdi+dCpFqZaB7bBjdL2s4QtUrRO8xs3oM6IrLEtj9imbs
 AwH+eUet/5iy2iVm946IYlJCKtYefysW+0wbsxvGG7wGUxX38bKF9JvxS+GO3RVrIs05
 yiRjv3eixAd/qd+nfX/mlL1+iYnYgHeDqSMk89ig1azJXdQWxyw8/do0bzgj/kyxpkKK
 OBDg==
X-Gm-Message-State: AOAM532PwcjQHbtG5KWTqRhqbcUlakQUFr0TwqeJxLsha27YnXfiPC5h
 HEJOGWYOdguF+NU8Ppl22hf9CGAP
X-Google-Smtp-Source: ABdhPJxQUs855sOfPnW+0bb5CEns5OdP3zHwRuQDR62iy8/QfYO4IjHibmSz++CKvNo704zyM1GwRQ==
X-Received: by 2002:a0c:e488:: with SMTP id n8mr8020985qvl.172.1589853345978; 
 Mon, 18 May 2020 18:55:45 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:e463:db9c:c6eb:4544])
 by smtp.gmail.com with ESMTPSA id q2sm9731898qkn.116.2020.05.18.18.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 18:55:45 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 00/19] Add support for qemu-xen runnning in a Linux-based
 stubdomain
Date: Mon, 18 May 2020 21:54:44 -0400
Message-Id: <20200519015503.115236-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
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
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

Below is mostly the v6 cover leter with a few additions.  All patches
are Acked except for
  libxl: Use libxl__xs_* in libxl__write_stub_dmargs
  libxl: write qemu arguments into separate xenstore keys

These are refactored into Ian's preferred form (I think).  A single loop
for the xenstore transaction with behaviour differing for MiniOS and
Linux stubdoms.

In coordination with Marek, I'm making a submission of his patches for Linux
stubdomain device-model support.  I made a few of my own additions, but Marek
did the heavy lifting.  Thank you, Marek.

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

   https://github.com/jandryuk/qubes-vmm-xen-stubdom-linux
   (branch initramfs-tools, tag for-upstream-v6)

See readme there for build instructions.  Marek's version requires dracut.  I
have hacked up a version usable with initramfs-tools.

The v6 version is needed to be compatible with these changes in the v6 posting:

 - Mini-OS stubdoms use dmargs xenstore key as a string.  Linux stubdoms
   use dm-argv as a directory for numbered entries.

 - The hardcoded "fd:3" for the restore image is replaced with the
   placehodler string $STUBDOM_RESTORE_INCOMING_ARG.  The stubdom
   initscript needs to replace that with a an "fd:$FD" string to the
   hooked up console 2.

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
Changes in v6:
 - Squash vchan-proxy kill and socket cleanup into "libxl: use vchan for
   QMP access with Linux stubdomain".
 - Use dm-argv as the xenstore directory for the QEMU arguments.
 - Use $STUBDOM_RESTORE_INCOMING_ARG as a placeholder instead of
   hardcoding "fd:3".
 - Comment to re-run autotools.
 - Add Acked-by from Ian Jackson where approriate.
Changes in v7:
 - Have libxl__write_stub_dmargs handle both minios and linux qemu
   arguments.
 - Add Acked-by from Ian Jackson where approriate.

Eric Shelton (1):
  libxl: Handle Linux stubdomain specific QEMU options.

Jason Andryuk (4):
  libxl: Use libxl__xs_* in libxl__write_stub_dmargs
  libxl: Refactor kill_device_model to libxl__kill_xs_path
  docs: Add device-model-domid to xenstore-paths
  libxl: Check stubdomain kernel & ramdisk presence

Marek Marczykowski-Górecki (14):
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
  libxl: require qemu in dom0 for multiple stubdomain consoles
  libxl: ignore emulated IDE disks beyond the first 4
  libxl: consider also qemu in stubdomain in libxl__dm_active check

 .gitignore                          |   1 +
 configure                           |  14 +-
 docs/configure                      |  14 +-
 docs/man/xl.cfg.5.pod.in            |  27 +-
 docs/misc/stubdom.txt               | 105 ++++++
 docs/misc/xenstore-paths.pandoc     |   5 +
 stubdom/configure                   |  14 +-
 tools/Rules.mk                      |   2 +-
 tools/config.h.in                   |   3 +
 tools/configure                     |  46 ++-
 tools/configure.ac                  |   9 +
 tools/libvchan/Makefile             |   8 +-
 tools/libvchan/init.c               |   3 +
 tools/libvchan/vchan-socket-proxy.c | 478 ++++++++++++++++++++++++
 tools/libxl/libxl_aoutils.c         |  32 ++
 tools/libxl/libxl_create.c          |  46 ++-
 tools/libxl/libxl_dm.c              | 558 +++++++++++++++++++++-------
 tools/libxl/libxl_domain.c          |  10 +
 tools/libxl/libxl_internal.h        |  22 ++
 tools/libxl/libxl_mem.c             |   6 +-
 tools/libxl/libxl_qmp.c             |  27 +-
 tools/libxl/libxl_types.idl         |   3 +
 tools/xl/xl_parse.c                 |   7 +
 23 files changed, 1230 insertions(+), 210 deletions(-)
 create mode 100644 tools/libvchan/vchan-socket-proxy.c

-- 
2.25.1


