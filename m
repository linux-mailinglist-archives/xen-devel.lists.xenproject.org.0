Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D83B768E741
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 05:52:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491525.760735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPcQm-0006ZL-GZ; Wed, 08 Feb 2023 04:51:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491525.760735; Wed, 08 Feb 2023 04:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPcQm-0006W0-Av; Wed, 08 Feb 2023 04:51:40 +0000
Received: by outflank-mailman (input) for mailman id 491525;
 Wed, 08 Feb 2023 04:51:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mMba=6E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pPcQj-0005Mg-Tv
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 04:51:38 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42710f65-a76c-11ed-93b5-47a8fe42b414;
 Wed, 08 Feb 2023 05:51:33 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id EBE585C016C;
 Tue,  7 Feb 2023 23:51:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 07 Feb 2023 23:51:32 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Feb 2023 23:51:30 -0500 (EST)
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
X-Inumbo-ID: 42710f65-a76c-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1675831892; x=1675918292; bh=dyK2mpttNlzVjpmXjCcZV/GbQ/bzks8cjQn
	Q60uAr7g=; b=hfE/uk4jHwleDnLOPFF3C2Iq3Txxwi41B1e8Iw0UR63dzPkzVTp
	KttBft+UGbsfd8cZUf0FwWV8iOzE2EK6oeMAmVCpilSQ83InLqzj/Mmjy3BVlREp
	uBTXdpwzhPp12Yr+X0GmIzegME13zQtinklOgKtfzerBjfYPqmcuP1tdnSdFhiM5
	6kAxWW/DAJHloUkd29hxuTtj3LSFsb2hyQNVJtAPa3N1mdTx54q0IBvxmmboz7QF
	ah2QlCgukkzWC9ktad34AbNAB1d14BTNN25DDoNhmrKxu6rpVb28MWj6Y/qkBvEF
	nLIOUXGWPFtkfIDbTLWdOP9FepWGFfHkeGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1675831892; x=1675918292; bh=dyK2mpttNlzVj
	pmXjCcZV/GbQ/bzks8cjQnQ60uAr7g=; b=CLPh1dzHDxcvxZUVYPulJkMyuIs02
	XRDQJX6qkdvIjj5SscepqvVbvUZz+F37Et58Ced05/K17iRXHLckm97DS99lEkvo
	ta5mXh46h6nocc2gqkq9H7xO9T1QGZCtPycSbRuK8krWvARm9X3/7l2VNSM62hzq
	5ZyzoTCTaE0pLmGlRu0Xo1VvQHl9mrFGmlZEoa713JczgvUQC5+WKg4m/W/tlwui
	5s9aWbN9/M/ZSNjk3rYGpQu7LtimhpzbbZ97tijV8Yi74Ca74i/rqqpY1dMIEsRg
	iDPwKQTJY1OvhfIKXcTt7GyWi4BCF80jPKVNI85Xxic2jYdwTRAgl5Vmg==
X-ME-Sender: <xms:VCrjY13XSSq-qTEE7olS06NJKuQUO8LjKJbygMrkvtl6OHBeF4sA1Q>
    <xme:VCrjY8FcoNDQZbZPpyLvccAkGLzkHPqc4wFv-4ztotKjg6mH763oP3DSDHOveVctb
    zTemye3zQoiwTU>
X-ME-Received: <xmr:VCrjY1486b59CQ-fqVeNYFDnvlNxDiDYIT9j2IP9plK6k5JCPEeOUDWXzs3LZm4hWk_CgpK-AmM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudegledgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdvvddvfeevffekveetjedtffdt
    veelkeffleehgedukeeuveegjeefffevgfehnecuffhomhgrihhnpehgnhhurdhorhhgpd
    dutddrudekvddruddvtddrjeekpdgrphhmsghiohhsrdhssgdptghmuhdrvgguuhdpfiho
    rhhlughonhhlihhnvgdrughkpdhsghhirdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhn
    ghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:VCrjYy2UFkWGHK4GKpr8XVSSYnaFZmjRBADIFeAoHTp8iUkdTJIDPA>
    <xmx:VCrjY4FJfY--NpQ67oX-IToFajVBrKYZM-E3irz_fG4rj40OOBIisA>
    <xmx:VCrjYz_ONMrgB08WxB_oIqntlMQmUbmZ_qW-YjmhG0K0e4MT4_lERA>
    <xmx:VCrjY2MCoSHILDYX4kwyL-HeNTTzPy8tpJn0Z_Mcp-Q6GaSR1vG90Q>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,	Quan Xu <quan.xu0@gmail.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jun Nakajima <jun.nakajima@intel.com>,	Kevin Tian <kevin.tian@intel.com>,
	Paul Durrant <paul@xen.org>,	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,	Tim Deegan <tim@xen.org>,
	Christopher Clark <christopher.w.clark@gmail.com>,
	Dario Faggioli <dfaggioli@suse.com>,	Rahul Singh <rahul.singh@arm.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 4/4] GPL License Boilerplate: Switch from HTTP to HTTPS
Date: Tue,  7 Feb 2023 23:51:07 -0500
Message-Id: <32fae62c9eb9e9536d49fdd28e1bf54430842023.1675829867.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1675829866.git.demi@invisiblethingslab.com>
References: <cover.1675829866.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Obtaining code over an insecure transport is a terrible idea for
blatently obvious reasons.  Even for non-executable data, insecure
transports are considered deprecated.

This patch changes GPL boilerplate.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
This patch is absolutely massive.  Thankfully, it was autogenerated.

 m4/pkg.m4                                          |  2 +-
 m4/systemd.m4                                      |  2 +-
 stubdom/grub.patches/10graphics.diff               |  2 +-
 stubdom/grub.patches/61btrfs.diff                  |  4 ++--
 stubdom/vtpmmgr/tpmrsa.c                           |  2 +-
 stubdom/vtpmmgr/tpmrsa.h                           |  2 +-
 tools/configure                                    |  4 ++--
 tools/console/client/main.c                        |  2 +-
 tools/console/daemon/io.c                          |  2 +-
 tools/console/daemon/io.h                          |  2 +-
 tools/console/daemon/main.c                        |  2 +-
 tools/console/daemon/utils.c                       |  2 +-
 tools/console/daemon/utils.h                       |  2 +-
 tools/debugger/gdbsx/README                        |  2 +-
 tools/debugger/gdbsx/gx/gx.h                       |  2 +-
 tools/debugger/gdbsx/gx/gx_comm.c                  |  4 ++--
 tools/debugger/gdbsx/gx/gx_local.c                 |  2 +-
 tools/debugger/gdbsx/gx/gx_main.c                  |  2 +-
 tools/debugger/gdbsx/gx/gx_utils.c                 |  2 +-
 tools/debugger/gdbsx/gx/xg_dummy.c                 |  2 +-
 tools/debugger/gdbsx/xg/xg_main.c                  |  2 +-
 tools/debugger/gdbsx/xg/xg_public.h                |  2 +-
 tools/firmware/hvmloader/32bitbios_support.c       |  2 +-
 tools/firmware/hvmloader/Makefile                  |  2 +-
 tools/firmware/hvmloader/cacheattr.c               |  2 +-
 tools/firmware/hvmloader/e820.c                    |  2 +-
 tools/firmware/hvmloader/hvmloader.c               |  2 +-
 tools/firmware/hvmloader/mp_tables.c               |  2 +-
 tools/firmware/hvmloader/optionroms.c              |  2 +-
 tools/firmware/hvmloader/ovmf.c                    |  2 +-
 tools/firmware/hvmloader/pci.c                     |  2 +-
 tools/firmware/hvmloader/pir_types.h               |  2 +-
 tools/firmware/hvmloader/rombios.c                 |  2 +-
 tools/firmware/hvmloader/seabios.c                 |  2 +-
 tools/firmware/hvmloader/smbios.c                  |  2 +-
 tools/firmware/hvmloader/smbios_types.h            |  2 +-
 tools/firmware/hvmloader/smp.c                     |  2 +-
 tools/firmware/hvmloader/tests.c                   |  2 +-
 tools/firmware/hvmloader/util.c                    |  2 +-
 tools/firmware/rombios/32bit/32bitbios.c           |  2 +-
 tools/firmware/rombios/32bit/mkhex                 |  2 +-
 tools/firmware/rombios/32bit/pmm.c                 |  2 +-
 tools/firmware/rombios/32bit/tcgbios/tcgbios.c     |  2 +-
 tools/firmware/rombios/32bit/tcgbios/tpm_drivers.c |  2 +-
 tools/firmware/rombios/32bit/util.c                |  2 +-
 tools/firmware/rombios/32bitgateway.c              |  2 +-
 tools/firmware/rombios/apmbios.S                   |  2 +-
 tools/firmware/rombios/rombios.c                   |  2 +-
 tools/firmware/rombios/rombios.h                   |  2 +-
 tools/firmware/rombios/tcgbios.c                   |  2 +-
 tools/firmware/vgabios/COPYING                     |  2 +-
 tools/firmware/vgabios/biossums.c                  |  2 +-
 tools/firmware/vgabios/clext.c                     |  2 +-
 tools/firmware/vgabios/vbe.c                       |  2 +-
 tools/firmware/vgabios/vgabios.c                   |  4 ++--
 tools/golang/xenlight/xenlight.go                  |  2 +-
 tools/hotplug/Linux/block-common.sh                |  2 +-
 tools/hotplug/Linux/block-drbd-probe               |  2 +-
 tools/hotplug/Linux/external-device-migrate        |  2 +-
 tools/hotplug/Linux/launch-xenstore.in             |  2 +-
 tools/hotplug/Linux/locking.sh                     |  2 +-
 tools/hotplug/Linux/logging.sh                     |  2 +-
 tools/hotplug/Linux/vif-common.sh                  |  2 +-
 tools/hotplug/Linux/xen-hotplug-common.sh.in       |  2 +-
 tools/hotplug/Linux/xen-network-common.sh          |  2 +-
 tools/hotplug/Linux/xen-script-common.sh           |  2 +-
 tools/hotplug/NetBSD/locking.sh                    |  2 +-
 tools/include/libxenvchan.h                        |  2 +-
 tools/include/xencall.h                            |  2 +-
 tools/include/xenctrl.h                            |  2 +-
 tools/include/xendevicemodel.h                     |  2 +-
 tools/include/xenevtchn.h                          |  2 +-
 tools/include/xenforeignmemory.h                   |  2 +-
 tools/include/xengnttab.h                          |  2 +-
 tools/include/xenguest.h                           |  2 +-
 tools/include/xenhypfs.h                           |  2 +-
 tools/include/xenstore.h                           |  2 +-
 tools/include/xenstore_lib.h                       |  2 +-
 tools/include/xentoolcore.h                        |  2 +-
 tools/include/xentoolcore_internal.h               |  2 +-
 tools/include/xentoollog.h                         |  2 +-
 tools/libfsimage/ext2fs/fsys_ext2fs.c              |  2 +-
 tools/libfsimage/fat/fat.h                         |  2 +-
 tools/libfsimage/fat/fsys_fat.c                    |  2 +-
 tools/libfsimage/iso9660/fsys_iso9660.c            |  2 +-
 tools/libfsimage/iso9660/iso9660.h                 |  2 +-
 tools/libfsimage/reiserfs/fsys_reiserfs.c          |  2 +-
 tools/libfsimage/ufs/fsys_ufs.c                    |  2 +-
 tools/libfsimage/xfs/fsys_xfs.c                    |  2 +-
 tools/libfsimage/xfs/xfs.h                         |  4 ++--
 tools/libfsimage/zfs/Makefile                      |  2 +-
 tools/libfsimage/zfs/filesys.h                     |  2 +-
 tools/libfsimage/zfs/fsi_zfs.c                     |  2 +-
 tools/libfsimage/zfs/fsi_zfs.h                     |  2 +-
 tools/libfsimage/zfs/fsys_zfs.c                    |  2 +-
 tools/libfsimage/zfs/fsys_zfs.h                    |  2 +-
 tools/libfsimage/zfs/mb_info.h                     |  2 +-
 tools/libfsimage/zfs/shared.h                      |  2 +-
 tools/libfsimage/zfs/zfs-include/dmu.h             |  2 +-
 tools/libfsimage/zfs/zfs-include/dmu_objset.h      |  2 +-
 tools/libfsimage/zfs/zfs-include/dnode.h           |  2 +-
 tools/libfsimage/zfs/zfs-include/dsl_dataset.h     |  2 +-
 tools/libfsimage/zfs/zfs-include/dsl_dir.h         |  2 +-
 tools/libfsimage/zfs/zfs-include/sa_impl.h         |  2 +-
 tools/libfsimage/zfs/zfs-include/spa.h             |  2 +-
 tools/libfsimage/zfs/zfs-include/uberblock_impl.h  |  2 +-
 tools/libfsimage/zfs/zfs-include/vdev_impl.h       |  2 +-
 tools/libfsimage/zfs/zfs-include/zap_impl.h        |  2 +-
 tools/libfsimage/zfs/zfs-include/zap_leaf.h        |  2 +-
 tools/libfsimage/zfs/zfs-include/zfs.h             |  2 +-
 tools/libfsimage/zfs/zfs-include/zfs_acl.h         |  2 +-
 tools/libfsimage/zfs/zfs-include/zfs_znode.h       |  2 +-
 tools/libfsimage/zfs/zfs-include/zil.h             |  2 +-
 tools/libfsimage/zfs/zfs-include/zio.h             |  2 +-
 tools/libfsimage/zfs/zfs-include/zio_checksum.h    |  2 +-
 tools/libfsimage/zfs/zfs_fletcher.c                |  2 +-
 tools/libfsimage/zfs/zfs_lzjb.c                    |  2 +-
 tools/libfsimage/zfs/zfs_sha256.c                  |  2 +-
 tools/libs/call/buffer.c                           |  2 +-
 tools/libs/call/core.c                             |  2 +-
 tools/libs/call/freebsd.c                          |  2 +-
 tools/libs/call/linux.c                            |  2 +-
 tools/libs/call/minios.c                           |  2 +-
 tools/libs/call/netbsd.c                           |  2 +-
 tools/libs/call/solaris.c                          |  2 +-
 tools/libs/ctrl/xc_altp2m.c                        |  2 +-
 tools/libs/ctrl/xc_cpu_hotplug.c                   |  2 +-
 tools/libs/ctrl/xc_cpupool.c                       |  2 +-
 tools/libs/ctrl/xc_csched.c                        |  2 +-
 tools/libs/ctrl/xc_csched2.c                       |  2 +-
 tools/libs/ctrl/xc_domain.c                        |  2 +-
 tools/libs/ctrl/xc_evtchn.c                        |  2 +-
 tools/libs/ctrl/xc_flask.c                         |  2 +-
 tools/libs/ctrl/xc_foreign_memory.c                |  2 +-
 tools/libs/ctrl/xc_freebsd.c                       |  2 +-
 tools/libs/ctrl/xc_gnttab.c                        |  2 +-
 tools/libs/ctrl/xc_hcall_buf.c                     |  2 +-
 tools/libs/ctrl/xc_linux.c                         |  2 +-
 tools/libs/ctrl/xc_mem_access.c                    |  2 +-
 tools/libs/ctrl/xc_mem_paging.c                    |  2 +-
 tools/libs/ctrl/xc_memshr.c                        |  2 +-
 tools/libs/ctrl/xc_minios.c                        |  2 +-
 tools/libs/ctrl/xc_misc.c                          |  2 +-
 tools/libs/ctrl/xc_monitor.c                       |  2 +-
 tools/libs/ctrl/xc_netbsd.c                        |  2 +-
 tools/libs/ctrl/xc_pagetab.c                       |  2 +-
 tools/libs/ctrl/xc_physdev.c                       |  2 +-
 tools/libs/ctrl/xc_pm.c                            |  2 +-
 tools/libs/ctrl/xc_private.c                       |  2 +-
 tools/libs/ctrl/xc_private.h                       |  2 +-
 tools/libs/ctrl/xc_rt.c                            |  2 +-
 tools/libs/ctrl/xc_solaris.c                       |  2 +-
 tools/libs/ctrl/xc_tbuf.c                          |  2 +-
 tools/libs/ctrl/xc_vm_event.c                      |  2 +-
 tools/libs/ctrl/xc_vmtrace.c                       |  2 +-
 tools/libs/devicemodel/common.c                    |  2 +-
 tools/libs/devicemodel/compat.c                    |  2 +-
 tools/libs/devicemodel/core.c                      |  2 +-
 tools/libs/evtchn/core.c                           |  2 +-
 tools/libs/evtchn/freebsd.c                        |  2 +-
 tools/libs/evtchn/linux.c                          |  2 +-
 tools/libs/evtchn/minios.c                         |  2 +-
 tools/libs/evtchn/netbsd.c                         |  2 +-
 tools/libs/evtchn/solaris.c                        |  2 +-
 tools/libs/foreignmemory/compat.c                  |  2 +-
 tools/libs/foreignmemory/core.c                    |  2 +-
 tools/libs/foreignmemory/freebsd.c                 |  2 +-
 tools/libs/foreignmemory/linux.c                   |  2 +-
 tools/libs/foreignmemory/minios.c                  |  2 +-
 tools/libs/foreignmemory/netbsd.c                  |  2 +-
 tools/libs/foreignmemory/solaris.c                 |  2 +-
 tools/libs/gnttab/freebsd.c                        |  2 +-
 tools/libs/gnttab/gntshr_core.c                    |  2 +-
 tools/libs/gnttab/gntshr_unimp.c                   |  2 +-
 tools/libs/gnttab/gnttab_core.c                    |  2 +-
 tools/libs/gnttab/gnttab_unimp.c                   |  2 +-
 tools/libs/gnttab/linux.c                          |  2 +-
 tools/libs/gnttab/minios.c                         |  2 +-
 tools/libs/gnttab/netbsd.c                         |  2 +-
 tools/libs/guest/xg_core.c                         |  2 +-
 tools/libs/guest/xg_core.h                         |  2 +-
 tools/libs/guest/xg_core_arm.c                     |  2 +-
 tools/libs/guest/xg_core_arm.h                     |  2 +-
 tools/libs/guest/xg_core_x86.c                     |  2 +-
 tools/libs/guest/xg_core_x86.h                     |  2 +-
 tools/libs/guest/xg_cpuid_x86.c                    |  2 +-
 tools/libs/guest/xg_dom_arm.c                      |  2 +-
 tools/libs/guest/xg_dom_armzimageloader.c          |  2 +-
 tools/libs/guest/xg_dom_binloader.c                |  2 +-
 tools/libs/guest/xg_dom_boot.c                     |  2 +-
 tools/libs/guest/xg_dom_bzimageloader.c            |  2 +-
 tools/libs/guest/xg_dom_compat_linux.c             |  2 +-
 tools/libs/guest/xg_dom_core.c                     |  2 +-
 tools/libs/guest/xg_dom_elfloader.c                |  2 +-
 tools/libs/guest/xg_dom_hvmloader.c                |  2 +-
 tools/libs/guest/xg_dom_x86.c                      |  2 +-
 tools/libs/guest/xg_domain.c                       |  2 +-
 tools/libs/guest/xg_nomigrate.c                    |  2 +-
 tools/libs/guest/xg_offline_page.c                 |  2 +-
 tools/libs/guest/xg_private.c                      |  2 +-
 tools/libs/guest/xg_private.h                      |  2 +-
 tools/libs/guest/xg_resume.c                       |  2 +-
 tools/libs/guest/xg_save_restore.h                 |  2 +-
 tools/libs/guest/xg_suspend.c                      |  2 +-
 tools/libs/hypfs/core.c                            |  2 +-
 tools/libs/stat/COPYING                            |  2 +-
 tools/libs/store/xs.c                              |  2 +-
 tools/libs/toolcore/handlereg.c                    |  2 +-
 tools/libs/toollog/xtl_core.c                      |  2 +-
 tools/libs/toollog/xtl_logger_stdio.c              |  2 +-
 tools/libs/util/libxlu_cfg_y.c                     |  2 +-
 tools/libs/util/libxlu_cfg_y.h                     |  2 +-
 tools/libs/vchan/init.c                            |  2 +-
 tools/libs/vchan/io.c                              |  2 +-
 tools/libs/vchan/vchan.h                           |  2 +-
 tools/misc/mkhex                                   |  2 +-
 tools/misc/xen-mceinj.c                            |  2 +-
 tools/misc/xen-vmtrace.c                           |  2 +-
 tools/misc/xencov.c                                |  2 +-
 tools/misc/xenpm.c                                 |  2 +-
 tools/misc/xenpvnetboot                            |  6 +++---
 tools/ocaml/LICENSE                                |  2 +-
 tools/pygrub/src/ExtLinuxConf.py                   |  2 +-
 tools/pygrub/src/GrubConf.py                       |  2 +-
 tools/pygrub/src/pygrub                            |  2 +-
 tools/python/xen/lowlevel/xs/xs.c                  |  2 +-
 tools/tests/depriv/depriv-fd-checker.c             |  2 +-
 tools/tests/vhpet/emul.h                           |  2 +-
 tools/tests/vhpet/main.c                           |  2 +-
 tools/tests/vpci/emul.h                            |  2 +-
 tools/tests/vpci/main.c                            |  2 +-
 tools/tests/x86_emulator/blowfish.c                |  2 +-
 tools/tests/xenstore/test-xenstore.c               |  2 +-
 tools/vchan/node-select.c                          |  2 +-
 tools/vchan/node.c                                 |  2 +-
 tools/vchan/vchan-socket-proxy.c                   |  2 +-
 tools/xenmon/COPYING                               |  2 +-
 tools/xenmon/setmask.c                             |  2 +-
 tools/xenmon/xenbaked.c                            |  2 +-
 tools/xenmon/xenbaked.h                            |  2 +-
 tools/xenmon/xenmon.py                             |  2 +-
 tools/xenpaging/file_ops.c                         |  2 +-
 tools/xenpaging/file_ops.h                         |  2 +-
 tools/xenpaging/policy.h                           |  2 +-
 tools/xenpaging/policy_default.c                   |  2 +-
 tools/xenpaging/xenpaging.c                        |  2 +-
 tools/xenpaging/xenpaging.h                        |  2 +-
 tools/xenpmd/xenpmd.c                              |  2 +-
 tools/xenstore/COPYING                             |  2 +-
 tools/xenstore/include/xenstore_state.h            |  2 +-
 tools/xenstore/talloc.c                            |  2 +-
 tools/xenstore/talloc.h                            |  2 +-
 tools/xenstore/tdb.c                               |  2 +-
 tools/xenstore/tdb.h                               |  2 +-
 tools/xenstore/xenstored_control.c                 |  2 +-
 tools/xenstore/xenstored_control.h                 |  2 +-
 tools/xenstore/xenstored_core.c                    |  2 +-
 tools/xenstore/xenstored_core.h                    |  2 +-
 tools/xenstore/xenstored_domain.c                  |  2 +-
 tools/xenstore/xenstored_domain.h                  |  2 +-
 tools/xenstore/xenstored_minios.c                  |  2 +-
 tools/xenstore/xenstored_posix.c                   |  2 +-
 tools/xenstore/xenstored_transaction.c             |  2 +-
 tools/xenstore/xenstored_transaction.h             |  2 +-
 tools/xenstore/xenstored_watch.c                   |  2 +-
 tools/xenstore/xenstored_watch.h                   |  2 +-
 tools/xenstore/xs_lib.c                            |  2 +-
 tools/xenstore/xs_lib.h                            |  2 +-
 tools/xentop/xentop.c                              |  2 +-
 tools/xentrace/xenalyze.c                          |  2 +-
 xen/COPYING                                        |  2 +-
 xen/arch/arm/acpi/boot.c                           |  2 +-
 xen/arch/arm/acpi/lib.c                            |  2 +-
 xen/arch/arm/arm32/insn.c                          |  2 +-
 xen/arch/arm/arm32/lib/bitops.c                    |  2 +-
 xen/arch/arm/arm32/lib/lib1funcs.S                 |  2 +-
 xen/arch/arm/arm32/lib/lshrdi3.S                   |  2 +-
 xen/arch/arm/arm64/bpi.S                           |  2 +-
 xen/arch/arm/arm64/cache.S                         |  2 +-
 xen/arch/arm/arm64/debug-meson.inc                 |  2 +-
 xen/arch/arm/arm64/debug-mvebu.inc                 |  2 +-
 xen/arch/arm/arm64/insn.c                          |  2 +-
 xen/arch/arm/arm64/lib/bitops.c                    |  2 +-
 xen/arch/arm/arm64/lib/clear_page.S                |  2 +-
 xen/arch/arm/arm64/lib/memchr.S                    |  2 +-
 xen/arch/arm/arm64/lib/memcmp.S                    |  2 +-
 xen/arch/arm/arm64/lib/memcpy.S                    |  2 +-
 xen/arch/arm/arm64/lib/memmove.S                   |  2 +-
 xen/arch/arm/arm64/lib/memset.S                    |  2 +-
 xen/arch/arm/arm64/lib/strchr.S                    |  2 +-
 xen/arch/arm/arm64/lib/strcmp.S                    |  2 +-
 xen/arch/arm/arm64/lib/strlen.S                    |  2 +-
 xen/arch/arm/arm64/lib/strncmp.S                   |  2 +-
 xen/arch/arm/arm64/lib/strnlen.S                   |  2 +-
 xen/arch/arm/arm64/lib/strrchr.S                   |  2 +-
 xen/arch/arm/efi/efi-dom0.c                        |  2 +-
 xen/arch/arm/include/asm/acpi.h                    |  2 +-
 xen/arch/arm/include/asm/altp2m.h                  |  2 +-
 xen/arch/arm/include/asm/arm32/insn.h              |  2 +-
 xen/arch/arm/include/asm/arm64/atomic.h            |  2 +-
 xen/arch/arm/include/asm/arm64/insn.h              |  2 +-
 xen/arch/arm/include/asm/arm64/io.h                |  2 +-
 xen/arch/arm/include/asm/gic_v3_its.h              |  2 +-
 xen/arch/arm/include/asm/iommu.h                   |  2 +-
 xen/arch/arm/include/asm/iommu_fwspec.h            |  2 +-
 xen/arch/arm/include/asm/ioreq.h                   |  2 +-
 xen/arch/arm/include/asm/mem_access.h              |  2 +-
 xen/arch/arm/include/asm/monitor.h                 |  2 +-
 xen/arch/arm/include/asm/new_vgic.h                |  2 +-
 xen/arch/arm/include/asm/pci.h                     |  2 +-
 xen/arch/arm/include/asm/vm_event.h                |  2 +-
 xen/arch/arm/include/asm/vpl011.h                  |  2 +-
 xen/arch/arm/include/asm/vpsci.h                   |  2 +-
 xen/arch/arm/pci/ecam.c                            |  2 +-
 xen/arch/arm/pci/pci-access.c                      |  2 +-
 xen/arch/arm/pci/pci-host-common.c                 |  2 +-
 xen/arch/arm/pci/pci-host-generic.c                |  2 +-
 xen/arch/arm/pci/pci-host-zynqmp.c                 |  2 +-
 xen/arch/arm/pci/pci.c                             |  2 +-
 xen/arch/arm/platforms/thunderx.c                  |  2 +-
 xen/arch/arm/vgic/vgic-init.c                      |  2 +-
 xen/arch/arm/vgic/vgic-mmio.h                      |  2 +-
 xen/arch/arm/vgic/vgic-v2.c                        |  2 +-
 xen/arch/arm/vgic/vgic.c                           |  2 +-
 xen/arch/arm/vgic/vgic.h                           |  2 +-
 xen/arch/x86/acpi/boot.c                           |  2 +-
 xen/arch/x86/acpi/cpu_idle.c                       |  2 +-
 xen/arch/x86/acpi/cpufreq/cpufreq.c                |  2 +-
 xen/arch/x86/acpi/cpufreq/powernow.c               |  2 +-
 xen/arch/x86/acpi/cpuidle_menu.c                   |  2 +-
 xen/arch/x86/acpi/lib.c                            |  2 +-
 xen/arch/x86/alternative.c                         |  2 +-
 xen/arch/x86/boot/build32.lds                      |  2 +-
 xen/arch/x86/boot/cmdline.c                        |  2 +-
 xen/arch/x86/boot/defs.h                           |  2 +-
 xen/arch/x86/cpu/mcheck/amd_nonfatal.c             |  2 +-
 xen/arch/x86/cpu/mcheck/mce-apei.c                 |  2 +-
 xen/arch/x86/cpu/mcheck/mce_amd.c                  | 10 +++++-----
 xen/arch/x86/cpu/mcheck/vmce.c                     |  2 +-
 xen/arch/x86/cpu/mcheck/x86_mca.h                  |  2 +-
 xen/arch/x86/cpu/mtrr/main.c                       |  2 +-
 xen/arch/x86/cpu/mwait-idle.c                      |  2 +-
 xen/arch/x86/cpu/vpmu.c                            |  2 +-
 xen/arch/x86/cpu/vpmu_amd.c                        |  2 +-
 xen/arch/x86/cpu/vpmu_intel.c                      |  2 +-
 xen/arch/x86/gdbstub.c                             |  2 +-
 xen/arch/x86/gdbsx.c                               |  2 +-
 xen/arch/x86/genapic/x2apic.c                      |  2 +-
 xen/arch/x86/guest/hyperv/hyperv.c                 |  2 +-
 xen/arch/x86/guest/hyperv/private.h                |  2 +-
 xen/arch/x86/guest/hyperv/tlb.c                    |  2 +-
 xen/arch/x86/guest/hyperv/util.c                   |  2 +-
 xen/arch/x86/guest/hypervisor.c                    |  2 +-
 xen/arch/x86/guest/xen/pvh-boot.c                  |  2 +-
 xen/arch/x86/guest/xen/xen.c                       |  2 +-
 xen/arch/x86/hvm/asid.c                            |  2 +-
 xen/arch/x86/hvm/dm.c                              |  2 +-
 xen/arch/x86/hvm/dom0_build.c                      |  2 +-
 xen/arch/x86/hvm/domain.c                          |  2 +-
 xen/arch/x86/hvm/grant_table.c                     |  2 +-
 xen/arch/x86/hvm/hpet.c                            |  2 +-
 xen/arch/x86/hvm/hvm.c                             |  2 +-
 xen/arch/x86/hvm/hypercall.c                       |  2 +-
 xen/arch/x86/hvm/intercept.c                       |  2 +-
 xen/arch/x86/hvm/io.c                              |  2 +-
 xen/arch/x86/hvm/ioreq.c                           |  2 +-
 xen/arch/x86/hvm/irq.c                             |  2 +-
 xen/arch/x86/hvm/monitor.c                         |  2 +-
 xen/arch/x86/hvm/mtrr.c                            |  2 +-
 xen/arch/x86/hvm/nestedhvm.c                       |  2 +-
 xen/arch/x86/hvm/pmtimer.c                         |  2 +-
 xen/arch/x86/hvm/quirks.c                          |  2 +-
 xen/arch/x86/hvm/save.c                            |  2 +-
 xen/arch/x86/hvm/svm/asid.c                        |  2 +-
 xen/arch/x86/hvm/svm/emulate.c                     |  2 +-
 xen/arch/x86/hvm/svm/entry.S                       |  2 +-
 xen/arch/x86/hvm/svm/intr.c                        |  2 +-
 xen/arch/x86/hvm/svm/nestedsvm.c                   |  2 +-
 xen/arch/x86/hvm/svm/svm.c                         |  2 +-
 xen/arch/x86/hvm/svm/svmdebug.c                    |  2 +-
 xen/arch/x86/hvm/svm/vmcb.c                        |  2 +-
 xen/arch/x86/hvm/vioapic.c                         |  2 +-
 xen/arch/x86/hvm/vlapic.c                          |  2 +-
 xen/arch/x86/hvm/vm_event.c                        |  2 +-
 xen/arch/x86/hvm/vmsi.c                            |  2 +-
 xen/arch/x86/hvm/vmx/entry.S                       |  2 +-
 xen/arch/x86/hvm/vmx/intr.c                        |  2 +-
 xen/arch/x86/hvm/vmx/vmcs.c                        |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c                         |  2 +-
 xen/arch/x86/hvm/vmx/vvmx.c                        |  2 +-
 xen/arch/x86/hvm/vpt.c                             |  2 +-
 xen/arch/x86/hypercall.c                           |  2 +-
 xen/arch/x86/include/asm/acpi.h                    |  2 +-
 xen/arch/x86/include/asm/altp2m.h                  |  2 +-
 xen/arch/x86/include/asm/endbr.h                   |  2 +-
 xen/arch/x86/include/asm/guest.h                   |  2 +-
 xen/arch/x86/include/asm/guest/hyperv-hcall.h      |  2 +-
 xen/arch/x86/include/asm/guest/hyperv.h            |  2 +-
 xen/arch/x86/include/asm/guest/hypervisor.h        |  2 +-
 xen/arch/x86/include/asm/guest/pvh-boot.h          |  2 +-
 xen/arch/x86/include/asm/guest/xen-hcall.h         |  2 +-
 xen/arch/x86/include/asm/guest/xen.h               |  2 +-
 xen/arch/x86/include/asm/guest_pt.h                |  2 +-
 xen/arch/x86/include/asm/hap.h                     |  2 +-
 xen/arch/x86/include/asm/hvm/asid.h                |  2 +-
 xen/arch/x86/include/asm/hvm/domain.h              |  2 +-
 xen/arch/x86/include/asm/hvm/grant_table.h         |  2 +-
 xen/arch/x86/include/asm/hvm/hvm.h                 |  2 +-
 xen/arch/x86/include/asm/hvm/io.h                  |  2 +-
 xen/arch/x86/include/asm/hvm/ioreq.h               |  2 +-
 xen/arch/x86/include/asm/hvm/irq.h                 |  2 +-
 xen/arch/x86/include/asm/hvm/monitor.h             |  2 +-
 xen/arch/x86/include/asm/hvm/nestedhvm.h           |  2 +-
 xen/arch/x86/include/asm/hvm/save.h                |  2 +-
 xen/arch/x86/include/asm/hvm/support.h             |  2 +-
 xen/arch/x86/include/asm/hvm/svm/asid.h            |  2 +-
 xen/arch/x86/include/asm/hvm/svm/emulate.h         |  2 +-
 xen/arch/x86/include/asm/hvm/svm/intr.h            |  2 +-
 xen/arch/x86/include/asm/hvm/svm/nestedsvm.h       |  2 +-
 xen/arch/x86/include/asm/hvm/svm/svm.h             |  2 +-
 xen/arch/x86/include/asm/hvm/svm/svmdebug.h        |  2 +-
 xen/arch/x86/include/asm/hvm/svm/vmcb.h            |  2 +-
 xen/arch/x86/include/asm/hvm/vcpu.h                |  2 +-
 xen/arch/x86/include/asm/hvm/vioapic.h             |  2 +-
 xen/arch/x86/include/asm/hvm/vlapic.h              |  2 +-
 xen/arch/x86/include/asm/hvm/vm_event.h            |  2 +-
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h            |  2 +-
 xen/arch/x86/include/asm/hvm/vmx/vmx.h             |  2 +-
 xen/arch/x86/include/asm/hvm/vmx/vvmx.h            |  2 +-
 xen/arch/x86/include/asm/hvm/vpt.h                 |  2 +-
 xen/arch/x86/include/asm/iommu.h                   |  2 +-
 xen/arch/x86/include/asm/ioreq.h                   |  2 +-
 xen/arch/x86/include/asm/mem_access.h              |  2 +-
 xen/arch/x86/include/asm/mem_paging.h              |  2 +-
 xen/arch/x86/include/asm/mem_sharing.h             |  2 +-
 xen/arch/x86/include/asm/monitor.h                 |  2 +-
 xen/arch/x86/include/asm/p2m.h                     |  2 +-
 xen/arch/x86/include/asm/paging.h                  |  2 +-
 xen/arch/x86/include/asm/pv/domain.h               |  2 +-
 xen/arch/x86/include/asm/pv/grant_table.h          |  2 +-
 xen/arch/x86/include/asm/pv/mm.h                   |  2 +-
 xen/arch/x86/include/asm/pv/shim.h                 |  2 +-
 xen/arch/x86/include/asm/pv/traps.h                |  2 +-
 xen/arch/x86/include/asm/shadow.h                  |  2 +-
 xen/arch/x86/include/asm/shstk.h                   |  2 +-
 xen/arch/x86/include/asm/spec_ctrl.h               |  2 +-
 xen/arch/x86/include/asm/spec_ctrl_asm.h           |  2 +-
 xen/arch/x86/include/asm/traps.h                   |  2 +-
 xen/arch/x86/include/asm/vm_event.h                |  2 +-
 xen/arch/x86/include/asm/vpmu.h                    |  2 +-
 xen/arch/x86/include/asm/xenoprof.h                |  2 +-
 xen/arch/x86/mm.c                                  |  2 +-
 xen/arch/x86/mm/altp2m.c                           |  2 +-
 xen/arch/x86/mm/guest_walk.c                       |  2 +-
 xen/arch/x86/mm/hap/guest_walk.c                   |  2 +-
 xen/arch/x86/mm/hap/hap.c                          |  2 +-
 xen/arch/x86/mm/hap/nested_ept.c                   |  2 +-
 xen/arch/x86/mm/hap/nested_hap.c                   |  2 +-
 xen/arch/x86/mm/hap/private.h                      |  2 +-
 xen/arch/x86/mm/mem_access.c                       |  2 +-
 xen/arch/x86/mm/mem_paging.c                       |  2 +-
 xen/arch/x86/mm/mem_sharing.c                      |  2 +-
 xen/arch/x86/mm/mm-locks.h                         |  2 +-
 xen/arch/x86/mm/nested.c                           |  2 +-
 xen/arch/x86/mm/p2m-basic.c                        |  2 +-
 xen/arch/x86/mm/p2m-ept.c                          |  2 +-
 xen/arch/x86/mm/p2m-pod.c                          |  2 +-
 xen/arch/x86/mm/p2m-pt.c                           |  2 +-
 xen/arch/x86/mm/p2m.c                              |  2 +-
 xen/arch/x86/mm/p2m.h                              |  2 +-
 xen/arch/x86/mm/paging.c                           |  2 +-
 xen/arch/x86/mm/physmap.c                          |  2 +-
 xen/arch/x86/mm/shadow/common.c                    |  2 +-
 xen/arch/x86/mm/shadow/hvm.c                       |  2 +-
 xen/arch/x86/mm/shadow/multi.c                     |  2 +-
 xen/arch/x86/mm/shadow/multi.h                     |  2 +-
 xen/arch/x86/mm/shadow/private.h                   |  2 +-
 xen/arch/x86/mm/shadow/pv.c                        |  2 +-
 xen/arch/x86/mm/shadow/set.c                       |  2 +-
 xen/arch/x86/mm/shadow/types.h                     |  2 +-
 xen/arch/x86/monitor.c                             |  2 +-
 xen/arch/x86/msr.c                                 |  2 +-
 xen/arch/x86/pv/callback.c                         |  2 +-
 xen/arch/x86/pv/descriptor-tables.c                |  2 +-
 xen/arch/x86/pv/emul-gate-op.c                     |  2 +-
 xen/arch/x86/pv/emul-inv-op.c                      |  2 +-
 xen/arch/x86/pv/emul-priv-op.c                     |  2 +-
 xen/arch/x86/pv/emulate.c                          |  2 +-
 xen/arch/x86/pv/grant_table.c                      |  2 +-
 xen/arch/x86/pv/hypercall.c                        |  2 +-
 xen/arch/x86/pv/iret.c                             |  2 +-
 xen/arch/x86/pv/misc-hypercalls.c                  |  2 +-
 xen/arch/x86/pv/mm.c                               |  2 +-
 xen/arch/x86/pv/ro-page-fault.c                    |  2 +-
 xen/arch/x86/pv/shim.c                             |  2 +-
 xen/arch/x86/pv/traps.c                            |  2 +-
 xen/arch/x86/smpboot.c                             |  2 +-
 xen/arch/x86/spec_ctrl.c                           |  2 +-
 xen/arch/x86/traps.c                               |  2 +-
 xen/arch/x86/vm_event.c                            |  2 +-
 xen/arch/x86/x86_64/acpi_mmcfg.c                   |  2 +-
 xen/arch/x86/x86_64/cpu_idle.c                     |  2 +-
 xen/arch/x86/x86_64/cpufreq.c                      |  2 +-
 xen/arch/x86/x86_64/gdbstub.c                      |  2 +-
 xen/arch/x86/x86_64/mm.c                           |  2 +-
 xen/arch/x86/x86_64/mmconfig.h                     |  2 +-
 xen/arch/x86/x86_emulate/x86_emulate.c             |  2 +-
 xen/arch/x86/x86_emulate/x86_emulate.h             |  2 +-
 xen/common/argo.c                                  |  2 +-
 xen/common/bunzip2.c                               |  2 +-
 xen/common/coverage/coverage.c                     |  2 +-
 xen/common/dm.c                                    |  2 +-
 xen/common/event_channel.c                         |  2 +-
 xen/common/gdbstub.c                               |  2 +-
 xen/common/grant_table.c                           |  2 +-
 xen/common/ioreq.c                                 |  2 +-
 xen/common/libelf/libelf-dominfo.c                 |  2 +-
 xen/common/libelf/libelf-loader.c                  |  2 +-
 xen/common/libelf/libelf-private.h                 |  2 +-
 xen/common/libelf/libelf-tools.c                   |  2 +-
 xen/common/mem_access.c                            |  2 +-
 xen/common/monitor.c                               |  2 +-
 xen/common/page_alloc.c                            |  2 +-
 xen/common/pdx.c                                   |  2 +-
 xen/common/preempt.c                               |  2 +-
 xen/common/radix-tree.c                            |  2 +-
 xen/common/rcupdate.c                              |  2 +-
 xen/common/sched/null.c                            |  2 +-
 xen/common/stop_machine.c                          |  2 +-
 xen/common/time.c                                  |  2 +-
 xen/common/unlzma.c                                |  2 +-
 xen/common/unlzo.c                                 |  2 +-
 xen/common/vm_event.c                              |  2 +-
 xen/common/wait.c                                  |  2 +-
 xen/drivers/acpi/apei/apei-base.c                  |  2 +-
 xen/drivers/acpi/apei/apei-io.c                    |  2 +-
 xen/drivers/acpi/apei/erst.c                       |  2 +-
 xen/drivers/acpi/apei/hest.c                       |  2 +-
 xen/drivers/acpi/numa.c                            |  2 +-
 xen/drivers/acpi/osl.c                             |  2 +-
 xen/drivers/acpi/pmstat.c                          |  2 +-
 xen/drivers/acpi/tables.c                          |  2 +-
 xen/drivers/char/consoled.c                        |  2 +-
 xen/drivers/char/meson-uart.c                      |  2 +-
 xen/drivers/char/mvebu-uart.c                      |  2 +-
 xen/drivers/char/xen_pv_console.c                  |  2 +-
 xen/drivers/char/xhci-dbc.c                        |  2 +-
 xen/drivers/cpufreq/cpufreq.c                      |  2 +-
 xen/drivers/passthrough/amd/iommu-defs.h           |  2 +-
 xen/drivers/passthrough/amd/iommu.h                |  2 +-
 xen/drivers/passthrough/amd/iommu_acpi.c           |  2 +-
 xen/drivers/passthrough/amd/iommu_cmd.c            |  2 +-
 xen/drivers/passthrough/amd/iommu_detect.c         |  2 +-
 xen/drivers/passthrough/amd/iommu_guest.c          |  2 +-
 xen/drivers/passthrough/amd/iommu_init.c           |  2 +-
 xen/drivers/passthrough/amd/iommu_intr.c           |  2 +-
 xen/drivers/passthrough/amd/iommu_map.c            |  2 +-
 xen/drivers/passthrough/amd/pci_amd_iommu.c        |  2 +-
 xen/drivers/passthrough/arm/iommu_fwspec.c         |  2 +-
 xen/drivers/passthrough/arm/iommu_helpers.c        |  2 +-
 xen/drivers/passthrough/arm/ipmmu-vmsa.c           |  2 +-
 xen/drivers/passthrough/arm/smmu-v3.c              |  2 +-
 xen/drivers/passthrough/arm/smmu.c                 |  2 +-
 xen/drivers/passthrough/ats.c                      |  2 +-
 xen/drivers/passthrough/ats.h                      |  2 +-
 xen/drivers/passthrough/iommu.c                    |  2 +-
 xen/drivers/passthrough/pci.c                      |  6 +++---
 xen/drivers/passthrough/vtd/dmar.c                 |  2 +-
 xen/drivers/passthrough/vtd/dmar.h                 |  2 +-
 xen/drivers/passthrough/vtd/extern.h               |  2 +-
 xen/drivers/passthrough/vtd/intremap.c             |  2 +-
 xen/drivers/passthrough/vtd/iommu.c                |  2 +-
 xen/drivers/passthrough/vtd/iommu.h                |  2 +-
 xen/drivers/passthrough/vtd/qinval.c               |  2 +-
 xen/drivers/passthrough/vtd/quirks.c               |  2 +-
 xen/drivers/passthrough/vtd/utils.c                |  2 +-
 xen/drivers/passthrough/vtd/vtd.h                  |  2 +-
 xen/drivers/passthrough/vtd/x86/ats.c              |  2 +-
 xen/drivers/passthrough/vtd/x86/hvm.c              |  2 +-
 xen/drivers/passthrough/vtd/x86/vtd.c              |  2 +-
 xen/drivers/passthrough/x86/hvm.c                  |  2 +-
 xen/drivers/passthrough/x86/iommu.c                |  2 +-
 xen/drivers/vpci/header.c                          |  2 +-
 xen/drivers/vpci/msi.c                             |  2 +-
 xen/drivers/vpci/msix.c                            |  2 +-
 xen/drivers/vpci/vpci.c                            |  2 +-
 xen/include/xen/acpi.h                             |  2 +-
 xen/include/xen/argo.h                             |  2 +-
 xen/include/xen/atomic.h                           |  2 +-
 xen/include/xen/compiler.h                         |  2 +-
 xen/include/xen/cper.h                             |  2 +-
 xen/include/xen/cpuidle.h                          |  2 +-
 xen/include/xen/dm.h                               |  2 +-
 xen/include/xen/elfstructs.h                       |  2 +-
 xen/include/xen/gdbstub.h                          |  2 +-
 xen/include/xen/grant_table.h                      |  2 +-
 xen/include/xen/inttypes.h                         |  2 +-
 xen/include/xen/iommu.h                            |  2 +-
 xen/include/xen/ioreq.h                            |  2 +-
 xen/include/xen/mem_access.h                       |  2 +-
 xen/include/xen/monitor.h                          |  2 +-
 xen/include/xen/multiboot.h                        |  2 +-
 xen/include/xen/radix-tree.h                       |  2 +-
 xen/include/xen/rbtree.h                           |  2 +-
 xen/include/xen/rcupdate.h                         |  2 +-
 xen/include/xen/vm_event.h                         |  2 +-
 xen/lib/list-sort.c                                |  2 +-
 xen/lib/rbtree.c                                   |  2 +-
 xen/xsm/silo.c                                     |  2 +-
 609 files changed, 622 insertions(+), 622 deletions(-)

