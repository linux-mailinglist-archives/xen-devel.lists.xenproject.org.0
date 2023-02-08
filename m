Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8389168E740
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 05:52:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491521.760690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPcQZ-0005OE-RY; Wed, 08 Feb 2023 04:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491521.760690; Wed, 08 Feb 2023 04:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPcQZ-0005Mu-O9; Wed, 08 Feb 2023 04:51:27 +0000
Received: by outflank-mailman (input) for mailman id 491521;
 Wed, 08 Feb 2023 04:51:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mMba=6E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pPcQY-0005Mg-Dt
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 04:51:27 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a47bc01-a76c-11ed-93b5-47a8fe42b414;
 Wed, 08 Feb 2023 05:51:21 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 1DD5D5C00E6;
 Tue,  7 Feb 2023 23:51:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 07 Feb 2023 23:51:19 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Feb 2023 23:51:16 -0500 (EST)
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
X-Inumbo-ID: 3a47bc01-a76c-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:sender:subject:subject:to:to; s=fm3; t=1675831879; x=
	1675918279; bh=aVO6hKdg+qs1t/q894FccNAEhBlymG5Vl6MNYUKRsPU=; b=b
	kBBeLSwWy0cB4pTi14RcAk3PgmE16THrLkuybE3HQY99MInDYqFdRaCicLTO9mAi
	zEZM2Aa7+nr5sWwzvMhwjqF46KVJSyVVb/km8/5fd9OmQpN8501w4LM6wgQjCbx2
	0YXDX1H9vYjpQDkgjC8X9zXQkJS91/dBu90sPtBZZQt8tXpJP5rMx2rtWukx3V4M
	vM8E5LDnAKg0s8ouVJQYVK41bjESIu5u+IKDXxJipmED7QnQXejn225/HWEZICa6
	QR5ixtR3FaoQlH7W7o01pTmb+z9wx+6wS//6cLgq3Bh6YFX7Oz0sJh8wK7tUyHPZ
	ThgpdHm1ozVgjBleMR3BQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1675831879; x=1675918279; bh=aVO6hKdg+qs1t/q894FccNAEhBlymG5Vl6M
	NYUKRsPU=; b=TUYXQxxkn4r+jNqGODnl50sFUBPQh8lBgAQU4gucJ30bd+bQM5k
	raH4P7CSdkfDuxLFOwW7cRQRxByKnqpTvQWGAk2MA5Ras07PypCJ6mw4r9KUIcsX
	rymfYRYvZDfXnSkrf/vg3yllBTIX1IvLidGmhEZDVNRXCnDERf/QLo7csr8snWIg
	MFuJqKUnF90ApjtPkgE1gWEUzRe06IqvTWnqRyNKHPVgvVHLwTcpdW4iJdyn7DUB
	KmZXXvcrNTky54Y8hudONyJNsuExShu3XMiBic21fCzhM+2GdHFuuV+Vffdmhy45
	sXn21NVCWJrPzAwCRsKeRYj3XkKvPoylcYw==
X-ME-Sender: <xms:RirjY1yXQtsi3ODQwQWiQfT2NKXAVRNgKBsiiRT6DNjMIm0_5fDusw>
    <xme:RirjY1Q2Hcg9YyG6ZLf4Ya0FLVhe0mhXCahY3cNMKPXXJrsdaoDA_Hn9T8X7ciHF0
    ZRRTBFMx5To5aw>
X-ME-Received: <xmr:RirjY_XxD1iPLc0Ndgg7GwpYtBmITF8ZBsUsSVqA0-q10dlaWyiIFzm1tPtHX7Vjbhp35Tk_taw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudegledgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepffgvmhhiucfo
    rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomheqnecuggftrfgrthhtvghrnhepvdehieduudefleejjeeuleeiuddtieet
    teevtdfhfedtiefhvdffleehudefgfevnecuffhomhgrihhnpehhthhtphhstghophihih
    hnghegqddqtghrvgguihhtshdvqdgtohhnfhhighdrmhhknecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvth
    hhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:RirjY3iP65oQWGSAZ3mwJtQ1LumAklFJwv3RmLyIy6F9N3e5NV7pow>
    <xmx:RirjY3CqFSjviqTP7p_RiKjjQdTrX0WUfEpQnGLyVQXf803RweShDQ>
    <xmx:RirjYwLOgEgbpuBoIDDEfAzvyBb4snuxHxiHA4u5t67VKXo6MdQyrw>
    <xmx:RyrjY3b71LI-gQBm1Xp9WHOSCULlasVz0S0TkQZEwnT7wgQJJRVksw>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,	Wei Liu <wl@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,	Quan Xu <quan.xu0@gmail.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,	Paul Durrant <paul@xen.org>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,	Tim Deegan <tim@xen.org>,
	Christopher Clark <christopher.w.clark@gmail.com>,
	Dario Faggioli <dfaggioli@suse.com>,	Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH 0/4] Stop using insecure transports
Date: Tue,  7 Feb 2023 23:51:03 -0500
Message-Id: <cover.1675829866.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Obtaining code over an insecure transport is a terrible idea for
blatently obvious reasons.  Even for non-executable data, insecure
transports are considered deprecated.

