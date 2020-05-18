Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FE81D6E74
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 03:15:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaUMe-0008SA-Ap; Mon, 18 May 2020 01:14:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJLm=7A=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jaUMc-0008S5-1F
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 01:14:42 +0000
X-Inumbo-ID: f325192c-98a4-11ea-b07b-bc764e2007e4
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f325192c-98a4-11ea-b07b-bc764e2007e4;
 Mon, 18 May 2020 01:14:41 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id p12so6807385qtn.13
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2020 18:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AjO9kkt5bMdK0S8Ne/6CQZwANRVtIV2wBZ1lc1Nj27g=;
 b=pFmqH/y+TAs8gwaQTKUwL2fnTsjIrU/KF/XOv2XPu2xj6DK3venX8LTJEhc7Bbk/li
 OQwsI7c8ecgBAaImOBCQbfheHk0ZXBREa9RX781f8ThYsphxRTRYMYzia8B8j5kCJb+r
 wLYuE11rRf+XL74zxJP/PItqAkck40Ia4bxLiu3QwFzslUTSxGyN4hQuk6QNx/ZjMLK7
 pmYBATA1lDVjG2WZNlUH7KxrBsckSCf6JluS9m7nfiYfB5tqyAiSYNgprytJS/ZehSMI
 32IzO2mI9m292zhxvu9OUrw0+CO4zszGcu+pAcggr5oVK/70u1lTfoPovpT/WUe/hqvU
 tl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AjO9kkt5bMdK0S8Ne/6CQZwANRVtIV2wBZ1lc1Nj27g=;
 b=bHetmOSsDZ4FirkMD3TLuL0lpWuYTnqUmGPn9q5DPr+5OTRRIQhg1HSOOIPyk0cEF2
 vYIN9SUrVBX5htCpWXAhWoy12I1DmkbnTBkbFaaltbcO+alq/fxohVcWfKElnRpIfc7q
 K7uiB/uHlgJz8ednTM60WPLQiPZgRyCRn8fWIbbtGOyfABHwFjwxyACR8Ut4fGITkR79
 N99JYW1TEOz3ofA1tFfiLVD+MMine86sDhQ3jvsmM1UmIs8NCYnUX6Wv6GHmxmcLC278
 qs2JHmvT5hM5Egm2mrjNhqmBCFwdh8NPLzjiHLsWtacj0gXjet26EH3ZZr1l8IAB3ym1
 EiJw==
X-Gm-Message-State: AOAM5316IaP9KVtjjZjVxG5Ewe3aROWpgOsAcTi9/9Q/wMMllFmxMnnA
 EpOLsC78xqzxMHMnjYKXYCrr22wdayI=
X-Google-Smtp-Source: ABdhPJzk3UMrvPbTVGipeZvHLW8jkkL2P8wcQKp+/bfuYa5dOeomzXK3NnhG5KezYUpIF/9C0S38wg==
X-Received: by 2002:ac8:326d:: with SMTP id y42mr13923879qta.243.1589764480140; 
 Sun, 17 May 2020 18:14:40 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:ec68:c92e:af5a:2d3a])
 by smtp.gmail.com with ESMTPSA id l2sm7072864qkd.57.2020.05.17.18.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 18:14:39 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 00/18] Add support for qemu-xen runnning in a Linux-based
 stubdomain
Date: Sun, 17 May 2020 21:13:35 -0400
Message-Id: <20200518011353.326287-1-jandryuk@gmail.com>
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

In coordination with Marek, I'm making a submission of his patches for Linux
stubdomain device-model support.  I made a few of my own additions, but Marek
did the heavy lifting.  Thank you, Marek.

Below is mostly the v5 cover leter with a few additions.

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

Eric Shelton (1):
  libxl: Handle Linux stubdomain specific QEMU options.

Jason Andryuk (3):
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
 tools/libvchan/vchan-socket-proxy.c | 478 ++++++++++++++++++++++++++
 tools/libxl/libxl_aoutils.c         |  32 ++
 tools/libxl/libxl_create.c          |  46 ++-
 tools/libxl/libxl_dm.c              | 506 ++++++++++++++++++++++------
 tools/libxl/libxl_domain.c          |  10 +
 tools/libxl/libxl_internal.h        |  22 ++
 tools/libxl/libxl_mem.c             |   6 +-
 tools/libxl/libxl_qmp.c             |  27 +-
 tools/libxl/libxl_types.idl         |   3 +
 tools/xl/xl_parse.c                 |   7 +
 23 files changed, 1209 insertions(+), 179 deletions(-)
 create mode 100644 tools/libvchan/vchan-socket-proxy.c

-- 
2.25.1


