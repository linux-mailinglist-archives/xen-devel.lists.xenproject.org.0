Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE601CE53F
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 22:19:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYEtP-0007HQ-JZ; Mon, 11 May 2020 20:19:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3lka=6Z=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jYEtO-0007HL-Rd
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 20:19:14 +0000
X-Inumbo-ID: ae025f9c-93c4-11ea-9887-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae025f9c-93c4-11ea-9887-bc764e2007e4;
 Mon, 11 May 2020 20:19:13 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id u20so734011ljo.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2020 13:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=T5kY+GMis5F+wvvF0php5urmVU2PMNnTQwEVgNiABEg=;
 b=f6fjOl+JmhNL4PDwNK6vwOmikNCaXVj40g8EHtmZzBoajkanEJ4V266PFYoW0bWu2n
 zZQo4PZ2OcOK9RDN2e7LOYoBOkks7gDae55gPLaKAo7+MLZAICoPx3uuxUHP3BANyO2F
 6WMZTBPevgBodk+YGHJ6UaP+EianacWMAJf6hTc7kz5I+gixJUrGfRHvcnxlYKmt6OKm
 9npKyIGRCMH63O2og85Cjkv1mprA063qaDGXsPYV+paSXKEUiQuc3Sc76Y446j97f+vn
 wsv/pw5WloXVVVOjUNaoXEKxjnLkeb26HgvV4ZC/R3MzAUnALtSO456VL3pPXwyG1Oel
 pqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=T5kY+GMis5F+wvvF0php5urmVU2PMNnTQwEVgNiABEg=;
 b=d7roO+pyJGCDtOWt693vtB06ilhs3Rp9z787zvOc4QFqASLAS6UYU2Xrl8OXT73CGF
 oJvnKTQSLSaF9GNn+NEA2ArfNMbbbzTHx9NhkflgAfmoo5UB/yBfkUR3W2SGJoWM7R97
 pgy0VztQVk7TUP1ybh4HPwi5xutUqJpRSq/+ByLOMbyrzOOGAbHHudQPzzDzBaVbhcbu
 BddWRtc7AiyID0F1uH8Yq6SzZZ6ivMUFjzrXP1aG5SE7wQyWLQ6puZ7uLwaEq6fzEjeY
 gwLPnx7nzmRPHQOIBYm/IqYzMCeKHGJf4DoHfHZAAfH/tXcoiEBtddxdgn8RDy6nFWSC
 1zcQ==
X-Gm-Message-State: AOAM530ik2usrmvrhR0YEK5ZI0twcxrs68L7NmmECaVXT0EeGzQB2IGS
 4Pwk/cf0CYLFUdTUnGpMl27jAOoPngJSydzddG2p0Q==
X-Google-Smtp-Source: ABdhPJxCfp+QaFoMiwvAyLI6hD+yJ+kmMA4RER9mktwiexYy/vSsHJwA+7TjjPNpxbKM/663SNH5YBngKFQThs+xBDE=
X-Received: by 2002:a2e:8018:: with SMTP id j24mr11599288ljg.246.1589228352065; 
 Mon, 11 May 2020 13:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200428040433.23504-1-jandryuk@gmail.com>
In-Reply-To: <20200428040433.23504-1-jandryuk@gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 11 May 2020 16:19:00 -0400
Message-ID: <CAKf6xptOrADAOfiFsjKknw9j5qcO4k+c=AQxDLFDt+u2N3y5vQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/21] Add support for qemu-xen runnning in a
 Linux-based stubdomain
To: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Simon Gaiser <simon@invisiblethingslab.com>,
 Jan Beulich <jbeulich@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Eric Shelton <eshelton@pobox.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ping?

-Jason

On Tue, Apr 28, 2020 at 12:05 AM Jason Andryuk <jandryuk@gmail.com> wrote:
>
> Hi,
>
> In coordination with Marek, I'm making a submission of his patches for Li=
nux
> stubdomain device-model support.  I made a few of my own additions, but M=
arek
> did the heavy lifting.  Thank you, Marek.
>
> Below is mostly the v4 cover leter with a few additions.
>
> General idea is to allow freely set device_model_version and
> device_model_stubdomain_override and choose the right options based on th=
is
> choice.  Also, allow to specific path to stubdomain kernel/ramdisk, for g=
reater
> flexibility.
>
> First two patches add documentation about expected toolstack-stubdomain-q=
emu
> interface, both for MiniOS stubdomain and Linux stubdomain.
>
> Initial version has no QMP support - in initial patches it is completely
> disabled, which means no suspend/restore and no PCI passthrough.
>
> Later patches add QMP over libvchan connection support. The actual connec=
tion
> is made in a separate process. As discussed on Xen Summit 2019, this allo=
ws to
> apply some basic checks and/or filtering (not part of this series), to li=
mit
> libxl exposure for potentially malicious stubdomain.
>
> Jason's additions ensure the qmp-proxy (vchan-socket-proxy) processes and
> sockets are cleaned up and add some documentation.
>
> The actual stubdomain implementation is here:
>
>     https://github.com/marmarek/qubes-vmm-xen-stubdom-linux
>     (branch for-upstream, tag for-upstream-v3)
>
> See readme there for build instructions.  Marek's version requires dracut=
.  I
> have hacked up a version usable install with initramfs-tools:
>
>    https://github.com/jandryuk/qubes-vmm-xen-stubdom-linux
>    (branch initramfs-tools)
>
> Few comments/questions about the stubdomain code:
>
> 1. There are extra patches for qemu that are necessary to run it in stubd=
omain.
> While it is desirable to upstream them, I think it can be done after merg=
ing
> libxl part. Stubdomain's qemu build will in most cases be separate anyway=
, to
> limit qemu's dependencies (so the stubdomain size).
>
> 2. By default Linux hvc-xen console frontend is unreliable for data trans=
fer
> (qemu state save/restore) - it drops data sent faster than client is read=
ing
> it. To fix it, console device needs to be switched into raw mode (`stty r=
aw
> /dev/hvc1`). Especially for restoring qemu state it is tricky, as it woul=
d need
> to be done before opening the device, but stty (obviously) needs to open =
the
> device first. To solve this problem, for now the repository contains kern=
el
> patch which changes the default for all hvc consoles. Again, this isn't
> practical problem, as the kernel for stubdomain is built separately. But =
it
> would be nice to have something working with vanilla kernel. I see those
> options:
>   - convert it to kernel cmdline parameter (hvc_console_raw=3D1 ?)
>   - use channels instead of consoles (and on the kernel side change the d=
efault
>     to "raw" only for channels); while in theory better design, libxl par=
t will
>     be more complex, as channels can be connected to sockets but not file=
s, so
>     libxl would need to read/write to it exactly when qemu write/read the=
 data,