Demi Marie Obenour (4):
  Build system: Replace git:// and http:// with https://
  Automation and CI: Replace git:// and http:// with https://
  Miscellaneous and documentation: Only use TLS-protected transports
  GPL License Boilerplate: Switch from HTTP to HTTPS

 COPYING                                       |  4 ++--
 CREDITS                                       |  2 +-
 Config.mk                                     | 20 +++++-----------
 README                                        |  8 +++----
 SUPPORT.md                                    |  2 +-
 automation/build/centos/CentOS-7.2.repo       |  8 +++----
 automation/build/debian/stretch-llvm-8.list   |  4 ++--
 automation/build/debian/unstable-llvm-8.list  |  4 ++--
 automation/scripts/qemu-smoke-dom0-arm32.sh   |  2 +-
 docs/README.remus                             |  2 +-
 docs/conf.py                                  |  2 +-
 docs/features/feature-levelling.pandoc        |  4 ++--
 docs/features/intel_psr_cat_cdp.pandoc        |  2 +-
 docs/features/intel_psr_mba.pandoc            |  2 +-
 docs/features/migration.pandoc                |  2 +-
 docs/features/sched_credit.pandoc             |  4 ++--
 docs/features/sched_credit2.pandoc            |  6 ++---
 docs/features/sched_rtds.pandoc               |  4 ++--
 docs/misc/amd-ucode-container.txt             |  4 ++--
 docs/misc/arm/booting.txt                     |  4 ++--
 docs/misc/arm/passthrough.txt                 |  2 +-
 docs/misc/kconfig-language.rst                | 14 +++++------
 docs/misc/livepatch.pandoc                    |  2 +-
 docs/misc/netif-staging-grants.pandoc         | 10 ++++----
 docs/misc/pvcalls.pandoc                      | 18 +++++++-------
 docs/misc/status-override-table-spec.fodt     |  2 +-
 docs/misc/vtd-pi.txt                          |  6 ++---
 docs/misc/vtd.txt                             |  4 ++--
 docs/misc/xen-env-table-spec.fodt             |  2 +-
 docs/misc/xenstore-paths.pandoc               |  2 +-
 docs/misc/xl-psr.pandoc                       |  2 +-
 docs/misc/xsm-flask.txt                       |  2 +-
 docs/process/release-technician-checklist.txt |  2 +-
 docs/process/sending-patches.pandoc           |  2 +-
 docs/process/xen-release-management.pandoc    |  2 +-
 m4/README.source                              |  4 ++--
 m4/ax_compare_version.m4                      |  4 ++--
 m4/ocaml.m4                                   |  2 +-
 m4/pkg.m4                                     |  4 ++--
 m4/systemd.m4                                 |  2 +-
 misc/coverity/model.c                         |  2 +-
 scripts/get_maintainer.pl                     |  2 +-
 stubdom/configure                             | 18 +++++++-------
 stubdom/configure.ac                          | 24 ++++++++++++-------
 stubdom/grub.patches/10graphics.diff          |  4 ++--
 stubdom/grub.patches/61btrfs.diff             |  4 ++--
 stubdom/vtpmmgr/tpmrsa.c                      |  6 ++---
 stubdom/vtpmmgr/tpmrsa.h                      |  4 ++--
 tools/configure                               | 16 ++++++-------
 tools/console/client/main.c                   |  2 +-
 tools/console/daemon/io.c                     |  2 +-
 tools/console/daemon/io.h                     |  2 +-
 tools/console/daemon/main.c                   |  2 +-
 tools/console/daemon/utils.c                  |  2 +-
 tools/console/daemon/utils.h                  |  2 +-
 tools/debugger/gdbsx/README                   |  2 +-
 tools/debugger/gdbsx/gx/gx.h                  |  2 +-
 tools/debugger/gdbsx/gx/gx_comm.c             |  4 ++--
 tools/debugger/gdbsx/gx/gx_local.c            |  2 +-
 tools/debugger/gdbsx/gx/gx_main.c             |  2 +-
 tools/debugger/gdbsx/gx/gx_utils.c            |  2 +-
 tools/debugger/gdbsx/gx/xg_dummy.c            |  2 +-
 tools/debugger/gdbsx/xg/xg_main.c             |  2 +-
 tools/debugger/gdbsx/xg/xg_public.h           |  2 +-
 tools/examples/xeninfo.pl                     |  6 ++---
 tools/firmware/Makefile                       |  2 +-
 tools/firmware/etherboot/Makefile             |  4 ++--
 tools/firmware/etherboot/README               | 23 +-----------------
 tools/firmware/hvmloader/32bitbios_support.c  |  2 +-
 tools/firmware/hvmloader/Makefile             |  2 +-
 tools/firmware/hvmloader/cacheattr.c          |  2 +-
 tools/firmware/hvmloader/e820.c               |  2 +-
 tools/firmware/hvmloader/hvmloader.c          |  2 +-
 tools/firmware/hvmloader/mp_tables.c          |  2 +-
 tools/firmware/hvmloader/optionroms.c         |  2 +-
 tools/firmware/hvmloader/ovmf.c               |  2 +-
 tools/firmware/hvmloader/pci.c                |  2 +-
 tools/firmware/hvmloader/pci_regs.h           |  2 +-
 tools/firmware/hvmloader/pir.c                |  2 +-
 tools/firmware/hvmloader/pir_types.h          |  4 ++--
 tools/firmware/hvmloader/rombios.c            |  2 +-
 tools/firmware/hvmloader/seabios.c            |  2 +-
 tools/firmware/hvmloader/smbios.c             |  2 +-
 tools/firmware/hvmloader/smbios_types.h       |  4 ++--
 tools/firmware/hvmloader/smp.c                |  2 +-
 tools/firmware/hvmloader/tests.c              |  2 +-
 tools/firmware/hvmloader/util.c               |  2 +-
 tools/firmware/rombios/32bit/32bitbios.c      |  2 +-
 tools/firmware/rombios/32bit/mkhex            |  2 +-
 tools/firmware/rombios/32bit/pmm.c            |  4 ++--
 .../firmware/rombios/32bit/tcgbios/tcgbios.c  |  2 +-
 .../rombios/32bit/tcgbios/tpm_drivers.c       |  2 +-
 tools/firmware/rombios/32bit/util.c           |  2 +-
 tools/firmware/rombios/32bitgateway.c         |  2 +-
 tools/firmware/rombios/apmbios.S              |  2 +-
 tools/firmware/rombios/rombios.c              | 10 ++++----
 tools/firmware/rombios/rombios.h              |  2 +-
 tools/firmware/rombios/tcgbios.c              |  2 +-
 tools/firmware/vgabios/COPYING                |  2 +-
 tools/firmware/vgabios/README                 | 10 ++++----
 tools/firmware/vgabios/biossums.c             |  2 +-
 tools/firmware/vgabios/clext.c                |  2 +-
 tools/firmware/vgabios/vbe.c                  |  4 ++--
 tools/firmware/vgabios/vbe_display_api.txt    |  8 +++----
 tools/firmware/vgabios/vgabios.c              | 12 +++++-----
 tools/fuzz/README.afl                         |  2 +-
 tools/golang/xenlight/xenlight.go             |  2 +-
 tools/hotplug/Linux/block-common.sh           |  2 +-
 tools/hotplug/Linux/block-drbd-probe          |  2 +-
 tools/hotplug/Linux/external-device-migrate   |  2 +-
 tools/hotplug/Linux/launch-xenstore.in        |  2 +-
 tools/hotplug/Linux/locking.sh                |  2 +-
 tools/hotplug/Linux/logging.sh                |  2 +-
 tools/hotplug/Linux/vif-common.sh             |  2 +-
 tools/hotplug/Linux/xen-hotplug-common.sh.in  |  2 +-
 tools/hotplug/Linux/xen-network-common.sh     |  2 +-
 tools/hotplug/Linux/xen-script-common.sh      |  2 +-
 tools/hotplug/Linux/xendomains.in             |  2 +-
 tools/hotplug/NetBSD/locking.sh               |  2 +-
 tools/include/libxenvchan.h                   |  4 ++--
 tools/include/libxl.h                         |  2 +-
 tools/include/xencall.h                       |  2 +-
 tools/include/xenctrl.h                       |  2 +-
 tools/include/xendevicemodel.h                |  2 +-
 tools/include/xenevtchn.h                     |  2 +-
 tools/include/xenforeignmemory.h              |  2 +-
 tools/include/xengnttab.h                     |  2 +-
 tools/include/xenguest.h                      |  2 +-
 tools/include/xenhypfs.h                      |  2 +-
 tools/include/xenstore.h                      |  2 +-
 tools/include/xenstore_lib.h                  |  2 +-
 tools/include/xentoolcore.h                   |  2 +-
 tools/include/xentoolcore_internal.h          |  2 +-
 tools/include/xentoollog.h                    |  2 +-
 tools/libacpi/build.c                         |  2 +-
 tools/libfsimage/ext2fs/fsys_ext2fs.c         |  2 +-
 tools/libfsimage/fat/fat.h                    |  2 +-
 tools/libfsimage/fat/fsys_fat.c               |  2 +-
 tools/libfsimage/iso9660/fsys_iso9660.c       |  2 +-
 tools/libfsimage/iso9660/iso9660.h            |  2 +-
 tools/libfsimage/reiserfs/fsys_reiserfs.c     |  4 ++--
 tools/libfsimage/ufs/fsys_ufs.c               |  2 +-
 tools/libfsimage/xfs/fsys_xfs.c               |  2 +-
 tools/libfsimage/xfs/xfs.h                    |  6 ++---
 tools/libfsimage/zfs/Makefile                 |  2 +-
 tools/libfsimage/zfs/filesys.h                |  2 +-
 tools/libfsimage/zfs/fsi_zfs.c                |  2 +-
 tools/libfsimage/zfs/fsi_zfs.h                |  2 +-
 tools/libfsimage/zfs/fsys_zfs.c               |  2 +-
 tools/libfsimage/zfs/fsys_zfs.h               |  2 +-
 tools/libfsimage/zfs/mb_info.h                |  2 +-
 tools/libfsimage/zfs/shared.h                 |  2 +-
 tools/libfsimage/zfs/zfs-include/dmu.h        |  2 +-
 tools/libfsimage/zfs/zfs-include/dmu_objset.h |  2 +-
 tools/libfsimage/zfs/zfs-include/dnode.h      |  2 +-
 .../libfsimage/zfs/zfs-include/dsl_dataset.h  |  2 +-
 tools/libfsimage/zfs/zfs-include/dsl_dir.h    |  2 +-
 tools/libfsimage/zfs/zfs-include/sa_impl.h    |  2 +-
 tools/libfsimage/zfs/zfs-include/spa.h        |  2 +-
 .../zfs/zfs-include/uberblock_impl.h          |  2 +-
 tools/libfsimage/zfs/zfs-include/vdev_impl.h  |  2 +-
 tools/libfsimage/zfs/zfs-include/zap_impl.h   |  2 +-
 tools/libfsimage/zfs/zfs-include/zap_leaf.h   |  2 +-
 tools/libfsimage/zfs/zfs-include/zfs.h        |  2 +-
 tools/libfsimage/zfs/zfs-include/zfs_acl.h    |  2 +-
 tools/libfsimage/zfs/zfs-include/zfs_znode.h  |  2 +-
 tools/libfsimage/zfs/zfs-include/zil.h        |  2 +-
 tools/libfsimage/zfs/zfs-include/zio.h        |  2 +-
 .../libfsimage/zfs/zfs-include/zio_checksum.h |  2 +-
 tools/libfsimage/zfs/zfs_fletcher.c           |  2 +-
 tools/libfsimage/zfs/zfs_lzjb.c               |  2 +-
 tools/libfsimage/zfs/zfs_sha256.c             |  4 ++--
 tools/libs/call/buffer.c                      |  2 +-
 tools/libs/call/core.c                        |  2 +-
 tools/libs/call/freebsd.c                     |  2 +-
 tools/libs/call/linux.c                       |  2 +-
 tools/libs/call/minios.c                      |  2 +-
 tools/libs/call/netbsd.c                      |  2 +-
 tools/libs/call/solaris.c                     |  2 +-
 tools/libs/ctrl/xc_altp2m.c                   |  2 +-
 tools/libs/ctrl/xc_cpu_hotplug.c              |  2 +-
 tools/libs/ctrl/xc_cpupool.c                  |  2 +-
 tools/libs/ctrl/xc_csched.c                   |  2 +-
 tools/libs/ctrl/xc_csched2.c                  |  2 +-
 tools/libs/ctrl/xc_domain.c                   |  2 +-
 tools/libs/ctrl/xc_evtchn.c                   |  2 +-
 tools/libs/ctrl/xc_flask.c                    |  2 +-
 tools/libs/ctrl/xc_foreign_memory.c           |  2 +-
 tools/libs/ctrl/xc_freebsd.c                  |  2 +-
 tools/libs/ctrl/xc_gnttab.c                   |  2 +-
 tools/libs/ctrl/xc_hcall_buf.c                |  2 +-
 tools/libs/ctrl/xc_linux.c                    |  2 +-
 tools/libs/ctrl/xc_mem_access.c               |  2 +-
 tools/libs/ctrl/xc_mem_paging.c               |  2 +-
 tools/libs/ctrl/xc_memshr.c                   |  2 +-
 tools/libs/ctrl/xc_minios.c                   |  2 +-
 tools/libs/ctrl/xc_misc.c                     |  2 +-
 tools/libs/ctrl/xc_monitor.c                  |  2 +-
 tools/libs/ctrl/xc_netbsd.c                   |  2 +-
 tools/libs/ctrl/xc_pagetab.c                  |  2 +-
 tools/libs/ctrl/xc_physdev.c                  |  2 +-
 tools/libs/ctrl/xc_pm.c                       |  2 +-
 tools/libs/ctrl/xc_private.c                  |  2 +-
 tools/libs/ctrl/xc_private.h                  |  2 +-
 tools/libs/ctrl/xc_rt.c                       |  2 +-
 tools/libs/ctrl/xc_solaris.c                  |  2 +-
 tools/libs/ctrl/xc_tbuf.c                     |  2 +-
 tools/libs/ctrl/xc_vm_event.c                 |  2 +-
 tools/libs/ctrl/xc_vmtrace.c                  |  2 +-
 tools/libs/devicemodel/common.c               |  2 +-
 tools/libs/devicemodel/compat.c               |  2 +-
 tools/libs/devicemodel/core.c                 |  2 +-
 tools/libs/evtchn/core.c                      |  2 +-
 tools/libs/evtchn/freebsd.c                   |  2 +-
 tools/libs/evtchn/linux.c                     |  2 +-
 tools/libs/evtchn/minios.c                    |  2 +-
 tools/libs/evtchn/netbsd.c                    |  2 +-
 tools/libs/evtchn/solaris.c                   |  2 +-
 tools/libs/foreignmemory/compat.c             |  2 +-
 tools/libs/foreignmemory/core.c               |  2 +-
 tools/libs/foreignmemory/freebsd.c            |  2 +-
 tools/libs/foreignmemory/linux.c              |  2 +-
 tools/libs/foreignmemory/minios.c             |  2 +-
 tools/libs/foreignmemory/netbsd.c             |  2 +-
 tools/libs/foreignmemory/solaris.c            |  2 +-
 tools/libs/gnttab/freebsd.c                   |  2 +-
 tools/libs/gnttab/gntshr_core.c               |  2 +-
 tools/libs/gnttab/gntshr_unimp.c              |  2 +-
 tools/libs/gnttab/gnttab_core.c               |  2 +-
 tools/libs/gnttab/gnttab_unimp.c              |  2 +-
 tools/libs/gnttab/linux.c                     |  2 +-
 tools/libs/gnttab/minios.c                    |  2 +-
 tools/libs/gnttab/netbsd.c                    |  2 +-
 tools/libs/guest/xg_core.c                    |  2 +-
 tools/libs/guest/xg_core.h                    |  2 +-
 tools/libs/guest/xg_core_arm.c                |  2 +-
 tools/libs/guest/xg_core_arm.h                |  2 +-
 tools/libs/guest/xg_core_x86.c                |  2 +-
 tools/libs/guest/xg_core_x86.h                |  2 +-
 tools/libs/guest/xg_cpuid_x86.c               |  2 +-
 tools/libs/guest/xg_dom_arm.c                 |  2 +-
 tools/libs/guest/xg_dom_armzimageloader.c     |  2 +-
 tools/libs/guest/xg_dom_binloader.c           |  2 +-
 tools/libs/guest/xg_dom_boot.c                |  2 +-
 tools/libs/guest/xg_dom_bzimageloader.c       |  2 +-
 tools/libs/guest/xg_dom_compat_linux.c        |  2 +-
 tools/libs/guest/xg_dom_core.c                |  2 +-
 tools/libs/guest/xg_dom_elfloader.c           |  2 +-
 tools/libs/guest/xg_dom_hvmloader.c           |  2 +-
 tools/libs/guest/xg_dom_x86.c                 |  2 +-
 tools/libs/guest/xg_domain.c                  |  2 +-
 tools/libs/guest/xg_nomigrate.c               |  2 +-
 tools/libs/guest/xg_offline_page.c            |  2 +-
 tools/libs/guest/xg_private.c                 |  2 +-
 tools/libs/guest/xg_private.h                 |  2 +-
 tools/libs/guest/xg_resume.c                  |  2 +-
 tools/libs/guest/xg_save_restore.h            |  2 +-
 tools/libs/guest/xg_suspend.c                 |  2 +-
 tools/libs/hypfs/core.c                       |  2 +-
 tools/libs/light/libxl_genid.c                |  2 +-
 tools/libs/stat/COPYING                       |  2 +-
 tools/libs/stat/xenstat_qmp.c                 |  2 +-
 tools/libs/store/xs.c                         |  2 +-
 tools/libs/toolcore/handlereg.c               |  2 +-
 tools/libs/toollog/xtl_core.c                 |  2 +-
 tools/libs/toollog/xtl_logger_stdio.c         |  2 +-
 tools/libs/util/libxlu_cfg_y.c                |  2 +-
 tools/libs/util/libxlu_cfg_y.h                |  2 +-
 tools/libs/vchan/init.c                       |  2 +-
 tools/libs/vchan/io.c                         |  2 +-
 tools/libs/vchan/vchan.h                      |  2 +-
 tools/misc/mkhex                              |  2 +-
 tools/misc/mkrpm                              |  2 +-
 tools/misc/xen-mceinj.c                       |  2 +-
 tools/misc/xen-vmtrace.c                      |  2 +-
 tools/misc/xencov.c                           |  2 +-
 tools/misc/xenpm.c                            |  2 +-
 tools/misc/xenpvnetboot                       |  6 ++---
 tools/ocaml/LICENSE                           |  2 +-
 .../ocaml/libs/xentoollog/xentoollog_stubs.c  |  2 +-
 tools/ocaml/libs/xl/xenlight_stubs.c          |  2 +-
 tools/pygrub/src/ExtLinuxConf.py              |  2 +-
 tools/pygrub/src/GrubConf.py                  |  2 +-
 tools/pygrub/src/pygrub                       |  2 +-
 tools/python/xen/lowlevel/xs/xs.c             |  2 +-
 tools/tests/depriv/depriv-fd-checker.c        |  2 +-
 tools/tests/vhpet/emul.h                      |  2 +-
 tools/tests/vhpet/main.c                      |  4 ++--
 tools/tests/vpci/emul.h                       |  2 +-
 tools/tests/vpci/main.c                       |  2 +-
 tools/tests/x86_emulator/blowfish.c           |  2 +-
 tools/tests/xenstore/test-xenstore.c          |  2 +-
 tools/vchan/node-select.c                     |  2 +-
 tools/vchan/node.c                            |  2 +-
 tools/vchan/vchan-socket-proxy.c              |  2 +-
 tools/xenmon/COPYING                          |  2 +-
 tools/xenmon/setmask.c                        |  2 +-
 tools/xenmon/xenbaked.c                       |  2 +-
 tools/xenmon/xenbaked.h                       |  2 +-
 tools/xenmon/xenmon.py                        |  2 +-
 tools/xenpaging/file_ops.c                    |  2 +-
 tools/xenpaging/file_ops.h                    |  2 +-
 tools/xenpaging/policy.h                      |  2 +-
 tools/xenpaging/policy_default.c              |  2 +-
 tools/xenpaging/xenpaging.c                   |  2 +-
 tools/xenpaging/xenpaging.h                   |  2 +-
 tools/xenpmd/xenpmd.c                         |  2 +-
 tools/xenstore/COPYING                        |  2 +-
 tools/xenstore/include/xenstore_state.h       |  2 +-
 tools/xenstore/talloc.c                       |  4 ++--
 tools/xenstore/talloc.h                       |  2 +-
 tools/xenstore/talloc_guide.txt               |  2 +-
 tools/xenstore/tdb.c                          |  2 +-
 tools/xenstore/tdb.h                          |  2 +-
 tools/xenstore/xenstored_control.c            |  2 +-
 tools/xenstore/xenstored_control.h            |  2 +-
 tools/xenstore/xenstored_core.c               |  2 +-
 tools/xenstore/xenstored_core.h               |  2 +-
 tools/xenstore/xenstored_domain.c             |  2 +-
 tools/xenstore/xenstored_domain.h             |  2 +-
 tools/xenstore/xenstored_minios.c             |  2 +-
 tools/xenstore/xenstored_posix.c              |  2 +-
 tools/xenstore/xenstored_transaction.c        |  2 +-
 tools/xenstore/xenstored_transaction.h        |  2 +-
 tools/xenstore/xenstored_watch.c              |  2 +-
 tools/xenstore/xenstored_watch.h              |  2 +-
 tools/xenstore/xs_lib.c                       |  2 +-
 tools/xenstore/xs_lib.h                       |  2 +-
 tools/xentop/xentop.c                         |  2 +-
 tools/xentrace/xenalyze.c                     |  2 +-
 tools/xl/check-xl-disk-parse                  |  6 ++---
 xen/COPYING                                   |  2 +-
 xen/arch/arm/acpi/boot.c                      |  2 +-
 xen/arch/arm/acpi/lib.c                       |  2 +-
 xen/arch/arm/arm32/head.S                     |  2 +-
 xen/arch/arm/arm32/insn.c                     |  2 +-
 xen/arch/arm/arm32/lib/bitops.c               |  2 +-
 xen/arch/arm/arm32/lib/lib1funcs.S            |  2 +-
 xen/arch/arm/arm32/lib/lshrdi3.S              |  2 +-
 xen/arch/arm/arm64/bpi.S                      |  2 +-
 xen/arch/arm/arm64/cache.S                    |  2 +-
 xen/arch/arm/arm64/debug-meson.inc            |  2 +-
 xen/arch/arm/arm64/debug-mvebu.inc            |  2 +-
 xen/arch/arm/arm64/head.S                     |  2 +-
 xen/arch/arm/arm64/insn.c                     |  2 +-
 xen/arch/arm/arm64/lib/bitops.c               |  2 +-
 xen/arch/arm/arm64/lib/clear_page.S           |  2 +-
 xen/arch/arm/arm64/lib/memchr.S               |  2 +-
 xen/arch/arm/arm64/lib/memcmp.S               |  4 ++--
 xen/arch/arm/arm64/lib/memcpy.S               |  4 ++--
 xen/arch/arm/arm64/lib/memmove.S              |  4 ++--
 xen/arch/arm/arm64/lib/memset.S               |  4 ++--
 xen/arch/arm/arm64/lib/strchr.S               |  2 +-
 xen/arch/arm/arm64/lib/strcmp.S               |  4 ++--
 xen/arch/arm/arm64/lib/strlen.S               |  4 ++--
 xen/arch/arm/arm64/lib/strncmp.S              |  4 ++--
 xen/arch/arm/arm64/lib/strnlen.S              |  4 ++--
 xen/arch/arm/arm64/lib/strrchr.S              |  2 +-
 xen/arch/arm/efi/efi-dom0.c                   |  2 +-
 xen/arch/arm/include/asm/acpi.h               |  2 +-
 xen/arch/arm/include/asm/altp2m.h             |  2 +-
 xen/arch/arm/include/asm/arm32/insn.h         |  2 +-
 xen/arch/arm/include/asm/arm64/atomic.h       |  2 +-
 xen/arch/arm/include/asm/arm64/insn.h         |  2 +-
 xen/arch/arm/include/asm/arm64/io.h           |  2 +-
 xen/arch/arm/include/asm/gic_v3_its.h         |  2 +-
 xen/arch/arm/include/asm/iommu.h              |  2 +-
 xen/arch/arm/include/asm/iommu_fwspec.h       |  2 +-
 xen/arch/arm/include/asm/ioreq.h              |  2 +-
 xen/arch/arm/include/asm/mem_access.h         |  2 +-
 xen/arch/arm/include/asm/monitor.h            |  2 +-
 xen/arch/arm/include/asm/new_vgic.h           |  2 +-
 xen/arch/arm/include/asm/pci.h                |  2 +-
 xen/arch/arm/include/asm/smccc.h              |  2 +-
 xen/arch/arm/include/asm/tee/optee_smc.h      |  2 +-
 xen/arch/arm/include/asm/vm_event.h           |  2 +-
 xen/arch/arm/include/asm/vpl011.h             |  2 +-
 xen/arch/arm/include/asm/vpsci.h              |  2 +-
 xen/arch/arm/pci/ecam.c                       |  2 +-
 xen/arch/arm/pci/pci-access.c                 |  2 +-
 xen/arch/arm/pci/pci-host-common.c            |  2 +-
 xen/arch/arm/pci/pci-host-generic.c           |  2 +-
 xen/arch/arm/pci/pci-host-zynqmp.c            |  2 +-
 xen/arch/arm/pci/pci.c                        |  2 +-
 xen/arch/arm/platforms/thunderx.c             |  2 +-
 xen/arch/arm/vgic/vgic-init.c                 |  2 +-
 xen/arch/arm/vgic/vgic-mmio.h                 |  2 +-
 xen/arch/arm/vgic/vgic-v2.c                   |  2 +-
 xen/arch/arm/vgic/vgic.c                      |  2 +-
 xen/arch/arm/vgic/vgic.h                      |  2 +-
 xen/arch/x86/acpi/boot.c                      |  2 +-
 xen/arch/x86/acpi/cpu_idle.c                  |  2 +-
 xen/arch/x86/acpi/cpufreq/cpufreq.c           |  2 +-
 xen/arch/x86/acpi/cpufreq/powernow.c          |  2 +-
 xen/arch/x86/acpi/cpuidle_menu.c              |  2 +-
 xen/arch/x86/acpi/lib.c                       |  2 +-
 xen/arch/x86/alternative.c                    |  2 +-
 xen/arch/x86/boot/build32.lds                 |  2 +-
 xen/arch/x86/boot/cmdline.c                   |  2 +-
 xen/arch/x86/boot/defs.h                      |  2 +-
 xen/arch/x86/cpu/mcheck/amd_nonfatal.c        |  8 +++----
 xen/arch/x86/cpu/mcheck/mce-apei.c            |  2 +-
 xen/arch/x86/cpu/mcheck/mce_amd.c             | 10 ++++----
 xen/arch/x86/cpu/mcheck/vmce.c                |  2 +-
 xen/arch/x86/cpu/mcheck/x86_mca.h             |  2 +-
 xen/arch/x86/cpu/microcode/core.c             |  4 ++--
 xen/arch/x86/cpu/microcode/intel.c            |  4 ++--
 xen/arch/x86/cpu/mtrr/main.c                  |  2 +-
 xen/arch/x86/cpu/mwait-idle.c                 |  2 +-
 xen/arch/x86/cpu/vpmu.c                       |  2 +-
 xen/arch/x86/cpu/vpmu_amd.c                   |  2 +-
 xen/arch/x86/cpu/vpmu_intel.c                 |  2 +-
 xen/arch/x86/dmi_scan.c                       |  2 +-
 xen/arch/x86/gdbstub.c                        |  2 +-
 xen/arch/x86/gdbsx.c                          |  2 +-
 xen/arch/x86/genapic/x2apic.c                 |  2 +-
 xen/arch/x86/guest/hyperv/hyperv.c            |  2 +-
 xen/arch/x86/guest/hyperv/private.h           |  2 +-
 xen/arch/x86/guest/hyperv/tlb.c               |  2 +-
 xen/arch/x86/guest/hyperv/util.c              |  2 +-
 xen/arch/x86/guest/hypervisor.c               |  2 +-
 xen/arch/x86/guest/xen/pvh-boot.c             |  2 +-
 xen/arch/x86/guest/xen/xen.c                  |  2 +-
 xen/arch/x86/hvm/asid.c                       |  2 +-
 xen/arch/x86/hvm/dm.c                         |  2 +-
 xen/arch/x86/hvm/dom0_build.c                 |  2 +-
 xen/arch/x86/hvm/domain.c                     |  2 +-
 xen/arch/x86/hvm/grant_table.c                |  2 +-
 xen/arch/x86/hvm/hpet.c                       |  2 +-
 xen/arch/x86/hvm/hvm.c                        |  2 +-
 xen/arch/x86/hvm/hypercall.c                  |  2 +-
 xen/arch/x86/hvm/intercept.c                  |  2 +-
 xen/arch/x86/hvm/io.c                         |  2 +-
 xen/arch/x86/hvm/ioreq.c                      |  2 +-
 xen/arch/x86/hvm/irq.c                        |  2 +-
 xen/arch/x86/hvm/monitor.c                    |  2 +-
 xen/arch/x86/hvm/mtrr.c                       |  2 +-
 xen/arch/x86/hvm/nestedhvm.c                  |  2 +-
 xen/arch/x86/hvm/pmtimer.c                    |  2 +-
 xen/arch/x86/hvm/quirks.c                     |  2 +-
 xen/arch/x86/hvm/save.c                       |  2 +-
 xen/arch/x86/hvm/svm/asid.c                   |  2 +-
 xen/arch/x86/hvm/svm/emulate.c                |  2 +-
 xen/arch/x86/hvm/svm/entry.S                  |  2 +-
 xen/arch/x86/hvm/svm/intr.c                   |  2 +-
 xen/arch/x86/hvm/svm/nestedsvm.c              |  2 +-
 xen/arch/x86/hvm/svm/svm.c                    |  2 +-
 xen/arch/x86/hvm/svm/svmdebug.c               |  2 +-
 xen/arch/x86/hvm/svm/vmcb.c                   |  2 +-
 xen/arch/x86/hvm/vioapic.c                    |  6 ++---
 xen/arch/x86/hvm/vlapic.c                     |  2 +-
 xen/arch/x86/hvm/vm_event.c                   |  2 +-
 xen/arch/x86/hvm/vmsi.c                       |  6 ++---
 xen/arch/x86/hvm/vmx/entry.S                  |  2 +-
 xen/arch/x86/hvm/vmx/intr.c                   |  2 +-
 xen/arch/x86/hvm/vmx/vmcs.c                   |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c                    |  2 +-
 xen/arch/x86/hvm/vmx/vvmx.c                   |  2 +-
 xen/arch/x86/hvm/vpt.c                        |  2 +-
 xen/arch/x86/hypercall.c                      |  2 +-
 xen/arch/x86/include/asm/acpi.h               |  2 +-
 xen/arch/x86/include/asm/altp2m.h             |  2 +-
 xen/arch/x86/include/asm/edd.h                |  4 ++--
 xen/arch/x86/include/asm/endbr.h              |  2 +-
 xen/arch/x86/include/asm/guest.h              |  2 +-
 xen/arch/x86/include/asm/guest/hyperv-hcall.h |  2 +-
 xen/arch/x86/include/asm/guest/hyperv.h       |  2 +-
 xen/arch/x86/include/asm/guest/hypervisor.h   |  2 +-
 xen/arch/x86/include/asm/guest/pvh-boot.h     |  2 +-
 xen/arch/x86/include/asm/guest/xen-hcall.h    |  2 +-
 xen/arch/x86/include/asm/guest/xen.h          |  2 +-
 xen/arch/x86/include/asm/guest_pt.h           |  2 +-
 xen/arch/x86/include/asm/hap.h                |  2 +-
 xen/arch/x86/include/asm/hpet.h               |  2 +-
 xen/arch/x86/include/asm/hvm/asid.h           |  2 +-
 xen/arch/x86/include/asm/hvm/domain.h         |  2 +-
 xen/arch/x86/include/asm/hvm/grant_table.h    |  2 +-
 xen/arch/x86/include/asm/hvm/hvm.h            |  2 +-
 xen/arch/x86/include/asm/hvm/io.h             |  2 +-
 xen/arch/x86/include/asm/hvm/ioreq.h          |  2 +-
 xen/arch/x86/include/asm/hvm/irq.h            |  2 +-
 xen/arch/x86/include/asm/hvm/monitor.h        |  2 +-
 xen/arch/x86/include/asm/hvm/nestedhvm.h      |  2 +-
 xen/arch/x86/include/asm/hvm/save.h           |  2 +-
 xen/arch/x86/include/asm/hvm/support.h        |  2 +-
 xen/arch/x86/include/asm/hvm/svm/asid.h       |  2 +-
 xen/arch/x86/include/asm/hvm/svm/emulate.h    |  2 +-
 xen/arch/x86/include/asm/hvm/svm/intr.h       |  2 +-
 xen/arch/x86/include/asm/hvm/svm/nestedsvm.h  |  2 +-
 xen/arch/x86/include/asm/hvm/svm/svm.h        |  2 +-
 xen/arch/x86/include/asm/hvm/svm/svmdebug.h   |  2 +-
 xen/arch/x86/include/asm/hvm/svm/vmcb.h       |  2 +-
 xen/arch/x86/include/asm/hvm/vcpu.h           |  2 +-
 xen/arch/x86/include/asm/hvm/vioapic.h        |  6 ++---
 xen/arch/x86/include/asm/hvm/vlapic.h         |  2 +-
 xen/arch/x86/include/asm/hvm/vm_event.h       |  2 +-
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h       |  2 +-
 xen/arch/x86/include/asm/hvm/vmx/vmx.h        |  2 +-
 xen/arch/x86/include/asm/hvm/vmx/vvmx.h       |  2 +-
 xen/arch/x86/include/asm/hvm/vpt.h            |  2 +-
 xen/arch/x86/include/asm/iommu.h              |  2 +-
 xen/arch/x86/include/asm/ioreq.h              |  2 +-
 xen/arch/x86/include/asm/mem_access.h         |  2 +-
 xen/arch/x86/include/asm/mem_paging.h         |  2 +-
 xen/arch/x86/include/asm/mem_sharing.h        |  2 +-
 xen/arch/x86/include/asm/monitor.h            |  2 +-
 xen/arch/x86/include/asm/p2m.h                |  2 +-
 xen/arch/x86/include/asm/paging.h             |  2 +-
 xen/arch/x86/include/asm/pv/domain.h          |  2 +-
 xen/arch/x86/include/asm/pv/grant_table.h     |  2 +-
 xen/arch/x86/include/asm/pv/mm.h              |  2 +-
 xen/arch/x86/include/asm/pv/shim.h            |  2 +-
 xen/arch/x86/include/asm/pv/traps.h           |  2 +-
 xen/arch/x86/include/asm/shadow.h             |  2 +-
 xen/arch/x86/include/asm/shstk.h              |  2 +-
 xen/arch/x86/include/asm/spec_ctrl.h          |  2 +-
 xen/arch/x86/include/asm/spec_ctrl_asm.h      |  2 +-
 xen/arch/x86/include/asm/traps.h              |  2 +-
 xen/arch/x86/include/asm/vm_event.h           |  2 +-
 xen/arch/x86/include/asm/vpmu.h               |  2 +-
 xen/arch/x86/include/asm/xenoprof.h           |  2 +-
 xen/arch/x86/mm.c                             |  2 +-
 xen/arch/x86/mm/altp2m.c                      |  2 +-
 xen/arch/x86/mm/guest_walk.c                  |  2 +-
 xen/arch/x86/mm/hap/guest_walk.c              |  2 +-
 xen/arch/x86/mm/hap/hap.c                     |  2 +-
 xen/arch/x86/mm/hap/nested_ept.c              |  2 +-
 xen/arch/x86/mm/hap/nested_hap.c              |  2 +-
 xen/arch/x86/mm/hap/private.h                 |  2 +-
 xen/arch/x86/mm/mem_access.c                  |  2 +-
 xen/arch/x86/mm/mem_paging.c                  |  2 +-
 xen/arch/x86/mm/mem_sharing.c                 |  2 +-
 xen/arch/x86/mm/mm-locks.h                    |  2 +-
 xen/arch/x86/mm/nested.c                      |  2 +-
 xen/arch/x86/mm/p2m-basic.c                   |  2 +-
 xen/arch/x86/mm/p2m-ept.c                     |  2 +-
 xen/arch/x86/mm/p2m-pod.c                     |  2 +-
 xen/arch/x86/mm/p2m-pt.c                      |  2 +-
 xen/arch/x86/mm/p2m.c                         |  2 +-
 xen/arch/x86/mm/p2m.h                         |  2 +-
 xen/arch/x86/mm/paging.c                      |  2 +-
 xen/arch/x86/mm/physmap.c                     |  2 +-
 xen/arch/x86/mm/shadow/common.c               |  2 +-
 xen/arch/x86/mm/shadow/hvm.c                  |  2 +-
 xen/arch/x86/mm/shadow/multi.c                |  2 +-
 xen/arch/x86/mm/shadow/multi.h                |  2 +-
 xen/arch/x86/mm/shadow/private.h              |  2 +-
 xen/arch/x86/mm/shadow/pv.c                   |  2 +-
 xen/arch/x86/mm/shadow/set.c                  |  2 +-
 xen/arch/x86/mm/shadow/types.h                |  2 +-
 xen/arch/x86/monitor.c                        |  2 +-
 xen/arch/x86/msr.c                            |  2 +-
 xen/arch/x86/pv/callback.c                    |  2 +-
 xen/arch/x86/pv/descriptor-tables.c           |  2 +-
 xen/arch/x86/pv/emul-gate-op.c                |  2 +-
 xen/arch/x86/pv/emul-inv-op.c                 |  2 +-
 xen/arch/x86/pv/emul-priv-op.c                |  2 +-
 xen/arch/x86/pv/emulate.c                     |  2 +-
 xen/arch/x86/pv/grant_table.c                 |  2 +-
 xen/arch/x86/pv/hypercall.c                   |  2 +-
 xen/arch/x86/pv/iret.c                        |  2 +-
 xen/arch/x86/pv/misc-hypercalls.c             |  2 +-
 xen/arch/x86/pv/mm.c                          |  2 +-
 xen/arch/x86/pv/ro-page-fault.c               |  2 +-
 xen/arch/x86/pv/shim.c                        |  2 +-
 xen/arch/x86/pv/traps.c                       |  2 +-
 xen/arch/x86/smpboot.c                        |  2 +-
 xen/arch/x86/spec_ctrl.c                      |  2 +-
 xen/arch/x86/traps.c                          |  2 +-
 xen/arch/x86/vm_event.c                       |  2 +-
 xen/arch/x86/x86_64/acpi_mmcfg.c              |  2 +-
 xen/arch/x86/x86_64/cpu_idle.c                |  2 +-
 xen/arch/x86/x86_64/cpufreq.c                 |  2 +-
 xen/arch/x86/x86_64/gdbstub.c                 |  2 +-
 xen/arch/x86/x86_64/mm.c                      |  2 +-
 xen/arch/x86/x86_64/mmconfig.h                |  2 +-
 xen/arch/x86/x86_emulate/x86_emulate.c        |  2 +-
 xen/arch/x86/x86_emulate/x86_emulate.h        |  2 +-
 xen/common/README.source                      |  6 ++---
 xen/common/argo.c                             |  2 +-
 xen/common/bunzip2.c                          |  6 ++---
 xen/common/coverage/coverage.c                |  2 +-
 xen/common/dm.c                               |  2 +-
 xen/common/event_channel.c                    |  2 +-
 xen/common/gdbstub.c                          |  2 +-
 xen/common/grant_table.c                      |  2 +-
 xen/common/ioreq.c                            |  2 +-
 xen/common/libelf/libelf-dominfo.c            |  2 +-
 xen/common/libelf/libelf-loader.c             |  2 +-
 xen/common/libelf/libelf-private.h            |  2 +-
 xen/common/libelf/libelf-tools.c              |  2 +-
 xen/common/lz4/decompress.c                   |  6 ++---
 xen/common/lzo.c                              |  8 +++----
 xen/common/mem_access.c                       |  2 +-
 xen/common/monitor.c                          |  2 +-
 xen/common/page_alloc.c                       |  2 +-
 xen/common/pdx.c                              |  2 +-
 xen/common/preempt.c                          |  2 +-
 xen/common/radix-tree.c                       |  2 +-
 xen/common/rcupdate.c                         |  8 +++----
 xen/common/sched/null.c                       |  2 +-
 xen/common/stop_machine.c                     |  2 +-
 xen/common/time.c                             |  2 +-
 xen/common/unlzma.c                           |  8 +++----
 xen/common/unlzo.c                            |  4 ++--
 xen/common/vm_event.c                         |  2 +-
 xen/common/wait.c                             |  2 +-
 xen/common/xmalloc_tlsf.c                     |  4 ++--
 xen/common/xz/crc32.c                         |  2 +-
 xen/common/xz/dec_bcj.c                       |  2 +-
 xen/common/xz/dec_lzma2.c                     |  2 +-
 xen/common/xz/lzma2.h                         |  2 +-
 xen/common/xz/stream.h                        |  2 +-
 xen/common/zstd/bitstream.h                   |  2 +-
 xen/common/zstd/entropy_common.c              |  2 +-
 xen/common/zstd/fse.h                         |  2 +-
 xen/common/zstd/fse_decompress.c              |  2 +-
 xen/common/zstd/huf.h                         |  2 +-
 xen/common/zstd/huf_decompress.c              |  2 +-
 xen/crypto/README.source                      |  4 ++--
 xen/drivers/acpi/apei/apei-base.c             |  2 +-
 xen/drivers/acpi/apei/apei-io.c               |  2 +-
 xen/drivers/acpi/apei/erst.c                  |  2 +-
 xen/drivers/acpi/apei/hest.c                  |  2 +-
 xen/drivers/acpi/numa.c                       |  2 +-
 xen/drivers/acpi/osl.c                        |  2 +-
 xen/drivers/acpi/pmstat.c                     |  2 +-
 xen/drivers/acpi/tables.c                     |  2 +-
 xen/drivers/char/consoled.c                   |  2 +-
 xen/drivers/char/meson-uart.c                 |  2 +-
 xen/drivers/char/mvebu-uart.c                 |  2 +-
 xen/drivers/char/xen_pv_console.c             |  2 +-
 xen/drivers/char/xhci-dbc.c                   |  2 +-
 xen/drivers/cpufreq/cpufreq.c                 |  2 +-
 xen/drivers/passthrough/amd/iommu-defs.h      |  2 +-
 xen/drivers/passthrough/amd/iommu.h           |  2 +-
 xen/drivers/passthrough/amd/iommu_acpi.c      |  2 +-
 xen/drivers/passthrough/amd/iommu_cmd.c       |  2 +-
 xen/drivers/passthrough/amd/iommu_detect.c    |  2 +-
 xen/drivers/passthrough/amd/iommu_guest.c     |  2 +-
 xen/drivers/passthrough/amd/iommu_init.c      |  2 +-
 xen/drivers/passthrough/amd/iommu_intr.c      |  2 +-
 xen/drivers/passthrough/amd/iommu_map.c       |  2 +-
 xen/drivers/passthrough/amd/pci_amd_iommu.c   |  2 +-
 xen/drivers/passthrough/arm/iommu_fwspec.c    |  2 +-
 xen/drivers/passthrough/arm/iommu_helpers.c   |  2 +-
 xen/drivers/passthrough/arm/ipmmu-vmsa.c      |  4 ++--
 xen/drivers/passthrough/arm/smmu-v3.c         |  2 +-
 xen/drivers/passthrough/arm/smmu.c            |  2 +-
 xen/drivers/passthrough/ats.c                 |  2 +-
 xen/drivers/passthrough/ats.h                 |  2 +-
 xen/drivers/passthrough/iommu.c               |  2 +-
 xen/drivers/passthrough/pci.c                 |  6 ++---
 xen/drivers/passthrough/vtd/dmar.c            |  2 +-
 xen/drivers/passthrough/vtd/dmar.h            |  2 +-
 xen/drivers/passthrough/vtd/extern.h          |  2 +-
 xen/drivers/passthrough/vtd/intremap.c        |  2 +-
 xen/drivers/passthrough/vtd/iommu.c           |  2 +-
 xen/drivers/passthrough/vtd/iommu.h           |  2 +-
 xen/drivers/passthrough/vtd/qinval.c          |  2 +-
 xen/drivers/passthrough/vtd/quirks.c          |  2 +-
 xen/drivers/passthrough/vtd/utils.c           |  2 +-
 xen/drivers/passthrough/vtd/vtd.h             |  2 +-
 xen/drivers/passthrough/vtd/x86/ats.c         |  2 +-
 xen/drivers/passthrough/vtd/x86/hvm.c         |  2 +-
 xen/drivers/passthrough/vtd/x86/vtd.c         |  2 +-
 xen/drivers/passthrough/x86/hvm.c             |  2 +-
 xen/drivers/passthrough/x86/iommu.c           |  2 +-
 xen/drivers/vpci/header.c                     |  2 +-
 xen/drivers/vpci/msi.c                        |  2 +-
 xen/drivers/vpci/msix.c                       |  2 +-
 xen/drivers/vpci/vpci.c                       |  2 +-
 xen/include/acpi/actbl3.h                     |  2 +-
 xen/include/crypto/README.source              |  4 ++--
 xen/include/crypto/vmac.h                     |  4 ++--
 xen/include/efi/eficapsule.h                  |  2 +-
 xen/include/public/arch-x86/hvm/start_info.h  |  2 +-
 xen/include/public/errno.h                    |  2 +-
 xen/include/public/grant_table.h              |  2 +-
 xen/include/public/hvm/params.h               |  2 +-
 xen/include/public/io/blkif.h                 |  4 ++--
 xen/include/public/io/libxenvchan.h           |  2 +-
 xen/include/public/io/tpmif.h                 |  2 +-
 xen/include/xen/acpi.h                        |  2 +-
 xen/include/xen/argo.h                        |  2 +-
 xen/include/xen/atomic.h                      |  2 +-
 xen/include/xen/compiler.h                    |  2 +-
 xen/include/xen/cper.h                        |  2 +-
 xen/include/xen/cpuidle.h                     |  2 +-
 xen/include/xen/dm.h                          |  2 +-
 xen/include/xen/elfstructs.h                  |  4 ++--
 xen/include/xen/gdbstub.h                     |  2 +-
 xen/include/xen/grant_table.h                 |  2 +-
 xen/include/xen/inttypes.h                    |  2 +-
 xen/include/xen/iommu.h                       |  2 +-
 xen/include/xen/ioreq.h                       |  2 +-
 xen/include/xen/lzo.h                         |  2 +-
 xen/include/xen/mem_access.h                  |  2 +-
 xen/include/xen/monitor.h                     |  2 +-
 xen/include/xen/multiboot.h                   |  2 +-
 xen/include/xen/pci_regs.h                    |  4 ++--
 xen/include/xen/radix-tree.h                  |  2 +-
 xen/include/xen/rbtree.h                      |  2 +-
 xen/include/xen/rcupdate.h                    |  8 +++----
 xen/include/xen/vm_event.h                    |  2 +-
 xen/include/xen/xxhash.h                      |  2 +-
 xen/lib/list-sort.c                           |  2 +-
 xen/lib/rbtree.c                              |  4 ++--
 xen/lib/xxhash32.c                            |  2 +-
 xen/lib/xxhash64.c                            |  2 +-
 xen/tools/kconfig/gconf.c                     |  2 +-
 xen/tools/kconfig/merge_config.sh             |  4 ++--
 xen/tools/kconfig/qconf.cc                    |  2 +-
 xen/xsm/silo.c                                |  2 +-
 714 files changed, 882 insertions(+), 907 deletions(-)

-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

