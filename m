Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C4768E744
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 05:52:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491524.760724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPcQg-0006Bu-Qt; Wed, 08 Feb 2023 04:51:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491524.760724; Wed, 08 Feb 2023 04:51:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPcQg-00069o-Lu; Wed, 08 Feb 2023 04:51:34 +0000
Received: by outflank-mailman (input) for mailman id 491524;
 Wed, 08 Feb 2023 04:51:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mMba=6E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pPcQe-0005Mi-9m
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 04:51:32 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f7162e9-a76c-11ed-933c-83870f6b2ba8;
 Wed, 08 Feb 2023 05:51:28 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id E1C1C5C0096;
 Tue,  7 Feb 2023 23:51:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 07 Feb 2023 23:51:27 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Feb 2023 23:51:25 -0500 (EST)
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
X-Inumbo-ID: 3f7162e9-a76c-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1675831887; x=1675918287; bh=Hwlx+HFJQc
	MjQAaxpZj9K126hSKE+cYpG2Bet+RH630=; b=U9VNf2m1IkGmrBDjVQTeCvMTRe
	Y6dBDZuxFSmXS6+I3sLIEV0mbIDuQxJs+SaCNm+Nk7v0+T8LVfLbipS8vaAqsXcN
	6gVKmaDwUd+XF3yEuUscZJ6QutD9fvuTj8T4OvJgBNSl21boOPhEHHjQhFBzV3IJ
	U45vAs/mdBds+oeG63l519MjwLmvt8yWjEQRWcOv9G8HWfQ9BtoXBe1P4X8sewFZ
	OjMOB+IMeYg0Yo1AcOtQItA/+JnRHNj5zXJMkwXd4PMOhKWx0UTQsCoekOwqhVfS
	jJZ6Z15CPylXp0ANmc+WaJLGaTpPxGdDm2HtTws6MbmeATJYlB18GjgBMHMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1675831887; x=
	1675918287; bh=Hwlx+HFJQcMjQAaxpZj9K126hSKE+cYpG2Bet+RH630=; b=L
	w/wUIAFzwE4i/yJo7j+Phvk2WjHQ/2LWwc3je0egUDdNzchOWZMdcBEJjDgF4jNV
	JaBxOzDCG4KdvKnJFnMIO5QiUBNcaNpDl4fLgu/0pV/HmsaC3rWfioG6bngbq2Gc
	in8ZERCImLTm1EF7jL71vsqxjsiWrzE/a/MwNN3+y4IvbD8JykOCmomxi8YbqK5B
	XTbllKpABj2dKvczxzt0tVJyzIcDhu2rY4ahivx5RQ/vVCxkf9irzyvAZDPrdums
	HG8fYofDpv2p13Pe86KET3BNH3GgXoGE7NSdXlVTglXwziObP9Y6rir6/lw0NHk2
	cPzit1wf01WL0MQ65gVXQ==
X-ME-Sender: <xms:TyrjY6Ieh3ZsMdyqjj8mgLk050lwGSV1xJ8AYd_athQguzG7tfAHvA>
    <xme:TyrjYyKzW95Z5MpON6D0XDFcA_xfV9CcFdUgylsvPBX08Qv8NalpVhB-3m9yHmEHK
    EKL81zM_ZVwRxk>
X-ME-Received: <xmr:TyrjY6sptKYo0Dn6RWy8MWK-xDXq9JEUjORWW0L6OOVVmu-VQ2xGjAzhoE_0s3WAQ_tnCYwbLZI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudegledgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    goufhushhpvggtthffohhmrghinhculdegledmnegfrhhlucfvnfffucdlgedmnecujfgu
    rhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeffvghmihcuof
    grrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhmqeenucggtffrrghtthgvrhhnpeettddukeduffffjedtfeefieetiefgvd
    evjeefkefhffekteeggfevueekkeffudenucffohhmrghinhepghhnuhdrohhrghdpghho
    ohhprdhorhhgpdhsohhurhgtvghfohhrghgvrdhnvghtpdhfrhgvvggsshgurdhorhhgpd
    hnvghtsghsugdrohhrghdpohhpvghnsghsugdrohhrghdpihhnthgvlhdrtghordhukhdp
    rghmugdrtghomhdpihhnthgvlhdrtghomhdphihouhhtuhgsvgdrtghomhdplhhinhhugi
    hfohhunhgurghtihhonhdrohhrghdpgigvnhhprhhojhgvtghtrdhorhhgpdigvghnrdho
    rhhgpdhslhhiuggvshhhrghrvgdrnhgvthdpghhoohhglhgvrdgtohhmpdgrmhguieegrd
    horhhgpdhkvghrnhgvlhdrohhrghdpfhhrvggvqdgvlhgvtghtrhhonhhsrdgtohhmpdgu
    vghngidruggvpdguvghvihgtvghtrhgvvgdrohhrghdpuhifrghtvghrlhhoohdrtggrpd
    hkvghrnhgvlhhnvgifsghivghsrdhorhhgpdgtohhrnhgvlhhlrdgvughupdhfrghurdgu
    vgdpghhithhhuhgsrdgtohhmpdhrvggrughthhgvughotghsrdhiohdpshgthhgurdifsh
    dpohhpvghnghhrohhuphdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhm
X-ME-Proxy: <xmx:TyrjY_bLrNCQiEasPdJYNDjite6HWSW2zrZF_K_1YmVVnmA45reIhA>
    <xmx:TyrjYxag3a_AqOc87OlMUilXEhZVPOTWyRCeV-uJkgIEmefbxoU-KQ>
    <xmx:TyrjY7CJXyjuhF2fjS5EglB2hIbYLSiUmacsosBU8vWNgiAuWWdC5Q>
    <xmx:TyrjY7bEAx-yXiO2Y4uYqn9yH-BsdDjfBRr4tRnoeRlC12kArStqEQ>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Paul Durrant <paul@xen.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 3/4] Miscellaneous and documentation: Only use TLS-protected transports
Date: Tue,  7 Feb 2023 23:51:06 -0500
Message-Id: <83ecebe5c6b57713b0265fe0aeea25700f2b892b.1675829867.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1675829866.git.demi@invisiblethingslab.com>
References: <cover.1675829866.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Obtaining code over an insecure transport is a terrible idea for
blatently obvious reasons.  Even for non-executable data, insecure
transports are considered deprecated.

This patch changes miscellaneous links that are not used by any
automated tool.  Some of these links are dead anyway.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
This patch might well have flaws, not least due to its sheer size.

 COPYING                                       |  4 ++--
 CREDITS                                       |  2 +-
 README                                        |  4 ++--
 SUPPORT.md                                    |  2 +-
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
 docs/misc/pvcalls.pandoc                      | 18 +++++++--------
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
 m4/pkg.m4                                     |  2 +-
 misc/coverity/model.c                         |  2 +-
 stubdom/vtpmmgr/tpmrsa.c                      |  4 +---
 stubdom/vtpmmgr/tpmrsa.h                      |  2 +-
 tools/configure                               | 12 +++++-----
 tools/examples/xeninfo.pl                     |  4 ++--
 tools/firmware/Makefile                       |  2 +-
 tools/firmware/etherboot/README               | 23 +------------------
 tools/firmware/hvmloader/pci_regs.h           |  2 +-
 tools/firmware/hvmloader/pir.c                |  2 +-
 tools/firmware/hvmloader/pir_types.h          |  2 +-
 tools/firmware/hvmloader/smbios_types.h       |  2 +-
 tools/firmware/rombios/32bit/pmm.c            |  2 +-
 tools/firmware/rombios/rombios.c              |  8 +++----
 tools/firmware/vgabios/README                 | 10 ++++----
 tools/firmware/vgabios/vbe.c                  |  2 +-
 tools/firmware/vgabios/vbe_display_api.txt    |  8 +++----
 tools/firmware/vgabios/vgabios.c              |  8 +++----
 tools/fuzz/README.afl                         |  2 +-
 tools/hotplug/Linux/xendomains.in             |  2 +-
 tools/include/libxenvchan.h                   |  2 +-
 tools/include/libxl.h                         |  2 +-
 tools/libacpi/build.c                         |  2 +-
 tools/libfsimage/reiserfs/fsys_reiserfs.c     |  2 +-
 tools/libfsimage/xfs/xfs.h                    |  4 ++--
 tools/libfsimage/zfs/zfs_sha256.c             |  2 +-
 tools/libs/light/libxl_genid.c                |  2 +-
 tools/libs/stat/xenstat_qmp.c                 |  2 +-
 tools/misc/mkrpm                              |  2 +-
 .../ocaml/libs/xentoollog/xentoollog_stubs.c  |  2 +-
 tools/ocaml/libs/xl/xenlight_stubs.c          |  2 +-
 tools/tests/vhpet/main.c                      |  2 +-
 tools/xenstore/talloc.c                       |  2 +-
 tools/xenstore/talloc_guide.txt               |  2 +-
 tools/xl/check-xl-disk-parse                  |  6 ++---
 xen/arch/arm/arm32/head.S                     |  2 +-
 xen/arch/arm/arm64/head.S                     |  2 +-
 xen/arch/arm/arm64/lib/memcmp.S               |  2 +-
 xen/arch/arm/arm64/lib/memcpy.S               |  2 +-
 xen/arch/arm/arm64/lib/memmove.S              |  2 +-
 xen/arch/arm/arm64/lib/memset.S               |  2 +-
 xen/arch/arm/arm64/lib/strcmp.S               |  2 +-
 xen/arch/arm/arm64/lib/strlen.S               |  2 +-
 xen/arch/arm/arm64/lib/strncmp.S              |  2 +-
 xen/arch/arm/arm64/lib/strnlen.S              |  2 +-
 xen/arch/arm/include/asm/smccc.h              |  2 +-
 xen/arch/arm/include/asm/tee/optee_smc.h      |  2 +-
 xen/arch/x86/cpu/mcheck/amd_nonfatal.c        |  6 ++---
 xen/arch/x86/cpu/mcheck/mce_amd.c             |  8 +++----
 xen/arch/x86/cpu/microcode/core.c             |  4 ++--
 xen/arch/x86/cpu/microcode/intel.c            |  4 ++--
 xen/arch/x86/dmi_scan.c                       |  2 +-
 xen/arch/x86/hvm/vioapic.c                    |  4 ++--
 xen/arch/x86/hvm/vmsi.c                       |  4 ++--
 xen/arch/x86/include/asm/edd.h                |  4 ++--
 xen/arch/x86/include/asm/hpet.h               |  2 +-
 xen/arch/x86/include/asm/hvm/vioapic.h        |  4 ++--
 xen/common/README.source                      |  6 ++---
 xen/common/bunzip2.c                          |  4 ++--
 xen/common/lz4/decompress.c                   |  6 ++---
 xen/common/lzo.c                              |  8 +++----
 xen/common/rcupdate.c                         |  6 ++---
 xen/common/unlzma.c                           |  6 ++---
 xen/common/unlzo.c                            |  2 +-
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
 xen/drivers/passthrough/arm/ipmmu-vmsa.c      |  2 +-
 xen/drivers/passthrough/pci.c                 |  4 ++--
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
 xen/include/xen/compiler.h                    |  2 +-
 xen/include/xen/elfstructs.h                  |  4 ++--
 xen/include/xen/lzo.h                         |  2 +-
 xen/include/xen/pci_regs.h                    |  4 ++--
 xen/include/xen/rcupdate.h                    |  6 ++---
 xen/include/xen/xxhash.h                      |  2 +-
 xen/lib/rbtree.c                              |  2 +-
 xen/lib/xxhash32.c                            |  2 +-
 xen/lib/xxhash64.c                            |  2 +-
 xen/tools/kconfig/gconf.c                     |  2 +-
 xen/tools/kconfig/merge_config.sh             |  4 ++--
 xen/tools/kconfig/qconf.cc                    |  2 +-
 133 files changed, 221 insertions(+), 244 deletions(-)

diff --git a/COPYING b/COPYING
index 824c3aa353b47507241831f4753590f86a162014..74ebc2a18ac2fb407a92e48f59e1b6f3828ad2ba 100644
--- a/COPYING
+++ b/COPYING
@@ -16,9 +16,9 @@ the *License Exceptions* section of this file.
 When these code sections are compiled as part of a
 GPLv2-licensed program, such as Xen, the result is licensed under
 GPLv2. See the FSF's definition of GPL compatibility:
- http://www.gnu.org/licenses/gpl-faq.html#WhatDoesCompatMean
+ https://www.gnu.org/licenses/gpl-faq.html#WhatDoesCompatMean
 And how this applies to a range of open source licenses:
- http://www.gnu.org/licenses/license-list.html
+ https://www.gnu.org/licenses/license-list.html
 
 A number of files will also specify GPL exceptions, such as
  - Autoconf exception
diff --git a/CREDITS b/CREDITS
index 3ddcdbaac64c47d95f13091e00146cfbde7cc58b..741856859c787820a83782611c6cd6ee95fe4176 100644
--- a/CREDITS
+++ b/CREDITS
@@ -11,6 +11,6 @@
 
 N: Jeremy Fitzhardinge
 E: jeremy@goop.org
-W: http://www.goop.org/~jeremy
+W: https://www.goop.org/~jeremy
 P: 1B40B6D0
 D: Linux pvops
diff --git a/README b/README
index f8cc426f78d690f37e013242e81d4e440556c330..aca8182c9f17e8457515fd9e2f7c66b486e93557 100644
--- a/README
+++ b/README
@@ -206,7 +206,7 @@ Tboot is an open source, pre- kernel/VMM module that uses Intel(R) TXT to
 perform a measured and verified launch of an OS kernel/VMM.
 
 The Trusted Boot module is available from
-http://sourceforge.net/projects/tboot.  This project hosts the code in a
-mercurial repo at http://tboot.sourceforge.net/hg/tboot.hg and contains
+https://sourceforge.net/projects/tboot.  This project hosts the code in a
+mercurial repo at https://tboot.sourceforge.net/hg/tboot.hg and contains
 tarballs of the source.  Instructions in the tboot README describe how
 to modify grub.conf to use tboot to launch Xen.
diff --git a/SUPPORT.md b/SUPPORT.md
index 295369998e6ac07f11c1a4e0783bd5a87ee948e9..479d64802c46cb84be89802d230d6f7594d92265 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -1122,6 +1122,6 @@ External projects that provide their own security support for Xen-related featur
 
   * FreeBSD https://www.freebsd.org/security/
 
-  * NetBSD http://www.netbsd.org/support/security/
+  * NetBSD https://www.netbsd.org/support/security/
 
   * OpenBSD https://www.openbsd.org/security.html
diff --git a/docs/features/feature-levelling.pandoc b/docs/features/feature-levelling.pandoc
index 171a42c358409f4ab24f0d783628187a367c15b8..0b3659ec8920771d33c6a9813535f5648ff92169 100644
--- a/docs/features/feature-levelling.pandoc
+++ b/docs/features/feature-levelling.pandoc
@@ -202,9 +202,9 @@ Corruption)
 
 # References
 