>     not before/after as it is done now
>
> 3. Mini-OS stubdoms use dmargs xenstore key as a string.  Linux stubdoms =
use
> dmargs as a directory for numbered entries.  Should they be different nam=
es?
>
> Remaining parts for eliminating dom0's instance of qemu:
>  - do not force QDISK backend for CDROM
>  - multiple consoles support in xenconsoled
>
> Changes in v2:
>  - apply review comments by Jason Andryuk
> Changes in v3:
>  - rework qemu arguments handling (separate xenstore keys, instead of \x1=
b separator)
>  - add QMP over libvchan, instead of console
>  - add protocol documentation
>  - a lot of minor changes, see individual patches for full changes list
>  - split xenconsoled patches into separate series
> Changes in v4:
>  - extract vchan connection into a separate process
>  - rebase on master
>  - various fixes
> Changes in v5:
>  - Marek: apply review comments from Jason Andryuk
>  - Jason: Clean up qmp-proxy processes and sockets
>
> Cc: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> Cc: Simon Gaiser <simon@invisiblethingslab.com>
> Cc: Eric Shelton <eshelton@pobox.com>
> Cc: Ian Jackson <ian.jackson@citrix.com>
> Cc: Wei Liu <wl@xen.org>
>
> Eric Shelton (1):
>   libxl: Handle Linux stubdomain specific QEMU options.
>
> Jason Andryuk (5):
>   docs: Add device-model-domid to xenstore-paths
>   libxl: Check stubdomain kernel & ramdisk presence
>   libxl: Refactor kill_device_model to libxl__kill_xs_path
>   libxl: Kill vchan-socket-proxy when cleaning up qmp
>   tools: Clean up vchan-socket-proxy socket
>
> Marek Marczykowski-G=C3=B3recki (15):
>   Document ioemu MiniOS stubdomain protocol
>   Document ioemu Linux stubdomain protocol
>   libxl: fix qemu-trad cmdline for no sdl/vnc case
>   libxl: Allow running qemu-xen in stubdomain
>   libxl: write qemu arguments into separate xenstore keys
>   xl: add stubdomain related options to xl config parser
>   tools/libvchan: notify server when client is connected
>   libxl: add save/restore support for qemu-xen in stubdomain
>   tools: add missing libxenvchan cflags
>   tools: add simple vchan-socket-proxy
>   libxl: use vchan for QMP access with Linux stubdomain
>   Regenerate autotools files
>   libxl: require qemu in dom0 even if stubdomain is in use
>   libxl: ignore emulated IDE disks beyond the first 4
>   libxl: consider also qemu in stubdomain in libxl__dm_active check
>
>  .gitignore                          |   1 +
>  configure                           |  14 +-
>  docs/configure                      |  14 +-
>  docs/man/xl.cfg.5.pod.in            |  27 +-
>  docs/misc/stubdom.txt               | 103 ++++++
>  docs/misc/xenstore-paths.pandoc     |   5 +
>  stubdom/configure                   |  14 +-
>  tools/Rules.mk                      |   2 +-
>  tools/config.h.in                   |   3 +
>  tools/configure                     |  46 ++-
>  tools/configure.ac                  |   9 +
>  tools/libvchan/Makefile             |   8 +-
>  tools/libvchan/init.c               |   3 +
>  tools/libvchan/vchan-socket-proxy.c | 500 ++++++++++++++++++++++++++++
>  tools/libxl/libxl_aoutils.c         |  32 ++
>  tools/libxl/libxl_create.c          |  46 ++-
>  tools/libxl/libxl_dm.c              | 484 +++++++++++++++++++++------
>  tools/libxl/libxl_domain.c          |   7 +
>  tools/libxl/libxl_internal.h        |  22 ++
>  tools/libxl/libxl_mem.c             |   6 +-
>  tools/libxl/libxl_qmp.c             |  27 +-
>  tools/libxl/libxl_types.idl         |   3 +
>  tools/xl/xl_parse.c                 |   7 +
>  23 files changed, 1205 insertions(+), 178 deletions(-)
>  create mode 100644 tools/libvchan/vchan-socket-proxy.c
>
> --
> 2.20.1
>

