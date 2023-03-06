Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D956AB6E1
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 08:22:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506671.779769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ5AI-0006uG-HX; Mon, 06 Mar 2023 07:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506671.779769; Mon, 06 Mar 2023 07:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ5AI-0006qu-EQ; Mon, 06 Mar 2023 07:21:46 +0000
Received: by outflank-mailman (input) for mailman id 506671;
 Mon, 06 Mar 2023 07:21:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kIMi=66=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pZ5AH-0006qo-6Z
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 07:21:45 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bc79d59-bbef-11ed-96b4-2f268f93b82a;
 Mon, 06 Mar 2023 08:21:43 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3BD8A2236F;
 Mon,  6 Mar 2023 07:21:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B631713A66;
 Mon,  6 Mar 2023 07:21:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IWj1KoaUBWS5KQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Mar 2023 07:21:42 +0000
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
X-Inumbo-ID: 8bc79d59-bbef-11ed-96b4-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1678087303; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=RoaKLgTDceUWrqDSmTfJEaNeDz4hfxmjVuVvMvpoHtk=;
	b=hVQH8dOAtHJPdZmGTf1s2L1xfq4OoOWb27HO+Lv2t9XofV+BxMb3Ffc4ifIAK16cHR8cUL
	QdwC/TUXsPihtXaxVBKVk3IXdWJo2//n/yw9fr+ykcRivbJ0ukXQl6M1TG479J8/3ALDBR
	ONRz96BjQUz0BApThrm83DZqeX0YIGI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Julien Grall <julien@xen.org>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v3 0/4] tools: use xen-tools/libs.h for common definitions
Date: Mon,  6 Mar 2023 08:21:36 +0100
Message-Id: <20230306072140.28402-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some macros defined multiple times in tools. Use only
a single header file for defining those macros and drop the copies.

V2:
- add patch 1 (Andrew Cooper)

V3:
- address comments

Juergen Gross (4):
  tools: rename xen-tools/libs.h file to common-macros.h
  tools: add container_of() macro to xen-tools/common-macros.h
  tools: get rid of additional min() and max() definitions
  tools: add offsetof() to xen-tools/common-macros.h

 tools/console/daemon/io.c                     |  2 +-
 tools/firmware/hvmloader/util.h               | 11 ++-------
 tools/fuzz/cpu-policy/afl-policy-fuzzer.c     |  2 +-
 .../xen-tools/{libs.h => common-macros.h}     | 23 ++++++++++++++++---
 tools/libfsimage/Rules.mk                     |  2 ++
 tools/libfsimage/xfs/fsys_xfs.c               |  4 +---
 tools/libs/call/buffer.c                      |  2 +-
 tools/libs/ctrl/xc_pm.c                       |  2 +-
 tools/libs/ctrl/xc_private.h                  |  2 +-
 tools/libs/foreignmemory/linux.c              |  2 +-
 tools/libs/gnttab/freebsd.c                   |  2 +-
 tools/libs/gnttab/linux.c                     |  2 +-
 tools/libs/guest/xg_core_arm.c                |  2 +-
 tools/libs/guest/xg_cpuid_x86.c               |  2 +-
 tools/libs/guest/xg_dom_arm.c                 |  2 +-
 tools/libs/guest/xg_dom_bzimageloader.c       |  2 +-
 tools/libs/guest/xg_dom_x86.c                 |  2 +-
 tools/libs/guest/xg_sr_common.c               |  2 +-
 tools/libs/light/libxl_internal.h             |  2 +-
 tools/libs/light/libxl_psr.c                  |  2 +-
 tools/libs/stat/xenstat_linux.c               |  2 +-
 tools/libs/vchan/init.c                       |  7 +-----
 tools/misc/xen-access.c                       |  2 +-
 tools/misc/xen-cpuid.c                        |  2 +-
 tools/misc/xen-diag.c                         |  2 +-
 tools/misc/xen-hptool.c                       |  2 +-
 tools/misc/xen-livepatch.c                    |  2 +-
 tools/misc/xen-mfndump.c                      |  2 +-
 tools/misc/xenpm.c                            |  2 +-
 tools/ocaml/libs/mmap/xenmmap_stubs.c         |  2 +-
 tools/ocaml/libs/xc/xenctrl_stubs.c           |  2 +-
 tools/python/xen/lowlevel/xc/xc.c             |  2 +-
 tools/tests/cpu-policy/test-cpu-policy.c      |  2 +-
 .../paging-mempool/test-paging-mempool.c      |  2 +-
 tools/tests/resource/test-resource.c          |  2 +-
 tools/tests/tsx/test-tsx.c                    |  2 +-
 tools/tests/vhpet/emul.h                      | 16 +------------
 tools/tests/vpci/emul.h                       | 22 +-----------------
 tools/tests/x86_emulator/x86-emulate.h        |  7 +-----
 tools/tests/xenstore/test-xenstore.c          |  2 +-
 tools/xenstore/list.h                         |  6 ++---
 tools/xenstore/utils.h                        |  2 +-
 tools/xentrace/analyze.h                      |  2 +-
 tools/xl/xl_cmdtable.c                        |  2 +-
 xen/lib/x86/private.h                         |  2 +-
 45 files changed, 67 insertions(+), 103 deletions(-)
 rename tools/include/xen-tools/{libs.h => common-macros.h} (74%)

-- 
2.35.3