-[Intel Flexmigration](http://www.intel.co.uk/content/dam/www/public/us/en/documents/application-notes/virtualization-technology-flexmigration-application-note.pdf)
+[Intel Flexmigration](https://www.intel.co.uk/content/dam/www/public/us/en/documents/application-notes/virtualization-technology-flexmigration-application-note.pdf)
 
-[AMD Extended Migration Technology](http://developer.amd.com/wordpress/media/2012/10/43781-3.00-PUB_Live-Virtual-Machine-Migration-on-AMD-processors.pdf)
+[AMD Extended Migration Technology](https://developer.amd.com/wordpress/media/2012/10/43781-3.00-PUB_Live-Virtual-Machine-Migration-on-AMD-processors.pdf)
 
 
 # History
diff --git a/docs/features/intel_psr_cat_cdp.pandoc b/docs/features/intel_psr_cat_cdp.pandoc
index 1fb02ea1e6746ee2e87e12bb08c0454997ed397a..a05d6b084597c88c8ea2539cd37798f8de788d67 100644
--- a/docs/features/intel_psr_cat_cdp.pandoc
+++ b/docs/features/intel_psr_cat_cdp.pandoc
@@ -448,7 +448,7 @@ N/A
 
 # References
 
-"INTEL RESOURCE DIRECTOR TECHNOLOGY (INTEL RDT) ALLOCATION FEATURES" [Intel 64 and IA-32 Architectures Software Developer Manuals, vol3](http://www.intel.com/content/www/us/en/processors/architectures-software-developer-manuals.html)
+"INTEL RESOURCE DIRECTOR TECHNOLOGY (INTEL RDT) ALLOCATION FEATURES" [Intel 64 and IA-32 Architectures Software Developer Manuals, vol3](https://www.intel.com/content/www/us/en/processors/architectures-software-developer-manuals.html)
 
 # History
 
diff --git a/docs/features/intel_psr_mba.pandoc b/docs/features/intel_psr_mba.pandoc
index 86df661ba8866b2d0a099682230ffad1b97f4408..b46ab657043e5ead4afd8d0e982da5678868cf9d 100644
--- a/docs/features/intel_psr_mba.pandoc
+++ b/docs/features/intel_psr_mba.pandoc
@@ -242,7 +242,7 @@ N/A
 
 # References
 
-"INTEL RESOURCE DIRECTOR TECHNOLOGY (INTEL RDT) ALLOCATION FEATURES" [Intel 64 and IA-32 Architectures Software Developer Manuals, vol3](http://www.intel.com/content/www/us/en/processors/architectures-software-developer-manuals.html)
+"INTEL RESOURCE DIRECTOR TECHNOLOGY (INTEL RDT) ALLOCATION FEATURES" [Intel 64 and IA-32 Architectures Software Developer Manuals, vol3](https://www.intel.com/content/www/us/en/processors/architectures-software-developer-manuals.html)
 
 # History
 
diff --git a/docs/features/migration.pandoc b/docs/features/migration.pandoc
index 5334536d48f5250d9f755fbe43f2dd6bf7126bf8..d1c8086daf0c979390d8a214e9526ce46eb4e614 100644
--- a/docs/features/migration.pandoc
+++ b/docs/features/migration.pandoc
@@ -111,7 +111,7 @@ scenarios, which will involve starting with VMs from Xen 4.5
 
 Xen Developer Summit 2015 Presentation
 [video](https://www.youtube.com/watch?v=RwiDeG21lrc) and
-[slides](http://events.linuxfoundation.org/sites/events/files/slides/migv2.pdf)
+[slides](https://events.linuxfoundation.org/sites/events/files/slides/migv2.pdf)
 for Migration v2
 
 # History
diff --git a/docs/features/sched_credit.pandoc b/docs/features/sched_credit.pandoc
index 706513de6e449eec33f4864eed18cb327a053b42..974d47db16894ab83ad9c41280f3dd68a45fcce4 100644
--- a/docs/features/sched_credit.pandoc
+++ b/docs/features/sched_credit.pandoc
@@ -85,8 +85,8 @@ by also doing the following:
 * [potential non-ideal behavior on hyperthreaded systems](https://lists.xenproject.org/archives/html/xen-devel/2014-07/msg01848.html) [1]
 * [long standing BOOST vs. migration bug](https://lists.xen.org/archives/html/xen-devel/2015-10/msg02851.html) [2]
 * [priority handling issues](https://lists.xenproject.org/archives/html/xen-devel/2016-05/msg01362.html) [3]
-* "Scheduler development update", XenSummit Asia 2009 [whitepaper](http://www-archive.xenproject.org/files/xensummit_intel09/George_Dunlap.pdf) [4]
-* "Scheduling in Xen" [XPDS15 Presentation](http://events.linuxfoundation.org/sites/events/files/slides/Faggioli_XenSummit.pdf)
+* "Scheduler development update", XenSummit Asia 2009 [whitepaper](https://www-archive.xenproject.org/files/xensummit_intel09/George_Dunlap.pdf) [4]
+* "Scheduling in Xen" [XPDS15 Presentation](https://events.linuxfoundation.org/sites/events/files/slides/Faggioli_XenSummit.pdf)
 * "The Credit Scheduler" [on the Xen-Project wiki](https://wiki.xenproject.org/wiki/Credit_Scheduler)
 * "Xen Project Schedulers" [on the Xen-Project wiki](https://wiki.xenproject.org/wiki/Xen_Project_Schedulers)
 
diff --git a/docs/features/sched_credit2.pandoc b/docs/features/sched_credit2.pandoc
index 436ff9f8f6ad4df0ff1410e768b2570faeb77485..95c739ee21eeb6b8034037cdabf6e6e777573fb0 100644
--- a/docs/features/sched_credit2.pandoc
+++ b/docs/features/sched_credit2.pandoc
@@ -91,9 +91,9 @@ following:
 
 # References
 
-* "Scheduler development update", XenSummit Asia 2009 [whitepaper](http://www-archive.xenproject.org/files/xensummit_intel09/George_Dunlap.pdf)
-* "Scheduling in Xen" [XPDS15 Presentation](http://events.linuxfoundation.org/sites/events/files/slides/Faggioli_XenSummit.pdf)
-* "Scope and Performance of Credit-2 Scheduler" [XPDS16 Presentation](http://www.slideshare.net/xen_com_mgr/xpds16-scope-and-performance-of-credit2-scheduler-anshul-makkar-ctirix-systems-uk-ltd)
+* "Scheduler development update", XenSummit Asia 2009 [whitepaper](https://www-archive.xenproject.org/files/xensummit_intel09/George_Dunlap.pdf)
+* "Scheduling in Xen" [XPDS15 Presentation](https://events.linuxfoundation.org/sites/events/files/slides/Faggioli_XenSummit.pdf)
+* "Scope and Performance of Credit-2 Scheduler" [XPDS16 Presentation](https://www.slideshare.net/xen_com_mgr/xpds16-scope-and-performance-of-credit2-scheduler-anshul-makkar-ctirix-systems-uk-ltd)
 * "The Credit2 Scheduler" [on the Xen-Project wiki](https://wiki.xenproject.org/wiki/Credit2_Scheduler_Development)
 * "Xen Project Schedulers" [on the Xen-Project wiki](https://wiki.xenproject.org/wiki/Xen_Project_Schedulers)
 
diff --git a/docs/features/sched_rtds.pandoc b/docs/features/sched_rtds.pandoc
index 4ccf704b53d08cd6ef618e3b521c293b87eb88ad..5c03d67f48df4c41a913e2a89a09630806388206 100644
--- a/docs/features/sched_rtds.pandoc
+++ b/docs/features/sched_rtds.pandoc
@@ -105,8 +105,8 @@ at a macroscopic level), the following should be done:
 
 # References
 
-* "RT-Xen: Real-Time Virtualization" [XPDS14 Presentation](http://events.linuxfoundation.org/sites/events/files/slides/2014_Xen_Developer_Summit_0.pdf)
-* "Scheduling in Xen" [XPDS15 Presentation](http://events.linuxfoundation.org/sites/events/files/slides/Faggioli_XenSummit.pdf)
+* "RT-Xen: Real-Time Virtualization" [XPDS14 Presentation](https://events.linuxfoundation.org/sites/events/files/slides/2014_Xen_Developer_Summit_0.pdf)
+* "Scheduling in Xen" [XPDS15 Presentation](https://events.linuxfoundation.org/sites/events/files/slides/Faggioli_XenSummit.pdf)
 * [RT-Xen Project](https://sites.google.com/site/realtimexen/)
 * [RTDS-Based-Scheduler](https://wiki.xenproject.org/wiki/RTDS-Based-Scheduler)
 * "The RTDS Scheduler" [on the Xen-Project wiki](https://wiki.xenproject.org/wiki/RTDS-Based-Scheduler)
diff --git a/docs/misc/amd-ucode-container.txt b/docs/misc/amd-ucode-container.txt
index 1db64662d56707e928fb39784bc31d51b25b5cfb..c5bfd08e65344b75e6e451a0cb151d5ead614b1a 100644
--- a/docs/misc/amd-ucode-container.txt
+++ b/docs/misc/amd-ucode-container.txt
@@ -85,6 +85,6 @@ they should obtain a "good" set  by downloading them from source links
 
 Reference(s):
 -------------
-[1] http://www.amd64.org/microcode.html 
+[1] https://www.amd64.org/microcode.html
 [2] https://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/tree/amd-ucode 
-[3] http://lxr.free-electrons.com/source/Documentation/x86/early-microcode.txt 
+[3] https://lxr.free-electrons.com/source/Documentation/x86/early-microcode.txt
diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
index bd7bfe7f284ad5ed56cfff009b52bf36aed8522f..dd28d1d5af6a9840b4dc66744ea8b97c87a05555 100644
--- a/docs/misc/arm/booting.txt
+++ b/docs/misc/arm/booting.txt
@@ -65,10 +65,10 @@ Xen relies on some settings the firmware has to configure in EL3 before starting
 
 
 [1] linux/Documentation/arm/booting.rst
-Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm/booting.rst
+Latest version: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm/booting.rst
 
 [2] linux/Documentation/arm64/booting.rst
-Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm64/booting.rst
+Latest version: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm64/booting.rst
 
 [3] legacy format header
 Latest version: https://source.denx.de/u-boot/u-boot/-/blob/master/include/image.h#L315
diff --git a/docs/misc/arm/passthrough.txt b/docs/misc/arm/passthrough.txt
index 4f0a024818a2b6f1610cd7a12c26b5532dba042d..c3f6c29fca583939e7fb7ae30f02a4bcff2343ea 100644
--- a/docs/misc/arm/passthrough.txt
+++ b/docs/misc/arm/passthrough.txt
@@ -50,7 +50,7 @@ Note:
         - ranges
         - #address-cells
         - #size-cells
-    * See http://www.devicetree.org/Device_Tree_Usage for more
+    * See https://www.devicetree.org/Device_Tree_Usage for more
     information about device tree.
     * In this example, the device MMIO region is placed at a different
     address (0x10000000) compared to the host address (0xfff51000)
diff --git a/docs/misc/kconfig-language.rst b/docs/misc/kconfig-language.rst
index 74bef19f69f0a8078f2f988358ff57046b46210b..f13fdb7ddc3739af4a89f3f93f8814d3815d69b5 100644
--- a/docs/misc/kconfig-language.rst
+++ b/docs/misc/kconfig-language.rst
@@ -669,10 +669,10 @@ and real world requirements were not well understood. As it stands though
 only reverse engineering techniques have been used to deduce semantics from
 variability modeling languages such as Kconfig [3]_.
 
-.. [0] http://www.eng.uwaterloo.ca/~shshe/kconfig_semantics.pdf
-.. [1] http://gsd.uwaterloo.ca/sites/default/files/vm-2013-berger.pdf
-.. [2] http://gsd.uwaterloo.ca/sites/default/files/ase241-berger_0.pdf
-.. [3] http://gsd.uwaterloo.ca/sites/default/files/icse2011.pdf
+.. [0] https://www.eng.uwaterloo.ca/~shshe/kconfig_semantics.pdf
+.. [1] https://gsd.uwaterloo.ca/sites/default/files/vm-2013-berger.pdf
+.. [2] https://gsd.uwaterloo.ca/sites/default/files/ase241-berger_0.pdf
+.. [3] https://gsd.uwaterloo.ca/sites/default/files/icse2011.pdf
 
 Full SAT solver for Kconfig
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -691,10 +691,10 @@ such efforts somehow on Kconfig. There is enough interest from mentors of
 existing projects to not only help advise how to integrate this work upstream
 but also help maintain it long term. Interested developers should visit:
 
-http://kernelnewbies.org/KernelProjects/kconfig-sat
+https://kernelnewbies.org/KernelProjects/kconfig-sat
 
-.. [4] http://www.cs.cornell.edu/~sabhar/chapters/SATSolvers-KR-Handbook.pdf
-.. [5] http://gsd.uwaterloo.ca/sites/default/files/vm-2013-berger.pdf
+.. [4] https://www.cs.cornell.edu/~sabhar/chapters/SATSolvers-KR-Handbook.pdf
+.. [5] https://gsd.uwaterloo.ca/sites/default/files/vm-2013-berger.pdf
 .. [6] https://cados.cs.fau.de
 .. [7] https://vamos.cs.fau.de
 .. [8] https://undertaker.cs.fau.de
diff --git a/docs/misc/livepatch.pandoc b/docs/misc/livepatch.pandoc
index d38e4ce074b399946aecdaedb4cb6fe5b8043b66..a94fb57eb568e85a25c93bf6a988f123d4e48443 100644
--- a/docs/misc/livepatch.pandoc
+++ b/docs/misc/livepatch.pandoc
@@ -993,7 +993,7 @@ The design of that is not discussed in this design.
 This is implemented in a seperate tool which lives in a seperate
 GIT repo.
 
-Currently it resides at git://xenbits.xen.org/livepatch-build-tools.git
+Currently it resides at https://xenbits.xen.org/git-http/livepatch-build-tools.git
 
 ### Exception tables and symbol tables growth
 
diff --git a/docs/misc/netif-staging-grants.pandoc b/docs/misc/netif-staging-grants.pandoc
index cb33028adc3dadc8a9fb2a7739af6e5027690f82..1643f852d0b8a80645c90f80d9c48e6d5045abcb 100644
--- a/docs/misc/netif-staging-grants.pandoc
+++ b/docs/misc/netif-staging-grants.pandoc
@@ -399,7 +399,7 @@ Depending on the implementation, it would mean that we no longer
 would need to aggregate as much as grant ops as possible (step 1) and could
 transmit the packet on the transmit function (e.g. Linux ```ndo_start_xmit```)
 as previously proposed
-here\[[0](http://lists.xenproject.org/archives/html/xen-devel/2015-05/msg01504.html)\].
+here\[[0](https://lists.xenproject.org/archives/html/xen-devel/2015-05/msg01504.html)\].
 This would heavily improve efficiency specifially for smaller packets. Which in
 return would decrease RTT, having data being acknoledged much quicker.
 
@@ -548,7 +548,7 @@ the results.
 
 # References
 
-[0] http://lists.xenproject.org/archives/html/xen-devel/2015-05/msg01504.html
+[0] https://lists.xenproject.org/archives/html/xen-devel/2015-05/msg01504.html
 
 [1] https://github.com/freebsd/freebsd/blob/master/sys/dev/netmap/netmap_mem2.c#L362
 
@@ -556,11 +556,11 @@ the results.
 
 [3] https://github.com/iovisor/bpf-docs/blob/master/Express_Data_Path.pdf
 
-[4] http://prototype-kernel.readthedocs.io/en/latest/networking/XDP/design/requirements.html#write-access-to-packet-data
+[4] https://prototype-kernel.readthedocs.io/en/latest/networking/XDP/design/requirements.html#write-access-to-packet-data
 
-[5] http://lxr.free-electrons.com/source/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c#L2073
+[5] https://lxr.free-electrons.com/source/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c#L2073
 
-[6] http://lxr.free-electrons.com/source/drivers/net/ethernet/mellanox/mlx4/en_rx.c#L52
+[6] https://lxr.free-electrons.com/source/drivers/net/ethernet/mellanox/mlx4/en_rx.c#L52
 
 [7] https://schd.ws/hosted_files/xendeveloperanddesignsummit2017/e6/ToGrantOrNotToGrant-XDDS2017_v3.pdf
 
diff --git a/docs/misc/pvcalls.pandoc b/docs/misc/pvcalls.pandoc
index 971cd8f4b1225d70b5cca31a3fe5121ddb8ae459..e86eef84e441cbe74f9c19a8ed509146e8a331d2 100644
--- a/docs/misc/pvcalls.pandoc
+++ b/docs/misc/pvcalls.pandoc
@@ -1072,13 +1072,13 @@ reading from the socket.
 
 [xenstore]: https://xenbits.xen.org/docs/unstable/misc/xenstore.txt
 [XenbusStateInitialising]: https://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,io,xenbus.h.html
-[address]: http://pubs.opengroup.org/onlinepubs/7908799/xns/syssocket.h.html
-[in]: http://pubs.opengroup.org/onlinepubs/000095399/basedefs/netinet/in.h.html
-[socket]: http://pubs.opengroup.org/onlinepubs/009695399/functions/socket.html
-[connect]: http://pubs.opengroup.org/onlinepubs/7908799/xns/connect.html
-[shutdown]: http://pubs.opengroup.org/onlinepubs/7908799/xns/shutdown.html
-[bind]: http://pubs.opengroup.org/onlinepubs/7908799/xns/bind.html
-[listen]: http://pubs.opengroup.org/onlinepubs/7908799/xns/listen.html
-[accept]: http://pubs.opengroup.org/onlinepubs/7908799/xns/accept.html
-[poll]: http://pubs.opengroup.org/onlinepubs/7908799/xsh/poll.html
+[address]: https://pubs.opengroup.org/onlinepubs/7908799/xns/syssocket.h.html
+[in]: https://pubs.opengroup.org/onlinepubs/000095399/basedefs/netinet/in.h.html
+[socket]: https://pubs.opengroup.org/onlinepubs/009695399/functions/socket.html
+[connect]: https://pubs.opengroup.org/onlinepubs/7908799/xns/connect.html
+[shutdown]: https://pubs.opengroup.org/onlinepubs/7908799/xns/shutdown.html
+[bind]: https://pubs.opengroup.org/onlinepubs/7908799/xns/bind.html
+[listen]: https://pubs.opengroup.org/onlinepubs/7908799/xns/listen.html
+[accept]: https://pubs.opengroup.org/onlinepubs/7908799/xns/accept.html
+[poll]: https://pubs.opengroup.org/onlinepubs/7908799/xsh/poll.html
 [ring.h]: https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/include/public/io/ring.h;hb=HEAD
diff --git a/docs/misc/status-override-table-spec.fodt b/docs/misc/status-override-table-spec.fodt
index a831b7323b2bed31e19a06553b0ac40f1dfc797f..73c9061d98ef027a18539b8475bb030e788a0824 100644
--- a/docs/misc/status-override-table-spec.fodt
+++ b/docs/misc/status-override-table-spec.fodt
@@ -485,7 +485,7 @@
    <text:p text:style-name="P11">Title:</text:p>
    <text:p text:style-name="P12">Define a list of ACPI namespace names that are to be ignored by the OSPM</text:p>
    <text:p text:style-name="P11">License:</text:p>
-   <text:p text:style-name="P5"><text:span text:style-name="T1">This work is licensed under the Creative Commons Attribution 4.0 International License. To view a copy of this license, visit </text:span><text:a xlink:type="simple" xlink:href="http://creativecommons.org/licenses/by/4.0/" text:style-name="Internet_20_link" text:visited-style-name="Visited_20_Internet_20_Link"><text:span text:style-name="T5">http://creativecommons.org/licenses/by/4.0/</text:span></text:a><text:span text:style-name="T1"> or send a letter to Creative Commons, 444 Castro Street, Suite 900, Mountain View, California, 94041, USA.</text:span></text:p>
+   <text:p text:style-name="P5"><text:span text:style-name="T1">This work is licensed under the Creative Commons Attribution 4.0 International License. To view a copy of this license, visit </text:span><text:a xlink:type="simple" xlink:href="https://creativecommons.org/licenses/by/4.0/" text:style-name="Internet_20_link" text:visited-style-name="Visited_20_Internet_20_Link"><text:span text:style-name="T5">https://creativecommons.org/licenses/by/4.0/</text:span></text:a><text:span text:style-name="T1"> or send a letter to Creative Commons, 444 Castro Street, Suite 900, Mountain View, California, 94041, USA.</text:span></text:p>
    <text:p text:style-name="P11">Problem Statement:</text:p>
    <text:p text:style-name="P12">Hypervisors control which devices are allocated to which virtual machines. <text:s/>If ACPI tables created by platform firmware are passed directly from a hypervisor to a new virtual machine, the virtual machine can see all of the devices available to the hypervisor. <text:s/>This would be an incorrect view for the new virtual machine.</text:p>
    <text:p text:style-name="P5"><text:span text:style-name="T1">By the same token, embedding the ability to create ACPI tables on the fly within a hypervisor adds more complexity and increases the resources needed by the hypervisor to run. <text:s/>To be clear, this is not a problem for the straightforward tables </text:span><text:span text:style-name="T3">– </text:span><text:span text:style-name="T1">such as the FADT, MADT, SRAT, or others </text:span><text:span text:style-name="T3">– </text:span><text:span text:style-name="T1">but is a problem for the DSDT and SSDT that contain AML byte codes. <text:s/>Generating AML byte codes on the fly would require the use of an ASL compiler, the most complex part of the tools needed to create ACPI tables.</text:span></text:p>
diff --git a/docs/misc/vtd-pi.txt b/docs/misc/vtd-pi.txt
index d14b208c2781384fd2ea5ce5bd79666f790f71b2..4624a0f5a56824f1f5451303fb5d939cc50c2929 100644
--- a/docs/misc/vtd-pi.txt
+++ b/docs/misc/vtd-pi.txt
@@ -101,7 +101,7 @@ recorded in a data structure called a posted-interrupt descriptor.
 More information about APICv and CPU-side Posted-interrupt, please refer
 to Chapter "APIC VIRTUALIZATION AND VIRTUAL INTERRUPTS", and Section
 "POSTED-INTERRUPT PROCESSING" in the Intel SDM:
-http://www.intel.com/content/dam/www/public/us/en/documents/manuals/64-ia-32-architectures-software-developer-manual-325462.pdf 
+https://www.intel.com/content/dam/www/public/us/en/documents/manuals/64-ia-32-architectures-software-developer-manual-325462.pdf
 
 - Root-Complex Support
 Interrupt posting is the process by which an interrupt request (from IOAPIC
@@ -120,7 +120,7 @@ for the virtual-vectors and contains the attributes of the notification event
 interrupts recorded in the posted-interrupt descriptor.
 
 More information about VT-d PI, please refer to
-http://www.intel.com/content/www/us/en/intelligent-systems/intel-technology/vt-directed-io-spec.html 
+https://www.intel.com/content/www/us/en/intelligent-systems/intel-technology/vt-directed-io-spec.html
 
 Design Overview
 ==============
@@ -223,7 +223,7 @@ pCPU when an interrupt is recorded in the posted-interrupt descriptor.
 
 This existing global vector is a _special_ vector to CPU, CPU handle it in a
 _special_ way compared to normal vectors, please refer to 29.6 in Intel SDM
-http://www.intel.com/content/dam/www/public/us/en/documents/manuals/64-ia-32-architectures-software-developer-manual-325462.pdf 
+https://www.intel.com/content/dam/www/public/us/en/documents/manuals/64-ia-32-architectures-software-developer-manual-325462.pdf
 for more information about how CPU handles it.
 
 After having VT-d PI, VT-d engine can issue notification event when the
diff --git a/docs/misc/vtd.txt b/docs/misc/vtd.txt
index 89076a0776e4b23e0ec8e7600d65bc9f9a3f5980..61a042e15f69997a053e435bfac265f1ce1893bd 100644
--- a/docs/misc/vtd.txt
+++ b/docs/misc/vtd.txt
@@ -203,10 +203,10 @@ systems using following Intel motherboards:
 Feel free to add others as they become available.
 
 - Dell: Optiplex 755
-http://www.dell.com/content/products/category.aspx/optix?c=us&cs=555&l=en&s=biz
+https://www.dell.com/content/products/category.aspx/optix?c=us&cs=555&l=en&s=biz
 
 - HP Compaq:  DC7800
-http://h10010.www1.hp.com/wwpc/us/en/en/WF04a/12454-12454-64287-321860-3328898.html
+https://h10010.www1.hp.com/wwpc/us/en/en/WF04a/12454-12454-64287-321860-3328898.html
 
 For more information, pls refer to https://wiki.xen.org/wiki/VTdHowTo.
 
diff --git a/docs/misc/xen-env-table-spec.fodt b/docs/misc/xen-env-table-spec.fodt
index ccde7a69814f01a47bb1c5db471d571c1bd31aca..174e5fd1288429d998fb6eb2df188b8ef52973a0 100644
--- a/docs/misc/xen-env-table-spec.fodt
+++ b/docs/misc/xen-env-table-spec.fodt
@@ -530,7 +530,7 @@
    <text:p text:style-name="P14">Title:</text:p>
    <text:p text:style-name="P16">Define Xen Environment table for passing Xen specific information to DOM0.</text:p>
    <text:p text:style-name="P17">License:</text:p>
-   <text:p text:style-name="P5"><text:span text:style-name="T1">This work is licensed under the BSD License. To view a copy of this license, visit </text:span><text:a xlink:type="simple" xlink:href="http://opensource.org/licenses/BSD-3-Clause" text:style-name="Internet_20_link" text:visited-style-name="Visited_20_Internet_20_Link"><text:span text:style-name="T7">http://opensource.org/licenses/BSD-3-Clause</text:span></text:a><text:span text:style-name="T1">.</text:span></text:p>
+   <text:p text:style-name="P5"><text:span text:style-name="T1">This work is licensed under the BSD License. To view a copy of this license, visit </text:span><text:a xlink:type="simple" xlink:href="https://opensource.org/licenses/BSD-3-Clause" text:style-name="Internet_20_link" text:visited-style-name="Visited_20_Internet_20_Link"><text:span text:style-name="T7">https://opensource.org/licenses/BSD-3-Clause</text:span></text:a><text:span text:style-name="T1">.</text:span></text:p>
    <text:p text:style-name="P14">Problem Statement:</text:p>
    <text:p text:style-name="P16">DOM0(Linux) requires additional information about the Xen environment for proper communication with Xen. <text:s/>DOM0 shares some memory pages with Xen and it need the address and size of the memory allocated to it. <text:s/>DOM0 also needs to configure interrupt that will be used for notification of events. </text:p>
    <text:p text:style-name="P17">The Xen Environment Table:</text:p>
diff --git a/docs/misc/xenstore-paths.pandoc b/docs/misc/xenstore-paths.pandoc
index 5cd5c8a3b9391b12f5c603deacbfe72271cd8c25..1a502e1a5e28db53c4b3cc3ecf488792d94eae13 100644
--- a/docs/misc/xenstore-paths.pandoc
+++ b/docs/misc/xenstore-paths.pandoc
@@ -232,7 +232,7 @@ The BIOS used by this domain.
 
 These xenstore values are used to override some of the default string
 values in the SMBIOS table constructed in hvmloader. See the SMBIOS
-table specification at http://www.dmtf.org/standards/smbios/ 
+table specification at https://www.dmtf.org/standards/smbios/
 
 #### ~/bios-strings/oem-* = STRING [HVM,INTERNAL]
 
diff --git a/docs/misc/xl-psr.pandoc b/docs/misc/xl-psr.pandoc
index 3d196ed2edccb8df2717ebbc201465a2fbe78acc..b9de9af175fb7226c739646d95c38fbaabd9addc 100644
--- a/docs/misc/xl-psr.pandoc
+++ b/docs/misc/xl-psr.pandoc
@@ -251,4 +251,4 @@ hexadecimal value.
 ## Reference
 
 [1] Intel SDM
-(http://www.intel.com/content/www/us/en/processors/architectures-software-developer-manuals.html).
+(https://www.intel.com/content/www/us/en/processors/architectures-software-developer-manuals.html).
diff --git a/docs/misc/xsm-flask.txt b/docs/misc/xsm-flask.txt
index 2419c5cf2916de736122be57c7ad88802a9bd0a2..281e450bcfbbe4a703d9c6bd4df21642d3c0ee88 100644
--- a/docs/misc/xsm-flask.txt
+++ b/docs/misc/xsm-flask.txt
@@ -93,7 +93,7 @@ rebuild.
 FLASK uses only one domain configuration parameter (seclabel) defining the
 full security label of the newly created domain. If using the example policy,
 "seclabel='system_u:system_r:domU_t'" is an example of a normal domain. The
-labels are in the same format as SELinux labels; see http://selinuxproject.org
+labels are in the same format as SELinux labels; see https://selinuxproject.org
 for more details on the use of the user, role, and optional MLS/MCS labels.
 
 FLASK policy overview
diff --git a/docs/process/release-technician-checklist.txt b/docs/process/release-technician-checklist.txt
index 4b061bf5f20bbb72e092e5930177374f9bb0c10f..7a077777ec162c580d6d2f8edb4ba0474c5172b3 100644
--- a/docs/process/release-technician-checklist.txt
+++ b/docs/process/release-technician-checklist.txt
@@ -23,7 +23,7 @@ t=RELEASE-$r
 #  - check (for point releases, but not RCs) all XSAs have been applied (Lars)
 #
 * check, even for point releases
-*  http://logs.test-lab.xenproject.org/osstest/results/all-branch-statuses.txt
+*  https://logs.test-lab.xenproject.org/osstest/results/all-branch-statuses.txt
 
 
 # QEMU
diff --git a/docs/process/sending-patches.pandoc b/docs/process/sending-patches.pandoc
index 2e74c3b57ef5a5ee88230b3ca367ea56ab10846f..654ba2360592f85f6a9cc126c27417bbe428372c 100644
--- a/docs/process/sending-patches.pandoc
+++ b/docs/process/sending-patches.pandoc
@@ -82,7 +82,7 @@ modified form), the `Origin:` tag specifies the source of the patch:
 
 E.g.:
 
-    Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git f093b08c47b3
+    Origin: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git f093b08c47b3
 
 The commit id should be shortened to its first 12 characters.
 
diff --git a/docs/process/xen-release-management.pandoc b/docs/process/xen-release-management.pandoc
index 8f80d61d2f1aa9e63da9b1e61b77a67c826efe6f..7826419dad563a3b70c3c97fc4c0fb5339bd58e9 100644
--- a/docs/process/xen-release-management.pandoc
+++ b/docs/process/xen-release-management.pandoc
@@ -271,7 +271,7 @@ Hi all,
 
 Xen X.Y rcZ is tagged. You can check that out from xen.git:
 
-git://xenbits.xen.org/xen.git X.Y.0-rcZ
+https://xenbits.xen.org/git-http/xen.git X.Y.0-rcZ
 
 For your convenience there is also a tarball at:
 https://downloads.xenproject.org/release/xen/X.Y.0-rcZ/xen-X.Y.0-rcZ.tar.gz
diff --git a/m4/README.source b/m4/README.source
index 7a8719d9304cea05269e0b0cfaa32e343763c1e1..af730953ac0cb05ca45e9a03f031e5bc2b7764ec 100644
--- a/m4/README.source
+++ b/m4/README.source
@@ -6,9 +6,9 @@ m4 sources we have picked up or developed.
 ax_compare_version.m4
 =====================
 This file was fetched from
-http://git.savannah.gnu.org/gitweb/?p=autoconf-archive.git;a=blob_plain;f=m4/ax_compare_version.m4
+https://git.savannah.gnu.org/gitweb/?p=autoconf-archive.git;a=blob_plain;f=m4/ax_compare_version.m4
 
-Also see http://www.gnu.org/software/autoconf-archive/ax_compare_version.html
+Also see https://www.gnu.org/software/autoconf-archive/ax_compare_version.html
 
 pkg.m4
 ======
diff --git a/m4/ax_compare_version.m4 b/m4/ax_compare_version.m4
index 26f4dec2497e3b9667c558c72c9e3b74188f48be..8a8103e94beee8778045e720ea13ad8ea040b396 100644
--- a/m4/ax_compare_version.m4
+++ b/m4/ax_compare_version.m4
@@ -1,7 +1,7 @@
-# Fetched from http://git.savannah.gnu.org/gitweb/?p=autoconf-archive.git;a=blob_plain;f=m4/ax_compare_version.m4
+# Fetched from https://git.savannah.gnu.org/gitweb/?p=autoconf-archive.git;a=blob_plain;f=m4/ax_compare_version.m4
 # Commit ID: 27948f49ca30e4222bb7cdd55182bd7341ac50c5
 # ===========================================================================
-#    http://www.gnu.org/software/autoconf-archive/ax_compare_version.html
+#    https://www.gnu.org/software/autoconf-archive/ax_compare_version.html
 # ===========================================================================
 #
 # SYNOPSIS
diff --git a/m4/ocaml.m4 b/m4/ocaml.m4
index b067ee942741d88522eb1955189408b157ab9ca6..90f44772a7628aa0f29d514b2f142d4660ea7e43 100644
--- a/m4/ocaml.m4
+++ b/m4/ocaml.m4
@@ -1,5 +1,5 @@
 dnl autoconf macros for OCaml
-dnl from http://forge.ocamlcore.org/
+dnl from https://forge.ocamlcore.org/
 dnl
 dnl Copyright © 2009      Richard W.M. Jones
 dnl Copyright © 2009      Stefano Zacchiroli
diff --git a/m4/pkg.m4 b/m4/pkg.m4
index ed7182d826339ebc7459ef61cb92c06128865389..bb59b15417268411e83f9ae6ba8fbe01faf2e38f 100644
--- a/m4/pkg.m4
+++ b/m4/pkg.m4
@@ -147,7 +147,7 @@ path to pkg-config.
 
 _PKG_TEXT
 
-To get pkg-config, see <http://pkg-config.freedesktop.org/>.])[]dnl
+To get pkg-config, see <https://pkg-config.freedesktop.org/>.])[]dnl
         ])
 else
 	$1[]_CFLAGS=$pkg_cv_[]$1[]_CFLAGS
diff --git a/misc/coverity/model.c b/misc/coverity/model.c
index 1ec3fe86735a542039a1bfb444cd94338e26ae09..aa48107e6e881b73adb06c71b8e25607dcecd774 100644
--- a/misc/coverity/model.c
+++ b/misc/coverity/model.c
@@ -21,7 +21,7 @@
  * Copyright (c) 2013-2014 Citrix Systems Ltd; All Right Reserved
  *
  * Based on:
- *     http://hg.python.org/cpython/file/tip/Misc/coverity_model.c
+ *     https://hg.python.org/cpython/file/tip/Misc/coverity_model.c
  * Copyright (c) 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010,
  * 2011, 2012, 2013 Python Software Foundation; All Rights Reserved
  *
diff --git a/stubdom/vtpmmgr/tpmrsa.c b/stubdom/vtpmmgr/tpmrsa.c
index b18a5a3af680a69c758da8cae531fd7999dbdbef..7731640f6899dfde21106b0a34575b70ca25699d 100644
--- a/stubdom/vtpmmgr/tpmrsa.c
+++ b/stubdom/vtpmmgr/tpmrsa.c
@@ -3,7 +3,7 @@
  *
  *  Copyright (C) 2006-2011, Brainspark B.V.
  *
- *  This file is part of PolarSSL (http://www.polarssl.org)
+ *  This file is part of PolarSSL (https://www.polarssl.org)
  *  Lead Maintainer: Paul Bakker <polarssl_maintainer at polarssl.org>
  *
  *  All rights reserved.
@@ -24,8 +24,6 @@
 /*
  *  RSA was designed by Ron Rivest, Adi Shamir and Len Adleman.
  *
- *  http://theory.lcs.mit.edu/~rivest/rsapaper.pdf
- *  http://www.cacr.math.uwaterloo.ca/hac/about/chap8.pdf
  */
 
 #include "tcg.h"
diff --git a/stubdom/vtpmmgr/tpmrsa.h b/stubdom/vtpmmgr/tpmrsa.h
index 65fd32a45c58ec504a9d6ed93c40e312567fbd6d..efeb5f2a21e4ac43b3cda417c0c8cea62052087c 100644
--- a/stubdom/vtpmmgr/tpmrsa.h
+++ b/stubdom/vtpmmgr/tpmrsa.h
@@ -5,7 +5,7 @@
  *
  *  Copyright (C) 2006-2010, Brainspark B.V.
  *
- *  This file is part of PolarSSL (http://www.polarssl.org)
+ *  This file is part of PolarSSL (https://www.polarssl.org)
  *  Lead Maintainer: Paul Bakker <polarssl_maintainer at polarssl.org>
  *
  *  All rights reserved.
diff --git a/tools/configure b/tools/configure
index dae377c98252b9daf491a55058d11d2bf3c3ad84..f6f13bfdc0901b0cea125c5ac13208c92e7b7a0f 100755
--- a/tools/configure
+++ b/tools/configure
@@ -3753,10 +3753,10 @@ esac
 
 
 
-# Fetched from http://git.savannah.gnu.org/gitweb/?p=autoconf-archive.git;a=blob_plain;f=m4/ax_compare_version.m4
+# Fetched from https://git.savannah.gnu.org/gitweb/?p=autoconf-archive.git;a=blob_plain;f=m4/ax_compare_version.m4
 # Commit ID: 27948f49ca30e4222bb7cdd55182bd7341ac50c5
 # ===========================================================================
-#    http://www.gnu.org/software/autoconf-archive/ax_compare_version.html
+#    https://www.gnu.org/software/autoconf-archive/ax_compare_version.html
 # ===========================================================================
 #
 # SYNOPSIS
@@ -8376,7 +8376,7 @@ Alternatively, you may set the environment variables glib_CFLAGS
 and glib_LIBS to avoid the need to call pkg-config.
 See the pkg-config man page for more details.
 
-To get pkg-config, see <http://pkg-config.freedesktop.org/>.
+To get pkg-config, see <https://pkg-config.freedesktop.org/>.
 See \`config.log' for more details" "$LINENO" 5; }
 else
 	glib_CFLAGS=$pkg_cv_glib_CFLAGS
@@ -8467,7 +8467,7 @@ Alternatively, you may set the environment variables pixman_CFLAGS
 and pixman_LIBS to avoid the need to call pkg-config.
 See the pkg-config man page for more details.
 
-To get pkg-config, see <http://pkg-config.freedesktop.org/>.
+To get pkg-config, see <https://pkg-config.freedesktop.org/>.
 See \`config.log' for more details" "$LINENO" 5; }
 else
 	pixman_CFLAGS=$pkg_cv_pixman_CFLAGS
@@ -9923,7 +9923,7 @@ Alternatively, you may set the environment variables SYSTEMD_CFLAGS
 and SYSTEMD_LIBS to avoid the need to call pkg-config.
 See the pkg-config man page for more details.
 
-To get pkg-config, see <http://pkg-config.freedesktop.org/>.
+To get pkg-config, see <https://pkg-config.freedesktop.org/>.
 See \`config.log' for more details" "$LINENO" 5; }
 else
 	SYSTEMD_CFLAGS=$pkg_cv_SYSTEMD_CFLAGS
@@ -10018,7 +10018,7 @@ Alternatively, you may set the environment variables SYSTEMD_CFLAGS
 and SYSTEMD_LIBS to avoid the need to call pkg-config.
 See the pkg-config man page for more details.
 
-To get pkg-config, see <http://pkg-config.freedesktop.org/>.
+To get pkg-config, see <https://pkg-config.freedesktop.org/>.
 See \`config.log' for more details" "$LINENO" 5; }
 else
 	SYSTEMD_CFLAGS=$pkg_cv_SYSTEMD_CFLAGS
diff --git a/tools/examples/xeninfo.pl b/tools/examples/xeninfo.pl
index 1815d1d9f219799a83fbc0329a4a1a010264893e..34c9cc65ce4407e38c03aaf8a46d1a150cbabccb 100644
--- a/tools/examples/xeninfo.pl
+++ b/tools/examples/xeninfo.pl
@@ -6,13 +6,13 @@
 #  ingard [at] mevaag  [dot] no                                                                             #
 #                                                                                                           #
 #  This work is licensed under the Creative Commons Attribution-Noncommercial-Share Alike 3.0 License.      #
-#  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/3.0/ or send a letter #
+#  To view a copy of this license, visit https://creativecommons.org/licenses/by-nc-sa/3.0/ or send a letter #
 #  to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.                #
 #                                                                                                           #
 #############################################################################################################
 
 use strict;
-# http://search.cpan.org/~rjray/RPC-XML-0.59/lib/RPC/XML/Client.pm
+# https://search.cpan.org/~rjray/RPC-XML-0.59/lib/RPC/XML/Client.pm
 require RPC::XML;
 require RPC::XML::Client;
 
diff --git a/tools/firmware/Makefile b/tools/firmware/Makefile
index 345037b93b7f7987f0344f8a3ae86b4ec42a6caa..22e1d9dfaf88a74338e6521275574d9b775fa7b9 100644
--- a/tools/firmware/Makefile
+++ b/tools/firmware/Makefile
@@ -36,7 +36,7 @@ ifeq ($(CONFIG_ROMBIOS),y)
 	@set -e; if [ $$((`( bcc -v 2>&1 | grep version || echo 0.0.0 ) | cut -d' ' -f 3 | awk -F. '{ printf "0x%02x%02x%02x", $$1, $$2, $$3}'`)) -lt $$((0x00100e)) ] ; then \
 	echo "==========================================================================="; \
 	echo "Require dev86 rpm or bin86 & bcc debs version >= 0.16.14 to build firmware!"; \
-	echo "(visit http://www.debath.co.uk/dev86/ for more information)"; \
+	echo "(visit https://www.debath.co.uk/dev86/ for more information)"; \
 	echo "==========================================================================="; \
 	false ; \
 	fi
diff --git a/tools/firmware/etherboot/README b/tools/firmware/etherboot/README
index 5e3c1daf588fb33bc82238b818ba6aef5c8062e5..51c1d6db5bc7540a7495d281405355d796e5141b 100644
--- a/tools/firmware/etherboot/README
+++ b/tools/firmware/etherboot/README
@@ -1,28 +1,7 @@
-
-This directory builds gPXE option ROMs from the gPXE source
+This directory builds iPXE option ROMs from the iPXE source
 tarball. We provide this tarball in our source so that the option ROMs
 can be reconstructed from source, allowing easier debugging and
 fulfilling the terms of the GPL.
 
 We make a few non-standard settings, most to do with timeouts and when
 to give up, and for stricter DHCP spec compliance.
-
-----------------------------------------
-
-Since gPXE upstream do not appear to distribute tarballs, we
-generated one ourselves with the following runes (to extract the tree
-as on 25th September 2008):
-
- git clone git://git.etherboot.org/scm/gpxe.git
- cd gpxe
- git archive --format=tar --prefix=gpxe/ c24bc349ead939d90b5784dbff3cd9fdb9d83ba8 | gzip -n >../gpxe-git-snapshot.tar.gz
-
-----------------------------------------
-
-Previously, an image from Rom-o-matic.net was provided here, fetched
-from the following URL:
-
-http://rom-o-matic.net/5.4.3/build.php?version=5.4.3&F=ignore&nic=rtl8139%3Artl8139+--+%5B0x10ec%2C0x8139%5D&ofmt=Binary+ROM+Image%28.zrom%29&arch=i386&ASK_BOOT=-1&BOOT_FIRST=BOOT_NIC&BOOT_SECOND=BOOT_NOTHING&BOOT_THIRD=BOOT_NOTHING&BOOT_INDEX=0&STATIC_CLIENT_IP=&STATIC_SUBNET_MASK=&STATIC_SERVER_IP=&STATIC_GATEWAY_IP=&STATIC_BOOTFILE=&EXIT_ON_FILE_LOAD_ERROR=on&DHCP_CLIENT_ID=&DHCP_CLIENT_ID_LEN=&DHCP_CLIENT_ID_TYPE=&DHCP_USER_CLASS=&DHCP_USER_CLASS_LEN=&ALLOW_ONLY_ENCAPSULATED=on&DEFAULT_BOOTFILE=&CONGESTED=on&BACKOFF_LIMIT=7&TIMEOUT=180&TRY_FLOPPY_FIRST=0&EXIT_IF_NO_OFFER=on&TAGGED_IMAGE=on&ELF_IMAGE=on&PXE_IMAGE=on&DOWNLOAD_PROTO_TFTP=on&COMCONSOLE=0x3F8&CONSPEED=9600&COMPARM=0x03&PXE_EXPORT=on&CONFIG_PCI=on&CONFIG_ISA=on&BUILD_ID=&PCBIOS=on&PXE_DHCP_STRICT=on&A=Get+ROM
-
-The mkhex script in tools/firmware/hvmloader will make the header file
-from the downloaded image.
diff --git a/tools/firmware/hvmloader/pci_regs.h b/tools/firmware/hvmloader/pci_regs.h
index 7bf2d873ab644c5d342a7e4112a94814e62ce71c..4b093308f6af346afed7cf55c764fd46560bc700 100644
--- a/tools/firmware/hvmloader/pci_regs.h
+++ b/tools/firmware/hvmloader/pci_regs.h
@@ -6,7 +6,7 @@
  * Copyright 1997--1999 Martin Mares <mj@ucw.cz>
  *
  * For more information, please consult the following manuals (look at
- * http://www.pcisig.com/ for how to get them):
+ * https://www.pcisig.com/ for how to get them):
  *
  * PCI BIOS Specification
  * PCI Local Bus Specification
diff --git a/tools/firmware/hvmloader/pir.c b/tools/firmware/hvmloader/pir.c
index cc420ddff48d0c4f748552fbddc106930796b903..369b4f9b903f961bf79ee2015384187084e40d1e 100644
--- a/tools/firmware/hvmloader/pir.c
+++ b/tools/firmware/hvmloader/pir.c
@@ -19,7 +19,7 @@
 
 /*
  * The structure of these tables is described in
- * http://www.microsoft.com/taiwan/whdc/archive/pciirq.mspx
+ * https://www.microsoft.com/taiwan/whdc/archive/pciirq.mspx
  */
 unsigned long create_pir_tables(void)
 {
diff --git a/tools/firmware/hvmloader/pir_types.h b/tools/firmware/hvmloader/pir_types.h
index 9f9259c2e144420d4cb1db190a7af447283624ad..5129b0c7fd9a087810a299ee8930f755814a263b 100644
--- a/tools/firmware/hvmloader/pir_types.h
+++ b/tools/firmware/hvmloader/pir_types.h
@@ -17,7 +17,7 @@
  * Copyright (C) Citrix Systems, 2011
  *
  * See the PCI Interrupt Routing spec for more detail:
- *   http://www.microsoft.com/taiwan/whdc/archive/pciirq.mspx
+ *   https://www.microsoft.com/taiwan/whdc/archive/pciirq.mspx
  */
 
 #ifndef PIR_TYPES_H
diff --git a/tools/firmware/hvmloader/smbios_types.h b/tools/firmware/hvmloader/smbios_types.h
index 7c648ece71698af003f1600a150b1b77fe880254..3f1c120da60b6aa95cb2b6b1f03cc31d912832a4 100644
--- a/tools/firmware/hvmloader/smbios_types.h
+++ b/tools/firmware/hvmloader/smbios_types.h
@@ -19,7 +19,7 @@
  * Authors: Andrew D. Ball <aball@us.ibm.com>
  *
  * See the SMBIOS 2.4 spec for more detail:
- *   http://www.dmtf.org/standards/smbios/
+ *   https://www.dmtf.org/standards/smbios/
  */
 
 #ifndef SMBIOS_TYPES_H
diff --git a/tools/firmware/rombios/32bit/pmm.c b/tools/firmware/rombios/32bit/pmm.c
index 09fec427483f3385b621aebac505705e7f819630..e0e39fef68a7b8d1695738e5e6f3c045c6dceaa4 100644
--- a/tools/firmware/rombios/32bit/pmm.c
+++ b/tools/firmware/rombios/32bit/pmm.c
@@ -1,7 +1,7 @@
 /*
  *  pmm.c - POST(Power On Self Test) Memory Manager
  *  according to the specification described in
- *  http://www.phoenix.com/NR/rdonlyres/873A00CF-33AC-4775-B77E-08E7B9754993/0/specspmm101.pdf
+ *  https://www.phoenix.com/NR/rdonlyres/873A00CF-33AC-4775-B77E-08E7B9754993/0/specspmm101.pdf
  *
  *  This library is free software; you can redistribute it and/or
  *  modify it under the terms of the GNU Lesser General Public
diff --git a/tools/firmware/rombios/rombios.c b/tools/firmware/rombios/rombios.c
index 5cda22785f6f62cd54956cc04dff687fd51f07b6..1818d2fa4d32b3c89299076b3968827bea749402 100644
--- a/tools/firmware/rombios/rombios.c
+++ b/tools/firmware/rombios/rombios.c
@@ -7,8 +7,8 @@
 //    MandrakeSoft S.A.
 //    43, rue d'Aboukir
 //    75002 Paris - France
-//    http://www.linux-mandrake.com/
-//    http://www.mandrakesoft.com/
+//    https://www.linux-mandrake.com/
+//    https://www.mandrakesoft.com/
 //
 //  This library is free software; you can redistribute it and/or
 //  modify it under the terms of the GNU Lesser General Public
@@ -733,7 +733,7 @@ typedef struct {
 
   // for access to EBDA area
   //     The EBDA structure should conform to
-  //     http://www.frontiernet.net/~fys/rombios.htm document
+  //     https://www.frontiernet.net/~fys/rombios.htm document
   //     I made the ata and cdemu structs begin at 0x121 in the EBDA seg
   // EBDA must be at most 768 bytes; it lives at EBDA_SEG, and the boot
   // device tables are at EBDA_SEG:IPL_TABLE_OFFSET
@@ -2058,7 +2058,7 @@ print_bios_banner()
 // We also don't support letting option ROMs register as bootable disk
 // drives (BCVs), only as bootable devices (BEVs).
 //
-// http://www.phoenix.com/en/Customer+Services/White+Papers-Specs/pc+industry+specifications.htm
+// https://www.phoenix.com/en/Customer+Services/White+Papers-Specs/pc+industry+specifications.htm
 //--------------------------------------------------------------------------
 
 static char drivetypes[][10]={"", "Floppy","Hard Disk","CD-Rom", "Network"};
diff --git a/tools/firmware/vgabios/README b/tools/firmware/vgabios/README
index a21fef1e8b809df92f59ea946155ac0d1b8cf915..ccc1379ab18089ac0ad37ae6a1a7bc2414f7437c 100644
--- a/tools/firmware/vgabios/README
+++ b/tools/firmware/vgabios/README
@@ -72,8 +72,8 @@ These fonts are public domain
 The source code is based on information taken from :
 - Kevin Lawton's vga card emulation for bochs/plex86
 - Ralf Brown's interrupts list avalaible at 
-  http://www.cs.cmu.edu/afs/cs/user/ralf/pub/WWW/files.html
-- Finn Thogersons' VGADOC4b available at http://home.worldonline.dk/~finth/
+  https://www.cs.cmu.edu/afs/cs/user/ralf/pub/WWW/files.html
+- Finn Thogersons' VGADOC4b available at https://home.worldonline.dk/~finth/
 - Michael Abrash's Graphics Programming Black Book
 - Francois Gervais' book "programmation des cartes graphiques cga-ega-vga" 
   edited by sybex
@@ -83,9 +83,9 @@ The source code is based on information taken from :
 Feedback
 --------
 Please report any bugs, comments, patches for this VGA Bios to info@vruppert.de
-You can find the latest release at : http://www.nongnu.org/vgabios/
-For any information on bochs, visit the website http://bochs.sourceforge.net/
-For any information on qemu, visit the website http://fabrice.bellard.free.fr/qemu/
+You can find the latest release at : https://www.nongnu.org/vgabios/
+For any information on bochs, visit the website https://bochs.sourceforge.net/
+For any information on qemu, visit the website https://fabrice.bellard.free.fr/qemu/
 
 
 History
diff --git a/tools/firmware/vgabios/vbe.c b/tools/firmware/vgabios/vbe.c
index c5066906d3d001f8246566ed0e207e40659ac9a6..8e6408733ae68bdc582054ee58778c03f180b220 100644
--- a/tools/firmware/vgabios/vbe.c
+++ b/tools/firmware/vgabios/vbe.c
@@ -48,7 +48,7 @@ extern char vbebios_product_revision;
 ASM_START
 // FIXME: 'merge' these (c) etc strings with the vgabios.c strings?
 _vbebios_copyright:
-.ascii       "Bochs/Plex86 VBE(C) 2003 http://savannah.nongnu.org/projects/vgabios/"
+.ascii       "Bochs/Plex86 VBE(C) 2003 https://savannah.nongnu.org/projects/vgabios/"
 .byte        0x00
 
 _vbebios_vendor_name:
diff --git a/tools/firmware/vgabios/vbe_display_api.txt b/tools/firmware/vgabios/vbe_display_api.txt
index fddb78b4bc713d153d1d08b95a639929a37d7b01..a365d2cc94aa36ef16dc730dd5886f69bc731fee 100644
--- a/tools/firmware/vgabios/vbe_display_api.txt
+++ b/tools/firmware/vgabios/vbe_display_api.txt
@@ -63,16 +63,16 @@ Todo
 References
 ----------
   [VBE3]          VBE 3 Specification at
-                  http://www.vesa.org/vbe3.pdf
+                  https://www.vesa.org/vbe3.pdf
 
   [BOCHS]         Bochs Open Source IA-32 Emulator at
-                  http://bochs.sourceforge.net
+                  https://bochs.sourceforge.net
 
   [VBEBIOS]       VBE Bios for Bochs at
-                  http://savannah.gnu.org/projects/vgabios/
+                  https://savannah.gnu.org/projects/vgabios/
 
   [Screenshots]   Screenshots of programs using the VBE Bios at
-                  http://japj.org/projects/bochs_plex86/screenshots.html
+                  https://japj.org/projects/bochs_plex86/screenshots.html
 
 Abbreviations
 -------------
diff --git a/tools/firmware/vgabios/vgabios.c b/tools/firmware/vgabios/vgabios.c
index 1c75b7de96c2b366f910ffb7ed4a7833d53a59da..3ad98ca254a4ce8e7359a8a2d1a259b098ab927b 100644
--- a/tools/firmware/vgabios/vgabios.c
+++ b/tools/firmware/vgabios/vgabios.c
@@ -36,7 +36,7 @@
 //
 //  This VGA Bios is based on information taken from :
 //   - Kevin Lawton's vga card emulation for bochs/plex86
-//   - Ralf Brown's interrupts list available at http://www.cs.cmu.edu/afs/cs/user/ralf/pub/WWW/files.html
+//   - Ralf Brown's interrupts list available at https://www.cs.cmu.edu/afs/cs/user/ralf/pub/WWW/files.html
 //   - Finn Thogersons' VGADOC4b available at http://home.worldonline.dk/~finth/
 //   - Michael Abrash's Graphics Programming Black Book
 //   - Francois Gervais' book "programmation des cartes graphiques cga-ega-vga" edited by sybex
@@ -193,11 +193,11 @@ vgabios_license:
 vgabios_website:
 .ascii	"Please visit :"
 .byte	0x0a,0x0d
-;;.ascii  " . http://www.plex86.org"
+;;.ascii  " . https://www.plex86.org"
 ;;.byte	0x0a,0x0d
-.ascii	" . http://bochs.sourceforge.net"
+.ascii	" . https://bochs.sourceforge.net"
 .byte	0x0a,0x0d
-.ascii	" . http://www.nongnu.org/vgabios"
+.ascii	" . https://www.nongnu.org/vgabios"
 .byte	0x0a,0x0d
 .byte	0x0a,0x0d
 .byte	0x00
diff --git a/tools/fuzz/README.afl b/tools/fuzz/README.afl
index a59564985ab773d4123feaffd8224c9ae6b1cc0d..d9d7138cafb9e494e14af223710e1a02d05421c4 100644
--- a/tools/fuzz/README.afl
+++ b/tools/fuzz/README.afl
@@ -2,7 +2,7 @@
 
 Some fuzzing targets have American Fuzzy Lop (AFL) support.
 
-See also http://lcamtuf.coredump.cx/afl/
+See also https://lcamtuf.coredump.cx/afl/
 
 # HOW IT WORKS
 
diff --git a/tools/hotplug/Linux/xendomains.in b/tools/hotplug/Linux/xendomains.in
index 70f4129ef4bf24da30b05e5b568c01e39ed384bd..e713e6521933f768add60cb085c29e1137e83d10 100644
--- a/tools/hotplug/Linux/xendomains.in
+++ b/tools/hotplug/Linux/xendomains.in
@@ -12,7 +12,7 @@
 #
 # Based on the example in the "Designing High Quality Integrated Linux
 # Applications HOWTO" by Avi Alkalay
-# <http://www.tldp.org/HOWTO/HighQuality-Apps-HOWTO/>
+# <https://www.tldp.org/HOWTO/HighQuality-Apps-HOWTO/>
 #
 ### BEGIN INIT INFO
 # Provides:          xendomains
diff --git a/tools/include/libxenvchan.h b/tools/include/libxenvchan.h
index 30cc73cf97e30d81732ad084eeac3838bb3841de..ad771866e44321f6c880733a3df8e9315c2b348e 100644
--- a/tools/include/libxenvchan.h
+++ b/tools/include/libxenvchan.h
@@ -25,7 +25,7 @@
  *
  * @section DESCRIPTION
  *
- *  Originally borrowed from the Qubes OS Project, http://www.qubes-os.org,
+ *  Originally borrowed from the Qubes OS Project, https://www.qubes-os.org,
  *  this code has been substantially rewritten to use the gntdev and gntalloc
  *  devices instead of raw MFNs and map_foreign_range.
  *
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index d652895075a056ce6ec29f7b0623a0686eb84f36..6016b7b67598f6ac330819ef3df3bc4d003a30c4 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -2518,7 +2518,7 @@ static inline void libxl_cpuid_set(libxl_ctx *ctx __attribute__((unused)),
  *  userid        Data contents
  *  "xl"          domain config file in xl format, Unix line endings
  *  "libvirt-xml" domain config file in libvirt XML format.  See
- *                http://libvirt.org/formatdomain.html
+ *                https://libvirt.org/formatdomain.html
  *  "domain-userdata-lock"  lock file to protect domain userdata in libxl.
  *                          It's a per-domain lock. Applications should
  *                          not touch this file.
diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c
index fe2db66a62e68b92bdcbc1949e0de2900cec6e6c..a58a8ebf06de6e0a265cf8b5c41cceae8cf6d0a2 100644
--- a/tools/libacpi/build.c
+++ b/tools/libacpi/build.c
@@ -563,7 +563,7 @@ int acpi_build_tables(struct acpi_ctxt *ctxt, struct acpi_config *config)
      * into a 116 bytes buffer thus causing an overflow. The solution is to
      * link the higher revision FADT with the XSDT only and introduce a
      * compatible revision 1 FADT that is linked with the RSDT. Refer to:
-     *     http://www.acpi.info/presentations/S01USMOBS169_OS%20new.ppt
+     *     https://www.acpi.info/presentations/S01USMOBS169_OS%20new.ppt
      */
     fadt_10 = ctxt->mem_ops.alloc(ctxt, sizeof(struct acpi_10_fadt), 16);
     if (!fadt_10) goto oom;
diff --git a/tools/libfsimage/reiserfs/fsys_reiserfs.c b/tools/libfsimage/reiserfs/fsys_reiserfs.c
index 10ca65747678716d571afe9755158c4e10c56150..299b257e999426547199753508fcf76f1d440ed7 100644
--- a/tools/libfsimage/reiserfs/fsys_reiserfs.c
+++ b/tools/libfsimage/reiserfs/fsys_reiserfs.c
@@ -658,7 +658,7 @@ reiserfs_mount (fsi_file_t *ffi, const char *options)
 /***************** TREE ACCESSING METHODS *****************************/
 
 /* I assume you are familiar with the ReiserFS tree, if not go to
- * http://www.namesys.com/content_table.html
+ * https://www.namesys.com/content_table.html
  *
  * My tree node cache is organized as following
  *   0   ROOT node
diff --git a/tools/libfsimage/xfs/xfs.h b/tools/libfsimage/xfs/xfs.h
index 40699281e44d6a9587ef40a61563d71424292a4a..e9f93531d82aa12264ef3b4c8bbc8f56d9c7d58f 100644
--- a/tools/libfsimage/xfs/xfs.h
+++ b/tools/libfsimage/xfs/xfs.h
@@ -25,11 +25,11 @@
  *  Contact information: Silicon Graphics, Inc., 1600 Amphitheatre Pkwy,
  *  Mountain View, CA  94043, or:
  * 
- *  http://www.sgi.com 
+ *  https://www.sgi.com
  * 
  *  For further information regarding this notice, see: 
  * 
- *  http://oss.sgi.com/projects/GenInfo/SGIGPLNoticeExplan/
+ *  https://oss.sgi.com/projects/GenInfo/SGIGPLNoticeExplan/
  */
 
 typedef signed char	xfs_int8_t;
diff --git a/tools/libfsimage/zfs/zfs_sha256.c b/tools/libfsimage/zfs/zfs_sha256.c
index 616fc0a78069dbb162c24048d77551848db196db..18a5c05008ef4a5f5b2cec57e343ed8ea1f9ccfe 100644
--- a/tools/libfsimage/zfs/zfs_sha256.c
+++ b/tools/libfsimage/zfs/zfs_sha256.c
@@ -26,7 +26,7 @@
 
 /*
  * SHA-256 checksum, as specified in FIPS 180-2, available at:
- * http://csrc.nist.gov/cryptval
+ * https://csrc.nist.gov/cryptval
  *
  * This is a very compact implementation of SHA-256.
  * It is designed to be simple and portable, not to be fast.
diff --git a/tools/libs/light/libxl_genid.c b/tools/libs/light/libxl_genid.c
index 7f52356c605237677d3568aa70bf42d02077bfc1..963381bd903985f7fe1d00206f4bba740e010bda 100644
--- a/tools/libs/light/libxl_genid.c
+++ b/tools/libs/light/libxl_genid.c
@@ -28,7 +28,7 @@
  * See Microsoft's "Virtual Machine Generation ID" specification for
  * further details, including when a new generation ID is required.
  *
- *   http://www.microsoft.com/en-us/download/details.aspx?id=30707
+ *   https://www.microsoft.com/en-us/download/details.aspx?id=30707
  */
 int libxl_ms_vm_genid_generate(libxl_ctx *ctx, libxl_ms_vm_genid *id)
 {
diff --git a/tools/libs/stat/xenstat_qmp.c b/tools/libs/stat/xenstat_qmp.c
index 9909b9727e48cb0690a8aa25604ae9372786c420..399176ecff46eb2667b4cb5643eeb620c830f329 100644
--- a/tools/libs/stat/xenstat_qmp.c
+++ b/tools/libs/stat/xenstat_qmp.c
@@ -357,7 +357,7 @@ static int qmp_connect(char *path)
 }
 
 /* Gather the qdisk statistics by querying QMP
-   Resources: http://wiki.qemu.org/QMP and qmp-commands.hx from the qemu code
+   Resources: https://wiki.qemu.org/QMP and qmp-commands.hx from the qemu code
    QMP Syntax for entering command mode. This command must be issued before
    issuing any other command:
      In: {"execute": "qmp_capabilities"}
diff --git a/tools/misc/mkrpm b/tools/misc/mkrpm
index 68819b2d739cea5491b53f9b944ee2bd20d92c2b..ed6cfdb3cb8fee5e20d52878f7129ff0503693b3 100644
--- a/tools/misc/mkrpm
+++ b/tools/misc/mkrpm
@@ -34,7 +34,7 @@ Version: $version
 Release: $release
 License: GPL
 Group:   System/Hypervisor
-URL: http://xenbits.xenproject.org/xen.git
+URL: https://xenbits.xenproject.org/xen.git
 
 BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root
 %define _binary_payload w1.gzdio
diff --git a/tools/ocaml/libs/xentoollog/xentoollog_stubs.c b/tools/ocaml/libs/xentoollog/xentoollog_stubs.c
index e4306a0c2f8f03407a5c195de5b3d0350e9faf44..64f46ce571ffc2af803051983b03312ace000950 100644
--- a/tools/ocaml/libs/xentoollog/xentoollog_stubs.c
+++ b/tools/ocaml/libs/xentoollog/xentoollog_stubs.c
@@ -52,7 +52,7 @@ static char * dup_String_val(value s)
 
 #include "_xtl_levels.inc"
 
-/* Option type support as per http://www.linux-nantes.org/~fmonnier/ocaml/ocaml-wrapping-c.php */
+/* Option type support as per https://www.linux-nantes.org/~fmonnier/ocaml/ocaml-wrapping-c.php */
 #ifndef Val_none
 #define Val_none Val_int(0)
 #endif
diff --git a/tools/ocaml/libs/xl/xenlight_stubs.c b/tools/ocaml/libs/xl/xenlight_stubs.c
index 45b8af61c74ad8fbda1ef4b9f7027eba1183621f..10ca7259b0edf72ad8df85c682e9b434f264ea39 100644
--- a/tools/ocaml/libs/xl/xenlight_stubs.c
+++ b/tools/ocaml/libs/xl/xenlight_stubs.c
@@ -226,7 +226,7 @@ static value Val_string_list(libxl_string_list *c_val)
 	CAMLreturn(list);
 }
 
-/* Option type support as per http://www.linux-nantes.org/~fmonnier/ocaml/ocaml-wrapping-c.php */
+/* Option type support as per https://www.linux-nantes.org/~fmonnier/ocaml/ocaml-wrapping-c.php */
 #ifndef Val_none
 #define Val_none Val_int(0)
 #endif
diff --git a/tools/tests/vhpet/main.c b/tools/tests/vhpet/main.c
index 6fe65ea808c663d6c4618448bb4b4cea218cd11c..4054eec6296910d3117334091b3dac190f9aea29 100644
--- a/tools/tests/vhpet/main.c
+++ b/tools/tests/vhpet/main.c
@@ -14,7 +14,7 @@
  */
 
 /*
- * http://www.intel.com/content/dam/www/public/us/en/documents/technical-specifications/software-developers-hpet-spec-1-0a.pdf
+ * https://www.intel.com/content/dam/www/public/us/en/documents/technical-specifications/software-developers-hpet-spec-1-0a.pdf
  *
  * xen_source is a directory that has all xen source below it.
  *
diff --git a/tools/xenstore/talloc.c b/tools/xenstore/talloc.c
index 23c3a23b199f2318dd34786d1ae00b964dd1213a..9eda1bfc00c0b6b35d34ce25268fc9c070d9da55 100644
--- a/tools/xenstore/talloc.c
+++ b/tools/xenstore/talloc.c
@@ -26,7 +26,7 @@
 */
 
 /*
-  inspired by http://swapped.cc/halloc/
+  inspired by https://swapped.cc/halloc/
 */
 
 #ifdef _SAMBA_BUILD_
diff --git a/tools/xenstore/talloc_guide.txt b/tools/xenstore/talloc_guide.txt
index c23ac77cad72ab9265ee5af5bf5edbc1e6800380..bfcb35506b790570ab170cffbd280b674d8b6068 100644
--- a/tools/xenstore/talloc_guide.txt
+++ b/tools/xenstore/talloc_guide.txt
@@ -5,7 +5,7 @@ Andrew Tridgell
 September 2004
 
 The most current version of this document is available at
-   http://samba.org/ftp/unpacked/samba4/source/lib/talloc/talloc_guide.txt
+   https://samba.org/ftp/unpacked/samba4/source/lib/talloc/talloc_guide.txt
 
 If you are used to talloc from Samba3 then please read this carefully,
 as talloc has changed a lot.
diff --git a/tools/xl/check-xl-disk-parse b/tools/xl/check-xl-disk-parse
index 18fb66940a5464d17a89d41fa5fa9c051c5c2606..5f843585ad51f036c5ce09598a90d7702f70ae61 100755
--- a/tools/xl/check-xl-disk-parse
+++ b/tools/xl/check-xl-disk-parse
@@ -133,7 +133,7 @@ disk: {
 
 EOF
 
-# http://backdrift.org/xen-block-iscsi-script-with-multipath-support
+# https://backdrift.org/xen-block-iscsi-script-with-multipath-support
 one 0 iscsi:iqn.2001-05.com.equallogic:0-8a0906-23fe93404-c82797962054a96d-examplehost,xvda,w
 one 0 vdev=xvda,access=w,script=block-iscsi,target=iqn.2001-05.com.equallogic:0-8a0906-23fe93404-c82797962054a96d-examplehost
 
@@ -148,8 +148,8 @@ disk: {
 
 EOF
 
-# http://lists.linbit.com/pipermail/drbd-user/2008-September/010221.html
-# http://www.drbd.org/users-guide-emb/s-xen-configure-domu.html
+# https://lists.linbit.com/pipermail/drbd-user/2008-September/010221.html
+# https://www.drbd.org/users-guide-emb/s-xen-configure-domu.html
 one 0 drbd:app01,hda,w
 
 expected <<END
diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index df51550baa8a129200f770c55d86f32cbfe7e359..6ef8ff8e5b4fb2a0a3548b82b532f1f69a7e43b1 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -147,7 +147,7 @@
 GLOBAL(start)
         /*
          * zImage magic header, see:
-         * http://www.simtec.co.uk/products/SWLINUX/files/booting_article.html#d0e309
+         * https://www.simtec.co.uk/products/SWLINUX/files/booting_article.html#d0e309
          */
         .rept 8
         mov   r0, r0
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 4a3f87117c8308b63ea3999b1928dba26575959b..9041f920157cbb7435a56ac876cebfb148049751 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -180,7 +180,7 @@ efi_head:
          * header.  The arm64 Linux Image format is designed to support
          * being both an 'Image' format binary and a PE/COFF binary.
          * The PE/COFF format is defined by Microsoft, and is available
-         * from: http://msdn.microsoft.com/en-us/gg463119.aspx
+         * from: https://msdn.microsoft.com/en-us/gg463119.aspx
          * Version 8.3 adds support for arm64 and UEFI usage.
          */
 
diff --git a/xen/arch/arm/arm64/lib/memcmp.S b/xen/arch/arm/arm64/lib/memcmp.S
index 87c2537ffeb7cc8c2eeeabfd47eb573cc41f064b..d9cd1d786f34a0a2b79483d7f7672f44b244f3e7 100644
--- a/xen/arch/arm/arm64/lib/memcmp.S
+++ b/xen/arch/arm/arm64/lib/memcmp.S
@@ -6,7 +6,7 @@
  * and re-licensed under GPLv2 for the Linux kernel. The original code can
  * be found @
  *
- * http://bazaar.launchpad.net/~linaro-toolchain-dev/cortex-strings/trunk/
+ * https://bazaar.launchpad.net/~linaro-toolchain-dev/cortex-strings/trunk/
  * files/head:/src/aarch64/
  *
  * This program is free software; you can redistribute it and/or modify
diff --git a/xen/arch/arm/arm64/lib/memcpy.S b/xen/arch/arm/arm64/lib/memcpy.S
index d90d20ef3ea86fbe56f76d08c18bc55ab302c206..e7a667c2be280d9a5a4b8d991cbbf645ace5374e 100644
--- a/xen/arch/arm/arm64/lib/memcpy.S
+++ b/xen/arch/arm/arm64/lib/memcpy.S
@@ -6,7 +6,7 @@
  * and re-licensed under GPLv2 for the Linux kernel. The original code can
  * be found @
  *
- * http://bazaar.launchpad.net/~linaro-toolchain-dev/cortex-strings/trunk/
+ * https://bazaar.launchpad.net/~linaro-toolchain-dev/cortex-strings/trunk/
  * files/head:/src/aarch64/
  *
  * This program is free software; you can redistribute it and/or modify
diff --git a/xen/arch/arm/arm64/lib/memmove.S b/xen/arch/arm/arm64/lib/memmove.S
index a49de845d0668f7f210a2f4fe371fa8d43c3af8b..35d9b62fa0bb2430f65def7b0c0fc8e6cb04dec3 100644
--- a/xen/arch/arm/arm64/lib/memmove.S
+++ b/xen/arch/arm/arm64/lib/memmove.S
@@ -6,7 +6,7 @@
  * and re-licensed under GPLv2 for the Linux kernel. The original code can
  * be found @
  *
- * http://bazaar.launchpad.net/~linaro-toolchain-dev/cortex-strings/trunk/
+ * https://bazaar.launchpad.net/~linaro-toolchain-dev/cortex-strings/trunk/
  * files/head:/src/aarch64/
  *
  * This program is free software; you can redistribute it and/or modify
diff --git a/xen/arch/arm/arm64/lib/memset.S b/xen/arch/arm/arm64/lib/memset.S
index 5bf751521b60485c0679051f9a33172bde40711d..5ce1db2e76e4a06bb51e8b5acc9f3ae0cb9313c4 100644
--- a/xen/arch/arm/arm64/lib/memset.S
+++ b/xen/arch/arm/arm64/lib/memset.S
@@ -6,7 +6,7 @@
  * and re-licensed under GPLv2 for the Linux kernel. The original code can
  * be found @
  *
- * http://bazaar.launchpad.net/~linaro-toolchain-dev/cortex-strings/trunk/
+ * https://bazaar.launchpad.net/~linaro-toolchain-dev/cortex-strings/trunk/
  * files/head:/src/aarch64/
  *
  * This program is free software; you can redistribute it and/or modify
diff --git a/xen/arch/arm/arm64/lib/strcmp.S b/xen/arch/arm/arm64/lib/strcmp.S
index c6f42dd2550bd12b21882cf43dd047ee204d83e8..5492a8482fa59e0463042f2deb4ef3ca515f24d5 100644
--- a/xen/arch/arm/arm64/lib/strcmp.S
+++ b/xen/arch/arm/arm64/lib/strcmp.S
@@ -6,7 +6,7 @@
  * and re-licensed under GPLv2 for the Linux kernel. The original code can
  * be found @
  *
- * http://bazaar.launchpad.net/~linaro-toolchain-dev/cortex-strings/trunk/
+ * https://bazaar.launchpad.net/~linaro-toolchain-dev/cortex-strings/trunk/
  * files/head:/src/aarch64/
  *
  * This program is free software; you can redistribute it and/or modify
diff --git a/xen/arch/arm/arm64/lib/strlen.S b/xen/arch/arm/arm64/lib/strlen.S
index fb6aaf1a6afb632d60fa6286de31ecf4038d5945..d8d513d18f87d5ff36539dfd6f85dece8ba9ec66 100644
--- a/xen/arch/arm/arm64/lib/strlen.S
+++ b/xen/arch/arm/arm64/lib/strlen.S
@@ -6,7 +6,7 @@
  * and re-licensed under GPLv2 for the Linux kernel. The original code can
  * be found @
  *
- * http://bazaar.launchpad.net/~linaro-toolchain-dev/cortex-strings/trunk/
+ * https://bazaar.launchpad.net/~linaro-toolchain-dev/cortex-strings/trunk/
  * files/head:/src/aarch64/
  *
  * This program is free software; you can redistribute it and/or modify
diff --git a/xen/arch/arm/arm64/lib/strncmp.S b/xen/arch/arm/arm64/lib/strncmp.S
index a4a0f779f56e777b69ea256bd40b4bc6fdc090e0..90d3eb67055577f3d4514221d48ab69edcda202d 100644
--- a/xen/arch/arm/arm64/lib/strncmp.S
+++ b/xen/arch/arm/arm64/lib/strncmp.S
@@ -6,7 +6,7 @@
  * and re-licensed under GPLv2 for the Linux kernel. The original code can
  * be found @
  *
- * http://bazaar.launchpad.net/~linaro-toolchain-dev/cortex-strings/trunk/
+ * https://bazaar.launchpad.net/~linaro-toolchain-dev/cortex-strings/trunk/
  * files/head:/src/aarch64/
  *
  * This program is free software; you can redistribute it and/or modify
diff --git a/xen/arch/arm/arm64/lib/strnlen.S b/xen/arch/arm/arm64/lib/strnlen.S
index 81c8e8b54ea9948a11e7fe09bc290a7e87b18665..9e2683790b1f33d3d12ec03f758c2c8a62f0baf1 100644
--- a/xen/arch/arm/arm64/lib/strnlen.S
+++ b/xen/arch/arm/arm64/lib/strnlen.S
@@ -6,7 +6,7 @@
  * and re-licensed under GPLv2 for the Linux kernel. The original code can
  * be found @
  *
- * http://bazaar.launchpad.net/~linaro-toolchain-dev/cortex-strings/trunk/
+ * https://bazaar.launchpad.net/~linaro-toolchain-dev/cortex-strings/trunk/
  * files/head:/src/aarch64/
  *
  * This program is free software; you can redistribute it and/or modify
diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
index b3dbeecc90ad2ed10065ba75aaf2dafaa9b65974..6b43c380ff07f1a9b3f6f831cbb300b820ea6b66 100644
--- a/xen/arch/arm/include/asm/smccc.h
+++ b/xen/arch/arm/include/asm/smccc.h
@@ -37,7 +37,7 @@
 /*
  * This file provides common defines for ARM SMC Calling Convention as
  * specified in
- * http://infocenter.arm.com/help/topic/com.arm.doc.den0028a/index.html
+ * https://infocenter.arm.com/help/topic/com.arm.doc.den0028a/index.html
  */
 
 #define ARM_SMCCC_STD_CALL              _AC(0,U)
diff --git a/xen/arch/arm/include/asm/tee/optee_smc.h b/xen/arch/arm/include/asm/tee/optee_smc.h
index 2f5c702326f7489dc9be868a3a1318ffd7a81c02..ef460ec089370dd2491fd287da1d7adc17953dc1 100644
--- a/xen/arch/arm/include/asm/tee/optee_smc.h
+++ b/xen/arch/arm/include/asm/tee/optee_smc.h
@@ -9,7 +9,7 @@
  * This file is exported by OP-TEE and is in kept in sync between secure
  * world and normal world kernel driver. We're following ARM SMC Calling
  * Convention as specified in
- * http://infocenter.arm.com/help/topic/com.arm.doc.den0028a/index.html
+ * https://infocenter.arm.com/help/topic/com.arm.doc.den0028a/index.html
  *
  * This file depends on optee_msg.h being included to expand the SMC id
  * macros below.
diff --git a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c b/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
index efb45c931e1f660ed82bcf59535a1ea6922c55c7..be44d7f611b1c06ce00dd5ff73c696b3d616ccd1 100644
--- a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
+++ b/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
@@ -25,7 +25,7 @@
  * Issue Date: September 2006
  *
  * URL:
- * http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/24593.pdf
+ * https://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/24593.pdf
  */
 
 /* The related documentation for K8 Revisions A - E is:
@@ -36,7 +36,7 @@
  * Issue Date: February 2006
  *
  * URL:
- * http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/26094.PDF
+ * https://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/26094.PDF
  */
 
 /* The related documentation for K8 Revisions F - G is:
@@ -47,7 +47,7 @@
  * Issue Date: December 2006
  *
  * URL:
- * http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/32559.pdf
+ * https://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/32559.pdf
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/x86/cpu/mcheck/mce_amd.c b/xen/arch/x86/cpu/mcheck/mce_amd.c
index d7ae8919df777d90f872628ca2f0afa3c78a66dc..98c630fc86295ca38e248f9db8329e2a15794bda 100644
--- a/xen/arch/x86/cpu/mcheck/mce_amd.c
+++ b/xen/arch/x86/cpu/mcheck/mce_amd.c
@@ -24,7 +24,7 @@
  * Issue Date: October 2013
  *
  * URL:
- * http://support.amd.com/TechDocs/24593.pdf 
+ * https://support.amd.com/TechDocs/24593.pdf
  */
 
 /* The related documentation for K8 Revisions A - E is:
@@ -35,7 +35,7 @@
  * Issue Date: February 2006
  *
  * URL:
- * http://support.amd.com/TechDocs/26094.PDF 
+ * https://support.amd.com/TechDocs/26094.PDF
  */
 
 /* The related documentation for K8 Revisions F - G is:
@@ -46,7 +46,7 @@
  * Issue Date: July 2007
  *
  * URL:
- * http://support.amd.com/TechDocs/32559.pdf 
+ * https://support.amd.com/TechDocs/32559.pdf
  */
 
 /* Family10 MCA documentation published at
@@ -57,7 +57,7 @@
  * Isse Date: January 11, 2013
  *
  * URL:
- * http://support.amd.com/TechDocs/31116.pdf 
+ * https://support.amd.com/TechDocs/31116.pdf
  */
 
 #include <xen/init.h>
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index d14754e222820aba46678bcbeb9efe3fb5d38903..40be586c5c69b6a43c1ddca45c6c02c40226f3d8 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -11,9 +11,9 @@
  * Software Developer's Manual
  * Order Number 253668 or free download from:
  *
- * http://developer.intel.com/design/pentium4/manuals/253668.htm
+ * https://developer.intel.com/design/pentium4/manuals/253668.htm
  *
- * For more information, go to http://www.urbanmyth.org/microcode
+ * For more information, go to https://www.urbanmyth.org/microcode
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index f7fec4b4ed1066f4cb4cc4ba1a0b16b86ab66175..cb0f74c1fefe47ec20f85451c2e090322e712372 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -11,9 +11,9 @@
  * Software Developer's Manual
  * Order Number 253668 or free download from:
  *
- * http://developer.intel.com/design/pentium4/manuals/253668.htm
+ * https://developer.intel.com/design/pentium4/manuals/253668.htm
  *
- * For more information, go to http://www.urbanmyth.org/microcode
+ * For more information, go to https://www.urbanmyth.org/microcode
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License
diff --git a/xen/arch/x86/dmi_scan.c b/xen/arch/x86/dmi_scan.c
index 81f80c053a7a5472584508b0042629c4f15ac82a..6a0d119f86e4d85863abeca8066352d1a62aaea1 100644
--- a/xen/arch/x86/dmi_scan.c
+++ b/xen/arch/x86/dmi_scan.c
@@ -617,7 +617,7 @@ static const struct dmi_blacklist __initconstrel dmi_blacklist[] = {
 			NO_MATCH, NO_MATCH }},
 
 	{ force_acpi_ht, "ABIT i440BX-W83977", {
-			MATCH(DMI_BOARD_VENDOR, "ABIT <http://www.abit.com>"),
+			MATCH(DMI_BOARD_VENDOR, "ABIT <https://www.abit.com>"),
 			MATCH(DMI_BOARD_NAME, "i440BX-W83977 (BP6)"),
 			NO_MATCH, NO_MATCH }},
 
diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 41e3c4d5e42de151a3fb49bc93e4429e37be604a..864f6a84e6173f1414cbf3eb54e3ee08fb78179b 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -4,8 +4,8 @@
  *    MandrakeSoft S.A.
  *    43, rue d'Aboukir
  *    75002 Paris - France
- *    http://www.linux-mandrake.com/
- *    http://www.mandrakesoft.com/
+ *    https://www.linux-mandrake.com/
+ *    https://www.mandrakesoft.com/
  *
  *  This library is free software; you can redistribute it and/or
  *  modify it under the terms of the GNU Lesser General Public
diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 3cd4923060c85cbd7d339bcdca488cdb143b47ac..969678f94244df4c6a6671015f8e766e27aa8fbe 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -4,8 +4,8 @@
  *    MandrakeSoft S.A.
  *    43, rue d'Aboukir
  *    75002 Paris - France
- *    http://www.linux-mandrake.com/
- *    http://www.mandrakesoft.com/
+ *    https://www.linux-mandrake.com/
+ *    https://www.mandrakesoft.com/
  *
  *  This library is free software; you can redistribute it and/or
  *  modify it under the terms of the GNU Lesser General Public
diff --git a/xen/arch/x86/include/asm/edd.h b/xen/arch/x86/include/asm/edd.h
index afaa23732a385c71d5b3a1fb0be128e8deb69a84..9f8b8aa2219fc21e581e8d7aa00ce5bcffb3e188 100644
--- a/xen/arch/x86/include/asm/edd.h
+++ b/xen/arch/x86/include/asm/edd.h
@@ -7,8 +7,8 @@
  * structures and definitions for the int 13h, ax={41,48}h
  * BIOS Enhanced Disk Drive Services
  * This is based on the T13 group document D1572 Revision 0 (August 14 2002)
- * available at http://www.t13.org/docs2002/d1572r0.pdf.  It is
- * very similar to D1484 Revision 3 http://www.t13.org/docs2002/d1484r3.pdf
+ * available at https://www.t13.org/docs2002/d1572r0.pdf.  It is
+ * very similar to D1484 Revision 3 https://www.t13.org/docs2002/d1484r3.pdf
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License v2.0 as published by
diff --git a/xen/arch/x86/include/asm/hpet.h b/xen/arch/x86/include/asm/hpet.h
index 9919f7473071d9d4cd81f1158f4189e7c0674f9e..b6840d768722d9d35820bfbcad343c08f82b1a27 100644
--- a/xen/arch/x86/include/asm/hpet.h
+++ b/xen/arch/x86/include/asm/hpet.h
@@ -3,7 +3,7 @@
 
 /*
  * Documentation on HPET can be found at:
- *      http://www.intel.com/content/dam/www/public/us/en/documents/
+ *      https://www.intel.com/content/dam/www/public/us/en/documents/
  *      technical-specifications/software-developers-hpet-spec-1-0a.pdf
  */
 
diff --git a/xen/arch/x86/include/asm/hvm/vioapic.h b/xen/arch/x86/include/asm/hvm/vioapic.h
index 2944ec20dd53bf90fa9b7776df20e4a5f54af7e9..4e0166f160575554f9619911b0cc4b4b082bada3 100644
--- a/xen/arch/x86/include/asm/hvm/vioapic.h
+++ b/xen/arch/x86/include/asm/hvm/vioapic.h
@@ -4,8 +4,8 @@
  *    MandrakeSoft S.A.
  *    43, rue d'Aboukir
  *    75002 Paris - France
- *    http://www.linux-mandrake.com/
- *    http://www.mandrakesoft.com/
+ *    https://www.linux-mandrake.com/
+ *    https://www.mandrakesoft.com/
  *
  *  This library is free software; you can redistribute it and/or
  *  modify it under the terms of the GNU Lesser General Public
diff --git a/xen/common/README.source b/xen/common/README.source
index 732b9454c88abeddf6918e24d068129fc29e8c74..62a2033b104fd365ed456acf84f596fff5872721 100644
--- a/xen/common/README.source
+++ b/xen/common/README.source
@@ -26,7 +26,7 @@ The file is dually licensed under GPLv2.0 and LGPLv2.1
 libelf
 ------
 This directory was opriginally imported from the libelf
-project at http://www.mr511.de/software/english.html
+project at https://www.mr511.de/software/english.html
 This directory is licensed under LGPLv2.1 (see COPYING file)
 
 libfdt
@@ -39,12 +39,12 @@ and a BSD 2-clause license
 lz4/decompress.c
 -----------------
 This file was originally imported from the LZ4 project
-( http://www.lz4.org). The source is available from
+( https://www.lz4.org). The source is available from
 https://github.com/Cyan4973/lz4
 The file is licensed under a BSD 2-clause license
 
 xz
 --
 This directory was imported from the XZ Utils project
-and is available under http://tukaani.org/xz/
+and is available under https://tukaani.org/xz/
 The imported code is in the public domain
diff --git a/xen/common/bunzip2.c b/xen/common/bunzip2.c
index 61b80aff1ba9bad72e7ce999ebe40198a21a83c1..fb829b41f13bfc288d8a063b9390f2688c777d11 100644
--- a/xen/common/bunzip2.c
+++ b/xen/common/bunzip2.c
@@ -35,7 +35,7 @@
 		Phone (337) 232-1234 or 1-800-738-2226
 		Fax   (337) 232-1297
 
-		http://www.hospiceacadiana.com/
+		https://www.hospiceacadiana.com/
 
 	Manuel
  */
@@ -470,7 +470,7 @@ got_huff_bits:
 	   and decoded them into the intermediate buffer.  There are
 	   dbufCount many decoded bytes in dbuf[].  Now undo the
 	   Burrows-Wheeler transform on dbuf.  See
-	   http://dogma.net/markn/articles/bwt/bwt.htm
+	   https://dogma.net/markn/articles/bwt/bwt.htm
 	 */
 	/* Turn byteCount into cumulative occurrence counts of 0 to n-1. */
 	j = 0;
diff --git a/xen/common/lz4/decompress.c b/xen/common/lz4/decompress.c
index 876906fac1a75e9f7900a2597817f82e4cb9f309..501bd4b343ffd444c4221864d1bdeec7b8a85b1d 100644
--- a/xen/common/lz4/decompress.c
+++ b/xen/common/lz4/decompress.c
@@ -7,7 +7,7 @@
  *
  * LZ4 - Fast LZ compression algorithm
  * Copyright (C) 2011-2012, Yann Collet.
- * BSD 2-Clause License (http://www.opensource.org/licenses/bsd-license.php)
+ * BSD 2-Clause License (https://www.opensource.org/licenses/bsd-license.php)
  *
  * Redistribution and use in source and binary forms, with or without
  * modification, are permitted provided that the following conditions are
@@ -33,8 +33,8 @@
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  *
  *  You can contact the author at :
- *  - LZ4 homepage : http://fastcompression.blogspot.com/p/lz4.html
- *  - LZ4 source repository : http://code.google.com/p/lz4/
+ *  - LZ4 homepage : https://fastcompression.blogspot.com/p/lz4.html
+ *  - LZ4 source repository : https://code.google.com/p/lz4/
  */
 
 #include "defs.h"
diff --git a/xen/common/lzo.c b/xen/common/lzo.c
index a87c76ddedad72314aba334495469ac3aa2aca66..480a49dad309ec6b194d03248d1d407fba4e650a 100644
--- a/xen/common/lzo.c
+++ b/xen/common/lzo.c
@@ -4,7 +4,7 @@
  *  Copyright (C) 1996-2012 Markus F.X.J. Oberhumer <markus@oberhumer.com>
  *
  *  The full LZO package can be found at:
- *  http://www.oberhumer.com/opensource/lzo/
+ *  https://www.oberhumer.com/opensource/lzo/
  *
  *  Adapted for Xen (files combined and syntactic/header changes) by:
  *  Dan Magenheimer <dan.magenheimer@oracle.com>
@@ -17,7 +17,7 @@
  *  Copyright (C) 1996-2012 Markus F.X.J. Oberhumer <markus@oberhumer.com>
  *
  *  The full LZO package can be found at:
- *  http://www.oberhumer.com/opensource/lzo/
+ *  https://www.oberhumer.com/opensource/lzo/
  *
  *  Changed for Linux kernel use by:
  *  Nitin Gupta <nitingupta910@gmail.com>
@@ -87,7 +87,7 @@
  *  Copyright (C) 1996-2012 Markus F.X.J. Oberhumer <markus@oberhumer.com>
  *
  *  The full LZO package can be found at:
- *  http://www.oberhumer.com/opensource/lzo/
+ *  https://www.oberhumer.com/opensource/lzo/
  *
  *  Changed for Linux kernel use by:
  *  Nitin Gupta <nitingupta910@gmail.com>
@@ -112,7 +112,7 @@
  *  Copyright (C) 1996-2012 Markus F.X.J. Oberhumer <markus@oberhumer.com>
  *
  *  The full LZO package can be found at:
- *  http://www.oberhumer.com/opensource/lzo/
+ *  https://www.oberhumer.com/opensource/lzo/
  *
  *  Changed for Linux kernel use by:
  *  Nitin Gupta <nitingupta910@gmail.com>
diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
index 212a99acd8c8d4c2649b3bcc56bb163f87ba7b8b..70b4d21b0f1d6da758f1df0f1c5229c6afdf200e 100644
--- a/xen/common/rcupdate.c
+++ b/xen/common/rcupdate.c
@@ -25,11 +25,11 @@
  * Based on the original work by Paul McKenney <paulmck@us.ibm.com>
  * and inputs from Rusty Russell, Andrea Arcangeli and Andi Kleen.
  * Papers:
- * http://www.rdrop.com/users/paulmck/paper/rclockpdcsproof.pdf
- * http://lse.sourceforge.net/locking/rclock_OLS.2001.05.01c.sc.pdf (OLS2001)
+ * https://www.rdrop.com/users/paulmck/paper/rclockpdcsproof.pdf
+ * https://lse.sourceforge.net/locking/rclock_OLS.2001.05.01c.sc.pdf (OLS2001)
  *
  * For detailed explanation of Read-Copy Update mechanism see -
- * http://lse.sourceforge.net/locking/rcupdate.html
+ * https://lse.sourceforge.net/locking/rcupdate.html
  */
 #include <xen/types.h>
 #include <xen/kernel.h>
diff --git a/xen/common/unlzma.c b/xen/common/unlzma.c
index 6cd99023adf6a4e92244891297f5b0ed68653309..69448d7b398634b6543b1fcea7b6101724c17b36 100644
--- a/xen/common/unlzma.c
+++ b/xen/common/unlzma.c
@@ -8,7 +8,7 @@
  * implementation for lzma.
  * Copyright (C) 2006  Aurelien Jacobs < aurel@gnuage.org >
  *
- * Based on LzmaDecode.c from the LZMA SDK 4.22 (http://www.7-zip.org/)
+ * Based on LzmaDecode.c from the LZMA SDK 4.22 (https://www.7-zip.org/)
  * Copyright (C) 1999-2005  Igor Pavlov
  *
  * Copyrights of the parts, see headers below.
@@ -47,7 +47,7 @@ static long long __init read_int(unsigned char *ptr, int size)
 /* Small range coder implementation for lzma.
  * Copyright (C) 2006  Aurelien Jacobs < aurel@gnuage.org >
  *
- * Based on LzmaDecode.c from the LZMA SDK 4.22 (http://www.7-zip.org/)
+ * Based on LzmaDecode.c from the LZMA SDK 4.22 (https://www.7-zip.org/)
  * Copyright (c) 1999-2005  Igor Pavlov
  */
 
@@ -207,7 +207,7 @@ rc_bit_tree_decode(struct rc *rc, uint16_t *p, int num_levels, int *symbol)
  * Small lzma deflate implementation.
  * Copyright (C) 2006  Aurelien Jacobs < aurel@gnuage.org >
  *
- * Based on LzmaDecode.c from the LZMA SDK 4.22 (http://www.7-zip.org/)
+ * Based on LzmaDecode.c from the LZMA SDK 4.22 (https://www.7-zip.org/)
  * Copyright (C) 1999-2005  Igor Pavlov
  */
 
diff --git a/xen/common/unlzo.c b/xen/common/unlzo.c
index 74056778ebecc070b38a82e8040657924f9cd13f..23eff1354fe0679299951abfb3fbe2bcc2adc699 100644
--- a/xen/common/unlzo.c
+++ b/xen/common/unlzo.c
@@ -26,7 +26,7 @@
  *
  * Markus F.X.J. Oberhumer
  * <markus@oberhumer.com>
- * http://www.oberhumer.com/opensource/lzop/
+ * https://www.oberhumer.com/opensource/lzop/
  */
 
 #include "decompress.h"
diff --git a/xen/common/xmalloc_tlsf.c b/xen/common/xmalloc_tlsf.c
index 75bdf18c4ea7d4ea96a5eb51699a0354b7db166c..a0e986d36aa0569b145e9f2ad62f67c595ff1249 100644
--- a/xen/common/xmalloc_tlsf.c
+++ b/xen/common/xmalloc_tlsf.c
@@ -16,9 +16,9 @@
  * Version 2.1
  *
  * This is kernel port of TLSF allocator.
- * Original code can be found at: http://rtportal.upv.es/rtmalloc/
+ * Original code can be found at: https://rtportal.upv.es/rtmalloc/
  * Adapted for Linux by Nitin Gupta (nitingupta910@gmail.com)
- * (http://code.google.com/p/compcache/source/browse/trunk/sub-projects
+ * (https://code.google.com/p/compcache/source/browse/trunk/sub-projects
  *  /allocators/tlsf-kmod r229 dated Aug 27, 2008
  * Adapted for Xen by Dan Magenheimer (dan.magenheimer@oracle.com)
  */
diff --git a/xen/common/xz/crc32.c b/xen/common/xz/crc32.c
index 092a74fbaba81e5fdf2f2b1f053f138941625d14..66cf046052fe40904c2e6efc125df9b5b9036f5f 100644
--- a/xen/common/xz/crc32.c
+++ b/xen/common/xz/crc32.c
@@ -2,7 +2,7 @@
  * CRC32 using the polynomial from IEEE-802.3
  *
  * Authors: Lasse Collin <lasse.collin@tukaani.org>
- *          Igor Pavlov <http://7-zip.org/>
+ *          Igor Pavlov <https://7-zip.org/>
  *
  * This file has been put into the public domain.
  * You can do whatever you want with this file.
diff --git a/xen/common/xz/dec_bcj.c b/xen/common/xz/dec_bcj.c
index bfa498587ab884d7148758f070c1f0d0cfa27c50..4070f3d533aef9ba1a6ac497fb8565a3e6d31a35 100644
--- a/xen/common/xz/dec_bcj.c
+++ b/xen/common/xz/dec_bcj.c
@@ -2,7 +2,7 @@
  * Branch/Call/Jump (BCJ) filter decoders
  *
  * Authors: Lasse Collin <lasse.collin@tukaani.org>
- *          Igor Pavlov <http://7-zip.org/>
+ *          Igor Pavlov <https://7-zip.org/>
  *
  * This file has been put into the public domain.
  * You can do whatever you want with this file.
diff --git a/xen/common/xz/dec_lzma2.c b/xen/common/xz/dec_lzma2.c
index f80d8309f4c3cbcd1688aecc98deed5fd3c44d49..2521dacfe14fe3a909e96e425d4bd3766d749404 100644
--- a/xen/common/xz/dec_lzma2.c
+++ b/xen/common/xz/dec_lzma2.c
@@ -2,7 +2,7 @@
  * LZMA2 decoder
  *
  * Authors: Lasse Collin <lasse.collin@tukaani.org>
- *          Igor Pavlov <http://7-zip.org/>
+ *          Igor Pavlov <https://7-zip.org/>
  *
  * This file has been put into the public domain.
  * You can do whatever you want with this file.
diff --git a/xen/common/xz/lzma2.h b/xen/common/xz/lzma2.h
index e0ef42e880a005099144df78a7c19b01d49410b2..acd70ffb7e7902cd2339899d36f84c609f946d36 100644
--- a/xen/common/xz/lzma2.h
+++ b/xen/common/xz/lzma2.h
@@ -2,7 +2,7 @@
  * LZMA2 definitions
  *
  * Authors: Lasse Collin <lasse.collin@tukaani.org>
- *          Igor Pavlov <http://7-zip.org/>
+ *          Igor Pavlov <https://7-zip.org/>
  *
  * This file has been put into the public domain.
  * You can do whatever you want with this file.
diff --git a/xen/common/xz/stream.h b/xen/common/xz/stream.h
index d36d0fec6424ef23bb7f9d0c457c859171d995cd..7f34e66381a407e3e6535f6d4badda3c981f7f3a 100644
--- a/xen/common/xz/stream.h
+++ b/xen/common/xz/stream.h
@@ -12,7 +12,7 @@
 
 /*
  * See the .xz file format specification at
- * http://tukaani.org/xz/xz-file-format.txt
+ * https://tukaani.org/xz/xz-file-format.txt
  * to understand the container format.
  */
 
diff --git a/xen/common/zstd/bitstream.h b/xen/common/zstd/bitstream.h
index 2b06d4551f03fe116b8420130155b10d8a71fe0d..2192cad3569b738b065e593c65a9858ba1702df8 100644
--- a/xen/common/zstd/bitstream.h
+++ b/xen/common/zstd/bitstream.h
@@ -4,7 +4,7 @@
  * header file (to include)
  * Copyright (C) 2013-2016, Yann Collet.
  *
- * BSD 2-Clause License (http://www.opensource.org/licenses/bsd-license.php)
+ * BSD 2-Clause License (https://www.opensource.org/licenses/bsd-license.php)
  *
  * Redistribution and use in source and binary forms, with or without
  * modification, are permitted provided that the following conditions are
diff --git a/xen/common/zstd/entropy_common.c b/xen/common/zstd/entropy_common.c
index d329cccc608c3de6279b8ad84472e402b860761c..81d37b1a521555d86b945ec79e76c26daedd68e4 100644
--- a/xen/common/zstd/entropy_common.c
+++ b/xen/common/zstd/entropy_common.c
@@ -2,7 +2,7 @@
  * Common functions of New Generation Entropy library
  * Copyright (C) 2016, Yann Collet.
  *
- * BSD 2-Clause License (http://www.opensource.org/licenses/bsd-license.php)
+ * BSD 2-Clause License (https://www.opensource.org/licenses/bsd-license.php)
  *
  * Redistribution and use in source and binary forms, with or without
  * modification, are permitted provided that the following conditions are
diff --git a/xen/common/zstd/fse.h b/xen/common/zstd/fse.h
index 5761e09f17ff209704959170d81a8cdada4b5c88..8db3773b17e3105f29667a8b366f41d4224114e2 100644
--- a/xen/common/zstd/fse.h
+++ b/xen/common/zstd/fse.h
@@ -3,7 +3,7 @@
  * Public Prototypes declaration
  * Copyright (C) 2013-2016, Yann Collet.
  *
- * BSD 2-Clause License (http://www.opensource.org/licenses/bsd-license.php)
+ * BSD 2-Clause License (https://www.opensource.org/licenses/bsd-license.php)
  *
  * Redistribution and use in source and binary forms, with or without
  * modification, are permitted provided that the following conditions are
diff --git a/xen/common/zstd/fse_decompress.c b/xen/common/zstd/fse_decompress.c
index ba5f960eb35dd6d71401045d673e581e114188b8..eb5abd6680169f039a3d04be2e3e689a4abef67f 100644
--- a/xen/common/zstd/fse_decompress.c
+++ b/xen/common/zstd/fse_decompress.c
@@ -2,7 +2,7 @@
  * FSE : Finite State Entropy decoder
  * Copyright (C) 2013-2015, Yann Collet.
  *
- * BSD 2-Clause License (http://www.opensource.org/licenses/bsd-license.php)
+ * BSD 2-Clause License (https://www.opensource.org/licenses/bsd-license.php)
  *
  * Redistribution and use in source and binary forms, with or without
  * modification, are permitted provided that the following conditions are
diff --git a/xen/common/zstd/huf.h b/xen/common/zstd/huf.h
index 0e091dbffe3df40081df16468a285fdab579cdbb..8b07da65cff813dd2170ae895d85576aac1cd01f 100644
--- a/xen/common/zstd/huf.h
+++ b/xen/common/zstd/huf.h
@@ -3,7 +3,7 @@
  * header file
  * Copyright (C) 2013-2016, Yann Collet.
  *
- * BSD 2-Clause License (http://www.opensource.org/licenses/bsd-license.php)
+ * BSD 2-Clause License (https://www.opensource.org/licenses/bsd-license.php)
  *
  * Redistribution and use in source and binary forms, with or without
  * modification, are permitted provided that the following conditions are
diff --git a/xen/common/zstd/huf_decompress.c b/xen/common/zstd/huf_decompress.c
index 1bdfc695d0537465d4e712d4f9bf5914f35a33a3..e7bfa9007daa2c6096261f2464e41b734d0b798c 100644
--- a/xen/common/zstd/huf_decompress.c
+++ b/xen/common/zstd/huf_decompress.c
@@ -2,7 +2,7 @@
  * Huffman decoder, part of New Generation Entropy library
  * Copyright (C) 2013-2016, Yann Collet.
  *
- * BSD 2-Clause License (http://www.opensource.org/licenses/bsd-license.php)
+ * BSD 2-Clause License (https://www.opensource.org/licenses/bsd-license.php)
  *
  * Redistribution and use in source and binary forms, with or without
  * modification, are permitted provided that the following conditions are
diff --git a/xen/crypto/README.source b/xen/crypto/README.source
index 894045de28536dba2bc21a58c7753266ed549146..bdd85aec76ac59827e1c0209f3015d6b9def4f75 100644
--- a/xen/crypto/README.source
+++ b/xen/crypto/README.source
@@ -5,7 +5,7 @@ This documents the upstream sources for files in this directory.
 rijndael.c
 ==========
 This file comes from 
-http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/sys/crypto/
+https://cvsweb.openbsd.org/cgi-bin/cvsweb/src/sys/crypto/
 
 vmac.c
 ======
@@ -14,4 +14,4 @@ are in the files).
 
 See
 - https://en.wikipedia.org/wiki/VMAC
-- http://www.fastcrypto.org/vmac/vmac.c
+- https://www.fastcrypto.org/vmac/vmac.c
diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index 091f09b21752ab30b509ec3e2d216a5986a40d3d..682bf12aaaf5bd7b50afda56cdc9694984442c57 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -14,7 +14,7 @@
  * Based on Linux's IPMMU-VMSA driver from Renesas BSP:
  *    drivers/iommu/ipmmu-vmsa.c
  * you can found at:
- *    url: git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git
+ *    url: https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git
  *    branch: v4.14.75-ltsi/rcar-3.9.6
  *    commit: e206eb5b81a60e64c35fbc3a999b1a0db2b98044
  * and Xen's SMMU driver:
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index b42acb8d7c091932825f60e97bdc86b1a466d026..9f8819785b49f26d7a03e30d51ac5dd0d6700719 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -285,14 +285,14 @@ static void apply_quirks(struct pci_dev *pdev)
          * Device [8086:2fc0]
          * Erratum HSE43
          * CONFIG_TDP_NOMINAL CSR Implemented at Incorrect Offset
-         * http://www.intel.com/content/www/us/en/processors/xeon/xeon-e5-v3-spec-update.html 
+         * https://www.intel.com/content/www/us/en/processors/xeon/xeon-e5-v3-spec-update.html
          */
         { PCI_VENDOR_ID_INTEL, 0x2fc0 },
         /*
          * Devices [8086:6f60,6fa0,6fc0]
          * Errata BDF2 / BDX2
          * PCI BARs in the Home Agent Will Return Non-Zero Values During Enumeration
-         * http://www.intel.com/content/www/us/en/processors/xeon/xeon-e5-v4-spec-update.html 
+         * https://www.intel.com/content/www/us/en/processors/xeon/xeon-e5-v4-spec-update.html
         */
         { PCI_VENDOR_ID_INTEL, 0x6f60 },
         { PCI_VENDOR_ID_INTEL, 0x6fa0 },
diff --git a/xen/include/acpi/actbl3.h b/xen/include/acpi/actbl3.h
index 0a6778421f60e5f4daa4476627a9ed54c6ff654a..6a0ede3c1924109699e7af391cf07d7fae62113a 100644
--- a/xen/include/acpi/actbl3.h
+++ b/xen/include/acpi/actbl3.h
@@ -95,7 +95,7 @@
  * binary wire protocols." (Or ACPI tables and buffers.) "If you ask me,
  * this decision was a design error in C. Ritchie could have picked an order
  * and stuck with it." Norman Ramsey.
- * See http://stackoverflow.com/a/1053662/41661
+ * See https://stackoverflow.com/a/1053662/41661
  */
 
 /*******************************************************************************
diff --git a/xen/include/crypto/README.source b/xen/include/crypto/README.source
index 68de1cd1bb5bd2e5b0632176ae12a11f99aaf0b2..2c6325ec724dcfea0f209a9e450a86d0f7014611 100644
--- a/xen/include/crypto/README.source
+++ b/xen/include/crypto/README.source
@@ -5,7 +5,7 @@ This documents the upstream sources for files in this directory.
 rijndael.h
 ==========
 This file comes from 
-http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/sys/crypto/
+https://cvsweb.openbsd.org/cgi-bin/cvsweb/src/sys/crypto/
 
 vmac.h
 ======
@@ -14,4 +14,4 @@ are in the files).
 
 See
 - https://en.wikipedia.org/wiki/VMAC
-- http://www.fastcrypto.org/vmac/vmac.h
+- https://www.fastcrypto.org/vmac/vmac.h
diff --git a/xen/include/crypto/vmac.h b/xen/include/crypto/vmac.h
index 457f3f5dd6da05c3e9c1e152e9338077ab17fdfe..305ad40ac00bd1c4d26588bd716b8540717ad50c 100644
--- a/xen/include/crypto/vmac.h
+++ b/xen/include/crypto/vmac.h
@@ -62,9 +62,9 @@ typedef unsigned long long uint64_t;
  * This implementation supports two free AES implementations: OpenSSL's and
  * Paulo Barreto's. To use OpenSSL's, you will need to include the OpenSSL
  * crypto library (eg, gcc -lcrypto foo.c). For Barreto's, you will need
- * to compile rijndael-alg-fst.c, last seen at http://www.iaik.tu-graz.ac.at/
+ * to compile rijndael-alg-fst.c, last seen at https://www.iaik.tu-graz.ac.at/
  * research/krypto/AES/old/~rijmen/rijndael/rijndael-fst-3.0.zip and
- * http://homes.esat.kuleuven.be/~rijmen/rijndael/rijndael-fst-3.0.zip.
+ * https://homes.esat.kuleuven.be/~rijmen/rijndael/rijndael-fst-3.0.zip.
  * To use a different implementation, use these definitions as a model.
  * ----------------------------------------------------------------------- */
 #if VMAC_USE_OPENSSL
diff --git a/xen/include/efi/eficapsule.h b/xen/include/efi/eficapsule.h
index 481af2816af55b5f0ec3a0bf17198faee3b31983..45e98aafffdf83fbd4069186aafb26477b4ff0f0 100644
--- a/xen/include/efi/eficapsule.h
+++ b/xen/include/efi/eficapsule.h
@@ -4,7 +4,7 @@ Copyright (c) 2004 - 2007, Intel Corporation
 All rights reserved. This program and the accompanying materials
 are licensed and made available under the terms and conditions of the BSD License
 which accompanies this distribution.  The full text of the license may be found at
-http://opensource.org/licenses/bsd-license.php
+https://opensource.org/licenses/bsd-license.php
 
 THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
 WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
diff --git a/xen/include/public/arch-x86/hvm/start_info.h b/xen/include/public/arch-x86/hvm/start_info.h
index e33557c0b4e98c6db3d3521710daa3838586733c..caef8972b24b638356611344b7dca088f9954b90 100644
--- a/xen/include/public/arch-x86/hvm/start_info.h
+++ b/xen/include/public/arch-x86/hvm/start_info.h
@@ -89,7 +89,7 @@
  * The values used in the type field of the memory map table entries are
  * defined below and match the Address Range Types as defined in the "System
  * Address Map Interfaces" section of the ACPI Specification. Please refer to
- * section 15 in version 6.2 of the ACPI spec: http://uefi.org/specifications
+ * section 15 in version 6.2 of the ACPI spec: https://uefi.org/specifications
  */
 #define XEN_HVM_MEMMAP_TYPE_RAM       1
 #define XEN_HVM_MEMMAP_TYPE_RESERVED  2
diff --git a/xen/include/public/errno.h b/xen/include/public/errno.h
index 5a78a7607c0ddac82ea49a363a0a9fcfe2b885ae..5022e85194f930ef3f62765385b0fff1cfae00d0 100644
--- a/xen/include/public/errno.h
+++ b/xen/include/public/errno.h
@@ -54,7 +54,7 @@ enum xen_errno {
  *
  * The set of identifiers to be added here shouldn't extend beyond what
  * POSIX mandates (see e.g.
- * http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/errno.h.html)
+ * https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/errno.h.html)
  * with the exception that we support some optional (XSR) values
  * specified there (but no new ones should be added).
  */
diff --git a/xen/include/public/grant_table.h b/xen/include/public/grant_table.h
index 1dfa17a6d02a34d55ad095ce392bbdf99e8424bb..0bfa1626f591f1566abfe5846f5d732664ec3733 100644
--- a/xen/include/public/grant_table.h
+++ b/xen/include/public/grant_table.h
@@ -43,7 +43,7 @@
 /* Some rough guidelines on accessing and updating grant-table entries
  * in a concurrency-safe manner. For more information, Linux contains a
  * reference implementation for guest OSes (drivers/xen/grant_table.c, see
- * http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=drivers/xen/grant-table.c;hb=HEAD
+ * https://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=drivers/xen/grant-table.c;hb=HEAD
  *
  * NB. WMB is a no-op on current-generation x86 processors. However, a
  *     compiler barrier will still be required.
diff --git a/xen/include/public/hvm/params.h b/xen/include/public/hvm/params.h
index a22b4ed45d2eb2dcaf61db9bef1f83b80d426a40..8d38c495f3e30291a518ca7979ffe8580defb5cd 100644
--- a/xen/include/public/hvm/params.h
+++ b/xen/include/public/hvm/params.h
@@ -86,7 +86,7 @@
 /*
  * Viridian enlightenments
  *
- * (See http://download.microsoft.com/download/A/B/4/AB43A34E-BDD0-4FA6-BDEF-79EEF16E880B/Hypervisor%20Top%20Level%20Functional%20Specification%20v4.0.docx)
+ * (See https://download.microsoft.com/download/A/B/4/AB43A34E-BDD0-4FA6-BDEF-79EEF16E880B/Hypervisor%20Top%20Level%20Functional%20Specification%20v4.0.docx)
  *
  * To expose viridian enlightenments to the guest set this parameter
  * to the desired feature mask. The base feature set must be present
diff --git a/xen/include/public/io/blkif.h b/xen/include/public/io/blkif.h
index 22f1eef0c0ca371a8cfe3eeea99f54bec1e234c9..6546f4cda9186cdde7fa4e782188970423db83b2 100644
--- a/xen/include/public/io/blkif.h
+++ b/xen/include/public/io/blkif.h
@@ -571,9 +571,9 @@
  * command on a native device.
  *
  * More information about trim/unmap operations can be found at:
- * http://t13.org/Documents/UploadedDocuments/docs2008/
+ * https://t13.org/Documents/UploadedDocuments/docs2008/
  *     e07154r6-Data_Set_Management_Proposal_for_ATA-ACS2.doc
- * http://www.seagate.com/staticfiles/support/disc/manuals/
+ * https://www.seagate.com/staticfiles/support/disc/manuals/
  *     Interface%20manuals/100293068c.pdf
  *
  * Optional.  See "feature-discard", "discard-alignment",
diff --git a/xen/include/public/io/libxenvchan.h b/xen/include/public/io/libxenvchan.h
index 2eab65cb195460446b0d4de5178dfa564c258476..3776937713d75c60629e0ef21f3ac69142e68fe5 100644
--- a/xen/include/public/io/libxenvchan.h
+++ b/xen/include/public/io/libxenvchan.h
@@ -13,7 +13,7 @@
  *
  * @section DESCRIPTION
  *
- *  Originally borrowed from the Qubes OS Project, http://www.qubes-os.org,
+ *  Originally borrowed from the Qubes OS Project, https://www.qubes-os.org,
  *  this code has been substantially rewritten to use the gntdev and gntalloc
  *  devices instead of raw MFNs and map_foreign_range.
  *
diff --git a/xen/include/public/io/tpmif.h b/xen/include/public/io/tpmif.h
index ad02dbaf1a312e9de30fbbd618fa02db9d4e1930..747f7259d804ea566536720e8b4dc7cacb38f335 100644
--- a/xen/include/public/io/tpmif.h
+++ b/xen/include/public/io/tpmif.h
@@ -71,7 +71,7 @@ typedef struct tpmif_tx_interface tpmif_tx_interface_t;
  * TPM may cancel a command if the interface is seized by another locality.
  *
  * The TPM command format is defined by the TCG, and is available at
- * http://www.trustedcomputinggroup.org/resources/tpm_main_specification
+ * https://www.trustedcomputinggroup.org/resources/tpm_main_specification
  */
 
 enum tpmif_state {
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index a5631303348b16f7b5f737c9e94af4daf1d11527..f93c1b6ee8198cc7560808cdfab9ed72a74fc273 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -172,7 +172,7 @@
  *              ...
  *
  * This has already been reported upstream:
- * http://bugs.llvm.org/show_bug.cgi?id=32595 
+ * https://bugs.llvm.org/show_bug.cgi?id=32595
  */
 #ifdef __clang__
 # define CLANG_DISABLE_WARN_GCC_COMPAT_START                    \
diff --git a/xen/include/xen/elfstructs.h b/xen/include/xen/elfstructs.h
index 06e6f87c3d800df44fbc254448b1f95537224971..42afd609c22030fb2cfd77277488e0981fa44dd4 100644
--- a/xen/include/xen/elfstructs.h
+++ b/xen/include/xen/elfstructs.h
@@ -45,7 +45,7 @@ typedef uint64_t	Elf64_Xword;
 
 /*
  * e_ident[] identification indexes
- * See http://www.caldera.com/developers/gabi/2000-07-17/ch4.eheader.html 
+ * See https://www.caldera.com/developers/gabi/2000-07-17/ch4.eheader.html
  */
 #define EI_MAG0		0		/* file ID */
 #define EI_MAG1		1		/* file ID */
@@ -374,7 +374,7 @@ typedef struct {
 
 /*
  * ARM32 relocation types. See
- * http://infocenter.arm.com/help/topic/com.arm.doc.ihi0044f/IHI0044F_aaelf.pdf
+ * https://infocenter.arm.com/help/topic/com.arm.doc.ihi0044f/IHI0044F_aaelf.pdf
  * S - address of symbol.
  * A - addend for relocation (r_addend or need to extract from insn)
  * P - address of the dest being relocated (derieved from r_offset)
diff --git a/xen/include/xen/lzo.h b/xen/include/xen/lzo.h
index e920027fadaf3f272e798ef88777c886574c8809..899d61edd141cc531af902909708524345a90611 100644
--- a/xen/include/xen/lzo.h
+++ b/xen/include/xen/lzo.h
@@ -7,7 +7,7 @@
  *  Copyright (C) 1996-2012 Markus F.X.J. Oberhumer <markus@oberhumer.com>
  *
  *  The full LZO package can be found at:
- *  http://www.oberhumer.com/opensource/lzo/
+ *  https://www.oberhumer.com/opensource/lzo/
  *
  *  Changed for Linux kernel use by:
  *  Nitin Gupta <nitingupta910@gmail.com>
diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
index a90aff1712bafc6ed87296858803d16c253e7b53..bb7b83223254adc571eaef7b9713e4b044032edf 100644
--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -6,7 +6,7 @@
  *	Copyright 1997--1999 Martin Mares <mj@ucw.cz>
  *
  *	For more information, please consult the following manuals (look at
- *	http://www.pcisig.com/ for how to get them):
+ *	https://www.pcisig.com/ for how to get them):
  *
  *	PCI BIOS Specification
  *	PCI Local Bus Specification
@@ -14,7 +14,7 @@
  *	PCI System Design Guide
  *
  * 	For hypertransport information, please consult the following manuals
- * 	from http://www.hypertransport.org
+ * 	from https://www.hypertransport.org
  *
  *	The Hypertransport I/O Link Specification
  */
diff --git a/xen/include/xen/rcupdate.h b/xen/include/xen/rcupdate.h
index 6f2587058edb4914768a88842741d534a64524df..f123b77aafaa1cb50ba6bceea88cfb4408e9cb6d 100644
--- a/xen/include/xen/rcupdate.h
+++ b/xen/include/xen/rcupdate.h
@@ -21,11 +21,11 @@
  * Based on the original work by Paul McKenney <paul.mckenney@us.ibm.com>
  * and inputs from Rusty Russell, Andrea Arcangeli and Andi Kleen.
  * Papers:
- * http://www.rdrop.com/users/paulmck/paper/rclockpdcsproof.pdf
- * http://lse.sourceforge.net/locking/rclock_OLS.2001.05.01c.sc.pdf (OLS2001)
+ * https://www.rdrop.com/users/paulmck/paper/rclockpdcsproof.pdf
+ * https://lse.sourceforge.net/locking/rclock_OLS.2001.05.01c.sc.pdf (OLS2001)
  *
  * For detailed explanation of Read-Copy Update mechanism see -
- * http://lse.sourceforge.net/locking/rcupdate.html
+ * https://lse.sourceforge.net/locking/rcupdate.html
  */
 
 #ifndef __XEN_RCUPDATE_H
diff --git a/xen/include/xen/xxhash.h b/xen/include/xen/xxhash.h
index 6f2237cbcf8ef1eb0910c264f2868aa62d1ebdd6..1005654af0a01ac03f2da3747e4146ce15d16943 100644
--- a/xen/include/xen/xxhash.h
+++ b/xen/include/xen/xxhash.h
@@ -2,7 +2,7 @@
  * xxHash - Extremely Fast Hash algorithm
  * Copyright (C) 2012-2016, Yann Collet.
  *
- * BSD 2-Clause License (http://www.opensource.org/licenses/bsd-license.php)
+ * BSD 2-Clause License (https://www.opensource.org/licenses/bsd-license.php)
  *
  * Redistribution and use in source and binary forms, with or without
  * modification, are permitted provided that the following conditions are
diff --git a/xen/lib/rbtree.c b/xen/lib/rbtree.c
index eb418baabb12724f01f74c8dc55ec694b4d2427d..8b6c2c7572cd9793bbb77192704db27e04cb3988 100644
--- a/xen/lib/rbtree.c
+++ b/xen/lib/rbtree.c
@@ -24,7 +24,7 @@
 #include <xen/rbtree.h>
 
 /*
- * red-black trees properties:  http://en.wikipedia.org/wiki/Rbtree
+ * red-black trees properties:  https://en.wikipedia.org/wiki/Rbtree
  *
  *  1) A node is either red or black
  *  2) The root is black
diff --git a/xen/lib/xxhash32.c b/xen/lib/xxhash32.c
index e8d403e5ced6588f0db7ea7064898919aa24671c..3bec28c91351cc9f26ae1121cc56a28230dc2135 100644
--- a/xen/lib/xxhash32.c
+++ b/xen/lib/xxhash32.c
@@ -2,7 +2,7 @@
  * xxHash - Extremely Fast Hash algorithm
  * Copyright (C) 2012-2016, Yann Collet.
  *
- * BSD 2-Clause License (http://www.opensource.org/licenses/bsd-license.php)
+ * BSD 2-Clause License (https://www.opensource.org/licenses/bsd-license.php)
  *
  * Redistribution and use in source and binary forms, with or without
  * modification, are permitted provided that the following conditions are
diff --git a/xen/lib/xxhash64.c b/xen/lib/xxhash64.c
index 481e76fbcf4c880ec395b1be314126a6d8c89347..6cb9ee28ec34f792c52cd5e71f3a15af145994dc 100644
--- a/xen/lib/xxhash64.c
+++ b/xen/lib/xxhash64.c
@@ -2,7 +2,7 @@
  * xxHash - Extremely Fast Hash algorithm
  * Copyright (C) 2012-2016, Yann Collet.
  *
- * BSD 2-Clause License (http://www.opensource.org/licenses/bsd-license.php)
+ * BSD 2-Clause License (https://www.opensource.org/licenses/bsd-license.php)
  *
  * Redistribution and use in source and binary forms, with or without
  * modification, are permitted provided that the following conditions are
diff --git a/xen/tools/kconfig/gconf.c b/xen/tools/kconfig/gconf.c
index e36b342f1065b750b4e0f9105a015c66bb38d94f..cc9675c6e1f262639394949da5ddcd3939bc9c85 100644
--- a/xen/tools/kconfig/gconf.c
+++ b/xen/tools/kconfig/gconf.c
@@ -690,7 +690,7 @@ void on_license1_activate(GtkMenuItem * menuitem, gpointer user_data)
 	const gchar *license_text =
 	    "gkc is released under the terms of the GNU GPL v2.\n"
 	      "For more information, please see the source code or\n"
-	      "visit http://www.fsf.org/licenses/licenses.html\n";
+	      "visit https://www.fsf.org/licenses/licenses.html\n";
 
 	dialog = gtk_message_dialog_new(GTK_WINDOW(main_wnd),
 					GTK_DIALOG_DESTROY_WITH_PARENT,
diff --git a/xen/tools/kconfig/merge_config.sh b/xen/tools/kconfig/merge_config.sh
index 63c8565206a451c4c3e800148b209b0e98d47432..b7d75e61bf74b1c8eeddd0931acfcf2799674d6f 100755
--- a/xen/tools/kconfig/merge_config.sh
+++ b/xen/tools/kconfig/merge_config.sh
@@ -7,8 +7,8 @@
 #  dependencies or config symbol removal).
 #
 #  Portions reused from kconf_check and generate_cfg:
-#  http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-tools/tree/tools/kconf_check
-#  http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-tools/tree/tools/generate_cfg
+#  https://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-tools/tree/tools/kconf_check
+#  https://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-tools/tree/tools/generate_cfg
 #
 #  Copyright (c) 2009-2010 Wind River Systems, Inc.
 #  Copyright 2011 Linaro
diff --git a/xen/tools/kconfig/qconf.cc b/xen/tools/kconfig/qconf.cc
index 82773cc35d356a82d20287e3982122d61dd92fbc..02ab0e50148bd6a583c197635f8e122146341be1 100644
--- a/xen/tools/kconfig/qconf.cc
+++ b/xen/tools/kconfig/qconf.cc
@@ -1785,7 +1785,7 @@ void ConfigMainWindow::showAbout(void)
 {
 	static const QString str = "qconf is Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>.\n"
 		"Copyright (C) 2015 Boris Barbulovski <bbarbulovski@gmail.com>.\n\n"
-		"Bug reports and feature request can also be entered at http://bugzilla.kernel.org/\n";
+		"Bug reports and feature request can also be entered at https://bugzilla.kernel.org/\n";
 
 	QMessageBox::information(this, "qconf", str);
 }
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