diff --git a/m4/pkg.m4 b/m4/pkg.m4
index bb59b15417268411e83f9ae6ba8fbe01faf2e38f..398cafe97b20c7a0ee74586b2ca247bc58e08570 100644
--- a/m4/pkg.m4
+++ b/m4/pkg.m4
@@ -14,7 +14,7 @@
 # General Public License for more details.
 #
 # You should have received a copy of the GNU General Public License
-# along with this program; If not, see <http://www.gnu.org/licenses/>.
+# along with this program; If not, see <https://www.gnu.org/licenses/>.
 #
 # As a special exception to the GNU General Public License, if you
 # distribute this file as part of a program that contains a
diff --git a/m4/systemd.m4 b/m4/systemd.m4
index 112dc11b5e05e11d730e33a133c08527cfb4990f..a0a1b856aaa59fc4b97a9a90c88029953b878a2b 100644
--- a/m4/systemd.m4
+++ b/m4/systemd.m4
@@ -13,7 +13,7 @@
 # General Public License for more details.
 #
 # You should have received a copy of the GNU General Public License
-# along with this program; If not, see <http://www.gnu.org/licenses/>.
+# along with this program; If not, see <https://www.gnu.org/licenses/>.
 
 dnl Some optional path options
 AC_DEFUN([AX_SYSTEMD_OPTIONS], [
diff --git a/stubdom/grub.patches/10graphics.diff b/stubdom/grub.patches/10graphics.diff
index e80aab75bd31ac677ab2884718673094d97b3df2..5c1067ba9c31ada35086d8f2f4da989bfdfc7046 100644
--- a/stubdom/grub.patches/10graphics.diff
+++ b/stubdom/grub.patches/10graphics.diff
@@ -1769,7 +1769,7 @@ diff -Naur grub-0.97.orig/stage2/graphics.h grub-0.97/stage2/graphics.h
 + *  GNU General Public License for more details.
 + *
 + *  You should have received a copy of the GNU General Public License
-+ *  along with this program; If not, see <http://www.gnu.org/licenses/>
++ *  along with this program; If not, see <https://www.gnu.org/licenses/>
 + */
 +
 +#ifndef GRAPHICS_H
diff --git a/stubdom/grub.patches/61btrfs.diff b/stubdom/grub.patches/61btrfs.diff
index ae8f866e509ef23ac3cb607651e56de193ef6c55..a96062e685e4f6a1922132e9ba6ee30abfd3c8aa 100644
--- a/stubdom/grub.patches/61btrfs.diff
+++ b/stubdom/grub.patches/61btrfs.diff
@@ -70,7 +70,7 @@ diff -up /dev/null grub-upstream.wip/stage2/btrfs.h
 + * General Public License for more details.
 + *
 + * You should have received a copy of the GNU General Public
-+ * License along with this program; If not, see <http://www.gnu.org/licenses/>
++ * License along with this program; If not, see <https://www.gnu.org/licenses/>
 + */
 +
 +/* include/asm-i386/types.h */
@@ -1561,7 +1561,7 @@ diff -up /dev/null grub-upstream.wip/stage2/fsys_btrfs.c
 + * GNU General Public License for more details.
 + *
 + * You should have received a copy of the GNU General Public License
-+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
++ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 + */
 +
 +#ifdef FSYS_BTRFS
diff --git a/stubdom/vtpmmgr/tpmrsa.c b/stubdom/vtpmmgr/tpmrsa.c
index 7731640f6899dfde21106b0a34575b70ca25699d..5a9f6b29e5831a9fbd7f920c1c5edbc0d9ad60d5 100644
--- a/stubdom/vtpmmgr/tpmrsa.c
+++ b/stubdom/vtpmmgr/tpmrsa.c
@@ -19,7 +19,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License along
- *  with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  *  RSA was designed by Ron Rivest, Adi Shamir and Len Adleman.
diff --git a/stubdom/vtpmmgr/tpmrsa.h b/stubdom/vtpmmgr/tpmrsa.h
index efeb5f2a21e4ac43b3cda417c0c8cea62052087c..45e1f72e4b816bb9c4c3c6b4055c522192c69ec8 100644
--- a/stubdom/vtpmmgr/tpmrsa.h
+++ b/stubdom/vtpmmgr/tpmrsa.h
@@ -21,7 +21,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License along
- *  with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 #ifndef TPMRSA_H
 #define TPMRSA_H
diff --git a/tools/configure b/tools/configure
index f6f13bfdc0901b0cea125c5ac13208c92e7b7a0f..50d1abfe2b5579651fb1ef43db87ec8ceb109547 100755
--- a/tools/configure
+++ b/tools/configure
@@ -3647,7 +3647,7 @@ esac
 # General Public License for more details.
 #
 # You should have received a copy of the GNU General Public License
-# along with this program; If not, see <http://www.gnu.org/licenses/>.
+# along with this program; If not, see <https://www.gnu.org/licenses/>.
 #
 # As a special exception to the GNU General Public License, if you
 # distribute this file as part of a program that contains a
@@ -3868,7 +3868,7 @@ esac
 # General Public License for more details.
 #
 # You should have received a copy of the GNU General Public License
-# along with this program; If not, see <http://www.gnu.org/licenses/>.
+# along with this program; If not, see <https://www.gnu.org/licenses/>.
 
 
 
diff --git a/tools/console/client/main.c b/tools/console/client/main.c
index 1a6fa162f750692e4affa33abecae1fd22031d4f..f694af558544d294a82c60c50739341d94038ae7 100644
--- a/tools/console/client/main.c
+++ b/tools/console/client/main.c
@@ -14,7 +14,7 @@
  *  GNU General Public License for more details.
  * 
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
 \*/
 
 #include <sys/file.h>
diff --git a/tools/console/daemon/io.c b/tools/console/daemon/io.c
index 682c1f4008e0c984987e2e712c84175c923888b9..54b28dd29c69f6887171fd1e70b2dcbde41bb252 100644
--- a/tools/console/daemon/io.c
+++ b/tools/console/daemon/io.c
@@ -14,7 +14,7 @@
  *  GNU General Public License for more details.
  * 
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #define _GNU_SOURCE
diff --git a/tools/console/daemon/io.h b/tools/console/daemon/io.h
index d016addac896c6d6930495af2e9e4f19bc09abf5..8486cfaaed19604e21e1b36ed4e8a2cb55a316ff 100644
--- a/tools/console/daemon/io.h
+++ b/tools/console/daemon/io.h
@@ -14,7 +14,7 @@
  *  GNU General Public License for more details.
  * 
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
 \*/
 
 #ifndef CONSOLED_IO_H
diff --git a/tools/console/daemon/main.c b/tools/console/daemon/main.c
index aac7233a48c93e8542f8f8637445be592080fb3f..75643b8023fe6552ead2b5be15bc3c6c3ad12322 100644
--- a/tools/console/daemon/main.c
+++ b/tools/console/daemon/main.c
@@ -14,7 +14,7 @@
  *  GNU General Public License for more details.
  * 
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
 \*/
 
 #include <getopt.h>
diff --git a/tools/console/daemon/utils.c b/tools/console/daemon/utils.c
index f9dd8a60c5c497c3dc2c9c5779b38bca547dd5a9..d609fb05198d98f55312a25f11ffd84b55c3b33e 100644
--- a/tools/console/daemon/utils.c
+++ b/tools/console/daemon/utils.c
@@ -14,7 +14,7 @@
  *  GNU General Public License for more details.
  * 
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
 \*/
 
 #include <sys/types.h>
diff --git a/tools/console/daemon/utils.h b/tools/console/daemon/utils.h
index a010ac44e0fa2c99be586fccdac66261c9a67992..e828fb7eef71753c4cefab220653bd463e155444 100644
--- a/tools/console/daemon/utils.h
+++ b/tools/console/daemon/utils.h
@@ -14,7 +14,7 @@
  *  GNU General Public License for more details.
  * 
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
 \*/
 
 #ifndef CONSOLED_UTILS_H
diff --git a/tools/debugger/gdbsx/README b/tools/debugger/gdbsx/README
index c875c0172a84e9d649ed1502259704e422f8759c..d6b557bc0357e2fe6c9625906c6248bb3c8091ef 100644
--- a/tools/debugger/gdbsx/README
+++ b/tools/debugger/gdbsx/README
@@ -67,7 +67,7 @@ mukesh[dot]rathor[at]oracle[dot]com
 
 USEFUL gdb macros:
 
-# Courtesy Zhigang W (http://10.182.120.78/tech/vt/ovm/debug/gdbinit.macros):
+# Courtesy Zhigang W (https://10.182.120.78/tech/vt/ovm/debug/gdbinit.macros):
 
 define ps
 	dont-repeat
diff --git a/tools/debugger/gdbsx/gx/gx.h b/tools/debugger/gdbsx/gx/gx.h
index af3957587aab02396b393dff6428eb2204c46b1f..d3f7ef913a3b422428e210c61a10bf84c373fee4 100644
--- a/tools/debugger/gdbsx/gx/gx.h
+++ b/tools/debugger/gdbsx/gx/gx.h
@@ -11,7 +11,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 typedef uint16_t domid_t;
diff --git a/tools/debugger/gdbsx/gx/gx_comm.c b/tools/debugger/gdbsx/gx/gx_comm.c
index 5a0c61df4bd4d984aff33f5cda661ed075911b22..2a4967a78273580fecb7e114fb268744e088a770 100644
--- a/tools/debugger/gdbsx/gx/gx_comm.c
+++ b/tools/debugger/gdbsx/gx/gx_comm.c
@@ -15,7 +15,7 @@
    GNU General Public License for more details.
 
    You should have received a copy of the GNU General Public License
-   along with this program; If not, see <http://www.gnu.org/licenses/>.  */
+   along with this program; If not, see <https://www.gnu.org/licenses/>.  */
 /*
  * Copyright (C) 2009, Mukesh Rathor, Oracle Corp.  All rights reserved.
  *
@@ -29,7 +29,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 /* This module handles communication with remote gdb.  courtesy 
diff --git a/tools/debugger/gdbsx/gx/gx_local.c b/tools/debugger/gdbsx/gx/gx_local.c
index 023f5a391f43aa253411fde90e1559c23b869ac2..6af2d442fbae0382a5ec515607c95e4d46f81b74 100644
--- a/tools/debugger/gdbsx/gx/gx_local.c
+++ b/tools/debugger/gdbsx/gx/gx_local.c
@@ -11,7 +11,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 
diff --git a/tools/debugger/gdbsx/gx/gx_main.c b/tools/debugger/gdbsx/gx/gx_main.c
index 15de2c350135e76e965efe9b54c5224087c4266d..d9e556affa468f72fbe4eaebc4815db7881550a5 100644
--- a/tools/debugger/gdbsx/gx/gx_main.c
+++ b/tools/debugger/gdbsx/gx/gx_main.c
@@ -11,7 +11,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 /* This module is the main module for gdbsx implementation. gdbsx is a remote
diff --git a/tools/debugger/gdbsx/gx/gx_utils.c b/tools/debugger/gdbsx/gx/gx_utils.c
index f3c003960c4e407834468f2760bb4279a5121a92..428e2c24ad15af9468055df3fab6ad5c65d6df5c 100644
--- a/tools/debugger/gdbsx/gx/gx_utils.c
+++ b/tools/debugger/gdbsx/gx/gx_utils.c
@@ -11,7 +11,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <stdio.h>
diff --git a/tools/debugger/gdbsx/gx/xg_dummy.c b/tools/debugger/gdbsx/gx/xg_dummy.c
index e995fad7d5d30ddf24034db70ec9ff603d50e2ae..b75bdfb724e5c4c6f9b8766f7cdc70a1912a6359 100644
--- a/tools/debugger/gdbsx/gx/xg_dummy.c
+++ b/tools/debugger/gdbsx/gx/xg_dummy.c
@@ -11,7 +11,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 #include <stdio.h>
 #include <stddef.h>
diff --git a/tools/debugger/gdbsx/xg/xg_main.c b/tools/debugger/gdbsx/xg/xg_main.c
index 4576c762af0c29521e75db5ba3355d89250a0047..2dfaec7df065002d128c24c2df1c81b3aa5212fc 100644
--- a/tools/debugger/gdbsx/xg/xg_main.c
+++ b/tools/debugger/gdbsx/xg/xg_main.c
@@ -11,7 +11,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 /* This is the main module to interface with xen. This module exports APIs that
diff --git a/tools/debugger/gdbsx/xg/xg_public.h b/tools/debugger/gdbsx/xg/xg_public.h
index 31513c817796897d22af915fbdb9a7d7d1587421..95fc6e11c2900c4182df658b068b250d043c8da6 100644
--- a/tools/debugger/gdbsx/xg/xg_public.h
+++ b/tools/debugger/gdbsx/xg/xg_public.h
@@ -11,7 +11,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #define XGERR(...)   \
diff --git a/tools/firmware/hvmloader/32bitbios_support.c b/tools/firmware/hvmloader/32bitbios_support.c
index cee3804888c447df7e952960312ad07023a07acc..7b76fb4fdb4ed685dfaf2b614d497c227f433d62 100644
--- a/tools/firmware/hvmloader/32bitbios_support.c
+++ b/tools/firmware/hvmloader/32bitbios_support.c
@@ -17,7 +17,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <stdint.h>
diff --git a/tools/firmware/hvmloader/Makefile b/tools/firmware/hvmloader/Makefile
index 4f31c881613ca5a5b44aa6afbe860daa1b3ee7a0..3d745c30d2c2074578afb4d99d91fd2e2f19dcdc 100644
--- a/tools/firmware/hvmloader/Makefile
+++ b/tools/firmware/hvmloader/Makefile
@@ -14,7 +14,7 @@
 # more details.
 #
 # You should have received a copy of the GNU General Public License along with
-# this program; If not, see <http://www.gnu.org/licenses/>.
+# this program; If not, see <https://www.gnu.org/licenses/>.
 #
 
 XEN_ROOT = $(CURDIR)/../../..
diff --git a/tools/firmware/hvmloader/cacheattr.c b/tools/firmware/hvmloader/cacheattr.c
index b7215fba2e0200228e063e2f7e16e79b6f916a52..3abf460eacd4859174156a1a9d40c3e5d168150a 100644
--- a/tools/firmware/hvmloader/cacheattr.c
+++ b/tools/firmware/hvmloader/cacheattr.c
@@ -16,7 +16,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "util.h"
diff --git a/tools/firmware/hvmloader/e820.c b/tools/firmware/hvmloader/e820.c
index c490a0bc790c1e70912411f9b1cdf09e661dada2..427cde142b7f0ac74513392d5e966166ac6b0927 100644
--- a/tools/firmware/hvmloader/e820.c
+++ b/tools/firmware/hvmloader/e820.c
@@ -16,7 +16,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "config.h"
diff --git a/tools/firmware/hvmloader/hvmloader.c b/tools/firmware/hvmloader/hvmloader.c
index c58841e5b55624c6f50b2a2756b81e914295c3ea..417dec5cad20bcd2c6bfe83a50f68757f18b3070 100644
--- a/tools/firmware/hvmloader/hvmloader.c
+++ b/tools/firmware/hvmloader/hvmloader.c
@@ -16,7 +16,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "util.h"
diff --git a/tools/firmware/hvmloader/mp_tables.c b/tools/firmware/hvmloader/mp_tables.c
index d207ecbf00c9297c491fea8952a4a2f7215ccb9b..6acdd1be488557b0354d495833d18e95b9aa8a1f 100644
--- a/tools/firmware/hvmloader/mp_tables.c
+++ b/tools/firmware/hvmloader/mp_tables.c
@@ -24,7 +24,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <stdint.h>
diff --git a/tools/firmware/hvmloader/optionroms.c b/tools/firmware/hvmloader/optionroms.c
index 97080583cca7aba7269cc7e68feec4e5beab8990..2d57890724ac7394d3535d10199d0f60d6a2487e 100644
--- a/tools/firmware/hvmloader/optionroms.c
+++ b/tools/firmware/hvmloader/optionroms.c
@@ -16,7 +16,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "config.h"
diff --git a/tools/firmware/hvmloader/ovmf.c b/tools/firmware/hvmloader/ovmf.c
index 23610a071797f143bb712e03df5e492d0e91a7a6..def5b9e41ea43c3de834117aaf361175ac476366 100644
--- a/tools/firmware/hvmloader/ovmf.c
+++ b/tools/firmware/hvmloader/ovmf.c
@@ -18,7 +18,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "config.h"
diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pci.c
index 257a6feb6148c4d0cd3fa608cf4cc902251ee000..944afeb3b8b0ddb7998d04517921371884a57557 100644
--- a/tools/firmware/hvmloader/pci.c
+++ b/tools/firmware/hvmloader/pci.c
@@ -16,7 +16,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "util.h"
diff --git a/tools/firmware/hvmloader/pir_types.h b/tools/firmware/hvmloader/pir_types.h
index 5129b0c7fd9a087810a299ee8930f755814a263b..01e1bfbcf4d088269fd5dde97dbc729d5a0c7f1b 100644
--- a/tools/firmware/hvmloader/pir_types.h
+++ b/tools/firmware/hvmloader/pir_types.h
@@ -12,7 +12,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (C) Citrix Systems, 2011
  *
diff --git a/tools/firmware/hvmloader/rombios.c b/tools/firmware/hvmloader/rombios.c
index 46f331e465966d241f2a0e970ef3ab46adf24b31..6f9f2a59b5713dc6d86376d8ff3a449a145c04aa 100644
--- a/tools/firmware/hvmloader/rombios.c
+++ b/tools/firmware/hvmloader/rombios.c
@@ -16,7 +16,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "config.h"
diff --git a/tools/firmware/hvmloader/seabios.c b/tools/firmware/hvmloader/seabios.c
index 444d118ddb01451aac393ee1cb6fb23dcb1ba72d..33062f6f331292658444649875211318270b7607 100644
--- a/tools/firmware/hvmloader/seabios.c
+++ b/tools/firmware/hvmloader/seabios.c
@@ -16,7 +16,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "config.h"
diff --git a/tools/firmware/hvmloader/smbios.c b/tools/firmware/hvmloader/smbios.c
index 97a054e9e3fe9918aee64c036662334679e74a71..5547edfd127b8ce4d80ca1700d02e738f3c70d66 100644
--- a/tools/firmware/hvmloader/smbios.c
+++ b/tools/firmware/hvmloader/smbios.c
@@ -12,7 +12,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (C) IBM Corporation, 2006
  *
diff --git a/tools/firmware/hvmloader/smbios_types.h b/tools/firmware/hvmloader/smbios_types.h
index 3f1c120da60b6aa95cb2b6b1f03cc31d912832a4..c75cfee7028779b709d407f2b1e44d2e4b574e64 100644
--- a/tools/firmware/hvmloader/smbios_types.h
+++ b/tools/firmware/hvmloader/smbios_types.h
@@ -12,7 +12,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (C) IBM Corporation, 2006
  *
diff --git a/tools/firmware/hvmloader/smp.c b/tools/firmware/hvmloader/smp.c
index 082b17f138186c48e936f621d154955bf1dfe652..0f464517ab62ce80333a39c04e802501cc237d4c 100644
--- a/tools/firmware/hvmloader/smp.c
+++ b/tools/firmware/hvmloader/smp.c
@@ -16,7 +16,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "util.h"
diff --git a/tools/firmware/hvmloader/tests.c b/tools/firmware/hvmloader/tests.c
index a70c72dffbbb3922faae6cc2832fc8195018c0da..948cd360d71591d96571481599d7f0b0d7d7d78e 100644
--- a/tools/firmware/hvmloader/tests.c
+++ b/tools/firmware/hvmloader/tests.c
@@ -16,7 +16,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "config.h"
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index 581b35e5cfb5ad1be1aa09e8536cfc3bd70c82ee..611a0603c7e3ed6278e0479eb0a9e0db90ec56f7 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -14,7 +14,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "util.h"
diff --git a/tools/firmware/rombios/32bit/32bitbios.c b/tools/firmware/rombios/32bit/32bitbios.c
index 87acf209c3fdb6185910cd5e29e4b1538c59548f..39b141a23b3ad241b38b11fde33d14c89a766674 100644
--- a/tools/firmware/rombios/32bit/32bitbios.c
+++ b/tools/firmware/rombios/32bit/32bitbios.c
@@ -12,7 +12,7 @@
  *  Lesser General Public License for more details.
  *
  *  You should have received a copy of the GNU Lesser General Public
- *  License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ *  License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (C) IBM Corporation, 2006
  *
diff --git a/tools/firmware/rombios/32bit/mkhex b/tools/firmware/rombios/32bit/mkhex
index 7200d007e460021d1b25b6d3b29a34c08b82eb69..cfdd011c37d3e808a5a17b1d662b775acc22f7d4 100644
--- a/tools/firmware/rombios/32bit/mkhex
+++ b/tools/firmware/rombios/32bit/mkhex
@@ -16,7 +16,7 @@
 # more details.
 #
 # You should have received a copy of the GNU General Public License along with
-# this program; If not, see <http://www.gnu.org/licenses/>.
+# this program; If not, see <https://www.gnu.org/licenses/>.
 #
 
 echo "unsigned $1[] = {"
diff --git a/tools/firmware/rombios/32bit/pmm.c b/tools/firmware/rombios/32bit/pmm.c
index e0e39fef68a7b8d1695738e5e6f3c045c6dceaa4..49e603fd0297760b6efae70444ea975bc832a66a 100644
--- a/tools/firmware/rombios/32bit/pmm.c
+++ b/tools/firmware/rombios/32bit/pmm.c
@@ -14,7 +14,7 @@
  *  Lesser General Public License for more details.
  *
  *  You should have received a copy of the GNU Lesser General Public
- *  License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ *  License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  *  Copyright (C) 2009 FUJITSU LIMITED
  *
diff --git a/tools/firmware/rombios/32bit/tcgbios/tcgbios.c b/tools/firmware/rombios/32bit/tcgbios/tcgbios.c
index fa22c4460aac6f45aa67ceb991033c93b25a84fa..8da795ed4b642eec2d1e02953023fdec1625551f 100644
--- a/tools/firmware/rombios/32bit/tcgbios/tcgbios.c
+++ b/tools/firmware/rombios/32bit/tcgbios/tcgbios.c
@@ -14,7 +14,7 @@
  *  Lesser General Public License for more details.
  *
  *  You should have received a copy of the GNU Lesser General Public
- *  License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ *  License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (C) IBM Corporation, 2006
  *
diff --git a/tools/firmware/rombios/32bit/tcgbios/tpm_drivers.c b/tools/firmware/rombios/32bit/tcgbios/tpm_drivers.c
index 59d16bbae6b422cd77d9faf719b4faad075d4ece..8897df75b21d364da9da58a498cc61d8e58295c8 100644
--- a/tools/firmware/rombios/32bit/tcgbios/tpm_drivers.c
+++ b/tools/firmware/rombios/32bit/tcgbios/tpm_drivers.c
@@ -14,7 +14,7 @@
  *  Lesser General Public License for more details.
  *
  *  You should have received a copy of the GNU Lesser General Public
- *  License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ *  License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (C) IBM Corporation, 2006
  *
diff --git a/tools/firmware/rombios/32bit/util.c b/tools/firmware/rombios/32bit/util.c
index 6c1c4805144bf520abe6545f70bb0720a709102b..e5f9acbadf19bf65d073a6aee0e32560d9d5b016 100644
--- a/tools/firmware/rombios/32bit/util.c
+++ b/tools/firmware/rombios/32bit/util.c
@@ -14,7 +14,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 #include <stdarg.h>
 #include <stdint.h>
diff --git a/tools/firmware/rombios/32bitgateway.c b/tools/firmware/rombios/32bitgateway.c
index 3d58a6b0a1cdd8b6b8a24bb7da1ea1d236597345..9f28ea3b5d27e7dc585039f0355dcc1a17469835 100644
--- a/tools/firmware/rombios/32bitgateway.c
+++ b/tools/firmware/rombios/32bitgateway.c
@@ -15,7 +15,7 @@
  *  Lesser General Public License for more details.
  *
  *  You should have received a copy of the GNU Lesser General Public
- *  License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ *  License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (C) IBM Corporation, 2006
  * Copyright (c) 2008, Citrix Systems, Inc.
diff --git a/tools/firmware/rombios/apmbios.S b/tools/firmware/rombios/apmbios.S
index 814be8fd57eba8998a177c3ebd757de557c92599..9dd6b3390eab5a679771de429f893362b20c4b75 100644
--- a/tools/firmware/rombios/apmbios.S
+++ b/tools/firmware/rombios/apmbios.S
@@ -15,7 +15,7 @@
 //  Lesser General Public License for more details.
 //
 //  You should have received a copy of the GNU Lesser General Public
-//  License along with this library; If not, see <http://www.gnu.org/licenses/>.
+//  License along with this library; If not, see <https://www.gnu.org/licenses/>.
 
 #if defined(APM_REAL)
 #define APMSYM(s) apmreal_ ## s
diff --git a/tools/firmware/rombios/rombios.c b/tools/firmware/rombios/rombios.c
index 1818d2fa4d32b3c89299076b3968827bea749402..a4c1566e75501855b5d4b9838c969c2e083877f4 100644
--- a/tools/firmware/rombios/rombios.c
+++ b/tools/firmware/rombios/rombios.c
@@ -21,7 +21,7 @@
 //  Lesser General Public License for more details.
 //
 //  You should have received a copy of the GNU Lesser General Public
-//  License along with this library; If not, see <http://www.gnu.org/licenses/>.
+//  License along with this library; If not, see <https://www.gnu.org/licenses/>.
 
 // ROM BIOS for use with Bochs/Plex86/QEMU emulation environment
 
diff --git a/tools/firmware/rombios/rombios.h b/tools/firmware/rombios/rombios.h
index 8726d37737b4f980311a2695156b34c42af16fa2..a3849de73d096d570dbd160eec0a484bf30ff57f 100644
--- a/tools/firmware/rombios/rombios.h
+++ b/tools/firmware/rombios/rombios.h
@@ -15,7 +15,7 @@
 //  Lesser General Public License for more details.
 //
 //  You should have received a copy of the GNU Lesser General Public
-//  License along with this library; If not, see <http://www.gnu.org/licenses/>.
+//  License along with this library; If not, see <https://www.gnu.org/licenses/>.
 
 /* define it to include QEMU specific code */
 //#define BX_QEMU
diff --git a/tools/firmware/rombios/tcgbios.c b/tools/firmware/rombios/tcgbios.c
index e725ef9d1bdc3b995044e2a27bbfbc399dbd8e5c..8f5ab34bce24199d6922d11a4d3a6f6484833773 100644
--- a/tools/firmware/rombios/tcgbios.c
+++ b/tools/firmware/rombios/tcgbios.c
@@ -13,7 +13,7 @@
  *  Lesser General Public License for more details.
  *
  *  You should have received a copy of the GNU Lesser General Public
- *  License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ *  License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (C) IBM Corporation, 2006
  *
diff --git a/tools/firmware/vgabios/COPYING b/tools/firmware/vgabios/COPYING
index 05956269987638868d4aea655e8fd4c9d5b6ecd5..8b44515327c654405640f624ea7de292302a431c 100644
--- a/tools/firmware/vgabios/COPYING
+++ b/tools/firmware/vgabios/COPYING
@@ -484,7 +484,7 @@ convey the exclusion of warranty; and each file should have at least the
     Lesser General Public License for more details.
 
     You should have received a copy of the GNU Lesser General Public
-    License along with this library; If not, see <http://www.gnu.org/licenses/>.
+    License along with this library; If not, see <https://www.gnu.org/licenses/>.
 
 Also add information on how to contact you by electronic and paper mail.
 
diff --git a/tools/firmware/vgabios/biossums.c b/tools/firmware/vgabios/biossums.c
index 85ecc04e1665c6c3902a95f4687859513cc6e358..144467ae327e403a547fa8174db0fd760ddf6b15 100644
--- a/tools/firmware/vgabios/biossums.c
+++ b/tools/firmware/vgabios/biossums.c
@@ -12,7 +12,7 @@
  *  Lesser General Public License for more details.
  *
  *  You should have received a copy of the GNU Lesser General Public
- *  License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ *  License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 #include <stdlib.h>
 #include <stdio.h>
diff --git a/tools/firmware/vgabios/clext.c b/tools/firmware/vgabios/clext.c
index d727cd59f270d6658c1bc0dee82eff40ceff0074..c6b1fcbad1505a27fb8e1c131c1c7994e24fa7be 100644
--- a/tools/firmware/vgabios/clext.c
+++ b/tools/firmware/vgabios/clext.c
@@ -14,7 +14,7 @@
 //  Lesser General Public License for more details.
 //
 //  You should have received a copy of the GNU Lesser General Public
-//  License along with this library; If not, see <http://www.gnu.org/licenses/>.
+//  License along with this library; If not, see <https://www.gnu.org/licenses/>.
 // 
 
 //#define CIRRUS_VESA3_PMINFO
diff --git a/tools/firmware/vgabios/vbe.c b/tools/firmware/vgabios/vbe.c
index 8e6408733ae68bdc582054ee58778c03f180b220..2bda60d1aefe1c4922b07efa975b3d0932dc0426 100644
--- a/tools/firmware/vgabios/vbe.c
+++ b/tools/firmware/vgabios/vbe.c
@@ -13,7 +13,7 @@
 //  Lesser General Public License for more details.
 //
 //  You should have received a copy of the GNU Lesser General Public
-//  License along with this library; If not, see <http://www.gnu.org/licenses/>.
+//  License along with this library; If not, see <https://www.gnu.org/licenses/>.
 // 
 // ============================================================================================
 //  
diff --git a/tools/firmware/vgabios/vgabios.c b/tools/firmware/vgabios/vgabios.c
index 3ad98ca254a4ce8e7359a8a2d1a259b098ab927b..d5d21c3fce1da5acb645822cb9546c95164fd40a 100644
--- a/tools/firmware/vgabios/vgabios.c
+++ b/tools/firmware/vgabios/vgabios.c
@@ -17,7 +17,7 @@
 //  Lesser General Public License for more details.
 //
 //  You should have received a copy of the GNU Lesser General Public
-//  License along with this library; If not, see <http://www.gnu.org/licenses/>.
+//  License along with this library; If not, see <https://www.gnu.org/licenses/>.
 // 
 // ============================================================================================
 //  
@@ -37,7 +37,7 @@
 //  This VGA Bios is based on information taken from :
 //   - Kevin Lawton's vga card emulation for bochs/plex86
 //   - Ralf Brown's interrupts list available at https://www.cs.cmu.edu/afs/cs/user/ralf/pub/WWW/files.html
-//   - Finn Thogersons' VGADOC4b available at http://home.worldonline.dk/~finth/
+//   - Finn Thogersons' VGADOC4b available at https://home.worldonline.dk/~finth/
 //   - Michael Abrash's Graphics Programming Black Book
 //   - Francois Gervais' book "programmation des cartes graphiques cga-ega-vga" edited by sybex
 //   - DOSEMU 1.0.1 source code for several tables values and formulas
diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xenlight.go
index a45c636952520823f3c13a314e476cdbf4e1629f..a456518e8339446e40edf971c0231a90ae0f5fe2 100644
--- a/tools/golang/xenlight/xenlight.go
+++ b/tools/golang/xenlight/xenlight.go
@@ -12,7 +12,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 // Package xenlight provides bindings to Xen's libxl C library.
diff --git a/tools/hotplug/Linux/block-common.sh b/tools/hotplug/Linux/block-common.sh
index f86a88c4ebce21036a3e029223099ef9501fad21..de57b642546f95251d8e3ebbebd63279aa025a91 100644
--- a/tools/hotplug/Linux/block-common.sh
+++ b/tools/hotplug/Linux/block-common.sh
@@ -11,7 +11,7 @@
 # Lesser General Public License for more details.
 #
 # You should have received a copy of the GNU Lesser General Public
-# License along with this library; If not, see <http://www.gnu.org/licenses/>.
+# License along with this library; If not, see <https://www.gnu.org/licenses/>.
 #
 
 
diff --git a/tools/hotplug/Linux/block-drbd-probe b/tools/hotplug/Linux/block-drbd-probe
index 7b2968b6d944ea7222b79b1acda8c5f0dab8ab23..fca46fb32c5fb94bf07fe3b8363e2bdea3f6ccf8 100755
--- a/tools/hotplug/Linux/block-drbd-probe
+++ b/tools/hotplug/Linux/block-drbd-probe
@@ -12,7 +12,7 @@
 # Lesser General Public License for more details.
 #
 # You should have received a copy of the GNU Lesser General Public
-# License along with this library; If not, see <http://www.gnu.org/licenses/>.
+# License along with this library; If not, see <https://www.gnu.org/licenses/>.
 #
 # Usage:
 #     block-drbd-probe devicename
diff --git a/tools/hotplug/Linux/external-device-migrate b/tools/hotplug/Linux/external-device-migrate
index f5942a6a954fc1ac9f21974f0e2a70a4d8dd3dbd..68eaac145bec13de5ce038e882d62ce14fa79fbb 100644
--- a/tools/hotplug/Linux/external-device-migrate
+++ b/tools/hotplug/Linux/external-device-migrate
@@ -12,7 +12,7 @@
 # Lesser General Public License for more details.
 #
 # You should have received a copy of the GNU Lesser General Public
-# License along with this library; If not, see <http://www.gnu.org/licenses/>.
+# License along with this library; If not, see <https://www.gnu.org/licenses/>.
 #
 
 set -x
diff --git a/tools/hotplug/Linux/launch-xenstore.in b/tools/hotplug/Linux/launch-xenstore.in
index e854ca1eb8957f616122a6d96b88bb891142318d..5028d1d09f4da30d458f354687488da002c94905 100644
--- a/tools/hotplug/Linux/launch-xenstore.in
+++ b/tools/hotplug/Linux/launch-xenstore.in
@@ -12,7 +12,7 @@
 # Lesser General Public License for more details.
 #
 # You should have received a copy of the GNU Lesser General Public
-# License along with this library; If not, see <http://www.gnu.org/licenses/>.
+# License along with this library; If not, see <https://www.gnu.org/licenses/>.
 #
 
 XENSTORED=@XENSTORED@
diff --git a/tools/hotplug/Linux/locking.sh b/tools/hotplug/Linux/locking.sh
index 2e6fb35f02785c7a2c5a164df417f47659f829bd..13fb7134c6b6a20f7de2be4394406377abdb8167 100644
--- a/tools/hotplug/Linux/locking.sh
+++ b/tools/hotplug/Linux/locking.sh
@@ -12,7 +12,7 @@
 # Lesser General Public License for more details.
 #
 # You should have received a copy of the GNU Lesser General Public
-# License along with this library; If not, see <http://www.gnu.org/licenses/>.
+# License along with this library; If not, see <https://www.gnu.org/licenses/>.
 #
 
 #
diff --git a/tools/hotplug/Linux/logging.sh b/tools/hotplug/Linux/logging.sh
index 3e94df1a9e900d1b2b368568e2400063882f74eb..b7ed7b292dd54f4ff085eb2fe9cdf346c9ec1c33 100644
--- a/tools/hotplug/Linux/logging.sh
+++ b/tools/hotplug/Linux/logging.sh
@@ -11,7 +11,7 @@
 # Lesser General Public License for more details.
 #
 # You should have received a copy of the GNU Lesser General Public
-# License along with this library; If not, see <http://www.gnu.org/licenses/>.
+# License along with this library; If not, see <https://www.gnu.org/licenses/>.
 #
 
 log() {
diff --git a/tools/hotplug/Linux/vif-common.sh b/tools/hotplug/Linux/vif-common.sh
index a8e65178f9074390eb6a1bdf5b1f741fffac66ad..43ea7bbf775fb4688ef9849ca5805facaaa7cd47 100644
--- a/tools/hotplug/Linux/vif-common.sh
+++ b/tools/hotplug/Linux/vif-common.sh
@@ -11,7 +11,7 @@
 # Lesser General Public License for more details.
 #
 # You should have received a copy of the GNU Lesser General Public
-# License along with this library; If not, see <http://www.gnu.org/licenses/>.
+# License along with this library; If not, see <https://www.gnu.org/licenses/>.
 #
 
 
diff --git a/tools/hotplug/Linux/xen-hotplug-common.sh.in b/tools/hotplug/Linux/xen-hotplug-common.sh.in
index 8c2cb9e25a1a401cf4dc366e2cdcb45eb59cf95a..9e5207fee85f39248b8cd12ec52c8dddb2a7e922 100644
--- a/tools/hotplug/Linux/xen-hotplug-common.sh.in
+++ b/tools/hotplug/Linux/xen-hotplug-common.sh.in
@@ -11,7 +11,7 @@
 # Lesser General Public License for more details.
 #
 # You should have received a copy of the GNU Lesser General Public
-# License along with this library; If not, see <http://www.gnu.org/licenses/>.
+# License along with this library; If not, see <https://www.gnu.org/licenses/>.
 #
 
 dir=$(dirname "$0")
diff --git a/tools/hotplug/Linux/xen-network-common.sh b/tools/hotplug/Linux/xen-network-common.sh
index 42fa704e8d40f683ed3a7d3562b7c9685b7f804c..89542b2b9ac0bc8b0089bf05d9e3251c3c0ba6ef 100644
--- a/tools/hotplug/Linux/xen-network-common.sh
+++ b/tools/hotplug/Linux/xen-network-common.sh
@@ -11,7 +11,7 @@
 # Lesser General Public License for more details.
 #
 # You should have received a copy of the GNU Lesser General Public
-# License along with this library; If not, see <http://www.gnu.org/licenses/>.
+# License along with this library; If not, see <https://www.gnu.org/licenses/>.
 #
 
 
diff --git a/tools/hotplug/Linux/xen-script-common.sh b/tools/hotplug/Linux/xen-script-common.sh
index 370a50a3cd9849e9348be5934b12d21d3f7b05d0..a8d36414df691e6d729b3011aea598c5fa03d110 100644
--- a/tools/hotplug/Linux/xen-script-common.sh
+++ b/tools/hotplug/Linux/xen-script-common.sh
@@ -11,7 +11,7 @@
 # Lesser General Public License for more details.
 #
 # You should have received a copy of the GNU Lesser General Public
-# License along with this library; If not, see <http://www.gnu.org/licenses/>.
+# License along with this library; If not, see <https://www.gnu.org/licenses/>.
 #
 
 
diff --git a/tools/hotplug/NetBSD/locking.sh b/tools/hotplug/NetBSD/locking.sh
index 2098d0e3ab6ed60c9b52acf2d36f67dde8550e0b..4a63fb2e1c77dc98bdb8cafc40dca7cd8c1f4c50 100644
--- a/tools/hotplug/NetBSD/locking.sh
+++ b/tools/hotplug/NetBSD/locking.sh
@@ -12,7 +12,7 @@
 # Lesser General Public License for more details.
 #
 # You should have received a copy of the GNU Lesser General Public
-# License along with this library; If not, see <http://www.gnu.org/licenses/>.
+# License along with this library; If not, see <https://www.gnu.org/licenses/>.
 #
 
 #
diff --git a/tools/include/libxenvchan.h b/tools/include/libxenvchan.h
index ad771866e44321f6c880733a3df8e9315c2b348e..049e334426855661c3487d7fbfc3eec64b2655c5 100644
--- a/tools/include/libxenvchan.h
+++ b/tools/include/libxenvchan.h
@@ -21,7 +21,7 @@
  *  Lesser General Public License for more details.
  *
  *  You should have received a copy of the GNU Lesser General Public
- *  License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ *  License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * @section DESCRIPTION
  *
diff --git a/tools/include/xencall.h b/tools/include/xencall.h
index fc95ed0fe58eea7fb7830458fe6207bce610d63a..e577b927b8e6e4091dd9e6bf35d57952ea96f410 100644
--- a/tools/include/xencall.h
+++ b/tools/include/xencall.h
@@ -10,7 +10,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 #ifndef XENCALL_H
 #define XENCALL_H
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 23037874d3d5a01ddf55766088bf782393a9c483..fc0c72ae0265e610047b9a8fd950973e34198e2f 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -16,7 +16,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef XENCTRL_H
diff --git a/tools/include/xendevicemodel.h b/tools/include/xendevicemodel.h
index 797e0c6b2961926a68cd96b8ff5e1627067903ac..58dbb1bdda2fb8a9ee237ed20e0ecf1c09abe42e 100644
--- a/tools/include/xendevicemodel.h
+++ b/tools/include/xendevicemodel.h
@@ -12,7 +12,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 #ifndef XENDEVICEMODEL_H
 #define XENDEVICEMODEL_H
diff --git a/tools/include/xenevtchn.h b/tools/include/xenevtchn.h
index 1255c85178d2d5049aa2406c5be1b7932bec728d..51fbc42eb0598f95015a6754636ce70e9d20aba8 100644
--- a/tools/include/xenevtchn.h
+++ b/tools/include/xenevtchn.h
@@ -10,7 +10,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Split off from:
  * xenctrl.h
diff --git a/tools/include/xenforeignmemory.h b/tools/include/xenforeignmemory.h
index 0ab1dd19d3b56db4a9dccd784d54919d390b47a9..eb897603862d519dcd40ecff6c9e8be8d1810222 100644
--- a/tools/include/xenforeignmemory.h
+++ b/tools/include/xenforeignmemory.h
@@ -10,7 +10,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 #ifndef XENFOREIGNMEMORY_H
 #define XENFOREIGNMEMORY_H
diff --git a/tools/include/xengnttab.h b/tools/include/xengnttab.h
index 111fc88caeb3ef1186f6a3d0051688ceed14dc5c..188c7a9fdb8bdc4f1bad6b6ed7656f1921a0142d 100644
--- a/tools/include/xengnttab.h
+++ b/tools/include/xengnttab.h
@@ -10,7 +10,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Split off from:
  * xenctrl.h
diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index e01f494b772a4800fbd8d9d7ced8b45a811e8219..f8e248c5a2e30486a78e1207dd36b96159ce211e 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -16,7 +16,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef XENGUEST_H
diff --git a/tools/include/xenhypfs.h b/tools/include/xenhypfs.h
index 25432d2a1657d8a59b04ffdefca6d7ee1734cf55..7818198ee184c9c8c8fa2e5a50272cc4bb360b64 100644
--- a/tools/include/xenhypfs.h
+++ b/tools/include/xenhypfs.h
@@ -12,7 +12,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 #ifndef XENHYPFS_H
 #define XENHYPFS_H
diff --git a/tools/include/xenstore.h b/tools/include/xenstore.h
index 2b3f69fb61d3434f00dbc7870739258c81882d2a..c72e66e513720ebee2b11bcf901c3f9ba7af1416 100644
--- a/tools/include/xenstore.h
+++ b/tools/include/xenstore.h
@@ -13,7 +13,7 @@
     Lesser General Public License for more details.
 
     You should have received a copy of the GNU Lesser General Public
-    License along with this library; If not, see <http://www.gnu.org/licenses/>.
+    License along with this library; If not, see <https://www.gnu.org/licenses/>.
 */
 
 #ifndef XENSTORE_H
diff --git a/tools/include/xenstore_lib.h b/tools/include/xenstore_lib.h
index 2266009ec12410b07b8109b185c6c5d40b3b8771..7fd536234a937ff87d147abe34a0d67c905faa1f 100644
--- a/tools/include/xenstore_lib.h
+++ b/tools/include/xenstore_lib.h
@@ -13,7 +13,7 @@
     Lesser General Public License for more details.
 
     You should have received a copy of the GNU Lesser General Public
-    License along with this library; If not, see <http://www.gnu.org/licenses/>.
+    License along with this library; If not, see <https://www.gnu.org/licenses/>.
 */
 
 #ifndef XENSTORE_LIB_H
diff --git a/tools/include/xentoolcore.h b/tools/include/xentoolcore.h
index b3a3c934e28314a9f0d2856376916a0d5eb8c00e..3ff9dd6dbbcbdd9a3c3f5067aec1ccfd1e7921a6 100644
--- a/tools/include/xentoolcore.h
+++ b/tools/include/xentoolcore.h
@@ -16,7 +16,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef XENTOOLCORE_H
diff --git a/tools/include/xentoolcore_internal.h b/tools/include/xentoolcore_internal.h
index 1be014434d32f399de1ba3bcc9fcbb7f61c08749..be67c5fb7f41232cb1644751b4b9b9dc3b99039c 100644
--- a/tools/include/xentoolcore_internal.h
+++ b/tools/include/xentoolcore_internal.h
@@ -18,7 +18,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef XENTOOLCORE_INTERNAL_H
diff --git a/tools/include/xentoollog.h b/tools/include/xentoollog.h
index 76f17fe125d103af9ba587cb56fb147a23b5e615..817db123dd3136409f7a190fcdca56896b0342ec 100644
--- a/tools/include/xentoollog.h
+++ b/tools/include/xentoollog.h
@@ -15,7 +15,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef XENTOOLLOG_H
diff --git a/tools/libfsimage/ext2fs/fsys_ext2fs.c b/tools/libfsimage/ext2fs/fsys_ext2fs.c
index 5ed8fce90ef1dd663862f085865c7050a0eb9524..019bbffb475098158bb9798894e6a416b96a10a6 100644
--- a/tools/libfsimage/ext2fs/fsys_ext2fs.c
+++ b/tools/libfsimage/ext2fs/fsys_ext2fs.c
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xenfsimage_grub.h>
diff --git a/tools/libfsimage/fat/fat.h b/tools/libfsimage/fat/fat.h
index 2abb43084f47fa83e628ea01e237efd4d797bdd6..e9f535ce8827ef61851cfbfebd8e4242692d7146 100644
--- a/tools/libfsimage/fat/fat.h
+++ b/tools/libfsimage/fat/fat.h
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 
diff --git a/tools/libfsimage/fat/fsys_fat.c b/tools/libfsimage/fat/fsys_fat.c
index b89354a8721b280045a91a7b15151c1fe0380438..f540c6413339da4f1c23f95d4e856a4952937a46 100644
--- a/tools/libfsimage/fat/fsys_fat.c
+++ b/tools/libfsimage/fat/fsys_fat.c
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <limits.h>
diff --git a/tools/libfsimage/iso9660/fsys_iso9660.c b/tools/libfsimage/iso9660/fsys_iso9660.c
index 6e767357bfdc2e35d7aa788977280218e1937aa5..15cde87307e842af4a1fa09e314dd3b38473bfa4 100644
--- a/tools/libfsimage/iso9660/fsys_iso9660.c
+++ b/tools/libfsimage/iso9660/fsys_iso9660.c
@@ -15,7 +15,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  *  References:
diff --git a/tools/libfsimage/iso9660/iso9660.h b/tools/libfsimage/iso9660/iso9660.h
index 4ea9b3eed36a416c0faaaceb12f345da318cd7b7..6ac443e6dcc91f86b33c5420a2d32591f7d1b58f 100644
--- a/tools/libfsimage/iso9660/iso9660.h
+++ b/tools/libfsimage/iso9660/iso9660.h
@@ -15,7 +15,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  *  References:
diff --git a/tools/libfsimage/reiserfs/fsys_reiserfs.c b/tools/libfsimage/reiserfs/fsys_reiserfs.c
index 299b257e999426547199753508fcf76f1d440ed7..a83b69a059e1fec3b73c171fef66690310303c56 100644
--- a/tools/libfsimage/reiserfs/fsys_reiserfs.c
+++ b/tools/libfsimage/reiserfs/fsys_reiserfs.c
@@ -14,7 +14,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xenfsimage_grub.h>
diff --git a/tools/libfsimage/ufs/fsys_ufs.c b/tools/libfsimage/ufs/fsys_ufs.c
index a545bc9f65e82748c931f6f30a1c8c9abf0a712d..3f6ff873078656f914e2a0ccb9398f55365fcd81 100644
--- a/tools/libfsimage/ufs/fsys_ufs.c
+++ b/tools/libfsimage/ufs/fsys_ufs.c
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  * Copyright 2006 Sun Microsystems, Inc.  All rights reserved.
diff --git a/tools/libfsimage/xfs/fsys_xfs.c b/tools/libfsimage/xfs/fsys_xfs.c
index d735a88e55f3ac30b11ba7e5fe6a8a07b97bce0c..a8d8f249ad2cb1bbf53ab2fdb5bdbf5779ca433b 100644
--- a/tools/libfsimage/xfs/fsys_xfs.c
+++ b/tools/libfsimage/xfs/fsys_xfs.c
@@ -14,7 +14,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xenfsimage_grub.h>
diff --git a/tools/libfsimage/xfs/xfs.h b/tools/libfsimage/xfs/xfs.h
index e9f93531d82aa12264ef3b4c8bbc8f56d9c7d58f..00b76f31a55c3b7449618620976da70d3f1c2bb2 100644
--- a/tools/libfsimage/xfs/xfs.h
+++ b/tools/libfsimage/xfs/xfs.h
@@ -20,12 +20,12 @@
  *  other software, or any other product whatsoever.
  * 
  *  You should have received a copy of the GNU General Public License along
- *  with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  with this program; If not, see <https://www.gnu.org/licenses/>.
  * 
  *  Contact information: Silicon Graphics, Inc., 1600 Amphitheatre Pkwy,
  *  Mountain View, CA  94043, or:
  * 
- *  https://www.sgi.com
+ *  https://www.sgi.com 
  * 
  *  For further information regarding this notice, see: 
  * 
diff --git a/tools/libfsimage/zfs/Makefile b/tools/libfsimage/zfs/Makefile
index 434a9c3580e6ab029f0b54779decfd8107a08f10..b8cbca7f1a9da28b79cc0f855b23389f8364ad1e 100644
--- a/tools/libfsimage/zfs/Makefile
+++ b/tools/libfsimage/zfs/Makefile
@@ -13,7 +13,7 @@
 #  GNU General Public License for more details.
 #
 #  You should have received a copy of the GNU General Public License
-#  along with this program; If not, see <http://www.gnu.org/licenses/>.
+#  along with this program; If not, see <https://www.gnu.org/licenses/>.
 #
 
 # 
diff --git a/tools/libfsimage/zfs/filesys.h b/tools/libfsimage/zfs/filesys.h
index 36cc720709f7b238e1aa746afeabf6b961cda1c0..c1f64eb282034965cb329bf6a1b6a92adfd7bd00 100644
--- a/tools/libfsimage/zfs/filesys.h
+++ b/tools/libfsimage/zfs/filesys.h
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  * Copyright 2010 Sun Microsystems, Inc.  All rights reserved.
diff --git a/tools/libfsimage/zfs/fsi_zfs.c b/tools/libfsimage/zfs/fsi_zfs.c
index 187a8bc6b2d9502cd20a6306f98d75c9e8f9a939..bd24a5e7c84afcb8f2d993a7ca4e65717c1d4a8c 100644
--- a/tools/libfsimage/zfs/fsi_zfs.c
+++ b/tools/libfsimage/zfs/fsi_zfs.c
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  * Copyright 2010 Sun Microsystems, Inc.  All rights reserved.
diff --git a/tools/libfsimage/zfs/fsi_zfs.h b/tools/libfsimage/zfs/fsi_zfs.h
index 980ce8f30478f0707146cac2d2ba4b1e160d4c5d..e3b4a8116e386c16f504cd7fb87344461a549cbf 100644
--- a/tools/libfsimage/zfs/fsi_zfs.h
+++ b/tools/libfsimage/zfs/fsi_zfs.h
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  * Copyright 2010 Sun Microsystems, Inc.  All rights reserved.
diff --git a/tools/libfsimage/zfs/fsys_zfs.c b/tools/libfsimage/zfs/fsys_zfs.c
index e881fbb09ba9311e1e3001f148244e5416d61e16..941068b1339242b6b8a6e8f5710495bce3a46b84 100644
--- a/tools/libfsimage/zfs/fsys_zfs.c
+++ b/tools/libfsimage/zfs/fsys_zfs.c
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  * Copyright 2010 Sun Microsystems, Inc.  All rights reserved.
diff --git a/tools/libfsimage/zfs/fsys_zfs.h b/tools/libfsimage/zfs/fsys_zfs.h
index b4be51b50d1f3411f43f14ccc956bb80e21a920e..14595dffa998da725e39fa24e9ab0fb49e05cfbf 100644
--- a/tools/libfsimage/zfs/fsys_zfs.h
+++ b/tools/libfsimage/zfs/fsys_zfs.h
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  * Copyright 2010 Sun Microsystems, Inc.  All rights reserved.
diff --git a/tools/libfsimage/zfs/mb_info.h b/tools/libfsimage/zfs/mb_info.h
index 16e9013f58b3f28b3c2cd3a211f0eb6c265d1451..2c68dbea43d9259152cf20b69fe628d8217dfabe 100644
--- a/tools/libfsimage/zfs/mb_info.h
+++ b/tools/libfsimage/zfs/mb_info.h
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 /*
diff --git a/tools/libfsimage/zfs/shared.h b/tools/libfsimage/zfs/shared.h
index e4a239abe19c130ea2e48c6a8d7fb16079fd4dd7..55ffefce2020a00d2e74c859ad7bdb874904173d 100644
--- a/tools/libfsimage/zfs/shared.h
+++ b/tools/libfsimage/zfs/shared.h
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  * Copyright 2010 Sun Microsystems, Inc.  All rights reserved.
diff --git a/tools/libfsimage/zfs/zfs-include/dmu.h b/tools/libfsimage/zfs/zfs-include/dmu.h
index b39a951cf7c9725b9198bbd2876fd31080f90ee3..d37b02f04eadc6316dcd2dc5fca4c7d9f92d2e0e 100644
--- a/tools/libfsimage/zfs/zfs-include/dmu.h
+++ b/tools/libfsimage/zfs/zfs-include/dmu.h
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  * Copyright 2010 Sun Microsystems, Inc.  All rights reserved.
diff --git a/tools/libfsimage/zfs/zfs-include/dmu_objset.h b/tools/libfsimage/zfs/zfs-include/dmu_objset.h
index 2680fcf1bd8082e2e6f78997b35dcb4b6c35ef48..8a9c6ae3bf85f29055b1a8bddeb9ed68958d0e0f 100644
--- a/tools/libfsimage/zfs/zfs-include/dmu_objset.h
+++ b/tools/libfsimage/zfs/zfs-include/dmu_objset.h
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  * Copyright 2009 Sun Microsystems, Inc.  All rights reserved.
diff --git a/tools/libfsimage/zfs/zfs-include/dnode.h b/tools/libfsimage/zfs/zfs-include/dnode.h
index dd90a8779c70074dfcce14e61ad94e069f42eb35..49bfb54fc3feae4f7e02be6e94b3dc5f2396d135 100644
--- a/tools/libfsimage/zfs/zfs-include/dnode.h
+++ b/tools/libfsimage/zfs/zfs-include/dnode.h
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  * Copyright 2010 Sun Microsystems, Inc.  All rights reserved.
diff --git a/tools/libfsimage/zfs/zfs-include/dsl_dataset.h b/tools/libfsimage/zfs/zfs-include/dsl_dataset.h
index 470b60758840438cc8f655ece37311f1793f23bf..8ac92c60bcdbe1494568370d5d38475013899fc9 100644
--- a/tools/libfsimage/zfs/zfs-include/dsl_dataset.h
+++ b/tools/libfsimage/zfs/zfs-include/dsl_dataset.h
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  * Copyright 2007 Sun Microsystems, Inc.  All rights reserved.
diff --git a/tools/libfsimage/zfs/zfs-include/dsl_dir.h b/tools/libfsimage/zfs/zfs-include/dsl_dir.h
index 0e71b6b4808ed847560b2b62e0bbe3c865ebe521..e25bc139f3d94ed993c64992889a264eeb824a69 100644
--- a/tools/libfsimage/zfs/zfs-include/dsl_dir.h
+++ b/tools/libfsimage/zfs/zfs-include/dsl_dir.h
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  * Copyright 2007 Sun Microsystems, Inc.  All rights reserved.
diff --git a/tools/libfsimage/zfs/zfs-include/sa_impl.h b/tools/libfsimage/zfs/zfs-include/sa_impl.h
index 0679c93f2999d951adafa477be6e72975884995b..a9af9024194cda52d7a75c98faface583a5c847e 100644
--- a/tools/libfsimage/zfs/zfs-include/sa_impl.h
+++ b/tools/libfsimage/zfs/zfs-include/sa_impl.h
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  * Copyright 2010 Sun Microsystems, Inc.  All rights reserved.
diff --git a/tools/libfsimage/zfs/zfs-include/spa.h b/tools/libfsimage/zfs/zfs-include/spa.h
index ee708ef60bdc355e9d895967e00b277c3a897bf5..ba35ab740a4a8086830335fdcf920a3c910da11b 100644
--- a/tools/libfsimage/zfs/zfs-include/spa.h
+++ b/tools/libfsimage/zfs/zfs-include/spa.h
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  * Copyright 2010 Sun Microsystems, Inc.  All rights reserved.
diff --git a/tools/libfsimage/zfs/zfs-include/uberblock_impl.h b/tools/libfsimage/zfs/zfs-include/uberblock_impl.h
index 282d3b92827c70e4982530608b0ce0a028cf1ca2..2f879666cbd7e3c4b8fb0bf55cca91b8cea71bc0 100644
--- a/tools/libfsimage/zfs/zfs-include/uberblock_impl.h
+++ b/tools/libfsimage/zfs/zfs-include/uberblock_impl.h
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  * Copyright 2007 Sun Microsystems, Inc.  All rights reserved.
diff --git a/tools/libfsimage/zfs/zfs-include/vdev_impl.h b/tools/libfsimage/zfs/zfs-include/vdev_impl.h
index f3823b298d134379483b8c8e196c9fe196617e93..fe69c31fb9e51d0c64b3dea25276510adc768c92 100644
--- a/tools/libfsimage/zfs/zfs-include/vdev_impl.h
+++ b/tools/libfsimage/zfs/zfs-include/vdev_impl.h
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  * Copyright 2010 Sun Microsystems, Inc.  All rights reserved.
diff --git a/tools/libfsimage/zfs/zfs-include/zap_impl.h b/tools/libfsimage/zfs/zfs-include/zap_impl.h
index 7adfc347c3a15dc89d97510827468a02fb2643da..44fedf9f665722da05c6b6adc54da251f7f989cc 100644
--- a/tools/libfsimage/zfs/zfs-include/zap_impl.h
+++ b/tools/libfsimage/zfs/zfs-include/zap_impl.h
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  * Copyright 2009 Sun Microsystems, Inc.  All rights reserved.
diff --git a/tools/libfsimage/zfs/zfs-include/zap_leaf.h b/tools/libfsimage/zfs/zfs-include/zap_leaf.h
index ecf3faacb6407856e247521012242aff0e8fb2ee..9517d055f2d5b107faf081b80642604a1bb3853c 100644
--- a/tools/libfsimage/zfs/zfs-include/zap_leaf.h
+++ b/tools/libfsimage/zfs/zfs-include/zap_leaf.h
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  * Copyright 2007 Sun Microsystems, Inc.  All rights reserved.
diff --git a/tools/libfsimage/zfs/zfs-include/zfs.h b/tools/libfsimage/zfs/zfs-include/zfs.h
index 592d23a768d1ded2d521a1135f791888bef3ae5f..0f0e2552051ed291797febd690f6782599ae467d 100644
--- a/tools/libfsimage/zfs/zfs-include/zfs.h
+++ b/tools/libfsimage/zfs/zfs-include/zfs.h
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  * Copyright 2010 Sun Microsystems, Inc.  All rights reserved.
diff --git a/tools/libfsimage/zfs/zfs-include/zfs_acl.h b/tools/libfsimage/zfs/zfs-include/zfs_acl.h
index 6a685e0536711617abe5ba770fc9b89666ea109c..e0f458b68a9d4b0ce9914b78f806956eb5831bf4 100644
--- a/tools/libfsimage/zfs/zfs-include/zfs_acl.h
+++ b/tools/libfsimage/zfs/zfs-include/zfs_acl.h
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  * Copyright 2007 Sun Microsystems, Inc.  All rights reserved.
diff --git a/tools/libfsimage/zfs/zfs-include/zfs_znode.h b/tools/libfsimage/zfs/zfs-include/zfs_znode.h
index 902c4972caf61fab31de2d7ec08beefcc5f509ef..a46f7d765422a7f1abcb4f638601717a6255f5ed 100644
--- a/tools/libfsimage/zfs/zfs-include/zfs_znode.h
+++ b/tools/libfsimage/zfs/zfs-include/zfs_znode.h
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  * Copyright 2010 Sun Microsystems, Inc.  All rights reserved.
diff --git a/tools/libfsimage/zfs/zfs-include/zil.h b/tools/libfsimage/zfs/zfs-include/zil.h
index f34173c36b1859d20958f1a8d6913163b0dbb666..ec70d71ad3d42db0d7bf91c37a9f03b027b2f10f 100644
--- a/tools/libfsimage/zfs/zfs-include/zil.h
+++ b/tools/libfsimage/zfs/zfs-include/zil.h
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  * Copyright 2009 Sun Microsystems, Inc.  All rights reserved.
diff --git a/tools/libfsimage/zfs/zfs-include/zio.h b/tools/libfsimage/zfs/zfs-include/zio.h
index 513f321f9a82584acacbde1620b60d954bcdcb5e..c9dce12271379196bcab6e64562a6db132daaba1 100644
--- a/tools/libfsimage/zfs/zfs-include/zio.h
+++ b/tools/libfsimage/zfs/zfs-include/zio.h
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  * Copyright 2010 Sun Microsystems, Inc.  All rights reserved.
diff --git a/tools/libfsimage/zfs/zfs-include/zio_checksum.h b/tools/libfsimage/zfs/zfs-include/zio_checksum.h
index 5f22f29995765835586b0baadfb9410a5ffdca84..b9864ee32722e317abc774f2c2fb91ab6e54f26c 100644
--- a/tools/libfsimage/zfs/zfs-include/zio_checksum.h
+++ b/tools/libfsimage/zfs/zfs-include/zio_checksum.h
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  * Copyright 2010 Sun Microsystems, Inc.  All rights reserved.
diff --git a/tools/libfsimage/zfs/zfs_fletcher.c b/tools/libfsimage/zfs/zfs_fletcher.c
index cc9e8c4954d46eb47ce4321b05e1bddc7f61fc89..368beed6b06f329d631d60def1656e7503d50f21 100644
--- a/tools/libfsimage/zfs/zfs_fletcher.c
+++ b/tools/libfsimage/zfs/zfs_fletcher.c
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  * Copyright 2007 Sun Microsystems, Inc.  All rights reserved.
diff --git a/tools/libfsimage/zfs/zfs_lzjb.c b/tools/libfsimage/zfs/zfs_lzjb.c
index 0b11eee63af1b584feb1d7aab8365c0319a61584..f904e0b7dc4590411274b55e464adeefc94a1af7 100644
--- a/tools/libfsimage/zfs/zfs_lzjb.c
+++ b/tools/libfsimage/zfs/zfs_lzjb.c
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  * Copyright 2007 Sun Microsystems, Inc.  All rights reserved.
diff --git a/tools/libfsimage/zfs/zfs_sha256.c b/tools/libfsimage/zfs/zfs_sha256.c
index 18a5c05008ef4a5f5b2cec57e343ed8ea1f9ccfe..9a5b4af54e3c0f7da8c685d700a41fdc09e536a5 100644
--- a/tools/libfsimage/zfs/zfs_sha256.c
+++ b/tools/libfsimage/zfs/zfs_sha256.c
@@ -13,7 +13,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 /*
  * Copyright 2007 Sun Microsystems, Inc.  All rights reserved.
diff --git a/tools/libs/call/buffer.c b/tools/libs/call/buffer.c
index 085674d882ae5d031460f26451f48a3da790e549..34d0c90c58ce57125fda700571999122b2918269 100644
--- a/tools/libs/call/buffer.c
+++ b/tools/libs/call/buffer.c
@@ -10,7 +10,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <errno.h>
diff --git a/tools/libs/call/core.c b/tools/libs/call/core.c
index 02c4f8e1aefa9a87846daf0ae811cc91e12a0c00..ae82ff9535d870ce764242d21b5325eaa663b2b8 100644
--- a/tools/libs/call/core.c
+++ b/tools/libs/call/core.c
@@ -10,7 +10,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <stdlib.h>
diff --git a/tools/libs/call/freebsd.c b/tools/libs/call/freebsd.c
index 6d2e8704b3de549f8e3e6e1de158138fc0c8ef11..20ec28a564684cdec8fb49f4ec21a7fb5b7fcd63 100644
--- a/tools/libs/call/freebsd.c
+++ b/tools/libs/call/freebsd.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Split from xc_freebsd_osdep.c
  */
diff --git a/tools/libs/call/linux.c b/tools/libs/call/linux.c
index 6d588e6bea8fab3e2dfe18966d95ae09c14899c3..65d5a764689d998f02adaa389b2be7ba4d25ac1e 100644
--- a/tools/libs/call/linux.c
+++ b/tools/libs/call/linux.c
@@ -10,7 +10,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Split out from xc_linus_osdep.c:
  *
diff --git a/tools/libs/call/minios.c b/tools/libs/call/minios.c
index 3f33b8357829cc632f8775eda46e1a15699f0d5a..9b1435ca11494eb7600d52d520a537ae4d5910fe 100644
--- a/tools/libs/call/minios.c
+++ b/tools/libs/call/minios.c
@@ -10,7 +10,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Split out from xc_minios.c
  *
diff --git a/tools/libs/call/netbsd.c b/tools/libs/call/netbsd.c
index 91ae68357e3ef7b973499c7621515bb4150c61bb..e27c0f32d7a40b9287593b56f3a8a78e0497c970 100644
--- a/tools/libs/call/netbsd.c
+++ b/tools/libs/call/netbsd.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Split from xc_netbsd.c
  */
diff --git a/tools/libs/call/solaris.c b/tools/libs/call/solaris.c
index 304262bd057b37e9724cf9e177b20e1b70e9dcde..b79102fe996e19e4f605aec0862075442ec733a4 100644
--- a/tools/libs/call/solaris.c
+++ b/tools/libs/call/solaris.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Split from xc_solaris.c
  */
diff --git a/tools/libs/ctrl/xc_altp2m.c b/tools/libs/ctrl/xc_altp2m.c
index 6987c9541fd15cacb9880fb8f73763f63b023db7..cad63f74a1c922dcde6a0322387f3dc26e5a8de8 100644
--- a/tools/libs/ctrl/xc_altp2m.c
+++ b/tools/libs/ctrl/xc_altp2m.c
@@ -17,7 +17,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "xc_private.h"
diff --git a/tools/libs/ctrl/xc_cpu_hotplug.c b/tools/libs/ctrl/xc_cpu_hotplug.c
index 2ea98257792ba0b10330de492e96c4b73860d7a8..9f3916300000a63703abee19f214c112383764f5 100644
--- a/tools/libs/ctrl/xc_cpu_hotplug.c
+++ b/tools/libs/ctrl/xc_cpu_hotplug.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  */
 
diff --git a/tools/libs/ctrl/xc_cpupool.c b/tools/libs/ctrl/xc_cpupool.c
index fbd8cc9d037c7761e78e5d7111e6eead027f8b3a..52dcfe4a274a5d64c534dd47ede42da9c889a5dd 100644
--- a/tools/libs/ctrl/xc_cpupool.c
+++ b/tools/libs/ctrl/xc_cpupool.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2009, J Gross.
  */
diff --git a/tools/libs/ctrl/xc_csched.c b/tools/libs/ctrl/xc_csched.c
index 8e8c67220a0bc88db1bbc1d7880a8a95dd39570a..24213fc4c3cf53939357d01f37b68b803e220675 100644
--- a/tools/libs/ctrl/xc_csched.c
+++ b/tools/libs/ctrl/xc_csched.c
@@ -18,7 +18,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "xc_private.h"
diff --git a/tools/libs/ctrl/xc_csched2.c b/tools/libs/ctrl/xc_csched2.c
index 5eb753ad99158cfcd743fa4eb2260b17002f3793..14e4d15ad2644e1ffd5e08b4d6464cdab84e2f04 100644
--- a/tools/libs/ctrl/xc_csched2.c
+++ b/tools/libs/ctrl/xc_csched2.c
@@ -18,7 +18,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "xc_private.h"
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index e939d0715739f288bcf5c5f3c2a6f8865dddbbd1..d87105331dc3d394b16757b36cf9ebb9cf5db098 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2003, K A Fraser.
  */
diff --git a/tools/libs/ctrl/xc_evtchn.c b/tools/libs/ctrl/xc_evtchn.c
index 614786d3f3197e93958abe4321f40a0becb11d3b..7578869367b922ef8182e9ec96b242409a276be1 100644
--- a/tools/libs/ctrl/xc_evtchn.c
+++ b/tools/libs/ctrl/xc_evtchn.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2004, K A Fraser.
  */
diff --git a/tools/libs/ctrl/xc_flask.c b/tools/libs/ctrl/xc_flask.c
index c1652ba48d7c9163080cea92ea874e729f1ad96f..e3b6e9f279d73b7abb7a0d7d12e5801d3837de59 100644
--- a/tools/libs/ctrl/xc_flask.c
+++ b/tools/libs/ctrl/xc_flask.c
@@ -12,7 +12,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "xc_private.h"
diff --git a/tools/libs/ctrl/xc_foreign_memory.c b/tools/libs/ctrl/xc_foreign_memory.c
index 4053d268513673d18fedaeccd739b4186d33846d..47d65bf2f6c59574d2217be6c2239701cb9b507f 100644
--- a/tools/libs/ctrl/xc_foreign_memory.c
+++ b/tools/libs/ctrl/xc_foreign_memory.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #define XC_BUILDING_COMPAT_MAP_FOREIGN_API
diff --git a/tools/libs/ctrl/xc_freebsd.c b/tools/libs/ctrl/xc_freebsd.c
index 9dd48a3a08bb00c4bd1f75caf99b7865a977030b..661e49a9a110e2e3f8f82a75d733c4c5c49012b1 100644
--- a/tools/libs/ctrl/xc_freebsd.c
+++ b/tools/libs/ctrl/xc_freebsd.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "xc_private.h"
diff --git a/tools/libs/ctrl/xc_gnttab.c b/tools/libs/ctrl/xc_gnttab.c
index eb92d897d49e54d48d08db56a3b7b3dd17bde7c8..7db3f81613cb915de47350a8889baddb87689b94 100644
--- a/tools/libs/ctrl/xc_gnttab.c
+++ b/tools/libs/ctrl/xc_gnttab.c
@@ -13,7 +13,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "xc_private.h"
diff --git a/tools/libs/ctrl/xc_hcall_buf.c b/tools/libs/ctrl/xc_hcall_buf.c
index 200671f36ff2a036743de545243e29b786337bbe..59127484841bb835e1a5fb3db64e33b3e6d9a8eb 100644
--- a/tools/libs/ctrl/xc_hcall_buf.c
+++ b/tools/libs/ctrl/xc_hcall_buf.c
@@ -12,7 +12,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <stdlib.h>
diff --git a/tools/libs/ctrl/xc_linux.c b/tools/libs/ctrl/xc_linux.c
index c67c71c08be3f43fbe579e9ec76d8f1218fe4d28..c961f53124caa57aff6a27c4996c0a526b0265e6 100644
--- a/tools/libs/ctrl/xc_linux.c
+++ b/tools/libs/ctrl/xc_linux.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "xc_private.h"
diff --git a/tools/libs/ctrl/xc_mem_access.c b/tools/libs/ctrl/xc_mem_access.c
index 6d613037d04ea81369c1ccde40126c0da574277a..15c047174b253ea28484f77e604e1ba8432537d1 100644
--- a/tools/libs/ctrl/xc_mem_access.c
+++ b/tools/libs/ctrl/xc_mem_access.c
@@ -17,7 +17,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "xc_private.h"
diff --git a/tools/libs/ctrl/xc_mem_paging.c b/tools/libs/ctrl/xc_mem_paging.c
index 999a572cefdcbadfec7d1c1a854acecd0f2c6411..a940f3b95702f991e47f02e1f22c95bd2ff5d694 100644
--- a/tools/libs/ctrl/xc_mem_paging.c
+++ b/tools/libs/ctrl/xc_mem_paging.c
@@ -17,7 +17,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "xc_private.h"
diff --git a/tools/libs/ctrl/xc_memshr.c b/tools/libs/ctrl/xc_memshr.c
index 2f65b3b22e13b37a7c7055920ab52b541e83b291..9813a731a359ff6905c8c814fe72be1cd5674698 100644
--- a/tools/libs/ctrl/xc_memshr.c
+++ b/tools/libs/ctrl/xc_memshr.c
@@ -17,7 +17,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "xc_private.h"
diff --git a/tools/libs/ctrl/xc_minios.c b/tools/libs/ctrl/xc_minios.c
index 3dea7a78a576d7425f36096837cb25099a2577ab..0a75f382615caf9d2d9a7d2c2572ae5d2863a93d 100644
--- a/tools/libs/ctrl/xc_minios.c
+++ b/tools/libs/ctrl/xc_minios.c
@@ -15,7 +15,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #undef NDEBUG
diff --git a/tools/libs/ctrl/xc_misc.c b/tools/libs/ctrl/xc_misc.c
index 265f15ec2da344e948cbbe532d6d456a09accfc0..3b8b19801be53efc1bb025cd6aa713ce1f4976c3 100644
--- a/tools/libs/ctrl/xc_misc.c
+++ b/tools/libs/ctrl/xc_misc.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "xc_bitops.h"
diff --git a/tools/libs/ctrl/xc_monitor.c b/tools/libs/ctrl/xc_monitor.c
index c5fa62ff30d2bc3107e52ed70242644d182730fc..4a29f199b0b4152d4767a2539eb5e4ced6ba5b5b 100644
--- a/tools/libs/ctrl/xc_monitor.c
+++ b/tools/libs/ctrl/xc_monitor.c
@@ -17,7 +17,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "xc_private.h"
diff --git a/tools/libs/ctrl/xc_netbsd.c b/tools/libs/ctrl/xc_netbsd.c
index 31979937621ebd37de7578878b2825bd8f9b05b0..4609ba8599d8e3d02bb8a9f7335b615d6667c100 100644
--- a/tools/libs/ctrl/xc_netbsd.c
+++ b/tools/libs/ctrl/xc_netbsd.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "xc_private.h"
diff --git a/tools/libs/ctrl/xc_pagetab.c b/tools/libs/ctrl/xc_pagetab.c
index db25c20247573a3c638d7725c976433221a40141..b938d8b8369c54a4ebf4245268f43d572f0a7501 100644
--- a/tools/libs/ctrl/xc_pagetab.c
+++ b/tools/libs/ctrl/xc_pagetab.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "xc_private.h"
diff --git a/tools/libs/ctrl/xc_physdev.c b/tools/libs/ctrl/xc_physdev.c
index 460a8e779ce857e764e414c6dc118d6918d7aa6b..2fc2ac67a174d570bfddf2d7a1ce6cdbb46c575e 100644
--- a/tools/libs/ctrl/xc_physdev.c
+++ b/tools/libs/ctrl/xc_physdev.c
@@ -17,7 +17,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "xc_private.h"
diff --git a/tools/libs/ctrl/xc_pm.c b/tools/libs/ctrl/xc_pm.c
index 76d7eb7f265da4e52a69f944e13e10621d6ad2e2..5af84c2bbeff0e80e5f89b5b439e1b080f595548 100644
--- a/tools/libs/ctrl/xc_pm.c
+++ b/tools/libs/ctrl/xc_pm.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  */
 
diff --git a/tools/libs/ctrl/xc_private.c b/tools/libs/ctrl/xc_private.c
index 2f99a7d2cfb560cdf57ae6777f55d0310f943602..444e2e6ad92458dc811b16895eec365c6698d676 100644
--- a/tools/libs/ctrl/xc_private.c
+++ b/tools/libs/ctrl/xc_private.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "xc_private.h"
diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private.h
index ed960c6f30e65baf1b0857961cfdb276e12fdcfe..818c7a6c750e4bc618e6e658d665958c4a9daa01 100644
--- a/tools/libs/ctrl/xc_private.h
+++ b/tools/libs/ctrl/xc_private.h
@@ -10,7 +10,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef XC_PRIVATE_H
diff --git a/tools/libs/ctrl/xc_rt.c b/tools/libs/ctrl/xc_rt.c
index ad257c6e52878b652e5449804de02d61aa3d05ff..03bbacffa37b484cf51025c3ebf5a8260dc3f57d 100644
--- a/tools/libs/ctrl/xc_rt.c
+++ b/tools/libs/ctrl/xc_rt.c
@@ -19,7 +19,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "xc_private.h"
diff --git a/tools/libs/ctrl/xc_solaris.c b/tools/libs/ctrl/xc_solaris.c
index 5128f3f0f49040cbe88d762f6f42448cbb8a8f21..629b0b21faadbdc6616c0b9e38641b1d6eac5989 100644
--- a/tools/libs/ctrl/xc_solaris.c
+++ b/tools/libs/ctrl/xc_solaris.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "xc_private.h"
diff --git a/tools/libs/ctrl/xc_tbuf.c b/tools/libs/ctrl/xc_tbuf.c
index 283fbd1c8fb898bbbcb978e0fb71ca018504e362..110e4323a69a2d4ee02d356a19440863c1d8d8d7 100644
--- a/tools/libs/ctrl/xc_tbuf.c
+++ b/tools/libs/ctrl/xc_tbuf.c
@@ -19,7 +19,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "xc_private.h"
diff --git a/tools/libs/ctrl/xc_vm_event.c b/tools/libs/ctrl/xc_vm_event.c
index a97c615b18999e96a29dd1ef0bfc09c5455e062a..a371cca306496d9f4cd4a8e3085d2f2aa1431783 100644
--- a/tools/libs/ctrl/xc_vm_event.c
+++ b/tools/libs/ctrl/xc_vm_event.c
@@ -17,7 +17,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "xc_private.h"
diff --git a/tools/libs/ctrl/xc_vmtrace.c b/tools/libs/ctrl/xc_vmtrace.c
index 602502367f2393ab38b5680a707a7f3a444fa57a..b36455f1dd3d8fd56610593382e8bdfd56f224d3 100644
--- a/tools/libs/ctrl/xc_vmtrace.c
+++ b/tools/libs/ctrl/xc_vmtrace.c
@@ -19,7 +19,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "xc_private.h"
diff --git a/tools/libs/devicemodel/common.c b/tools/libs/devicemodel/common.c
index 0fdc7121f1eb7707f1f330577c9f4a2c948199f9..e18c2379e55d939323c91eb214d1e35900fa9bc1 100644
--- a/tools/libs/devicemodel/common.c
+++ b/tools/libs/devicemodel/common.c
@@ -12,7 +12,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <errno.h>
diff --git a/tools/libs/devicemodel/compat.c b/tools/libs/devicemodel/compat.c
index 5b4fdae2980450518919d60d50bf4acbeb6b100b..3c72737b0c50e3bea926317c4bea412b4089febc 100644
--- a/tools/libs/devicemodel/compat.c
+++ b/tools/libs/devicemodel/compat.c
@@ -12,7 +12,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <errno.h>
diff --git a/tools/libs/devicemodel/core.c b/tools/libs/devicemodel/core.c
index 8e619eeb0a1fc5faf7043e90ceb91becf9999db0..a30bdaa465ed8f03ed2316b3e42b991e2293be2c 100644
--- a/tools/libs/devicemodel/core.c
+++ b/tools/libs/devicemodel/core.c
@@ -12,7 +12,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <stdlib.h>
diff --git a/tools/libs/evtchn/core.c b/tools/libs/evtchn/core.c
index de925fc9630c0ca398b75c3d02ad81cbddbe21ed..5d70e827a8a450d3624e6357319ad0ee77b2a5b8 100644
--- a/tools/libs/evtchn/core.c
+++ b/tools/libs/evtchn/core.c
@@ -10,7 +10,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <errno.h>
diff --git a/tools/libs/evtchn/freebsd.c b/tools/libs/evtchn/freebsd.c
index 422836f1a1145de40dbbe771e0825b6d327ab377..0a557fce99b72cbf6205a26ae25689d7166c1f02 100644
--- a/tools/libs/evtchn/freebsd.c
+++ b/tools/libs/evtchn/freebsd.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Split off from xc_freebsd_osdep.c
  */
diff --git a/tools/libs/evtchn/linux.c b/tools/libs/evtchn/linux.c
index e61b77ca618a502448b7fcf4eedc83de4dfbca65..e9576e6ffc7fda7bb7bef7795bef35a9517ee58f 100644
--- a/tools/libs/evtchn/linux.c
+++ b/tools/libs/evtchn/linux.c
@@ -10,7 +10,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Split out from xc_linus_osdep.c:
  *
diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
index 28743cb055753f02976c9258003203b51c40a242..6f5482edcfa716fb27f1818178a4cdc05d6317d9 100644
--- a/tools/libs/evtchn/minios.c
+++ b/tools/libs/evtchn/minios.c
@@ -15,7 +15,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Split off from xc_minios.c
  */
diff --git a/tools/libs/evtchn/netbsd.c b/tools/libs/evtchn/netbsd.c
index 2de9cefc67f89b2a0ebd39c3008be0147701de1c..68047ef65c6fe77723308ec02fc77be523ee7324 100644
--- a/tools/libs/evtchn/netbsd.c
+++ b/tools/libs/evtchn/netbsd.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Split out from xc_netbsd.c
  */
diff --git a/tools/libs/evtchn/solaris.c b/tools/libs/evtchn/solaris.c
index 375a5f9b4fce280688fa0c6dcf8480cfb40fb78f..d137c7a30c044366ca36e03f766450f6ba490919 100644
--- a/tools/libs/evtchn/solaris.c
+++ b/tools/libs/evtchn/solaris.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Split out from xc_solaris.c
  */
diff --git a/tools/libs/foreignmemory/compat.c b/tools/libs/foreignmemory/compat.c
index 5f730ca919d670de43cd1581a131224a856a050d..2d743720a42cf575f220d80cf3cd3d1f61fdf8a4 100644
--- a/tools/libs/foreignmemory/compat.c
+++ b/tools/libs/foreignmemory/compat.c
@@ -11,7 +11,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Split out from xc_foreign_memory.c
  */
diff --git a/tools/libs/foreignmemory/core.c b/tools/libs/foreignmemory/core.c
index 7edc6f0dbfe35859819b9d5f6a21b12c61a8b471..ab6e8820e67a232c6c9002ba4c03f8604e0b9cf6 100644
--- a/tools/libs/foreignmemory/core.c
+++ b/tools/libs/foreignmemory/core.c
@@ -10,7 +10,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <stdlib.h>
diff --git a/tools/libs/foreignmemory/freebsd.c b/tools/libs/foreignmemory/freebsd.c
index 2cf0fa1c38b1544e43116867bf48b3e3bf47f959..d18e9f9112b3bad4444ec0ccfb0cd1d24cc243ab 100644
--- a/tools/libs/foreignmemory/freebsd.c
+++ b/tools/libs/foreignmemory/freebsd.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <errno.h>
diff --git a/tools/libs/foreignmemory/linux.c b/tools/libs/foreignmemory/linux.c
index 9062117407a998634c6115043bbe33339e53ee19..7f6a327a9b43ee2b76f58fb918ffe004afab7d85 100644
--- a/tools/libs/foreignmemory/linux.c
+++ b/tools/libs/foreignmemory/linux.c
@@ -10,7 +10,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Split out from xc_linus_osdep.c:
  *
diff --git a/tools/libs/foreignmemory/minios.c b/tools/libs/foreignmemory/minios.c
index f2f4dfb2be51851431b776e8b0d0c277cb13ec7e..0f7570772e3d9389f6373e8becaa8a6e292bd98f 100644
--- a/tools/libs/foreignmemory/minios.c
+++ b/tools/libs/foreignmemory/minios.c
@@ -10,7 +10,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Split out from xc_minios.c
  *
diff --git a/tools/libs/foreignmemory/netbsd.c b/tools/libs/foreignmemory/netbsd.c
index 597db775d7ea428f865f3a53192494617e69cb49..8220452d6dd47662f76bc5d1fe2e3580ebd1eaad 100644
--- a/tools/libs/foreignmemory/netbsd.c
+++ b/tools/libs/foreignmemory/netbsd.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <unistd.h>
diff --git a/tools/libs/foreignmemory/solaris.c b/tools/libs/foreignmemory/solaris.c
index 958fb01f6d24a0e166b3a1d0db3000c2e84659ac..8dceeab84053fe8ed8472e6e94e015a4254acae7 100644
--- a/tools/libs/foreignmemory/solaris.c
+++ b/tools/libs/foreignmemory/solaris.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "xc_private.h"
diff --git a/tools/libs/gnttab/freebsd.c b/tools/libs/gnttab/freebsd.c
index e42ac3fbf351470d43b085eed0e172a0f85b8e09..97373b3faee3fc91a006c870fa431ab0e5aa013e 100644
--- a/tools/libs/gnttab/freebsd.c
+++ b/tools/libs/gnttab/freebsd.c
@@ -13,7 +13,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Split out from linux.c
  */
diff --git a/tools/libs/gnttab/gntshr_core.c b/tools/libs/gnttab/gntshr_core.c
index 1117e29c91335eb50b0c848b7ead2449ab148df9..2483d4987618aebff4b62f3673dc53fa62f9316c 100644
--- a/tools/libs/gnttab/gntshr_core.c
+++ b/tools/libs/gnttab/gntshr_core.c
@@ -13,7 +13,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Split out from xc_gnttab.c
  */
diff --git a/tools/libs/gnttab/gntshr_unimp.c b/tools/libs/gnttab/gntshr_unimp.c
index e21048435b1795ec5f057966aacbab5e09ae3892..dd08bc1265b97e86e7a69b0d03c1a4a8fe89782a 100644
--- a/tools/libs/gnttab/gntshr_unimp.c
+++ b/tools/libs/gnttab/gntshr_unimp.c
@@ -13,7 +13,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Split out from xc_gnttab.c
  */
diff --git a/tools/libs/gnttab/gnttab_core.c b/tools/libs/gnttab/gnttab_core.c
index 92e7228a267123c1e5156ea3d74b081bcbd7cbf0..4b6cdf26747bca181286a405efca64815e4c179a 100644
--- a/tools/libs/gnttab/gnttab_core.c
+++ b/tools/libs/gnttab/gnttab_core.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Split out from xc_gnttab.c
  */
diff --git a/tools/libs/gnttab/gnttab_unimp.c b/tools/libs/gnttab/gnttab_unimp.c
index dee1afd2647f9f69a1d2a0dc5450b31ffd81a4da..bef13af9d85cd1aa71516dea052781f4bec824eb 100644
--- a/tools/libs/gnttab/gnttab_unimp.c
+++ b/tools/libs/gnttab/gnttab_unimp.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Split out from xc_gnttab.c
  */
diff --git a/tools/libs/gnttab/linux.c b/tools/libs/gnttab/linux.c
index 5628fd5719d1d7f95f5c5ca3f6e22cee708b32cf..e730250bcf8e2876f618321fbc45735c1f961a5c 100644
--- a/tools/libs/gnttab/linux.c
+++ b/tools/libs/gnttab/linux.c
@@ -13,7 +13,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Split out from xc_linux_osdep.c
  */
diff --git a/tools/libs/gnttab/minios.c b/tools/libs/gnttab/minios.c
index cac89f0ba6206df7e4271427269cd4e39069a459..410b545ec694605688f909d014380bf3c3febe5c 100644
--- a/tools/libs/gnttab/minios.c
+++ b/tools/libs/gnttab/minios.c
@@ -15,7 +15,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Splitfrom xc_minios.c
  */
diff --git a/tools/libs/gnttab/netbsd.c b/tools/libs/gnttab/netbsd.c
index a4ad624b5415f050bcd23503e5e478ff6a5699f7..2c1a80f45421473f9dfb7303c7a07ade97ccbf37 100644
--- a/tools/libs/gnttab/netbsd.c
+++ b/tools/libs/gnttab/netbsd.c
@@ -13,7 +13,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Split out from linux.c
  */
diff --git a/tools/libs/guest/xg_core.c b/tools/libs/guest/xg_core.c
index c52f1161c1c8ff7e7f6effdc8a40ee449d4eaa81..6cb3d1b24a5d331e2480e83fab2a82cfe816d515 100644
--- a/tools/libs/guest/xg_core.c
+++ b/tools/libs/guest/xg_core.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 /*
diff --git a/tools/libs/guest/xg_core.h b/tools/libs/guest/xg_core.h
index aaca9e0a8b992b5915ddfd20ef474ace8eccaeaf..a7585fa7aae06534cfd536cad6815ea0cc0a6fa6 100644
--- a/tools/libs/guest/xg_core.h
+++ b/tools/libs/guest/xg_core.h
@@ -13,7 +13,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  */
 
diff --git a/tools/libs/guest/xg_core_arm.c b/tools/libs/guest/xg_core_arm.c
index aaabd075585e4ab69f7b690bab6a8256509a5fa6..c4a89b15e48fe6acba6f3f75a13412f1d0d98b35 100644
--- a/tools/libs/guest/xg_core_arm.c
+++ b/tools/libs/guest/xg_core_arm.c
@@ -10,7 +10,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2011 Citrix Systems
  *
diff --git a/tools/libs/guest/xg_core_arm.h b/tools/libs/guest/xg_core_arm.h
index 162f7a7569e7067ebdb096c571439c4f6e7714b8..df0a2a2d2a7451c9a7e948aed0646f1a8d79fb7d 100644
--- a/tools/libs/guest/xg_core_arm.h
+++ b/tools/libs/guest/xg_core_arm.h
@@ -10,7 +10,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2012 Citrix Systems
  *
diff --git a/tools/libs/guest/xg_core_x86.c b/tools/libs/guest/xg_core_x86.c
index 61106b98b87701330d0833e7d138a55b2f614416..dcfe6a7c59796f0114c8c5f6740f271a246df5f0 100644
--- a/tools/libs/guest/xg_core_x86.c
+++ b/tools/libs/guest/xg_core_x86.c
@@ -10,7 +10,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2007 Isaku Yamahata <yamahata at valinux co jp>
  *                    VA Linux Systems Japan K.K.
diff --git a/tools/libs/guest/xg_core_x86.h b/tools/libs/guest/xg_core_x86.h
index 867146b1d9e73bed2810f6aa60f22bcc9b12d58b..4c9f82480861b6c24f331d243e7cf9a58b83d651 100644
--- a/tools/libs/guest/xg_core_x86.h
+++ b/tools/libs/guest/xg_core_x86.h
@@ -10,7 +10,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2007 Isaku Yamahata <yamahata at valinux co jp>
  *                    VA Linux Systems Japan K.K.
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 57f81eb0a0822b6d17cb5dfce90ef964a9178b75..72b23b5f7610e5c549f446da480ca50a91bee527 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -16,7 +16,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <stdlib.h>
diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
index 5e3b76355ec4850056a415cdbba25b52e7ca8c28..0aa693047e0a5d3779272b11276797d8a771ba74 100644
--- a/tools/libs/guest/xg_dom_arm.c
+++ b/tools/libs/guest/xg_dom_arm.c
@@ -12,7 +12,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2011, Citrix Systems
  */
diff --git a/tools/libs/guest/xg_dom_armzimageloader.c b/tools/libs/guest/xg_dom_armzimageloader.c
index 6d837cefc4a25b85d4974c1672b7d649d61edf32..ac822a213cb14264be946ce546493209e500124a 100644
--- a/tools/libs/guest/xg_dom_armzimageloader.c
+++ b/tools/libs/guest/xg_dom_armzimageloader.c
@@ -16,7 +16,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  */
 
diff --git a/tools/libs/guest/xg_dom_binloader.c b/tools/libs/guest/xg_dom_binloader.c
index f5e3ddc5dc4d515f455ef70aaa3cf607eaad4d37..bf8bfbefb994a58761d38961e12ff65b50faca86 100644
--- a/tools/libs/guest/xg_dom_binloader.c
+++ b/tools/libs/guest/xg_dom_binloader.c
@@ -10,7 +10,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Some of the field descriptions were copied from "The Multiboot
  * Specification", Copyright 1995, 96 Bryan Ford <baford@cs.utah.edu>,
diff --git a/tools/libs/guest/xg_dom_boot.c b/tools/libs/guest/xg_dom_boot.c
index 263a3f4c85a660790a8794b9147e338047bda18e..d20b37401269d0481658b502ffe9c694cbf884d6 100644
--- a/tools/libs/guest/xg_dom_boot.c
+++ b/tools/libs/guest/xg_dom_boot.c
@@ -18,7 +18,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * written 2006 by Gerd Hoffmann <kraxel@suse.de>.
  *
diff --git a/tools/libs/guest/xg_dom_bzimageloader.c b/tools/libs/guest/xg_dom_bzimageloader.c
index 764ddbb43eb82dfe8c12eb95f38d952ed5c8c374..4e1693e625b16dfd017e4b7f38fdc5e985248e20 100644
--- a/tools/libs/guest/xg_dom_bzimageloader.c
+++ b/tools/libs/guest/xg_dom_bzimageloader.c
@@ -18,7 +18,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * written 2006 by Gerd Hoffmann <kraxel@suse.de>.
  * written 2007 by Jeremy Fitzhardinge <jeremy@xensource.com>
diff --git a/tools/libs/guest/xg_dom_compat_linux.c b/tools/libs/guest/xg_dom_compat_linux.c
index a0d9c7a04e85946804ecf48bc4e1d3bf47e83220..1b18b51ba6df30f67724fa395a9aeab2c06e71c7 100644
--- a/tools/libs/guest/xg_dom_compat_linux.c
+++ b/tools/libs/guest/xg_dom_compat_linux.c
@@ -16,7 +16,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * written 2006 by Gerd Hoffmann <kraxel@suse.de>.
  *
diff --git a/tools/libs/guest/xg_dom_core.c b/tools/libs/guest/xg_dom_core.c
index c4f4e7f3e27a13f4cb72eb96552c921c6b45e4c8..a228496fd4066bae8e9a862d6548b6e6f65bc78b 100644
--- a/tools/libs/guest/xg_dom_core.c
+++ b/tools/libs/guest/xg_dom_core.c
@@ -17,7 +17,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * written 2006 by Gerd Hoffmann <kraxel@suse.de>.
  *
diff --git a/tools/libs/guest/xg_dom_elfloader.c b/tools/libs/guest/xg_dom_elfloader.c
index f17930d98bf70fa3a0a7dced02177e0ce6123538..f71a49a4332c973ab3f3c58964cf4f764ca4c6c4 100644
--- a/tools/libs/guest/xg_dom_elfloader.c
+++ b/tools/libs/guest/xg_dom_elfloader.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * written 2006 by Gerd Hoffmann <kraxel@suse.de>.
  *
diff --git a/tools/libs/guest/xg_dom_hvmloader.c b/tools/libs/guest/xg_dom_hvmloader.c
index 39e1e5f579a738b5f71c0ef28dcd821817b22a94..e78754ce26b3af00447d14fa45a219d855fc5061 100644
--- a/tools/libs/guest/xg_dom_hvmloader.c
+++ b/tools/libs/guest/xg_dom_hvmloader.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  */
 
diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
index 9328fbf804853d98db175b6a02bcc925fd8b1181..b536afbe3cf2229872be53618781d2fa41332ba3 100644
--- a/tools/libs/guest/xg_dom_x86.c
+++ b/tools/libs/guest/xg_dom_x86.c
@@ -16,7 +16,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * written 2006 by Gerd Hoffmann <kraxel@suse.de>.
  *
diff --git a/tools/libs/guest/xg_domain.c b/tools/libs/guest/xg_domain.c
index f0e7748449a1c7b13ec601d66bef4d18eb9485c0..ce4562b024defb0cad10bf1b441b244b1812e679 100644
--- a/tools/libs/guest/xg_domain.c
+++ b/tools/libs/guest/xg_domain.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2003, K A Fraser.
  */
diff --git a/tools/libs/guest/xg_nomigrate.c b/tools/libs/guest/xg_nomigrate.c
index 6795c62ddc2803527bf0e74843cb86ef99231de0..f9b528cf25c9e20f72bd85cc33c976641987472e 100644
--- a/tools/libs/guest/xg_nomigrate.c
+++ b/tools/libs/guest/xg_nomigrate.c
@@ -10,7 +10,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2011, Citrix Systems
  */
diff --git a/tools/libs/guest/xg_offline_page.c b/tools/libs/guest/xg_offline_page.c
index c594fdba415de8cde8d08e53710b9c0437a8b5a4..406ec536e169d3b489c9dadd155160c122f4d10a 100644
--- a/tools/libs/guest/xg_offline_page.c
+++ b/tools/libs/guest/xg_offline_page.c
@@ -17,7 +17,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <inttypes.h>
diff --git a/tools/libs/guest/xg_private.c b/tools/libs/guest/xg_private.c
index 2073dba2ef2091b71e175252b5da7b14549602d2..291ed0b237eb9bb380751ae40a938953918fbe1d 100644
--- a/tools/libs/guest/xg_private.c
+++ b/tools/libs/guest/xg_private.c
@@ -14,7 +14,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <stdlib.h>
diff --git a/tools/libs/guest/xg_private.h b/tools/libs/guest/xg_private.h
index 09e24f122760a4bfc6a8e73c922ed44b5f8da635..62d8a153210684a24103650cc1c4e283d190c50e 100644
--- a/tools/libs/guest/xg_private.h
+++ b/tools/libs/guest/xg_private.h
@@ -10,7 +10,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef XG_PRIVATE_H
diff --git a/tools/libs/guest/xg_resume.c b/tools/libs/guest/xg_resume.c
index 77e2451a3c4daa7712a056bf9886661ff474bcdb..0b5451c8a4fdf154342bc0b38f4459297f1bc84a 100644
--- a/tools/libs/guest/xg_resume.c
+++ b/tools/libs/guest/xg_resume.c
@@ -10,7 +10,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "xg_private.h"
diff --git a/tools/libs/guest/xg_save_restore.h b/tools/libs/guest/xg_save_restore.h
index 3dbbc8dcd271c59a35836ab9d2a911cdb5126843..a30c909271c596627dfa74714e98ec359ae0a5dd 100644
--- a/tools/libs/guest/xg_save_restore.h
+++ b/tools/libs/guest/xg_save_restore.h
@@ -12,7 +12,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "xc_private.h"
diff --git a/tools/libs/guest/xg_suspend.c b/tools/libs/guest/xg_suspend.c
index 0ce63649636905851e03750a0ae8bcb63dd926f1..62d9b3d9ed65364c982065169d4d9941fa9861d5 100644
--- a/tools/libs/guest/xg_suspend.c
+++ b/tools/libs/guest/xg_suspend.c
@@ -10,7 +10,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <unistd.h>
diff --git a/tools/libs/hypfs/core.c b/tools/libs/hypfs/core.c
index 52b30db8d777c357fb85f3e936ce120d1431f421..522576a152251280d4e73ed0254d83782650edf4 100644
--- a/tools/libs/hypfs/core.c
+++ b/tools/libs/hypfs/core.c
@@ -12,7 +12,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #define __XEN_TOOLS__ 1
diff --git a/tools/libs/stat/COPYING b/tools/libs/stat/COPYING
index 480e5f18765e660f5e9d00f9bb09097bdc3d3084..d49f0cf1a31a59bda21b086c12cc4e5071bcb635 100644
--- a/tools/libs/stat/COPYING
+++ b/tools/libs/stat/COPYING
@@ -489,7 +489,7 @@ notice is found.
     Lesser General Public License for more details.
 
     You should have received a copy of the GNU Lesser General Public
-    License along with this library; If not, see <http://www.gnu.org/licenses/>.
+    License along with this library; If not, see <https://www.gnu.org/licenses/>.
 
 Also add information on how to contact you by electronic and paper mail.
 
diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index 7a9a8b1656b05799515b75520cbc32bba72069a0..faafb3a1c5fc65a76603c47ab29cdd0ae010150f 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -13,7 +13,7 @@
     Lesser General Public License for more details.
 
     You should have received a copy of the GNU Lesser General Public
-    License along with this library; If not, see <http://www.gnu.org/licenses/>.
+    License along with this library; If not, see <https://www.gnu.org/licenses/>.
 */
 
 #define _GNU_SOURCE
diff --git a/tools/libs/toolcore/handlereg.c b/tools/libs/toolcore/handlereg.c
index b43cb0e8acab7a06d65a3215934bd56e1e8d93a0..4a9d87b64107ad9b0aaa112926a8cf7bf946a3ea 100644
--- a/tools/libs/toolcore/handlereg.c
+++ b/tools/libs/toolcore/handlereg.c
@@ -17,7 +17,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "xentoolcore_internal.h"
diff --git a/tools/libs/toollog/xtl_core.c b/tools/libs/toollog/xtl_core.c
index 099d2f30951d613e189cd7d980f39f274c91a772..c526c44ab4918ce1f67cd778d95054ad0fe8eaef 100644
--- a/tools/libs/toollog/xtl_core.c
+++ b/tools/libs/toollog/xtl_core.c
@@ -17,7 +17,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "xentoollog.h"
diff --git a/tools/libs/toollog/xtl_logger_stdio.c b/tools/libs/toollog/xtl_logger_stdio.c
index 52dfbf51e35b122462fa966f4c4171b768dd0204..4fc17aad96929eb2cf75a45d2b6027975fdb9515 100644
--- a/tools/libs/toollog/xtl_logger_stdio.c
+++ b/tools/libs/toollog/xtl_logger_stdio.c
@@ -17,7 +17,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "xentoollog.h"
diff --git a/tools/libs/util/libxlu_cfg_y.c b/tools/libs/util/libxlu_cfg_y.c
index 6d4638afc937368065943fee2386aa523a1c12a3..055b697437d9dc7d9ce9d63fa965ded14ba10932 100644
--- a/tools/libs/util/libxlu_cfg_y.c
+++ b/tools/libs/util/libxlu_cfg_y.c
@@ -16,7 +16,7 @@
    GNU General Public License for more details.
 
    You should have received a copy of the GNU General Public License
-   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */
 
 /* As a special exception, you may create a larger work that contains
    part or all of the Bison parser skeleton and distribute that work
diff --git a/tools/libs/util/libxlu_cfg_y.h b/tools/libs/util/libxlu_cfg_y.h
index 1233cb94fccc3d7c442ebb3692af23000c550983..01f12531a641c78a2e5265361dab01e31974170a 100644
--- a/tools/libs/util/libxlu_cfg_y.h
+++ b/tools/libs/util/libxlu_cfg_y.h
@@ -16,7 +16,7 @@
    GNU General Public License for more details.
 
    You should have received a copy of the GNU General Public License
-   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */
 
 /* As a special exception, you may create a larger work that contains
    part or all of the Bison parser skeleton and distribute that work
diff --git a/tools/libs/vchan/init.c b/tools/libs/vchan/init.c
index 9195bd3b98759897d324bf0a712f7788be1e5865..9136a118753858e3e70dbbe37247d4747b449af9 100644
--- a/tools/libs/vchan/init.c
+++ b/tools/libs/vchan/init.c
@@ -21,7 +21,7 @@
  *  Lesser General Public License for more details.
  *
  *  You should have received a copy of the GNU Lesser General Public
- *  License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ *  License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * @section DESCRIPTION
  *
diff --git a/tools/libs/vchan/io.c b/tools/libs/vchan/io.c
index 1f201ad554f2dc050f45e63b92446d301fb76d89..00281ebf36f1a3cbb93316b458e9eddc9b7f32d9 100644
--- a/tools/libs/vchan/io.c
+++ b/tools/libs/vchan/io.c
@@ -21,7 +21,7 @@
  *  Lesser General Public License for more details.
  *
  *  You should have received a copy of the GNU Lesser General Public
- *  License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ *  License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * @section DESCRIPTION
  *
diff --git a/tools/libs/vchan/vchan.h b/tools/libs/vchan/vchan.h
index 621016ef42e5eaf57f1c0d5e333801d35b3abe35..9aec37906960f80c5bbf717717eb2e6f9cf528ba 100644
--- a/tools/libs/vchan/vchan.h
+++ b/tools/libs/vchan/vchan.h
@@ -17,7 +17,7 @@
  *  Lesser General Public License for more details.
  *
  *  You should have received a copy of the GNU Lesser General Public
- *  License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ *  License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * @section DESCRIPTION
  *
diff --git a/tools/misc/mkhex b/tools/misc/mkhex
index d0982d5787286ba894087358115824cc75eaea30..0cc49047cbf33aabde0291ce407f314210d4c42f 100755
--- a/tools/misc/mkhex
+++ b/tools/misc/mkhex
@@ -16,7 +16,7 @@
 # more details.
 #
 # You should have received a copy of the GNU General Public License along with
-# this program; If not, see <http://www.gnu.org/licenses/>.
+# this program; If not, see <https://www.gnu.org/licenses/>.
 #
 
 echo "unsigned $1[] = {"
diff --git a/tools/misc/xen-mceinj.c b/tools/misc/xen-mceinj.c
index df55eefbacc585e7e62eff1c40972cfa15015b35..b385eaac57021a1bbb6b2691c9178bdd2339cf55 100644
--- a/tools/misc/xen-mceinj.c
+++ b/tools/misc/xen-mceinj.c
@@ -12,7 +12,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Authors: Yunhong Jiang <yunhong.jiang@intel.com>
  *          Haicheng Li <haicheng.li@intel.com>
diff --git a/tools/misc/xen-vmtrace.c b/tools/misc/xen-vmtrace.c
index 5b688a54af5a1c59a4cc85acbf81c9b0e164a5e9..93af18ebbd8adfe364bb1f72c414188f685d6053 100644
--- a/tools/misc/xen-vmtrace.c
+++ b/tools/misc/xen-vmtrace.c
@@ -19,7 +19,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <err.h>
diff --git a/tools/misc/xencov.c b/tools/misc/xencov.c
index e5b40dba9cf1c1f42f4efc2d851cdefcb33ad37a..28e006569a204eef5593dee8868ab32a5b80b396 100644
--- a/tools/misc/xencov.c
+++ b/tools/misc/xencov.c
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <err.h>
diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 4f8cde690a7c77f4465fd0815c901b4232240419..162a18fe7e1485145a6255f8c653b47552f24a97 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -12,7 +12,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 #define MAX_NR_CPU 512
 
diff --git a/tools/misc/xenpvnetboot b/tools/misc/xenpvnetboot
index be972b9e19b7ff55e7723c37d1e2affd306fae22..7a6feee3d4474385d0738954733a691b7dfdbbf6 100755
--- a/tools/misc/xenpvnetboot
+++ b/tools/misc/xenpvnetboot
@@ -8,7 +8,7 @@
 # useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
 # Public License for more details.  You should have received a copy of the GNU
-# General Public License along with this program; If not, see <http://www.gnu.org/licenses/>.
+# General Public License along with this program; If not, see <https://www.gnu.org/licenses/>.
 
 import sys
 import os
@@ -168,7 +168,7 @@ Get boot images from the given location and prepare for Xen to use.
 
 Supported locations:
 
- - http://host/path
+ - https://host/path
  - https://host/path
  - ftp://host/path
  - file:///path
@@ -216,7 +216,7 @@ Supported locations:
     else:
         location = ''
     if (location == ''
-        or location.startswith('http://') or location.startswith('https://')
+        or location.startswith('https://') or location.startswith('https://')
         or location.startswith('ftp://') or location.startswith('file://')
         or (os.path.exists(location) and os.path.isdir(location))):
         fetcher = Fetcher(location, opts.output_directory)
diff --git a/tools/ocaml/LICENSE b/tools/ocaml/LICENSE
index d4d1f176886856c1e536ca925471520ba9c7bcfe..f11101ec2d33d936815e259bd757869e456d2bfd 100644
--- a/tools/ocaml/LICENSE
+++ b/tools/ocaml/LICENSE
@@ -181,7 +181,7 @@ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 Lesser General Public License for more details.
 
 You should have received a copy of the GNU Lesser General Public
-License along with this library; If not, see <http://www.gnu.org/licenses/>.
+License along with this library; If not, see <https://www.gnu.org/licenses/>.
 
 Also add information on how to contact you by electronic and paper mail.
 
diff --git a/tools/pygrub/src/ExtLinuxConf.py b/tools/pygrub/src/ExtLinuxConf.py
index 9fd635b9cf7ad56a925e955be9702922d2648121..c12fa3a1912c92ced8ecf3f1f3596af55f67773f 100644
--- a/tools/pygrub/src/ExtLinuxConf.py
+++ b/tools/pygrub/src/ExtLinuxConf.py
@@ -7,7 +7,7 @@
 # general public license.
 #
 # You should have received a copy of the GNU General Public License
-# along with this program; If not, see <http://www.gnu.org/licenses/>.
+# along with this program; If not, see <https://www.gnu.org/licenses/>.
 #
 
 from __future__ import print_function, absolute_import
diff --git a/tools/pygrub/src/GrubConf.py b/tools/pygrub/src/GrubConf.py
index 73f1bbed2f543333172104683768710ed61b6bf3..958a15a44af1b284b1a5b69aa8557ae1585f4af2 100644
--- a/tools/pygrub/src/GrubConf.py
+++ b/tools/pygrub/src/GrubConf.py
@@ -9,7 +9,7 @@
 # general public license.
 #
 # You should have received a copy of the GNU General Public License
-# along with this program; If not, see <http://www.gnu.org/licenses/>.
+# along with this program; If not, see <https://www.gnu.org/licenses/>.
 #
 
 from __future__ import print_function, absolute_import
diff --git a/tools/pygrub/src/pygrub b/tools/pygrub/src/pygrub
index ce7ab0eb8cf3c352dfc5ac1726b88cbbf953ff28..eda2aa1f4e0de8fb70749140e0f52f365277b7de 100755
--- a/tools/pygrub/src/pygrub
+++ b/tools/pygrub/src/pygrub
@@ -9,7 +9,7 @@
 # general public license.
 #
 # You should have received a copy of the GNU General Public License
-# along with this program; If not, see <http://www.gnu.org/licenses/>.
+# along with this program; If not, see <https://www.gnu.org/licenses/>.
 #
 
 from __future__ import print_function
diff --git a/tools/python/xen/lowlevel/xs/xs.c b/tools/python/xen/lowlevel/xs/xs.c
index 3ba5a8b893d9c0ce7b5aaf242242568910807d06..bb78f5b84bb6771ea6786cd14267cb8f9c4de3db 100644
--- a/tools/python/xen/lowlevel/xs/xs.c
+++ b/tools/python/xen/lowlevel/xs/xs.c
@@ -11,7 +11,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (C) 2005 Mike Wray Hewlett-Packard
  * Copyright (C) 2005 Christian Limpach <Christian.Limpach@cl.cam.ac.uk>
diff --git a/tools/tests/depriv/depriv-fd-checker.c b/tools/tests/depriv/depriv-fd-checker.c
index 98a27a03d5438b783c6ae4cf0c23591b48b57c93..bd0bdb2d54f2aeef910843e645e30bb6cc7b89c6 100644
--- a/tools/tests/depriv/depriv-fd-checker.c
+++ b/tools/tests/depriv/depriv-fd-checker.c
@@ -47,7 +47,7 @@
  *
  * You should have received a copy of the GNU Lesser General Public
  * License along with this library; If not, see
- * <http://www.gnu.org/licenses/>.
+ * <https://www.gnu.org/licenses/>.
  */
 
 #include <stdlib.h>
diff --git a/tools/tests/vhpet/emul.h b/tools/tests/vhpet/emul.h
index b022cc0eab0373f8e1896df6d710ad94afb3c62f..bec67fcea1361cabb858fae618a3907ba14f769f 100644
--- a/tools/tests/vhpet/emul.h
+++ b/tools/tests/vhpet/emul.h
@@ -10,7 +10,7 @@
  * This file is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details. <http://www.gnu.org/licenses/>.
+ * General Public License for more details. <https://www.gnu.org/licenses/>.
  */
 
 #include <stdio.h>
diff --git a/tools/tests/vhpet/main.c b/tools/tests/vhpet/main.c
index 4054eec6296910d3117334091b3dac190f9aea29..8452da8a60192b66f3980987a74caf19d48fff4c 100644
--- a/tools/tests/vhpet/main.c
+++ b/tools/tests/vhpet/main.c
@@ -10,7 +10,7 @@
  * This file is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details. <http://www.gnu.org/licenses/>.
+ * General Public License for more details. <https://www.gnu.org/licenses/>.
  */
 
 /*
diff --git a/tools/tests/vpci/emul.h b/tools/tests/vpci/emul.h
index f03e3a56d18121184f725c6003943fdb7c5e40eb..50f4c1b9d3e9067cbafdfdf25c77ddb8779cb139 100644
--- a/tools/tests/vpci/emul.h
+++ b/tools/tests/vpci/emul.h
@@ -13,7 +13,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef _TEST_VPCI_
diff --git a/tools/tests/vpci/main.c b/tools/tests/vpci/main.c
index b9a0a6006bb98c4b7d28ad5d2b9a20ecaff0352a..1348722947f2cad87ed9b39d195b35413bab97a3 100644
--- a/tools/tests/vpci/main.c
+++ b/tools/tests/vpci/main.c
@@ -13,7 +13,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "emul.h"
diff --git a/tools/tests/x86_emulator/blowfish.c b/tools/tests/x86_emulator/blowfish.c
index 8f0939c101879ad5fd2aab202b4619960f5231c0..7c02bbd3ac2219960ca6937e97956410381e417c 100644
--- a/tools/tests/x86_emulator/blowfish.c
+++ b/tools/tests/x86_emulator/blowfish.c
@@ -12,7 +12,7 @@ but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 Lesser General Public License for more details.
 You should have received a copy of the GNU Lesser General Public
-License along with this library; If not, see <http://www.gnu.org/licenses/>.
+License along with this library; If not, see <https://www.gnu.org/licenses/>.
 */
 
 #include <stdint.h>
diff --git a/tools/tests/xenstore/test-xenstore.c b/tools/tests/xenstore/test-xenstore.c
index d3574b3fa27025de7115b6c4dda80e8408141fe0..37bde5a67316ec853b6567f5ffd9e7fba57676d0 100644
--- a/tools/tests/xenstore/test-xenstore.c
+++ b/tools/tests/xenstore/test-xenstore.c
@@ -16,7 +16,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #define _GNU_SOURCE
diff --git a/tools/vchan/node-select.c b/tools/vchan/node-select.c
index 039464427a8b54f3a4bc8cd3d5de7bca1aaf9509..e885a05a33c4b1357b0c1ead5799cc9661ba58cd 100644
--- a/tools/vchan/node-select.c
+++ b/tools/vchan/node-select.c
@@ -21,7 +21,7 @@
  *  Lesser General Public License for more details.
  *
  *  You should have received a copy of the GNU Lesser General Public
- *  License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  License along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * @section DESCRIPTION
  *
diff --git a/tools/vchan/node.c b/tools/vchan/node.c
index f1638f013d3d5fc4f00427080848f8022ae7efed..d9720154aaa7801deee7669ff74b9005e83ce627 100644
--- a/tools/vchan/node.c
+++ b/tools/vchan/node.c
@@ -21,7 +21,7 @@
  *  Lesser General Public License for more details.
  *
  *  You should have received a copy of the GNU Lesser General Public
- *  License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  License along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * @section DESCRIPTION
  *
diff --git a/tools/vchan/vchan-socket-proxy.c b/tools/vchan/vchan-socket-proxy.c
index e1d959c6d15ce84e71bafcb512743d1c65f1dc07..72f16e05420b1c42b3b8cc6810932e49975cadc7 100644
--- a/tools/vchan/vchan-socket-proxy.c
+++ b/tools/vchan/vchan-socket-proxy.c
@@ -22,7 +22,7 @@
  *  Lesser General Public License for more details.
  *
  *  You should have received a copy of the GNU Lesser General Public
- *  License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  License along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * @section DESCRIPTION
  *
diff --git a/tools/xenmon/COPYING b/tools/xenmon/COPYING
index ec0f60d1ffd93b956159a23858b2393c58f26d4e..a7ee562a7c71f5ae42a698d0f3fc8cbabf919646 100644
--- a/tools/xenmon/COPYING
+++ b/tools/xenmon/COPYING
@@ -304,7 +304,7 @@ the "copyright" line and a pointer to where the full notice is found.
     GNU General Public License for more details.
 
     You should have received a copy of the GNU General Public License
-    along with this program; If not, see <http://www.gnu.org/licenses/>.
+    along with this program; If not, see <https://www.gnu.org/licenses/>.
 
 
 Also add information on how to contact you by electronic and paper mail.
diff --git a/tools/xenmon/setmask.c b/tools/xenmon/setmask.c
index 7e7b7b8f4378c4f690520a3e000b6f90ca0b9201..4452ceacf7151c6585cc28fa5e3b5527a84febea 100644
--- a/tools/xenmon/setmask.c
+++ b/tools/xenmon/setmask.c
@@ -20,7 +20,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <stdlib.h>
diff --git a/tools/xenmon/xenbaked.c b/tools/xenmon/xenbaked.c
index 4dddbd20e2fb39a4216f5efe351c13dee0305836..9df18480d5e5401d23871c68efd8e237d2ed7887 100644
--- a/tools/xenmon/xenbaked.c
+++ b/tools/xenmon/xenbaked.c
@@ -26,7 +26,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <time.h>
diff --git a/tools/xenmon/xenbaked.h b/tools/xenmon/xenbaked.h
index 9eeacbb5843a3af6efceb10bd953df3249ce8266..b2943edd8135fa132fd621c98fe8d639011b9cf8 100644
--- a/tools/xenmon/xenbaked.h
+++ b/tools/xenmon/xenbaked.h
@@ -19,7 +19,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __QOS_H__
diff --git a/tools/xenmon/xenmon.py b/tools/xenmon/xenmon.py
index 977ada68877139b783345980e78769efd47ca3f5..f37fc29afb573d8abcf6b4b66df97ad246462b64 100644
--- a/tools/xenmon/xenmon.py
+++ b/tools/xenmon/xenmon.py
@@ -20,7 +20,7 @@
 #   GNU General Public License for more details.
 # 
 #   You should have received a copy of the GNU General Public License
-#   along with this program; If not, see <http://www.gnu.org/licenses/>.
+#   along with this program; If not, see <https://www.gnu.org/licenses/>.
 #####################################################################
 
 from __future__ import print_function
diff --git a/tools/xenpaging/file_ops.c b/tools/xenpaging/file_ops.c
index 301fb3427cc5f8ca271fcc00343772e87efde76f..f13ba9848c26137c8f3c1cd7b82eb01efed48ace 100644
--- a/tools/xenpaging/file_ops.c
+++ b/tools/xenpaging/file_ops.c
@@ -15,7 +15,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 
diff --git a/tools/xenpaging/file_ops.h b/tools/xenpaging/file_ops.h
index ee3fd7d8b86c9d2a187daaf7aaa7c8a94a761aaa..5a9466fb587583bb727a42d6a82d8f062be1cea7 100644
--- a/tools/xenpaging/file_ops.h
+++ b/tools/xenpaging/file_ops.h
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 
diff --git a/tools/xenpaging/policy.h b/tools/xenpaging/policy.h
index b1425a90ef6d3bb5c5132354bb8abe4daf28a006..81356f9c18770988559a242bbcbfe801dd5d511b 100644
--- a/tools/xenpaging/policy.h
+++ b/tools/xenpaging/policy.h
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 
diff --git a/tools/xenpaging/policy_default.c b/tools/xenpaging/policy_default.c
index 979d251230451710de9087ee348bad47a2261d04..801dfa182d7b743fb9ec3db82e3bab7facc064cb 100644
--- a/tools/xenpaging/policy_default.c
+++ b/tools/xenpaging/policy_default.c
@@ -15,7 +15,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <errno.h>
diff --git a/tools/xenpaging/xenpaging.c b/tools/xenpaging/xenpaging.c
index 6e5490315d0128ed9065308675dab10de3a31c44..a579394b35c2bacbb9468adacbec86c696fd50c0 100644
--- a/tools/xenpaging/xenpaging.c
+++ b/tools/xenpaging/xenpaging.c
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #define _GNU_SOURCE
diff --git a/tools/xenpaging/xenpaging.h b/tools/xenpaging/xenpaging.h
index e0fc7b31b863b2c4390e6c9f317898f41a1005d2..a1a5074b9ee3b70a13b37102213114d6439e1abc 100644
--- a/tools/xenpaging/xenpaging.h
+++ b/tools/xenpaging/xenpaging.h
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 
diff --git a/tools/xenpmd/xenpmd.c b/tools/xenpmd/xenpmd.c
index 15e6169c449de77517de2cb67c21a5c5c4cd4851..f5a8513bc1b6da7fe45f09c31ac98412932dc3b5 100644
--- a/tools/xenpmd/xenpmd.c
+++ b/tools/xenpmd/xenpmd.c
@@ -18,7 +18,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 /* Xen extended power management support provides HVM guest power management
diff --git a/tools/xenstore/COPYING b/tools/xenstore/COPYING
index c764b2e3292196157cafb19aef908c9565146be4..00f925a24f36e388fca35ebb9ac1f188c6774ffd 100644
--- a/tools/xenstore/COPYING
+++ b/tools/xenstore/COPYING
@@ -494,7 +494,7 @@ notice is found.
     Lesser General Public License for more details.
 
     You should have received a copy of the GNU Lesser General Public
-    License along with this library; If not, see <http://www.gnu.org/licenses/>.
+    License along with this library; If not, see <https://www.gnu.org/licenses/>.
 
 Also add information on how to contact you by electronic and paper mail.
 
diff --git a/tools/xenstore/include/xenstore_state.h b/tools/xenstore/include/xenstore_state.h
index ae0d053c8ffc07c1e0491da647bcc40728d127f3..d949d3aa6522c0b0cc563fc3451e3e62cedc0c82 100644
--- a/tools/xenstore/include/xenstore_state.h
+++ b/tools/xenstore/include/xenstore_state.h
@@ -15,7 +15,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef XENSTORE_STATE_H
diff --git a/tools/xenstore/talloc.c b/tools/xenstore/talloc.c
index 9eda1bfc00c0b6b35d34ce25268fc9c070d9da55..91b620c2c604307f3fd662697ab152bcae7c1836 100644
--- a/tools/xenstore/talloc.c
+++ b/tools/xenstore/talloc.c
@@ -22,7 +22,7 @@
    Lesser General Public License for more details.
 
    You should have received a copy of the GNU Lesser General Public
-   License along with this library; If not, see <http://www.gnu.org/licenses/>.
+   License along with this library; If not, see <https://www.gnu.org/licenses/>.
 */
 
 /*
diff --git a/tools/xenstore/talloc.h b/tools/xenstore/talloc.h
index a0f4bff25788e6964cc42ad9f9c3b5af0fe4a49a..bd027e0f8db2873d9c0231a47baa03b69f9b75ca 100644
--- a/tools/xenstore/talloc.h
+++ b/tools/xenstore/talloc.h
@@ -21,7 +21,7 @@
    Lesser General Public License for more details.
 
    You should have received a copy of the GNU Lesser General Public
-   License along with this library; If not, see <http://www.gnu.org/licenses/>.
+   License along with this library; If not, see <https://www.gnu.org/licenses/>.
 */
 
 #include <sys/types.h>
diff --git a/tools/xenstore/tdb.c b/tools/xenstore/tdb.c
index 29593b76c308a928e109dec32aea7563dc5b2b8b..d53dfed7979aba9d9ad0f7113cb33a2bdadeb85b 100644
--- a/tools/xenstore/tdb.c
+++ b/tools/xenstore/tdb.c
@@ -22,7 +22,7 @@
    Lesser General Public License for more details.
 
    You should have received a copy of the GNU Lesser General Public
-   License along with this library; If not, see <http://www.gnu.org/licenses/>.
+   License along with this library; If not, see <https://www.gnu.org/licenses/>.
 */
 
 
diff --git a/tools/xenstore/tdb.h b/tools/xenstore/tdb.h
index ce3c7339f884af1fb381266d729148aefe62f8c7..4676b9058b554ee0b06d1f121e07bc1a40729678 100644
--- a/tools/xenstore/tdb.h
+++ b/tools/xenstore/tdb.h
@@ -25,7 +25,7 @@
    Lesser General Public License for more details.
 
    You should have received a copy of the GNU Lesser General Public
-   License along with this library; If not, see <http://www.gnu.org/licenses/>.
+   License along with this library; If not, see <https://www.gnu.org/licenses/>.
 */
 
 #ifdef  __cplusplus
diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index cbd62556c3ae50a9d539de14d28890c8d9a9f81a..3d8be860bdf9846c10edb4bde60b4d4e091a507e 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -13,7 +13,7 @@
     GNU General Public License for more details.
 
     You should have received a copy of the GNU General Public License
-    along with this program; If not, see <http://www.gnu.org/licenses/>.
+    along with this program; If not, see <https://www.gnu.org/licenses/>.
 */
 
 #include <assert.h>
diff --git a/tools/xenstore/xenstored_control.h b/tools/xenstore/xenstored_control.h
index a8cb76559ba1e4e13b9c12d14f82765afa090a2b..6ea1194d3ce214dc12a3e83525d47ad3aa3f1373 100644
--- a/tools/xenstore/xenstored_control.h
+++ b/tools/xenstore/xenstored_control.h
@@ -13,7 +13,7 @@
     GNU General Public License for more details.
 
     You should have received a copy of the GNU General Public License
-    along with this program; If not, see <http://www.gnu.org/licenses/>.
+    along with this program; If not, see <https://www.gnu.org/licenses/>.
 */
 
 int do_control(const void *ctx, struct connection *conn,
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 4f00e0cdc0cf30f57a9ab972e9b5752f83724856..5893dfa2560eb844e476d2e56ab06692d6299414 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -13,7 +13,7 @@
     GNU General Public License for more details.
 
     You should have received a copy of the GNU General Public License
-    along with this program; If not, see <http://www.gnu.org/licenses/>.
+    along with this program; If not, see <https://www.gnu.org/licenses/>.
 */
 
 #include <inttypes.h>
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index c59b06551f543b3909fdb6a49ef57ff9db000d45..3d9c6c66b987e412a3f7ddbe615391db7ec2157a 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -13,7 +13,7 @@
     GNU General Public License for more details.
 
     You should have received a copy of the GNU General Public License
-    along with this program; If not, see <http://www.gnu.org/licenses/>.
+    along with this program; If not, see <https://www.gnu.org/licenses/>.
 */
 
 #ifndef _XENSTORED_CORE_H
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 9ef41ede03ae16a86ad8274df9d53a0209c96a31..2dae7fc4bdf017c3980a1c7d51e43a667560de98 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -13,7 +13,7 @@
     GNU General Public License for more details.
 
     You should have received a copy of the GNU General Public License
-    along with this program; If not, see <http://www.gnu.org/licenses/>.
+    along with this program; If not, see <https://www.gnu.org/licenses/>.
 */
 
 #include <assert.h>
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index dc4660861eb752142e931d3c870e4c46228016d0..f5f5e0d71e1adb3be00717675b311634755a31d7 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -13,7 +13,7 @@
     GNU General Public License for more details.
 
     You should have received a copy of the GNU General Public License
-    along with this program; If not, see <http://www.gnu.org/licenses/>.
+    along with this program; If not, see <https://www.gnu.org/licenses/>.
 */
 
 #ifndef _XENSTORED_DOMAIN_H
diff --git a/tools/xenstore/xenstored_minios.c b/tools/xenstore/xenstored_minios.c
index aa384e50c8fec8297d9870ab3f8c9275fd20babd..3f5ceef9fc9380fdeb9922bfd2391a2dc7c84f8d 100644
--- a/tools/xenstore/xenstored_minios.c
+++ b/tools/xenstore/xenstored_minios.c
@@ -13,7 +13,7 @@
     GNU General Public License for more details.
 
     You should have received a copy of the GNU General Public License
-    along with this program; If not, see <http://www.gnu.org/licenses/>.
+    along with this program; If not, see <https://www.gnu.org/licenses/>.
 */
 #include <sys/types.h>
 #include <sys/mman.h>
diff --git a/tools/xenstore/xenstored_posix.c b/tools/xenstore/xenstored_posix.c
index b20504d1b656b004e5d0dd5cc77cef80d24d9f7f..c422ac1d44d399d2b5ecda0508b07cbdaf0e2128 100644
--- a/tools/xenstore/xenstored_posix.c
+++ b/tools/xenstore/xenstored_posix.c
@@ -13,7 +13,7 @@
     GNU General Public License for more details.
 
     You should have received a copy of the GNU General Public License
-    along with this program; If not, see <http://www.gnu.org/licenses/>.
+    along with this program; If not, see <https://www.gnu.org/licenses/>.
 */
 
 #include <sys/types.h>
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index 1aa9d3cb3dce2792256e0f373f1f6e65f8523e35..f347c4fb8e367f993aaebfe7aa92d78c44a59f64 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -13,7 +13,7 @@
     GNU General Public License for more details.
 
     You should have received a copy of the GNU General Public License
-    along with this program; If not, see <http://www.gnu.org/licenses/>.
+    along with this program; If not, see <https://www.gnu.org/licenses/>.
 */
 
 #include <inttypes.h>
diff --git a/tools/xenstore/xenstored_transaction.h b/tools/xenstore/xenstored_transaction.h
index b6f8cb7d0a3b13d9f68eed1fc2443b8ac40c33b8..4e2eb585ebd194fc114a8fa630ec6befc165cf16 100644
--- a/tools/xenstore/xenstored_transaction.h
+++ b/tools/xenstore/xenstored_transaction.h
@@ -13,7 +13,7 @@
     GNU General Public License for more details.
 
     You should have received a copy of the GNU General Public License
-    along with this program; If not, see <http://www.gnu.org/licenses/>.
+    along with this program; If not, see <https://www.gnu.org/licenses/>.
 */
 #ifndef _XENSTORED_TRANSACTION_H
 #define _XENSTORED_TRANSACTION_H
diff --git a/tools/xenstore/xenstored_watch.c b/tools/xenstore/xenstored_watch.c
index 8ad0229df648361a40435927f85c4341f72f3658..a2d1054bb581b4733bc5ca2a386a0d59cbe85b4e 100644
--- a/tools/xenstore/xenstored_watch.c
+++ b/tools/xenstore/xenstored_watch.c
@@ -13,7 +13,7 @@
     GNU General Public License for more details.
 
     You should have received a copy of the GNU General Public License
-    along with this program; If not, see <http://www.gnu.org/licenses/>.
+    along with this program; If not, see <https://www.gnu.org/licenses/>.
 */
 
 #include <stdio.h>
diff --git a/tools/xenstore/xenstored_watch.h b/tools/xenstore/xenstored_watch.h
index 091890edca966c4e714fd77397f48f4122aecf73..51f7f64ff4ff911754380e7447cf0600ce13eb8f 100644
--- a/tools/xenstore/xenstored_watch.h
+++ b/tools/xenstore/xenstored_watch.h
@@ -13,7 +13,7 @@
     GNU General Public License for more details.
 
     You should have received a copy of the GNU General Public License
-    along with this program; If not, see <http://www.gnu.org/licenses/>.
+    along with this program; If not, see <https://www.gnu.org/licenses/>.
 */
 
 #ifndef _XENSTORED_WATCH_H
diff --git a/tools/xenstore/xs_lib.c b/tools/xenstore/xs_lib.c
index b9941c567cd0559ee76431e9eee525cf0f3ea30c..e8cf37d0bb092efe24be6544743301c2cefd7aff 100644
--- a/tools/xenstore/xs_lib.c
+++ b/tools/xenstore/xs_lib.c
@@ -13,7 +13,7 @@
     Lesser General Public License for more details.
 
     You should have received a copy of the GNU Lesser General Public
-    License along with this library; If not, see <http://www.gnu.org/licenses/>.
+    License along with this library; If not, see <https://www.gnu.org/licenses/>.
 */
 
 #include <assert.h>
diff --git a/tools/xenstore/xs_lib.h b/tools/xenstore/xs_lib.h
index efa05997d67c30f75be28f0389980117351f396f..78a0a9549a51cf6030b9d37a5ac1464771eca1a2 100644
--- a/tools/xenstore/xs_lib.h
+++ b/tools/xenstore/xs_lib.h
@@ -13,7 +13,7 @@
     Lesser General Public License for more details.
 
     You should have received a copy of the GNU Lesser General Public
-    License along with this library; If not, see <http://www.gnu.org/licenses/>.
+    License along with this library; If not, see <https://www.gnu.org/licenses/>.
 */
 
 #ifndef XS_LIB_H
diff --git a/tools/xentop/xentop.c b/tools/xentop/xentop.c
index 950e8935c4c149f9bcd15eeb8691837d0ea881a4..0037f4f1f30e786152631ab89b47d0f1f4967d80 100644
--- a/tools/xentop/xentop.c
+++ b/tools/xentop/xentop.c
@@ -15,7 +15,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 /* get curses header from configure */
diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index 5de167031e01d73a7e3fdfa1b8bd67352b2b45d9..e555e0cca37a939818f95b6314b105bf87461d9a 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -16,7 +16,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 #define _XOPEN_SOURCE 600
 #include <stdio.h>
diff --git a/xen/COPYING b/xen/COPYING
index ddb3494147a1312ffb8120c9486eea0d21ec4718..e76aa91592a88ed1510ef6fa8066050d89af6c14 100644
--- a/xen/COPYING
+++ b/xen/COPYING
@@ -331,7 +331,7 @@ the "copyright" line and a pointer to where the full notice is found.
     GNU General Public License for more details.
 
     You should have received a copy of the GNU General Public License
-    along with this program; If not, see <http://www.gnu.org/licenses/>.
+    along with this program; If not, see <https://www.gnu.org/licenses/>.
 
 
 Also add information on how to contact you by electronic and paper mail.
diff --git a/xen/arch/arm/acpi/boot.c b/xen/arch/arm/acpi/boot.c
index db5085e15d84321b6d05aa338ffbf25e26ec8913..dda7b4e74e76490a0a77a0db020d4ac3a45a5f0e 100644
--- a/xen/arch/arm/acpi/boot.c
+++ b/xen/arch/arm/acpi/boot.c
@@ -19,7 +19,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
diff --git a/xen/arch/arm/acpi/lib.c b/xen/arch/arm/acpi/lib.c
index 41d521f720ac5fe4fe2a2f5f2e1f82b4add3ceba..482dac701f340373071b3233c64fc762b732ed60 100644
--- a/xen/arch/arm/acpi/lib.c
+++ b/xen/arch/arm/acpi/lib.c
@@ -16,7 +16,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
diff --git a/xen/arch/arm/arm32/insn.c b/xen/arch/arm/arm32/insn.c
index 49953a042aee62a56e6785ed030ece3848701169..b8ea6005419221f2333746ddbbaf8fb2d257c308 100644
--- a/xen/arch/arm/arm32/insn.c
+++ b/xen/arch/arm/arm32/insn.c
@@ -11,7 +11,7 @@
   * GNU General Public License for more details.
   *
   * You should have received a copy of the GNU General Public License
-  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+  * along with this program.  If not, see <https://www.gnu.org/licenses/>.
   */
 #include <xen/lib.h>
 #include <xen/bitops.h>
diff --git a/xen/arch/arm/arm32/lib/bitops.c b/xen/arch/arm/arm32/lib/bitops.c
index ceddd76d1b008e3c9f712fdf686fca979401eb51..6df685a0e910e29d1f2b64ca6eaa445325959fa6 100644
--- a/xen/arch/arm/arm32/lib/bitops.c
+++ b/xen/arch/arm/arm32/lib/bitops.c
@@ -11,7 +11,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/bitops.h>
diff --git a/xen/arch/arm/arm32/lib/lib1funcs.S b/xen/arch/arm/arm32/lib/lib1funcs.S
index f1278bd6c1399414b4fc28fd3c7d93b5db6156a4..8b766baa00437ff9bcf35490f3a1af09d2274e39 100644
--- a/xen/arch/arm/arm32/lib/lib1funcs.S
+++ b/xen/arch/arm/arm32/lib/lib1funcs.S
@@ -28,7 +28,7 @@ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 General Public License for more details.
 
 You should have received a copy of the GNU General Public License
-along with this program; see the file COPYING.  If not, see <http://www.gnu.org/licenses/>.  */
+along with this program; see the file COPYING.  If not, see <https://www.gnu.org/licenses/>.  */
 
 
 #include "assembler.h"
diff --git a/xen/arch/arm/arm32/lib/lshrdi3.S b/xen/arch/arm/arm32/lib/lshrdi3.S
index 88b9655282abde3598fc2396da24877c450d821b..e1470e657022dfa05e2e230f9da75cc38ca03605 100644
--- a/xen/arch/arm/arm32/lib/lshrdi3.S
+++ b/xen/arch/arm/arm32/lib/lshrdi3.S
@@ -21,7 +21,7 @@ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 General Public License for more details.
 
 You should have received a copy of the GNU General Public License
-along with this program; see the file COPYING.  If not, see <http://www.gnu.org/licenses/>.  */
+along with this program; see the file COPYING.  If not, see <https://www.gnu.org/licenses/>.  */
 
 
 #include "assembler.h"
diff --git a/xen/arch/arm/arm64/bpi.S b/xen/arch/arm/arm64/bpi.S
index 4e638252204893ce8fe38b81c45639d256f29be2..79831dc026243e1b5fd8e1af87a46b9eee4c02c7 100644
--- a/xen/arch/arm/arm64/bpi.S
+++ b/xen/arch/arm/arm64/bpi.S
@@ -13,7 +13,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <asm/smccc.h>
diff --git a/xen/arch/arm/arm64/cache.S b/xen/arch/arm/arm64/cache.S
index 9a88a2b49731f2196cae99112bc3b5b33548c179..01f514c169251e9d58fa0b71a23ffb1ce425d135 100644
--- a/xen/arch/arm/arm64/cache.S
+++ b/xen/arch/arm/arm64/cache.S
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <asm/alternative.h>
diff --git a/xen/arch/arm/arm64/debug-meson.inc b/xen/arch/arm/arm64/debug-meson.inc
index e65e1ccde4823521b275de7f133c2db12fbde693..67e91fee21d61f712ed9d13efb30e2d3d124eaeb 100644
--- a/xen/arch/arm/arm64/debug-meson.inc
+++ b/xen/arch/arm/arm64/debug-meson.inc
@@ -15,7 +15,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #define AML_UART_WFIFO_REG      0x00
diff --git a/xen/arch/arm/arm64/debug-mvebu.inc b/xen/arch/arm/arm64/debug-mvebu.inc
index 63b12dc3d37bb429a1eda25731b75b8126d0c279..72edc5e23ce721e74d686da90a4da21246c0eb0e 100644
--- a/xen/arch/arm/arm64/debug-mvebu.inc
+++ b/xen/arch/arm/arm64/debug-mvebu.inc
@@ -15,7 +15,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #define UART_STATUS_REG     0x0c
diff --git a/xen/arch/arm/arm64/insn.c b/xen/arch/arm/arm64/insn.c
index 22f2bdebd544f7e5f789361844bf14e73f15c604..2f55c243f3b67e19ee201d73ee0dbf4047c33745 100644
--- a/xen/arch/arm/arm64/insn.c
+++ b/xen/arch/arm/arm64/insn.c
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 #include <xen/types.h>
 #include <xen/lib.h>
diff --git a/xen/arch/arm/arm64/lib/bitops.c b/xen/arch/arm/arm64/lib/bitops.c
index 20e3f3d6ceafc0f66310d6dccab1c78e3afd8702..6b638b7632d1dad5f2594d5acd46bf6e1b4d7a41 100644
--- a/xen/arch/arm/arm64/lib/bitops.c
+++ b/xen/arch/arm/arm64/lib/bitops.c
@@ -11,7 +11,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/bitops.h>
diff --git a/xen/arch/arm/arm64/lib/clear_page.S b/xen/arch/arm/arm64/lib/clear_page.S
index a767e63686d872210ca4f7c0aa3400868ec6f67d..2185c0987e1c630d5eed09344b2e88d8df0833a1 100644
--- a/xen/arch/arm/arm64/lib/clear_page.S
+++ b/xen/arch/arm/arm64/lib/clear_page.S
@@ -11,7 +11,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/page-size.h>
diff --git a/xen/arch/arm/arm64/lib/memchr.S b/xen/arch/arm/arm64/lib/memchr.S
index 81f113bb1cabbc240d3b04fa427f37bb4dc86531..0becb12666288bd9cab299ec4590b5f70873752e 100644
--- a/xen/arch/arm/arm64/lib/memchr.S
+++ b/xen/arch/arm/arm64/lib/memchr.S
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "assembler.h"
diff --git a/xen/arch/arm/arm64/lib/memcmp.S b/xen/arch/arm/arm64/lib/memcmp.S
index d9cd1d786f34a0a2b79483d7f7672f44b244f3e7..85c02580ceccdd12db0bed9aca604146a61e9a31 100644
--- a/xen/arch/arm/arm64/lib/memcmp.S
+++ b/xen/arch/arm/arm64/lib/memcmp.S
@@ -19,7 +19,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "assembler.h"
diff --git a/xen/arch/arm/arm64/lib/memcpy.S b/xen/arch/arm/arm64/lib/memcpy.S
index e7a667c2be280d9a5a4b8d991cbbf645ace5374e..b6bd157ca4da645f4df5b0b3fc0d55fdeebf1681 100644
--- a/xen/arch/arm/arm64/lib/memcpy.S
+++ b/xen/arch/arm/arm64/lib/memcpy.S
@@ -19,7 +19,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <asm/cache.h>
diff --git a/xen/arch/arm/arm64/lib/memmove.S b/xen/arch/arm/arm64/lib/memmove.S
index 35d9b62fa0bb2430f65def7b0c0fc8e6cb04dec3..00e790e5c03d5f985bd7272c717a5ceac5a3fb08 100644
--- a/xen/arch/arm/arm64/lib/memmove.S
+++ b/xen/arch/arm/arm64/lib/memmove.S
@@ -19,7 +19,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <asm/cache.h>
diff --git a/xen/arch/arm/arm64/lib/memset.S b/xen/arch/arm/arm64/lib/memset.S
index 5ce1db2e76e4a06bb51e8b5acc9f3ae0cb9313c4..d4c906ec409fb039c68129c7fab3b04c45f87961 100644
--- a/xen/arch/arm/arm64/lib/memset.S
+++ b/xen/arch/arm/arm64/lib/memset.S
@@ -19,7 +19,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <asm/cache.h>
diff --git a/xen/arch/arm/arm64/lib/strchr.S b/xen/arch/arm/arm64/lib/strchr.S
index 0506b0ff7f3aef45d2ef9932d071a7100253b5f4..e3fd8a263cec7d9ea1de5227891bffa4f070e759 100644
--- a/xen/arch/arm/arm64/lib/strchr.S
+++ b/xen/arch/arm/arm64/lib/strchr.S
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
 
diff --git a/xen/arch/arm/arm64/lib/strcmp.S b/xen/arch/arm/arm64/lib/strcmp.S
index 5492a8482fa59e0463042f2deb4ef3ca515f24d5..793da9658b64b343b962b9ea47ecc51b317d4eae 100644
--- a/xen/arch/arm/arm64/lib/strcmp.S
+++ b/xen/arch/arm/arm64/lib/strcmp.S
@@ -19,7 +19,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "assembler.h"
diff --git a/xen/arch/arm/arm64/lib/strlen.S b/xen/arch/arm/arm64/lib/strlen.S
index d8d513d18f87d5ff36539dfd6f85dece8ba9ec66..439d4c0c9f5caf2fde899c8c1844b2b82bb84b7a 100644
--- a/xen/arch/arm/arm64/lib/strlen.S
+++ b/xen/arch/arm/arm64/lib/strlen.S
@@ -19,7 +19,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "assembler.h"
diff --git a/xen/arch/arm/arm64/lib/strncmp.S b/xen/arch/arm/arm64/lib/strncmp.S
index 90d3eb67055577f3d4514221d48ab69edcda202d..71c6a6404b1480c912b136bf072033c01a617851 100644
--- a/xen/arch/arm/arm64/lib/strncmp.S
+++ b/xen/arch/arm/arm64/lib/strncmp.S
@@ -19,7 +19,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
 
diff --git a/xen/arch/arm/arm64/lib/strnlen.S b/xen/arch/arm/arm64/lib/strnlen.S
index 9e2683790b1f33d3d12ec03f758c2c8a62f0baf1..4ad5c9a954e9bd969a9b3c328ff588d59b274702 100644
--- a/xen/arch/arm/arm64/lib/strnlen.S
+++ b/xen/arch/arm/arm64/lib/strnlen.S
@@ -19,7 +19,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
 
diff --git a/xen/arch/arm/arm64/lib/strrchr.S b/xen/arch/arm/arm64/lib/strrchr.S
index 07059983f828cdbe0b29cd615987172c8336fa8d..19118c6b9844a6e4613b1e5a6724a944c95a55dc 100644
--- a/xen/arch/arm/arm64/lib/strrchr.S
+++ b/xen/arch/arm/arm64/lib/strrchr.S
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
 /*
diff --git a/xen/arch/arm/efi/efi-dom0.c b/xen/arch/arm/efi/efi-dom0.c
index aae0f979112ae8cd81d0dfd9785f14fa814aa411..fb75d7db75cf5c619087377961036a0a61112e8e 100644
--- a/xen/arch/arm/efi/efi-dom0.c
+++ b/xen/arch/arm/efi/efi-dom0.c
@@ -16,7 +16,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
diff --git a/xen/arch/arm/include/asm/acpi.h b/xen/arch/arm/include/asm/acpi.h
index e53973e0542b6aa7d8a32c325c47f343e2c4438b..3b61a82c31c297c08d0bb2f5221e8dba32fee3e0 100644
--- a/xen/arch/arm/include/asm/acpi.h
+++ b/xen/arch/arm/include/asm/acpi.h
@@ -14,7 +14,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
diff --git a/xen/arch/arm/include/asm/altp2m.h b/xen/arch/arm/include/asm/altp2m.h
index df50cb2f0988f344a5e1bf065157a0a98ece4db6..ed325988130686a7808b242edf162b3afbfaa517 100644
--- a/xen/arch/arm/include/asm/altp2m.h
+++ b/xen/arch/arm/include/asm/altp2m.h
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_ARM_ALTP2M_H
diff --git a/xen/arch/arm/include/asm/arm32/insn.h b/xen/arch/arm/include/asm/arm32/insn.h
index c800cbfff544f5240a80e2635caf6ca742562784..48ee26fa02c8d7428b53e6ed66c5952431760afe 100644
--- a/xen/arch/arm/include/asm/arm32/insn.h
+++ b/xen/arch/arm/include/asm/arm32/insn.h
@@ -11,7 +11,7 @@
   * GNU General Public License for more details.
   *
   * You should have received a copy of the GNU General Public License
-  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+  * along with this program.  If not, see <https://www.gnu.org/licenses/>.
   */
 #ifndef __ARCH_ARM_ARM32_INSN
 #define __ARCH_ARM_ARM32_INSN
diff --git a/xen/arch/arm/include/asm/arm64/atomic.h b/xen/arch/arm/include/asm/arm64/atomic.h
index 2d425678660b90f2417317bc66c16691b5679c12..fbc4bff39d15d3428b6d5c35e3484231aeeed7e9 100644
--- a/xen/arch/arm/include/asm/arm64/atomic.h
+++ b/xen/arch/arm/include/asm/arm64/atomic.h
@@ -17,7 +17,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 #ifndef __ARCH_ARM_ARM64_ATOMIC
 #define __ARCH_ARM_ARM64_ATOMIC
diff --git a/xen/arch/arm/include/asm/arm64/insn.h b/xen/arch/arm/include/asm/arm64/insn.h
index 4e0d364d412869615bb02a42a841db2eb717989b..44eb394b07b36ccbdbeaa6a0f031b0c73d262612 100644
--- a/xen/arch/arm/include/asm/arm64/insn.h
+++ b/xen/arch/arm/include/asm/arm64/insn.h
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 #ifndef __ARCH_ARM_ARM64_INSN
 #define __ARCH_ARM_ARM64_INSN
diff --git a/xen/arch/arm/include/asm/arm64/io.h b/xen/arch/arm/include/asm/arm64/io.h
index 2e2ab24f7838b56c9fb9968f0a98f1e7a1c8e6b4..4f98dbbdfe4929f40c6c4409311f4a6d76d92ea7 100644
--- a/xen/arch/arm/include/asm/arm64/io.h
+++ b/xen/arch/arm/include/asm/arm64/io.h
@@ -15,7 +15,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 #ifndef _ARM_ARM64_IO_H
 #define _ARM_ARM64_IO_H
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/asm/gic_v3_its.h
index fae3f6ecefe99fe7841d1d1fef5b9cd6571f8634..7f2d125288167cfb923b24124ad13ff647623179 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_ARM_ITS_H__
diff --git a/xen/arch/arm/include/asm/iommu.h b/xen/arch/arm/include/asm/iommu.h
index d57bd8a38ccd4b042e6a72d54bf326ebed411af9..c12a45e5c6a177b5e2da4006ab49836f000921e8 100644
--- a/xen/arch/arm/include/asm/iommu.h
+++ b/xen/arch/arm/include/asm/iommu.h
@@ -9,7 +9,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
 */
 #ifndef __ARCH_ARM_IOMMU_H__
 #define __ARCH_ARM_IOMMU_H__
diff --git a/xen/arch/arm/include/asm/iommu_fwspec.h b/xen/arch/arm/include/asm/iommu_fwspec.h
index 5cdb53f8e84bd09b22bc03be9e4481717a5e715a..0cabb191c4da18e91ef8c3bdcfc6f981a201ac8c 100644
--- a/xen/arch/arm/include/asm/iommu_fwspec.h
+++ b/xen/arch/arm/include/asm/iommu_fwspec.h
@@ -21,7 +21,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ARCH_ARM_IOMMU_FWSPEC_H__
diff --git a/xen/arch/arm/include/asm/ioreq.h b/xen/arch/arm/include/asm/ioreq.h
index 50185978d51621ec9978aef89f92226891433a88..fd1e775d10d9aa8e0bf16a3dd918dd36aaf38c04 100644
--- a/xen/arch/arm/include/asm/ioreq.h
+++ b/xen/arch/arm/include/asm/ioreq.h
@@ -14,7 +14,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_ARM_IOREQ_H__
diff --git a/xen/arch/arm/include/asm/mem_access.h b/xen/arch/arm/include/asm/mem_access.h
index 35ed0ad15471c3a4e2eddc5810668c3ef152619b..7920f856822415149ed0cabc0aa919fed3ba81e7 100644
--- a/xen/arch/arm/include/asm/mem_access.h
+++ b/xen/arch/arm/include/asm/mem_access.h
@@ -11,7 +11,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef _ASM_ARM_MEM_ACCESS_H
diff --git a/xen/arch/arm/include/asm/monitor.h b/xen/arch/arm/include/asm/monitor.h
index 7567be66bdc5b314943caaba73d9f891bafab43c..01619b6eefebc3a08f555ff37fe58417a87be379 100644
--- a/xen/arch/arm/include/asm/monitor.h
+++ b/xen/arch/arm/include/asm/monitor.h
@@ -16,7 +16,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_ARM_MONITOR_H__
diff --git a/xen/arch/arm/include/asm/new_vgic.h b/xen/arch/arm/include/asm/new_vgic.h
index b7fa9ab11a0bb991cd475c6dadff650a73a4af4b..bac6f778dcdfae836cde88c39ef065cd8fd19fcd 100644
--- a/xen/arch/arm/include/asm/new_vgic.h
+++ b/xen/arch/arm/include/asm/new_vgic.h
@@ -11,7 +11,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 #ifndef __ASM_ARM_NEW_VGIC_H
 #define __ASM_ARM_NEW_VGIC_H
diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
index 8cb46f6b718597a8b620bb02e2097579d7e00f35..7c1f75970c474a3cb2724c3b66d03ce2d9e44c3a 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -9,7 +9,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ARM_PCI_H__
diff --git a/xen/arch/arm/include/asm/vm_event.h b/xen/arch/arm/include/asm/vm_event.h
index abe7db1970cab6e102ae670f6ea15d7ddd7023e1..1cfcc46f1410a44ce13411a59a937d4d985e7dd8 100644
--- a/xen/arch/arm/include/asm/vm_event.h
+++ b/xen/arch/arm/include/asm/vm_event.h
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_ARM_VM_EVENT_H__
diff --git a/xen/arch/arm/include/asm/vpl011.h b/xen/arch/arm/include/asm/vpl011.h
index c09abcd7a9b3356d0809743517934adae00087f5..61d66ed2f62827f47228ef57ed4fb886f662d7d7 100644
--- a/xen/arch/arm/include/asm/vpl011.h
+++ b/xen/arch/arm/include/asm/vpl011.h
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef _VPL011_H_
diff --git a/xen/arch/arm/include/asm/vpsci.h b/xen/arch/arm/include/asm/vpsci.h
index 0cca5e6830b8c72963aa5607a38c0a09ae224aad..1b3546739242f738939b83482cbbd0386cceb997 100644
--- a/xen/arch/arm/include/asm/vpsci.h
+++ b/xen/arch/arm/include/asm/vpsci.h
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_VPSCI_H__
diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
index 3987f96b01783e0d96b5c2b729bbea72bae0c57e..da1d19a9d8d2807f723af352c5adace68f25795a 100644
--- a/xen/arch/arm/pci/ecam.c
+++ b/xen/arch/arm/pci/ecam.c
@@ -11,7 +11,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/pci.h>
diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
index 9f9aac43d7e9b30e01b1afe1ecf37101981582bc..8a3a476eae2172d61cf13a5d56bf229bfac85761 100644
--- a/xen/arch/arm/pci/pci-access.c
+++ b/xen/arch/arm/pci/pci-access.c
@@ -9,7 +9,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/pci.h>
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index a8ece94303ca8070e8a6c2d5bc326ed4ae11d22a..e603dcf3d03f1d575078099ff4a80069cfaaf6ec 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -13,7 +13,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-host-generic.c
index 46de6e43cc722adda4a20aa9e1cead2a528ddca3..ab262f0f7678c73cc03a181d3904e9074732da67 100644
--- a/xen/arch/arm/pci/pci-host-generic.c
+++ b/xen/arch/arm/pci/pci-host-generic.c
@@ -12,7 +12,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host-zynqmp.c
index 101edb8593c1e9b3647b00aaccf1b44c56ebb2f1..1d63769bace8520bcd995ac37fb094628f505c9f 100644
--- a/xen/arch/arm/pci/pci-host-zynqmp.c
+++ b/xen/arch/arm/pci/pci-host-zynqmp.c
@@ -13,7 +13,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index 78b97beaef12e85771602af4b296e075596affb7..1cc61272e02a32bc3f541aa80dacf5d42922a6b0 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -9,7 +9,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/acpi.h>
diff --git a/xen/arch/arm/platforms/thunderx.c b/xen/arch/arm/platforms/thunderx.c
index 9b32a29c6b05eff94847189c1de7b69609720a9f..f46f3344294123091bb7d857a480dd385e2f38d5 100644
--- a/xen/arch/arm/platforms/thunderx.c
+++ b/xen/arch/arm/platforms/thunderx.c
@@ -15,7 +15,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <asm/platform.h>
diff --git a/xen/arch/arm/vgic/vgic-init.c b/xen/arch/arm/vgic/vgic-init.c
index 62ae5536997be5d0be7eae2cbc9e89be63d81185..dfbe1b03f1c1cd1bfd8aeeff3d0a602a1843d6da 100644
--- a/xen/arch/arm/vgic/vgic-init.c
+++ b/xen/arch/arm/vgic/vgic-init.c
@@ -12,7 +12,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/lib.h>
diff --git a/xen/arch/arm/vgic/vgic-mmio.h b/xen/arch/arm/vgic/vgic-mmio.h
index 3566cf237cee2c15bde3fb32e9a3b12c98cb1e1d..2203f87dd835271b6671cb2503100853267621cc 100644
--- a/xen/arch/arm/vgic/vgic-mmio.h
+++ b/xen/arch/arm/vgic/vgic-mmio.h
@@ -11,7 +11,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 #ifndef __XEN_ARM_VGIC_VGIC_MMIO_H__
 #define __XEN_ARM_VGIC_VGIC_MMIO_H__
diff --git a/xen/arch/arm/vgic/vgic-v2.c b/xen/arch/arm/vgic/vgic-v2.c
index 1a99d3a8b48446cbd031e325c941580e8a9ec7a8..11efab7b3e074b375177dbfc63e4c051d1bf2681 100644
--- a/xen/arch/arm/vgic/vgic-v2.c
+++ b/xen/arch/arm/vgic/vgic-v2.c
@@ -12,7 +12,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <asm/new_vgic.h>
diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
index f0f2ea502195901d6c9654f00ae9e330eff95215..b4a177106dc497642d780b91ca99f82b2cc51481 100644
--- a/xen/arch/arm/vgic/vgic.c
+++ b/xen/arch/arm/vgic/vgic.c
@@ -12,7 +12,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/list_sort.h>
diff --git a/xen/arch/arm/vgic/vgic.h b/xen/arch/arm/vgic/vgic.h
index 534b24bcd3f431a389cb866747535929e5622a8b..c2a1bef3dd9d0ac997205270401e978917133c71 100644
--- a/xen/arch/arm/vgic/vgic.h
+++ b/xen/arch/arm/vgic/vgic.h
@@ -12,7 +12,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 #ifndef __XEN_ARM_VGIC_VGIC_H__
 #define __XEN_ARM_VGIC_VGIC_H__
diff --git a/xen/arch/x86/acpi/boot.c b/xen/arch/x86/acpi/boot.c
index 54b72d716beda91bfee09b62e6e7e8ba12ece5c8..4e04bf4d6177c455959cc89f535cb0e054f0685b 100644
--- a/xen/arch/x86/acpi/boot.c
+++ b/xen/arch/x86/acpi/boot.c
@@ -17,7 +17,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 427c8c89c5c438d610de3470f0daf1840c7cb0ee..ec879af0c10452a5159a0a9379dd816c650f1cd6 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -25,7 +25,7 @@
  *  General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License along
- *  with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index c27cbb2304f27dbb0dbde0b74322a006d860dccc..c21794715cebef404ba9da17692bf6bffabbc49b 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -22,7 +22,7 @@
  *  General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License along
- *  with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
index d4c7dcd5d99d239462ba6c523a94ee8e970ba141..3fb3e1a5faf6fa937086606957042728083d5364 100644
--- a/xen/arch/x86/acpi/cpufreq/powernow.c
+++ b/xen/arch/x86/acpi/cpufreq/powernow.c
@@ -16,7 +16,7 @@
  *  General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License along
- *  with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
diff --git a/xen/arch/x86/acpi/cpuidle_menu.c b/xen/arch/x86/acpi/cpuidle_menu.c
index a275436d799c9440f3895d00cbf9bec48ce15b9d..66d95fc1450a0e2d11d70ceb76bb594db5738e9b 100644
--- a/xen/arch/x86/acpi/cpuidle_menu.c
+++ b/xen/arch/x86/acpi/cpuidle_menu.c
@@ -18,7 +18,7 @@
  *  General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License along
- *  with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
diff --git a/xen/arch/x86/acpi/lib.c b/xen/arch/x86/acpi/lib.c
index 43831b92d1322ba4cc3c65ceebc7e88bcfefe484..895b52c3ab1f9e325b594199c49d7e45e6e38382 100644
--- a/xen/arch/x86/acpi/lib.c
+++ b/xen/arch/x86/acpi/lib.c
@@ -14,7 +14,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 0c6fc7b4fb0cb3d961f020dade3e3d42fede5c40..f715bcf1575c2d1ec7860481cdabd57257787de7 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -12,7 +12,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/delay.h>
diff --git a/xen/arch/x86/boot/build32.lds b/xen/arch/x86/boot/build32.lds
index 56edaa727be77424d09f0e525be76f7c7b0403c2..a00183a28b8c63d9a523e5d5f79a0f58303072cd 100644
--- a/xen/arch/x86/boot/build32.lds
+++ b/xen/arch/x86/boot/build32.lds
@@ -12,7 +12,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License along
- * with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
 ENTRY(_start)
diff --git a/xen/arch/x86/boot/cmdline.c b/xen/arch/x86/boot/cmdline.c
index fc11c6d3c5c45fc8cdcd51ddd12923bfee3c0447..ffd5d060686e2b01ea74ea0418ac7f01e86feae2 100644
--- a/xen/arch/x86/boot/cmdline.c
+++ b/xen/arch/x86/boot/cmdline.c
@@ -12,7 +12,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License along
- * with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * with this program.  If not, see <https://www.gnu.org/licenses/>.
  *
  * strlen(), strncmp(), strchr(), strspn() and strcspn() were copied from
  * Linux kernel source (linux/lib/string.c).
diff --git a/xen/arch/x86/boot/defs.h b/xen/arch/x86/boot/defs.h
index f9840044ec69636525e3a028058328d1dca2f324..95cfb053b7a827308680884331315c927a7b67b4 100644
--- a/xen/arch/x86/boot/defs.h
+++ b/xen/arch/x86/boot/defs.h
@@ -12,7 +12,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License along
- * with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * with this program.  If not, see <https://www.gnu.org/licenses/>.
  *
  * max() was copied from xen/xen/include/xen/kernel.h.
  */
diff --git a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c b/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
index be44d7f611b1c06ce00dd5ff73c696b3d616ccd1..c9d124ec9901f5eff26e4c68cb5abb4b8fa6203a 100644
--- a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
+++ b/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
@@ -13,7 +13,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 
diff --git a/xen/arch/x86/cpu/mcheck/mce-apei.c b/xen/arch/x86/cpu/mcheck/mce-apei.c
index 53b6735896bf105e22f38400f8a02e1ed422a5a2..1e21265fd510b647be80dc56090ddf1711c6d2fc 100644
--- a/xen/arch/x86/cpu/mcheck/mce-apei.c
+++ b/xen/arch/x86/cpu/mcheck/mce-apei.c
@@ -25,7 +25,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/kernel.h>
diff --git a/xen/arch/x86/cpu/mcheck/mce_amd.c b/xen/arch/x86/cpu/mcheck/mce_amd.c
index 98c630fc86295ca38e248f9db8329e2a15794bda..67ea5db8c0c8754bd1c19cb03585f74539d13db5 100644
--- a/xen/arch/x86/cpu/mcheck/mce_amd.c
+++ b/xen/arch/x86/cpu/mcheck/mce_amd.c
@@ -13,7 +13,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 /* K8 common MCA documentation published at
@@ -24,7 +24,7 @@
  * Issue Date: October 2013
  *
  * URL:
- * https://support.amd.com/TechDocs/24593.pdf
+ * https://support.amd.com/TechDocs/24593.pdf 
  */
 
 /* The related documentation for K8 Revisions A - E is:
@@ -35,7 +35,7 @@
  * Issue Date: February 2006
  *
  * URL:
- * https://support.amd.com/TechDocs/26094.PDF
+ * https://support.amd.com/TechDocs/26094.PDF 
  */
 
 /* The related documentation for K8 Revisions F - G is:
@@ -46,7 +46,7 @@
  * Issue Date: July 2007
  *
  * URL:
- * https://support.amd.com/TechDocs/32559.pdf
+ * https://support.amd.com/TechDocs/32559.pdf 
  */
 
 /* Family10 MCA documentation published at
@@ -57,7 +57,7 @@
  * Isse Date: January 11, 2013
  *
  * URL:
- * https://support.amd.com/TechDocs/31116.pdf
+ * https://support.amd.com/TechDocs/31116.pdf 
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmce.c
index af30811afd445fe38d629f5fa220a868861cf6a6..a8d3aa68ae7beef9fb6ced8c1729883f69f07cad 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -15,7 +15,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/x86/cpu/mcheck/x86_mca.h b/xen/arch/x86/cpu/mcheck/x86_mca.h
index 8f7fced0fee057326ef7d87699b1b5ab9d5fb170..420dabf288f3a6bef73b5473a822f50f46cd7b62 100644
--- a/xen/arch/x86/cpu/mcheck/x86_mca.h
+++ b/xen/arch/x86/cpu/mcheck/x86_mca.h
@@ -13,7 +13,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef X86_MCA_H
diff --git a/xen/arch/x86/cpu/mtrr/main.c b/xen/arch/x86/cpu/mtrr/main.c
index 2946003b84938f3b83c98b62dfaa3ace90822983..88ee0f8444227287b57ba8018e4343720a555346 100644
--- a/xen/arch/x86/cpu/mtrr/main.c
+++ b/xen/arch/x86/cpu/mtrr/main.c
@@ -14,7 +14,7 @@
     Library General Public License for more details.
 
     You should have received a copy of the GNU Library General Public
-    License along with this library; If not, see <http://www.gnu.org/licenses/>.
+    License along with this library; If not, see <https://www.gnu.org/licenses/>.
 
     Richard Gooch may be reached by email at  rgooch@atnf.csiro.au
     The postal address is:
diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index 9e981e7e26dceff1a75c76b073a59a3fc0dcc800..78d2e7bb65911b78f0792c9bbc0b0b02f26199ed 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -14,7 +14,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 /*
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index b6b7342fb466e4ad2240516c0c3afc21472566e7..9b85e443ebf83bd73f31f41aaa32c8248aa577cc 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Author: Haitao Shan <haitao.shan@intel.com>
  */
diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
index 58794a16f06cd4041935922a51eb813a364a5d14..112409cbcc898f04dc83017616bcbbab0feae1ec 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -17,7 +17,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  */
 
diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index a8df52579db8e455b24f2f4a89367cbfe81d77ab..f3f855e7c3e90e40f7ba77a90aaf309b80c85487 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Author: Haitao Shan <haitao.shan@intel.com>
  */
diff --git a/xen/arch/x86/gdbstub.c b/xen/arch/x86/gdbstub.c
index 961cae0be74f5514eb2f05536727786a74f9e250..6a7ad0f5578d11af14dda92d07d7a82ad0313c2c 100644
--- a/xen/arch/x86/gdbstub.c
+++ b/xen/arch/x86/gdbstub.c
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  * 
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 #include <asm/uaccess.h>
 #include <asm/x86-defns.h>
diff --git a/xen/arch/x86/gdbsx.c b/xen/arch/x86/gdbsx.c
index 6ef46e8ea77d8de3178ff50340bdf4fa2d0b9d95..e7b20a7202a1133ea14be39aab0538465e2748e3 100644
--- a/xen/arch/x86/gdbsx.c
+++ b/xen/arch/x86/gdbsx.c
@@ -11,7 +11,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/sched.h>
diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
index f73390cdb017caae149d2e1057723958a66ee7ae..36a30ec43e86b59c2135d1c4bdb2938038f51370 100644
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/guest/hyperv/hyperv.c
index b101ba3080b44a95cadd893c521454eb321572e6..f28df2cb45f8f67f3a16157345edd9051f9e79b0 100644
--- a/xen/arch/x86/guest/hyperv/hyperv.c
+++ b/xen/arch/x86/guest/hyperv/hyperv.c
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2019 Microsoft.
  */
diff --git a/xen/arch/x86/guest/hyperv/private.h b/xen/arch/x86/guest/hyperv/private.h
index fea3e291e944ef8d22de7c8da7dd4f488167c428..a33e2501ff53ed9042a64a23a33431ea1125cbeb 100644
--- a/xen/arch/x86/guest/hyperv/private.h
+++ b/xen/arch/x86/guest/hyperv/private.h
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2020 Microsoft.
  */
diff --git a/xen/arch/x86/guest/hyperv/tlb.c b/xen/arch/x86/guest/hyperv/tlb.c
index f249b259253daaa747dee5989d9f7d85a3be3846..986b8083cfae508cf27a4c886138a693892036b2 100644
--- a/xen/arch/x86/guest/hyperv/tlb.c
+++ b/xen/arch/x86/guest/hyperv/tlb.c
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2020 Microsoft.
  */
diff --git a/xen/arch/x86/guest/hyperv/util.c b/xen/arch/x86/guest/hyperv/util.c
index 2c5f421b7bd9a5039ba59653a09b1e06700b2a3d..2db9b68136b31d5b3aef2467450c44cab5929217 100644
--- a/xen/arch/x86/guest/hyperv/util.c
+++ b/xen/arch/x86/guest/hyperv/util.c
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2020 Microsoft.
  */
diff --git a/xen/arch/x86/guest/hypervisor.c b/xen/arch/x86/guest/hypervisor.c
index 366af1d6500104dd97ca592c1a5a6d58bb4296f7..b4e01a25018513585fbc73bd04364bc1e85d920c 100644
--- a/xen/arch/x86/guest/hypervisor.c
+++ b/xen/arch/x86/guest/hypervisor.c
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2019 Microsoft.
  */
diff --git a/xen/arch/x86/guest/xen/pvh-boot.c b/xen/arch/x86/guest/xen/pvh-boot.c
index 498625eae0a3f065c41366aa8b51c2e571c6ca63..45af2a7caa3066ad8805e1fed409f40c931e18ca 100644
--- a/xen/arch/x86/guest/xen/pvh-boot.c
+++ b/xen/arch/x86/guest/xen/pvh-boot.c
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
diff --git a/xen/arch/x86/guest/xen/xen.c b/xen/arch/x86/guest/xen/xen.c
index 9c2defaa6621864e359ea45e554ae8322c1d4610..417cd713ec29a4161c4b7d50fb473a139d6cadf5 100644
--- a/xen/arch/x86/guest/xen/xen.c
+++ b/xen/arch/x86/guest/xen/xen.c
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
diff --git a/xen/arch/x86/hvm/asid.c b/xen/arch/x86/hvm/asid.c
index 1fd2770a3ae062031687b4d9b0d38f9516f5b0d2..b4ea2d90c030b6fd6dcc33cac1518aec0d5f96fa 100644
--- a/xen/arch/x86/hvm/asid.c
+++ b/xen/arch/x86/hvm/asid.c
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index f8e6089870b01b45fb88739658b17fae92b687ec..fd66243984cbe955eecfa7cdbd3a79d069b30294 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -11,7 +11,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/event.h>
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 3ac6b7b423b10fae313950a1d443e6e2fb42ad39..8d7cfc074f6b25496a6b99baf685c6b5e816b970 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -15,7 +15,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/acpi.h>
diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
index 10e30175a1b6865d4924d08e5baf357794342cb7..82308a5cdb91f2a854fbd9a21e098246641e5072 100644
--- a/xen/arch/x86/hvm/domain.c
+++ b/xen/arch/x86/hvm/domain.c
@@ -13,7 +13,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/domain_page.h>
diff --git a/xen/arch/x86/hvm/grant_table.c b/xen/arch/x86/hvm/grant_table.c
index b7a896ea5855f4ae1c99e26b204b69a610ee2338..fa23d5ad83257493783fde4c916c7b5d4be7a654 100644
--- a/xen/arch/x86/hvm/grant_table.c
+++ b/xen/arch/x86/hvm/grant_table.c
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/types.h>
diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
index c65e1b27d09ea5931fc13919697de088c1b9a8fe..60be48f6cf6347c5a8b51590b9397214a0621c90 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <asm/hvm/vpt.h>
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 5c1e64189600df7d5c700ea500cf4afce12391ca..9339fc94bec0354eaff1b79b391d6139faf8a02d 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -15,7 +15,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/ctype.h>
diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 405d0a95afd8ef77d298f3d4dd261ba3cd3f7920..2fef069930318ddc4aa50e7baab9332d67a1ea97 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
diff --git a/xen/arch/x86/hvm/intercept.c b/xen/arch/x86/hvm/intercept.c
index ffa31b7467161054c7b8b0f156d088f51c642f6e..e028f96b6ee46d3834b8803d81718eeed2115e4e 100644
--- a/xen/arch/x86/hvm/intercept.c
+++ b/xen/arch/x86/hvm/intercept.c
@@ -14,7 +14,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/ioreq.h>
diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index 5ae209d3b6b3a5453290320d83bc09a9a3c6c8cd..9f16521c4449a3240e18638fca1cb2a96528e76c 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -15,7 +15,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 0bdcca1e1a5f68d213cb9a73637df4610c8d68aa..67427efe4dd9de2c2397358a6009dc0428deced8 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/domain.h>
diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 4fe87a71c12b36bd88233c061130105317a1654c..2ceed080e99deff38806c416ffcc0a77064fbd49 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -15,7 +15,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/types.h>
diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
index a11cd76f4d18003012ae502b0bd0fc6c408fcf9b..ddd83ba6cd8d36ef82c4d1818e21f8c0f94b50e9 100644
--- a/xen/arch/x86/hvm/monitor.c
+++ b/xen/arch/x86/hvm/monitor.c
@@ -19,7 +19,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/vm_event.h>
diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index 344edc2d6a96e4c9ab2aa68b2f40c51853ca2e6a..23382e936f43178dcb997b4f35c5bd680c0d0985 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/domain_page.h>
diff --git a/xen/arch/x86/hvm/nestedhvm.c b/xen/arch/x86/hvm/nestedhvm.c
index 58370190ffc91fc9fc277e4f3532e09e4719bbbd..bfbba9df2ac4c63dc8be93296547fad6931e9fe1 100644
--- a/xen/arch/x86/hvm/nestedhvm.c
+++ b/xen/arch/x86/hvm/nestedhvm.c
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <asm/msr.h>
diff --git a/xen/arch/x86/hvm/pmtimer.c b/xen/arch/x86/hvm/pmtimer.c
index b89d0fd53ba16422792af9940a0fa1fac577f772..b4b33747225e6c1a96137493ecb8fd1d4483cd2b 100644
--- a/xen/arch/x86/hvm/pmtimer.c
+++ b/xen/arch/x86/hvm/pmtimer.c
@@ -14,7 +14,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/sched.h>
diff --git a/xen/arch/x86/hvm/quirks.c b/xen/arch/x86/hvm/quirks.c
index 2adab1f4b84b459c443029d129b69c22f8e6d44b..ef084b1d9659bfaa8e18877b694e1e2fd0673919 100644
--- a/xen/arch/x86/hvm/quirks.c
+++ b/xen/arch/x86/hvm/quirks.c
@@ -11,7 +11,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/types.h>
diff --git a/xen/arch/x86/hvm/save.c b/xen/arch/x86/hvm/save.c
index c1675e3d9fb097ec88eda0b333cc6c0f6561d326..d0918b492916bf32de5e9f552d74fd493616da60 100644
--- a/xen/arch/x86/hvm/save.c
+++ b/xen/arch/x86/hvm/save.c
@@ -17,7 +17,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/guest_access.h>
diff --git a/xen/arch/x86/hvm/svm/asid.c b/xen/arch/x86/hvm/svm/asid.c
index ab06dd3f3ae27d0c7f1e42dca429e275aa980032..d18ee50c2d0467bdc8ea018922578e40e1a3a728 100644
--- a/xen/arch/x86/hvm/svm/asid.c
+++ b/xen/arch/x86/hvm/svm/asid.c
@@ -12,7 +12,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <asm/amd.h>
diff --git a/xen/arch/x86/hvm/svm/emulate.c b/xen/arch/x86/hvm/svm/emulate.c
index 16fc134883cff49c1fc335cbfbabc321d371295d..089cd946f55b9e4d3b39f36e1ae3fa45f8650b62 100644
--- a/xen/arch/x86/hvm/svm/emulate.c
+++ b/xen/arch/x86/hvm/svm/emulate.c
@@ -12,7 +12,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/err.h>
diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index 981cd82e7c0b2bab093476c38b9e29d7e58a2d3c..6e1ed4a3f8a0740dce835c2fe6d9d09d79779d77 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -14,7 +14,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
         .file "svm/entry.S"
diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 9525f3559392de8063bca90fd5000db82499ec06..ca4a6ccec0c0ebd954819f2c5183e0d251f24ab7 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 9f5f35f16aff2a11320a3719b0668ab57776b610..8bcfc65dc4f5304d47511c79771fe00dc5e02fc6 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -12,7 +12,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  */
 
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index fa7325720328ba562948c8e921ee2ce8e1bde20f..1713966530d0bb3905e39268f340f05f565258c4 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/guest_access.h>
diff --git a/xen/arch/x86/hvm/svm/svmdebug.c b/xen/arch/x86/hvm/svm/svmdebug.c
index bce86f0ef706d5f1baeb21943cf3028d283cd6c5..4de3480737b18a8ee678df936290f87d1ac0e019 100644
--- a/xen/arch/x86/hvm/svm/svmdebug.c
+++ b/xen/arch/x86/hvm/svm/svmdebug.c
@@ -12,7 +12,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  */
 
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 305d4767e38726540a637c1a2d7f9f2c6c482e2c..88b5d745c0efde3a21ea6755905214583a9d0d4b 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  */
 
diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 864f6a84e6173f1414cbf3eb54e3ee08fb78179b..adc1b2a2fd1f255e44e77cefb28d72541068b62b 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -18,7 +18,7 @@
  *  Lesser General Public License for more details.
  *
  *  You should have received a copy of the GNU Lesser General Public
- *  License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ *  License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  *  Yunhong Jiang <yunhong.jiang@intel.com>
  *  Ported to xen by using virtual IRQ line.
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index eb32f12e2d149c1a23ed8e8495d982a27cc367e6..031c04a61b7de6e09846d143a82dc1bb2b656958 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -14,7 +14,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/types.h>
diff --git a/xen/arch/x86/hvm/vm_event.c b/xen/arch/x86/hvm/vm_event.c
index 19aac19bc35406675624c0cd7e64f78f10bf8005..867a0eb902148bf069324069e14d97c2ae5b07a1 100644
--- a/xen/arch/x86/hvm/vm_event.c
+++ b/xen/arch/x86/hvm/vm_event.c
@@ -17,7 +17,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/sched.h>
diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 969678f94244df4c6a6671015f8e766e27aa8fbe..ff2a5fa04226a889504e3b741e80b24dae570717 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -18,7 +18,7 @@
  *  Lesser General Public License for more details.
  *
  *  You should have received a copy of the GNU Lesser General Public
- *  License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ *  License along with this library; If not, see <https://www.gnu.org/licenses/>.
  *
  * Support for virtual MSI logic
  * Will be merged it with virtual IOAPIC logic, since most is the same
diff --git a/xen/arch/x86/hvm/vmx/entry.S b/xen/arch/x86/hvm/vmx/entry.S
index 5f5de45a1309c7d667cc6755e7f3da269c3de9a9..3ee68881a0fdbae73981193a69ab1998a61bd857 100644
--- a/xen/arch/x86/hvm/vmx/entry.S
+++ b/xen/arch/x86/hvm/vmx/entry.S
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
         .file "vmx/entry.S"
diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index 6a8316de0e25bc894918da392675076d91ef143b..e5e88f9dbd3d32ba58a5761fe49f71e10c80f7b9 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 09edbd23b3990dd88994f716145da07778f29cd3..edc99e6106d3555c1a9d97870ca4928fb9f78863 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -12,7 +12,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index ade2a25ce7c20bb0220630b7b70ab0a13b1072e8..af76300a4d76ebb7a1d4ec7cd33cc30bf3ffa629 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -12,7 +12,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/guest_access.h>
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 674cdabb073672e371e1546efc9f573087bfe435..50779030b4c55a73376c2d24017bf02d716cbc0c 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -15,7 +15,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  */
 
diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index 621f5bb88b63850a4f4acbd39c5a66f7fe421568..05b1c37ca244aec58b04e39135d0bf4ad54dfbd7 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/sched.h>
diff --git a/xen/arch/x86/hypercall.c b/xen/arch/x86/hypercall.c
index 6b73cff9b9ff3fb271836b97aac28f0fa9d389c9..b087621726720bc66171163144c0c62ced582100 100644
--- a/xen/arch/x86/hypercall.c
+++ b/xen/arch/x86/hypercall.c
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2015,2016 Citrix Systems Ltd.
  */
diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
index 6ce79ce465b45b336138786a4fa8694e2c029b44..52bf6423b905e5e36714efe1b582e72463d372d4 100644
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -18,7 +18,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index b206e95863a63d35324778695300f668a1050327..d5914d6a96f1d060d77d8bf28d1d640225296beb 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -12,7 +12,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_X86_ALTP2M_H
diff --git a/xen/arch/x86/include/asm/endbr.h b/xen/arch/x86/include/asm/endbr.h
index d946fac131306049b44d8e52f2a0f9cf1bb3c5f4..46f02fd0812ca6dc85e8cda717194b2e0509c93f 100644
--- a/xen/arch/x86/include/asm/endbr.h
+++ b/xen/arch/x86/include/asm/endbr.h
@@ -10,7 +10,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2021-2022 Citrix Systems Ltd.
  */
diff --git a/xen/arch/x86/include/asm/guest.h b/xen/arch/x86/include/asm/guest.h
index ccf1ffbb729af6aeb4dc8259ab26dd610ade69a1..9aa3edcca571ae4ae275715db44cf2dd62e9a78c 100644
--- a/xen/arch/x86/include/asm/guest.h
+++ b/xen/arch/x86/include/asm/guest.h
@@ -11,7 +11,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
diff --git a/xen/arch/x86/include/asm/guest/hyperv-hcall.h b/xen/arch/x86/include/asm/guest/hyperv-hcall.h
index 423ca0860b5d517a48b81a86240b898a31f913f1..fb2ab0e341f51dd1974f66d7959bc383d366a8d0 100644
--- a/xen/arch/x86/include/asm/guest/hyperv-hcall.h
+++ b/xen/arch/x86/include/asm/guest/hyperv-hcall.h
@@ -11,7 +11,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2019 Microsoft.
  */
diff --git a/xen/arch/x86/include/asm/guest/hyperv.h b/xen/arch/x86/include/asm/guest/hyperv.h
index 1a1b47831c8d602f568636053a69da0ab863f4ba..783baced2f5177f16c7875896b15e1d7a2f34abb 100644
--- a/xen/arch/x86/include/asm/guest/hyperv.h
+++ b/xen/arch/x86/include/asm/guest/hyperv.h
@@ -11,7 +11,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2019 Microsoft.
  */
diff --git a/xen/arch/x86/include/asm/guest/hypervisor.h b/xen/arch/x86/include/asm/guest/hypervisor.h
index 0a6c3b47ab36cb4a1f6dffdef1e7535c96c49638..e966926a934ec31c3bfdd715ba505a058abcc35c 100644
--- a/xen/arch/x86/include/asm/guest/hypervisor.h
+++ b/xen/arch/x86/include/asm/guest/hypervisor.h
@@ -11,7 +11,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2019 Microsoft.
  */
diff --git a/xen/arch/x86/include/asm/guest/pvh-boot.h b/xen/arch/x86/include/asm/guest/pvh-boot.h
index 48ffd1a0b1b40a8729e4cea9f045af978567173c..bedf8ba86779cd4c087549503feae4b081f8cd2d 100644
--- a/xen/arch/x86/include/asm/guest/pvh-boot.h
+++ b/xen/arch/x86/include/asm/guest/pvh-boot.h
@@ -11,7 +11,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
diff --git a/xen/arch/x86/include/asm/guest/xen-hcall.h b/xen/arch/x86/include/asm/guest/xen-hcall.h
index 03d5868a9efd698353d22578abc19c503fa84038..f6f0d576d3629df8e6e7475dca3ad2d51f8505b2 100644
--- a/xen/arch/x86/include/asm/guest/xen-hcall.h
+++ b/xen/arch/x86/include/asm/guest/xen-hcall.h
@@ -11,7 +11,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
diff --git a/xen/arch/x86/include/asm/guest/xen.h b/xen/arch/x86/include/asm/guest/xen.h
index 2042a9a0c2537bcacfe781e8bad0cb42cf069dfa..ea46d83de7865825272aab1d322ad7ec49989211 100644
--- a/xen/arch/x86/include/asm/guest/xen.h
+++ b/xen/arch/x86/include/asm/guest/xen.h
@@ -11,7 +11,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
diff --git a/xen/arch/x86/include/asm/guest_pt.h b/xen/arch/x86/include/asm/guest_pt.h
index 6802db2a415a9c3aa0faf55f8e5ee97c83cdc4f9..15c2d9383fa542f886b32b1fc82fa0ad9a0256dd 100644
--- a/xen/arch/x86/include/asm/guest_pt.h
+++ b/xen/arch/x86/include/asm/guest_pt.h
@@ -22,7 +22,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef _XEN_ASM_GUEST_PT_H
diff --git a/xen/arch/x86/include/asm/hap.h b/xen/arch/x86/include/asm/hap.h
index 90dece29decad0dba7f7682a498493a06baa904f..9d7e2bbaf020ec76cb2b58c076f22dea9c513d82 100644
--- a/xen/arch/x86/include/asm/hap.h
+++ b/xen/arch/x86/include/asm/hap.h
@@ -19,7 +19,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef _XEN_HAP_H
diff --git a/xen/arch/x86/include/asm/hvm/asid.h b/xen/arch/x86/include/asm/hvm/asid.h
index 633ddb72e494a85e42200298db4cda585d3a374a..f1e5525c8301f215709300d43c4dea8007041b6b 100644
--- a/xen/arch/x86/include/asm/hvm/asid.h
+++ b/xen/arch/x86/include/asm/hvm/asid.h
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_X86_HVM_ASID_H__
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
index 698455444ea85b691126c3e8a31c08bbd48acb25..c5152049ed30799e1dffa4a309058cab180b2dcb 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -14,7 +14,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_X86_HVM_DOMAIN_H__
diff --git a/xen/arch/x86/include/asm/hvm/grant_table.h b/xen/arch/x86/include/asm/hvm/grant_table.h
index a5612585b35e520a87f0566a1f49d4574a34681f..342631b170c7cfc0ae452c93d8a3b5b7f2b3928b 100644
--- a/xen/arch/x86/include/asm/hvm/grant_table.h
+++ b/xen/arch/x86/include/asm/hvm/grant_table.h
@@ -15,7 +15,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __X86_HVM_GRANT_TABLE_H__
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 65768c797ea7547f50962af5b1a379a8c275a47c..d92ecbdc7c805bc37ffd33c60f18292f43885596 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -14,7 +14,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_X86_HVM_HVM_H__
diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm/hvm/io.h
index 54e0161b492c3714f13112e0ebffa91dbc9e0229..3253c68a82a787c8ad3748c42551d6f26f2c559b 100644
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_X86_HVM_IO_H__
diff --git a/xen/arch/x86/include/asm/hvm/ioreq.h b/xen/arch/x86/include/asm/hvm/ioreq.h
index 9b2eb6fedf99bafd52c1395dca6887d4107460ae..9bd11077393cff0390130321db369adc529d52e8 100644
--- a/xen/arch/x86/include/asm/hvm/ioreq.h
+++ b/xen/arch/x86/include/asm/hvm/ioreq.h
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_X86_HVM_IOREQ_H__
diff --git a/xen/arch/x86/include/asm/hvm/irq.h b/xen/arch/x86/include/asm/hvm/irq.h
index c4369ceb7aaaf5f3e50af0913ee8b78b81501d3a..fde58a7734a3d04bc7a6de63b40f539d94ca7e2b 100644
--- a/xen/arch/x86/include/asm/hvm/irq.h
+++ b/xen/arch/x86/include/asm/hvm/irq.h
@@ -15,7 +15,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_X86_HVM_IRQ_H__
diff --git a/xen/arch/x86/include/asm/hvm/monitor.h b/xen/arch/x86/include/asm/hvm/monitor.h
index 639f6dfa374cf18b9f9088bd45007c1962eb452f..61358dcc055dbf9746f759db29d812eeb3f1f241 100644
--- a/xen/arch/x86/include/asm/hvm/monitor.h
+++ b/xen/arch/x86/include/asm/hvm/monitor.h
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_X86_HVM_MONITOR_H__
diff --git a/xen/arch/x86/include/asm/hvm/nestedhvm.h b/xen/arch/x86/include/asm/hvm/nestedhvm.h
index 7184928c2bb179a424554cdab534f0373305a9a9..0b179f58192e5025e2f47e1824b6a058ac1100be 100644
--- a/xen/arch/x86/include/asm/hvm/nestedhvm.h
+++ b/xen/arch/x86/include/asm/hvm/nestedhvm.h
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef _HVM_NESTEDHVM_H
diff --git a/xen/arch/x86/include/asm/hvm/save.h b/xen/arch/x86/include/asm/hvm/save.h
index e975011ddb7112a2286242468a3df79c6a410d7b..39debb0a764b308c60a476abfeeb8f112282c4c6 100644
--- a/xen/arch/x86/include/asm/hvm/save.h
+++ b/xen/arch/x86/include/asm/hvm/save.h
@@ -11,7 +11,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __XEN_HVM_SAVE_H__
diff --git a/xen/arch/x86/include/asm/hvm/support.h b/xen/arch/x86/include/asm/hvm/support.h
index 6b583738ecb5667c8bf3fa3545e0b02cfbec179b..fd2a51c4f6ca25ae0392a80fb2af82e6b5d1e3a9 100644
--- a/xen/arch/x86/include/asm/hvm/support.h
+++ b/xen/arch/x86/include/asm/hvm/support.h
@@ -14,7 +14,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_X86_HVM_SUPPORT_H__
diff --git a/xen/arch/x86/include/asm/hvm/svm/asid.h b/xen/arch/x86/include/asm/hvm/svm/asid.h
index 0e5ec3ab788a578121b4c4eb2f88757718bc5991..70acd037b5d235c68737a974b75184e1587a44fc 100644
--- a/xen/arch/x86/include/asm/hvm/svm/asid.h
+++ b/xen/arch/x86/include/asm/hvm/svm/asid.h
@@ -12,7 +12,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_X86_HVM_SVM_ASID_H__
diff --git a/xen/arch/x86/include/asm/hvm/svm/emulate.h b/xen/arch/x86/include/asm/hvm/svm/emulate.h
index eb1a8c24af6d23ddb20ab2d346ea8e9165538de0..f1bdeff74fd5ad436766c337d7202602c863a642 100644
--- a/xen/arch/x86/include/asm/hvm/svm/emulate.h
+++ b/xen/arch/x86/include/asm/hvm/svm/emulate.h
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_X86_HVM_SVM_EMULATE_H__
diff --git a/xen/arch/x86/include/asm/hvm/svm/intr.h b/xen/arch/x86/include/asm/hvm/svm/intr.h
index ae52d9f948b127c7cff5c27a33f0719be159e297..817e5a713978cfd1a60f7951994f7e207e3a398d 100644
--- a/xen/arch/x86/include/asm/hvm/svm/intr.h
+++ b/xen/arch/x86/include/asm/hvm/svm/intr.h
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  */
 
diff --git a/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h b/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
index 656d7d1a9a71ac5144115523a91204ed9c2729ef..3a5615dbaa205fe94bb462d1abc3df736a56602a 100644
--- a/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
@@ -12,7 +12,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  */
 #ifndef __ASM_X86_HVM_SVM_NESTEDSVM_H__
diff --git a/xen/arch/x86/include/asm/hvm/svm/svm.h b/xen/arch/x86/include/asm/hvm/svm/svm.h
index 65e35a4f59b76bcd412ec409565193501618599b..6ce1f59ca788c8e2aae55eedf6f976f82f5851d5 100644
--- a/xen/arch/x86/include/asm/hvm/svm/svm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  */
 
diff --git a/xen/arch/x86/include/asm/hvm/svm/svmdebug.h b/xen/arch/x86/include/asm/hvm/svm/svmdebug.h
index 330c1d91aad54a2ca47e28a67c44d58c465459ab..d4544c589de8a65141226738b6215cc04f5ea050 100644
--- a/xen/arch/x86/include/asm/hvm/svm/svmdebug.h
+++ b/xen/arch/x86/include/asm/hvm/svm/svmdebug.h
@@ -12,7 +12,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  */
 
diff --git a/xen/arch/x86/include/asm/hvm/svm/vmcb.h b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
index e87728fa81cd26fe014dd3eb47d622105063760f..ce33d4cc72d9616de774b7bf62f686d494a705ec 100644
--- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
+++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  */
 #ifndef __ASM_X86_HVM_SVM_VMCB_H__
diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h b/xen/arch/x86/include/asm/hvm/vcpu.h
index 8adf4555c2ab491980c0de823d424be15219413c..577ca66752f10ee31f869271b045bf8247df34b9 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_X86_HVM_VCPU_H__
diff --git a/xen/arch/x86/include/asm/hvm/vioapic.h b/xen/arch/x86/include/asm/hvm/vioapic.h
index 4e0166f160575554f9619911b0cc4b4b082bada3..60fa3659113b1045c01ca6cdbfaf4799a76f9b49 100644
--- a/xen/arch/x86/include/asm/hvm/vioapic.h
+++ b/xen/arch/x86/include/asm/hvm/vioapic.h
@@ -18,7 +18,7 @@
  *  Lesser General Public License for more details.
  *
  *  You should have received a copy of the GNU Lesser General Public
- *  License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ *  License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_X86_HVM_VIOAPIC_H__
diff --git a/xen/arch/x86/include/asm/hvm/vlapic.h b/xen/arch/x86/include/asm/hvm/vlapic.h
index 8f908928c35c824359c0a998133a4675767b32ed..8905858a8fbfed0355974fecc83811920e444b49 100644
--- a/xen/arch/x86/include/asm/hvm/vlapic.h
+++ b/xen/arch/x86/include/asm/hvm/vlapic.h
@@ -14,7 +14,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_X86_HVM_VLAPIC_H__
diff --git a/xen/arch/x86/include/asm/hvm/vm_event.h b/xen/arch/x86/include/asm/hvm/vm_event.h
index 28cb07ce8ff608212ccacd3140cf1b9423cadceb..714b8dd38984fd303660f4f504641a5bccdfc9eb 100644
--- a/xen/arch/x86/include/asm/hvm/vm_event.h
+++ b/xen/arch/x86/include/asm/hvm/vm_event.h
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_X86_HVM_VM_EVENT_H__
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index 0a84e744780543e3350694d376644c06af88b7d0..dc316cdf89b74e0616feb433ecb4e34acad4468f 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -12,7 +12,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  */
 #ifndef __ASM_X86_HVM_VMX_VMCS_H__
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 234da4a7f4459b70d9f14d9e8267af3902e49339..9d33e6e200de018080c588c72cce3268b0ccfaed 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -12,7 +12,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  */
 #ifndef __ASM_X86_HVM_VMX_VMX_H__
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
index 2c3adb5dd6b348475875ff2835653f8f4297b56d..7d1c415ec17a1153c8c33f5744a199969fa04e5a 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
@@ -16,7 +16,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  */
 #ifndef __ASM_X86_HVM_VVMX_H__
diff --git a/xen/arch/x86/include/asm/hvm/vpt.h b/xen/arch/x86/include/asm/hvm/vpt.h
index 74c0cedd11cce8567c12aef946ef4fad4c5a647f..193e0d01cd6c00cc1f8bc2037d7bd9a77c9f7adf 100644
--- a/xen/arch/x86/include/asm/hvm/vpt.h
+++ b/xen/arch/x86/include/asm/hvm/vpt.h
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_X86_HVM_VPT_H__
diff --git a/xen/arch/x86/include/asm/iommu.h b/xen/arch/x86/include/asm/iommu.h
index fc0afe35bf6b9160f3514797e1d8c8203fd74230..bc43c3a35993cd7771f7360c88943a10ed976529 100644
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -9,7 +9,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
 */
 #ifndef __ARCH_X86_IOMMU_H__
 #define __ARCH_X86_IOMMU_H__
diff --git a/xen/arch/x86/include/asm/ioreq.h b/xen/arch/x86/include/asm/ioreq.h
index d06ce9a6ea56ef4e6528872be2029a3177b8b313..5b659fb345382c4b45e794c8f1ad2a4ba90e4e8d 100644
--- a/xen/arch/x86/include/asm/ioreq.h
+++ b/xen/arch/x86/include/asm/ioreq.h
@@ -16,7 +16,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_X86_IOREQ_H__
diff --git a/xen/arch/x86/include/asm/mem_access.h b/xen/arch/x86/include/asm/mem_access.h
index 18091610aea0439f7ad7bd60b2f205a3404aa99b..615eac2f8c3d72bd9c799e062bfd8f4f379bf84a 100644
--- a/xen/arch/x86/include/asm/mem_access.h
+++ b/xen/arch/x86/include/asm/mem_access.h
@@ -20,7 +20,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_X86_MEM_ACCESS_H__
diff --git a/xen/arch/x86/include/asm/mem_paging.h b/xen/arch/x86/include/asm/mem_paging.h
index d3635e96cffc0bb18efe2b865b3fee03bf537dad..67ebddbbe33be779a5acc965f1a0648ea228d6f3 100644
--- a/xen/arch/x86/include/asm/mem_paging.h
+++ b/xen/arch/x86/include/asm/mem_paging.h
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_X86_MEM_PAGING_H__
diff --git a/xen/arch/x86/include/asm/mem_sharing.h b/xen/arch/x86/include/asm/mem_sharing.h
index 2c00069bc91ce53b0e04b3eeb89e35c15fcf2676..5ed531af16a14a551a6cc48c1cdc5fa3787e3dde 100644
--- a/xen/arch/x86/include/asm/mem_sharing.h
+++ b/xen/arch/x86/include/asm/mem_sharing.h
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 #ifndef __MEM_SHARING_H__
 #define __MEM_SHARING_H__
diff --git a/xen/arch/x86/include/asm/monitor.h b/xen/arch/x86/include/asm/monitor.h
index d8d54c5f23d691fd1af049680552b11fd7b2267f..11ecd70b41831c1930256feb4a30fdf388814f13 100644
--- a/xen/arch/x86/include/asm/monitor.h
+++ b/xen/arch/x86/include/asm/monitor.h
@@ -16,7 +16,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_X86_MONITOR_H__
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index bd684d02f3676fba3b39b347e27556040fc36aa8..4b71075fe91400ab754cd5038b5ed29e9d05712a 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -20,7 +20,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef _XEN_ASM_X86_P2M_H
diff --git a/xen/arch/x86/include/asm/paging.h b/xen/arch/x86/include/asm/paging.h
index 8c0b0ef29a10d1199ea92c3bc8084a83b18c91e9..480f4aeefef094c02311e2d93a9429511a674ba3 100644
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -18,7 +18,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef _XEN_PAGING_H
diff --git a/xen/arch/x86/include/asm/pv/domain.h b/xen/arch/x86/include/asm/pv/domain.h
index 924508bbb4f0c199b3cd2306d9d8f0bd0ef399f9..77800439a187b7cc43355b1d445b4f7499854f43 100644
--- a/xen/arch/x86/include/asm/pv/domain.h
+++ b/xen/arch/x86/include/asm/pv/domain.h
@@ -15,7 +15,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __X86_PV_DOMAIN_H__
diff --git a/xen/arch/x86/include/asm/pv/grant_table.h b/xen/arch/x86/include/asm/pv/grant_table.h
index 85442b60749f6b17195eb9925887f9c98ae6a28b..72afc193abd5970b0d72fa317836722f29e630d8 100644
--- a/xen/arch/x86/include/asm/pv/grant_table.h
+++ b/xen/arch/x86/include/asm/pv/grant_table.h
@@ -15,7 +15,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __X86_PV_GRANT_TABLE_H__
diff --git a/xen/arch/x86/include/asm/pv/mm.h b/xen/arch/x86/include/asm/pv/mm.h
index 9983f8257c63fa492120662d10ec192366560216..912b006875aaae76f2872ccddae3c766c1da4ec1 100644
--- a/xen/arch/x86/include/asm/pv/mm.h
+++ b/xen/arch/x86/include/asm/pv/mm.h
@@ -15,7 +15,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __X86_PV_MM_H__
diff --git a/xen/arch/x86/include/asm/pv/shim.h b/xen/arch/x86/include/asm/pv/shim.h
index a43c3689b48aa85ce6a413a8b5df3d9540475966..22acad0233ccaf9213e47e248064be9bfa8e0444 100644
--- a/xen/arch/x86/include/asm/pv/shim.h
+++ b/xen/arch/x86/include/asm/pv/shim.h
@@ -11,7 +11,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
diff --git a/xen/arch/x86/include/asm/pv/traps.h b/xen/arch/x86/include/asm/pv/traps.h
index 855203c4e288bd7f1dd12d62dbfcb5379e5b69ca..f64993b2a349a8d403c86df0bbf86835cea2ec53 100644
--- a/xen/arch/x86/include/asm/pv/traps.h
+++ b/xen/arch/x86/include/asm/pv/traps.h
@@ -15,7 +15,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __X86_PV_TRAPS_H__
diff --git a/xen/arch/x86/include/asm/shadow.h b/xen/arch/x86/include/asm/shadow.h
index 1365fe48051827acc3cac2a9640d4e1b560c5309..d83d705f3aca08a6807c234e65ac690fed506e3b 100644
--- a/xen/arch/x86/include/asm/shadow.h
+++ b/xen/arch/x86/include/asm/shadow.h
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  * 
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef _XEN_SHADOW_H
diff --git a/xen/arch/x86/include/asm/shstk.h b/xen/arch/x86/include/asm/shstk.h
index fdc9cc65a3fa6d673e5a79149a1d451a019d0126..4c580a34976c343826a2c79bedb291a2efee9437 100644
--- a/xen/arch/x86/include/asm/shstk.h
+++ b/xen/arch/x86/include/asm/shstk.h
@@ -10,7 +10,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2022 Citrix Systems Ltd.
  */
diff --git a/xen/arch/x86/include/asm/spec_ctrl.h b/xen/arch/x86/include/asm/spec_ctrl.h
index e928596450f7ba65f6af9c005dbb1a1609dd6c95..b480db11ad5c3a7914020fdb49fc46d613c8af40 100644
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -12,7 +12,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2017-2018 Citrix Systems Ltd.
  */
diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index fab27ff5532be63d849f5eb94d47d9cb30bb3b67..18245921c27c7f4618a04ac46fc1c2a0c8dd6467 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -12,7 +12,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2017-2018 Citrix Systems Ltd.
  */
diff --git a/xen/arch/x86/include/asm/traps.h b/xen/arch/x86/include/asm/traps.h
index b0dd2d24614dbead8e51bc0924afbb8cdeabb617..d6cb16541148fe0a7cda26071f31ee376ab768c9 100644
--- a/xen/arch/x86/include/asm/traps.h
+++ b/xen/arch/x86/include/asm/traps.h
@@ -13,7 +13,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef ASM_TRAP_H
diff --git a/xen/arch/x86/include/asm/vm_event.h b/xen/arch/x86/include/asm/vm_event.h
index 0756124075231d0b7aa9e1a0367b756033750d72..8c98b177a62c5af15fac37af032f8f5f1e3cd51f 100644
--- a/xen/arch/x86/include/asm/vm_event.h
+++ b/xen/arch/x86/include/asm/vm_event.h
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_X86_VM_EVENT_H__
diff --git a/xen/arch/x86/include/asm/vpmu.h b/xen/arch/x86/include/asm/vpmu.h
index 05e1fbfccfcf9f592108a8db70f7955e52129cca..ded3cff7fb314499b18461408301152a2f5a2dd9 100644
--- a/xen/arch/x86/include/asm/vpmu.h
+++ b/xen/arch/x86/include/asm/vpmu.h
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Author: Haitao Shan <haitao.shan@intel.com>
  */
diff --git a/xen/arch/x86/include/asm/xenoprof.h b/xen/arch/x86/include/asm/xenoprof.h
index cf6af8c5df525c6925df9eeaae4be52738d21fee..bd93ef6e7cccf099d8f4679764340e328d1ca229 100644
--- a/xen/arch/x86/include/asm/xenoprof.h
+++ b/xen/arch/x86/include/asm/xenoprof.h
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __ASM_X86_XENOPROF_H__
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 0fe14faa5fa7f4c384b44324c86743e823b53917..409c8b32536666fb51a3474d0ae04e7c6e17ec96 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -15,7 +15,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 /*
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 07393befeeed4e9b0230306e60a9167460c511f8..a48cb5567de880e44324f5fd02b8379e7eaf8465 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -12,7 +12,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <asm/hvm/hvm.h>
diff --git a/xen/arch/x86/mm/guest_walk.c b/xen/arch/x86/mm/guest_walk.c
index 76b4e0425887ff9f3e932dfd54c9fab70ca4585e..989006cb1b377d8192acfea668e891c126c6eef7 100644
--- a/xen/arch/x86/mm/guest_walk.c
+++ b/xen/arch/x86/mm/guest_walk.c
@@ -18,7 +18,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/types.h>
diff --git a/xen/arch/x86/mm/hap/guest_walk.c b/xen/arch/x86/mm/hap/guest_walk.c
index 1da8d3b99edcb81b1eaa46ed2055ddb343209d04..f12467001082fd3922f18338ead92ed10b46d3c4 100644
--- a/xen/arch/x86/mm/hap/guest_walk.c
+++ b/xen/arch/x86/mm/hap/guest_walk.c
@@ -15,7 +15,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/domain_page.h>
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 84cb358df1231a4b3a93997b9b2281bb2506b3c5..bcfd6e450268b75483206a7536d9b88a008d3b6e 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/types.h>
diff --git a/xen/arch/x86/mm/hap/nested_ept.c b/xen/arch/x86/mm/hap/nested_ept.c
index 605e47c16cd54480fce0a2b3d5251f327e91eec7..9ffad29d346cd09ed38dbfe9dc2d486c582c9519 100644
--- a/xen/arch/x86/mm/hap/nested_ept.c
+++ b/xen/arch/x86/mm/hap/nested_ept.c
@@ -14,7 +14,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 #include <xen/vm_event.h>
 #include <xen/event.h>
diff --git a/xen/arch/x86/mm/hap/nested_hap.c b/xen/arch/x86/mm/hap/nested_hap.c
index 098e8e5d4ca9c00de9e9cc870d2573a1b659e670..95d853994037764ecd6fd39d0f2de6f61dd171cb 100644
--- a/xen/arch/x86/mm/hap/nested_hap.c
+++ b/xen/arch/x86/mm/hap/nested_hap.c
@@ -15,7 +15,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/vm_event.h>
diff --git a/xen/arch/x86/mm/hap/private.h b/xen/arch/x86/mm/hap/private.h
index 1040eaf69f437a90b183c3e8cec683a9659fa028..f60bc084b2fe2ec35200d5b845562b3829e67da8 100644
--- a/xen/arch/x86/mm/hap/private.h
+++ b/xen/arch/x86/mm/hap/private.h
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  */
 #ifndef __HAP_PRIVATE_H__
diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index f3aed9fcc966037ebd94451fdc2098cacfbd7e04..07c53bff9566583779291e5a9b5a600161663bab 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -18,7 +18,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/guest_access.h> /* copy_from_guest() */
diff --git a/xen/arch/x86/mm/mem_paging.c b/xen/arch/x86/mm/mem_paging.c
index 01281f786ee05e83d1860340bcf7486f47914d4d..79158a1266090052bbb9fd9d6aa00aa5274a2bcb 100644
--- a/xen/arch/x86/mm/mem_paging.c
+++ b/xen/arch/x86/mm/mem_paging.c
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 649d93dc54440a15723eb827ba28ae4b4221e877..d3f3d2007502c4480cb5fc4f36e6bff1c618d728 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -17,7 +17,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/types.h>
diff --git a/xen/arch/x86/mm/mm-locks.h b/xen/arch/x86/mm/mm-locks.h
index c1523aeccf992db0313f3eadbd050a35222cf1bd..93200149ee739badd6ab5e431036939de7830775 100644
--- a/xen/arch/x86/mm/mm-locks.h
+++ b/xen/arch/x86/mm/mm-locks.h
@@ -19,7 +19,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef _MM_LOCKS_H
diff --git a/xen/arch/x86/mm/nested.c b/xen/arch/x86/mm/nested.c
index fab62b2b2dc1db8f76f0b2a3cfb16c8f74d81511..56b0017aac0d70b2eca899f2ca7e5e3bda1210d9 100644
--- a/xen/arch/x86/mm/nested.c
+++ b/xen/arch/x86/mm/nested.c
@@ -18,7 +18,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/sched.h>
diff --git a/xen/arch/x86/mm/p2m-basic.c b/xen/arch/x86/mm/p2m-basic.c
index 47b780d6d63aeccc699567568ecfd5ebf119caac..56da2cae3db622db050c74cd2e2bab219740f071 100644
--- a/xen/arch/x86/mm/p2m-basic.c
+++ b/xen/arch/x86/mm/p2m-basic.c
@@ -20,7 +20,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/event.h>
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index bb143c6c42c69db4e054b9156aad9a18ea0b2378..6cb7fcfcf0e9236443fa78ee228a44ba638f5667 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -12,7 +12,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/domain_page.h>
diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
index 2edab5e5cd91feb2ade4450a56b95ca3c55ee91b..2444ea5690cbd1ef6073cdf17e46cce6db02b251 100644
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/event.h>
diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index cd1af33b6772ab1016e8d4c3284a6bc5d282869d..9735cf19ded2e85dd8fe8288852c8a4a3382249d 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -21,7 +21,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/vm_event.h>
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index c5561fe22160114d0d18124bd6ff35c3171dd523..a757474fb9577a1982b35166c0e8cfdabbb2039e 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -20,7 +20,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/iommu.h>
diff --git a/xen/arch/x86/mm/p2m.h b/xen/arch/x86/mm/p2m.h
index cc0f6766e4df2d9db78463e2c2dcf55b26266820..dcbb5d9875b42f0c2b3c05362a0836ddf5c6825e 100644
--- a/xen/arch/x86/mm/p2m.h
+++ b/xen/arch/x86/mm/p2m.h
@@ -12,7 +12,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 struct p2m_domain *p2m_init_one(struct domain *d);
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index 1c5f54f92aefcb79b891c25d8d1e922d8c21c37f..59dabd64065b16cc87d4afa8d97e9ba40df92a65 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/x86/mm/physmap.c b/xen/arch/x86/mm/physmap.c
index 2d267b42f73b87554f328eaa69ed5062f7f7a65a..d4cb0317dc4aae8c0fdac763ab734628b82969da 100644
--- a/xen/arch/x86/mm/physmap.c
+++ b/xen/arch/x86/mm/physmap.c
@@ -18,7 +18,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/iommu.h>
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index a74b15e3e75b6e882709f0ce0e72001f14e8e9d0..69bd2306733eea291f46c787655a9cc967205cdc 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -17,7 +17,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/ioreq.h>
diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
index 88c3c16322f2777231538e382c148af4cb6bc070..a168b6c9d7a52ef5945e8ed22df9387e8cd689d5 100644
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -18,7 +18,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/domain_page.h>
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 3b06cfaf9a5aefb4d7678d9a5a5fb5c361d0319c..3567b6457896803a2c61b50ebd1ddd24daea3931 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -17,7 +17,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/types.h>
diff --git a/xen/arch/x86/mm/shadow/multi.h b/xen/arch/x86/mm/shadow/multi.h
index 5bcd6ae1a8da2a77f3640bb69c010181f0624f2e..34e8186718f793c10285681fb57b8ee7583601fa 100644
--- a/xen/arch/x86/mm/shadow/multi.h
+++ b/xen/arch/x86/mm/shadow/multi.h
@@ -17,7 +17,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 extern int
diff --git a/xen/arch/x86/mm/shadow/private.h b/xen/arch/x86/mm/shadow/private.h
index 79d82364fc92e650317b8cc68a73c8abe3ae8028..c0954e85d37386c34f155c7531ab0196b909ee3c 100644
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -17,7 +17,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef _XEN_SHADOW_PRIVATE_H
diff --git a/xen/arch/x86/mm/shadow/pv.c b/xen/arch/x86/mm/shadow/pv.c
index ed10d5479c5ef09cc1a1dc0447552d47e608c6ca..9235b24a9f0903fe0c5178f3d2e808374079d4dd 100644
--- a/xen/arch/x86/mm/shadow/pv.c
+++ b/xen/arch/x86/mm/shadow/pv.c
@@ -17,7 +17,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/types.h>
diff --git a/xen/arch/x86/mm/shadow/set.c b/xen/arch/x86/mm/shadow/set.c
index bd6c68b547c9b02cf31182e407ab8900de0dc254..2aea9894ed24e1630356c2a7fa5b9e6881e78ac5 100644
--- a/xen/arch/x86/mm/shadow/set.c
+++ b/xen/arch/x86/mm/shadow/set.c
@@ -17,7 +17,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #define GUEST_PAGING_LEVELS 0
diff --git a/xen/arch/x86/mm/shadow/types.h b/xen/arch/x86/mm/shadow/types.h
index fac59522b008d8a7fbcd60d99e585b346dd387a0..f491d80306339f7fe46c0cce38016b65e6dc952d 100644
--- a/xen/arch/x86/mm/shadow/types.h
+++ b/xen/arch/x86/mm/shadow/types.h
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef _XEN_SHADOW_TYPES_H
diff --git a/xen/arch/x86/monitor.c b/xen/arch/x86/monitor.c
index 30ca71432c0b822dea660b7ee391b79ed2951f76..db2ea5bd59e30ae46cfdd3b7a8559a0900806710 100644
--- a/xen/arch/x86/monitor.c
+++ b/xen/arch/x86/monitor.c
@@ -16,7 +16,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <asm/monitor.h>
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 7ddf0078c3a20ac2e4acf1d09292ba8d581aeac4..f5ae1ca82b63f7a9bf111cbad7cb0e2502ad2485 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
diff --git a/xen/arch/x86/pv/callback.c b/xen/arch/x86/pv/callback.c
index 067ee3b795d0c906702d05ad67e71512396e5b5d..73e99a13f2dc26d8b3e3a5fd6827d8eaf619a3e9 100644
--- a/xen/arch/x86/pv/callback.c
+++ b/xen/arch/x86/pv/callback.c
@@ -13,7 +13,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/event.h>
diff --git a/xen/arch/x86/pv/descriptor-tables.c b/xen/arch/x86/pv/descriptor-tables.c
index b4135b450cdfb0a5e7b49bcc71f03cb1355ad079..4ac7d6169a31fae87c1c2a49d1049ef6c9a85654 100644
--- a/xen/arch/x86/pv/descriptor-tables.c
+++ b/xen/arch/x86/pv/descriptor-tables.c
@@ -16,7 +16,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/guest_access.h>
diff --git a/xen/arch/x86/pv/emul-gate-op.c b/xen/arch/x86/pv/emul-gate-op.c
index 758a20ad9df424db9dfeb8ea08707bf6405b97e8..8249f7561ee4c2a2acf3495df548913a3eca5397 100644
--- a/xen/arch/x86/pv/emul-gate-op.c
+++ b/xen/arch/x86/pv/emul-gate-op.c
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/err.h>
diff --git a/xen/arch/x86/pv/emul-inv-op.c b/xen/arch/x86/pv/emul-inv-op.c
index 2c07eed9a092df5882161e1a28557e5862c4a5d1..62b7fdefa322c31e674d7bd8263e17c77f0d24c5 100644
--- a/xen/arch/x86/pv/emul-inv-op.c
+++ b/xen/arch/x86/pv/emul-inv-op.c
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <asm/pv/trace.h>
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 5da00e24e4ff15a9ef61c10002a3e511fced799c..61994058a8171b7aceb8b0117e67cfc44b5271bd 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/domain_page.h>
diff --git a/xen/arch/x86/pv/emulate.c b/xen/arch/x86/pv/emulate.c
index 0a7907ec5e846c00df5fc461cbb3948b7efece40..3ac280963c487e0663a6a0818eb764181ff0b00d 100644
--- a/xen/arch/x86/pv/emulate.c
+++ b/xen/arch/x86/pv/emulate.c
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/guest_access.h>
diff --git a/xen/arch/x86/pv/grant_table.c b/xen/arch/x86/pv/grant_table.c
index 81c72e61ed55888308e51e437805e2b91e7bc112..4c4dadd909064bbdd6e77f766ee89a326d784ad6 100644
--- a/xen/arch/x86/pv/grant_table.c
+++ b/xen/arch/x86/pv/grant_table.c
@@ -15,7 +15,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/types.h>
diff --git a/xen/arch/x86/pv/hypercall.c b/xen/arch/x86/pv/hypercall.c
index 2eedfbfae86417a48a682b3cc201ec0d8bfc478e..799407a1808cdd8e36d7fa5977cac35e308a4c23 100644
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
diff --git a/xen/arch/x86/pv/iret.c b/xen/arch/x86/pv/iret.c
index 316a23e77eb76eb7c532601d2779586fc54a7fea..a00816e7535de63726b3cbef307dbc57ced31c77 100644
--- a/xen/arch/x86/pv/iret.c
+++ b/xen/arch/x86/pv/iret.c
@@ -14,7 +14,7 @@
  *
  * You should have received a copy of the GNU General Public
  * License along with this program; If not, see
- * <http://www.gnu.org/licenses/>.
+ * <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/guest_access.h>
diff --git a/xen/arch/x86/pv/misc-hypercalls.c b/xen/arch/x86/pv/misc-hypercalls.c
index aaaf70eb633063e34cc2672dfe5e316f5b023065..e7a731b310a0455048611bdc681d97fab6d5855e 100644
--- a/xen/arch/x86/pv/misc-hypercalls.c
+++ b/xen/arch/x86/pv/misc-hypercalls.c
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/hypercall.h>
diff --git a/xen/arch/x86/pv/mm.c b/xen/arch/x86/pv/mm.c
index 5ed7b3ccdbf209fb94b45c8e6c72eb510aeb5f19..44b74a6ec42a09dc74f39b2ff05c0779899da305 100644
--- a/xen/arch/x86/pv/mm.c
+++ b/xen/arch/x86/pv/mm.c
@@ -16,7 +16,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/guest_access.h>
diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index 5963f5ee2d512a482b76f040eca4f4f314f91390..568dae9db6aa3d96baf0d12d150be2081bcf11df 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -17,7 +17,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <asm/pv/trace.h>
diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index ae1a0e6e65af04715b27fe55a5c316d74923ddb8..5c2b0481d7896066cb1e4ffa61cc9bbcc8e73415 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index 97fe54b5ee5a6a95daa6146314f0d3fa482118b8..61de39eece9c514be14777dd4ae7690a018fc3c8 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index b26758c2c89faf00719d75db5000c2c12331c848..621da7c204fd25362a96603c2bfe04fee3273b4f 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index a320b81947c85b39e1cea551b68b7aa7fdc4fab7..c61a95f7165e82e408959dd8e6074893e2b63e79 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -12,7 +12,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2017-2018 Citrix Systems Ltd.
  */
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index cade9e12f8fa7aa8f6c8f8c73b8094e05855378e..ec8e67fadf70f3b9ae28aa369c25e0c1ebfca860 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 /*
diff --git a/xen/arch/x86/vm_event.c b/xen/arch/x86/vm_event.c
index 7027c08a926b3a9be0f296c56f7be5d4de537058..3067cb552af3af09ae8376519f2874b85b78e0b8 100644
--- a/xen/arch/x86/vm_event.c
+++ b/xen/arch/x86/vm_event.c
@@ -15,7 +15,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/sched.h>
diff --git a/xen/arch/x86/x86_64/acpi_mmcfg.c b/xen/arch/x86/x86_64/acpi_mmcfg.c
index 2159c68189e4b4f749f8e5a65c55a8a788ec659e..02c557449f9a18f1a06869d34bd308f9c0e8202d 100644
--- a/xen/arch/x86/x86_64/acpi_mmcfg.c
+++ b/xen/arch/x86/x86_64/acpi_mmcfg.c
@@ -17,7 +17,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  *
diff --git a/xen/arch/x86/x86_64/cpu_idle.c b/xen/arch/x86/x86_64/cpu_idle.c
index e2195d57bec7c768f80cef57bcde1c3b8e81b05d..0a5654cc122eaf60223d1c8591063bd959fd6559 100644
--- a/xen/arch/x86/x86_64/cpu_idle.c
+++ b/xen/arch/x86/x86_64/cpu_idle.c
@@ -16,7 +16,7 @@
  *  General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License along
- *  with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
diff --git a/xen/arch/x86/x86_64/cpufreq.c b/xen/arch/x86/x86_64/cpufreq.c
index 9e1e2050da09688f2cd1cc5343f1a70b7af51ae2..f9ffc6275e6abc41d4a199bcf2f54c1ce59c036e 100644
--- a/xen/arch/x86/x86_64/cpufreq.c
+++ b/xen/arch/x86/x86_64/cpufreq.c
@@ -16,7 +16,7 @@
  *  General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License along
- *  with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
diff --git a/xen/arch/x86/x86_64/gdbstub.c b/xen/arch/x86/x86_64/gdbstub.c
index 8287124dfb1d0934e8a6d29de82fca374ca00357..4191cc148b9de3887204ba8b30302b19eced0d9b 100644
--- a/xen/arch/x86/x86_64/gdbstub.c
+++ b/xen/arch/x86/x86_64/gdbstub.c
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  * 
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/gdbstub.h>
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 60db439af3ecb5cda1f641f0a18c5dea6b531ab6..5d7bb0ca3ed249277469ebcc29b01017545050b2 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -13,7 +13,7 @@
  * more details.
  * 
  * You should have received a copy of the GNU General Public License along 
- * with this program; If not, see <http://www.gnu.org/licenses/>.
+ * with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 EMIT_FILE;
diff --git a/xen/arch/x86/x86_64/mmconfig.h b/xen/arch/x86/x86_64/mmconfig.h
index 433046be663a4983ca5cdfb67b53df4e587f481b..057ae6ad758430c81b0f4c3c8303d2265a7a581f 100644
--- a/xen/arch/x86/x86_64/mmconfig.h
+++ b/xen/arch/x86/x86_64/mmconfig.h
@@ -11,7 +11,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Author: Allen Kay <allen.m.kay@intel.com> - adapted from linux
  */
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index e38f98b547263b505078b649efbb8b9b666f657d..2ea0408e38c6a95f3cc08ad12b899488a97308eb 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -17,7 +17,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 /* Operand sizes: 8-bit operands or specified/overridden size. */
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index bb7af967ffee61e13fc1d4d2e0220fed77a88707..c5dc51330499b318d71ec60207e577491b10bc21 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -17,7 +17,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __X86_EMULATE_H__
diff --git a/xen/common/argo.c b/xen/common/argo.c
index 9ad2ecaa1e42337567cef6ecd53d56965590d60e..dad5b4a5e97d59ad7b8e687e61740264b37fdc67 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -12,7 +12,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/argo.h>
diff --git a/xen/common/bunzip2.c b/xen/common/bunzip2.c
index fb829b41f13bfc288d8a063b9390f2688c777d11..5909003437c3489d43a887d25ea5fd827f16afc0 100644
--- a/xen/common/bunzip2.c
+++ b/xen/common/bunzip2.c
@@ -7,7 +7,7 @@
 	Robert Sedgewick, and Jon L. Bentley.
 
 	This code is licensed under the LGPLv2:
-		LGPL (http://www.gnu.org/copyleft/lgpl.html
+		LGPL (https://www.gnu.org/copyleft/lgpl.html
 */
 
 /*
diff --git a/xen/common/coverage/coverage.c b/xen/common/coverage/coverage.c
index bd90f2866373795137912561c3897e01ab95a501..efecaceb2ebd7ae0a949c68960fc363563f1b0bd 100644
--- a/xen/common/coverage/coverage.c
+++ b/xen/common/coverage/coverage.c
@@ -13,7 +13,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/errno.h>
diff --git a/xen/common/dm.c b/xen/common/dm.c
index 201b652deb7eb09e9b78bdaefdf07ca3faa0a135..a335edb982f2814cd953678feb2777d22153724e 100644
--- a/xen/common/dm.c
+++ b/xen/common/dm.c
@@ -11,7 +11,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/dm.h>
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index f5e0b12d15209d3d43ba1877e9def37b31ca32b7..65b75bc43837b52b891cca493bc4eedd82e21cc5 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -11,7 +11,7 @@
  * GNU General Public License for more details.
  * 
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "event_channel.h"
diff --git a/xen/common/gdbstub.c b/xen/common/gdbstub.c
index df8d122bce8d8c7fe0ede2303bfc46148712f4c4..a97f75ce94f140325300d64669a65cad973965cf 100644
--- a/xen/common/gdbstub.c
+++ b/xen/common/gdbstub.c
@@ -18,7 +18,7 @@
  * GNU General Public License for more details.
  * 
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 /*
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index b896f9af0e48d77b5d8e4d62d4bf2c15a3d675f7..a679c269d2680fff23b110eea8e80dbd4ec1fa4c 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -20,7 +20,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/err.h>
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index ecb8f545e1c4c158272c9cd48090bb62ef88a567..763fa524806c925096443f1740cdebd5932ec696 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/domain.h>
diff --git a/xen/common/libelf/libelf-dominfo.c b/xen/common/libelf/libelf-dominfo.c
index 24d1371dd7a95d8d8f199ddd24f7d3fd0df398ea..22f5105412fe39361a239cf478dcb22d6e29ec92 100644
--- a/xen/common/libelf/libelf-dominfo.c
+++ b/xen/common/libelf/libelf-dominfo.c
@@ -12,7 +12,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "libelf-private.h"
diff --git a/xen/common/libelf/libelf-loader.c b/xen/common/libelf/libelf-loader.c
index 629cc0d3e611f065689f239e368100c0624ee5a6..69571dfb6b3215ba381d8546b72774506c3704bc 100644
--- a/xen/common/libelf/libelf-loader.c
+++ b/xen/common/libelf/libelf-loader.c
@@ -12,7 +12,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifdef __XEN__
diff --git a/xen/common/libelf/libelf-private.h b/xen/common/libelf/libelf-private.h
index 47db679966c6d0019a883123e7323fd28a96e1a6..d2f71196e1d80e00b499a4e80b5802b1ddf0dc63 100644
--- a/xen/common/libelf/libelf-private.h
+++ b/xen/common/libelf/libelf-private.h
@@ -10,7 +10,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 #ifndef __LIBELF_PRIVATE_H__
 #define __LIBELF_PRIVATE_H__
diff --git a/xen/common/libelf/libelf-tools.c b/xen/common/libelf/libelf-tools.c
index a9edb6a8dcb348b1de77966dd96e6c2dcc82d4ef..245ca26fbea8f9e9058d02d23155b8ca1472482f 100644
--- a/xen/common/libelf/libelf-tools.c
+++ b/xen/common/libelf/libelf-tools.c
@@ -12,7 +12,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "libelf-private.h"
diff --git a/xen/common/mem_access.c b/xen/common/mem_access.c
index 010e6f8dbfe9fbbd5223c9d1322a48e4f1d324f3..4bb463b5226065deb5be3983e994a71d190174ea 100644
--- a/xen/common/mem_access.c
+++ b/xen/common/mem_access.c
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 
diff --git a/xen/common/monitor.c b/xen/common/monitor.c
index d5c9ff1cbf8cc71dfc1f31fbefa8ad21e2cdab99..4c89d9b85e38cf43c1f12cd9404c25667cc0e774 100644
--- a/xen/common/monitor.c
+++ b/xen/common/monitor.c
@@ -16,7 +16,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/event.h>
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index e40473f71ead2dbc182ecb80cac980b678e69280..806fc2ff37e0a7e2d61e600b6744b909043d10d9 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -17,7 +17,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 /*
diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index c91875fabe2b070ba42a043be2a95ec846c5f832..dae46270c15f022ae24aa9a9d71f7c03b5a47902 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -12,7 +12,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/common/preempt.c b/xen/common/preempt.c
index 3b4178fd44acaef5d99e1b01c38a8ee483adea47..5d7a85c7f8623fc84940c3dfe246ef424babe9d2 100644
--- a/xen/common/preempt.c
+++ b/xen/common/preempt.c
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  * 
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/preempt.h>
diff --git a/xen/common/radix-tree.c b/xen/common/radix-tree.c
index adc3034222dc9f7177b415d6ef895ce6ad80f3f6..06fe1bd5d36da89ba0b6cc33995b9f05ab09e930 100644
--- a/xen/common/radix-tree.c
+++ b/xen/common/radix-tree.c
@@ -15,7 +15,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
index 70b4d21b0f1d6da758f1df0f1c5229c6afdf200e..e3caf0e322ff6fb9f9bcc421be32a752d7601f2d 100644
--- a/xen/common/rcupdate.c
+++ b/xen/common/rcupdate.c
@@ -12,7 +12,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (C) IBM Corporation, 2001
  *
diff --git a/xen/common/sched/null.c b/xen/common/sched/null.c
index 65a0a6c5312d25052fda69c0be1898ce41062bb9..e375f715e50ff885f5a27fec90b1144994a70b28 100644
--- a/xen/common/sched/null.c
+++ b/xen/common/sched/null.c
@@ -13,7 +13,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 /*
diff --git a/xen/common/stop_machine.c b/xen/common/stop_machine.c
index 3adbe380de965d7e11ff0692fe707a1803c1d22a..af4b5ef728419a63d25c604f292727226ba4a0cd 100644
--- a/xen/common/stop_machine.c
+++ b/xen/common/stop_machine.c
@@ -16,7 +16,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/init.h>
diff --git a/xen/common/time.c b/xen/common/time.c
index 92f7b72464723e6b4830c6db29d9d30ef46f47a7..8f659118dada04384682222f3e4dc98418102054 100644
--- a/xen/common/time.c
+++ b/xen/common/time.c
@@ -12,7 +12,7 @@
  * GNU General Public License for more details.
  * 
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/sched.h>
diff --git a/xen/common/unlzma.c b/xen/common/unlzma.c
index 69448d7b398634b6543b1fcea7b6101724c17b36..a45996744b424a2a9ee073c1bc69d2d4853b4624 100644
--- a/xen/common/unlzma.c
+++ b/xen/common/unlzma.c
@@ -25,7 +25,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this library; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "decompress.h"
diff --git a/xen/common/unlzo.c b/xen/common/unlzo.c
index 23eff1354fe0679299951abfb3fbe2bcc2adc699..65f76c890d3b8fd18de1716942ceb694b5dd4f6a 100644
--- a/xen/common/unlzo.c
+++ b/xen/common/unlzo.c
@@ -22,7 +22,7 @@
  *
  * You should have received a copy of the GNU General Public License
  * along with this program; see the file COPYING.
- * If not, see <http://www.gnu.org/licenses/>.
+ * If not, see <https://www.gnu.org/licenses/>.
  *
  * Markus F.X.J. Oberhumer
  * <markus@oberhumer.com>
diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
index ecf49c38a9889f4ddb6c7f73b3cabb386f18ba73..2a64811551081217c0b8eca185c5f879f2b62a01 100644
--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 
diff --git a/xen/common/wait.c b/xen/common/wait.c
index 86d3b15419db27ad54ef4d9c94fc8418d0471406..8ce592ee0440f56c5804e64a0d8eb514f7ab2e34 100644
--- a/xen/common/wait.c
+++ b/xen/common/wait.c
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  * 
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/sched.h>
diff --git a/xen/drivers/acpi/apei/apei-base.c b/xen/drivers/acpi/apei/apei-base.c
index de75c1cef9922f8fd7a82b13ce1446b6231a612e..699e7f0e613ef2c24db3fff01bf4d7af5a2d2f5c 100644
--- a/xen/drivers/acpi/apei/apei-base.c
+++ b/xen/drivers/acpi/apei/apei-base.c
@@ -28,7 +28,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 #include <xen/kernel.h>
 #include <xen/errno.h>
diff --git a/xen/drivers/acpi/apei/apei-io.c b/xen/drivers/acpi/apei/apei-io.c
index eadf7a4dab53d7be15c6d4183c1beec0491bfb14..3bc468a1d10a33dc998ae7acda2cc0707cd7242a 100644
--- a/xen/drivers/acpi/apei/apei-io.c
+++ b/xen/drivers/acpi/apei/apei-io.c
@@ -15,7 +15,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/kernel.h>
diff --git a/xen/drivers/acpi/apei/erst.c b/xen/drivers/acpi/apei/erst.c
index 40d8f00270d0ac5acab558661d4041f1634c6bf9..2dad97cff70ee564de66c4878eb66ce85c07e771 100644
--- a/xen/drivers/acpi/apei/erst.c
+++ b/xen/drivers/acpi/apei/erst.c
@@ -22,7 +22,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/kernel.h>
diff --git a/xen/drivers/acpi/apei/hest.c b/xen/drivers/acpi/apei/hest.c
index 5881275d2f3762342043c7a7323ca3e42014e0da..d83795c7c6dbf5c82cbcb6347871d0a8a8bbec75 100644
--- a/xen/drivers/acpi/apei/hest.c
+++ b/xen/drivers/acpi/apei/hest.c
@@ -23,7 +23,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/errno.h>
diff --git a/xen/drivers/acpi/numa.c b/xen/drivers/acpi/numa.c
index bc6e888234e4cb6266909130377c90bed5f5f2ba..d1e2a51eb14d098a5dc84a8f994c7c7a50498bd1 100644
--- a/xen/drivers/acpi/numa.c
+++ b/xen/drivers/acpi/numa.c
@@ -16,7 +16,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  *
diff --git a/xen/drivers/acpi/osl.c b/xen/drivers/acpi/osl.c
index 389505f786668dc4b6859956ee51f4f4df85f675..c080882cc71d7b42e00dccc7ed49949fa371bad2 100644
--- a/xen/drivers/acpi/osl.c
+++ b/xen/drivers/acpi/osl.c
@@ -18,7 +18,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  *
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index 1bae6351019be9662c33ebc479d2d7470e8096fb..5d52ffdad1e1b6065888e01e5a00412f6a365f01 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -14,7 +14,7 @@
 # more details.
 #
 # You should have received a copy of the GNU General Public License along with
-# this program; If not, see <http://www.gnu.org/licenses/>.
+# this program; If not, see <https://www.gnu.org/licenses/>.
 #
 # The full GNU General Public License is included in this distribution in the
 # file called LICENSE.
diff --git a/xen/drivers/acpi/tables.c b/xen/drivers/acpi/tables.c
index 96ff96b84c6676ec9c6b13070382b2533de1f88c..c6c950598add102d19b9321a13fd7d76b4082bf5 100644
--- a/xen/drivers/acpi/tables.c
+++ b/xen/drivers/acpi/tables.c
@@ -16,7 +16,7 @@
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
- *  along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  *
diff --git a/xen/drivers/char/consoled.c b/xen/drivers/char/consoled.c
index 222e01844271a927e693d9c242e2124374bb1b3c..c53c6645ea2f900e9944b5b6a6c7ad04251bf8eb 100644
--- a/xen/drivers/char/consoled.c
+++ b/xen/drivers/char/consoled.c
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
diff --git a/xen/drivers/char/meson-uart.c b/xen/drivers/char/meson-uart.c
index b1e25e0468a49d764f1b40c522019e75dd496f4e..0e4a56dbef3dc955299ce6f38f701aa03a54df50 100644
--- a/xen/drivers/char/meson-uart.c
+++ b/xen/drivers/char/meson-uart.c
@@ -15,7 +15,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/errno.h>
diff --git a/xen/drivers/char/mvebu-uart.c b/xen/drivers/char/mvebu-uart.c
index a00618b96fbc3bbdeaf09203e297b1b972bd9443..42307c4de81a44f5418700e0353a8c8d47338fcb 100644
--- a/xen/drivers/char/mvebu-uart.c
+++ b/xen/drivers/char/mvebu-uart.c
@@ -15,7 +15,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/errno.h>
diff --git a/xen/drivers/char/xen_pv_console.c b/xen/drivers/char/xen_pv_console.c
index 1536bdaf524583feb910a7bcf693c865df692265..37a9539e537ac2d2d388ebfb028c4dfb1d755d65 100644
--- a/xen/drivers/char/xen_pv_console.c
+++ b/xen/drivers/char/xen_pv_console.c
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index 60b781f872027c99c75c6d7eb3be82fa8e00ffbd..5127a085e6384352230c7bf9749da7ad07da4e1a 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2019 Assured Information Security.
  */
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index a94520ee57ac914be1d51a4a498c8d66cf15f3c2..30368afc6bec2ae579286b4953f7fd8d0966bb7f 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -21,7 +21,7 @@
  *  General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License along
- *  with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
diff --git a/xen/drivers/passthrough/amd/iommu-defs.h b/xen/drivers/passthrough/amd/iommu-defs.h
index 35de548e3a783c8e2be4aa6a2a04bfbc8f9bb7af..11726aeaa742687b72053ac51ccd3659a475bba6 100644
--- a/xen/drivers/passthrough/amd/iommu-defs.h
+++ b/xen/drivers/passthrough/amd/iommu-defs.h
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef AMD_IOMMU_DEFS_H
diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index 8bc3c35b1bb1d13d7d321145788996197821f1e5..9692c89aee9c7fc5f841faac7b2792423108ca76 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 #ifndef AMD_IOMMU_H
 #define AMD_IOMMU_H
diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
index 3b577c9b390cad35960eef212f5d4d75fd1c2a75..bb821cf29936645bf2545d467c184630eee4a37f 100644
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/acpi.h>
diff --git a/xen/drivers/passthrough/amd/iommu_cmd.c b/xen/drivers/passthrough/amd/iommu_cmd.c
index 40ddf366bb4d01b8effe21cc6bcb5adc4f55fff4..a94caada9597e2160bfb27427de2fb5d557d7c6e 100644
--- a/xen/drivers/passthrough/amd/iommu_cmd.c
+++ b/xen/drivers/passthrough/amd/iommu_cmd.c
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include "iommu.h"
diff --git a/xen/drivers/passthrough/amd/iommu_detect.c b/xen/drivers/passthrough/amd/iommu_detect.c
index 2317fa6a7d8dc9967ca7320861da27009047a008..6d6d7e17a885f28088da766017fb24970b3cf0e1 100644
--- a/xen/drivers/passthrough/amd/iommu_detect.c
+++ b/xen/drivers/passthrough/amd/iommu_detect.c
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/acpi.h>
diff --git a/xen/drivers/passthrough/amd/iommu_guest.c b/xen/drivers/passthrough/amd/iommu_guest.c
index 80a331f546ed847ffcc418e25e16e3789fe7a950..f8d1d9a4b1b72b63d4c0844d7ba2de54fc2ad919 100644
--- a/xen/drivers/passthrough/amd/iommu_guest.c
+++ b/xen/drivers/passthrough/amd/iommu_guest.c
@@ -13,7 +13,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <asm/p2m.h>
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 9773ccfcb41fe700af5c592777ba9d3eab3f0ef7..2c5a9ac2bca1fcc8036b76cd00bc10106a9705ea 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/acpi.h>
diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index f4de09f43180e4f07c1b354eab39152afe6f50f0..6af1bca33c146d4351f6833e751dde328033ec06 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -13,7 +13,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/err.h>
diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
index 993bac6f8878d2b64521ce5c59e8589e40be5af1..b4cb59ca2ea21a607a8e5b554848b117e320cae6 100644
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/acpi.h>
diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index 4ba8e764b22f4b5bfd6772071144cfecfa323816..bcd928078d532e76c3efc590698a920663875750 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/iocap.h>
diff --git a/xen/drivers/passthrough/arm/iommu_fwspec.c b/xen/drivers/passthrough/arm/iommu_fwspec.c
index 8c97c7ca4807c4b01bf171a9a7dee5f0bfc4648f..bc082a7e1ff532cdfaab917213bd19c8e22914d7 100644
--- a/xen/drivers/passthrough/arm/iommu_fwspec.c
+++ b/xen/drivers/passthrough/arm/iommu_fwspec.c
@@ -20,7 +20,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/iommu.h>
diff --git a/xen/drivers/passthrough/arm/iommu_helpers.c b/xen/drivers/passthrough/arm/iommu_helpers.c
index 5cb19874819357b5cd58638864b56c505d07b37a..4e026eca681f5653996cd72debefb7ccc0259581 100644
--- a/xen/drivers/passthrough/arm/iommu_helpers.c
+++ b/xen/drivers/passthrough/arm/iommu_helpers.c
@@ -20,7 +20,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/iommu.h>
diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index 682bf12aaaf5bd7b50afda56cdc9694984442c57..425ba0330f1100d0ce7729d6a534d3172728233e 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -34,7 +34,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/delay.h>
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index d58c5cd0bf772226904038e5c05d901ba1d5e1f9..e1f59f5889cc397921eedebed43cb5d6ebaea2b2 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -67,7 +67,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  *
  */
 
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 0a514821b3360b677a183b45a73c19ac191a4edc..e62b51c3d7f3db228b58f37138e77bd46fb549c9 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -11,7 +11,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (C) 2013 ARM Limited
  *
diff --git a/xen/drivers/passthrough/ats.c b/xen/drivers/passthrough/ats.c
index 7f7b16dc490c2e287b838fa8e9a1b0c6a18c3c72..8b8a424f7a22e262862b42d17c2a2d6fb5cc3927 100644
--- a/xen/drivers/passthrough/ats.c
+++ b/xen/drivers/passthrough/ats.c
@@ -9,7 +9,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/param.h>
diff --git a/xen/drivers/passthrough/ats.h b/xen/drivers/passthrough/ats.h
index c202f4ecdd6753de10427bb4adfeaa00d6a4915a..2e8bf13d07dbd40ff0222f32b72684b6eed21626 100644
--- a/xen/drivers/passthrough/ats.h
+++ b/xen/drivers/passthrough/ats.h
@@ -9,7 +9,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef _ATS_H_
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index b4dfa95dfd8e49b2c953d09bbfe5190ef04f7109..d72ac5f94a953d165d175f05467ca02ffa9114aa 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -9,7 +9,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/sched.h>
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 9f8819785b49f26d7a03e30d51ac5dd0d6700719..0ea51f14106d5378c6a013d322c9a1f87359d174 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -11,7 +11,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/sched.h>
@@ -285,14 +285,14 @@ static void apply_quirks(struct pci_dev *pdev)
          * Device [8086:2fc0]
          * Erratum HSE43
          * CONFIG_TDP_NOMINAL CSR Implemented at Incorrect Offset
-         * https://www.intel.com/content/www/us/en/processors/xeon/xeon-e5-v3-spec-update.html
+         * https://www.intel.com/content/www/us/en/processors/xeon/xeon-e5-v3-spec-update.html 
          */
         { PCI_VENDOR_ID_INTEL, 0x2fc0 },
         /*
          * Devices [8086:6f60,6fa0,6fc0]
          * Errata BDF2 / BDX2
          * PCI BARs in the Home Agent Will Return Non-Zero Values During Enumeration
-         * https://www.intel.com/content/www/us/en/processors/xeon/xeon-e5-v4-spec-update.html
+         * https://www.intel.com/content/www/us/en/processors/xeon/xeon-e5-v4-spec-update.html 
         */
         { PCI_VENDOR_ID_INTEL, 0x6f60 },
         { PCI_VENDOR_ID_INTEL, 0x6fa0 },
diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/vtd/dmar.c
index 78c8bad1515a231b0a501308e3003a5ce124fb2b..d71ad72dc434832308c047526021481c5622fbe3 100644
--- a/xen/drivers/passthrough/vtd/dmar.c
+++ b/xen/drivers/passthrough/vtd/dmar.c
@@ -11,7 +11,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (C) Ashok Raj <ashok.raj@intel.com>
  * Copyright (C) Shaohua Li <shaohua.li@intel.com>
diff --git a/xen/drivers/passthrough/vtd/dmar.h b/xen/drivers/passthrough/vtd/dmar.h
index a1f2353a511f4f432494cd0d318ae9531a6c9001..33b9cea7ac835e812c690d6120da93968bb7b12c 100644
--- a/xen/drivers/passthrough/vtd/dmar.h
+++ b/xen/drivers/passthrough/vtd/dmar.h
@@ -11,7 +11,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (C) Ashok Raj <ashok.raj@intel.com>
  * Copyright (C) Shaohua Li <shaohua.li@intel.com>
diff --git a/xen/drivers/passthrough/vtd/extern.h b/xen/drivers/passthrough/vtd/extern.h
index 39602d1f88f82fdc94d2d94bab07dc4d95692223..4115e48b6047091f60e929199e1f13a264446ae1 100644
--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -11,7 +11,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (C) Allen Kay <allen.m.kay@intel.com>
  * Copyright (C) Weidong Han <weidong.han@intel.com>
diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
index 1512e4866b8cce8453c4c65838425c1ae093f197..0f0d390714ee77924570af6a7d6d0b8a954f0cc7 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -11,7 +11,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (C) Allen Kay <allen.m.kay@intel.com>
  * Copyright (C) Xiaohui Xin <xiaohui.xin@intel.com>
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 62e143125d99443e9949e51ccc65a1b92ff3b648..7f3780fadff7e48d8a5e9f98e87d9533b22194bd 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -11,7 +11,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (C) Ashok Raj <ashok.raj@intel.com>
  * Copyright (C) Shaohua Li <shaohua.li@intel.com>
diff --git a/xen/drivers/passthrough/vtd/iommu.h b/xen/drivers/passthrough/vtd/iommu.h
index 78aa8a96f5a01b7a5fb01d5ebcb3a934c0a51f29..caaa3d51ea9eafe50eeae2cc22691e8ecf55f3e3 100644
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -11,7 +11,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (C) Ashok Raj <ashok.raj@intel.com>
  */
diff --git a/xen/drivers/passthrough/vtd/qinval.c b/xen/drivers/passthrough/vtd/qinval.c
index 4f9ad136b9c50ec2ea86cd698879d7beb5444133..8952b454d5b28ce110346807169d8476b0b73e11 100644
--- a/xen/drivers/passthrough/vtd/qinval.c
+++ b/xen/drivers/passthrough/vtd/qinval.c
@@ -11,7 +11,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (C) Allen Kay <allen.m.kay@intel.com>
  * Copyright (C) Xiaohui Xin <xiaohui.xin@intel.com>
diff --git a/xen/drivers/passthrough/vtd/quirks.c b/xen/drivers/passthrough/vtd/quirks.c
index fcc8f73e8b906a3a7279410b7e80b55c6e4e61bd..763dd335a8ff7a4bf23ad4f135c7fdf6d523b94b 100644
--- a/xen/drivers/passthrough/vtd/quirks.c
+++ b/xen/drivers/passthrough/vtd/quirks.c
@@ -11,7 +11,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Author: Allen Kay <allen.m.kay@intel.com>
  */
diff --git a/xen/drivers/passthrough/vtd/utils.c b/xen/drivers/passthrough/vtd/utils.c
index 7c4d032f4f275dca753b011ef6f337e231fd3107..0a1e2ced49db198b6b02dd0471c184803d26c7cd 100644
--- a/xen/drivers/passthrough/vtd/utils.c
+++ b/xen/drivers/passthrough/vtd/utils.c
@@ -11,7 +11,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (C) Allen Kay <allen.m.kay@intel.com>
  */
diff --git a/xen/drivers/passthrough/vtd/vtd.h b/xen/drivers/passthrough/vtd/vtd.h
index cb2df76eeddbd1f1e3682f7acc28433efdc5c643..af6d64ce20a41ec74ebbd02dce3509b5539834d8 100644
--- a/xen/drivers/passthrough/vtd/vtd.h
+++ b/xen/drivers/passthrough/vtd/vtd.h
@@ -11,7 +11,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (C) Allen Kay <allen.m.kay@intel.com>
  * Copyright (C) Weidong Han <weidong.han@intel.com>
diff --git a/xen/drivers/passthrough/vtd/x86/ats.c b/xen/drivers/passthrough/vtd/x86/ats.c
index 04d702b1d6b1985e4e0a07eb29118133b1682c77..fba0d92d6011ae5c422b777af31c4b5efedba93a 100644
--- a/xen/drivers/passthrough/vtd/x86/ats.c
+++ b/xen/drivers/passthrough/vtd/x86/ats.c
@@ -11,7 +11,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Author: Allen Kay <allen.m.kay@intel.com>
  */
diff --git a/xen/drivers/passthrough/vtd/x86/hvm.c b/xen/drivers/passthrough/vtd/x86/hvm.c
index bc776cf7daaa206273f1e90ef9667a0725444f69..420bc6aa4e3b4c0624535761e7882561c9552dec 100644
--- a/xen/drivers/passthrough/vtd/x86/hvm.c
+++ b/xen/drivers/passthrough/vtd/x86/hvm.c
@@ -11,7 +11,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (C) Allen Kay <allen.m.kay@intel.com>
  * Copyright (C) Weidong Han <weidong.han@intel.com>
diff --git a/xen/drivers/passthrough/vtd/x86/vtd.c b/xen/drivers/passthrough/vtd/x86/vtd.c
index 76f12adc23dfc5f3d6d62056f7e85029d212e618..ccb5710683a3179b3e7a3b091612a60adc0cb786 100644
--- a/xen/drivers/passthrough/vtd/x86/vtd.c
+++ b/xen/drivers/passthrough/vtd/x86/vtd.c
@@ -11,7 +11,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (C) Allen Kay <allen.m.kay@intel.com>
  * Copyright (C) Weidong Han <weidong.han@intel.com>
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index dd09ec22f12d53c1f1a3f1643a7792281eeffc0b..c424a7fd01a6c62b7318ade02d66ad2c70ac28de 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -11,7 +11,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (C) Allen Kay <allen.m.kay@intel.com>
  * Copyright (C) Xiaohui Xin <xiaohui.xin@intel.com>
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index f671b0f2bb45b22059a04be8f76d92c80b6700e9..dc5924d1ef6b7a3bfab941f6724e1d8b0e0077a8 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -9,7 +9,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/cpu.h>
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index ec2e978a4e6b16706f1c6ad61e4648b56c15f009..ac0418cffd9a42bbd92ce02e9476127ea84cac3e 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -14,7 +14,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/sched.h>
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 8f2b59e61aa42eca4d2bb583019a6e2df952b9f3..9649cf30c116346497017009ba32ad9df866a999 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -13,7 +13,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/sched.h>
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index bea0cc7aede17847bdfc1a4735d1e0a06acf6fb0..cdad7cbcb6a96bf74250b4f61b46bb011ff03a82 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -14,7 +14,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/sched.h>
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 6d48d496bb4871e28f3c25a730dcbdf88dd48151..662419892399f5c5f2daec705fcedaf83e9dfef7 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -14,7 +14,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/sched.h>
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index 352f27f6a72396ada2dc30c6374d766614c2094f..1e1ea51fc6b55868f7d7643100d84ec008285762 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
diff --git a/xen/include/xen/argo.h b/xen/include/xen/argo.h
index fd4cfdd55c0ab90cd9ed2723a1fd7e867d33f4de..6653970bc45b9c23484985b27e7aef14c4223363 100644
--- a/xen/include/xen/argo.h
+++ b/xen/include/xen/argo.h
@@ -9,7 +9,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __XEN_ARGO_H__
diff --git a/xen/include/xen/atomic.h b/xen/include/xen/atomic.h
index 529213ebbb4b8cf6ab40b3f32fcf93c8be8a29e7..550087f5f29b3a1c4826b50a80ad9db7a2d0a190 100644
--- a/xen/include/xen/atomic.h
+++ b/xen/include/xen/atomic.h
@@ -16,7 +16,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __XEN_ATOMIC_H__
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index f93c1b6ee8198cc7560808cdfab9ed72a74fc273..eb3fd1651f011c0430fcd058313e12f1d7cecf68 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -172,7 +172,7 @@
  *              ...
  *
  * This has already been reported upstream:
- * https://bugs.llvm.org/show_bug.cgi?id=32595
+ * https://bugs.llvm.org/show_bug.cgi?id=32595 
  */
 #ifdef __clang__
 # define CLANG_DISABLE_WARN_GCC_COMPAT_START                    \
diff --git a/xen/include/xen/cper.h b/xen/include/xen/cper.h
index 8788ceff126d98d7edd9d963c89934a2671fbd59..5df340bae735d22deb5359ee299bacbb46cbeab5 100644
--- a/xen/include/xen/cper.h
+++ b/xen/include/xen/cper.h
@@ -15,7 +15,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef LINUX_CPER_H
diff --git a/xen/include/xen/cpuidle.h b/xen/include/xen/cpuidle.h
index 521a8deb04c23bba99178d341d0cc05288b6382d..e04d928291a32054298241f26f7f3a141b1d2c01 100644
--- a/xen/include/xen/cpuidle.h
+++ b/xen/include/xen/cpuidle.h
@@ -19,7 +19,7 @@
  *  General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License along
- *  with this program; If not, see <http://www.gnu.org/licenses/>.
+ *  with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
diff --git a/xen/include/xen/dm.h b/xen/include/xen/dm.h
index 18417d57f1e5a20d2f97d40bb19cfebfb5e6217a..cfeef82473a276efa07c9fa6fbdc50f480021829 100644
--- a/xen/include/xen/dm.h
+++ b/xen/include/xen/dm.h
@@ -11,7 +11,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __XEN_DM_H__
diff --git a/xen/include/xen/elfstructs.h b/xen/include/xen/elfstructs.h
index 42afd609c22030fb2cfd77277488e0981fa44dd4..ca4c32436293279fc51d90c578e7f73da0e586f6 100644
--- a/xen/include/xen/elfstructs.h
+++ b/xen/include/xen/elfstructs.h
@@ -45,7 +45,7 @@ typedef uint64_t	Elf64_Xword;
 
 /*
  * e_ident[] identification indexes
- * See https://www.caldera.com/developers/gabi/2000-07-17/ch4.eheader.html
+ * See https://www.caldera.com/developers/gabi/2000-07-17/ch4.eheader.html 
  */
 #define EI_MAG0		0		/* file ID */
 #define EI_MAG1		1		/* file ID */
diff --git a/xen/include/xen/gdbstub.h b/xen/include/xen/gdbstub.h
index 18c960969b769d20d035855479391407587c3636..9fd079d85616df1b12356109969a36cb25459eb9 100644
--- a/xen/include/xen/gdbstub.h
+++ b/xen/include/xen/gdbstub.h
@@ -14,7 +14,7 @@
  * GNU General Public License for more details.
  * 
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __XEN_GDBSTUB_H__
diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 85fe6b7b5eb20c078ee422d1550be755af799a86..84d61b3ce99c0a0672bbd69afdaf53b12764ca94 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -17,7 +17,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __XEN_GRANT_TABLE_H__
diff --git a/xen/include/xen/inttypes.h b/xen/include/xen/inttypes.h
index 28c0053f1c7adab0d56615b2a217ebbeb4e516a8..4db9ab779331caf7826c6bcaf14574de8b704b64 100644
--- a/xen/include/xen/inttypes.h
+++ b/xen/include/xen/inttypes.h
@@ -12,7 +12,7 @@
    Lesser General Public License for more details.
 
    You should have received a copy of the GNU Lesser General Public
-   License along with the GNU C Library; If not, see <http://www.gnu.org/licenses/>.  */
+   License along with the GNU C Library; If not, see <https://www.gnu.org/licenses/>.  */
 
 /*
  *	ISO C99: 7.8 Format conversion of integer types	<inttypes.h>
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 4f22fc1bed5523c5b1a8951579975e0712c08c28..964b690628faef1bbd9ec3edc2775fd79f3bbe0f 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -11,7 +11,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (C) Allen Kay <allen.m.kay@intel.com>
  */
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index a26614d331e3c98f9d4b7967b6fdd9d4e6a49de6..2e2004cf6a07e8992c5db80972685a4e4c5c7fd8 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -13,7 +13,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __XEN_IOREQ_H__
diff --git a/xen/include/xen/mem_access.h b/xen/include/xen/mem_access.h
index 4e4811680dc96fc40928f1b21208c6dc3f5f49ec..1ed4fde2a8cafce4f6a549ea286837b90d3e418b 100644
--- a/xen/include/xen/mem_access.h
+++ b/xen/include/xen/mem_access.h
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef _XEN_MEM_ACCESS_H
diff --git a/xen/include/xen/monitor.h b/xen/include/xen/monitor.h
index 6b17a9307195df172b62bd9acf2cbb2c964dfad4..2652b016ed8a2f855717a32a2977c7266c049749 100644
--- a/xen/include/xen/monitor.h
+++ b/xen/include/xen/monitor.h
@@ -16,7 +16,7 @@
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
- * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * License along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #ifndef __XEN_MONITOR_H__
diff --git a/xen/include/xen/multiboot.h b/xen/include/xen/multiboot.h
index 80a1761d9ee7742b30d5c8a18a4d962dfed181da..d3a1998c93d9527aef2a8a224fa6778783e157b8 100644
--- a/xen/include/xen/multiboot.h
+++ b/xen/include/xen/multiboot.h
@@ -12,7 +12,7 @@
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
-   along with this program; If not, see <http://www.gnu.org/licenses/>.  */
+   along with this program; If not, see <https://www.gnu.org/licenses/>.  */
 
 #ifndef __MULTIBOOT_H__
 #define __MULTIBOOT_H__
diff --git a/xen/include/xen/radix-tree.h b/xen/include/xen/radix-tree.h
index 58c40312e61986e311576beff7b8627cfde64c7b..3ffe32b27c60ab7bc74515550bee1f09b57e3985 100644
--- a/xen/include/xen/radix-tree.h
+++ b/xen/include/xen/radix-tree.h
@@ -14,7 +14,7 @@
  * General Public License for more details.
  * 
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 #ifndef _XEN_RADIX_TREE_H
 #define _XEN_RADIX_TREE_H
diff --git a/xen/include/xen/rbtree.h b/xen/include/xen/rbtree.h
index 77bf57d4abc8da2ed7cfa6adbe5f8ab78fc17a29..99473a8db0a46bdbe845c4730956e2e6c1e35e25 100644
--- a/xen/include/xen/rbtree.h
+++ b/xen/include/xen/rbtree.h
@@ -13,7 +13,7 @@
   GNU General Public License for more details.
 
   You should have received a copy of the GNU General Public License
-  along with this program; If not, see <http://www.gnu.org/licenses/>.
+  along with this program; If not, see <https://www.gnu.org/licenses/>.
 
   linux/include/linux/rbtree.h
 
diff --git a/xen/include/xen/rcupdate.h b/xen/include/xen/rcupdate.h
index f123b77aafaa1cb50ba6bceea88cfb4408e9cb6d..cde46128944ae23dad12061225410f88b1e1f468 100644
--- a/xen/include/xen/rcupdate.h
+++ b/xen/include/xen/rcupdate.h
@@ -12,7 +12,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (C) IBM Corporation, 2001
  *
diff --git a/xen/include/xen/vm_event.h b/xen/include/xen/vm_event.h
index 92811d9110e5509009aaa47278d63643412bd0ee..d60681bec668ebf0d27dac69b8d3ade6ae3f333d 100644
--- a/xen/include/xen/vm_event.h
+++ b/xen/include/xen/vm_event.h
@@ -16,7 +16,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ * along with this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 
diff --git a/xen/lib/list-sort.c b/xen/lib/list-sort.c
index de1af2ef8b0c279f3fbd9b93aa68619bb34dad51..82670110e20efda833a85f99838f461f42e10fdd 100644
--- a/xen/lib/list-sort.c
+++ b/xen/lib/list-sort.c
@@ -12,7 +12,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 
 #include <xen/list.h>
diff --git a/xen/lib/rbtree.c b/xen/lib/rbtree.c
index 8b6c2c7572cd9793bbb77192704db27e04cb3988..ba03bfae71aafa1c590f66f96d586a2b4169eadc 100644
--- a/xen/lib/rbtree.c
+++ b/xen/lib/rbtree.c
@@ -15,7 +15,7 @@
   GNU General Public License for more details.
 
   You should have received a copy of the GNU General Public License
-  along with this program; If not, see <http://www.gnu.org/licenses/>.
+  along with this program; If not, see <https://www.gnu.org/licenses/>.
 
   linux/lib/rbtree.c
 */
diff --git a/xen/xsm/silo.c b/xen/xsm/silo.c
index b89b364287840623792f853e44070ce24a2b3cc4..1570fb2b2f72b6829f7bb39d939240d7bcb6e69e 100644
--- a/xen/xsm/silo.c
+++ b/xen/xsm/silo.c
@@ -15,7 +15,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
+ * this program; If not, see <https://www.gnu.org/licenses/>.
  */
 #define XSM_NO_WRAPPERS
 #include <xsm/dummy.h>
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

